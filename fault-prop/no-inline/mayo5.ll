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
    #dbg_value(i32 996, !155, !DIExpression(), !152)
  store i32 996, ptr %smlen, align 4, !dbg !156
  %call = call dereferenceable_or_null(5554) ptr @calloc(i32 noundef 5554, i32 noundef 1) #7, !dbg !157
    #dbg_value(ptr %call, !158, !DIExpression(), !152)
  %call1 = call dereferenceable_or_null(40) ptr @calloc(i32 noundef 40, i32 noundef 1) #7, !dbg !159
    #dbg_value(ptr %call1, !160, !DIExpression(), !152)
  %call2 = call dereferenceable_or_null(859320) ptr @calloc(i32 noundef 1, i32 noundef 859320) #7, !dbg !161
    #dbg_value(ptr %call2, !162, !DIExpression(), !152)
  %call3 = call dereferenceable_or_null(855408) ptr @calloc(i32 noundef 1, i32 noundef 855408) #7, !dbg !163
    #dbg_value(ptr %call3, !164, !DIExpression(), !152)
  %0 = load i32, ptr %msglen, align 4, !dbg !179
    #dbg_value(i32 %0, !153, !DIExpression(), !152)
  %add4 = add i32 %0, 964, !dbg !180
  %call5 = call ptr @calloc(i32 noundef %add4, i32 noundef 1) #7, !dbg !181
    #dbg_value(ptr %call5, !182, !DIExpression(), !152)
    #dbg_declare(ptr %msg, !183, !DIExpression(), !187)
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(32) %msg, ptr noundef nonnull align 1 dereferenceable(32) @__const.example_mayo.msg, i32 32, i1 false), !dbg !187
    #dbg_declare(ptr %msg2, !188, !DIExpression(), !189)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(32) %msg2, i8 0, i32 32, i1 false), !dbg !189
  %call6 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str, ptr noundef nonnull @.str.1) #8, !dbg !190
  %call7 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.2) #8, !dbg !191
  %call8 = call i32 @pqmayo_MAYO_5_ref_mayo_keypair(ptr noundef %p, ptr noundef %call, ptr noundef %call1) #6, !dbg !192
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
  %call12 = call i32 @pqmayo_MAYO_5_ref_mayo_expand_sk(ptr noundef %p, ptr noundef %call1, ptr noundef %call3) #6, !dbg !202
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
  %call20 = call i32 @pqmayo_MAYO_5_ref_mayo_expand_pk(ptr noundef %p, ptr noundef %call, ptr noundef %call2) #6, !dbg !211
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
  %call28 = call i32 @pqmayo_MAYO_5_ref_mayo_sign(ptr noundef %p, ptr noundef %call5, ptr noundef nonnull %smlen, ptr noundef nonnull %msg, i32 noundef %1, ptr noundef %call1) #6, !dbg !221
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
  %call37 = call i32 @pqmayo_MAYO_5_ref_mayo_open(ptr noundef %p, ptr noundef nonnull %msg2, ptr noundef nonnull %msglen, ptr noundef %call5, i32 noundef %2, ptr noundef %call) #6, !dbg !231
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
  %call49 = call i32 @pqmayo_MAYO_5_ref_mayo_verify(ptr noundef %p, ptr noundef nonnull %msg, i32 noundef %4, ptr noundef %call5, ptr noundef %call) #6, !dbg !244
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
  call void @mayo_secure_free(ptr noundef %call1, i32 noundef 40) #8, !dbg !257
  call void @mayo_secure_free(ptr noundef %call3, i32 noundef 855408) #8, !dbg !258
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
define dso_local range(i32 0, 2) i32 @pqmayo_MAYO_5_ref_mayo_keypair(ptr noundef %p, ptr noundef %pk, ptr noundef %sk) local_unnamed_addr #0 !dbg !261 {
entry:
    #dbg_value(ptr %p, !292, !DIExpression(), !293)
    #dbg_value(ptr %pk, !294, !DIExpression(), !293)
    #dbg_value(ptr %sk, !295, !DIExpression(), !293)
    #dbg_value(i32 0, !296, !DIExpression(), !293)
  %call = call i32 @pqmayo_MAYO_5_ref_mayo_keypair_compact(ptr noundef %p, ptr noundef %pk, ptr noundef %sk) #6, !dbg !297
    #dbg_value(i32 %call, !296, !DIExpression(), !293)
    #dbg_label(!298, !299)
  ret i32 %call, !dbg !300
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqmayo_MAYO_5_ref_mayo_keypair_compact(ptr noundef %p, ptr noundef %cpk, ptr noundef %csk) local_unnamed_addr #0 !dbg !301 {
entry:
  %S = alloca [868 x i8], align 1
  %P = alloca [106713 x i64], align 8
  %P3 = alloca [1296 x i64], align 8
  %O = alloca [1704 x i8], align 1
  %P3_upper = alloca [702 x i64], align 8
    #dbg_value(ptr %p, !302, !DIExpression(), !303)
    #dbg_value(ptr %cpk, !304, !DIExpression(), !303)
    #dbg_value(ptr %csk, !305, !DIExpression(), !303)
    #dbg_value(i32 0, !306, !DIExpression(), !303)
    #dbg_value(ptr %csk, !307, !DIExpression(), !303)
    #dbg_declare(ptr %S, !308, !DIExpression(), !312)
    #dbg_declare(ptr %P, !313, !DIExpression(), !314)
    #dbg_declare(ptr %P3, !315, !DIExpression(), !319)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(10368) %P3, i8 0, i32 10368, i1 false), !dbg !319
    #dbg_declare(ptr %O, !320, !DIExpression(), !322)
    #dbg_value(i32 9, !323, !DIExpression(), !303)
    #dbg_value(i32 142, !325, !DIExpression(), !303)
    #dbg_value(i32 142, !326, !DIExpression(), !303)
    #dbg_value(i32 12, !327, !DIExpression(), !303)
    #dbg_value(i32 852, !328, !DIExpression(), !303)
    #dbg_value(i32 91377, !329, !DIExpression(), !303)
    #dbg_value(i32 702, !330, !DIExpression(), !303)
    #dbg_value(i32 16, !331, !DIExpression(), !303)
    #dbg_value(i32 40, !332, !DIExpression(), !303)
    #dbg_value(ptr %P, !333, !DIExpression(), !303)
  %add.ptr = getelementptr inbounds nuw i8, ptr %P, i32 731016, !dbg !334
    #dbg_value(ptr %add.ptr, !335, !DIExpression(), !303)
  %call = call i32 @randombytes(ptr noundef %csk, i32 noundef 40) #8, !dbg !336
  %cmp.not = icmp eq i32 %call, 0, !dbg !338
  br i1 %cmp.not, label %if.end, label %err, !dbg !338

if.end:                                           ; preds = %entry
    #dbg_value(ptr %P, !333, !DIExpression(), !303)
  %call3 = call i32 @shake256(ptr noundef nonnull %S, i32 noundef 868, ptr noundef %csk, i32 noundef 40) #8, !dbg !339
    #dbg_value(ptr %S, !340, !DIExpression(), !303)
  %add.ptr6 = getelementptr inbounds nuw i8, ptr %S, i32 16, !dbg !341
  call fastcc void @decode(ptr noundef nonnull %add.ptr6, ptr noundef nonnull %O, i32 noundef 1704) #6, !dbg !342
  call fastcc void @expand_P1_P2(ptr noundef %p, ptr noundef nonnull %P, ptr noundef nonnull %S) #6, !dbg !343
  call fastcc void @compute_P3(ptr noundef %p, ptr noundef nonnull %P, ptr noundef nonnull %add.ptr, ptr noundef nonnull %O, ptr noundef nonnull %P3) #6, !dbg !344
  %call11 = call ptr @memcpy(ptr noundef %cpk, ptr noundef nonnull %S, i32 noundef 16) #8, !dbg !345
    #dbg_declare(ptr %P3_upper, !346, !DIExpression(), !350)
  call void @pqmayo_MAYO_5_ref_m_upper(ptr noundef %p, ptr noundef nonnull %P3, ptr noundef nonnull %P3_upper, i32 noundef 12) #6, !dbg !351
  %add.ptr15 = getelementptr inbounds nuw i8, ptr %cpk, i32 16, !dbg !352
  call fastcc void @pack_m_vecs(ptr noundef nonnull %P3_upper, ptr noundef nonnull %add.ptr15, i32 noundef 78, i32 noundef 142) #6, !dbg !353
  br label %err, !dbg !353

err:                                              ; preds = %entry, %if.end
  %ret.0 = phi i32 [ 0, %if.end ], [ 1, %entry ], !dbg !303
    #dbg_value(i32 %ret.0, !306, !DIExpression(), !303)
    #dbg_label(!354, !355)
  call void @mayo_secure_clear(ptr noundef nonnull %O, i32 noundef 1704) #8, !dbg !356
  call void @mayo_secure_clear(ptr noundef nonnull %add.ptr, i32 noundef 122688) #8, !dbg !357
  call void @mayo_secure_clear(ptr noundef nonnull %P3, i32 noundef 10368) #8, !dbg !358
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
  %call = call i32 @AES_128_CTR(ptr noundef %P, i32 noundef 841847, ptr noundef %seed_pk, i32 noundef 16) #8, !dbg !404
  call fastcc void @unpack_m_vecs(ptr noundef %P, ptr noundef %P, i32 noundef 11857, i32 noundef 142) #6, !dbg !405
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
    #dbg_value(i32 9, !418, !DIExpression(), !413)
    #dbg_value(i32 142, !419, !DIExpression(), !413)
    #dbg_value(i32 12, !420, !DIExpression(), !413)
  call fastcc void @P1_times_O(ptr noundef %p, ptr noundef %P1, ptr noundef %O, ptr noundef %P2) #6, !dbg !421
  call fastcc void @mul_add_mat_trans_x_m_mat(i32 noundef 9, ptr noundef %O, ptr noundef %P2, ptr noundef %P3, i32 noundef 142, i32 noundef 12, i32 noundef 12) #6, !dbg !422
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
  call fastcc void @mul_add_m_upper_triangular_mat_x_mat(i32 noundef 9, ptr noundef %P1, ptr noundef %O, ptr noundef %acc, i32 noundef 142, i32 noundef 142, i32 noundef 12, i32 noundef 1) #6, !dbg !466
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
  br label %for.cond, !dbg !543

for.cond:                                         ; preds = %for.body.1, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc.1, %for.body.1 ], !dbg !544
    #dbg_value(i32 %i.0, !540, !DIExpression(), !542)
  %arrayidx = getelementptr inbounds nuw i64, ptr %in, i32 %i.0, !dbg !545
  %0 = load i64, ptr %arrayidx, align 8, !dbg !545
  %and = and i64 %0, 1229782938247303441, !dbg !548
  %and1 = and i32 %call, 255, !dbg !549
  %conv = zext nneg i32 %and1 to i64, !dbg !550
  %mul = mul i64 %and, %conv, !dbg !551
  %shr = lshr i64 %0, 1, !dbg !552
  %and3 = and i64 %shr, 1229782938247303441, !dbg !553
  %shr4 = lshr i32 %call, 8, !dbg !554
  %and5 = and i32 %shr4, 15, !dbg !555
  %conv6 = zext nneg i32 %and5 to i64, !dbg !556
  %mul7 = mul nuw i64 %and3, %conv6, !dbg !557
  %xor = xor i64 %mul, %mul7, !dbg !558
  %shr9 = lshr i64 %0, 2, !dbg !559
  %and10 = and i64 %shr9, 1229782938247303441, !dbg !560
  %shr11 = lshr i32 %call, 16, !dbg !561
  %and12 = and i32 %shr11, 15, !dbg !562
  %conv13 = zext nneg i32 %and12 to i64, !dbg !563
  %mul14 = mul nuw i64 %and10, %conv13, !dbg !564
  %xor15 = xor i64 %xor, %mul14, !dbg !565
  %shr17 = lshr i64 %0, 3, !dbg !566
  %and18 = and i64 %shr17, 1229782938247303441, !dbg !567
  %shr19 = lshr i32 %call, 24, !dbg !568
  %and20 = and i32 %shr19, 15, !dbg !569
  %conv21 = zext nneg i32 %and20 to i64, !dbg !570
  %mul22 = mul nuw i64 %and18, %conv21, !dbg !571
  %xor23 = xor i64 %xor15, %mul22, !dbg !572
  %arrayidx24 = getelementptr inbounds nuw i64, ptr %acc, i32 %i.0, !dbg !573
  %1 = load i64, ptr %arrayidx24, align 8, !dbg !574
  %xor25 = xor i64 %1, %xor23, !dbg !574
  store i64 %xor25, ptr %arrayidx24, align 8, !dbg !574
    #dbg_value(i32 %i.0, !540, !DIExpression(DW_OP_constu, 1, DW_OP_or, DW_OP_stack_value), !542)
  %exitcond.1.not = icmp eq i32 %i.0, 8, !dbg !575
  br i1 %exitcond.1.not, label %for.end, label %for.body.1, !dbg !576

for.body.1:                                       ; preds = %for.cond
  %inc = or disjoint i32 %i.0, 1, !dbg !577
    #dbg_value(i32 %inc, !540, !DIExpression(), !542)
  %arrayidx.1 = getelementptr inbounds nuw i64, ptr %in, i32 %inc, !dbg !545
  %2 = load i64, ptr %arrayidx.1, align 8, !dbg !545
  %and.1 = and i64 %2, 1229782938247303441, !dbg !548
  %and1.1 = and i32 %call, 255, !dbg !549
  %conv.1 = zext nneg i32 %and1.1 to i64, !dbg !550
  %mul.1 = mul i64 %and.1, %conv.1, !dbg !551
  %shr.1 = lshr i64 %2, 1, !dbg !552
  %and3.1 = and i64 %shr.1, 1229782938247303441, !dbg !553
  %shr4.1 = lshr i32 %call, 8, !dbg !554
  %and5.1 = and i32 %shr4.1, 15, !dbg !555
  %conv6.1 = zext nneg i32 %and5.1 to i64, !dbg !556
  %mul7.1 = mul nuw i64 %and3.1, %conv6.1, !dbg !557
  %xor.1 = xor i64 %mul.1, %mul7.1, !dbg !558
  %shr9.1 = lshr i64 %2, 2, !dbg !559
  %and10.1 = and i64 %shr9.1, 1229782938247303441, !dbg !560
  %shr11.1 = lshr i32 %call, 16, !dbg !561
  %and12.1 = and i32 %shr11.1, 15, !dbg !562
  %conv13.1 = zext nneg i32 %and12.1 to i64, !dbg !563
  %mul14.1 = mul nuw i64 %and10.1, %conv13.1, !dbg !564
  %xor15.1 = xor i64 %xor.1, %mul14.1, !dbg !565
  %shr17.1 = lshr i64 %2, 3, !dbg !566
  %and18.1 = and i64 %shr17.1, 1229782938247303441, !dbg !567
  %shr19.1 = lshr i32 %call, 24, !dbg !568
  %and20.1 = and i32 %shr19.1, 15, !dbg !569
  %conv21.1 = zext nneg i32 %and20.1 to i64, !dbg !570
  %mul22.1 = mul nuw i64 %and18.1, %conv21.1, !dbg !571
  %xor23.1 = xor i64 %xor15.1, %mul22.1, !dbg !572
  %arrayidx24.1 = getelementptr inbounds nuw i64, ptr %acc, i32 %inc, !dbg !573
  %3 = load i64, ptr %arrayidx24.1, align 8, !dbg !574
  %xor25.1 = xor i64 %3, %xor23.1, !dbg !574
  store i64 %xor25.1, ptr %arrayidx24.1, align 8, !dbg !574
  %inc.1 = add nuw nsw i32 %i.0, 2, !dbg !577
    #dbg_value(i32 %inc.1, !540, !DIExpression(), !542)
  br label %for.cond, !dbg !578, !llvm.loop !579

for.end:                                          ; preds = %for.cond
  ret void, !dbg !581
}

; Function Attrs: nounwind
define internal fastcc i32 @mul_table(i8 noundef zeroext %b) unnamed_addr #0 !dbg !582 {
entry:
    #dbg_value(i8 %b, !586, !DIExpression(), !587)
  %conv = zext i8 %b to i32, !dbg !588
  %mul = mul i32 %conv, 134480385, !dbg !589
    #dbg_value(i32 %mul, !590, !DIExpression(), !587)
    #dbg_value(i32 -252645136, !591, !DIExpression(), !587)
  %and = and i32 %mul, -252645136, !dbg !592
    #dbg_value(i32 %and, !593, !DIExpression(), !587)
  %shr = lshr exact i32 %and, 4, !dbg !594
  %shr1 = lshr exact i32 %and, 3, !dbg !595
  %0 = xor i32 %shr, %shr1, !dbg !596
  %xor2 = xor i32 %0, %mul, !dbg !596
  ret i32 %xor2, !dbg !597
}

; Function Attrs: nounwind
define internal fastcc void @mul_add_m_upper_triangular_mat_x_mat(i32 noundef %m_vec_limbs, ptr noundef %bs_mat, ptr noundef %mat, ptr noundef %acc, i32 noundef %bs_mat_rows, i32 noundef %bs_mat_cols, i32 noundef %mat_cols, i32 noundef %triangular) unnamed_addr #0 !dbg !598 {
entry:
    #dbg_value(i32 %m_vec_limbs, !601, !DIExpression(), !602)
    #dbg_value(ptr %bs_mat, !603, !DIExpression(), !602)
    #dbg_value(ptr %mat, !604, !DIExpression(), !602)
    #dbg_value(ptr %acc, !605, !DIExpression(), !602)
    #dbg_value(i32 %bs_mat_rows, !606, !DIExpression(), !602)
    #dbg_value(i32 %bs_mat_cols, !607, !DIExpression(), !602)
    #dbg_value(i32 %mat_cols, !608, !DIExpression(), !602)
    #dbg_value(i32 %triangular, !609, !DIExpression(), !602)
    #dbg_value(i32 0, !610, !DIExpression(), !602)
    #dbg_value(i32 0, !611, !DIExpression(), !613)
  %smax = call i32 @llvm.smax.i32(i32 %mat_cols, i32 0), !dbg !614
  %smax1 = call i32 @llvm.smax.i32(i32 %bs_mat_rows, i32 0), !dbg !614
  br label %for.cond, !dbg !614

for.cond:                                         ; preds = %for.inc17, %entry
  %bs_mat_entries_used.0 = phi i32 [ 0, %entry ], [ %bs_mat_entries_used.1, %for.inc17 ], !dbg !615
  %r.0 = phi i32 [ 0, %entry ], [ %inc18, %for.inc17 ], !dbg !616
    #dbg_value(i32 %r.0, !611, !DIExpression(), !613)
    #dbg_value(i32 %bs_mat_entries_used.0, !610, !DIExpression(), !602)
  %exitcond2.not = icmp eq i32 %r.0, %smax1, !dbg !617
  br i1 %exitcond2.not, label %for.end19, label %for.body, !dbg !619

for.body:                                         ; preds = %for.cond
  %mul = mul nsw i32 %triangular, %r.0, !dbg !620
    #dbg_value(i32 %mul, !623, !DIExpression(), !624)
  br label %for.cond1, !dbg !625

for.cond1:                                        ; preds = %for.inc15, %for.body
  %bs_mat_entries_used.1 = phi i32 [ %bs_mat_entries_used.0, %for.body ], [ %add14, %for.inc15 ], !dbg !602
  %c.0 = phi i32 [ %mul, %for.body ], [ %inc, %for.inc15 ], !dbg !626
    #dbg_value(i32 %c.0, !623, !DIExpression(), !624)
    #dbg_value(i32 %bs_mat_entries_used.1, !610, !DIExpression(), !602)
  %cmp2 = icmp slt i32 %c.0, %bs_mat_cols, !dbg !627
  br i1 %cmp2, label %for.cond4, label %for.inc17, !dbg !629

for.cond4:                                        ; preds = %for.cond1, %for.body6
  %k.0 = phi i32 [ %add13, %for.body6 ], [ 0, %for.cond1 ], !dbg !630
    #dbg_value(i32 %k.0, !633, !DIExpression(), !634)
  %exitcond.not = icmp eq i32 %k.0, %smax, !dbg !635
  br i1 %exitcond.not, label %for.inc15, label %for.body6, !dbg !637

for.body6:                                        ; preds = %for.cond4
  %mul7 = mul nsw i32 %m_vec_limbs, %bs_mat_entries_used.1, !dbg !638
  %add.ptr = getelementptr inbounds i64, ptr %bs_mat, i32 %mul7, !dbg !640
  %mul8 = mul nsw i32 %c.0, %mat_cols, !dbg !641
  %0 = getelementptr i8, ptr %mat, i32 %mul8, !dbg !642
  %arrayidx = getelementptr i8, ptr %0, i32 %k.0, !dbg !642
  %1 = load i8, ptr %arrayidx, align 1, !dbg !642
  %mul9 = mul nsw i32 %r.0, %mat_cols, !dbg !643
  %add10 = add nsw i32 %mul9, %k.0, !dbg !644
  %mul11 = mul nsw i32 %m_vec_limbs, %add10, !dbg !645
  %add.ptr12 = getelementptr inbounds i64, ptr %acc, i32 %mul11, !dbg !646
  call fastcc void @m_vec_mul_add(i32 noundef %m_vec_limbs, ptr noundef %add.ptr, i8 noundef zeroext %1, ptr noundef %add.ptr12) #6, !dbg !647
  %add13 = add nuw i32 %k.0, 1, !dbg !648
    #dbg_value(i32 %add13, !633, !DIExpression(), !634)
  br label %for.cond4, !dbg !649, !llvm.loop !650

for.inc15:                                        ; preds = %for.cond4
    #dbg_value(i32 %bs_mat_entries_used.1, !610, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !602)
  %add14 = add nsw i32 %bs_mat_entries_used.1, 1, !dbg !652
    #dbg_value(i32 %add14, !610, !DIExpression(), !602)
  %inc = add nsw i32 %c.0, 1, !dbg !653
    #dbg_value(i32 %inc, !623, !DIExpression(), !624)
  br label %for.cond1, !dbg !654, !llvm.loop !655

for.inc17:                                        ; preds = %for.cond1
  %inc18 = add nuw i32 %r.0, 1, !dbg !657
    #dbg_value(i32 %inc18, !611, !DIExpression(), !613)
  br label %for.cond, !dbg !658, !llvm.loop !659

for.end19:                                        ; preds = %for.cond
  ret void, !dbg !661
}

declare dso_local i32 @AES_128_CTR(ptr noundef, i32 noundef, ptr noundef, i32 noundef) local_unnamed_addr #4

; Function Attrs: nounwind
define internal fastcc void @unpack_m_vecs(ptr noundef %in, ptr noundef %out, i32 noundef %vecs, i32 noundef %m) unnamed_addr #0 !dbg !662 {
entry:
  %tmp = alloca [9 x i64], align 8
    #dbg_value(ptr %in, !665, !DIExpression(), !666)
    #dbg_value(ptr %out, !667, !DIExpression(), !666)
    #dbg_value(i32 %vecs, !668, !DIExpression(), !666)
    #dbg_value(i32 %m, !669, !DIExpression(), !666)
  %add = add nsw i32 %m, 15, !dbg !670
  %div = sdiv i32 %add, 16, !dbg !671
    #dbg_value(i32 %div, !672, !DIExpression(), !666)
    #dbg_value(ptr %out, !673, !DIExpression(), !666)
    #dbg_declare(ptr %tmp, !674, !DIExpression(), !678)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(72) %tmp, i8 0, i32 72, i1 false), !dbg !678
    #dbg_value(i32 %vecs, !679, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !681)
  br label %for.cond, !dbg !682

for.cond:                                         ; preds = %for.body, %entry
  %i.0.in = phi i32 [ %vecs, %entry ], [ %i.0, %for.body ]
    #dbg_value(i32 %i.0.in, !679, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !681)
  %cmp = icmp sgt i32 %i.0.in, 0, !dbg !683
  br i1 %cmp, label %for.body, label %for.end, !dbg !685

for.body:                                         ; preds = %for.cond
  %i.0 = add nsw i32 %i.0.in, -1, !dbg !686
    #dbg_value(i32 %i.0, !679, !DIExpression(), !681)
  %mul = mul nsw i32 %i.0, %m, !dbg !687
  %div1 = sdiv i32 %mul, 2, !dbg !689
  %add.ptr = getelementptr inbounds i8, ptr %in, i32 %div1, !dbg !690
  %div2 = sdiv i32 %m, 2, !dbg !691
  %call = call ptr @memcpy(ptr noundef nonnull %tmp, ptr noundef %add.ptr, i32 noundef %div2) #8, !dbg !692
  %mul3 = mul nsw i32 %i.0, %div, !dbg !693
  %mul4 = shl i32 %mul3, 3, !dbg !694
  %add.ptr5 = getelementptr inbounds nuw i8, ptr %out, i32 %mul4, !dbg !695
  %mul7 = shl nsw i32 %div, 3, !dbg !696
  %call8 = call ptr @memcpy(ptr noundef %add.ptr5, ptr noundef nonnull %tmp, i32 noundef %mul7) #8, !dbg !697
    #dbg_value(i32 %i.0, !679, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !681)
  br label %for.cond, !dbg !698, !llvm.loop !699

for.end:                                          ; preds = %for.cond
  ret void, !dbg !701
}

; Function Attrs: nounwind
define dso_local i32 @pqmayo_MAYO_5_ref_mayo_expand_sk(ptr noundef %p, ptr noundef %csk, ptr noundef %sk) local_unnamed_addr #0 !dbg !702 {
entry:
  %S = alloca [868 x i8], align 1
    #dbg_value(ptr %p, !711, !DIExpression(), !712)
    #dbg_value(ptr %csk, !713, !DIExpression(), !712)
    #dbg_value(ptr %sk, !714, !DIExpression(), !712)
    #dbg_value(i32 0, !715, !DIExpression(), !712)
    #dbg_declare(ptr %S, !716, !DIExpression(), !717)
    #dbg_value(ptr %sk, !718, !DIExpression(), !712)
  %O2 = getelementptr inbounds nuw i8, ptr %sk, i32 853704, !dbg !719
    #dbg_value(ptr %O2, !720, !DIExpression(), !712)
    #dbg_value(i32 12, !721, !DIExpression(), !712)
    #dbg_value(i32 142, !722, !DIExpression(), !712)
    #dbg_value(i32 852, !723, !DIExpression(), !712)
    #dbg_value(i32 16, !724, !DIExpression(), !712)
    #dbg_value(i32 40, !725, !DIExpression(), !712)
    #dbg_value(ptr %csk, !726, !DIExpression(), !712)
    #dbg_value(ptr %S, !727, !DIExpression(), !712)
  %call = call i32 @shake256(ptr noundef nonnull %S, i32 noundef 868, ptr noundef %csk, i32 noundef 40) #8, !dbg !728
  %add.ptr = getelementptr inbounds nuw i8, ptr %S, i32 16, !dbg !729
  call fastcc void @decode(ptr noundef nonnull %add.ptr, ptr noundef nonnull %O2, i32 noundef 1704) #6, !dbg !730
  call fastcc void @expand_P1_P2(ptr noundef %p, ptr noundef %sk, ptr noundef nonnull %S) #6, !dbg !731
  %add.ptr7 = getelementptr inbounds nuw i8, ptr %sk, i32 731016, !dbg !732
    #dbg_value(ptr %add.ptr7, !733, !DIExpression(), !712)
    #dbg_value(ptr %sk, !734, !DIExpression(), !712)
    #dbg_value(ptr %add.ptr7, !735, !DIExpression(), !712)
  call fastcc void @P1P1t_times_O(ptr noundef %p, ptr noundef %sk, ptr noundef nonnull %O2, ptr noundef nonnull %add.ptr7) #6, !dbg !736
  call void @mayo_secure_clear(ptr noundef nonnull %S, i32 noundef 868) #8, !dbg !737
  ret i32 0, !dbg !738
}

; Function Attrs: nounwind
define internal fastcc void @P1P1t_times_O(ptr noundef %p, ptr noundef %P1, ptr noundef %O, ptr noundef %acc) unnamed_addr #0 !dbg !739 {
entry:
    #dbg_value(ptr %p, !740, !DIExpression(), !741)
    #dbg_value(ptr %P1, !742, !DIExpression(), !741)
    #dbg_value(ptr %O, !743, !DIExpression(), !741)
    #dbg_value(ptr %acc, !744, !DIExpression(), !741)
    #dbg_value(i32 12, !745, !DIExpression(), !741)
    #dbg_value(i32 142, !746, !DIExpression(), !741)
    #dbg_value(i32 9, !747, !DIExpression(), !741)
    #dbg_value(i32 0, !748, !DIExpression(), !741)
    #dbg_value(i32 0, !749, !DIExpression(), !751)
  br label %for.cond, !dbg !752

for.cond:                                         ; preds = %for.inc27, %entry
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.inc27 ], [ 142, %entry ], !dbg !753
  %bs_mat_entries_used.0 = phi i32 [ %bs_mat_entries_used.1, %for.inc27 ], [ 0, %entry ], !dbg !753
  %r.0 = phi i32 [ %inc28, %for.inc27 ], [ 0, %entry ], !dbg !754
    #dbg_value(i32 %r.0, !749, !DIExpression(), !751)
    #dbg_value(i32 %bs_mat_entries_used.0, !748, !DIExpression(), !741)
  %exitcond2.not = icmp eq i32 %r.0, 142, !dbg !755
  br i1 %exitcond2.not, label %for.end29, label %for.cond1.preheader, !dbg !757

for.cond1.preheader:                              ; preds = %for.cond
  %0 = add i32 %bs_mat_entries_used.0, %indvars.iv, !dbg !758
  br label %for.cond1, !dbg !758

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc25
  %bs_mat_entries_used.1 = phi i32 [ %bs_mat_entries_used.2, %for.inc25 ], [ %bs_mat_entries_used.0, %for.cond1.preheader ], !dbg !741
  %c.0 = phi i32 [ %inc, %for.inc25 ], [ %r.0, %for.cond1.preheader ], !dbg !761
    #dbg_value(i32 %c.0, !762, !DIExpression(), !763)
    #dbg_value(i32 %bs_mat_entries_used.1, !748, !DIExpression(), !741)
  %exitcond1.not = icmp eq i32 %bs_mat_entries_used.1, %0, !dbg !764
  br i1 %exitcond1.not, label %for.inc27, label %for.body3, !dbg !758

for.body3:                                        ; preds = %for.cond1
  %cmp4 = icmp eq i32 %c.0, %r.0, !dbg !766
  br i1 %cmp4, label %for.inc25, label %for.cond5, !dbg !766

for.cond5:                                        ; preds = %for.body3, %for.body7
  %k.0 = phi i32 [ %add23.3, %for.body7 ], [ 0, %for.body3 ], !dbg !769
    #dbg_value(i32 %k.0, !771, !DIExpression(), !772)
  %exitcond.not = icmp eq i32 %k.0, 12, !dbg !773
  br i1 %exitcond.not, label %for.inc25, label %for.body7, !dbg !775

for.body7:                                        ; preds = %for.cond5
  %add.ptr.idx = mul nsw i32 %bs_mat_entries_used.1, 72, !dbg !776
  %add.ptr = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx, !dbg !776
  %mul8 = mul nuw nsw i32 %c.0, 12, !dbg !778
  %1 = getelementptr inbounds nuw i8, ptr %O, i32 %mul8, !dbg !779
  %arrayidx = getelementptr inbounds nuw i8, ptr %1, i32 %k.0, !dbg !779
  %2 = load i8, ptr %arrayidx, align 1, !dbg !779
  %mul10 = mul nuw nsw i32 %r.0, 12, !dbg !780
  %add11 = add nuw nsw i32 %mul10, %k.0, !dbg !781
  %add.ptr13.idx = mul nuw nsw i32 %add11, 72, !dbg !782
  %add.ptr13 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr13.idx, !dbg !782
  call fastcc void @m_vec_mul_add(i32 noundef 9, ptr noundef %add.ptr, i8 noundef zeroext %2, ptr noundef %add.ptr13) #6, !dbg !783
  %add.ptr15.idx = mul nsw i32 %bs_mat_entries_used.1, 72, !dbg !784
  %add.ptr15 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr15.idx, !dbg !784
  %mul16 = mul nuw nsw i32 %r.0, 12, !dbg !785
  %3 = getelementptr inbounds nuw i8, ptr %O, i32 %mul16, !dbg !786
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %3, i32 %k.0, !dbg !786
  %4 = load i8, ptr %arrayidx18, align 1, !dbg !786
  %mul19 = mul nuw nsw i32 %c.0, 12, !dbg !787
  %add20 = add nuw nsw i32 %mul19, %k.0, !dbg !788
  %add.ptr22.idx = mul nuw nsw i32 %add20, 72, !dbg !789
  %add.ptr22 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr22.idx, !dbg !789
  call fastcc void @m_vec_mul_add(i32 noundef 9, ptr noundef %add.ptr15, i8 noundef zeroext %4, ptr noundef %add.ptr22) #6, !dbg !790
    #dbg_value(i32 %k.0, !771, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !772)
  %add23 = or disjoint i32 %k.0, 1, !dbg !791
    #dbg_value(i32 %add23, !771, !DIExpression(), !772)
  %add.ptr.idx.1 = mul nsw i32 %bs_mat_entries_used.1, 72, !dbg !776
  %add.ptr.1 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.1, !dbg !776
  %mul8.1 = mul nuw nsw i32 %c.0, 12, !dbg !778
  %5 = getelementptr inbounds nuw i8, ptr %O, i32 %mul8.1, !dbg !779
  %arrayidx.1 = getelementptr inbounds nuw i8, ptr %5, i32 %add23, !dbg !779
  %6 = load i8, ptr %arrayidx.1, align 1, !dbg !779
  %mul10.1 = mul nuw nsw i32 %r.0, 12, !dbg !780
  %add11.1 = add nuw nsw i32 %mul10.1, %add23, !dbg !781
  %add.ptr13.idx.1 = mul nuw nsw i32 %add11.1, 72, !dbg !782
  %add.ptr13.1 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr13.idx.1, !dbg !782
  call fastcc void @m_vec_mul_add(i32 noundef 9, ptr noundef %add.ptr.1, i8 noundef zeroext %6, ptr noundef nonnull %add.ptr13.1) #6, !dbg !783
  %add.ptr15.idx.1 = mul nsw i32 %bs_mat_entries_used.1, 72, !dbg !784
  %add.ptr15.1 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr15.idx.1, !dbg !784
  %mul16.1 = mul nuw nsw i32 %r.0, 12, !dbg !785
  %7 = getelementptr inbounds nuw i8, ptr %O, i32 %mul16.1, !dbg !786
  %arrayidx18.1 = getelementptr inbounds nuw i8, ptr %7, i32 %add23, !dbg !786
  %8 = load i8, ptr %arrayidx18.1, align 1, !dbg !786
  %mul19.1 = mul nuw nsw i32 %c.0, 12, !dbg !787
  %add20.1 = add nuw nsw i32 %mul19.1, %add23, !dbg !788
  %add.ptr22.idx.1 = mul nuw nsw i32 %add20.1, 72, !dbg !789
  %add.ptr22.1 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr22.idx.1, !dbg !789
  call fastcc void @m_vec_mul_add(i32 noundef 9, ptr noundef %add.ptr15.1, i8 noundef zeroext %8, ptr noundef nonnull %add.ptr22.1) #6, !dbg !790
    #dbg_value(i32 %k.0, !771, !DIExpression(DW_OP_plus_uconst, 2, DW_OP_stack_value), !772)
  %add23.1 = or disjoint i32 %k.0, 2, !dbg !791
    #dbg_value(i32 %add23.1, !771, !DIExpression(), !772)
  %add.ptr.idx.2 = mul nsw i32 %bs_mat_entries_used.1, 72, !dbg !776
  %add.ptr.2 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.2, !dbg !776
  %mul8.2 = mul nuw nsw i32 %c.0, 12, !dbg !778
  %9 = getelementptr inbounds nuw i8, ptr %O, i32 %mul8.2, !dbg !779
  %arrayidx.2 = getelementptr inbounds nuw i8, ptr %9, i32 %add23.1, !dbg !779
  %10 = load i8, ptr %arrayidx.2, align 1, !dbg !779
  %mul10.2 = mul nuw nsw i32 %r.0, 12, !dbg !780
  %add11.2 = add nuw nsw i32 %mul10.2, %add23.1, !dbg !781
  %add.ptr13.idx.2 = mul nuw nsw i32 %add11.2, 72, !dbg !782
  %add.ptr13.2 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr13.idx.2, !dbg !782
  call fastcc void @m_vec_mul_add(i32 noundef 9, ptr noundef %add.ptr.2, i8 noundef zeroext %10, ptr noundef nonnull %add.ptr13.2) #6, !dbg !783
  %add.ptr15.idx.2 = mul nsw i32 %bs_mat_entries_used.1, 72, !dbg !784
  %add.ptr15.2 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr15.idx.2, !dbg !784
  %mul16.2 = mul nuw nsw i32 %r.0, 12, !dbg !785
  %11 = getelementptr inbounds nuw i8, ptr %O, i32 %mul16.2, !dbg !786
  %arrayidx18.2 = getelementptr inbounds nuw i8, ptr %11, i32 %add23.1, !dbg !786
  %12 = load i8, ptr %arrayidx18.2, align 1, !dbg !786
  %mul19.2 = mul nuw nsw i32 %c.0, 12, !dbg !787
  %add20.2 = add nuw nsw i32 %mul19.2, %add23.1, !dbg !788
  %add.ptr22.idx.2 = mul nuw nsw i32 %add20.2, 72, !dbg !789
  %add.ptr22.2 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr22.idx.2, !dbg !789
  call fastcc void @m_vec_mul_add(i32 noundef 9, ptr noundef %add.ptr15.2, i8 noundef zeroext %12, ptr noundef nonnull %add.ptr22.2) #6, !dbg !790
    #dbg_value(i32 %k.0, !771, !DIExpression(DW_OP_plus_uconst, 3, DW_OP_stack_value), !772)
  %add23.2 = or disjoint i32 %k.0, 3, !dbg !791
    #dbg_value(i32 %add23.2, !771, !DIExpression(), !772)
  %add.ptr.idx.3 = mul nsw i32 %bs_mat_entries_used.1, 72, !dbg !776
  %add.ptr.3 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.3, !dbg !776
  %mul8.3 = mul nuw nsw i32 %c.0, 12, !dbg !778
  %13 = getelementptr inbounds nuw i8, ptr %O, i32 %mul8.3, !dbg !779
  %arrayidx.3 = getelementptr inbounds nuw i8, ptr %13, i32 %add23.2, !dbg !779
  %14 = load i8, ptr %arrayidx.3, align 1, !dbg !779
  %mul10.3 = mul nuw nsw i32 %r.0, 12, !dbg !780
  %add11.3 = add nuw nsw i32 %mul10.3, %add23.2, !dbg !781
  %add.ptr13.idx.3 = mul nuw nsw i32 %add11.3, 72, !dbg !782
  %add.ptr13.3 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr13.idx.3, !dbg !782
  call fastcc void @m_vec_mul_add(i32 noundef 9, ptr noundef %add.ptr.3, i8 noundef zeroext %14, ptr noundef nonnull %add.ptr13.3) #6, !dbg !783
  %add.ptr15.idx.3 = mul nsw i32 %bs_mat_entries_used.1, 72, !dbg !784
  %add.ptr15.3 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr15.idx.3, !dbg !784
  %mul16.3 = mul nuw nsw i32 %r.0, 12, !dbg !785
  %15 = getelementptr inbounds nuw i8, ptr %O, i32 %mul16.3, !dbg !786
  %arrayidx18.3 = getelementptr inbounds nuw i8, ptr %15, i32 %add23.2, !dbg !786
  %16 = load i8, ptr %arrayidx18.3, align 1, !dbg !786
  %mul19.3 = mul nuw nsw i32 %c.0, 12, !dbg !787
  %add20.3 = add nuw nsw i32 %mul19.3, %add23.2, !dbg !788
  %add.ptr22.idx.3 = mul nuw nsw i32 %add20.3, 72, !dbg !789
  %add.ptr22.3 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr22.idx.3, !dbg !789
  call fastcc void @m_vec_mul_add(i32 noundef 9, ptr noundef %add.ptr15.3, i8 noundef zeroext %16, ptr noundef nonnull %add.ptr22.3) #6, !dbg !790
  %add23.3 = add nuw nsw i32 %k.0, 4, !dbg !791
    #dbg_value(i32 %add23.3, !771, !DIExpression(), !772)
  br label %for.cond5, !dbg !792, !llvm.loop !793

for.inc25:                                        ; preds = %for.cond5, %for.body3
  %bs_mat_entries_used.2 = add i32 %bs_mat_entries_used.1, 1, !dbg !795
    #dbg_value(i32 %bs_mat_entries_used.2, !748, !DIExpression(), !741)
  %inc = add nuw nsw i32 %c.0, 1, !dbg !796
    #dbg_value(i32 %inc, !762, !DIExpression(), !763)
  br label %for.cond1, !dbg !797, !llvm.loop !798

for.inc27:                                        ; preds = %for.cond1
  %inc28 = add nuw nsw i32 %r.0, 1, !dbg !800
    #dbg_value(i32 %inc28, !749, !DIExpression(), !751)
  %indvars.iv.next = add nsw i32 %indvars.iv, -1, !dbg !801
  br label %for.cond, !dbg !801, !llvm.loop !802

for.end29:                                        ; preds = %for.cond
  ret void, !dbg !804
}

; Function Attrs: nounwind
define dso_local i32 @pqmayo_MAYO_5_ref_mayo_sign_signature(ptr noundef %p, ptr noundef %sig, ptr noundef %siglen, ptr noundef %m, i32 noundef %mlen, ptr noundef %csk) local_unnamed_addr #0 !dbg !805 {
entry:
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
    #dbg_value(ptr %p, !809, !DIExpression(), !810)
    #dbg_value(ptr %sig, !811, !DIExpression(), !810)
    #dbg_value(ptr %siglen, !812, !DIExpression(), !810)
    #dbg_value(ptr %m, !813, !DIExpression(), !810)
    #dbg_value(i32 %mlen, !814, !DIExpression(), !810)
    #dbg_value(ptr %csk, !815, !DIExpression(), !810)
    #dbg_value(i32 0, !816, !DIExpression(), !810)
    #dbg_declare(ptr %tenc, !817, !DIExpression(), !821)
    #dbg_declare(ptr %t, !822, !DIExpression(), !826)
    #dbg_declare(ptr %y, !827, !DIExpression(), !828)
    #dbg_declare(ptr %salt, !829, !DIExpression(), !833)
    #dbg_declare(ptr %V, !834, !DIExpression(), !838)
    #dbg_declare(ptr %Vdec, !839, !DIExpression(), !840)
    #dbg_declare(ptr %A, !841, !DIExpression(), !845)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(20880) %A, i8 0, i32 20880, i1 false), !dbg !845
    #dbg_declare(ptr %x, !846, !DIExpression(), !850)
    #dbg_declare(ptr %r, !851, !DIExpression(), !855)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(145) %r, i8 0, i32 145, i1 false), !dbg !855
    #dbg_declare(ptr %s, !856, !DIExpression(), !857)
    #dbg_declare(ptr %sk, !858, !DIExpression(), !859)
    #dbg_declare(ptr %Ox, !860, !DIExpression(), !861)
    #dbg_declare(ptr %tmp, !862, !DIExpression(), !863)
    #dbg_value(i32 142, !864, !DIExpression(), !810)
    #dbg_value(i32 154, !865, !DIExpression(), !810)
    #dbg_value(i32 12, !866, !DIExpression(), !810)
    #dbg_value(i32 12, !867, !DIExpression(), !810)
    #dbg_value(i32 142, !868, !DIExpression(), !810)
    #dbg_value(i32 71, !869, !DIExpression(), !810)
    #dbg_value(i32 71, !870, !DIExpression(), !810)
    #dbg_value(i32 72, !871, !DIExpression(), !810)
    #dbg_value(i32 964, !872, !DIExpression(), !810)
    #dbg_value(i32 145, !873, !DIExpression(), !810)
    #dbg_value(i32 64, !874, !DIExpression(), !810)
    #dbg_value(i32 40, !875, !DIExpression(), !810)
    #dbg_value(i32 40, !876, !DIExpression(), !810)
  %call = call i32 @pqmayo_MAYO_5_ref_mayo_expand_sk(ptr noundef %p, ptr noundef %csk, ptr noundef nonnull %sk) #6, !dbg !877
    #dbg_value(i32 %call, !816, !DIExpression(), !810)
  %cmp.not = icmp eq i32 %call, 0, !dbg !878
  br i1 %cmp.not, label %if.end, label %err, !dbg !878

if.end:                                           ; preds = %entry
    #dbg_value(ptr %csk, !880, !DIExpression(), !810)
  %call1 = call i32 @shake256(ptr noundef nonnull %tmp, i32 noundef 64, ptr noundef %m, i32 noundef %mlen) #8, !dbg !881
    #dbg_value(ptr %sk, !882, !DIExpression(), !810)
  %add.ptr = getelementptr inbounds nuw i8, ptr %sk, i32 731016, !dbg !883
    #dbg_value(ptr %add.ptr, !884, !DIExpression(), !810)
    #dbg_declare(ptr %Mtmp, !885, !DIExpression(), !886)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(10368) %Mtmp, i8 0, i32 10368, i1 false), !dbg !886
  %add.ptr5 = getelementptr inbounds nuw i8, ptr %tmp, i32 64, !dbg !887
  %call6 = call i32 @randombytes(ptr noundef nonnull %add.ptr5, i32 noundef 40) #8, !dbg !889
  %cmp7.not = icmp eq i32 %call6, 0, !dbg !890
  br i1 %cmp7.not, label %if.end9, label %err, !dbg !890

if.end9:                                          ; preds = %if.end
  %add.ptr12 = getelementptr inbounds nuw i8, ptr %tmp, i32 104, !dbg !891
  %call13 = call ptr @memcpy(ptr noundef nonnull %add.ptr12, ptr noundef %csk, i32 noundef 40) #8, !dbg !892
  %call16 = call i32 @shake256(ptr noundef nonnull %salt, i32 noundef 40, ptr noundef nonnull %tmp, i32 noundef 144) #8, !dbg !893
  %add.ptr18 = getelementptr inbounds nuw i8, ptr %tmp, i32 64, !dbg !894
  %call20 = call ptr @memcpy(ptr noundef nonnull %add.ptr18, ptr noundef nonnull %salt, i32 noundef 40) #8, !dbg !895
  %add.ptr24 = getelementptr inbounds nuw i8, ptr %tmp, i32 144, !dbg !896
    #dbg_value(ptr %add.ptr24, !897, !DIExpression(), !810)
  %call27 = call i32 @shake256(ptr noundef nonnull %tenc, i32 noundef 71, ptr noundef nonnull %tmp, i32 noundef 104) #8, !dbg !898
  call fastcc void @decode(ptr noundef nonnull %tenc, ptr noundef nonnull %t, i32 noundef 142) #6, !dbg !899
    #dbg_value(i32 0, !900, !DIExpression(), !902)
  %add.ptr61 = getelementptr inbounds nuw i8, ptr %V, i32 852, !dbg !903
  br label %for.cond, !dbg !906

for.cond:                                         ; preds = %if.else, %if.end9
  %ctr.0 = phi i32 [ 0, %if.end9 ], [ %inc75, %if.else ], !dbg !907
    #dbg_value(i32 %ctr.0, !900, !DIExpression(), !902)
  %exitcond2.not = icmp eq i32 %ctr.0, 256, !dbg !908
  br i1 %exitcond2.not, label %for.end76, label %for.body, !dbg !909

for.body:                                         ; preds = %for.cond
  %conv = trunc nuw i32 %ctr.0 to i8, !dbg !910
  store i8 %conv, ptr %add.ptr24, align 1, !dbg !911
  %call33 = call i32 @shake256(ptr noundef nonnull %V, i32 noundef 924, ptr noundef nonnull %tmp, i32 noundef 145) #8, !dbg !912
    #dbg_value(i32 0, !913, !DIExpression(), !915)
    #dbg_value(i32 0, !913, !DIExpression(), !915)
  call fastcc void @decode(ptr noundef nonnull %V, ptr noundef nonnull %Vdec, i32 noundef 142) #6, !dbg !916
    #dbg_value(i32 1, !913, !DIExpression(), !915)
  %add.ptr39.1 = getelementptr inbounds nuw i8, ptr %V, i32 71, !dbg !919
  %add.ptr42.1 = getelementptr inbounds nuw i8, ptr %Vdec, i32 142, !dbg !920
  call fastcc void @decode(ptr noundef nonnull %add.ptr39.1, ptr noundef nonnull %add.ptr42.1, i32 noundef 142) #6, !dbg !916
    #dbg_value(i32 2, !913, !DIExpression(), !915)
  %add.ptr39.2 = getelementptr inbounds nuw i8, ptr %V, i32 142, !dbg !919
  %add.ptr42.2 = getelementptr inbounds nuw i8, ptr %Vdec, i32 284, !dbg !920
  call fastcc void @decode(ptr noundef nonnull %add.ptr39.2, ptr noundef nonnull %add.ptr42.2, i32 noundef 142) #6, !dbg !916
    #dbg_value(i32 3, !913, !DIExpression(), !915)
  %add.ptr39.3 = getelementptr inbounds nuw i8, ptr %V, i32 213, !dbg !919
  %add.ptr42.3 = getelementptr inbounds nuw i8, ptr %Vdec, i32 426, !dbg !920
  call fastcc void @decode(ptr noundef nonnull %add.ptr39.3, ptr noundef nonnull %add.ptr42.3, i32 noundef 142) #6, !dbg !916
    #dbg_value(i32 4, !913, !DIExpression(), !915)
  %add.ptr39.4 = getelementptr inbounds nuw i8, ptr %V, i32 284, !dbg !919
  %add.ptr42.4 = getelementptr inbounds nuw i8, ptr %Vdec, i32 568, !dbg !920
  call fastcc void @decode(ptr noundef nonnull %add.ptr39.4, ptr noundef nonnull %add.ptr42.4, i32 noundef 142) #6, !dbg !916
    #dbg_value(i32 5, !913, !DIExpression(), !915)
  %add.ptr39.5 = getelementptr inbounds nuw i8, ptr %V, i32 355, !dbg !919
  %add.ptr42.5 = getelementptr inbounds nuw i8, ptr %Vdec, i32 710, !dbg !920
  call fastcc void @decode(ptr noundef nonnull %add.ptr39.5, ptr noundef nonnull %add.ptr42.5, i32 noundef 142) #6, !dbg !916
    #dbg_value(i32 6, !913, !DIExpression(), !915)
  %add.ptr39.6 = getelementptr inbounds nuw i8, ptr %V, i32 426, !dbg !919
  %add.ptr42.6 = getelementptr inbounds nuw i8, ptr %Vdec, i32 852, !dbg !920
  call fastcc void @decode(ptr noundef nonnull %add.ptr39.6, ptr noundef nonnull %add.ptr42.6, i32 noundef 142) #6, !dbg !916
    #dbg_value(i32 7, !913, !DIExpression(), !915)
  %add.ptr39.7 = getelementptr inbounds nuw i8, ptr %V, i32 497, !dbg !919
  %add.ptr42.7 = getelementptr inbounds nuw i8, ptr %Vdec, i32 994, !dbg !920
  call fastcc void @decode(ptr noundef nonnull %add.ptr39.7, ptr noundef nonnull %add.ptr42.7, i32 noundef 142) #6, !dbg !916
    #dbg_value(i32 8, !913, !DIExpression(), !915)
  %add.ptr39.8 = getelementptr inbounds nuw i8, ptr %V, i32 568, !dbg !919
  %add.ptr42.8 = getelementptr inbounds nuw i8, ptr %Vdec, i32 1136, !dbg !920
  call fastcc void @decode(ptr noundef nonnull %add.ptr39.8, ptr noundef nonnull %add.ptr42.8, i32 noundef 142) #6, !dbg !916
    #dbg_value(i32 9, !913, !DIExpression(), !915)
  %add.ptr39.9 = getelementptr inbounds nuw i8, ptr %V, i32 639, !dbg !919
  %add.ptr42.9 = getelementptr inbounds nuw i8, ptr %Vdec, i32 1278, !dbg !920
  call fastcc void @decode(ptr noundef nonnull %add.ptr39.9, ptr noundef nonnull %add.ptr42.9, i32 noundef 142) #6, !dbg !916
    #dbg_value(i32 10, !913, !DIExpression(), !915)
  %add.ptr39.10 = getelementptr inbounds nuw i8, ptr %V, i32 710, !dbg !919
  %add.ptr42.10 = getelementptr inbounds nuw i8, ptr %Vdec, i32 1420, !dbg !920
  call fastcc void @decode(ptr noundef nonnull %add.ptr39.10, ptr noundef nonnull %add.ptr42.10, i32 noundef 142) #6, !dbg !916
    #dbg_value(i32 11, !913, !DIExpression(), !915)
  %add.ptr39.11 = getelementptr inbounds nuw i8, ptr %V, i32 781, !dbg !919
  %add.ptr42.11 = getelementptr inbounds nuw i8, ptr %Vdec, i32 1562, !dbg !920
  call fastcc void @decode(ptr noundef nonnull %add.ptr39.11, ptr noundef nonnull %add.ptr42.11, i32 noundef 142) #6, !dbg !916
    #dbg_value(i32 12, !913, !DIExpression(), !915)
  call fastcc void @compute_M_and_VPV(ptr noundef %p, ptr noundef nonnull %Vdec, ptr noundef nonnull %add.ptr, ptr noundef nonnull %sk, ptr noundef nonnull %Mtmp, ptr noundef nonnull %A) #6, !dbg !921
  call fastcc void @compute_rhs(ptr noundef %p, ptr noundef nonnull %A, ptr noundef nonnull %t, ptr noundef nonnull %y) #6, !dbg !922
  call fastcc void @compute_A(ptr noundef %p, ptr noundef nonnull %Mtmp, ptr noundef nonnull %A) #6, !dbg !923
    #dbg_value(i32 0, !924, !DIExpression(), !926)
  br label %for.cond52, !dbg !927

for.cond52:                                       ; preds = %for.body55.12, %for.body
  %i51.0 = phi i32 [ 0, %for.body ], [ %inc58.12, %for.body55.12 ], !dbg !928
    #dbg_value(i32 %i51.0, !924, !DIExpression(), !926)
  %0 = mul nuw nsw i32 %i51.0, 145, !dbg !929
  %sub = add nuw nsw i32 %0, 144, !dbg !932
  %arrayidx = getelementptr inbounds nuw [20880 x i8], ptr %A, i32 0, i32 %sub, !dbg !933
  store i8 0, ptr %arrayidx, align 1, !dbg !934
    #dbg_value(i32 %i51.0, !924, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !926)
    #dbg_value(i32 %i51.0, !924, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !926)
  %1 = mul nuw i32 %i51.0, 145, !dbg !929
  %sub.1 = add nuw i32 %1, 289, !dbg !932
  %arrayidx.1 = getelementptr inbounds nuw [20880 x i8], ptr %A, i32 0, i32 %sub.1, !dbg !933
  store i8 0, ptr %arrayidx.1, align 1, !dbg !934
    #dbg_value(i32 %i51.0, !924, !DIExpression(DW_OP_plus_uconst, 2, DW_OP_stack_value), !926)
    #dbg_value(i32 %i51.0, !924, !DIExpression(DW_OP_plus_uconst, 2, DW_OP_stack_value), !926)
  %2 = mul nuw i32 %i51.0, 145, !dbg !929
  %sub.2 = add nuw i32 %2, 434, !dbg !932
  %arrayidx.2 = getelementptr inbounds nuw [20880 x i8], ptr %A, i32 0, i32 %sub.2, !dbg !933
  store i8 0, ptr %arrayidx.2, align 1, !dbg !934
    #dbg_value(i32 %i51.0, !924, !DIExpression(DW_OP_plus_uconst, 3, DW_OP_stack_value), !926)
    #dbg_value(i32 %i51.0, !924, !DIExpression(DW_OP_plus_uconst, 3, DW_OP_stack_value), !926)
  %3 = mul nuw i32 %i51.0, 145, !dbg !929
  %sub.3 = add nuw i32 %3, 579, !dbg !932
  %arrayidx.3 = getelementptr inbounds nuw [20880 x i8], ptr %A, i32 0, i32 %sub.3, !dbg !933
  store i8 0, ptr %arrayidx.3, align 1, !dbg !934
    #dbg_value(i32 %i51.0, !924, !DIExpression(DW_OP_plus_uconst, 4, DW_OP_stack_value), !926)
    #dbg_value(i32 %i51.0, !924, !DIExpression(DW_OP_plus_uconst, 4, DW_OP_stack_value), !926)
  %4 = mul nuw i32 %i51.0, 145, !dbg !929
  %sub.4 = add nuw i32 %4, 724, !dbg !932
  %arrayidx.4 = getelementptr inbounds nuw [20880 x i8], ptr %A, i32 0, i32 %sub.4, !dbg !933
  store i8 0, ptr %arrayidx.4, align 1, !dbg !934
    #dbg_value(i32 %i51.0, !924, !DIExpression(DW_OP_plus_uconst, 5, DW_OP_stack_value), !926)
    #dbg_value(i32 %i51.0, !924, !DIExpression(DW_OP_plus_uconst, 5, DW_OP_stack_value), !926)
  %5 = mul nuw i32 %i51.0, 145, !dbg !929
  %sub.5 = add nuw i32 %5, 869, !dbg !932
  %arrayidx.5 = getelementptr inbounds nuw [20880 x i8], ptr %A, i32 0, i32 %sub.5, !dbg !933
  store i8 0, ptr %arrayidx.5, align 1, !dbg !934
    #dbg_value(i32 %i51.0, !924, !DIExpression(DW_OP_plus_uconst, 6, DW_OP_stack_value), !926)
    #dbg_value(i32 %i51.0, !924, !DIExpression(DW_OP_plus_uconst, 6, DW_OP_stack_value), !926)
  %6 = mul nuw i32 %i51.0, 145, !dbg !929
  %sub.6 = add nuw i32 %6, 1014, !dbg !932
  %arrayidx.6 = getelementptr inbounds nuw [20880 x i8], ptr %A, i32 0, i32 %sub.6, !dbg !933
  store i8 0, ptr %arrayidx.6, align 1, !dbg !934
    #dbg_value(i32 %i51.0, !924, !DIExpression(DW_OP_plus_uconst, 7, DW_OP_stack_value), !926)
    #dbg_value(i32 %i51.0, !924, !DIExpression(DW_OP_plus_uconst, 7, DW_OP_stack_value), !926)
  %7 = mul nuw i32 %i51.0, 145, !dbg !929
  %sub.7 = add nuw i32 %7, 1159, !dbg !932
  %arrayidx.7 = getelementptr inbounds nuw [20880 x i8], ptr %A, i32 0, i32 %sub.7, !dbg !933
  store i8 0, ptr %arrayidx.7, align 1, !dbg !934
    #dbg_value(i32 %i51.0, !924, !DIExpression(DW_OP_plus_uconst, 8, DW_OP_stack_value), !926)
    #dbg_value(i32 %i51.0, !924, !DIExpression(DW_OP_plus_uconst, 8, DW_OP_stack_value), !926)
  %8 = mul nuw i32 %i51.0, 145, !dbg !929
  %sub.8 = add nuw i32 %8, 1304, !dbg !932
  %arrayidx.8 = getelementptr inbounds nuw [20880 x i8], ptr %A, i32 0, i32 %sub.8, !dbg !933
  store i8 0, ptr %arrayidx.8, align 1, !dbg !934
    #dbg_value(i32 %i51.0, !924, !DIExpression(DW_OP_plus_uconst, 9, DW_OP_stack_value), !926)
    #dbg_value(i32 %i51.0, !924, !DIExpression(DW_OP_plus_uconst, 9, DW_OP_stack_value), !926)
  %9 = mul nuw i32 %i51.0, 145, !dbg !929
  %sub.9 = add nuw i32 %9, 1449, !dbg !932
  %arrayidx.9 = getelementptr inbounds nuw [20880 x i8], ptr %A, i32 0, i32 %sub.9, !dbg !933
  store i8 0, ptr %arrayidx.9, align 1, !dbg !934
    #dbg_value(i32 %i51.0, !924, !DIExpression(DW_OP_plus_uconst, 10, DW_OP_stack_value), !926)
    #dbg_value(i32 %i51.0, !924, !DIExpression(DW_OP_plus_uconst, 10, DW_OP_stack_value), !926)
  %10 = mul nuw i32 %i51.0, 145, !dbg !929
  %sub.10 = add nuw i32 %10, 1594, !dbg !932
  %arrayidx.10 = getelementptr inbounds nuw [20880 x i8], ptr %A, i32 0, i32 %sub.10, !dbg !933
  store i8 0, ptr %arrayidx.10, align 1, !dbg !934
    #dbg_value(i32 %i51.0, !924, !DIExpression(DW_OP_plus_uconst, 11, DW_OP_stack_value), !926)
    #dbg_value(i32 %i51.0, !924, !DIExpression(DW_OP_plus_uconst, 11, DW_OP_stack_value), !926)
  %11 = mul nuw i32 %i51.0, 145, !dbg !929
  %sub.11 = add nuw i32 %11, 1739, !dbg !932
  %arrayidx.11 = getelementptr inbounds nuw [20880 x i8], ptr %A, i32 0, i32 %sub.11, !dbg !933
  store i8 0, ptr %arrayidx.11, align 1, !dbg !934
  %inc58.11 = add nuw nsw i32 %i51.0, 12, !dbg !935
    #dbg_value(i32 %inc58.11, !924, !DIExpression(), !926)
  %exitcond1.12.not = icmp eq i32 %inc58.11, 142, !dbg !936
  br i1 %exitcond1.12.not, label %for.end59, label %for.body55.12, !dbg !937

for.body55.12:                                    ; preds = %for.cond52
  %12 = mul nuw nsw i32 %inc58.11, 145, !dbg !929
  %sub.12 = add nuw nsw i32 %12, 144, !dbg !932
  %arrayidx.12 = getelementptr inbounds nuw [20880 x i8], ptr %A, i32 0, i32 %sub.12, !dbg !933
  store i8 0, ptr %arrayidx.12, align 1, !dbg !934
  %inc58.12 = add nuw nsw i32 %i51.0, 13, !dbg !935
    #dbg_value(i32 %inc58.12, !924, !DIExpression(), !926)
  br label %for.cond52, !dbg !938, !llvm.loop !939

for.end59:                                        ; preds = %for.cond52
  call fastcc void @decode(ptr noundef nonnull %add.ptr61, ptr noundef nonnull %r, i32 noundef 144) #6, !dbg !941
  %call67 = call i32 @pqmayo_MAYO_5_ref_sample_solution(ptr noundef %p, ptr noundef nonnull %A, ptr noundef nonnull %y, ptr noundef nonnull %r, ptr noundef nonnull %x, i32 noundef 12, i32 noundef 12, i32 noundef 142, i32 noundef 145) #6, !dbg !942
  %tobool.not = icmp eq i32 %call67, 0, !dbg !942
  br i1 %tobool.not, label %if.else, label %for.end76, !dbg !942

if.else:                                          ; preds = %for.end59
  %call70 = call ptr @memset(ptr noundef nonnull %Mtmp, i32 noundef 0, i32 noundef 10368) #8, !dbg !944
  %call72 = call ptr @memset(ptr noundef nonnull %A, i32 noundef 0, i32 noundef 20880) #8, !dbg !946
  %inc75 = add nuw nsw i32 %ctr.0, 1, !dbg !947
    #dbg_value(i32 %inc75, !900, !DIExpression(), !902)
  br label %for.cond, !dbg !948, !llvm.loop !949

for.end76:                                        ; preds = %for.end59, %for.cond
    #dbg_value(i32 0, !951, !DIExpression(), !953)
  br label %for.cond78, !dbg !954

for.cond78:                                       ; preds = %for.body81, %for.end76
  %i77.0 = phi i32 [ 0, %for.end76 ], [ %inc103, %for.body81 ], !dbg !955
    #dbg_value(i32 %i77.0, !951, !DIExpression(), !953)
  %exitcond3.not = icmp eq i32 %i77.0, 12, !dbg !956
  br i1 %exitcond3.not, label %for.end104, label %for.body81, !dbg !958

for.body81:                                       ; preds = %for.cond78
  %mul83 = mul nuw nsw i32 %i77.0, 142, !dbg !959
  %add.ptr84 = getelementptr inbounds nuw i8, ptr %Vdec, i32 %mul83, !dbg !961
    #dbg_value(ptr %add.ptr84, !962, !DIExpression(), !810)
  %O = getelementptr inbounds nuw i8, ptr %sk, i32 853704, !dbg !963
  %mul87 = mul nuw nsw i32 %i77.0, 12, !dbg !964
  %add.ptr88 = getelementptr inbounds nuw i8, ptr %x, i32 %mul87, !dbg !965
  call fastcc void @mat_mul(ptr noundef nonnull %O, ptr noundef nonnull %add.ptr88, ptr noundef nonnull %Ox, i32 noundef 12, i32 noundef 142, i32 noundef 1) #6, !dbg !966
  %mul92 = mul nuw nsw i32 %i77.0, 154, !dbg !967
  %add.ptr93 = getelementptr inbounds nuw i8, ptr %s, i32 %mul92, !dbg !968
  call fastcc void @mat_add(ptr noundef nonnull %add.ptr84, ptr noundef nonnull %Ox, ptr noundef nonnull %add.ptr93, i32 noundef 142, i32 noundef 1) #6, !dbg !969
  %mul95 = mul nuw nsw i32 %i77.0, 154, !dbg !970
  %add.ptr96 = getelementptr inbounds nuw i8, ptr %s, i32 %mul95, !dbg !971
  %add.ptr97 = getelementptr inbounds nuw i8, ptr %add.ptr96, i32 142, !dbg !972
  %mul99 = mul nuw nsw i32 %i77.0, 12, !dbg !973
  %add.ptr100 = getelementptr inbounds nuw i8, ptr %x, i32 %mul99, !dbg !974
  %call101 = call ptr @memcpy(ptr noundef nonnull %add.ptr97, ptr noundef nonnull %add.ptr100, i32 noundef 12) #8, !dbg !975
  %inc103 = add nuw nsw i32 %i77.0, 1, !dbg !976
    #dbg_value(i32 %inc103, !951, !DIExpression(), !953)
  br label %for.cond78, !dbg !977, !llvm.loop !978

for.end104:                                       ; preds = %for.cond78
  call fastcc void @encode(ptr noundef nonnull %s, ptr noundef %sig, i32 noundef 1848) #6, !dbg !980
  %add.ptr107 = getelementptr inbounds nuw i8, ptr %sig, i32 924, !dbg !981
  %call109 = call ptr @memcpy(ptr noundef nonnull %add.ptr107, ptr noundef nonnull %salt, i32 noundef 40) #8, !dbg !982
  store i32 964, ptr %siglen, align 4, !dbg !983
  br label %err, !dbg !984

err:                                              ; preds = %if.end, %entry, %for.end104
  %ret.0 = phi i32 [ %call, %for.end104 ], [ %call, %entry ], [ 1, %if.end ], !dbg !810
    #dbg_value(i32 %ret.0, !816, !DIExpression(), !810)
    #dbg_label(!985, !986)
  call void @mayo_secure_clear(ptr noundef nonnull %V, i32 noundef 924) #8, !dbg !987
  call void @mayo_secure_clear(ptr noundef nonnull %Vdec, i32 noundef 1704) #8, !dbg !988
  call void @mayo_secure_clear(ptr noundef nonnull %A, i32 noundef 20880) #8, !dbg !989
  call void @mayo_secure_clear(ptr noundef nonnull %r, i32 noundef 145) #8, !dbg !990
  %O114 = getelementptr inbounds nuw i8, ptr %sk, i32 853704, !dbg !991
  call void @mayo_secure_clear(ptr noundef nonnull %O114, i32 noundef 1704) #8, !dbg !992
  call void @mayo_secure_clear(ptr noundef nonnull %sk, i32 noundef 855408) #8, !dbg !993
  call void @mayo_secure_clear(ptr noundef nonnull %Ox, i32 noundef 142) #8, !dbg !994
  call void @mayo_secure_clear(ptr noundef nonnull %tmp, i32 noundef 145) #8, !dbg !995
  call void @mayo_secure_clear(ptr noundef nonnull %Mtmp, i32 noundef 10368) #8, !dbg !996
  ret i32 %ret.0, !dbg !997
}

; Function Attrs: nounwind
define internal fastcc void @compute_M_and_VPV(ptr noundef %p, ptr noundef %Vdec, ptr noundef %L, ptr noundef %P1, ptr noundef %VL, ptr noundef %VP1V) unnamed_addr #0 !dbg !998 {
entry:
  %Pv = alloca [15336 x i64], align 8
    #dbg_value(ptr %p, !1001, !DIExpression(), !1002)
    #dbg_value(ptr %Vdec, !1003, !DIExpression(), !1002)
    #dbg_value(ptr %L, !1004, !DIExpression(), !1002)
    #dbg_value(ptr %P1, !1005, !DIExpression(), !1002)
    #dbg_value(ptr %VL, !1006, !DIExpression(), !1002)
    #dbg_value(ptr %VP1V, !1007, !DIExpression(), !1002)
    #dbg_value(i32 12, !1008, !DIExpression(), !1002)
    #dbg_value(i32 142, !1009, !DIExpression(), !1002)
    #dbg_value(i32 12, !1010, !DIExpression(), !1002)
  call fastcc void @mul_add_mat_x_m_mat(i32 noundef 9, ptr noundef %Vdec, ptr noundef %L, ptr noundef %VL, i32 noundef 12, i32 noundef 142, i32 noundef 12) #6, !dbg !1011
    #dbg_declare(ptr %Pv, !1012, !DIExpression(), !1016)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(122688) %Pv, i8 0, i32 122688, i1 false), !dbg !1016
  call fastcc void @P1_times_Vt(ptr noundef %p, ptr noundef %P1, ptr noundef %Vdec, ptr noundef nonnull %Pv) #6, !dbg !1017
  call fastcc void @mul_add_mat_x_m_mat(i32 noundef 9, ptr noundef %Vdec, ptr noundef nonnull %Pv, ptr noundef %VP1V, i32 noundef 12, i32 noundef 142, i32 noundef 12) #6, !dbg !1018
  ret void, !dbg !1019
}

; Function Attrs: nounwind
define internal fastcc void @compute_rhs(ptr noundef %p, ptr noundef %vPv, ptr noundef %t, ptr noundef %y) unnamed_addr #0 !dbg !1020 {
entry:
  %temp = alloca [9 x i64], align 8
    #dbg_value(ptr %p, !1023, !DIExpression(), !1024)
    #dbg_value(ptr %vPv, !1025, !DIExpression(), !1024)
    #dbg_value(ptr %t, !1026, !DIExpression(), !1024)
    #dbg_value(ptr %y, !1027, !DIExpression(), !1024)
    #dbg_value(i32 52, !1028, !DIExpression(), !1024)
    #dbg_value(i32 9, !1030, !DIExpression(), !1024)
    #dbg_value(i64 1, !1031, !DIExpression(), !1034)
    #dbg_value(i64 72057594037927936, !1031, !DIExpression(), !1034)
    #dbg_value(i64 72057594037927935, !1031, !DIExpression(), !1034)
    #dbg_value(i32 0, !1035, !DIExpression(), !1037)
  br label %for.cond, !dbg !1038

for.cond:                                         ; preds = %for.body.4, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc.4, %for.body.4 ], !dbg !1039
    #dbg_value(i32 %i.0, !1035, !DIExpression(), !1037)
  %.idx7 = mul nuw nsw i32 %i.0, 72, !dbg !1040
  %0 = getelementptr inbounds nuw i8, ptr %vPv, i32 %.idx7, !dbg !1040
  %arrayidx = getelementptr inbounds nuw i8, ptr %0, i32 64, !dbg !1040
  %1 = load i64, ptr %arrayidx, align 8, !dbg !1043
  %and = and i64 %1, 72057594037927935, !dbg !1043
  store i64 %and, ptr %arrayidx, align 8, !dbg !1043
    #dbg_value(i32 %i.0, !1035, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1037)
    #dbg_value(i32 %i.0, !1035, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1037)
  %2 = mul nuw i32 %i.0, 72, !dbg !1040
  %3 = getelementptr i8, ptr %vPv, i32 %2, !dbg !1040
  %arrayidx.1 = getelementptr i8, ptr %3, i32 136, !dbg !1040
  %4 = load i64, ptr %arrayidx.1, align 8, !dbg !1043
  %and.1 = and i64 %4, 72057594037927935, !dbg !1043
  store i64 %and.1, ptr %arrayidx.1, align 8, !dbg !1043
    #dbg_value(i32 %i.0, !1035, !DIExpression(DW_OP_plus_uconst, 2, DW_OP_stack_value), !1037)
    #dbg_value(i32 %i.0, !1035, !DIExpression(DW_OP_plus_uconst, 2, DW_OP_stack_value), !1037)
  %5 = mul nuw i32 %i.0, 72, !dbg !1040
  %6 = getelementptr i8, ptr %vPv, i32 %5, !dbg !1040
  %arrayidx.2 = getelementptr i8, ptr %6, i32 208, !dbg !1040
  %7 = load i64, ptr %arrayidx.2, align 8, !dbg !1043
  %and.2 = and i64 %7, 72057594037927935, !dbg !1043
  store i64 %and.2, ptr %arrayidx.2, align 8, !dbg !1043
    #dbg_value(i32 %i.0, !1035, !DIExpression(DW_OP_plus_uconst, 3, DW_OP_stack_value), !1037)
    #dbg_value(i32 %i.0, !1035, !DIExpression(DW_OP_plus_uconst, 3, DW_OP_stack_value), !1037)
  %8 = mul nuw i32 %i.0, 72, !dbg !1040
  %9 = getelementptr i8, ptr %vPv, i32 %8, !dbg !1040
  %arrayidx.3 = getelementptr i8, ptr %9, i32 280, !dbg !1040
  %10 = load i64, ptr %arrayidx.3, align 8, !dbg !1043
  %and.3 = and i64 %10, 72057594037927935, !dbg !1043
  store i64 %and.3, ptr %arrayidx.3, align 8, !dbg !1043
  %inc.3 = add nuw nsw i32 %i.0, 4, !dbg !1044
    #dbg_value(i32 %inc.3, !1035, !DIExpression(), !1037)
  %exitcond.4.not = icmp eq i32 %inc.3, 144, !dbg !1045
  br i1 %exitcond.4.not, label %for.end, label %for.body.4, !dbg !1046

for.body.4:                                       ; preds = %for.cond
  %.idx7.4 = mul nuw nsw i32 %inc.3, 72, !dbg !1040
  %11 = getelementptr inbounds nuw i8, ptr %vPv, i32 %.idx7.4, !dbg !1040
  %arrayidx.4 = getelementptr inbounds nuw i8, ptr %11, i32 64, !dbg !1040
  %12 = load i64, ptr %arrayidx.4, align 8, !dbg !1043
  %and.4 = and i64 %12, 72057594037927935, !dbg !1043
  store i64 %and.4, ptr %arrayidx.4, align 8, !dbg !1043
  %inc.4 = add nuw nsw i32 %i.0, 5, !dbg !1044
    #dbg_value(i32 %inc.4, !1035, !DIExpression(), !1037)
  br label %for.cond, !dbg !1047, !llvm.loop !1048

for.end:                                          ; preds = %for.cond
    #dbg_declare(ptr %temp, !1050, !DIExpression(), !1051)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(72) %temp, i8 0, i32 72, i1 false), !dbg !1051
    #dbg_value(ptr %temp, !1052, !DIExpression(), !1024)
    #dbg_value(i32 11, !1053, !DIExpression(), !1055)
  br label %for.cond3, !dbg !1056

for.cond3:                                        ; preds = %for.inc77, %for.end
  %i2.0 = phi i32 [ 11, %for.end ], [ %dec78, %for.inc77 ], !dbg !1057
    #dbg_value(i32 %i2.0, !1053, !DIExpression(), !1055)
  %cmp4 = icmp sgt i32 %i2.0, -1, !dbg !1058
  br i1 %cmp4, label %for.cond6, label %for.cond81, !dbg !1060

for.cond6:                                        ; preds = %for.cond3, %for.body8
  %j.0 = phi i32 [ %inc75, %for.body8 ], [ %i2.0, %for.cond3 ], !dbg !1061
    #dbg_value(i32 %j.0, !1064, !DIExpression(), !1065)
  %exitcond10.not = icmp eq i32 %j.0, 12, !dbg !1066
  br i1 %exitcond10.not, label %for.inc77, label %for.body8, !dbg !1068

for.body8:                                        ; preds = %for.cond6
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %temp, i32 64, !dbg !1069
  %13 = load i64, ptr %arrayidx9, align 8, !dbg !1069
  %shr = lshr i64 %13, 52, !dbg !1071
  %rem.lhs.trunc = trunc i64 %shr to i8, !dbg !1072
    #dbg_value(i8 %rem1, !1073, !DIExpression(), !1074)
  %arrayidx10 = getelementptr inbounds nuw i8, ptr %temp, i32 64, !dbg !1075
  %shl11 = shl i64 %13, 4, !dbg !1076
  store i64 %shl11, ptr %arrayidx10, align 8, !dbg !1076
    #dbg_value(i32 7, !1077, !DIExpression(), !1079)
    #dbg_value(i32 7, !1077, !DIExpression(), !1079)
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %temp, i32 56, !dbg !1080
  %14 = load i64, ptr %arrayidx16, align 8, !dbg !1080
  %shr17 = lshr i64 %14, 60, !dbg !1083
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %temp, i32 64, !dbg !1084
  %15 = load i64, ptr %arrayidx19, align 8, !dbg !1085
  %xor = xor i64 %15, %shr17, !dbg !1085
  store i64 %xor, ptr %arrayidx19, align 8, !dbg !1085
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %temp, i32 56, !dbg !1086
  %16 = load i64, ptr %arrayidx20, align 8, !dbg !1087
  %shl21 = shl i64 %16, 4, !dbg !1087
  store i64 %shl21, ptr %arrayidx20, align 8, !dbg !1087
    #dbg_value(i32 6, !1077, !DIExpression(), !1079)
  %arrayidx16.1 = getelementptr inbounds nuw i8, ptr %temp, i32 48, !dbg !1080
  %17 = load i64, ptr %arrayidx16.1, align 8, !dbg !1080
  %shr17.1 = lshr i64 %17, 60, !dbg !1083
  %arrayidx19.1 = getelementptr inbounds nuw i8, ptr %temp, i32 56, !dbg !1084
  %18 = load i64, ptr %arrayidx19.1, align 8, !dbg !1085
  %xor.1 = xor i64 %18, %shr17.1, !dbg !1085
  store i64 %xor.1, ptr %arrayidx19.1, align 8, !dbg !1085
  %arrayidx20.1 = getelementptr inbounds nuw i8, ptr %temp, i32 48, !dbg !1086
  %19 = load i64, ptr %arrayidx20.1, align 8, !dbg !1087
  %shl21.1 = shl i64 %19, 4, !dbg !1087
  store i64 %shl21.1, ptr %arrayidx20.1, align 8, !dbg !1087
    #dbg_value(i32 5, !1077, !DIExpression(), !1079)
  %arrayidx16.2 = getelementptr inbounds nuw i8, ptr %temp, i32 40, !dbg !1080
  %20 = load i64, ptr %arrayidx16.2, align 8, !dbg !1080
  %shr17.2 = lshr i64 %20, 60, !dbg !1083
  %arrayidx19.2 = getelementptr inbounds nuw i8, ptr %temp, i32 48, !dbg !1084
  %21 = load i64, ptr %arrayidx19.2, align 8, !dbg !1085
  %xor.2 = xor i64 %21, %shr17.2, !dbg !1085
  store i64 %xor.2, ptr %arrayidx19.2, align 8, !dbg !1085
  %arrayidx20.2 = getelementptr inbounds nuw i8, ptr %temp, i32 40, !dbg !1086
  %22 = load i64, ptr %arrayidx20.2, align 8, !dbg !1087
  %shl21.2 = shl i64 %22, 4, !dbg !1087
  store i64 %shl21.2, ptr %arrayidx20.2, align 8, !dbg !1087
    #dbg_value(i32 4, !1077, !DIExpression(), !1079)
  %arrayidx16.3 = getelementptr inbounds nuw i8, ptr %temp, i32 32, !dbg !1080
  %23 = load i64, ptr %arrayidx16.3, align 8, !dbg !1080
  %shr17.3 = lshr i64 %23, 60, !dbg !1083
  %arrayidx19.3 = getelementptr inbounds nuw i8, ptr %temp, i32 40, !dbg !1084
  %24 = load i64, ptr %arrayidx19.3, align 8, !dbg !1085
  %xor.3 = xor i64 %24, %shr17.3, !dbg !1085
  store i64 %xor.3, ptr %arrayidx19.3, align 8, !dbg !1085
  %arrayidx20.3 = getelementptr inbounds nuw i8, ptr %temp, i32 32, !dbg !1086
  %25 = load i64, ptr %arrayidx20.3, align 8, !dbg !1087
  %shl21.3 = shl i64 %25, 4, !dbg !1087
  store i64 %shl21.3, ptr %arrayidx20.3, align 8, !dbg !1087
    #dbg_value(i32 3, !1077, !DIExpression(), !1079)
  %arrayidx16.4 = getelementptr inbounds nuw i8, ptr %temp, i32 24, !dbg !1080
  %26 = load i64, ptr %arrayidx16.4, align 8, !dbg !1080
  %shr17.4 = lshr i64 %26, 60, !dbg !1083
  %arrayidx19.4 = getelementptr inbounds nuw i8, ptr %temp, i32 32, !dbg !1084
  %27 = load i64, ptr %arrayidx19.4, align 8, !dbg !1085
  %xor.4 = xor i64 %27, %shr17.4, !dbg !1085
  store i64 %xor.4, ptr %arrayidx19.4, align 8, !dbg !1085
  %arrayidx20.4 = getelementptr inbounds nuw i8, ptr %temp, i32 24, !dbg !1086
  %28 = load i64, ptr %arrayidx20.4, align 8, !dbg !1087
  %shl21.4 = shl i64 %28, 4, !dbg !1087
  store i64 %shl21.4, ptr %arrayidx20.4, align 8, !dbg !1087
    #dbg_value(i32 2, !1077, !DIExpression(), !1079)
  %arrayidx16.5 = getelementptr inbounds nuw i8, ptr %temp, i32 16, !dbg !1080
  %29 = load i64, ptr %arrayidx16.5, align 8, !dbg !1080
  %shr17.5 = lshr i64 %29, 60, !dbg !1083
  %arrayidx19.5 = getelementptr inbounds nuw i8, ptr %temp, i32 24, !dbg !1084
  %30 = load i64, ptr %arrayidx19.5, align 8, !dbg !1085
  %xor.5 = xor i64 %30, %shr17.5, !dbg !1085
  store i64 %xor.5, ptr %arrayidx19.5, align 8, !dbg !1085
  %arrayidx20.5 = getelementptr inbounds nuw i8, ptr %temp, i32 16, !dbg !1086
  %31 = load i64, ptr %arrayidx20.5, align 8, !dbg !1087
  %shl21.5 = shl i64 %31, 4, !dbg !1087
  store i64 %shl21.5, ptr %arrayidx20.5, align 8, !dbg !1087
    #dbg_value(i32 1, !1077, !DIExpression(), !1079)
  %arrayidx16.6 = getelementptr inbounds nuw i8, ptr %temp, i32 8, !dbg !1080
  %32 = load i64, ptr %arrayidx16.6, align 8, !dbg !1080
  %shr17.6 = lshr i64 %32, 60, !dbg !1083
  %arrayidx19.6 = getelementptr inbounds nuw i8, ptr %temp, i32 16, !dbg !1084
  %33 = load i64, ptr %arrayidx19.6, align 8, !dbg !1085
  %xor.6 = xor i64 %33, %shr17.6, !dbg !1085
  store i64 %xor.6, ptr %arrayidx19.6, align 8, !dbg !1085
  %arrayidx20.6 = getelementptr inbounds nuw i8, ptr %temp, i32 8, !dbg !1086
  %34 = load i64, ptr %arrayidx20.6, align 8, !dbg !1087
  %shl21.6 = shl i64 %34, 4, !dbg !1087
  store i64 %shl21.6, ptr %arrayidx20.6, align 8, !dbg !1087
    #dbg_value(i32 0, !1077, !DIExpression(), !1079)
  %35 = load i64, ptr %temp, align 8, !dbg !1080
  %shr17.7 = lshr i64 %35, 60, !dbg !1083
  %arrayidx19.7 = getelementptr inbounds nuw i8, ptr %temp, i32 8, !dbg !1084
  %36 = load i64, ptr %arrayidx19.7, align 8, !dbg !1085
  %xor.7 = xor i64 %36, %shr17.7, !dbg !1085
  store i64 %xor.7, ptr %arrayidx19.7, align 8, !dbg !1085
  %shl21.7 = shl i64 %35, 4, !dbg !1087
  store i64 %shl21.7, ptr %temp, align 8, !dbg !1087
    #dbg_value(i32 -1, !1077, !DIExpression(), !1079)
  %rem1 = and i8 %rem.lhs.trunc, 15, !dbg !1072
    #dbg_value(i32 0, !1088, !DIExpression(), !1090)
  %call = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %rem1, i8 noundef zeroext 4) #6, !dbg !1091
  %37 = load i8, ptr %temp, align 1, !dbg !1096
  %xor356 = xor i8 %37, %call, !dbg !1096
  store i8 %xor356, ptr %temp, align 1, !dbg !1096
    #dbg_value(i32 1, !1088, !DIExpression(), !1090)
  %call38.1 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %rem1, i8 noundef zeroext 0) #6, !dbg !1097
  %shl40.1 = shl nuw i8 %call38.1, 4, !dbg !1099
  %38 = load i8, ptr %temp, align 1, !dbg !1100
  %xor44.1 = xor i8 %shl40.1, %38, !dbg !1100
  store i8 %xor44.1, ptr %temp, align 1, !dbg !1100
    #dbg_value(i32 2, !1088, !DIExpression(), !1090)
  %call.2 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %rem1, i8 noundef zeroext 8) #6, !dbg !1091
  %arrayidx33.2 = getelementptr inbounds nuw i8, ptr %temp, i32 1, !dbg !1101
  %39 = load i8, ptr %arrayidx33.2, align 1, !dbg !1096
  %xor356.2 = xor i8 %39, %call.2, !dbg !1096
  store i8 %xor356.2, ptr %arrayidx33.2, align 1, !dbg !1096
    #dbg_value(i32 3, !1088, !DIExpression(), !1090)
  %call38.3 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %rem1, i8 noundef zeroext 1) #6, !dbg !1097
  %shl40.3 = shl nuw i8 %call38.3, 4, !dbg !1099
  %arrayidx42.3 = getelementptr inbounds nuw i8, ptr %temp, i32 1, !dbg !1102
  %40 = load i8, ptr %arrayidx42.3, align 1, !dbg !1100
  %xor44.3 = xor i8 %shl40.3, %40, !dbg !1100
  store i8 %xor44.3, ptr %arrayidx42.3, align 1, !dbg !1100
    #dbg_value(i32 4, !1088, !DIExpression(), !1090)
    #dbg_value(i32 0, !1103, !DIExpression(), !1105)
  %mul54 = mul nuw nsw i32 %i2.0, 12, !dbg !1106
  %add55 = add nuw nsw i32 %mul54, %j.0, !dbg !1109
  %.idx = mul nuw nsw i32 %add55, 72, !dbg !1110
  %41 = getelementptr i8, ptr %vPv, i32 %.idx, !dbg !1110
  %42 = load i64, ptr %41, align 8, !dbg !1110
  %cmp59.not = icmp eq i32 %i2.0, %j.0, !dbg !1111
  %mul62 = mul nuw nsw i32 %j.0, 12, !dbg !1112
  %add63 = add nuw nsw i32 %mul62, %i2.0, !dbg !1113
  %.idx4 = mul nuw nsw i32 %add63, 72, !dbg !1114
  %43 = getelementptr i8, ptr %vPv, i32 %.idx4, !dbg !1114
  %44 = load i64, ptr %43, align 8, !dbg !1114
  %mul67 = select i1 %cmp59.not, i64 0, i64 %44, !dbg !1115
  %xor68 = xor i64 %42, %mul67, !dbg !1116
  %45 = load i64, ptr %temp, align 8, !dbg !1117
  %xor70 = xor i64 %45, %xor68, !dbg !1117
  store i64 %xor70, ptr %temp, align 8, !dbg !1117
    #dbg_value(i32 1, !1103, !DIExpression(), !1105)
  %mul54.1 = mul nuw nsw i32 %i2.0, 12, !dbg !1106
  %add55.1 = add nuw nsw i32 %mul54.1, %j.0, !dbg !1109
  %.idx.1 = mul nuw nsw i32 %add55.1, 72, !dbg !1110
  %46 = getelementptr i8, ptr %vPv, i32 %.idx.1, !dbg !1110
  %arrayidx58.1 = getelementptr i8, ptr %46, i32 8, !dbg !1110
  %47 = load i64, ptr %arrayidx58.1, align 8, !dbg !1110
  %cmp59.not.1 = icmp eq i32 %i2.0, %j.0, !dbg !1111
  %mul62.1 = mul nuw nsw i32 %j.0, 12, !dbg !1112
  %add63.1 = add nuw nsw i32 %mul62.1, %i2.0, !dbg !1113
  %.idx4.1 = mul nuw nsw i32 %add63.1, 72, !dbg !1114
  %48 = getelementptr i8, ptr %vPv, i32 %.idx4.1, !dbg !1114
  %arrayidx66.1 = getelementptr i8, ptr %48, i32 8, !dbg !1114
  %49 = load i64, ptr %arrayidx66.1, align 8, !dbg !1114
  %mul67.1 = select i1 %cmp59.not.1, i64 0, i64 %49, !dbg !1115
  %xor68.1 = xor i64 %47, %mul67.1, !dbg !1116
  %arrayidx69.1 = getelementptr inbounds nuw i8, ptr %temp, i32 8, !dbg !1118
  %50 = load i64, ptr %arrayidx69.1, align 8, !dbg !1117
  %xor70.1 = xor i64 %50, %xor68.1, !dbg !1117
  store i64 %xor70.1, ptr %arrayidx69.1, align 8, !dbg !1117
    #dbg_value(i32 2, !1103, !DIExpression(), !1105)
  %mul54.2 = mul nuw nsw i32 %i2.0, 12, !dbg !1106
  %add55.2 = add nuw nsw i32 %mul54.2, %j.0, !dbg !1109
  %.idx.2 = mul nuw nsw i32 %add55.2, 72, !dbg !1110
  %51 = getelementptr i8, ptr %vPv, i32 %.idx.2, !dbg !1110
  %arrayidx58.2 = getelementptr i8, ptr %51, i32 16, !dbg !1110
  %52 = load i64, ptr %arrayidx58.2, align 8, !dbg !1110
  %cmp59.not.2 = icmp eq i32 %i2.0, %j.0, !dbg !1111
  %mul62.2 = mul nuw nsw i32 %j.0, 12, !dbg !1112
  %add63.2 = add nuw nsw i32 %mul62.2, %i2.0, !dbg !1113
  %.idx4.2 = mul nuw nsw i32 %add63.2, 72, !dbg !1114
  %53 = getelementptr i8, ptr %vPv, i32 %.idx4.2, !dbg !1114
  %arrayidx66.2 = getelementptr i8, ptr %53, i32 16, !dbg !1114
  %54 = load i64, ptr %arrayidx66.2, align 8, !dbg !1114
  %mul67.2 = select i1 %cmp59.not.2, i64 0, i64 %54, !dbg !1115
  %xor68.2 = xor i64 %52, %mul67.2, !dbg !1116
  %arrayidx69.2 = getelementptr inbounds nuw i8, ptr %temp, i32 16, !dbg !1118
  %55 = load i64, ptr %arrayidx69.2, align 8, !dbg !1117
  %xor70.2 = xor i64 %55, %xor68.2, !dbg !1117
  store i64 %xor70.2, ptr %arrayidx69.2, align 8, !dbg !1117
    #dbg_value(i32 3, !1103, !DIExpression(), !1105)
  %mul54.3 = mul nuw nsw i32 %i2.0, 12, !dbg !1106
  %add55.3 = add nuw nsw i32 %mul54.3, %j.0, !dbg !1109
  %.idx.3 = mul nuw nsw i32 %add55.3, 72, !dbg !1110
  %56 = getelementptr i8, ptr %vPv, i32 %.idx.3, !dbg !1110
  %arrayidx58.3 = getelementptr i8, ptr %56, i32 24, !dbg !1110
  %57 = load i64, ptr %arrayidx58.3, align 8, !dbg !1110
  %cmp59.not.3 = icmp eq i32 %i2.0, %j.0, !dbg !1111
  %mul62.3 = mul nuw nsw i32 %j.0, 12, !dbg !1112
  %add63.3 = add nuw nsw i32 %mul62.3, %i2.0, !dbg !1113
  %.idx4.3 = mul nuw nsw i32 %add63.3, 72, !dbg !1114
  %58 = getelementptr i8, ptr %vPv, i32 %.idx4.3, !dbg !1114
  %arrayidx66.3 = getelementptr i8, ptr %58, i32 24, !dbg !1114
  %59 = load i64, ptr %arrayidx66.3, align 8, !dbg !1114
  %mul67.3 = select i1 %cmp59.not.3, i64 0, i64 %59, !dbg !1115
  %xor68.3 = xor i64 %57, %mul67.3, !dbg !1116
  %arrayidx69.3 = getelementptr inbounds nuw i8, ptr %temp, i32 24, !dbg !1118
  %60 = load i64, ptr %arrayidx69.3, align 8, !dbg !1117
  %xor70.3 = xor i64 %60, %xor68.3, !dbg !1117
  store i64 %xor70.3, ptr %arrayidx69.3, align 8, !dbg !1117
    #dbg_value(i32 4, !1103, !DIExpression(), !1105)
  %mul54.4 = mul nuw nsw i32 %i2.0, 12, !dbg !1106
  %add55.4 = add nuw nsw i32 %mul54.4, %j.0, !dbg !1109
  %.idx.4 = mul nuw nsw i32 %add55.4, 72, !dbg !1110
  %61 = getelementptr i8, ptr %vPv, i32 %.idx.4, !dbg !1110
  %arrayidx58.4 = getelementptr i8, ptr %61, i32 32, !dbg !1110
  %62 = load i64, ptr %arrayidx58.4, align 8, !dbg !1110
  %cmp59.not.4 = icmp eq i32 %i2.0, %j.0, !dbg !1111
  %mul62.4 = mul nuw nsw i32 %j.0, 12, !dbg !1112
  %add63.4 = add nuw nsw i32 %mul62.4, %i2.0, !dbg !1113
  %.idx4.4 = mul nuw nsw i32 %add63.4, 72, !dbg !1114
  %63 = getelementptr i8, ptr %vPv, i32 %.idx4.4, !dbg !1114
  %arrayidx66.4 = getelementptr i8, ptr %63, i32 32, !dbg !1114
  %64 = load i64, ptr %arrayidx66.4, align 8, !dbg !1114
  %mul67.4 = select i1 %cmp59.not.4, i64 0, i64 %64, !dbg !1115
  %xor68.4 = xor i64 %62, %mul67.4, !dbg !1116
  %arrayidx69.4 = getelementptr inbounds nuw i8, ptr %temp, i32 32, !dbg !1118
  %65 = load i64, ptr %arrayidx69.4, align 8, !dbg !1117
  %xor70.4 = xor i64 %65, %xor68.4, !dbg !1117
  store i64 %xor70.4, ptr %arrayidx69.4, align 8, !dbg !1117
    #dbg_value(i32 5, !1103, !DIExpression(), !1105)
  %mul54.5 = mul nuw nsw i32 %i2.0, 12, !dbg !1106
  %add55.5 = add nuw nsw i32 %mul54.5, %j.0, !dbg !1109
  %.idx.5 = mul nuw nsw i32 %add55.5, 72, !dbg !1110
  %66 = getelementptr i8, ptr %vPv, i32 %.idx.5, !dbg !1110
  %arrayidx58.5 = getelementptr i8, ptr %66, i32 40, !dbg !1110
  %67 = load i64, ptr %arrayidx58.5, align 8, !dbg !1110
  %cmp59.not.5 = icmp eq i32 %i2.0, %j.0, !dbg !1111
  %mul62.5 = mul nuw nsw i32 %j.0, 12, !dbg !1112
  %add63.5 = add nuw nsw i32 %mul62.5, %i2.0, !dbg !1113
  %.idx4.5 = mul nuw nsw i32 %add63.5, 72, !dbg !1114
  %68 = getelementptr i8, ptr %vPv, i32 %.idx4.5, !dbg !1114
  %arrayidx66.5 = getelementptr i8, ptr %68, i32 40, !dbg !1114
  %69 = load i64, ptr %arrayidx66.5, align 8, !dbg !1114
  %mul67.5 = select i1 %cmp59.not.5, i64 0, i64 %69, !dbg !1115
  %xor68.5 = xor i64 %67, %mul67.5, !dbg !1116
  %arrayidx69.5 = getelementptr inbounds nuw i8, ptr %temp, i32 40, !dbg !1118
  %70 = load i64, ptr %arrayidx69.5, align 8, !dbg !1117
  %xor70.5 = xor i64 %70, %xor68.5, !dbg !1117
  store i64 %xor70.5, ptr %arrayidx69.5, align 8, !dbg !1117
    #dbg_value(i32 6, !1103, !DIExpression(), !1105)
  %mul54.6 = mul nuw nsw i32 %i2.0, 12, !dbg !1106
  %add55.6 = add nuw nsw i32 %mul54.6, %j.0, !dbg !1109
  %.idx.6 = mul nuw nsw i32 %add55.6, 72, !dbg !1110
  %71 = getelementptr i8, ptr %vPv, i32 %.idx.6, !dbg !1110
  %arrayidx58.6 = getelementptr i8, ptr %71, i32 48, !dbg !1110
  %72 = load i64, ptr %arrayidx58.6, align 8, !dbg !1110
  %cmp59.not.6 = icmp eq i32 %i2.0, %j.0, !dbg !1111
  %mul62.6 = mul nuw nsw i32 %j.0, 12, !dbg !1112
  %add63.6 = add nuw nsw i32 %mul62.6, %i2.0, !dbg !1113
  %.idx4.6 = mul nuw nsw i32 %add63.6, 72, !dbg !1114
  %73 = getelementptr i8, ptr %vPv, i32 %.idx4.6, !dbg !1114
  %arrayidx66.6 = getelementptr i8, ptr %73, i32 48, !dbg !1114
  %74 = load i64, ptr %arrayidx66.6, align 8, !dbg !1114
  %mul67.6 = select i1 %cmp59.not.6, i64 0, i64 %74, !dbg !1115
  %xor68.6 = xor i64 %72, %mul67.6, !dbg !1116
  %arrayidx69.6 = getelementptr inbounds nuw i8, ptr %temp, i32 48, !dbg !1118
  %75 = load i64, ptr %arrayidx69.6, align 8, !dbg !1117
  %xor70.6 = xor i64 %75, %xor68.6, !dbg !1117
  store i64 %xor70.6, ptr %arrayidx69.6, align 8, !dbg !1117
    #dbg_value(i32 7, !1103, !DIExpression(), !1105)
  %mul54.7 = mul nuw nsw i32 %i2.0, 12, !dbg !1106
  %add55.7 = add nuw nsw i32 %mul54.7, %j.0, !dbg !1109
  %.idx.7 = mul nuw nsw i32 %add55.7, 72, !dbg !1110
  %76 = getelementptr i8, ptr %vPv, i32 %.idx.7, !dbg !1110
  %arrayidx58.7 = getelementptr i8, ptr %76, i32 56, !dbg !1110
  %77 = load i64, ptr %arrayidx58.7, align 8, !dbg !1110
  %cmp59.not.7 = icmp eq i32 %i2.0, %j.0, !dbg !1111
  %mul62.7 = mul nuw nsw i32 %j.0, 12, !dbg !1112
  %add63.7 = add nuw nsw i32 %mul62.7, %i2.0, !dbg !1113
  %.idx4.7 = mul nuw nsw i32 %add63.7, 72, !dbg !1114
  %78 = getelementptr i8, ptr %vPv, i32 %.idx4.7, !dbg !1114
  %arrayidx66.7 = getelementptr i8, ptr %78, i32 56, !dbg !1114
  %79 = load i64, ptr %arrayidx66.7, align 8, !dbg !1114
  %mul67.7 = select i1 %cmp59.not.7, i64 0, i64 %79, !dbg !1115
  %xor68.7 = xor i64 %77, %mul67.7, !dbg !1116
  %arrayidx69.7 = getelementptr inbounds nuw i8, ptr %temp, i32 56, !dbg !1118
  %80 = load i64, ptr %arrayidx69.7, align 8, !dbg !1117
  %xor70.7 = xor i64 %80, %xor68.7, !dbg !1117
  store i64 %xor70.7, ptr %arrayidx69.7, align 8, !dbg !1117
    #dbg_value(i32 8, !1103, !DIExpression(), !1105)
  %mul54.8 = mul nuw nsw i32 %i2.0, 12, !dbg !1106
  %add55.8 = add nuw nsw i32 %mul54.8, %j.0, !dbg !1109
  %.idx.8 = mul nuw nsw i32 %add55.8, 72, !dbg !1110
  %81 = getelementptr i8, ptr %vPv, i32 %.idx.8, !dbg !1110
  %arrayidx58.8 = getelementptr i8, ptr %81, i32 64, !dbg !1110
  %82 = load i64, ptr %arrayidx58.8, align 8, !dbg !1110
  %cmp59.not.8 = icmp eq i32 %i2.0, %j.0, !dbg !1111
  %mul62.8 = mul nuw nsw i32 %j.0, 12, !dbg !1112
  %add63.8 = add nuw nsw i32 %mul62.8, %i2.0, !dbg !1113
  %.idx4.8 = mul nuw nsw i32 %add63.8, 72, !dbg !1114
  %83 = getelementptr i8, ptr %vPv, i32 %.idx4.8, !dbg !1114
  %arrayidx66.8 = getelementptr i8, ptr %83, i32 64, !dbg !1114
  %84 = load i64, ptr %arrayidx66.8, align 8, !dbg !1114
  %mul67.8 = select i1 %cmp59.not.8, i64 0, i64 %84, !dbg !1115
  %xor68.8 = xor i64 %82, %mul67.8, !dbg !1116
  %arrayidx69.8 = getelementptr inbounds nuw i8, ptr %temp, i32 64, !dbg !1118
  %85 = load i64, ptr %arrayidx69.8, align 8, !dbg !1117
  %xor70.8 = xor i64 %85, %xor68.8, !dbg !1117
  store i64 %xor70.8, ptr %arrayidx69.8, align 8, !dbg !1117
    #dbg_value(i32 9, !1103, !DIExpression(), !1105)
  %inc75 = add nuw nsw i32 %j.0, 1, !dbg !1119
    #dbg_value(i32 %inc75, !1064, !DIExpression(), !1065)
  br label %for.cond6, !dbg !1120, !llvm.loop !1121

for.inc77:                                        ; preds = %for.cond6
  %dec78 = add nsw i32 %i2.0, -1, !dbg !1123
    #dbg_value(i32 %dec78, !1053, !DIExpression(), !1055)
  br label %for.cond3, !dbg !1124, !llvm.loop !1125

for.cond81:                                       ; preds = %for.cond3, %for.body84.8
  %i80.0 = phi i32 [ %add106.8, %for.body84.8 ], [ 0, %for.cond3 ], !dbg !1127
    #dbg_value(i32 %i80.0, !1129, !DIExpression(), !1130)
  %arrayidx85 = getelementptr inbounds nuw i8, ptr %t, i32 %i80.0, !dbg !1131
  %86 = load i8, ptr %arrayidx85, align 1, !dbg !1131
  %div87 = lshr exact i32 %i80.0, 1, !dbg !1134
  %arrayidx88 = getelementptr inbounds nuw i8, ptr %temp, i32 %div87, !dbg !1135
  %87 = load i8, ptr %arrayidx88, align 1, !dbg !1135
  %88 = and i8 %87, 15, !dbg !1136
  %xor912 = xor i8 %86, %88, !dbg !1137
  %arrayidx93 = getelementptr inbounds nuw i8, ptr %y, i32 %i80.0, !dbg !1138
  store i8 %xor912, ptr %arrayidx93, align 1, !dbg !1139
  %add94 = or disjoint i32 %i80.0, 1, !dbg !1140
  %arrayidx95 = getelementptr inbounds nuw i8, ptr %t, i32 %add94, !dbg !1141
  %89 = load i8, ptr %arrayidx95, align 1, !dbg !1141
  %90 = lshr i8 %87, 4, !dbg !1142
  %xor1013 = xor i8 %89, %90, !dbg !1143
  %add103 = or disjoint i32 %i80.0, 1, !dbg !1144
  %arrayidx104 = getelementptr inbounds nuw i8, ptr %y, i32 %add103, !dbg !1145
  store i8 %xor1013, ptr %arrayidx104, align 1, !dbg !1146
    #dbg_value(i32 %i80.0, !1129, !DIExpression(DW_OP_plus_uconst, 2, DW_OP_stack_value), !1130)
  %add106 = add nuw nsw i32 %i80.0, 2, !dbg !1147
    #dbg_value(i32 %add106, !1129, !DIExpression(), !1130)
  %arrayidx85.1 = getelementptr inbounds nuw i8, ptr %t, i32 %add106, !dbg !1131
  %91 = load i8, ptr %arrayidx85.1, align 1, !dbg !1131
  %div87.1 = lshr exact i32 %add106, 1, !dbg !1134
  %arrayidx88.1 = getelementptr inbounds nuw i8, ptr %temp, i32 %div87.1, !dbg !1135
  %92 = load i8, ptr %arrayidx88.1, align 1, !dbg !1135
  %93 = and i8 %92, 15, !dbg !1136
  %xor912.1 = xor i8 %91, %93, !dbg !1137
  %arrayidx93.1 = getelementptr inbounds nuw i8, ptr %y, i32 %add106, !dbg !1138
  store i8 %xor912.1, ptr %arrayidx93.1, align 1, !dbg !1139
  %add94.1 = or disjoint i32 %add106, 1, !dbg !1140
  %arrayidx95.1 = getelementptr inbounds nuw i8, ptr %t, i32 %add94.1, !dbg !1141
  %94 = load i8, ptr %arrayidx95.1, align 1, !dbg !1141
  %95 = lshr i8 %92, 4, !dbg !1142
  %xor1013.1 = xor i8 %94, %95, !dbg !1143
  %add103.1 = or disjoint i32 %add106, 1, !dbg !1144
  %arrayidx104.1 = getelementptr inbounds nuw i8, ptr %y, i32 %add103.1, !dbg !1145
  store i8 %xor1013.1, ptr %arrayidx104.1, align 1, !dbg !1146
    #dbg_value(i32 %i80.0, !1129, !DIExpression(DW_OP_plus_uconst, 4, DW_OP_stack_value), !1130)
  %add106.1 = add nuw nsw i32 %i80.0, 4, !dbg !1147
    #dbg_value(i32 %add106.1, !1129, !DIExpression(), !1130)
  %arrayidx85.2 = getelementptr inbounds nuw i8, ptr %t, i32 %add106.1, !dbg !1131
  %96 = load i8, ptr %arrayidx85.2, align 1, !dbg !1131
  %div87.2 = lshr exact i32 %add106.1, 1, !dbg !1134
  %arrayidx88.2 = getelementptr inbounds nuw i8, ptr %temp, i32 %div87.2, !dbg !1135
  %97 = load i8, ptr %arrayidx88.2, align 1, !dbg !1135
  %98 = and i8 %97, 15, !dbg !1136
  %xor912.2 = xor i8 %96, %98, !dbg !1137
  %arrayidx93.2 = getelementptr inbounds nuw i8, ptr %y, i32 %add106.1, !dbg !1138
  store i8 %xor912.2, ptr %arrayidx93.2, align 1, !dbg !1139
  %add94.2 = or disjoint i32 %add106.1, 1, !dbg !1140
  %arrayidx95.2 = getelementptr inbounds nuw i8, ptr %t, i32 %add94.2, !dbg !1141
  %99 = load i8, ptr %arrayidx95.2, align 1, !dbg !1141
  %100 = lshr i8 %97, 4, !dbg !1142
  %xor1013.2 = xor i8 %99, %100, !dbg !1143
  %add103.2 = or disjoint i32 %add106.1, 1, !dbg !1144
  %arrayidx104.2 = getelementptr inbounds nuw i8, ptr %y, i32 %add103.2, !dbg !1145
  store i8 %xor1013.2, ptr %arrayidx104.2, align 1, !dbg !1146
    #dbg_value(i32 %i80.0, !1129, !DIExpression(DW_OP_plus_uconst, 6, DW_OP_stack_value), !1130)
  %add106.2 = add nuw nsw i32 %i80.0, 6, !dbg !1147
    #dbg_value(i32 %add106.2, !1129, !DIExpression(), !1130)
  %arrayidx85.3 = getelementptr inbounds nuw i8, ptr %t, i32 %add106.2, !dbg !1131
  %101 = load i8, ptr %arrayidx85.3, align 1, !dbg !1131
  %div87.3 = lshr exact i32 %add106.2, 1, !dbg !1134
  %arrayidx88.3 = getelementptr inbounds nuw i8, ptr %temp, i32 %div87.3, !dbg !1135
  %102 = load i8, ptr %arrayidx88.3, align 1, !dbg !1135
  %103 = and i8 %102, 15, !dbg !1136
  %xor912.3 = xor i8 %101, %103, !dbg !1137
  %arrayidx93.3 = getelementptr inbounds nuw i8, ptr %y, i32 %add106.2, !dbg !1138
  store i8 %xor912.3, ptr %arrayidx93.3, align 1, !dbg !1139
  %add94.3 = or disjoint i32 %add106.2, 1, !dbg !1140
  %arrayidx95.3 = getelementptr inbounds nuw i8, ptr %t, i32 %add94.3, !dbg !1141
  %104 = load i8, ptr %arrayidx95.3, align 1, !dbg !1141
  %105 = lshr i8 %102, 4, !dbg !1142
  %xor1013.3 = xor i8 %104, %105, !dbg !1143
  %add103.3 = or disjoint i32 %add106.2, 1, !dbg !1144
  %arrayidx104.3 = getelementptr inbounds nuw i8, ptr %y, i32 %add103.3, !dbg !1145
  store i8 %xor1013.3, ptr %arrayidx104.3, align 1, !dbg !1146
    #dbg_value(i32 %i80.0, !1129, !DIExpression(DW_OP_plus_uconst, 8, DW_OP_stack_value), !1130)
  %add106.3 = add nuw nsw i32 %i80.0, 8, !dbg !1147
    #dbg_value(i32 %add106.3, !1129, !DIExpression(), !1130)
  %arrayidx85.4 = getelementptr inbounds nuw i8, ptr %t, i32 %add106.3, !dbg !1131
  %106 = load i8, ptr %arrayidx85.4, align 1, !dbg !1131
  %div87.4 = lshr exact i32 %add106.3, 1, !dbg !1134
  %arrayidx88.4 = getelementptr inbounds nuw i8, ptr %temp, i32 %div87.4, !dbg !1135
  %107 = load i8, ptr %arrayidx88.4, align 1, !dbg !1135
  %108 = and i8 %107, 15, !dbg !1136
  %xor912.4 = xor i8 %106, %108, !dbg !1137
  %arrayidx93.4 = getelementptr inbounds nuw i8, ptr %y, i32 %add106.3, !dbg !1138
  store i8 %xor912.4, ptr %arrayidx93.4, align 1, !dbg !1139
  %add94.4 = or disjoint i32 %add106.3, 1, !dbg !1140
  %arrayidx95.4 = getelementptr inbounds nuw i8, ptr %t, i32 %add94.4, !dbg !1141
  %109 = load i8, ptr %arrayidx95.4, align 1, !dbg !1141
  %110 = lshr i8 %107, 4, !dbg !1142
  %xor1013.4 = xor i8 %109, %110, !dbg !1143
  %add103.4 = or disjoint i32 %add106.3, 1, !dbg !1144
  %arrayidx104.4 = getelementptr inbounds nuw i8, ptr %y, i32 %add103.4, !dbg !1145
  store i8 %xor1013.4, ptr %arrayidx104.4, align 1, !dbg !1146
    #dbg_value(i32 %i80.0, !1129, !DIExpression(DW_OP_plus_uconst, 10, DW_OP_stack_value), !1130)
  %add106.4 = add nuw nsw i32 %i80.0, 10, !dbg !1147
    #dbg_value(i32 %add106.4, !1129, !DIExpression(), !1130)
  %arrayidx85.5 = getelementptr inbounds nuw i8, ptr %t, i32 %add106.4, !dbg !1131
  %111 = load i8, ptr %arrayidx85.5, align 1, !dbg !1131
  %div87.5 = lshr exact i32 %add106.4, 1, !dbg !1134
  %arrayidx88.5 = getelementptr inbounds nuw i8, ptr %temp, i32 %div87.5, !dbg !1135
  %112 = load i8, ptr %arrayidx88.5, align 1, !dbg !1135
  %113 = and i8 %112, 15, !dbg !1136
  %xor912.5 = xor i8 %111, %113, !dbg !1137
  %arrayidx93.5 = getelementptr inbounds nuw i8, ptr %y, i32 %add106.4, !dbg !1138
  store i8 %xor912.5, ptr %arrayidx93.5, align 1, !dbg !1139
  %add94.5 = or disjoint i32 %add106.4, 1, !dbg !1140
  %arrayidx95.5 = getelementptr inbounds nuw i8, ptr %t, i32 %add94.5, !dbg !1141
  %114 = load i8, ptr %arrayidx95.5, align 1, !dbg !1141
  %115 = lshr i8 %112, 4, !dbg !1142
  %xor1013.5 = xor i8 %114, %115, !dbg !1143
  %add103.5 = or disjoint i32 %add106.4, 1, !dbg !1144
  %arrayidx104.5 = getelementptr inbounds nuw i8, ptr %y, i32 %add103.5, !dbg !1145
  store i8 %xor1013.5, ptr %arrayidx104.5, align 1, !dbg !1146
    #dbg_value(i32 %i80.0, !1129, !DIExpression(DW_OP_plus_uconst, 12, DW_OP_stack_value), !1130)
  %add106.5 = add nuw nsw i32 %i80.0, 12, !dbg !1147
    #dbg_value(i32 %add106.5, !1129, !DIExpression(), !1130)
  %arrayidx85.6 = getelementptr inbounds nuw i8, ptr %t, i32 %add106.5, !dbg !1131
  %116 = load i8, ptr %arrayidx85.6, align 1, !dbg !1131
  %div87.6 = lshr exact i32 %add106.5, 1, !dbg !1134
  %arrayidx88.6 = getelementptr inbounds nuw i8, ptr %temp, i32 %div87.6, !dbg !1135
  %117 = load i8, ptr %arrayidx88.6, align 1, !dbg !1135
  %118 = and i8 %117, 15, !dbg !1136
  %xor912.6 = xor i8 %116, %118, !dbg !1137
  %arrayidx93.6 = getelementptr inbounds nuw i8, ptr %y, i32 %add106.5, !dbg !1138
  store i8 %xor912.6, ptr %arrayidx93.6, align 1, !dbg !1139
  %add94.6 = or disjoint i32 %add106.5, 1, !dbg !1140
  %arrayidx95.6 = getelementptr inbounds nuw i8, ptr %t, i32 %add94.6, !dbg !1141
  %119 = load i8, ptr %arrayidx95.6, align 1, !dbg !1141
  %120 = lshr i8 %117, 4, !dbg !1142
  %xor1013.6 = xor i8 %119, %120, !dbg !1143
  %add103.6 = or disjoint i32 %add106.5, 1, !dbg !1144
  %arrayidx104.6 = getelementptr inbounds nuw i8, ptr %y, i32 %add103.6, !dbg !1145
  store i8 %xor1013.6, ptr %arrayidx104.6, align 1, !dbg !1146
    #dbg_value(i32 %i80.0, !1129, !DIExpression(DW_OP_plus_uconst, 14, DW_OP_stack_value), !1130)
  %add106.6 = add nuw nsw i32 %i80.0, 14, !dbg !1147
    #dbg_value(i32 %add106.6, !1129, !DIExpression(), !1130)
  %arrayidx85.7 = getelementptr inbounds nuw i8, ptr %t, i32 %add106.6, !dbg !1131
  %121 = load i8, ptr %arrayidx85.7, align 1, !dbg !1131
  %div87.7 = lshr exact i32 %add106.6, 1, !dbg !1134
  %arrayidx88.7 = getelementptr inbounds nuw i8, ptr %temp, i32 %div87.7, !dbg !1135
  %122 = load i8, ptr %arrayidx88.7, align 1, !dbg !1135
  %123 = and i8 %122, 15, !dbg !1136
  %xor912.7 = xor i8 %121, %123, !dbg !1137
  %arrayidx93.7 = getelementptr inbounds nuw i8, ptr %y, i32 %add106.6, !dbg !1138
  store i8 %xor912.7, ptr %arrayidx93.7, align 1, !dbg !1139
  %add94.7 = or disjoint i32 %add106.6, 1, !dbg !1140
  %arrayidx95.7 = getelementptr inbounds nuw i8, ptr %t, i32 %add94.7, !dbg !1141
  %124 = load i8, ptr %arrayidx95.7, align 1, !dbg !1141
  %125 = lshr i8 %122, 4, !dbg !1142
  %xor1013.7 = xor i8 %124, %125, !dbg !1143
  %add103.7 = or disjoint i32 %add106.6, 1, !dbg !1144
  %arrayidx104.7 = getelementptr inbounds nuw i8, ptr %y, i32 %add103.7, !dbg !1145
  store i8 %xor1013.7, ptr %arrayidx104.7, align 1, !dbg !1146
    #dbg_value(i32 %i80.0, !1129, !DIExpression(DW_OP_plus_uconst, 16, DW_OP_stack_value), !1130)
  %cmp82.8 = icmp samesign ult i32 %i80.0, 126, !dbg !1148
  br i1 %cmp82.8, label %for.body84.8, label %for.end107, !dbg !1149

for.body84.8:                                     ; preds = %for.cond81
  %add106.7 = add nuw nsw i32 %i80.0, 16, !dbg !1147
    #dbg_value(i32 %add106.7, !1129, !DIExpression(), !1130)
  %arrayidx85.8 = getelementptr inbounds nuw i8, ptr %t, i32 %add106.7, !dbg !1131
  %126 = load i8, ptr %arrayidx85.8, align 1, !dbg !1131
  %div87.8 = lshr exact i32 %add106.7, 1, !dbg !1134
  %arrayidx88.8 = getelementptr inbounds nuw i8, ptr %temp, i32 %div87.8, !dbg !1135
  %127 = load i8, ptr %arrayidx88.8, align 1, !dbg !1135
  %128 = and i8 %127, 15, !dbg !1136
  %xor912.8 = xor i8 %126, %128, !dbg !1137
  %arrayidx93.8 = getelementptr inbounds nuw i8, ptr %y, i32 %add106.7, !dbg !1138
  store i8 %xor912.8, ptr %arrayidx93.8, align 1, !dbg !1139
  %add94.8 = or disjoint i32 %add106.7, 1, !dbg !1140
  %arrayidx95.8 = getelementptr inbounds nuw i8, ptr %t, i32 %add94.8, !dbg !1141
  %129 = load i8, ptr %arrayidx95.8, align 1, !dbg !1141
  %130 = lshr i8 %127, 4, !dbg !1142
  %xor1013.8 = xor i8 %129, %130, !dbg !1143
  %add103.8 = or disjoint i32 %add106.7, 1, !dbg !1144
  %arrayidx104.8 = getelementptr inbounds nuw i8, ptr %y, i32 %add103.8, !dbg !1145
  store i8 %xor1013.8, ptr %arrayidx104.8, align 1, !dbg !1146
  %add106.8 = add nuw nsw i32 %i80.0, 18, !dbg !1147
    #dbg_value(i32 %add106.8, !1129, !DIExpression(), !1130)
  br label %for.cond81, !dbg !1150, !llvm.loop !1151

for.end107:                                       ; preds = %for.cond81
  ret void, !dbg !1153
}

; Function Attrs: nounwind
define internal fastcc void @compute_A(ptr noundef %p, ptr noundef %VtL, ptr noundef %A_out) unnamed_addr #0 !dbg !1154 {
entry:
  %A = alloca [2592 x i64], align 8
  %tab = alloca [16 x i8], align 1
    #dbg_value(ptr %p, !1157, !DIExpression(), !1158)
    #dbg_value(ptr %VtL, !1159, !DIExpression(), !1158)
    #dbg_value(ptr %A_out, !1160, !DIExpression(), !1158)
    #dbg_value(i32 0, !1161, !DIExpression(), !1158)
    #dbg_value(i32 0, !1162, !DIExpression(), !1158)
    #dbg_value(i32 9, !1163, !DIExpression(), !1158)
    #dbg_declare(ptr %A, !1164, !DIExpression(), !1168)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(20736) %A, i8 0, i32 20736, i1 false), !dbg !1168
    #dbg_value(i32 144, !1169, !DIExpression(), !1158)
    #dbg_value(i64 1, !1170, !DIExpression(), !1173)
    #dbg_value(i64 72057594037927936, !1170, !DIExpression(), !1173)
    #dbg_value(i64 72057594037927935, !1170, !DIExpression(), !1173)
    #dbg_value(i32 0, !1174, !DIExpression(), !1176)
  br label %for.cond, !dbg !1177

for.cond:                                         ; preds = %for.body.4, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc.4, %for.body.4 ], !dbg !1178
    #dbg_value(i32 %i.0, !1174, !DIExpression(), !1176)
  %.idx = mul nuw nsw i32 %i.0, 72, !dbg !1179
  %0 = getelementptr inbounds nuw i8, ptr %VtL, i32 %.idx, !dbg !1179
  %arrayidx = getelementptr inbounds nuw i8, ptr %0, i32 64, !dbg !1179
  %1 = load i64, ptr %arrayidx, align 8, !dbg !1182
  %and = and i64 %1, 72057594037927935, !dbg !1182
  store i64 %and, ptr %arrayidx, align 8, !dbg !1182
    #dbg_value(i32 %i.0, !1174, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1176)
    #dbg_value(i32 %i.0, !1174, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1176)
  %2 = mul nuw i32 %i.0, 72, !dbg !1179
  %3 = getelementptr i8, ptr %VtL, i32 %2, !dbg !1179
  %arrayidx.1 = getelementptr i8, ptr %3, i32 136, !dbg !1179
  %4 = load i64, ptr %arrayidx.1, align 8, !dbg !1182
  %and.1 = and i64 %4, 72057594037927935, !dbg !1182
  store i64 %and.1, ptr %arrayidx.1, align 8, !dbg !1182
    #dbg_value(i32 %i.0, !1174, !DIExpression(DW_OP_plus_uconst, 2, DW_OP_stack_value), !1176)
    #dbg_value(i32 %i.0, !1174, !DIExpression(DW_OP_plus_uconst, 2, DW_OP_stack_value), !1176)
  %5 = mul nuw i32 %i.0, 72, !dbg !1179
  %6 = getelementptr i8, ptr %VtL, i32 %5, !dbg !1179
  %arrayidx.2 = getelementptr i8, ptr %6, i32 208, !dbg !1179
  %7 = load i64, ptr %arrayidx.2, align 8, !dbg !1182
  %and.2 = and i64 %7, 72057594037927935, !dbg !1182
  store i64 %and.2, ptr %arrayidx.2, align 8, !dbg !1182
    #dbg_value(i32 %i.0, !1174, !DIExpression(DW_OP_plus_uconst, 3, DW_OP_stack_value), !1176)
    #dbg_value(i32 %i.0, !1174, !DIExpression(DW_OP_plus_uconst, 3, DW_OP_stack_value), !1176)
  %8 = mul nuw i32 %i.0, 72, !dbg !1179
  %9 = getelementptr i8, ptr %VtL, i32 %8, !dbg !1179
  %arrayidx.3 = getelementptr i8, ptr %9, i32 280, !dbg !1179
  %10 = load i64, ptr %arrayidx.3, align 8, !dbg !1182
  %and.3 = and i64 %10, 72057594037927935, !dbg !1182
  store i64 %and.3, ptr %arrayidx.3, align 8, !dbg !1182
  %inc.3 = add nuw nsw i32 %i.0, 4, !dbg !1183
    #dbg_value(i32 %inc.3, !1174, !DIExpression(), !1176)
  %exitcond.4.not = icmp eq i32 %inc.3, 144, !dbg !1184
  br i1 %exitcond.4.not, label %for.cond3, label %for.body.4, !dbg !1185

for.body.4:                                       ; preds = %for.cond
  %.idx.4 = mul nuw nsw i32 %inc.3, 72, !dbg !1179
  %11 = getelementptr inbounds nuw i8, ptr %VtL, i32 %.idx.4, !dbg !1179
  %arrayidx.4 = getelementptr inbounds nuw i8, ptr %11, i32 64, !dbg !1179
  %12 = load i64, ptr %arrayidx.4, align 8, !dbg !1182
  %and.4 = and i64 %12, 72057594037927935, !dbg !1182
  store i64 %and.4, ptr %arrayidx.4, align 8, !dbg !1182
  %inc.4 = add nuw nsw i32 %i.0, 5, !dbg !1183
    #dbg_value(i32 %inc.4, !1174, !DIExpression(), !1176)
  br label %for.cond, !dbg !1186, !llvm.loop !1187

for.cond3:                                        ; preds = %for.cond, %for.inc103
  %i2.0 = phi i32 [ %inc104, %for.inc103 ], [ 0, %for.cond ], !dbg !1189
  %words_to_shift.0 = phi i32 [ %words_to_shift.1, %for.inc103 ], [ 0, %for.cond ], !dbg !1191
  %bits_to_shift.0 = phi i32 [ %bits_to_shift.1, %for.inc103 ], [ 0, %for.cond ], !dbg !1192
    #dbg_value(i32 %bits_to_shift.0, !1161, !DIExpression(), !1158)
    #dbg_value(i32 %words_to_shift.0, !1162, !DIExpression(), !1158)
    #dbg_value(i32 %i2.0, !1193, !DIExpression(), !1194)
  %exitcond8.not = icmp eq i32 %i2.0, 12, !dbg !1195
  br i1 %exitcond8.not, label %for.cond107, label %for.cond6, !dbg !1197

for.cond6:                                        ; preds = %for.cond3, %if.end95
  %j.0 = phi i32 [ %dec, %if.end95 ], [ 11, %for.cond3 ], !dbg !1198
  %words_to_shift.1 = phi i32 [ %spec.select, %if.end95 ], [ %words_to_shift.0, %for.cond3 ], !dbg !1158
  %bits_to_shift.1 = phi i32 [ %spec.select3, %if.end95 ], [ %bits_to_shift.0, %for.cond3 ], !dbg !1158
    #dbg_value(i32 %bits_to_shift.1, !1161, !DIExpression(), !1158)
    #dbg_value(i32 %words_to_shift.1, !1162, !DIExpression(), !1158)
    #dbg_value(i32 %j.0, !1201, !DIExpression(), !1202)
  %cmp7.not = icmp slt i32 %j.0, %i2.0, !dbg !1203
  br i1 %cmp7.not, label %for.inc103, label %for.body8, !dbg !1205

for.body8:                                        ; preds = %for.cond6
  %add.ptr.idx = mul nsw i32 %j.0, 864, !dbg !1206
  %add.ptr = getelementptr inbounds i8, ptr %VtL, i32 %add.ptr.idx, !dbg !1206
    #dbg_value(ptr %add.ptr, !1208, !DIExpression(), !1158)
    #dbg_value(i32 0, !1209, !DIExpression(), !1211)
  br label %for.cond11, !dbg !1212

for.cond11:                                       ; preds = %for.inc44.1, %for.body8
  %c.0 = phi i32 [ 0, %for.body8 ], [ %inc45.1, %for.inc44.1 ], !dbg !1213
    #dbg_value(i32 %c.0, !1209, !DIExpression(), !1211)
  %exitcond5.not = icmp eq i32 %c.0, 12, !dbg !1214
  br i1 %exitcond5.not, label %for.end46, label %for.cond14, !dbg !1216

for.cond14:                                       ; preds = %for.cond11, %for.inc41.1
  %k.0 = phi i32 [ %inc42.1, %for.inc41.1 ], [ 0, %for.cond11 ], !dbg !1217
    #dbg_value(i32 %k.0, !1220, !DIExpression(), !1221)
  %13 = getelementptr inbounds nuw i64, ptr %add.ptr, i32 %k.0, !dbg !1222
  %arrayidx19.idx = mul nuw nsw i32 %c.0, 72, !dbg !1222
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %13, i32 %arrayidx19.idx, !dbg !1222
  %14 = load i64, ptr %arrayidx19, align 8, !dbg !1222
  %sh_prom = zext nneg i32 %bits_to_shift.1 to i64, !dbg !1225
  %shl20 = shl i64 %14, %sh_prom, !dbg !1225
  %mul21 = mul nuw nsw i32 %i2.0, 12, !dbg !1226
  %add22 = add nuw nsw i32 %mul21, %c.0, !dbg !1227
  %add23 = add nsw i32 %k.0, %words_to_shift.1, !dbg !1228
  %mul24 = mul i32 %add23, 144, !dbg !1229
  %add25 = add i32 %add22, %mul24, !dbg !1230
  %arrayidx26 = getelementptr inbounds nuw [2592 x i64], ptr %A, i32 0, i32 %add25, !dbg !1231
  %15 = load i64, ptr %arrayidx26, align 8, !dbg !1232
  %xor = xor i64 %15, %shl20, !dbg !1232
  store i64 %xor, ptr %arrayidx26, align 8, !dbg !1232
  %cmp27 = icmp sgt i32 %bits_to_shift.1, 0, !dbg !1233
  br i1 %cmp27, label %if.then, label %for.inc41, !dbg !1233

if.then:                                          ; preds = %for.cond14
  %sub31 = sub nsw i32 64, %bits_to_shift.1, !dbg !1235
  %sh_prom32 = zext nneg i32 %sub31 to i64, !dbg !1237
  %shr = lshr i64 %14, %sh_prom32, !dbg !1237
  %mul33 = mul nuw nsw i32 %i2.0, 12, !dbg !1238
  %add34 = add nuw nsw i32 %mul33, %c.0, !dbg !1239
  %add35 = add nsw i32 %k.0, %words_to_shift.1, !dbg !1240
  %16 = mul i32 %add35, 144, !dbg !1241
  %mul37 = add i32 %16, 144, !dbg !1241
  %add38 = add i32 %add34, %mul37, !dbg !1242
  %arrayidx39 = getelementptr inbounds nuw [2592 x i64], ptr %A, i32 0, i32 %add38, !dbg !1243
  %17 = load i64, ptr %arrayidx39, align 8, !dbg !1244
  %xor40 = xor i64 %17, %shr, !dbg !1244
  store i64 %xor40, ptr %arrayidx39, align 8, !dbg !1244
  br label %for.inc41, !dbg !1245

for.inc41:                                        ; preds = %for.cond14, %if.then
  %inc42 = or disjoint i32 %k.0, 1, !dbg !1246
    #dbg_value(i32 %inc42, !1220, !DIExpression(), !1221)
  %exitcond4.1.not = icmp eq i32 %k.0, 8, !dbg !1247
  br i1 %exitcond4.1.not, label %for.inc44, label %for.body16.1, !dbg !1248

for.body16.1:                                     ; preds = %for.inc41
  %18 = getelementptr inbounds nuw i64, ptr %add.ptr, i32 %inc42, !dbg !1222
  %arrayidx19.idx.1 = mul nuw nsw i32 %c.0, 72, !dbg !1222
  %arrayidx19.1 = getelementptr inbounds nuw i8, ptr %18, i32 %arrayidx19.idx.1, !dbg !1222
  %19 = load i64, ptr %arrayidx19.1, align 8, !dbg !1222
  %sh_prom.1 = zext nneg i32 %bits_to_shift.1 to i64, !dbg !1225
  %shl20.1 = shl i64 %19, %sh_prom.1, !dbg !1225
  %mul21.1 = mul nuw nsw i32 %i2.0, 12, !dbg !1226
  %add22.1 = add nuw nsw i32 %mul21.1, %c.0, !dbg !1227
  %add23.1 = add nsw i32 %inc42, %words_to_shift.1, !dbg !1228
  %mul24.1 = mul i32 %add23.1, 144, !dbg !1229
  %add25.1 = add i32 %add22.1, %mul24.1, !dbg !1230
  %arrayidx26.1 = getelementptr inbounds nuw [2592 x i64], ptr %A, i32 0, i32 %add25.1, !dbg !1231
  %20 = load i64, ptr %arrayidx26.1, align 8, !dbg !1232
  %xor.1 = xor i64 %20, %shl20.1, !dbg !1232
  store i64 %xor.1, ptr %arrayidx26.1, align 8, !dbg !1232
  %cmp27.1 = icmp sgt i32 %bits_to_shift.1, 0, !dbg !1233
  br i1 %cmp27.1, label %if.then.1, label %for.inc41.1, !dbg !1233

if.then.1:                                        ; preds = %for.body16.1
  %sub31.1 = sub nsw i32 64, %bits_to_shift.1, !dbg !1235
  %sh_prom32.1 = zext nneg i32 %sub31.1 to i64, !dbg !1237
  %shr.1 = lshr i64 %19, %sh_prom32.1, !dbg !1237
  %mul33.1 = mul nuw nsw i32 %i2.0, 12, !dbg !1238
  %add34.1 = add nuw nsw i32 %mul33.1, %c.0, !dbg !1239
  %add35.1 = add nsw i32 %inc42, %words_to_shift.1, !dbg !1240
  %21 = mul i32 %add35.1, 144, !dbg !1241
  %mul37.1 = add i32 %21, 144, !dbg !1241
  %add38.1 = add i32 %add34.1, %mul37.1, !dbg !1242
  %arrayidx39.1 = getelementptr inbounds nuw [2592 x i64], ptr %A, i32 0, i32 %add38.1, !dbg !1243
  %22 = load i64, ptr %arrayidx39.1, align 8, !dbg !1244
  %xor40.1 = xor i64 %22, %shr.1, !dbg !1244
  store i64 %xor40.1, ptr %arrayidx39.1, align 8, !dbg !1244
  br label %for.inc41.1, !dbg !1245

for.inc41.1:                                      ; preds = %if.then.1, %for.body16.1
  %inc42.1 = add nuw nsw i32 %k.0, 2, !dbg !1246
    #dbg_value(i32 %inc42.1, !1220, !DIExpression(), !1221)
  br label %for.cond14, !dbg !1249, !llvm.loop !1250

for.inc44:                                        ; preds = %for.inc41
  %inc45 = or disjoint i32 %c.0, 1, !dbg !1252
    #dbg_value(i32 %inc45, !1209, !DIExpression(), !1211)
  br label %for.cond14.1, !dbg !1248

for.cond14.1:                                     ; preds = %for.inc41.1.1, %for.inc44
  %k.0.1 = phi i32 [ 0, %for.inc44 ], [ %inc42.1.1, %for.inc41.1.1 ], !dbg !1217
    #dbg_value(i32 %k.0.1, !1220, !DIExpression(), !1221)
  %23 = getelementptr inbounds nuw i64, ptr %add.ptr, i32 %k.0.1, !dbg !1222
  %arrayidx19.idx.113 = mul nuw nsw i32 %inc45, 72, !dbg !1222
  %arrayidx19.114 = getelementptr inbounds nuw i8, ptr %23, i32 %arrayidx19.idx.113, !dbg !1222
  %24 = load i64, ptr %arrayidx19.114, align 8, !dbg !1222
  %sh_prom.115 = zext nneg i32 %bits_to_shift.1 to i64, !dbg !1225
  %shl20.116 = shl i64 %24, %sh_prom.115, !dbg !1225
  %mul21.117 = mul nuw nsw i32 %i2.0, 12, !dbg !1226
  %add22.118 = add nuw nsw i32 %mul21.117, %inc45, !dbg !1227
  %add23.119 = add nsw i32 %k.0.1, %words_to_shift.1, !dbg !1228
  %mul24.120 = mul i32 %add23.119, 144, !dbg !1229
  %add25.121 = add i32 %add22.118, %mul24.120, !dbg !1230
  %arrayidx26.122 = getelementptr inbounds nuw [2592 x i64], ptr %A, i32 0, i32 %add25.121, !dbg !1231
  %25 = load i64, ptr %arrayidx26.122, align 8, !dbg !1232
  %xor.123 = xor i64 %25, %shl20.116, !dbg !1232
  store i64 %xor.123, ptr %arrayidx26.122, align 8, !dbg !1232
  %cmp27.124 = icmp sgt i32 %bits_to_shift.1, 0, !dbg !1233
  br i1 %cmp27.124, label %if.then.136, label %for.inc41.138, !dbg !1233

if.then.136:                                      ; preds = %for.cond14.1
  %sub31.126 = sub nsw i32 64, %bits_to_shift.1, !dbg !1235
  %sh_prom32.127 = zext nneg i32 %sub31.126 to i64, !dbg !1237
  %shr.128 = lshr i64 %24, %sh_prom32.127, !dbg !1237
  %mul33.129 = mul nuw nsw i32 %i2.0, 12, !dbg !1238
  %add34.130 = add nuw nsw i32 %mul33.129, %inc45, !dbg !1239
  %add35.131 = add nsw i32 %k.0.1, %words_to_shift.1, !dbg !1240
  %26 = mul i32 %add35.131, 144, !dbg !1241
  %mul37.132 = add i32 %26, 144, !dbg !1241
  %add38.133 = add i32 %add34.130, %mul37.132, !dbg !1242
  %arrayidx39.134 = getelementptr inbounds nuw [2592 x i64], ptr %A, i32 0, i32 %add38.133, !dbg !1243
  %27 = load i64, ptr %arrayidx39.134, align 8, !dbg !1244
  %xor40.135 = xor i64 %27, %shr.128, !dbg !1244
  store i64 %xor40.135, ptr %arrayidx39.134, align 8, !dbg !1244
  br label %for.inc41.138, !dbg !1245

for.inc41.138:                                    ; preds = %if.then.136, %for.cond14.1
  %inc42.137 = or disjoint i32 %k.0.1, 1, !dbg !1246
    #dbg_value(i32 %inc42.137, !1220, !DIExpression(), !1221)
  %exitcond4.1.1.not = icmp eq i32 %k.0.1, 8, !dbg !1247
  br i1 %exitcond4.1.1.not, label %for.inc44.1, label %for.body16.1.1, !dbg !1248

for.inc44.1:                                      ; preds = %for.inc41.138
  %inc45.1 = add nuw nsw i32 %c.0, 2, !dbg !1252
    #dbg_value(i32 %inc45.1, !1209, !DIExpression(), !1211)
  br label %for.cond11, !dbg !1253, !llvm.loop !1254

for.body16.1.1:                                   ; preds = %for.inc41.138
  %28 = getelementptr inbounds nuw i64, ptr %add.ptr, i32 %inc42.137, !dbg !1222
  %arrayidx19.idx.1.1 = mul nuw nsw i32 %inc45, 72, !dbg !1222
  %arrayidx19.1.1 = getelementptr inbounds nuw i8, ptr %28, i32 %arrayidx19.idx.1.1, !dbg !1222
  %29 = load i64, ptr %arrayidx19.1.1, align 8, !dbg !1222
  %sh_prom.1.1 = zext nneg i32 %bits_to_shift.1 to i64, !dbg !1225
  %shl20.1.1 = shl i64 %29, %sh_prom.1.1, !dbg !1225
  %mul21.1.1 = mul nuw nsw i32 %i2.0, 12, !dbg !1226
  %add22.1.1 = add nuw nsw i32 %mul21.1.1, %inc45, !dbg !1227
  %add23.1.1 = add nsw i32 %inc42.137, %words_to_shift.1, !dbg !1228
  %mul24.1.1 = mul i32 %add23.1.1, 144, !dbg !1229
  %add25.1.1 = add i32 %add22.1.1, %mul24.1.1, !dbg !1230
  %arrayidx26.1.1 = getelementptr inbounds nuw [2592 x i64], ptr %A, i32 0, i32 %add25.1.1, !dbg !1231
  %30 = load i64, ptr %arrayidx26.1.1, align 8, !dbg !1232
  %xor.1.1 = xor i64 %30, %shl20.1.1, !dbg !1232
  store i64 %xor.1.1, ptr %arrayidx26.1.1, align 8, !dbg !1232
  %cmp27.1.1 = icmp sgt i32 %bits_to_shift.1, 0, !dbg !1233
  br i1 %cmp27.1.1, label %if.then.1.1, label %for.inc41.1.1, !dbg !1233

if.then.1.1:                                      ; preds = %for.body16.1.1
  %sub31.1.1 = sub nsw i32 64, %bits_to_shift.1, !dbg !1235
  %sh_prom32.1.1 = zext nneg i32 %sub31.1.1 to i64, !dbg !1237
  %shr.1.1 = lshr i64 %29, %sh_prom32.1.1, !dbg !1237
  %mul33.1.1 = mul nuw nsw i32 %i2.0, 12, !dbg !1238
  %add34.1.1 = add nuw nsw i32 %mul33.1.1, %inc45, !dbg !1239
  %add35.1.1 = add nsw i32 %inc42.137, %words_to_shift.1, !dbg !1240
  %31 = mul i32 %add35.1.1, 144, !dbg !1241
  %mul37.1.1 = add i32 %31, 144, !dbg !1241
  %add38.1.1 = add i32 %add34.1.1, %mul37.1.1, !dbg !1242
  %arrayidx39.1.1 = getelementptr inbounds nuw [2592 x i64], ptr %A, i32 0, i32 %add38.1.1, !dbg !1243
  %32 = load i64, ptr %arrayidx39.1.1, align 8, !dbg !1244
  %xor40.1.1 = xor i64 %32, %shr.1.1, !dbg !1244
  store i64 %xor40.1.1, ptr %arrayidx39.1.1, align 8, !dbg !1244
  br label %for.inc41.1.1, !dbg !1245

for.inc41.1.1:                                    ; preds = %if.then.1.1, %for.body16.1.1
  %inc42.1.1 = add nuw nsw i32 %k.0.1, 2, !dbg !1246
    #dbg_value(i32 %inc42.1.1, !1220, !DIExpression(), !1221)
  br label %for.cond14.1, !dbg !1249, !llvm.loop !1250

for.end46:                                        ; preds = %for.cond11
  %cmp47.not = icmp eq i32 %i2.0, %j.0, !dbg !1256
  br i1 %cmp47.not, label %if.end95, label %if.then48, !dbg !1256

if.then48:                                        ; preds = %for.end46
  %add.ptr51.idx = mul nuw nsw i32 %i2.0, 864, !dbg !1258
  %add.ptr51 = getelementptr inbounds nuw i8, ptr %VtL, i32 %add.ptr51.idx, !dbg !1258
    #dbg_value(ptr %add.ptr51, !1260, !DIExpression(), !1158)
    #dbg_value(i32 0, !1261, !DIExpression(), !1263)
  br label %for.cond53, !dbg !1264

for.cond53:                                       ; preds = %for.inc92.1, %if.then48
  %c52.0 = phi i32 [ 0, %if.then48 ], [ %inc93.1, %for.inc92.1 ], !dbg !1265
    #dbg_value(i32 %c52.0, !1261, !DIExpression(), !1263)
  %exitcond7.not = icmp eq i32 %c52.0, 12, !dbg !1266
  br i1 %exitcond7.not, label %if.end95, label %for.cond57, !dbg !1268

for.cond57:                                       ; preds = %for.cond53, %for.inc89.1
  %k56.0 = phi i32 [ %inc90.1, %for.inc89.1 ], [ 0, %for.cond53 ], !dbg !1269
    #dbg_value(i32 %k56.0, !1272, !DIExpression(), !1273)
  %33 = getelementptr inbounds nuw i64, ptr %add.ptr51, i32 %k56.0, !dbg !1274
  %arrayidx62.idx = mul nuw nsw i32 %c52.0, 72, !dbg !1274
  %arrayidx62 = getelementptr inbounds nuw i8, ptr %33, i32 %arrayidx62.idx, !dbg !1274
  %34 = load i64, ptr %arrayidx62, align 8, !dbg !1274
  %sh_prom63 = zext nneg i32 %bits_to_shift.1 to i64, !dbg !1277
  %shl64 = shl i64 %34, %sh_prom63, !dbg !1277
  %mul65 = mul nsw i32 %j.0, 12, !dbg !1278
  %add66 = add nsw i32 %mul65, %c52.0, !dbg !1279
  %add67 = add nsw i32 %k56.0, %words_to_shift.1, !dbg !1280
  %mul68 = mul i32 %add67, 144, !dbg !1281
  %add69 = add i32 %add66, %mul68, !dbg !1282
  %arrayidx70 = getelementptr inbounds nuw [2592 x i64], ptr %A, i32 0, i32 %add69, !dbg !1283
  %35 = load i64, ptr %arrayidx70, align 8, !dbg !1284
  %xor71 = xor i64 %35, %shl64, !dbg !1284
  store i64 %xor71, ptr %arrayidx70, align 8, !dbg !1284
  %cmp72 = icmp sgt i32 %bits_to_shift.1, 0, !dbg !1285
  br i1 %cmp72, label %if.then73, label %for.inc89, !dbg !1285

if.then73:                                        ; preds = %for.cond57
  %sub77 = sub nsw i32 64, %bits_to_shift.1, !dbg !1287
  %sh_prom78 = zext nneg i32 %sub77 to i64, !dbg !1289
  %shr79 = lshr i64 %34, %sh_prom78, !dbg !1289
  %mul80 = mul nsw i32 %j.0, 12, !dbg !1290
  %add81 = add nsw i32 %mul80, %c52.0, !dbg !1291
  %add82 = add nsw i32 %k56.0, %words_to_shift.1, !dbg !1292
  %36 = mul i32 %add82, 144, !dbg !1293
  %mul84 = add i32 %36, 144, !dbg !1293
  %add85 = add i32 %add81, %mul84, !dbg !1294
  %arrayidx86 = getelementptr inbounds nuw [2592 x i64], ptr %A, i32 0, i32 %add85, !dbg !1295
  %37 = load i64, ptr %arrayidx86, align 8, !dbg !1296
  %xor87 = xor i64 %37, %shr79, !dbg !1296
  store i64 %xor87, ptr %arrayidx86, align 8, !dbg !1296
  br label %for.inc89, !dbg !1297

for.inc89:                                        ; preds = %for.cond57, %if.then73
  %inc90 = or disjoint i32 %k56.0, 1, !dbg !1298
    #dbg_value(i32 %inc90, !1272, !DIExpression(), !1273)
  %exitcond6.1.not = icmp eq i32 %k56.0, 8, !dbg !1299
  br i1 %exitcond6.1.not, label %for.inc92, label %for.body59.1, !dbg !1300

for.body59.1:                                     ; preds = %for.inc89
  %38 = getelementptr inbounds nuw i64, ptr %add.ptr51, i32 %inc90, !dbg !1274
  %arrayidx62.idx.1 = mul nuw nsw i32 %c52.0, 72, !dbg !1274
  %arrayidx62.1 = getelementptr inbounds nuw i8, ptr %38, i32 %arrayidx62.idx.1, !dbg !1274
  %39 = load i64, ptr %arrayidx62.1, align 8, !dbg !1274
  %sh_prom63.1 = zext nneg i32 %bits_to_shift.1 to i64, !dbg !1277
  %shl64.1 = shl i64 %39, %sh_prom63.1, !dbg !1277
  %mul65.1 = mul nsw i32 %j.0, 12, !dbg !1278
  %add66.1 = add nsw i32 %mul65.1, %c52.0, !dbg !1279
  %add67.1 = add nsw i32 %inc90, %words_to_shift.1, !dbg !1280
  %mul68.1 = mul i32 %add67.1, 144, !dbg !1281
  %add69.1 = add i32 %add66.1, %mul68.1, !dbg !1282
  %arrayidx70.1 = getelementptr inbounds nuw [2592 x i64], ptr %A, i32 0, i32 %add69.1, !dbg !1283
  %40 = load i64, ptr %arrayidx70.1, align 8, !dbg !1284
  %xor71.1 = xor i64 %40, %shl64.1, !dbg !1284
  store i64 %xor71.1, ptr %arrayidx70.1, align 8, !dbg !1284
  %cmp72.1 = icmp sgt i32 %bits_to_shift.1, 0, !dbg !1285
  br i1 %cmp72.1, label %if.then73.1, label %for.inc89.1, !dbg !1285

if.then73.1:                                      ; preds = %for.body59.1
  %sub77.1 = sub nsw i32 64, %bits_to_shift.1, !dbg !1287
  %sh_prom78.1 = zext nneg i32 %sub77.1 to i64, !dbg !1289
  %shr79.1 = lshr i64 %39, %sh_prom78.1, !dbg !1289
  %mul80.1 = mul nsw i32 %j.0, 12, !dbg !1290
  %add81.1 = add nsw i32 %mul80.1, %c52.0, !dbg !1291
  %add82.1 = add nsw i32 %inc90, %words_to_shift.1, !dbg !1292
  %41 = mul i32 %add82.1, 144, !dbg !1293
  %mul84.1 = add i32 %41, 144, !dbg !1293
  %add85.1 = add i32 %add81.1, %mul84.1, !dbg !1294
  %arrayidx86.1 = getelementptr inbounds nuw [2592 x i64], ptr %A, i32 0, i32 %add85.1, !dbg !1295
  %42 = load i64, ptr %arrayidx86.1, align 8, !dbg !1296
  %xor87.1 = xor i64 %42, %shr79.1, !dbg !1296
  store i64 %xor87.1, ptr %arrayidx86.1, align 8, !dbg !1296
  br label %for.inc89.1, !dbg !1297

for.inc89.1:                                      ; preds = %if.then73.1, %for.body59.1
  %inc90.1 = add nuw nsw i32 %k56.0, 2, !dbg !1298
    #dbg_value(i32 %inc90.1, !1272, !DIExpression(), !1273)
  br label %for.cond57, !dbg !1301, !llvm.loop !1302

for.inc92:                                        ; preds = %for.inc89
  %inc93 = or disjoint i32 %c52.0, 1, !dbg !1304
    #dbg_value(i32 %inc93, !1261, !DIExpression(), !1263)
  br label %for.cond57.1, !dbg !1300

for.cond57.1:                                     ; preds = %for.inc89.1.1, %for.inc92
  %k56.0.1 = phi i32 [ 0, %for.inc92 ], [ %inc90.1.1, %for.inc89.1.1 ], !dbg !1269
    #dbg_value(i32 %k56.0.1, !1272, !DIExpression(), !1273)
  %43 = getelementptr inbounds nuw i64, ptr %add.ptr51, i32 %k56.0.1, !dbg !1274
  %arrayidx62.idx.139 = mul nuw nsw i32 %inc93, 72, !dbg !1274
  %arrayidx62.140 = getelementptr inbounds nuw i8, ptr %43, i32 %arrayidx62.idx.139, !dbg !1274
  %44 = load i64, ptr %arrayidx62.140, align 8, !dbg !1274
  %sh_prom63.141 = zext nneg i32 %bits_to_shift.1 to i64, !dbg !1277
  %shl64.142 = shl i64 %44, %sh_prom63.141, !dbg !1277
  %mul65.143 = mul nsw i32 %j.0, 12, !dbg !1278
  %add66.144 = add nsw i32 %mul65.143, %inc93, !dbg !1279
  %add67.145 = add nsw i32 %k56.0.1, %words_to_shift.1, !dbg !1280
  %mul68.146 = mul i32 %add67.145, 144, !dbg !1281
  %add69.147 = add i32 %add66.144, %mul68.146, !dbg !1282
  %arrayidx70.148 = getelementptr inbounds nuw [2592 x i64], ptr %A, i32 0, i32 %add69.147, !dbg !1283
  %45 = load i64, ptr %arrayidx70.148, align 8, !dbg !1284
  %xor71.149 = xor i64 %45, %shl64.142, !dbg !1284
  store i64 %xor71.149, ptr %arrayidx70.148, align 8, !dbg !1284
  %cmp72.150 = icmp sgt i32 %bits_to_shift.1, 0, !dbg !1285
  br i1 %cmp72.150, label %if.then73.162, label %for.inc89.164, !dbg !1285

if.then73.162:                                    ; preds = %for.cond57.1
  %sub77.152 = sub nsw i32 64, %bits_to_shift.1, !dbg !1287
  %sh_prom78.153 = zext nneg i32 %sub77.152 to i64, !dbg !1289
  %shr79.154 = lshr i64 %44, %sh_prom78.153, !dbg !1289
  %mul80.155 = mul nsw i32 %j.0, 12, !dbg !1290
  %add81.156 = add nsw i32 %mul80.155, %inc93, !dbg !1291
  %add82.157 = add nsw i32 %k56.0.1, %words_to_shift.1, !dbg !1292
  %46 = mul i32 %add82.157, 144, !dbg !1293
  %mul84.158 = add i32 %46, 144, !dbg !1293
  %add85.159 = add i32 %add81.156, %mul84.158, !dbg !1294
  %arrayidx86.160 = getelementptr inbounds nuw [2592 x i64], ptr %A, i32 0, i32 %add85.159, !dbg !1295
  %47 = load i64, ptr %arrayidx86.160, align 8, !dbg !1296
  %xor87.161 = xor i64 %47, %shr79.154, !dbg !1296
  store i64 %xor87.161, ptr %arrayidx86.160, align 8, !dbg !1296
  br label %for.inc89.164, !dbg !1297

for.inc89.164:                                    ; preds = %if.then73.162, %for.cond57.1
  %inc90.163 = or disjoint i32 %k56.0.1, 1, !dbg !1298
    #dbg_value(i32 %inc90.163, !1272, !DIExpression(), !1273)
  %exitcond6.1.1.not = icmp eq i32 %k56.0.1, 8, !dbg !1299
  br i1 %exitcond6.1.1.not, label %for.inc92.1, label %for.body59.1.1, !dbg !1300

for.inc92.1:                                      ; preds = %for.inc89.164
  %inc93.1 = add nuw nsw i32 %c52.0, 2, !dbg !1304
    #dbg_value(i32 %inc93.1, !1261, !DIExpression(), !1263)
  br label %for.cond53, !dbg !1305, !llvm.loop !1306

for.body59.1.1:                                   ; preds = %for.inc89.164
  %48 = getelementptr inbounds nuw i64, ptr %add.ptr51, i32 %inc90.163, !dbg !1274
  %arrayidx62.idx.1.1 = mul nuw nsw i32 %inc93, 72, !dbg !1274
  %arrayidx62.1.1 = getelementptr inbounds nuw i8, ptr %48, i32 %arrayidx62.idx.1.1, !dbg !1274
  %49 = load i64, ptr %arrayidx62.1.1, align 8, !dbg !1274
  %sh_prom63.1.1 = zext nneg i32 %bits_to_shift.1 to i64, !dbg !1277
  %shl64.1.1 = shl i64 %49, %sh_prom63.1.1, !dbg !1277
  %mul65.1.1 = mul nsw i32 %j.0, 12, !dbg !1278
  %add66.1.1 = add nsw i32 %mul65.1.1, %inc93, !dbg !1279
  %add67.1.1 = add nsw i32 %inc90.163, %words_to_shift.1, !dbg !1280
  %mul68.1.1 = mul i32 %add67.1.1, 144, !dbg !1281
  %add69.1.1 = add i32 %add66.1.1, %mul68.1.1, !dbg !1282
  %arrayidx70.1.1 = getelementptr inbounds nuw [2592 x i64], ptr %A, i32 0, i32 %add69.1.1, !dbg !1283
  %50 = load i64, ptr %arrayidx70.1.1, align 8, !dbg !1284
  %xor71.1.1 = xor i64 %50, %shl64.1.1, !dbg !1284
  store i64 %xor71.1.1, ptr %arrayidx70.1.1, align 8, !dbg !1284
  %cmp72.1.1 = icmp sgt i32 %bits_to_shift.1, 0, !dbg !1285
  br i1 %cmp72.1.1, label %if.then73.1.1, label %for.inc89.1.1, !dbg !1285

if.then73.1.1:                                    ; preds = %for.body59.1.1
  %sub77.1.1 = sub nsw i32 64, %bits_to_shift.1, !dbg !1287
  %sh_prom78.1.1 = zext nneg i32 %sub77.1.1 to i64, !dbg !1289
  %shr79.1.1 = lshr i64 %49, %sh_prom78.1.1, !dbg !1289
  %mul80.1.1 = mul nsw i32 %j.0, 12, !dbg !1290
  %add81.1.1 = add nsw i32 %mul80.1.1, %inc93, !dbg !1291
  %add82.1.1 = add nsw i32 %inc90.163, %words_to_shift.1, !dbg !1292
  %51 = mul i32 %add82.1.1, 144, !dbg !1293
  %mul84.1.1 = add i32 %51, 144, !dbg !1293
  %add85.1.1 = add i32 %add81.1.1, %mul84.1.1, !dbg !1294
  %arrayidx86.1.1 = getelementptr inbounds nuw [2592 x i64], ptr %A, i32 0, i32 %add85.1.1, !dbg !1295
  %52 = load i64, ptr %arrayidx86.1.1, align 8, !dbg !1296
  %xor87.1.1 = xor i64 %52, %shr79.1.1, !dbg !1296
  store i64 %xor87.1.1, ptr %arrayidx86.1.1, align 8, !dbg !1296
  br label %for.inc89.1.1, !dbg !1297

for.inc89.1.1:                                    ; preds = %if.then73.1.1, %for.body59.1.1
  %inc90.1.1 = add nuw nsw i32 %k56.0.1, 2, !dbg !1298
    #dbg_value(i32 %inc90.1.1, !1272, !DIExpression(), !1273)
  br label %for.cond57.1, !dbg !1301, !llvm.loop !1302

if.end95:                                         ; preds = %for.cond53, %for.end46
  %add96 = add nsw i32 %bits_to_shift.1, 4, !dbg !1308
    #dbg_value(i32 %add96, !1161, !DIExpression(), !1158)
  %cmp97 = icmp eq i32 %add96, 64, !dbg !1309
  %inc99 = zext i1 %cmp97 to i32, !dbg !1309
  %spec.select = add nsw i32 %words_to_shift.1, %inc99, !dbg !1309
  %spec.select3 = select i1 %cmp97, i32 0, i32 %add96, !dbg !1309
    #dbg_value(i32 %spec.select3, !1161, !DIExpression(), !1158)
    #dbg_value(i32 %spec.select, !1162, !DIExpression(), !1158)
  %dec = add nsw i32 %j.0, -1, !dbg !1311
    #dbg_value(i32 %dec, !1201, !DIExpression(), !1202)
  br label %for.cond6, !dbg !1312, !llvm.loop !1313

for.inc103:                                       ; preds = %for.cond6
  %inc104 = add nuw nsw i32 %i2.0, 1, !dbg !1315
    #dbg_value(i32 %inc104, !1193, !DIExpression(), !1194)
  br label %for.cond3, !dbg !1316, !llvm.loop !1317

for.cond107:                                      ; preds = %for.cond3, %for.body110
  %c106.0 = phi i32 [ %add113, %for.body110 ], [ 0, %for.cond3 ], !dbg !1319
    #dbg_value(i32 %c106.0, !1321, !DIExpression(), !1322)
  %cmp109 = icmp samesign ult i32 %c106.0, 2016, !dbg !1323
  br i1 %cmp109, label %for.body110, label %for.end114, !dbg !1325

for.body110:                                      ; preds = %for.cond107
  %add.ptr111 = getelementptr inbounds nuw i64, ptr %A, i32 %c106.0, !dbg !1326
  call fastcc void @transpose_16x16_nibbles(ptr noundef nonnull %add.ptr111) #6, !dbg !1328
  %add113 = add nuw nsw i32 %c106.0, 16, !dbg !1329
    #dbg_value(i32 %add113, !1321, !DIExpression(), !1322)
  br label %for.cond107, !dbg !1330, !llvm.loop !1331

for.end114:                                       ; preds = %for.cond107
    #dbg_declare(ptr %tab, !1333, !DIExpression(), !1337)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(16) %tab, i8 0, i32 16, i1 false), !dbg !1337
    #dbg_value(i32 0, !1338, !DIExpression(), !1340)
  br label %for.cond116, !dbg !1341

for.cond116:                                      ; preds = %for.body118, %for.end114
  %i115.0 = phi i32 [ 0, %for.end114 ], [ %inc138.3, %for.body118 ], !dbg !1342
    #dbg_value(i32 %i115.0, !1338, !DIExpression(), !1340)
  %exitcond9.not = icmp eq i32 %i115.0, 4, !dbg !1343
  br i1 %exitcond9.not, label %for.cond141, label %for.body118, !dbg !1345

for.body118:                                      ; preds = %for.cond116
  %arrayidx119 = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %i115.0, !dbg !1346
  %53 = load i8, ptr %arrayidx119, align 1, !dbg !1346
  %call = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %53, i8 noundef zeroext 1) #6, !dbg !1348
  %mul120 = shl nuw nsw i32 %i115.0, 2, !dbg !1349
  %arrayidx121 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %mul120, !dbg !1350
  store i8 %call, ptr %arrayidx121, align 1, !dbg !1351
  %call123 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %53, i8 noundef zeroext 2) #6, !dbg !1352
  %mul124 = shl nuw nsw i32 %i115.0, 2, !dbg !1353
  %add125 = or disjoint i32 %mul124, 1, !dbg !1354
  %arrayidx126 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add125, !dbg !1355
  store i8 %call123, ptr %arrayidx126, align 1, !dbg !1356
  %call128 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %53, i8 noundef zeroext 4) #6, !dbg !1357
  %mul129 = shl nuw nsw i32 %i115.0, 2, !dbg !1358
  %add130 = or disjoint i32 %mul129, 2, !dbg !1359
  %arrayidx131 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add130, !dbg !1360
  store i8 %call128, ptr %arrayidx131, align 1, !dbg !1361
  %call133 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %53, i8 noundef zeroext 8) #6, !dbg !1362
  %mul134 = shl nuw nsw i32 %i115.0, 2, !dbg !1363
  %add135 = or disjoint i32 %mul134, 3, !dbg !1364
  %arrayidx136 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add135, !dbg !1365
  store i8 %call133, ptr %arrayidx136, align 1, !dbg !1366
    #dbg_value(i32 %i115.0, !1338, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1340)
  %inc138 = or disjoint i32 %i115.0, 1, !dbg !1367
    #dbg_value(i32 %inc138, !1338, !DIExpression(), !1340)
  %arrayidx119.1 = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %inc138, !dbg !1346
  %54 = load i8, ptr %arrayidx119.1, align 1, !dbg !1346
  %call.1 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %54, i8 noundef zeroext 1) #6, !dbg !1348
  %mul120.1 = shl nuw nsw i32 %inc138, 2, !dbg !1349
  %arrayidx121.1 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %mul120.1, !dbg !1350
  store i8 %call.1, ptr %arrayidx121.1, align 1, !dbg !1351
  %call123.1 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %54, i8 noundef zeroext 2) #6, !dbg !1352
  %mul124.1 = shl nuw nsw i32 %inc138, 2, !dbg !1353
  %add125.1 = or disjoint i32 %mul124.1, 1, !dbg !1354
  %arrayidx126.1 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add125.1, !dbg !1355
  store i8 %call123.1, ptr %arrayidx126.1, align 1, !dbg !1356
  %call128.1 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %54, i8 noundef zeroext 4) #6, !dbg !1357
  %mul129.1 = shl nuw nsw i32 %inc138, 2, !dbg !1358
  %add130.1 = or disjoint i32 %mul129.1, 2, !dbg !1359
  %arrayidx131.1 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add130.1, !dbg !1360
  store i8 %call128.1, ptr %arrayidx131.1, align 1, !dbg !1361
  %call133.1 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %54, i8 noundef zeroext 8) #6, !dbg !1362
  %mul134.1 = shl nuw nsw i32 %inc138, 2, !dbg !1363
  %add135.1 = or disjoint i32 %mul134.1, 3, !dbg !1364
  %arrayidx136.1 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add135.1, !dbg !1365
  store i8 %call133.1, ptr %arrayidx136.1, align 1, !dbg !1366
    #dbg_value(i32 %i115.0, !1338, !DIExpression(DW_OP_plus_uconst, 2, DW_OP_stack_value), !1340)
  %inc138.1 = or disjoint i32 %i115.0, 2, !dbg !1367
    #dbg_value(i32 %inc138.1, !1338, !DIExpression(), !1340)
  %arrayidx119.2 = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %inc138.1, !dbg !1346
  %55 = load i8, ptr %arrayidx119.2, align 1, !dbg !1346
  %call.2 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %55, i8 noundef zeroext 1) #6, !dbg !1348
  %mul120.2 = shl nuw nsw i32 %inc138.1, 2, !dbg !1349
  %arrayidx121.2 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %mul120.2, !dbg !1350
  store i8 %call.2, ptr %arrayidx121.2, align 1, !dbg !1351
  %call123.2 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %55, i8 noundef zeroext 2) #6, !dbg !1352
  %mul124.2 = shl nuw nsw i32 %inc138.1, 2, !dbg !1353
  %add125.2 = or disjoint i32 %mul124.2, 1, !dbg !1354
  %arrayidx126.2 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add125.2, !dbg !1355
  store i8 %call123.2, ptr %arrayidx126.2, align 1, !dbg !1356
  %call128.2 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %55, i8 noundef zeroext 4) #6, !dbg !1357
  %mul129.2 = shl nuw nsw i32 %inc138.1, 2, !dbg !1358
  %add130.2 = or disjoint i32 %mul129.2, 2, !dbg !1359
  %arrayidx131.2 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add130.2, !dbg !1360
  store i8 %call128.2, ptr %arrayidx131.2, align 1, !dbg !1361
  %call133.2 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %55, i8 noundef zeroext 8) #6, !dbg !1362
  %mul134.2 = shl nuw nsw i32 %inc138.1, 2, !dbg !1363
  %add135.2 = or disjoint i32 %mul134.2, 3, !dbg !1364
  %arrayidx136.2 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add135.2, !dbg !1365
  store i8 %call133.2, ptr %arrayidx136.2, align 1, !dbg !1366
    #dbg_value(i32 %i115.0, !1338, !DIExpression(DW_OP_plus_uconst, 3, DW_OP_stack_value), !1340)
  %inc138.2 = or disjoint i32 %i115.0, 3, !dbg !1367
    #dbg_value(i32 %inc138.2, !1338, !DIExpression(), !1340)
  %arrayidx119.3 = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %inc138.2, !dbg !1346
  %56 = load i8, ptr %arrayidx119.3, align 1, !dbg !1346
  %call.3 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %56, i8 noundef zeroext 1) #6, !dbg !1348
  %mul120.3 = shl nuw nsw i32 %inc138.2, 2, !dbg !1349
  %arrayidx121.3 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %mul120.3, !dbg !1350
  store i8 %call.3, ptr %arrayidx121.3, align 1, !dbg !1351
  %call123.3 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %56, i8 noundef zeroext 2) #6, !dbg !1352
  %mul124.3 = shl nuw nsw i32 %inc138.2, 2, !dbg !1353
  %add125.3 = or disjoint i32 %mul124.3, 1, !dbg !1354
  %arrayidx126.3 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add125.3, !dbg !1355
  store i8 %call123.3, ptr %arrayidx126.3, align 1, !dbg !1356
  %call128.3 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %56, i8 noundef zeroext 4) #6, !dbg !1357
  %mul129.3 = shl nuw nsw i32 %inc138.2, 2, !dbg !1358
  %add130.3 = or disjoint i32 %mul129.3, 2, !dbg !1359
  %arrayidx131.3 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add130.3, !dbg !1360
  store i8 %call128.3, ptr %arrayidx131.3, align 1, !dbg !1361
  %call133.3 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %56, i8 noundef zeroext 8) #6, !dbg !1362
  %mul134.3 = shl nuw nsw i32 %inc138.2, 2, !dbg !1363
  %add135.3 = or disjoint i32 %mul134.3, 3, !dbg !1364
  %arrayidx136.3 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add135.3, !dbg !1365
  store i8 %call133.3, ptr %arrayidx136.3, align 1, !dbg !1366
  %inc138.3 = add nuw nsw i32 %i115.0, 4, !dbg !1367
    #dbg_value(i32 %inc138.3, !1338, !DIExpression(), !1340)
  br label %for.cond116, !dbg !1368, !llvm.loop !1369

for.cond141:                                      ; preds = %for.cond116, %for.inc203
  %c140.0 = phi i32 [ %add204, %for.inc203 ], [ 0, %for.cond116 ], !dbg !1371
    #dbg_value(i32 %c140.0, !1373, !DIExpression(), !1374)
  %cmp142 = icmp samesign ult i32 %c140.0, 144, !dbg !1375
  br i1 %cmp142, label %for.cond144, label %for.cond207, !dbg !1377

for.cond144:                                      ; preds = %for.cond141, %for.body146
  %r.0 = phi i32 [ %inc201, %for.body146 ], [ 142, %for.cond141 ], !dbg !1378
    #dbg_value(i32 %r.0, !1381, !DIExpression(), !1382)
  %exitcond11.not = icmp eq i32 %r.0, 220, !dbg !1383
  br i1 %exitcond11.not, label %for.inc203, label %for.body146, !dbg !1385

for.body146:                                      ; preds = %for.cond144
  %div1 = lshr i32 %r.0, 4, !dbg !1386
  %mul147 = mul nuw nsw i32 %div1, 144, !dbg !1388
  %add148 = add nuw nsw i32 %mul147, %c140.0, !dbg !1389
  %rem = and i32 %r.0, 15, !dbg !1390
  %add149 = or disjoint i32 %add148, %rem, !dbg !1391
    #dbg_value(i32 %add149, !1392, !DIExpression(), !1393)
  %arrayidx150 = getelementptr inbounds nuw [2592 x i64], ptr %A, i32 0, i32 %add149, !dbg !1394
  %57 = load i64, ptr %arrayidx150, align 8, !dbg !1394
  %and151 = and i64 %57, 1229782938247303441, !dbg !1395
    #dbg_value(i64 %and151, !1396, !DIExpression(), !1393)
  %shr153 = lshr i64 %57, 1, !dbg !1397
  %and154 = and i64 %shr153, 1229782938247303441, !dbg !1398
    #dbg_value(i64 %and154, !1399, !DIExpression(), !1393)
  %shr156 = lshr i64 %57, 2, !dbg !1400
  %and157 = and i64 %shr156, 1229782938247303441, !dbg !1401
    #dbg_value(i64 %and157, !1402, !DIExpression(), !1393)
  %arrayidx158 = getelementptr inbounds nuw [2592 x i64], ptr %A, i32 0, i32 %add149, !dbg !1403
  %58 = load i64, ptr %arrayidx158, align 8, !dbg !1403
  %shr159 = lshr i64 %58, 3, !dbg !1404
  %and160 = and i64 %shr159, 1229782938247303441, !dbg !1405
    #dbg_value(i64 %and160, !1406, !DIExpression(), !1393)
    #dbg_value(i32 0, !1407, !DIExpression(), !1409)
    #dbg_value(i32 0, !1407, !DIExpression(), !1409)
  %59 = load i8, ptr %tab, align 1, !dbg !1410
  %conv = zext i8 %59 to i64, !dbg !1410
  %mul167 = mul i64 %and151, %conv, !dbg !1413
  %arrayidx170 = getelementptr inbounds nuw i8, ptr %tab, i32 1, !dbg !1414
  %60 = load i8, ptr %arrayidx170, align 1, !dbg !1414
  %conv171 = zext i8 %60 to i64, !dbg !1414
  %mul172 = mul i64 %and154, %conv171, !dbg !1415
  %xor173 = xor i64 %mul167, %mul172, !dbg !1416
  %arrayidx176 = getelementptr inbounds nuw i8, ptr %tab, i32 2, !dbg !1417
  %61 = load i8, ptr %arrayidx176, align 1, !dbg !1417
  %conv177 = zext i8 %61 to i64, !dbg !1417
  %mul178 = mul i64 %and157, %conv177, !dbg !1418
  %xor179 = xor i64 %xor173, %mul178, !dbg !1419
  %arrayidx182 = getelementptr inbounds nuw i8, ptr %tab, i32 3, !dbg !1420
  %62 = load i8, ptr %arrayidx182, align 1, !dbg !1420
  %conv183 = zext i8 %62 to i64, !dbg !1420
  %mul184 = mul i64 %and160, %conv183, !dbg !1421
  %xor185 = xor i64 %xor179, %mul184, !dbg !1422
  %sub187 = add nsw i32 %r.0, -142, !dbg !1423
  %div1882 = lshr i32 %sub187, 4, !dbg !1424
  %mul189 = mul i32 %div1882, 144, !dbg !1425
  %add190 = add i32 %mul189, %c140.0, !dbg !1426
  %sub192 = add nuw nsw i32 %r.0, 2, !dbg !1427
  %rem193 = and i32 %sub192, 15, !dbg !1428
  %add194 = or disjoint i32 %add190, %rem193, !dbg !1429
  %arrayidx195 = getelementptr inbounds nuw [2592 x i64], ptr %A, i32 0, i32 %add194, !dbg !1430
  %63 = load i64, ptr %arrayidx195, align 8, !dbg !1431
  %xor196 = xor i64 %63, %xor185, !dbg !1431
  store i64 %xor196, ptr %arrayidx195, align 8, !dbg !1431
    #dbg_value(i32 1, !1407, !DIExpression(), !1409)
  %arrayidx166.1 = getelementptr inbounds nuw i8, ptr %tab, i32 4, !dbg !1410
  %64 = load i8, ptr %arrayidx166.1, align 1, !dbg !1410
  %conv.1 = zext i8 %64 to i64, !dbg !1410
  %mul167.1 = mul i64 %and151, %conv.1, !dbg !1413
  %arrayidx170.1 = getelementptr inbounds nuw i8, ptr %tab, i32 5, !dbg !1414
  %65 = load i8, ptr %arrayidx170.1, align 1, !dbg !1414
  %conv171.1 = zext i8 %65 to i64, !dbg !1414
  %mul172.1 = mul i64 %and154, %conv171.1, !dbg !1415
  %xor173.1 = xor i64 %mul167.1, %mul172.1, !dbg !1416
  %arrayidx176.1 = getelementptr inbounds nuw i8, ptr %tab, i32 6, !dbg !1417
  %66 = load i8, ptr %arrayidx176.1, align 1, !dbg !1417
  %conv177.1 = zext i8 %66 to i64, !dbg !1417
  %mul178.1 = mul i64 %and157, %conv177.1, !dbg !1418
  %xor179.1 = xor i64 %xor173.1, %mul178.1, !dbg !1419
  %arrayidx182.1 = getelementptr inbounds nuw i8, ptr %tab, i32 7, !dbg !1420
  %67 = load i8, ptr %arrayidx182.1, align 1, !dbg !1420
  %conv183.1 = zext i8 %67 to i64, !dbg !1420
  %mul184.1 = mul i64 %and160, %conv183.1, !dbg !1421
  %xor185.1 = xor i64 %xor179.1, %mul184.1, !dbg !1422
  %sub187.1 = add nsw i32 %r.0, -141, !dbg !1423
  %div1882.1 = lshr i32 %sub187.1, 4, !dbg !1424
  %mul189.1 = mul i32 %div1882.1, 144, !dbg !1425
  %add190.1 = add i32 %mul189.1, %c140.0, !dbg !1426
  %sub192.1 = add nuw nsw i32 %r.0, 3, !dbg !1427
  %rem193.1 = and i32 %sub192.1, 15, !dbg !1428
  %add194.1 = or disjoint i32 %add190.1, %rem193.1, !dbg !1429
  %arrayidx195.1 = getelementptr inbounds nuw [2592 x i64], ptr %A, i32 0, i32 %add194.1, !dbg !1430
  %68 = load i64, ptr %arrayidx195.1, align 8, !dbg !1431
  %xor196.1 = xor i64 %68, %xor185.1, !dbg !1431
  store i64 %xor196.1, ptr %arrayidx195.1, align 8, !dbg !1431
    #dbg_value(i32 2, !1407, !DIExpression(), !1409)
  %arrayidx166.2 = getelementptr inbounds nuw i8, ptr %tab, i32 8, !dbg !1410
  %69 = load i8, ptr %arrayidx166.2, align 1, !dbg !1410
  %conv.2 = zext i8 %69 to i64, !dbg !1410
  %mul167.2 = mul i64 %and151, %conv.2, !dbg !1413
  %arrayidx170.2 = getelementptr inbounds nuw i8, ptr %tab, i32 9, !dbg !1414
  %70 = load i8, ptr %arrayidx170.2, align 1, !dbg !1414
  %conv171.2 = zext i8 %70 to i64, !dbg !1414
  %mul172.2 = mul i64 %and154, %conv171.2, !dbg !1415
  %xor173.2 = xor i64 %mul167.2, %mul172.2, !dbg !1416
  %arrayidx176.2 = getelementptr inbounds nuw i8, ptr %tab, i32 10, !dbg !1417
  %71 = load i8, ptr %arrayidx176.2, align 1, !dbg !1417
  %conv177.2 = zext i8 %71 to i64, !dbg !1417
  %mul178.2 = mul i64 %and157, %conv177.2, !dbg !1418
  %xor179.2 = xor i64 %xor173.2, %mul178.2, !dbg !1419
  %arrayidx182.2 = getelementptr inbounds nuw i8, ptr %tab, i32 11, !dbg !1420
  %72 = load i8, ptr %arrayidx182.2, align 1, !dbg !1420
  %conv183.2 = zext i8 %72 to i64, !dbg !1420
  %mul184.2 = mul i64 %and160, %conv183.2, !dbg !1421
  %xor185.2 = xor i64 %xor179.2, %mul184.2, !dbg !1422
  %sub187.2 = add nsw i32 %r.0, -140, !dbg !1423
  %div1882.2 = lshr i32 %sub187.2, 4, !dbg !1424
  %mul189.2 = mul i32 %div1882.2, 144, !dbg !1425
  %add190.2 = add i32 %mul189.2, %c140.0, !dbg !1426
  %sub192.2 = add nuw nsw i32 %r.0, 4, !dbg !1427
  %rem193.2 = and i32 %sub192.2, 15, !dbg !1428
  %add194.2 = or disjoint i32 %add190.2, %rem193.2, !dbg !1429
  %arrayidx195.2 = getelementptr inbounds nuw [2592 x i64], ptr %A, i32 0, i32 %add194.2, !dbg !1430
  %73 = load i64, ptr %arrayidx195.2, align 8, !dbg !1431
  %xor196.2 = xor i64 %73, %xor185.2, !dbg !1431
  store i64 %xor196.2, ptr %arrayidx195.2, align 8, !dbg !1431
    #dbg_value(i32 3, !1407, !DIExpression(), !1409)
  %arrayidx166.3 = getelementptr inbounds nuw i8, ptr %tab, i32 12, !dbg !1410
  %74 = load i8, ptr %arrayidx166.3, align 1, !dbg !1410
  %conv.3 = zext i8 %74 to i64, !dbg !1410
  %mul167.3 = mul i64 %and151, %conv.3, !dbg !1413
  %arrayidx170.3 = getelementptr inbounds nuw i8, ptr %tab, i32 13, !dbg !1414
  %75 = load i8, ptr %arrayidx170.3, align 1, !dbg !1414
  %conv171.3 = zext i8 %75 to i64, !dbg !1414
  %mul172.3 = mul i64 %and154, %conv171.3, !dbg !1415
  %xor173.3 = xor i64 %mul167.3, %mul172.3, !dbg !1416
  %arrayidx176.3 = getelementptr inbounds nuw i8, ptr %tab, i32 14, !dbg !1417
  %76 = load i8, ptr %arrayidx176.3, align 1, !dbg !1417
  %conv177.3 = zext i8 %76 to i64, !dbg !1417
  %mul178.3 = mul i64 %and157, %conv177.3, !dbg !1418
  %xor179.3 = xor i64 %xor173.3, %mul178.3, !dbg !1419
  %arrayidx182.3 = getelementptr inbounds nuw i8, ptr %tab, i32 15, !dbg !1420
  %77 = load i8, ptr %arrayidx182.3, align 1, !dbg !1420
  %conv183.3 = zext i8 %77 to i64, !dbg !1420
  %mul184.3 = mul i64 %and160, %conv183.3, !dbg !1421
  %xor185.3 = xor i64 %xor179.3, %mul184.3, !dbg !1422
  %sub187.3 = add nsw i32 %r.0, -139, !dbg !1423
  %div1882.3 = lshr i32 %sub187.3, 4, !dbg !1424
  %mul189.3 = mul i32 %div1882.3, 144, !dbg !1425
  %add190.3 = add i32 %mul189.3, %c140.0, !dbg !1426
  %sub192.3 = add nuw nsw i32 %r.0, 5, !dbg !1427
  %rem193.3 = and i32 %sub192.3, 15, !dbg !1428
  %add194.3 = or disjoint i32 %add190.3, %rem193.3, !dbg !1429
  %arrayidx195.3 = getelementptr inbounds nuw [2592 x i64], ptr %A, i32 0, i32 %add194.3, !dbg !1430
  %78 = load i64, ptr %arrayidx195.3, align 8, !dbg !1431
  %xor196.3 = xor i64 %78, %xor185.3, !dbg !1431
  store i64 %xor196.3, ptr %arrayidx195.3, align 8, !dbg !1431
    #dbg_value(i32 4, !1407, !DIExpression(), !1409)
  %inc201 = add nuw nsw i32 %r.0, 1, !dbg !1432
    #dbg_value(i32 %inc201, !1381, !DIExpression(), !1382)
  br label %for.cond144, !dbg !1433, !llvm.loop !1434

for.inc203:                                       ; preds = %for.cond144
  %add204 = add nuw nsw i32 %c140.0, 16, !dbg !1436
    #dbg_value(i32 %add204, !1373, !DIExpression(), !1374)
  br label %for.cond141, !dbg !1437, !llvm.loop !1438

for.cond207:                                      ; preds = %for.cond141, %for.inc241
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.inc241 ], [ 142, %for.cond141 ], !dbg !1440
  %r206.0 = phi i32 [ %add242, %for.inc241 ], [ 0, %for.cond141 ], !dbg !1440
    #dbg_value(i32 %r206.0, !1442, !DIExpression(), !1443)
  %cmp208 = icmp samesign ult i32 %r206.0, 142, !dbg !1444
  br i1 %cmp208, label %for.cond212, label %for.end243, !dbg !1446

for.cond212:                                      ; preds = %for.cond207, %for.inc238.4
  %c211.0 = phi i32 [ %add239.4, %for.inc238.4 ], [ 0, %for.cond207 ], !dbg !1447
    #dbg_value(i32 %c211.0, !1450, !DIExpression(), !1451)
  br label %for.cond217, !dbg !1452

for.cond217:                                      ; preds = %for.cond212, %for.body221
  %i216.0 = phi i32 [ %inc236, %for.body221 ], [ 0, %for.cond212 ], !dbg !1456
    #dbg_value(i32 %i216.0, !1457, !DIExpression(), !1458)
  %exitcond12.not = icmp eq i32 %i216.0, %indvars.iv, !dbg !1459
  br i1 %exitcond12.not, label %for.inc238, label %for.body221, !dbg !1452

for.body221:                                      ; preds = %for.cond217
  %div223 = mul nuw nsw i32 %r206.0, 9, !dbg !1461
  %add224 = add nuw nsw i32 %div223, %c211.0, !dbg !1463
  %add225 = add nuw nsw i32 %add224, %i216.0, !dbg !1464
  %arrayidx226 = getelementptr inbounds nuw [2592 x i64], ptr %A, i32 0, i32 %add225, !dbg !1465
  %add227 = add nuw nsw i32 %r206.0, %i216.0, !dbg !1466
  %mul228 = mul nuw nsw i32 %add227, 145, !dbg !1467
  %add.ptr229 = getelementptr inbounds nuw i8, ptr %A_out, i32 %mul228, !dbg !1468
  %add.ptr230 = getelementptr inbounds nuw i8, ptr %add.ptr229, i32 %c211.0, !dbg !1469
  call fastcc void @decode(ptr noundef nonnull %arrayidx226, ptr noundef %add.ptr230, i32 noundef 16) #6, !dbg !1470
  %inc236 = add nuw nsw i32 %i216.0, 1, !dbg !1471
    #dbg_value(i32 %inc236, !1457, !DIExpression(), !1458)
  br label %for.cond217, !dbg !1472, !llvm.loop !1473

for.inc238:                                       ; preds = %for.cond217
  %add239 = add nuw nsw i32 %c211.0, 16, !dbg !1475
    #dbg_value(i32 %add239, !1450, !DIExpression(), !1451)
  br label %for.cond217.1, !dbg !1452

for.cond217.1:                                    ; preds = %for.body221.1, %for.inc238
  %i216.0.1 = phi i32 [ %inc236.1, %for.body221.1 ], [ 0, %for.inc238 ], !dbg !1456
    #dbg_value(i32 %i216.0.1, !1457, !DIExpression(), !1458)
  %exitcond12.1.not = icmp eq i32 %i216.0.1, %indvars.iv, !dbg !1459
  br i1 %exitcond12.1.not, label %for.inc238.1, label %for.body221.1, !dbg !1452

for.inc238.1:                                     ; preds = %for.cond217.1
  %add239.1 = add nuw nsw i32 %c211.0, 32, !dbg !1475
    #dbg_value(i32 %add239.1, !1450, !DIExpression(), !1451)
  br label %for.cond217.2, !dbg !1452

for.body221.1:                                    ; preds = %for.cond217.1
  %div223.1 = mul nuw nsw i32 %r206.0, 9, !dbg !1461
  %add224.1 = add nuw nsw i32 %div223.1, %add239, !dbg !1463
  %add225.1 = add nuw nsw i32 %add224.1, %i216.0.1, !dbg !1464
  %arrayidx226.1 = getelementptr inbounds nuw [2592 x i64], ptr %A, i32 0, i32 %add225.1, !dbg !1465
  %add227.1 = add nuw nsw i32 %r206.0, %i216.0.1, !dbg !1466
  %mul228.1 = mul nuw nsw i32 %add227.1, 145, !dbg !1467
  %add.ptr229.1 = getelementptr inbounds nuw i8, ptr %A_out, i32 %mul228.1, !dbg !1468
  %add.ptr230.1 = getelementptr inbounds nuw i8, ptr %add.ptr229.1, i32 %add239, !dbg !1469
  call fastcc void @decode(ptr noundef nonnull %arrayidx226.1, ptr noundef nonnull %add.ptr230.1, i32 noundef 16) #6, !dbg !1470
  %inc236.1 = add nuw nsw i32 %i216.0.1, 1, !dbg !1471
    #dbg_value(i32 %inc236.1, !1457, !DIExpression(), !1458)
  br label %for.cond217.1, !dbg !1472, !llvm.loop !1473

for.cond217.2:                                    ; preds = %for.body221.2, %for.inc238.1
  %i216.0.2 = phi i32 [ %inc236.2, %for.body221.2 ], [ 0, %for.inc238.1 ], !dbg !1456
    #dbg_value(i32 %i216.0.2, !1457, !DIExpression(), !1458)
  %exitcond12.2.not = icmp eq i32 %i216.0.2, %indvars.iv, !dbg !1459
  br i1 %exitcond12.2.not, label %for.inc238.2, label %for.body221.2, !dbg !1452

for.inc238.2:                                     ; preds = %for.cond217.2
  %add239.2 = add nuw nsw i32 %c211.0, 48, !dbg !1475
    #dbg_value(i32 %add239.2, !1450, !DIExpression(), !1451)
  br label %for.cond217.3, !dbg !1452

for.body221.2:                                    ; preds = %for.cond217.2
  %div223.2 = mul nuw nsw i32 %r206.0, 9, !dbg !1461
  %add224.2 = add nuw nsw i32 %div223.2, %add239.1, !dbg !1463
  %add225.2 = add nuw nsw i32 %add224.2, %i216.0.2, !dbg !1464
  %arrayidx226.2 = getelementptr inbounds nuw [2592 x i64], ptr %A, i32 0, i32 %add225.2, !dbg !1465
  %add227.2 = add nuw nsw i32 %r206.0, %i216.0.2, !dbg !1466
  %mul228.2 = mul nuw nsw i32 %add227.2, 145, !dbg !1467
  %add.ptr229.2 = getelementptr inbounds nuw i8, ptr %A_out, i32 %mul228.2, !dbg !1468
  %add.ptr230.2 = getelementptr inbounds nuw i8, ptr %add.ptr229.2, i32 %add239.1, !dbg !1469
  call fastcc void @decode(ptr noundef nonnull %arrayidx226.2, ptr noundef nonnull %add.ptr230.2, i32 noundef 16) #6, !dbg !1470
  %inc236.2 = add nuw nsw i32 %i216.0.2, 1, !dbg !1471
    #dbg_value(i32 %inc236.2, !1457, !DIExpression(), !1458)
  br label %for.cond217.2, !dbg !1472, !llvm.loop !1473

for.cond217.3:                                    ; preds = %for.body221.3, %for.inc238.2
  %i216.0.3 = phi i32 [ %inc236.3, %for.body221.3 ], [ 0, %for.inc238.2 ], !dbg !1456
    #dbg_value(i32 %i216.0.3, !1457, !DIExpression(), !1458)
  %exitcond12.3.not = icmp eq i32 %i216.0.3, %indvars.iv, !dbg !1459
  br i1 %exitcond12.3.not, label %for.inc238.3, label %for.body221.3, !dbg !1452

for.inc238.3:                                     ; preds = %for.cond217.3
  %add239.3 = add nuw nsw i32 %c211.0, 64, !dbg !1475
    #dbg_value(i32 %add239.3, !1450, !DIExpression(), !1451)
  %cmp213.4 = icmp samesign ult i32 %c211.0, 80, !dbg !1476
  br i1 %cmp213.4, label %for.cond217.4, label %for.inc241, !dbg !1477

for.body221.3:                                    ; preds = %for.cond217.3
  %div223.3 = mul nuw nsw i32 %r206.0, 9, !dbg !1461
  %add224.3 = add nuw nsw i32 %div223.3, %add239.2, !dbg !1463
  %add225.3 = add nuw nsw i32 %add224.3, %i216.0.3, !dbg !1464
  %arrayidx226.3 = getelementptr inbounds nuw [2592 x i64], ptr %A, i32 0, i32 %add225.3, !dbg !1465
  %add227.3 = add nuw nsw i32 %r206.0, %i216.0.3, !dbg !1466
  %mul228.3 = mul nuw nsw i32 %add227.3, 145, !dbg !1467
  %add.ptr229.3 = getelementptr inbounds nuw i8, ptr %A_out, i32 %mul228.3, !dbg !1468
  %add.ptr230.3 = getelementptr inbounds nuw i8, ptr %add.ptr229.3, i32 %add239.2, !dbg !1469
  call fastcc void @decode(ptr noundef nonnull %arrayidx226.3, ptr noundef nonnull %add.ptr230.3, i32 noundef 16) #6, !dbg !1470
  %inc236.3 = add nuw nsw i32 %i216.0.3, 1, !dbg !1471
    #dbg_value(i32 %inc236.3, !1457, !DIExpression(), !1458)
  br label %for.cond217.3, !dbg !1472, !llvm.loop !1473

for.cond217.4:                                    ; preds = %for.inc238.3, %for.body221.4
  %i216.0.4 = phi i32 [ %inc236.4, %for.body221.4 ], [ 0, %for.inc238.3 ], !dbg !1456
    #dbg_value(i32 %i216.0.4, !1457, !DIExpression(), !1458)
  %exitcond12.4.not = icmp eq i32 %i216.0.4, %indvars.iv, !dbg !1459
  br i1 %exitcond12.4.not, label %for.inc238.4, label %for.body221.4, !dbg !1452

for.inc238.4:                                     ; preds = %for.cond217.4
  %add239.4 = add nuw nsw i32 %c211.0, 80, !dbg !1475
    #dbg_value(i32 %add239.4, !1450, !DIExpression(), !1451)
  br label %for.cond212, !dbg !1478, !llvm.loop !1479

for.body221.4:                                    ; preds = %for.cond217.4
  %div223.4 = mul nuw nsw i32 %r206.0, 9, !dbg !1461
  %add224.4 = add nuw nsw i32 %div223.4, %add239.3, !dbg !1463
  %add225.4 = add nuw nsw i32 %add224.4, %i216.0.4, !dbg !1464
  %arrayidx226.4 = getelementptr inbounds nuw [2592 x i64], ptr %A, i32 0, i32 %add225.4, !dbg !1465
  %add227.4 = add nuw nsw i32 %r206.0, %i216.0.4, !dbg !1466
  %mul228.4 = mul nuw nsw i32 %add227.4, 145, !dbg !1467
  %add.ptr229.4 = getelementptr inbounds nuw i8, ptr %A_out, i32 %mul228.4, !dbg !1468
  %add.ptr230.4 = getelementptr inbounds nuw i8, ptr %add.ptr229.4, i32 %add239.3, !dbg !1469
  %cmp232.4 = icmp samesign ult i32 %c211.0, 64, !dbg !1481
  %sub234.4 = sub nuw nsw i32 80, %c211.0, !dbg !1481
  %cond.4 = select i1 %cmp232.4, i32 16, i32 %sub234.4, !dbg !1481
  call fastcc void @decode(ptr noundef nonnull %arrayidx226.4, ptr noundef nonnull %add.ptr230.4, i32 noundef %cond.4) #6, !dbg !1470
  %inc236.4 = add nuw nsw i32 %i216.0.4, 1, !dbg !1471
    #dbg_value(i32 %inc236.4, !1457, !DIExpression(), !1458)
  br label %for.cond217.4, !dbg !1472, !llvm.loop !1473

for.inc241:                                       ; preds = %for.inc238.3
  %add242 = add nuw nsw i32 %r206.0, 16, !dbg !1482
    #dbg_value(i32 %add242, !1442, !DIExpression(), !1443)
  %indvars.iv.next = add nsw i32 %indvars.iv, -16, !dbg !1483
  br label %for.cond207, !dbg !1483, !llvm.loop !1484

for.end243:                                       ; preds = %for.cond207
  ret void, !dbg !1486
}

declare dso_local ptr @memset(ptr noundef, i32 noundef, i32 noundef) local_unnamed_addr #4

; Function Attrs: nounwind
define internal fastcc void @mat_mul(ptr noundef %a, ptr noundef %b, ptr noundef %c, i32 noundef %colrow_ab, i32 noundef %row_a, i32 noundef %col_b) unnamed_addr #0 !dbg !1487 {
entry:
    #dbg_value(ptr %a, !1490, !DIExpression(), !1491)
    #dbg_value(ptr %b, !1492, !DIExpression(), !1491)
    #dbg_value(ptr %c, !1493, !DIExpression(), !1491)
    #dbg_value(i32 %colrow_ab, !1494, !DIExpression(), !1491)
    #dbg_value(i32 %row_a, !1495, !DIExpression(), !1491)
    #dbg_value(i32 %col_b, !1496, !DIExpression(), !1491)
    #dbg_value(i32 0, !1497, !DIExpression(), !1499)
  %smax = call i32 @llvm.smax.i32(i32 %col_b, i32 0), !dbg !1500
  %smax1 = call i32 @llvm.smax.i32(i32 %row_a, i32 0), !dbg !1500
  br label %for.cond, !dbg !1500

for.cond:                                         ; preds = %for.inc4, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc5, %for.inc4 ], !dbg !1501
  %c.addr.0 = phi ptr [ %c, %entry ], [ %c.addr.1, %for.inc4 ]
  %a.addr.0 = phi ptr [ %a, %entry ], [ %add.ptr6, %for.inc4 ]
    #dbg_value(ptr %a.addr.0, !1490, !DIExpression(), !1491)
    #dbg_value(ptr %c.addr.0, !1493, !DIExpression(), !1491)
    #dbg_value(i32 %i.0, !1497, !DIExpression(), !1499)
  %exitcond2.not = icmp eq i32 %i.0, %smax1, !dbg !1502
  br i1 %exitcond2.not, label %for.end7, label %for.cond1, !dbg !1504

for.cond1:                                        ; preds = %for.cond, %for.body3
  %c.addr.1 = phi ptr [ %incdec.ptr, %for.body3 ], [ %c.addr.0, %for.cond ]
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond ], !dbg !1505
    #dbg_value(i32 %j.0, !1508, !DIExpression(), !1509)
    #dbg_value(ptr %c.addr.1, !1493, !DIExpression(), !1491)
  %exitcond.not = icmp eq i32 %j.0, %smax, !dbg !1510
  br i1 %exitcond.not, label %for.inc4, label %for.body3, !dbg !1512

for.body3:                                        ; preds = %for.cond1
  %add.ptr = getelementptr inbounds nuw i8, ptr %b, i32 %j.0, !dbg !1513
  %call = call fastcc zeroext i8 @lincomb(ptr noundef %a.addr.0, ptr noundef %add.ptr, i32 noundef %colrow_ab, i32 noundef %col_b) #6, !dbg !1515
  store i8 %call, ptr %c.addr.1, align 1, !dbg !1516
  %inc = add nuw i32 %j.0, 1, !dbg !1517
    #dbg_value(i32 %inc, !1508, !DIExpression(), !1509)
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %c.addr.1, i32 1, !dbg !1518
    #dbg_value(ptr %incdec.ptr, !1493, !DIExpression(), !1491)
  br label %for.cond1, !dbg !1519, !llvm.loop !1520

for.inc4:                                         ; preds = %for.cond1
  %inc5 = add nuw i32 %i.0, 1, !dbg !1522
    #dbg_value(i32 %inc5, !1497, !DIExpression(), !1499)
  %add.ptr6 = getelementptr inbounds i8, ptr %a.addr.0, i32 %colrow_ab, !dbg !1523
    #dbg_value(ptr %add.ptr6, !1490, !DIExpression(), !1491)
  br label %for.cond, !dbg !1524, !llvm.loop !1525

for.end7:                                         ; preds = %for.cond
  %cmp8 = icmp eq i32 %row_a, %col_b, !dbg !1527
  %call9 = call zeroext i1 @assert(i1 noundef zeroext %cmp8) #8, !dbg !1528
  ret void, !dbg !1529
}

; Function Attrs: nounwind
define internal fastcc void @mat_add(ptr noundef %a, ptr noundef %b, ptr noundef %c, i32 noundef %m, i32 noundef %n) unnamed_addr #0 !dbg !1530 {
entry:
    #dbg_value(ptr %a, !1533, !DIExpression(), !1534)
    #dbg_value(ptr %b, !1535, !DIExpression(), !1534)
    #dbg_value(ptr %c, !1536, !DIExpression(), !1534)
    #dbg_value(i32 %m, !1537, !DIExpression(), !1534)
    #dbg_value(i32 %n, !1538, !DIExpression(), !1534)
    #dbg_value(i32 0, !1539, !DIExpression(), !1541)
  %smax = call i32 @llvm.smax.i32(i32 %n, i32 0), !dbg !1542
  %smax1 = call i32 @llvm.smax.i32(i32 %m, i32 0), !dbg !1542
  br label %for.cond, !dbg !1542

for.cond:                                         ; preds = %for.inc11, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc12, %for.inc11 ], !dbg !1543
    #dbg_value(i32 %i.0, !1539, !DIExpression(), !1541)
  %exitcond2.not = icmp eq i32 %i.0, %smax1, !dbg !1544
  br i1 %exitcond2.not, label %for.end13, label %for.cond1, !dbg !1546

for.cond1:                                        ; preds = %for.cond, %for.body3
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond ], !dbg !1547
    #dbg_value(i32 %j.0, !1550, !DIExpression(), !1551)
  %exitcond.not = icmp eq i32 %j.0, %smax, !dbg !1552
  br i1 %exitcond.not, label %for.inc11, label %for.body3, !dbg !1554

for.body3:                                        ; preds = %for.cond1
  %mul = mul nsw i32 %i.0, %n, !dbg !1555
  %add.ptr = getelementptr inbounds i8, ptr %a, i32 %mul, !dbg !1557
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %j.0, !dbg !1558
  %0 = load i8, ptr %add.ptr4, align 1, !dbg !1559
  %mul5 = mul nsw i32 %i.0, %n, !dbg !1560
  %add.ptr6 = getelementptr inbounds i8, ptr %b, i32 %mul5, !dbg !1561
  %add.ptr7 = getelementptr inbounds nuw i8, ptr %add.ptr6, i32 %j.0, !dbg !1562
  %1 = load i8, ptr %add.ptr7, align 1, !dbg !1563
  %call = call fastcc zeroext i8 @add_f(i8 noundef zeroext %0, i8 noundef zeroext %1) #6, !dbg !1564
  %mul8 = mul nsw i32 %i.0, %n, !dbg !1565
  %add.ptr9 = getelementptr inbounds i8, ptr %c, i32 %mul8, !dbg !1566
  %add.ptr10 = getelementptr inbounds nuw i8, ptr %add.ptr9, i32 %j.0, !dbg !1567
  store i8 %call, ptr %add.ptr10, align 1, !dbg !1568
  %inc = add nuw i32 %j.0, 1, !dbg !1569
    #dbg_value(i32 %inc, !1550, !DIExpression(), !1551)
  br label %for.cond1, !dbg !1570, !llvm.loop !1571

for.inc11:                                        ; preds = %for.cond1
  %inc12 = add nuw i32 %i.0, 1, !dbg !1573
    #dbg_value(i32 %inc12, !1539, !DIExpression(), !1541)
  br label %for.cond, !dbg !1574, !llvm.loop !1575

for.end13:                                        ; preds = %for.cond
  ret void, !dbg !1577
}

; Function Attrs: nounwind
define internal fastcc void @encode(ptr noundef %m, ptr noundef %menc, i32 noundef %mlen) unnamed_addr #0 !dbg !1578 {
entry:
    #dbg_value(ptr %m, !1579, !DIExpression(), !1580)
    #dbg_value(ptr %menc, !1581, !DIExpression(), !1580)
    #dbg_value(i32 %mlen, !1582, !DIExpression(), !1580)
    #dbg_value(i32 0, !1583, !DIExpression(), !1580)
  br label %for.cond, !dbg !1584

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1586
  %m.addr.0 = phi ptr [ %m, %entry ], [ %add.ptr3, %for.body ]
    #dbg_value(ptr %m.addr.0, !1579, !DIExpression(), !1580)
    #dbg_value(i32 %i.0, !1583, !DIExpression(), !1580)
  %div = sdiv i32 %mlen, 2, !dbg !1587
  %cmp = icmp slt i32 %i.0, %div, !dbg !1589
  br i1 %cmp, label %for.body, label %for.end, !dbg !1590

for.body:                                         ; preds = %for.cond
  %0 = load i8, ptr %m.addr.0, align 1, !dbg !1591
  %add.ptr = getelementptr inbounds nuw i8, ptr %m.addr.0, i32 1, !dbg !1593
  %1 = load i8, ptr %add.ptr, align 1, !dbg !1594
  %shl = shl i8 %1, 4, !dbg !1595
  %or = or i8 %shl, %0, !dbg !1596
  %arrayidx = getelementptr inbounds nuw i8, ptr %menc, i32 %i.0, !dbg !1597
  store i8 %or, ptr %arrayidx, align 1, !dbg !1598
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1599
    #dbg_value(i32 %inc, !1583, !DIExpression(), !1580)
  %add.ptr3 = getelementptr inbounds nuw i8, ptr %m.addr.0, i32 2, !dbg !1600
    #dbg_value(ptr %add.ptr3, !1579, !DIExpression(), !1580)
  br label %for.cond, !dbg !1601, !llvm.loop !1602

for.end:                                          ; preds = %for.cond
  %2 = and i32 %mlen, -2147483647, !dbg !1604
  %cmp4 = icmp eq i32 %2, 1, !dbg !1604
  br i1 %cmp4, label %if.then, label %if.end, !dbg !1604

if.then:                                          ; preds = %for.end
  %3 = load i8, ptr %m.addr.0, align 1, !dbg !1606
  %arrayidx6 = getelementptr inbounds nuw i8, ptr %menc, i32 %i.0, !dbg !1608
  store i8 %3, ptr %arrayidx6, align 1, !dbg !1609
  br label %if.end, !dbg !1610

if.end:                                           ; preds = %if.then, %for.end
  ret void, !dbg !1611
}

; Function Attrs: nounwind
define internal fastcc zeroext i8 @add_f(i8 noundef zeroext %a, i8 noundef zeroext %b) unnamed_addr #0 !dbg !1612 {
entry:
    #dbg_value(i8 %a, !1615, !DIExpression(), !1616)
    #dbg_value(i8 %b, !1617, !DIExpression(), !1616)
  %xor1 = xor i8 %a, %b, !dbg !1618
  ret i8 %xor1, !dbg !1619
}

; Function Attrs: nounwind
define internal fastcc zeroext i8 @lincomb(ptr noundef %a, ptr noundef %b, i32 noundef %n, i32 noundef %m) unnamed_addr #0 !dbg !1620 {
entry:
    #dbg_value(ptr %a, !1623, !DIExpression(), !1624)
    #dbg_value(ptr %b, !1625, !DIExpression(), !1624)
    #dbg_value(i32 %n, !1626, !DIExpression(), !1624)
    #dbg_value(i32 %m, !1627, !DIExpression(), !1624)
    #dbg_value(i8 0, !1628, !DIExpression(), !1624)
    #dbg_value(i32 0, !1629, !DIExpression(), !1631)
  %smax = call i32 @llvm.smax.i32(i32 %n, i32 0), !dbg !1632
  br label %for.cond, !dbg !1632

for.cond:                                         ; preds = %for.body, %entry
  %ret.0 = phi i8 [ 0, %entry ], [ %call1, %for.body ], !dbg !1624
  %b.addr.0 = phi ptr [ %b, %entry ], [ %add.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1633
    #dbg_value(i32 %i.0, !1629, !DIExpression(), !1631)
    #dbg_value(ptr %b.addr.0, !1625, !DIExpression(), !1624)
    #dbg_value(i8 %ret.0, !1628, !DIExpression(), !1624)
  %exitcond.not = icmp eq i32 %i.0, %smax, !dbg !1634
  br i1 %exitcond.not, label %for.end, label %for.body, !dbg !1636

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %i.0, !dbg !1637
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1637
  %1 = load i8, ptr %b.addr.0, align 1, !dbg !1639
  %call = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %0, i8 noundef zeroext %1) #6, !dbg !1640
  %call1 = call fastcc zeroext i8 @add_f(i8 noundef zeroext %call, i8 noundef zeroext %ret.0) #6, !dbg !1641
    #dbg_value(i8 %call1, !1628, !DIExpression(), !1624)
  %inc = add nuw i32 %i.0, 1, !dbg !1642
    #dbg_value(i32 %inc, !1629, !DIExpression(), !1631)
  %add.ptr = getelementptr inbounds i8, ptr %b.addr.0, i32 %m, !dbg !1643
    #dbg_value(ptr %add.ptr, !1625, !DIExpression(), !1624)
  br label %for.cond, !dbg !1644, !llvm.loop !1645

for.end:                                          ; preds = %for.cond
  ret i8 %ret.0, !dbg !1647
}

declare dso_local zeroext i1 @assert(i1 noundef zeroext) local_unnamed_addr #4

; Function Attrs: nounwind
define internal fastcc zeroext range(i8 0, 16) i8 @mul_f(i8 noundef zeroext %a, i8 noundef zeroext %b) unnamed_addr #0 !dbg !1648 {
entry:
    #dbg_value(i8 %a, !1649, !DIExpression(), !1650)
    #dbg_value(i8 %b, !1651, !DIExpression(), !1650)
  %0 = load volatile i8, ptr @pqmayo_MAYO_5_ref_unsigned_char_blocker, align 1, !dbg !1652
  %xor1 = xor i8 %a, %0, !dbg !1653
    #dbg_value(i8 %xor1, !1649, !DIExpression(), !1650)
  %1 = trunc i8 %xor1 to i1, !dbg !1654
    #dbg_value(i8 poison, !1655, !DIExpression(), !1650)
  %2 = and i8 %xor1, 2, !dbg !1656
  %mul9 = mul i8 %2, %b, !dbg !1657
  %conv10 = select i1 %1, i8 %b, i8 0, !dbg !1654
  %xor11 = xor i8 %conv10, %mul9, !dbg !1658
    #dbg_value(i8 %xor11, !1655, !DIExpression(), !1650)
  %3 = and i8 %xor1, 4, !dbg !1659
  %mul16 = mul i8 %3, %b, !dbg !1660
  %xor18 = xor i8 %mul16, %xor11, !dbg !1661
    #dbg_value(i8 %xor18, !1655, !DIExpression(), !1650)
  %4 = and i8 %xor1, 8, !dbg !1662
  %mul23 = mul i8 %4, %b, !dbg !1663
  %xor25 = xor i8 %mul23, %xor18, !dbg !1664
    #dbg_value(i8 %xor25, !1655, !DIExpression(), !1650)
    #dbg_value(i8 %xor25, !1665, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !1650)
  %5 = lshr i8 %xor25, 4, !dbg !1666
  %6 = lshr i8 %xor25, 3, !dbg !1667
  %7 = and i8 %6, 14, !dbg !1667
  %8 = xor i8 %5, %7, !dbg !1668
  %xor25.masked = and i8 %xor25, 15, !dbg !1669
  %9 = xor i8 %8, %xor25.masked, !dbg !1669
    #dbg_value(i8 %9, !1670, !DIExpression(), !1650)
  ret i8 %9, !dbg !1671
}

; Function Attrs: nounwind
define internal fastcc void @transpose_16x16_nibbles(ptr noundef %M) unnamed_addr #0 !dbg !67 {
entry:
    #dbg_value(ptr %M, !1672, !DIExpression(), !1673)
    #dbg_value(i32 0, !1674, !DIExpression(), !1676)
    #dbg_value(i32 0, !1674, !DIExpression(), !1676)
  %0 = load i64, ptr %M, align 8, !dbg !1677
  %shr = lshr i64 %0, 4, !dbg !1680
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %M, i32 8, !dbg !1681
  %1 = load i64, ptr %arrayidx1, align 8, !dbg !1681
  %xor = xor i64 %shr, %1, !dbg !1682
  %and = and i64 %xor, 1085102592571150095, !dbg !1683
    #dbg_value(i64 %and, !1684, !DIExpression(), !1685)
  %shl = shl nuw i64 %and, 4, !dbg !1686
  %2 = load i64, ptr %M, align 8, !dbg !1687
  %xor3 = xor i64 %2, %shl, !dbg !1687
  store i64 %xor3, ptr %M, align 8, !dbg !1687
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %M, i32 8, !dbg !1688
  %3 = load i64, ptr %arrayidx5, align 8, !dbg !1689
  %xor6 = xor i64 %3, %and, !dbg !1689
  store i64 %xor6, ptr %arrayidx5, align 8, !dbg !1689
    #dbg_value(i32 2, !1674, !DIExpression(), !1676)
  %arrayidx.1 = getelementptr inbounds nuw i8, ptr %M, i32 16, !dbg !1677
  %4 = load i64, ptr %arrayidx.1, align 8, !dbg !1677
  %shr.1 = lshr i64 %4, 4, !dbg !1680
  %arrayidx1.1 = getelementptr inbounds nuw i8, ptr %M, i32 24, !dbg !1681
  %5 = load i64, ptr %arrayidx1.1, align 8, !dbg !1681
  %xor.1 = xor i64 %shr.1, %5, !dbg !1682
  %and.1 = and i64 %xor.1, 1085102592571150095, !dbg !1683
    #dbg_value(i64 %and.1, !1684, !DIExpression(), !1685)
  %shl.1 = shl nuw i64 %and.1, 4, !dbg !1686
  %arrayidx2.1 = getelementptr inbounds nuw i8, ptr %M, i32 16, !dbg !1690
  %6 = load i64, ptr %arrayidx2.1, align 8, !dbg !1687
  %xor3.1 = xor i64 %6, %shl.1, !dbg !1687
  store i64 %xor3.1, ptr %arrayidx2.1, align 8, !dbg !1687
  %arrayidx5.1 = getelementptr inbounds nuw i8, ptr %M, i32 24, !dbg !1688
  %7 = load i64, ptr %arrayidx5.1, align 8, !dbg !1689
  %xor6.1 = xor i64 %7, %and.1, !dbg !1689
  store i64 %xor6.1, ptr %arrayidx5.1, align 8, !dbg !1689
    #dbg_value(i32 4, !1674, !DIExpression(), !1676)
  %arrayidx.2 = getelementptr inbounds nuw i8, ptr %M, i32 32, !dbg !1677
  %8 = load i64, ptr %arrayidx.2, align 8, !dbg !1677
  %shr.2 = lshr i64 %8, 4, !dbg !1680
  %arrayidx1.2 = getelementptr inbounds nuw i8, ptr %M, i32 40, !dbg !1681
  %9 = load i64, ptr %arrayidx1.2, align 8, !dbg !1681
  %xor.2 = xor i64 %shr.2, %9, !dbg !1682
  %and.2 = and i64 %xor.2, 1085102592571150095, !dbg !1683
    #dbg_value(i64 %and.2, !1684, !DIExpression(), !1685)
  %shl.2 = shl nuw i64 %and.2, 4, !dbg !1686
  %arrayidx2.2 = getelementptr inbounds nuw i8, ptr %M, i32 32, !dbg !1690
  %10 = load i64, ptr %arrayidx2.2, align 8, !dbg !1687
  %xor3.2 = xor i64 %10, %shl.2, !dbg !1687
  store i64 %xor3.2, ptr %arrayidx2.2, align 8, !dbg !1687
  %arrayidx5.2 = getelementptr inbounds nuw i8, ptr %M, i32 40, !dbg !1688
  %11 = load i64, ptr %arrayidx5.2, align 8, !dbg !1689
  %xor6.2 = xor i64 %11, %and.2, !dbg !1689
  store i64 %xor6.2, ptr %arrayidx5.2, align 8, !dbg !1689
    #dbg_value(i32 6, !1674, !DIExpression(), !1676)
  %arrayidx.3 = getelementptr inbounds nuw i8, ptr %M, i32 48, !dbg !1677
  %12 = load i64, ptr %arrayidx.3, align 8, !dbg !1677
  %shr.3 = lshr i64 %12, 4, !dbg !1680
  %arrayidx1.3 = getelementptr inbounds nuw i8, ptr %M, i32 56, !dbg !1681
  %13 = load i64, ptr %arrayidx1.3, align 8, !dbg !1681
  %xor.3 = xor i64 %shr.3, %13, !dbg !1682
  %and.3 = and i64 %xor.3, 1085102592571150095, !dbg !1683
    #dbg_value(i64 %and.3, !1684, !DIExpression(), !1685)
  %shl.3 = shl nuw i64 %and.3, 4, !dbg !1686
  %arrayidx2.3 = getelementptr inbounds nuw i8, ptr %M, i32 48, !dbg !1690
  %14 = load i64, ptr %arrayidx2.3, align 8, !dbg !1687
  %xor3.3 = xor i64 %14, %shl.3, !dbg !1687
  store i64 %xor3.3, ptr %arrayidx2.3, align 8, !dbg !1687
  %arrayidx5.3 = getelementptr inbounds nuw i8, ptr %M, i32 56, !dbg !1688
  %15 = load i64, ptr %arrayidx5.3, align 8, !dbg !1689
  %xor6.3 = xor i64 %15, %and.3, !dbg !1689
  store i64 %xor6.3, ptr %arrayidx5.3, align 8, !dbg !1689
    #dbg_value(i32 8, !1674, !DIExpression(), !1676)
  %arrayidx.4 = getelementptr inbounds nuw i8, ptr %M, i32 64, !dbg !1677
  %16 = load i64, ptr %arrayidx.4, align 8, !dbg !1677
  %shr.4 = lshr i64 %16, 4, !dbg !1680
  %arrayidx1.4 = getelementptr inbounds nuw i8, ptr %M, i32 72, !dbg !1681
  %17 = load i64, ptr %arrayidx1.4, align 8, !dbg !1681
  %xor.4 = xor i64 %shr.4, %17, !dbg !1682
  %and.4 = and i64 %xor.4, 1085102592571150095, !dbg !1683
    #dbg_value(i64 %and.4, !1684, !DIExpression(), !1685)
  %shl.4 = shl nuw i64 %and.4, 4, !dbg !1686
  %arrayidx2.4 = getelementptr inbounds nuw i8, ptr %M, i32 64, !dbg !1690
  %18 = load i64, ptr %arrayidx2.4, align 8, !dbg !1687
  %xor3.4 = xor i64 %18, %shl.4, !dbg !1687
  store i64 %xor3.4, ptr %arrayidx2.4, align 8, !dbg !1687
  %arrayidx5.4 = getelementptr inbounds nuw i8, ptr %M, i32 72, !dbg !1688
  %19 = load i64, ptr %arrayidx5.4, align 8, !dbg !1689
  %xor6.4 = xor i64 %19, %and.4, !dbg !1689
  store i64 %xor6.4, ptr %arrayidx5.4, align 8, !dbg !1689
    #dbg_value(i32 10, !1674, !DIExpression(), !1676)
  %arrayidx.5 = getelementptr inbounds nuw i8, ptr %M, i32 80, !dbg !1677
  %20 = load i64, ptr %arrayidx.5, align 8, !dbg !1677
  %shr.5 = lshr i64 %20, 4, !dbg !1680
  %arrayidx1.5 = getelementptr inbounds nuw i8, ptr %M, i32 88, !dbg !1681
  %21 = load i64, ptr %arrayidx1.5, align 8, !dbg !1681
  %xor.5 = xor i64 %shr.5, %21, !dbg !1682
  %and.5 = and i64 %xor.5, 1085102592571150095, !dbg !1683
    #dbg_value(i64 %and.5, !1684, !DIExpression(), !1685)
  %shl.5 = shl nuw i64 %and.5, 4, !dbg !1686
  %arrayidx2.5 = getelementptr inbounds nuw i8, ptr %M, i32 80, !dbg !1690
  %22 = load i64, ptr %arrayidx2.5, align 8, !dbg !1687
  %xor3.5 = xor i64 %22, %shl.5, !dbg !1687
  store i64 %xor3.5, ptr %arrayidx2.5, align 8, !dbg !1687
  %arrayidx5.5 = getelementptr inbounds nuw i8, ptr %M, i32 88, !dbg !1688
  %23 = load i64, ptr %arrayidx5.5, align 8, !dbg !1689
  %xor6.5 = xor i64 %23, %and.5, !dbg !1689
  store i64 %xor6.5, ptr %arrayidx5.5, align 8, !dbg !1689
    #dbg_value(i32 12, !1674, !DIExpression(), !1676)
  %arrayidx.6 = getelementptr inbounds nuw i8, ptr %M, i32 96, !dbg !1677
  %24 = load i64, ptr %arrayidx.6, align 8, !dbg !1677
  %shr.6 = lshr i64 %24, 4, !dbg !1680
  %arrayidx1.6 = getelementptr inbounds nuw i8, ptr %M, i32 104, !dbg !1681
  %25 = load i64, ptr %arrayidx1.6, align 8, !dbg !1681
  %xor.6 = xor i64 %shr.6, %25, !dbg !1682
  %and.6 = and i64 %xor.6, 1085102592571150095, !dbg !1683
    #dbg_value(i64 %and.6, !1684, !DIExpression(), !1685)
  %shl.6 = shl nuw i64 %and.6, 4, !dbg !1686
  %arrayidx2.6 = getelementptr inbounds nuw i8, ptr %M, i32 96, !dbg !1690
  %26 = load i64, ptr %arrayidx2.6, align 8, !dbg !1687
  %xor3.6 = xor i64 %26, %shl.6, !dbg !1687
  store i64 %xor3.6, ptr %arrayidx2.6, align 8, !dbg !1687
  %arrayidx5.6 = getelementptr inbounds nuw i8, ptr %M, i32 104, !dbg !1688
  %27 = load i64, ptr %arrayidx5.6, align 8, !dbg !1689
  %xor6.6 = xor i64 %27, %and.6, !dbg !1689
  store i64 %xor6.6, ptr %arrayidx5.6, align 8, !dbg !1689
    #dbg_value(i32 14, !1674, !DIExpression(), !1676)
  %arrayidx.7 = getelementptr inbounds nuw i8, ptr %M, i32 112, !dbg !1677
  %28 = load i64, ptr %arrayidx.7, align 8, !dbg !1677
  %shr.7 = lshr i64 %28, 4, !dbg !1680
  %arrayidx1.7 = getelementptr inbounds nuw i8, ptr %M, i32 120, !dbg !1681
  %29 = load i64, ptr %arrayidx1.7, align 8, !dbg !1681
  %xor.7 = xor i64 %shr.7, %29, !dbg !1682
  %and.7 = and i64 %xor.7, 1085102592571150095, !dbg !1683
    #dbg_value(i64 %and.7, !1684, !DIExpression(), !1685)
  %shl.7 = shl nuw i64 %and.7, 4, !dbg !1686
  %arrayidx2.7 = getelementptr inbounds nuw i8, ptr %M, i32 112, !dbg !1690
  %30 = load i64, ptr %arrayidx2.7, align 8, !dbg !1687
  %xor3.7 = xor i64 %30, %shl.7, !dbg !1687
  store i64 %xor3.7, ptr %arrayidx2.7, align 8, !dbg !1687
  %arrayidx5.7 = getelementptr inbounds nuw i8, ptr %M, i32 120, !dbg !1688
  %31 = load i64, ptr %arrayidx5.7, align 8, !dbg !1689
  %xor6.7 = xor i64 %31, %and.7, !dbg !1689
  store i64 %xor6.7, ptr %arrayidx5.7, align 8, !dbg !1689
    #dbg_value(i32 16, !1674, !DIExpression(), !1676)
    #dbg_value(i32 0, !1691, !DIExpression(), !1693)
  %32 = load i64, ptr %M, align 8, !dbg !1694
  %shr13 = lshr i64 %32, 8, !dbg !1697
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %M, i32 16, !dbg !1698
  %33 = load i64, ptr %arrayidx15, align 8, !dbg !1698
  %xor16 = xor i64 %shr13, %33, !dbg !1699
  %and17 = and i64 %xor16, 71777214294589695, !dbg !1700
    #dbg_value(i64 %and17, !1701, !DIExpression(), !1702)
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %M, i32 8, !dbg !1703
  %34 = load i64, ptr %arrayidx19, align 8, !dbg !1703
  %shr20 = lshr i64 %34, 8, !dbg !1704
  %arrayidx22 = getelementptr inbounds nuw i8, ptr %M, i32 24, !dbg !1705
  %35 = load i64, ptr %arrayidx22, align 8, !dbg !1705
  %xor23 = xor i64 %shr20, %35, !dbg !1706
  %and24 = and i64 %xor23, 71777214294589695, !dbg !1707
    #dbg_value(i64 %and24, !1708, !DIExpression(), !1702)
  %shl25 = shl nuw i64 %and17, 8, !dbg !1709
  %36 = load i64, ptr %M, align 8, !dbg !1710
  %xor27 = xor i64 %36, %shl25, !dbg !1710
  store i64 %xor27, ptr %M, align 8, !dbg !1710
  %shl28 = shl nuw i64 %and24, 8, !dbg !1711
  %arrayidx30 = getelementptr inbounds nuw i8, ptr %M, i32 8, !dbg !1712
  %37 = load i64, ptr %arrayidx30, align 8, !dbg !1713
  %xor31 = xor i64 %37, %shl28, !dbg !1713
  store i64 %xor31, ptr %arrayidx30, align 8, !dbg !1713
  %arrayidx33 = getelementptr inbounds nuw i8, ptr %M, i32 16, !dbg !1714
  %38 = load i64, ptr %arrayidx33, align 8, !dbg !1715
  %xor34 = xor i64 %38, %and17, !dbg !1715
  store i64 %xor34, ptr %arrayidx33, align 8, !dbg !1715
  %arrayidx36 = getelementptr inbounds nuw i8, ptr %M, i32 24, !dbg !1716
  %39 = load i64, ptr %arrayidx36, align 8, !dbg !1717
  %xor37 = xor i64 %39, %and24, !dbg !1717
  store i64 %xor37, ptr %arrayidx36, align 8, !dbg !1717
    #dbg_value(i32 4, !1691, !DIExpression(), !1693)
  %arrayidx12.1 = getelementptr inbounds nuw i8, ptr %M, i32 32, !dbg !1694
  %40 = load i64, ptr %arrayidx12.1, align 8, !dbg !1694
  %shr13.1 = lshr i64 %40, 8, !dbg !1697
  %arrayidx15.1 = getelementptr inbounds nuw i8, ptr %M, i32 48, !dbg !1698
  %41 = load i64, ptr %arrayidx15.1, align 8, !dbg !1698
  %xor16.1 = xor i64 %shr13.1, %41, !dbg !1699
  %and17.1 = and i64 %xor16.1, 71777214294589695, !dbg !1700
    #dbg_value(i64 %and17.1, !1701, !DIExpression(), !1702)
  %arrayidx19.1 = getelementptr inbounds nuw i8, ptr %M, i32 40, !dbg !1703
  %42 = load i64, ptr %arrayidx19.1, align 8, !dbg !1703
  %shr20.1 = lshr i64 %42, 8, !dbg !1704
  %arrayidx22.1 = getelementptr inbounds nuw i8, ptr %M, i32 56, !dbg !1705
  %43 = load i64, ptr %arrayidx22.1, align 8, !dbg !1705
  %xor23.1 = xor i64 %shr20.1, %43, !dbg !1706
  %and24.1 = and i64 %xor23.1, 71777214294589695, !dbg !1707
    #dbg_value(i64 %and24.1, !1708, !DIExpression(), !1702)
  %shl25.1 = shl nuw i64 %and17.1, 8, !dbg !1709
  %arrayidx26.1 = getelementptr inbounds nuw i8, ptr %M, i32 32, !dbg !1718
  %44 = load i64, ptr %arrayidx26.1, align 8, !dbg !1710
  %xor27.1 = xor i64 %44, %shl25.1, !dbg !1710
  store i64 %xor27.1, ptr %arrayidx26.1, align 8, !dbg !1710
  %shl28.1 = shl nuw i64 %and24.1, 8, !dbg !1711
  %arrayidx30.1 = getelementptr inbounds nuw i8, ptr %M, i32 40, !dbg !1712
  %45 = load i64, ptr %arrayidx30.1, align 8, !dbg !1713
  %xor31.1 = xor i64 %45, %shl28.1, !dbg !1713
  store i64 %xor31.1, ptr %arrayidx30.1, align 8, !dbg !1713
  %arrayidx33.1 = getelementptr inbounds nuw i8, ptr %M, i32 48, !dbg !1714
  %46 = load i64, ptr %arrayidx33.1, align 8, !dbg !1715
  %xor34.1 = xor i64 %46, %and17.1, !dbg !1715
  store i64 %xor34.1, ptr %arrayidx33.1, align 8, !dbg !1715
  %arrayidx36.1 = getelementptr inbounds nuw i8, ptr %M, i32 56, !dbg !1716
  %47 = load i64, ptr %arrayidx36.1, align 8, !dbg !1717
  %xor37.1 = xor i64 %47, %and24.1, !dbg !1717
  store i64 %xor37.1, ptr %arrayidx36.1, align 8, !dbg !1717
    #dbg_value(i32 8, !1691, !DIExpression(), !1693)
  %arrayidx12.2 = getelementptr inbounds nuw i8, ptr %M, i32 64, !dbg !1694
  %48 = load i64, ptr %arrayidx12.2, align 8, !dbg !1694
  %shr13.2 = lshr i64 %48, 8, !dbg !1697
  %arrayidx15.2 = getelementptr inbounds nuw i8, ptr %M, i32 80, !dbg !1698
  %49 = load i64, ptr %arrayidx15.2, align 8, !dbg !1698
  %xor16.2 = xor i64 %shr13.2, %49, !dbg !1699
  %and17.2 = and i64 %xor16.2, 71777214294589695, !dbg !1700
    #dbg_value(i64 %and17.2, !1701, !DIExpression(), !1702)
  %arrayidx19.2 = getelementptr inbounds nuw i8, ptr %M, i32 72, !dbg !1703
  %50 = load i64, ptr %arrayidx19.2, align 8, !dbg !1703
  %shr20.2 = lshr i64 %50, 8, !dbg !1704
  %arrayidx22.2 = getelementptr inbounds nuw i8, ptr %M, i32 88, !dbg !1705
  %51 = load i64, ptr %arrayidx22.2, align 8, !dbg !1705
  %xor23.2 = xor i64 %shr20.2, %51, !dbg !1706
  %and24.2 = and i64 %xor23.2, 71777214294589695, !dbg !1707
    #dbg_value(i64 %and24.2, !1708, !DIExpression(), !1702)
  %shl25.2 = shl nuw i64 %and17.2, 8, !dbg !1709
  %arrayidx26.2 = getelementptr inbounds nuw i8, ptr %M, i32 64, !dbg !1718
  %52 = load i64, ptr %arrayidx26.2, align 8, !dbg !1710
  %xor27.2 = xor i64 %52, %shl25.2, !dbg !1710
  store i64 %xor27.2, ptr %arrayidx26.2, align 8, !dbg !1710
  %shl28.2 = shl nuw i64 %and24.2, 8, !dbg !1711
  %arrayidx30.2 = getelementptr inbounds nuw i8, ptr %M, i32 72, !dbg !1712
  %53 = load i64, ptr %arrayidx30.2, align 8, !dbg !1713
  %xor31.2 = xor i64 %53, %shl28.2, !dbg !1713
  store i64 %xor31.2, ptr %arrayidx30.2, align 8, !dbg !1713
  %arrayidx33.2 = getelementptr inbounds nuw i8, ptr %M, i32 80, !dbg !1714
  %54 = load i64, ptr %arrayidx33.2, align 8, !dbg !1715
  %xor34.2 = xor i64 %54, %and17.2, !dbg !1715
  store i64 %xor34.2, ptr %arrayidx33.2, align 8, !dbg !1715
  %arrayidx36.2 = getelementptr inbounds nuw i8, ptr %M, i32 88, !dbg !1716
  %55 = load i64, ptr %arrayidx36.2, align 8, !dbg !1717
  %xor37.2 = xor i64 %55, %and24.2, !dbg !1717
  store i64 %xor37.2, ptr %arrayidx36.2, align 8, !dbg !1717
    #dbg_value(i32 12, !1691, !DIExpression(), !1693)
  %arrayidx12.3 = getelementptr inbounds nuw i8, ptr %M, i32 96, !dbg !1694
  %56 = load i64, ptr %arrayidx12.3, align 8, !dbg !1694
  %shr13.3 = lshr i64 %56, 8, !dbg !1697
  %arrayidx15.3 = getelementptr inbounds nuw i8, ptr %M, i32 112, !dbg !1698
  %57 = load i64, ptr %arrayidx15.3, align 8, !dbg !1698
  %xor16.3 = xor i64 %shr13.3, %57, !dbg !1699
  %and17.3 = and i64 %xor16.3, 71777214294589695, !dbg !1700
    #dbg_value(i64 %and17.3, !1701, !DIExpression(), !1702)
  %arrayidx19.3 = getelementptr inbounds nuw i8, ptr %M, i32 104, !dbg !1703
  %58 = load i64, ptr %arrayidx19.3, align 8, !dbg !1703
  %shr20.3 = lshr i64 %58, 8, !dbg !1704
  %arrayidx22.3 = getelementptr inbounds nuw i8, ptr %M, i32 120, !dbg !1705
  %59 = load i64, ptr %arrayidx22.3, align 8, !dbg !1705
  %xor23.3 = xor i64 %shr20.3, %59, !dbg !1706
  %and24.3 = and i64 %xor23.3, 71777214294589695, !dbg !1707
    #dbg_value(i64 %and24.3, !1708, !DIExpression(), !1702)
  %shl25.3 = shl nuw i64 %and17.3, 8, !dbg !1709
  %arrayidx26.3 = getelementptr inbounds nuw i8, ptr %M, i32 96, !dbg !1718
  %60 = load i64, ptr %arrayidx26.3, align 8, !dbg !1710
  %xor27.3 = xor i64 %60, %shl25.3, !dbg !1710
  store i64 %xor27.3, ptr %arrayidx26.3, align 8, !dbg !1710
  %shl28.3 = shl nuw i64 %and24.3, 8, !dbg !1711
  %arrayidx30.3 = getelementptr inbounds nuw i8, ptr %M, i32 104, !dbg !1712
  %61 = load i64, ptr %arrayidx30.3, align 8, !dbg !1713
  %xor31.3 = xor i64 %61, %shl28.3, !dbg !1713
  store i64 %xor31.3, ptr %arrayidx30.3, align 8, !dbg !1713
  %arrayidx33.3 = getelementptr inbounds nuw i8, ptr %M, i32 112, !dbg !1714
  %62 = load i64, ptr %arrayidx33.3, align 8, !dbg !1715
  %xor34.3 = xor i64 %62, %and17.3, !dbg !1715
  store i64 %xor34.3, ptr %arrayidx33.3, align 8, !dbg !1715
  %arrayidx36.3 = getelementptr inbounds nuw i8, ptr %M, i32 120, !dbg !1716
  %63 = load i64, ptr %arrayidx36.3, align 8, !dbg !1717
  %xor37.3 = xor i64 %63, %and24.3, !dbg !1717
  store i64 %xor37.3, ptr %arrayidx36.3, align 8, !dbg !1717
    #dbg_value(i32 16, !1691, !DIExpression(), !1693)
    #dbg_value(i32 0, !1719, !DIExpression(), !1721)
  %64 = load i64, ptr %M, align 8, !dbg !1722
  %shr47 = lshr i64 %64, 16, !dbg !1725
  %arrayidx49 = getelementptr inbounds nuw i8, ptr %M, i32 32, !dbg !1726
  %65 = load i64, ptr %arrayidx49, align 8, !dbg !1726
  %xor50 = xor i64 %shr47, %65, !dbg !1727
  %and51 = and i64 %xor50, 281470681808895, !dbg !1728
    #dbg_value(i64 %and51, !1729, !DIExpression(), !1730)
  %arrayidx54 = getelementptr inbounds nuw i8, ptr %M, i32 64, !dbg !1731
  %66 = load i64, ptr %arrayidx54, align 8, !dbg !1731
  %shr55 = lshr i64 %66, 16, !dbg !1732
  %arrayidx57 = getelementptr inbounds nuw i8, ptr %M, i32 96, !dbg !1733
  %67 = load i64, ptr %arrayidx57, align 8, !dbg !1733
  %xor58 = xor i64 %shr55, %67, !dbg !1734
  %and59 = and i64 %xor58, 281470681808895, !dbg !1735
    #dbg_value(i64 %and59, !1736, !DIExpression(), !1730)
  %shl60 = shl nuw i64 %and51, 16, !dbg !1737
  %68 = load i64, ptr %M, align 8, !dbg !1738
  %xor62 = xor i64 %68, %shl60, !dbg !1738
  store i64 %xor62, ptr %M, align 8, !dbg !1738
  %shl63 = shl nuw i64 %and59, 16, !dbg !1739
  %arrayidx65 = getelementptr inbounds nuw i8, ptr %M, i32 64, !dbg !1740
  %69 = load i64, ptr %arrayidx65, align 8, !dbg !1741
  %xor66 = xor i64 %69, %shl63, !dbg !1741
  store i64 %xor66, ptr %arrayidx65, align 8, !dbg !1741
  %arrayidx68 = getelementptr inbounds nuw i8, ptr %M, i32 32, !dbg !1742
  %70 = load i64, ptr %arrayidx68, align 8, !dbg !1743
  %xor69 = xor i64 %70, %and51, !dbg !1743
  store i64 %xor69, ptr %arrayidx68, align 8, !dbg !1743
  %arrayidx71 = getelementptr inbounds nuw i8, ptr %M, i32 96, !dbg !1744
  %71 = load i64, ptr %arrayidx71, align 8, !dbg !1745
  %xor72 = xor i64 %71, %and59, !dbg !1745
  store i64 %xor72, ptr %arrayidx71, align 8, !dbg !1745
    #dbg_value(i32 1, !1719, !DIExpression(), !1721)
  %arrayidx46.1 = getelementptr inbounds nuw i8, ptr %M, i32 8, !dbg !1722
  %72 = load i64, ptr %arrayidx46.1, align 8, !dbg !1722
  %shr47.1 = lshr i64 %72, 16, !dbg !1725
  %arrayidx49.1 = getelementptr inbounds nuw i8, ptr %M, i32 40, !dbg !1726
  %73 = load i64, ptr %arrayidx49.1, align 8, !dbg !1726
  %xor50.1 = xor i64 %shr47.1, %73, !dbg !1727
  %and51.1 = and i64 %xor50.1, 281470681808895, !dbg !1728
    #dbg_value(i64 %and51.1, !1729, !DIExpression(), !1730)
  %arrayidx54.1 = getelementptr inbounds nuw i8, ptr %M, i32 72, !dbg !1731
  %74 = load i64, ptr %arrayidx54.1, align 8, !dbg !1731
  %shr55.1 = lshr i64 %74, 16, !dbg !1732
  %arrayidx57.1 = getelementptr inbounds nuw i8, ptr %M, i32 104, !dbg !1733
  %75 = load i64, ptr %arrayidx57.1, align 8, !dbg !1733
  %xor58.1 = xor i64 %shr55.1, %75, !dbg !1734
  %and59.1 = and i64 %xor58.1, 281470681808895, !dbg !1735
    #dbg_value(i64 %and59.1, !1736, !DIExpression(), !1730)
  %shl60.1 = shl nuw i64 %and51.1, 16, !dbg !1737
  %arrayidx61.1 = getelementptr inbounds nuw i8, ptr %M, i32 8, !dbg !1746
  %76 = load i64, ptr %arrayidx61.1, align 8, !dbg !1738
  %xor62.1 = xor i64 %76, %shl60.1, !dbg !1738
  store i64 %xor62.1, ptr %arrayidx61.1, align 8, !dbg !1738
  %shl63.1 = shl nuw i64 %and59.1, 16, !dbg !1739
  %arrayidx65.1 = getelementptr inbounds nuw i8, ptr %M, i32 72, !dbg !1740
  %77 = load i64, ptr %arrayidx65.1, align 8, !dbg !1741
  %xor66.1 = xor i64 %77, %shl63.1, !dbg !1741
  store i64 %xor66.1, ptr %arrayidx65.1, align 8, !dbg !1741
  %arrayidx68.1 = getelementptr inbounds nuw i8, ptr %M, i32 40, !dbg !1742
  %78 = load i64, ptr %arrayidx68.1, align 8, !dbg !1743
  %xor69.1 = xor i64 %78, %and51.1, !dbg !1743
  store i64 %xor69.1, ptr %arrayidx68.1, align 8, !dbg !1743
  %arrayidx71.1 = getelementptr inbounds nuw i8, ptr %M, i32 104, !dbg !1744
  %79 = load i64, ptr %arrayidx71.1, align 8, !dbg !1745
  %xor72.1 = xor i64 %79, %and59.1, !dbg !1745
  store i64 %xor72.1, ptr %arrayidx71.1, align 8, !dbg !1745
    #dbg_value(i32 2, !1719, !DIExpression(), !1721)
  %arrayidx46.2 = getelementptr inbounds nuw i8, ptr %M, i32 16, !dbg !1722
  %80 = load i64, ptr %arrayidx46.2, align 8, !dbg !1722
  %shr47.2 = lshr i64 %80, 16, !dbg !1725
  %arrayidx49.2 = getelementptr inbounds nuw i8, ptr %M, i32 48, !dbg !1726
  %81 = load i64, ptr %arrayidx49.2, align 8, !dbg !1726
  %xor50.2 = xor i64 %shr47.2, %81, !dbg !1727
  %and51.2 = and i64 %xor50.2, 281470681808895, !dbg !1728
    #dbg_value(i64 %and51.2, !1729, !DIExpression(), !1730)
  %arrayidx54.2 = getelementptr inbounds nuw i8, ptr %M, i32 80, !dbg !1731
  %82 = load i64, ptr %arrayidx54.2, align 8, !dbg !1731
  %shr55.2 = lshr i64 %82, 16, !dbg !1732
  %arrayidx57.2 = getelementptr inbounds nuw i8, ptr %M, i32 112, !dbg !1733
  %83 = load i64, ptr %arrayidx57.2, align 8, !dbg !1733
  %xor58.2 = xor i64 %shr55.2, %83, !dbg !1734
  %and59.2 = and i64 %xor58.2, 281470681808895, !dbg !1735
    #dbg_value(i64 %and59.2, !1736, !DIExpression(), !1730)
  %shl60.2 = shl nuw i64 %and51.2, 16, !dbg !1737
  %arrayidx61.2 = getelementptr inbounds nuw i8, ptr %M, i32 16, !dbg !1746
  %84 = load i64, ptr %arrayidx61.2, align 8, !dbg !1738
  %xor62.2 = xor i64 %84, %shl60.2, !dbg !1738
  store i64 %xor62.2, ptr %arrayidx61.2, align 8, !dbg !1738
  %shl63.2 = shl nuw i64 %and59.2, 16, !dbg !1739
  %arrayidx65.2 = getelementptr inbounds nuw i8, ptr %M, i32 80, !dbg !1740
  %85 = load i64, ptr %arrayidx65.2, align 8, !dbg !1741
  %xor66.2 = xor i64 %85, %shl63.2, !dbg !1741
  store i64 %xor66.2, ptr %arrayidx65.2, align 8, !dbg !1741
  %arrayidx68.2 = getelementptr inbounds nuw i8, ptr %M, i32 48, !dbg !1742
  %86 = load i64, ptr %arrayidx68.2, align 8, !dbg !1743
  %xor69.2 = xor i64 %86, %and51.2, !dbg !1743
  store i64 %xor69.2, ptr %arrayidx68.2, align 8, !dbg !1743
  %arrayidx71.2 = getelementptr inbounds nuw i8, ptr %M, i32 112, !dbg !1744
  %87 = load i64, ptr %arrayidx71.2, align 8, !dbg !1745
  %xor72.2 = xor i64 %87, %and59.2, !dbg !1745
  store i64 %xor72.2, ptr %arrayidx71.2, align 8, !dbg !1745
    #dbg_value(i32 3, !1719, !DIExpression(), !1721)
  %arrayidx46.3 = getelementptr inbounds nuw i8, ptr %M, i32 24, !dbg !1722
  %88 = load i64, ptr %arrayidx46.3, align 8, !dbg !1722
  %shr47.3 = lshr i64 %88, 16, !dbg !1725
  %arrayidx49.3 = getelementptr inbounds nuw i8, ptr %M, i32 56, !dbg !1726
  %89 = load i64, ptr %arrayidx49.3, align 8, !dbg !1726
  %xor50.3 = xor i64 %shr47.3, %89, !dbg !1727
  %and51.3 = and i64 %xor50.3, 281470681808895, !dbg !1728
    #dbg_value(i64 %and51.3, !1729, !DIExpression(), !1730)
  %arrayidx54.3 = getelementptr inbounds nuw i8, ptr %M, i32 88, !dbg !1731
  %90 = load i64, ptr %arrayidx54.3, align 8, !dbg !1731
  %shr55.3 = lshr i64 %90, 16, !dbg !1732
  %arrayidx57.3 = getelementptr inbounds nuw i8, ptr %M, i32 120, !dbg !1733
  %91 = load i64, ptr %arrayidx57.3, align 8, !dbg !1733
  %xor58.3 = xor i64 %shr55.3, %91, !dbg !1734
  %and59.3 = and i64 %xor58.3, 281470681808895, !dbg !1735
    #dbg_value(i64 %and59.3, !1736, !DIExpression(), !1730)
  %shl60.3 = shl nuw i64 %and51.3, 16, !dbg !1737
  %arrayidx61.3 = getelementptr inbounds nuw i8, ptr %M, i32 24, !dbg !1746
  %92 = load i64, ptr %arrayidx61.3, align 8, !dbg !1738
  %xor62.3 = xor i64 %92, %shl60.3, !dbg !1738
  store i64 %xor62.3, ptr %arrayidx61.3, align 8, !dbg !1738
  %shl63.3 = shl nuw i64 %and59.3, 16, !dbg !1739
  %arrayidx65.3 = getelementptr inbounds nuw i8, ptr %M, i32 88, !dbg !1740
  %93 = load i64, ptr %arrayidx65.3, align 8, !dbg !1741
  %xor66.3 = xor i64 %93, %shl63.3, !dbg !1741
  store i64 %xor66.3, ptr %arrayidx65.3, align 8, !dbg !1741
  %arrayidx68.3 = getelementptr inbounds nuw i8, ptr %M, i32 56, !dbg !1742
  %94 = load i64, ptr %arrayidx68.3, align 8, !dbg !1743
  %xor69.3 = xor i64 %94, %and51.3, !dbg !1743
  store i64 %xor69.3, ptr %arrayidx68.3, align 8, !dbg !1743
  %arrayidx71.3 = getelementptr inbounds nuw i8, ptr %M, i32 120, !dbg !1744
  %95 = load i64, ptr %arrayidx71.3, align 8, !dbg !1745
  %xor72.3 = xor i64 %95, %and59.3, !dbg !1745
  store i64 %xor72.3, ptr %arrayidx71.3, align 8, !dbg !1745
    #dbg_value(i32 4, !1719, !DIExpression(), !1721)
    #dbg_value(i32 0, !1747, !DIExpression(), !1749)
  %96 = load i64, ptr %M, align 8, !dbg !1750
  %shr81 = lshr i64 %96, 32, !dbg !1753
  %arrayidx83 = getelementptr inbounds nuw i8, ptr %M, i32 64, !dbg !1754
  %97 = load i64, ptr %arrayidx83, align 8, !dbg !1754
  %.masked = and i64 %97, 4294967295, !dbg !1755
  %and85 = xor i64 %shr81, %.masked, !dbg !1755
    #dbg_value(i64 %and85, !1756, !DIExpression(), !1757)
  %shl86 = shl nuw i64 %and85, 32, !dbg !1758
  %98 = load i64, ptr %M, align 8, !dbg !1759
  %xor88 = xor i64 %98, %shl86, !dbg !1759
  store i64 %xor88, ptr %M, align 8, !dbg !1759
  %arrayidx90 = getelementptr inbounds nuw i8, ptr %M, i32 64, !dbg !1760
  %99 = load i64, ptr %arrayidx90, align 8, !dbg !1761
  %xor91 = xor i64 %99, %and85, !dbg !1761
  store i64 %xor91, ptr %arrayidx90, align 8, !dbg !1761
    #dbg_value(i32 1, !1747, !DIExpression(), !1749)
  %arrayidx80.1 = getelementptr inbounds nuw i8, ptr %M, i32 8, !dbg !1750
  %100 = load i64, ptr %arrayidx80.1, align 8, !dbg !1750
  %shr81.1 = lshr i64 %100, 32, !dbg !1753
  %arrayidx83.1 = getelementptr inbounds nuw i8, ptr %M, i32 72, !dbg !1754
  %101 = load i64, ptr %arrayidx83.1, align 8, !dbg !1754
  %.masked.1 = and i64 %101, 4294967295, !dbg !1755
  %and85.1 = xor i64 %shr81.1, %.masked.1, !dbg !1755
    #dbg_value(i64 %and85.1, !1756, !DIExpression(), !1757)
  %shl86.1 = shl nuw i64 %and85.1, 32, !dbg !1758
  %arrayidx87.1 = getelementptr inbounds nuw i8, ptr %M, i32 8, !dbg !1762
  %102 = load i64, ptr %arrayidx87.1, align 8, !dbg !1759
  %xor88.1 = xor i64 %102, %shl86.1, !dbg !1759
  store i64 %xor88.1, ptr %arrayidx87.1, align 8, !dbg !1759
  %arrayidx90.1 = getelementptr inbounds nuw i8, ptr %M, i32 72, !dbg !1760
  %103 = load i64, ptr %arrayidx90.1, align 8, !dbg !1761
  %xor91.1 = xor i64 %103, %and85.1, !dbg !1761
  store i64 %xor91.1, ptr %arrayidx90.1, align 8, !dbg !1761
    #dbg_value(i32 2, !1747, !DIExpression(), !1749)
  %arrayidx80.2 = getelementptr inbounds nuw i8, ptr %M, i32 16, !dbg !1750
  %104 = load i64, ptr %arrayidx80.2, align 8, !dbg !1750
  %shr81.2 = lshr i64 %104, 32, !dbg !1753
  %arrayidx83.2 = getelementptr inbounds nuw i8, ptr %M, i32 80, !dbg !1754
  %105 = load i64, ptr %arrayidx83.2, align 8, !dbg !1754
  %.masked.2 = and i64 %105, 4294967295, !dbg !1755
  %and85.2 = xor i64 %shr81.2, %.masked.2, !dbg !1755
    #dbg_value(i64 %and85.2, !1756, !DIExpression(), !1757)
  %shl86.2 = shl nuw i64 %and85.2, 32, !dbg !1758
  %arrayidx87.2 = getelementptr inbounds nuw i8, ptr %M, i32 16, !dbg !1762
  %106 = load i64, ptr %arrayidx87.2, align 8, !dbg !1759
  %xor88.2 = xor i64 %106, %shl86.2, !dbg !1759
  store i64 %xor88.2, ptr %arrayidx87.2, align 8, !dbg !1759
  %arrayidx90.2 = getelementptr inbounds nuw i8, ptr %M, i32 80, !dbg !1760
  %107 = load i64, ptr %arrayidx90.2, align 8, !dbg !1761
  %xor91.2 = xor i64 %107, %and85.2, !dbg !1761
  store i64 %xor91.2, ptr %arrayidx90.2, align 8, !dbg !1761
    #dbg_value(i32 3, !1747, !DIExpression(), !1749)
  %arrayidx80.3 = getelementptr inbounds nuw i8, ptr %M, i32 24, !dbg !1750
  %108 = load i64, ptr %arrayidx80.3, align 8, !dbg !1750
  %shr81.3 = lshr i64 %108, 32, !dbg !1753
  %arrayidx83.3 = getelementptr inbounds nuw i8, ptr %M, i32 88, !dbg !1754
  %109 = load i64, ptr %arrayidx83.3, align 8, !dbg !1754
  %.masked.3 = and i64 %109, 4294967295, !dbg !1755
  %and85.3 = xor i64 %shr81.3, %.masked.3, !dbg !1755
    #dbg_value(i64 %and85.3, !1756, !DIExpression(), !1757)
  %shl86.3 = shl nuw i64 %and85.3, 32, !dbg !1758
  %arrayidx87.3 = getelementptr inbounds nuw i8, ptr %M, i32 24, !dbg !1762
  %110 = load i64, ptr %arrayidx87.3, align 8, !dbg !1759
  %xor88.3 = xor i64 %110, %shl86.3, !dbg !1759
  store i64 %xor88.3, ptr %arrayidx87.3, align 8, !dbg !1759
  %arrayidx90.3 = getelementptr inbounds nuw i8, ptr %M, i32 88, !dbg !1760
  %111 = load i64, ptr %arrayidx90.3, align 8, !dbg !1761
  %xor91.3 = xor i64 %111, %and85.3, !dbg !1761
  store i64 %xor91.3, ptr %arrayidx90.3, align 8, !dbg !1761
    #dbg_value(i32 4, !1747, !DIExpression(), !1749)
  %arrayidx80.4 = getelementptr inbounds nuw i8, ptr %M, i32 32, !dbg !1750
  %112 = load i64, ptr %arrayidx80.4, align 8, !dbg !1750
  %shr81.4 = lshr i64 %112, 32, !dbg !1753
  %arrayidx83.4 = getelementptr inbounds nuw i8, ptr %M, i32 96, !dbg !1754
  %113 = load i64, ptr %arrayidx83.4, align 8, !dbg !1754
  %.masked.4 = and i64 %113, 4294967295, !dbg !1755
  %and85.4 = xor i64 %shr81.4, %.masked.4, !dbg !1755
    #dbg_value(i64 %and85.4, !1756, !DIExpression(), !1757)
  %shl86.4 = shl nuw i64 %and85.4, 32, !dbg !1758
  %arrayidx87.4 = getelementptr inbounds nuw i8, ptr %M, i32 32, !dbg !1762
  %114 = load i64, ptr %arrayidx87.4, align 8, !dbg !1759
  %xor88.4 = xor i64 %114, %shl86.4, !dbg !1759
  store i64 %xor88.4, ptr %arrayidx87.4, align 8, !dbg !1759
  %arrayidx90.4 = getelementptr inbounds nuw i8, ptr %M, i32 96, !dbg !1760
  %115 = load i64, ptr %arrayidx90.4, align 8, !dbg !1761
  %xor91.4 = xor i64 %115, %and85.4, !dbg !1761
  store i64 %xor91.4, ptr %arrayidx90.4, align 8, !dbg !1761
    #dbg_value(i32 5, !1747, !DIExpression(), !1749)
  %arrayidx80.5 = getelementptr inbounds nuw i8, ptr %M, i32 40, !dbg !1750
  %116 = load i64, ptr %arrayidx80.5, align 8, !dbg !1750
  %shr81.5 = lshr i64 %116, 32, !dbg !1753
  %arrayidx83.5 = getelementptr inbounds nuw i8, ptr %M, i32 104, !dbg !1754
  %117 = load i64, ptr %arrayidx83.5, align 8, !dbg !1754
  %.masked.5 = and i64 %117, 4294967295, !dbg !1755
  %and85.5 = xor i64 %shr81.5, %.masked.5, !dbg !1755
    #dbg_value(i64 %and85.5, !1756, !DIExpression(), !1757)
  %shl86.5 = shl nuw i64 %and85.5, 32, !dbg !1758
  %arrayidx87.5 = getelementptr inbounds nuw i8, ptr %M, i32 40, !dbg !1762
  %118 = load i64, ptr %arrayidx87.5, align 8, !dbg !1759
  %xor88.5 = xor i64 %118, %shl86.5, !dbg !1759
  store i64 %xor88.5, ptr %arrayidx87.5, align 8, !dbg !1759
  %arrayidx90.5 = getelementptr inbounds nuw i8, ptr %M, i32 104, !dbg !1760
  %119 = load i64, ptr %arrayidx90.5, align 8, !dbg !1761
  %xor91.5 = xor i64 %119, %and85.5, !dbg !1761
  store i64 %xor91.5, ptr %arrayidx90.5, align 8, !dbg !1761
    #dbg_value(i32 6, !1747, !DIExpression(), !1749)
  %arrayidx80.6 = getelementptr inbounds nuw i8, ptr %M, i32 48, !dbg !1750
  %120 = load i64, ptr %arrayidx80.6, align 8, !dbg !1750
  %shr81.6 = lshr i64 %120, 32, !dbg !1753
  %arrayidx83.6 = getelementptr inbounds nuw i8, ptr %M, i32 112, !dbg !1754
  %121 = load i64, ptr %arrayidx83.6, align 8, !dbg !1754
  %.masked.6 = and i64 %121, 4294967295, !dbg !1755
  %and85.6 = xor i64 %shr81.6, %.masked.6, !dbg !1755
    #dbg_value(i64 %and85.6, !1756, !DIExpression(), !1757)
  %shl86.6 = shl nuw i64 %and85.6, 32, !dbg !1758
  %arrayidx87.6 = getelementptr inbounds nuw i8, ptr %M, i32 48, !dbg !1762
  %122 = load i64, ptr %arrayidx87.6, align 8, !dbg !1759
  %xor88.6 = xor i64 %122, %shl86.6, !dbg !1759
  store i64 %xor88.6, ptr %arrayidx87.6, align 8, !dbg !1759
  %arrayidx90.6 = getelementptr inbounds nuw i8, ptr %M, i32 112, !dbg !1760
  %123 = load i64, ptr %arrayidx90.6, align 8, !dbg !1761
  %xor91.6 = xor i64 %123, %and85.6, !dbg !1761
  store i64 %xor91.6, ptr %arrayidx90.6, align 8, !dbg !1761
    #dbg_value(i32 7, !1747, !DIExpression(), !1749)
  %arrayidx80.7 = getelementptr inbounds nuw i8, ptr %M, i32 56, !dbg !1750
  %124 = load i64, ptr %arrayidx80.7, align 8, !dbg !1750
  %shr81.7 = lshr i64 %124, 32, !dbg !1753
  %arrayidx83.7 = getelementptr inbounds nuw i8, ptr %M, i32 120, !dbg !1754
  %125 = load i64, ptr %arrayidx83.7, align 8, !dbg !1754
  %.masked.7 = and i64 %125, 4294967295, !dbg !1755
  %and85.7 = xor i64 %shr81.7, %.masked.7, !dbg !1755
    #dbg_value(i64 %and85.7, !1756, !DIExpression(), !1757)
  %shl86.7 = shl nuw i64 %and85.7, 32, !dbg !1758
  %arrayidx87.7 = getelementptr inbounds nuw i8, ptr %M, i32 56, !dbg !1762
  %126 = load i64, ptr %arrayidx87.7, align 8, !dbg !1759
  %xor88.7 = xor i64 %126, %shl86.7, !dbg !1759
  store i64 %xor88.7, ptr %arrayidx87.7, align 8, !dbg !1759
  %arrayidx90.7 = getelementptr inbounds nuw i8, ptr %M, i32 120, !dbg !1760
  %127 = load i64, ptr %arrayidx90.7, align 8, !dbg !1761
  %xor91.7 = xor i64 %127, %and85.7, !dbg !1761
  store i64 %xor91.7, ptr %arrayidx90.7, align 8, !dbg !1761
    #dbg_value(i32 8, !1747, !DIExpression(), !1749)
  ret void, !dbg !1763
}

; Function Attrs: nounwind
define internal fastcc void @mul_add_mat_x_m_mat(i32 noundef %m_vec_limbs, ptr noundef %mat, ptr noundef %bs_mat, ptr noundef %acc, i32 noundef %mat_rows, i32 noundef %mat_cols, i32 noundef %bs_mat_cols) unnamed_addr #0 !dbg !1764 {
entry:
    #dbg_value(i32 %m_vec_limbs, !1765, !DIExpression(), !1766)
    #dbg_value(ptr %mat, !1767, !DIExpression(), !1766)
    #dbg_value(ptr %bs_mat, !1768, !DIExpression(), !1766)
    #dbg_value(ptr %acc, !1769, !DIExpression(), !1766)
    #dbg_value(i32 %mat_rows, !1770, !DIExpression(), !1766)
    #dbg_value(i32 %mat_cols, !1771, !DIExpression(), !1766)
    #dbg_value(i32 %bs_mat_cols, !1772, !DIExpression(), !1766)
    #dbg_value(i32 0, !1773, !DIExpression(), !1775)
  %smax = call i32 @llvm.smax.i32(i32 %bs_mat_cols, i32 0), !dbg !1776
  %smax1 = call i32 @llvm.smax.i32(i32 %mat_cols, i32 0), !dbg !1776
  %smax3 = call i32 @llvm.smax.i32(i32 %mat_rows, i32 0), !dbg !1776
  br label %for.cond, !dbg !1776

for.cond:                                         ; preds = %for.inc17, %entry
  %r.0 = phi i32 [ 0, %entry ], [ %inc18, %for.inc17 ], !dbg !1777
    #dbg_value(i32 %r.0, !1773, !DIExpression(), !1775)
  %exitcond4.not = icmp eq i32 %r.0, %smax3, !dbg !1778
  br i1 %exitcond4.not, label %for.end19, label %for.cond1, !dbg !1780

for.cond1:                                        ; preds = %for.cond, %for.inc15
  %c.0 = phi i32 [ %inc, %for.inc15 ], [ 0, %for.cond ], !dbg !1781
    #dbg_value(i32 %c.0, !1784, !DIExpression(), !1785)
  %exitcond2.not = icmp eq i32 %c.0, %smax1, !dbg !1786
  br i1 %exitcond2.not, label %for.inc17, label %for.cond4, !dbg !1788

for.cond4:                                        ; preds = %for.cond1, %for.body6
  %k.0 = phi i32 [ %add14, %for.body6 ], [ 0, %for.cond1 ], !dbg !1789
    #dbg_value(i32 %k.0, !1792, !DIExpression(), !1793)
  %exitcond.not = icmp eq i32 %k.0, %smax, !dbg !1794
  br i1 %exitcond.not, label %for.inc15, label %for.body6, !dbg !1796

for.body6:                                        ; preds = %for.cond4
  %mul = mul nsw i32 %c.0, %bs_mat_cols, !dbg !1797
  %add = add nsw i32 %mul, %k.0, !dbg !1799
  %mul7 = mul nsw i32 %m_vec_limbs, %add, !dbg !1800
  %add.ptr = getelementptr inbounds i64, ptr %bs_mat, i32 %mul7, !dbg !1801
  %mul8 = mul nsw i32 %r.0, %mat_cols, !dbg !1802
  %0 = getelementptr i8, ptr %mat, i32 %mul8, !dbg !1803
  %arrayidx = getelementptr i8, ptr %0, i32 %c.0, !dbg !1803
  %1 = load i8, ptr %arrayidx, align 1, !dbg !1803
  %mul10 = mul nsw i32 %r.0, %bs_mat_cols, !dbg !1804
  %add11 = add nsw i32 %mul10, %k.0, !dbg !1805
  %mul12 = mul nsw i32 %m_vec_limbs, %add11, !dbg !1806
  %add.ptr13 = getelementptr inbounds i64, ptr %acc, i32 %mul12, !dbg !1807
  call fastcc void @m_vec_mul_add(i32 noundef %m_vec_limbs, ptr noundef %add.ptr, i8 noundef zeroext %1, ptr noundef %add.ptr13) #6, !dbg !1808
  %add14 = add nuw i32 %k.0, 1, !dbg !1809
    #dbg_value(i32 %add14, !1792, !DIExpression(), !1793)
  br label %for.cond4, !dbg !1810, !llvm.loop !1811

for.inc15:                                        ; preds = %for.cond4
  %inc = add nuw i32 %c.0, 1, !dbg !1813
    #dbg_value(i32 %inc, !1784, !DIExpression(), !1785)
  br label %for.cond1, !dbg !1814, !llvm.loop !1815

for.inc17:                                        ; preds = %for.cond1
  %inc18 = add nuw i32 %r.0, 1, !dbg !1817
    #dbg_value(i32 %inc18, !1773, !DIExpression(), !1775)
  br label %for.cond, !dbg !1818, !llvm.loop !1819

for.end19:                                        ; preds = %for.cond
  ret void, !dbg !1821
}

; Function Attrs: nounwind
define internal fastcc void @P1_times_Vt(ptr noundef %p, ptr noundef %P1, ptr noundef %V, ptr noundef %acc) unnamed_addr #0 !dbg !1822 {
entry:
    #dbg_value(ptr %p, !1823, !DIExpression(), !1824)
    #dbg_value(ptr %P1, !1825, !DIExpression(), !1824)
    #dbg_value(ptr %V, !1826, !DIExpression(), !1824)
    #dbg_value(ptr %acc, !1827, !DIExpression(), !1824)
  call fastcc void @mul_add_m_upper_triangular_mat_x_mat_trans(i32 noundef 9, ptr noundef %P1, ptr noundef %V, ptr noundef %acc, i32 noundef 142, i32 noundef 142, i32 noundef 12, i32 noundef 1) #6, !dbg !1828
  ret void, !dbg !1829
}

; Function Attrs: nounwind
define internal fastcc void @mul_add_m_upper_triangular_mat_x_mat_trans(i32 noundef %m_vec_limbs, ptr noundef %bs_mat, ptr noundef %mat, ptr noundef %acc, i32 noundef %bs_mat_rows, i32 noundef %bs_mat_cols, i32 noundef %mat_rows, i32 noundef %triangular) unnamed_addr #0 !dbg !1830 {
entry:
    #dbg_value(i32 %m_vec_limbs, !1831, !DIExpression(), !1832)
    #dbg_value(ptr %bs_mat, !1833, !DIExpression(), !1832)
    #dbg_value(ptr %mat, !1834, !DIExpression(), !1832)
    #dbg_value(ptr %acc, !1835, !DIExpression(), !1832)
    #dbg_value(i32 %bs_mat_rows, !1836, !DIExpression(), !1832)
    #dbg_value(i32 %bs_mat_cols, !1837, !DIExpression(), !1832)
    #dbg_value(i32 %mat_rows, !1838, !DIExpression(), !1832)
    #dbg_value(i32 %triangular, !1839, !DIExpression(), !1832)
    #dbg_value(i32 0, !1840, !DIExpression(), !1832)
    #dbg_value(i32 0, !1841, !DIExpression(), !1843)
  %smax = call i32 @llvm.smax.i32(i32 %mat_rows, i32 0), !dbg !1844
  %smax1 = call i32 @llvm.smax.i32(i32 %bs_mat_rows, i32 0), !dbg !1844
  br label %for.cond, !dbg !1844

for.cond:                                         ; preds = %for.inc17, %entry
  %bs_mat_entries_used.0 = phi i32 [ 0, %entry ], [ %bs_mat_entries_used.1, %for.inc17 ], !dbg !1845
  %r.0 = phi i32 [ 0, %entry ], [ %inc18, %for.inc17 ], !dbg !1846
    #dbg_value(i32 %r.0, !1841, !DIExpression(), !1843)
    #dbg_value(i32 %bs_mat_entries_used.0, !1840, !DIExpression(), !1832)
  %exitcond2.not = icmp eq i32 %r.0, %smax1, !dbg !1847
  br i1 %exitcond2.not, label %for.end19, label %for.body, !dbg !1849

for.body:                                         ; preds = %for.cond
  %mul = mul nsw i32 %triangular, %r.0, !dbg !1850
    #dbg_value(i32 %mul, !1853, !DIExpression(), !1854)
  br label %for.cond1, !dbg !1855

for.cond1:                                        ; preds = %for.inc15, %for.body
  %bs_mat_entries_used.1 = phi i32 [ %bs_mat_entries_used.0, %for.body ], [ %add14, %for.inc15 ], !dbg !1832
  %c.0 = phi i32 [ %mul, %for.body ], [ %inc, %for.inc15 ], !dbg !1856
    #dbg_value(i32 %c.0, !1853, !DIExpression(), !1854)
    #dbg_value(i32 %bs_mat_entries_used.1, !1840, !DIExpression(), !1832)
  %cmp2 = icmp slt i32 %c.0, %bs_mat_cols, !dbg !1857
  br i1 %cmp2, label %for.cond4, label %for.inc17, !dbg !1859

for.cond4:                                        ; preds = %for.cond1, %for.body6
  %k.0 = phi i32 [ %add13, %for.body6 ], [ 0, %for.cond1 ], !dbg !1860
    #dbg_value(i32 %k.0, !1863, !DIExpression(), !1864)
  %exitcond.not = icmp eq i32 %k.0, %smax, !dbg !1865
  br i1 %exitcond.not, label %for.inc15, label %for.body6, !dbg !1867

for.body6:                                        ; preds = %for.cond4
  %mul7 = mul nsw i32 %m_vec_limbs, %bs_mat_entries_used.1, !dbg !1868
  %add.ptr = getelementptr inbounds i64, ptr %bs_mat, i32 %mul7, !dbg !1870
  %mul8 = mul nsw i32 %k.0, %bs_mat_cols, !dbg !1871
  %0 = getelementptr i8, ptr %mat, i32 %mul8, !dbg !1872
  %arrayidx = getelementptr i8, ptr %0, i32 %c.0, !dbg !1872
  %1 = load i8, ptr %arrayidx, align 1, !dbg !1872
  %mul9 = mul nsw i32 %r.0, %mat_rows, !dbg !1873
  %add10 = add nsw i32 %mul9, %k.0, !dbg !1874
  %mul11 = mul nsw i32 %m_vec_limbs, %add10, !dbg !1875
  %add.ptr12 = getelementptr inbounds i64, ptr %acc, i32 %mul11, !dbg !1876
  call fastcc void @m_vec_mul_add(i32 noundef %m_vec_limbs, ptr noundef %add.ptr, i8 noundef zeroext %1, ptr noundef %add.ptr12) #6, !dbg !1877
  %add13 = add nuw i32 %k.0, 1, !dbg !1878
    #dbg_value(i32 %add13, !1863, !DIExpression(), !1864)
  br label %for.cond4, !dbg !1879, !llvm.loop !1880

for.inc15:                                        ; preds = %for.cond4
    #dbg_value(i32 %bs_mat_entries_used.1, !1840, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1832)
  %add14 = add nsw i32 %bs_mat_entries_used.1, 1, !dbg !1882
    #dbg_value(i32 %add14, !1840, !DIExpression(), !1832)
  %inc = add nsw i32 %c.0, 1, !dbg !1883
    #dbg_value(i32 %inc, !1853, !DIExpression(), !1854)
  br label %for.cond1, !dbg !1884, !llvm.loop !1885

for.inc17:                                        ; preds = %for.cond1
  %inc18 = add nuw i32 %r.0, 1, !dbg !1887
    #dbg_value(i32 %inc18, !1841, !DIExpression(), !1843)
  br label %for.cond, !dbg !1888, !llvm.loop !1889

for.end19:                                        ; preds = %for.cond
  ret void, !dbg !1891
}

; Function Attrs: nounwind
define dso_local i32 @pqmayo_MAYO_5_ref_mayo_sign(ptr noundef %p, ptr noundef %sm, ptr noundef %smlen, ptr noundef %m, i32 noundef %mlen, ptr noundef %csk) local_unnamed_addr #0 !dbg !1892 {
entry:
  %siglen = alloca i32, align 4
    #dbg_value(ptr %p, !1893, !DIExpression(), !1894)
    #dbg_value(ptr %sm, !1895, !DIExpression(), !1894)
    #dbg_value(ptr %smlen, !1896, !DIExpression(), !1894)
    #dbg_value(ptr %m, !1897, !DIExpression(), !1894)
    #dbg_value(i32 %mlen, !1898, !DIExpression(), !1894)
    #dbg_value(ptr %csk, !1899, !DIExpression(), !1894)
    #dbg_value(i32 0, !1900, !DIExpression(), !1894)
    #dbg_value(i32 964, !1901, !DIExpression(), !1894)
  %add.ptr = getelementptr inbounds nuw i8, ptr %sm, i32 964, !dbg !1902
  %call = call ptr @memmove(ptr noundef nonnull %add.ptr, ptr noundef %m, i32 noundef %mlen) #8, !dbg !1903
  %add.ptr1 = getelementptr inbounds nuw i8, ptr %sm, i32 964, !dbg !1904
    #dbg_value(ptr %siglen, !1905, !DIExpression(DW_OP_deref), !1894)
  %call2 = call i32 @pqmayo_MAYO_5_ref_mayo_sign_signature(ptr noundef %p, ptr noundef %sm, ptr noundef nonnull %siglen, ptr noundef nonnull %add.ptr1, i32 noundef %mlen, ptr noundef %csk) #6, !dbg !1906
    #dbg_value(i32 %call2, !1900, !DIExpression(), !1894)
  %cmp.not = icmp eq i32 %call2, 0, !dbg !1907
  %0 = load i32, ptr %siglen, align 4
    #dbg_value(i32 %0, !1905, !DIExpression(), !1894)
  %cmp3.not = icmp eq i32 %0, 964
  %or.cond = select i1 %cmp.not, i1 %cmp3.not, i1 false, !dbg !1909
  br i1 %or.cond, label %if.end, label %if.then, !dbg !1909

if.then:                                          ; preds = %entry
  %1 = load i32, ptr %siglen, align 4, !dbg !1910
    #dbg_value(i32 %1, !1905, !DIExpression(), !1894)
  %add = add i32 %1, %mlen, !dbg !1912
  %call4 = call ptr @memset(ptr noundef %sm, i32 noundef 0, i32 noundef %add) #8, !dbg !1913
  br label %err, !dbg !1914

if.end:                                           ; preds = %entry
  %2 = load i32, ptr %siglen, align 4, !dbg !1915
    #dbg_value(i32 %2, !1905, !DIExpression(), !1894)
  %add5 = add i32 %2, %mlen, !dbg !1916
  store i32 %add5, ptr %smlen, align 4, !dbg !1917
  br label %err, !dbg !1918

err:                                              ; preds = %if.end, %if.then
    #dbg_label(!1919, !1920)
  ret i32 %call2, !dbg !1921
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqmayo_MAYO_5_ref_mayo_open(ptr noundef %p, ptr noundef %m, ptr noundef %mlen, ptr noundef %sm, i32 noundef %smlen, ptr noundef %pk) local_unnamed_addr #0 !dbg !1922 {
entry:
    #dbg_value(ptr %p, !1923, !DIExpression(), !1924)
    #dbg_value(ptr %m, !1925, !DIExpression(), !1924)
    #dbg_value(ptr %mlen, !1926, !DIExpression(), !1924)
    #dbg_value(ptr %sm, !1927, !DIExpression(), !1924)
    #dbg_value(i32 %smlen, !1928, !DIExpression(), !1924)
    #dbg_value(ptr %pk, !1929, !DIExpression(), !1924)
    #dbg_value(i32 964, !1930, !DIExpression(), !1924)
  %cmp = icmp ult i32 %smlen, 964, !dbg !1931
  br i1 %cmp, label %return, label %if.end, !dbg !1931

if.end:                                           ; preds = %entry
  %add.ptr = getelementptr inbounds nuw i8, ptr %sm, i32 964, !dbg !1933
  %sub = add i32 %smlen, -964, !dbg !1934
  %call = call i32 @pqmayo_MAYO_5_ref_mayo_verify(ptr noundef %p, ptr noundef nonnull %add.ptr, i32 noundef %sub, ptr noundef %sm, ptr noundef %pk) #6, !dbg !1935
    #dbg_value(i32 %call, !1936, !DIExpression(), !1924)
  %cmp1 = icmp eq i32 %call, 0, !dbg !1937
  br i1 %cmp1, label %if.then2, label %return, !dbg !1937

if.then2:                                         ; preds = %if.end
  %sub3 = add i32 %smlen, -964, !dbg !1939
  store i32 %sub3, ptr %mlen, align 4, !dbg !1941
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %sm, i32 964, !dbg !1942
  %call5 = call ptr @memmove(ptr noundef %m, ptr noundef nonnull %add.ptr4, i32 noundef %sub3) #8, !dbg !1943
  br label %return, !dbg !1944

return:                                           ; preds = %if.end, %if.then2, %entry
  %retval.0 = phi i32 [ 1, %entry ], [ %call, %if.then2 ], [ %call, %if.end ], !dbg !1924
  ret i32 %retval.0, !dbg !1945
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqmayo_MAYO_5_ref_mayo_verify(ptr noundef %p, ptr noundef %m, i32 noundef %mlen, ptr noundef %sig, ptr noundef %cpk) local_unnamed_addr #0 !dbg !1946 {
entry:
  %tEnc = alloca [71 x i8], align 1
  %t = alloca [142 x i8], align 1
  %y = alloca [284 x i8], align 1
  %s = alloca [1848 x i8], align 1
  %pk = alloca [107415 x i64], align 8
  %tmp = alloca [104 x i8], align 1
    #dbg_value(ptr %p, !1949, !DIExpression(), !1950)
    #dbg_value(ptr %m, !1951, !DIExpression(), !1950)
    #dbg_value(i32 %mlen, !1952, !DIExpression(), !1950)
    #dbg_value(ptr %sig, !1953, !DIExpression(), !1950)
    #dbg_value(ptr %cpk, !1954, !DIExpression(), !1950)
    #dbg_declare(ptr %tEnc, !1955, !DIExpression(), !1956)
    #dbg_declare(ptr %t, !1957, !DIExpression(), !1958)
    #dbg_declare(ptr %y, !1959, !DIExpression(), !1963)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(284) %y, i8 0, i32 284, i1 false), !dbg !1963
    #dbg_declare(ptr %s, !1964, !DIExpression(), !1965)
    #dbg_declare(ptr %pk, !1966, !DIExpression(), !1970)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(859320) %pk, i8 0, i32 859320, i1 false), !dbg !1970
    #dbg_declare(ptr %tmp, !1971, !DIExpression(), !1975)
    #dbg_value(i32 142, !1976, !DIExpression(), !1950)
    #dbg_value(i32 154, !1977, !DIExpression(), !1950)
    #dbg_value(i32 12, !1978, !DIExpression(), !1950)
    #dbg_value(i32 71, !1979, !DIExpression(), !1950)
    #dbg_value(i32 964, !1980, !DIExpression(), !1950)
    #dbg_value(i32 64, !1981, !DIExpression(), !1950)
    #dbg_value(i32 40, !1982, !DIExpression(), !1950)
  %call = call i32 @pqmayo_MAYO_5_ref_mayo_expand_pk(ptr noundef %p, ptr noundef %cpk, ptr noundef nonnull %pk) #6, !dbg !1983
    #dbg_value(i32 %call, !1984, !DIExpression(), !1950)
  %cmp.not = icmp eq i32 %call, 0, !dbg !1985
  br i1 %cmp.not, label %if.end, label %return, !dbg !1985

if.end:                                           ; preds = %entry
    #dbg_value(ptr %pk, !1987, !DIExpression(), !1950)
  %add.ptr = getelementptr inbounds nuw i8, ptr %pk, i32 731016, !dbg !1988
    #dbg_value(ptr %add.ptr, !1989, !DIExpression(), !1950)
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %pk, i32 853704, !dbg !1990
    #dbg_value(ptr %add.ptr2, !1991, !DIExpression(), !1950)
  %call4 = call i32 @shake256(ptr noundef nonnull %tmp, i32 noundef 64, ptr noundef %m, i32 noundef %mlen) #8, !dbg !1992
  %add.ptr6 = getelementptr inbounds nuw i8, ptr %tmp, i32 64, !dbg !1993
  %add.ptr8 = getelementptr inbounds nuw i8, ptr %sig, i32 924, !dbg !1994
  %call9 = call ptr @memcpy(ptr noundef nonnull %add.ptr6, ptr noundef nonnull %add.ptr8, i32 noundef 40) #8, !dbg !1995
  %call12 = call i32 @shake256(ptr noundef nonnull %tEnc, i32 noundef 71, ptr noundef nonnull %tmp, i32 noundef 104) #8, !dbg !1996
  call fastcc void @decode(ptr noundef nonnull %tEnc, ptr noundef nonnull %t, i32 noundef 142) #6, !dbg !1997
  call fastcc void @decode(ptr noundef %sig, ptr noundef nonnull %s, i32 noundef 1848) #6, !dbg !1998
  call fastcc void @eval_public_map(ptr noundef %p, ptr noundef nonnull %s, ptr noundef nonnull %pk, ptr noundef nonnull %add.ptr, ptr noundef nonnull %add.ptr2, ptr noundef nonnull %y) #6, !dbg !1999
  %call20 = call i32 @memcmp(ptr noundef nonnull %y, ptr noundef nonnull %t, i32 noundef 142) #8, !dbg !2000
  %cmp21 = icmp ne i32 %call20, 0, !dbg !2002
  %. = zext i1 %cmp21 to i32, !dbg !1950
  br label %return, !dbg !1950

return:                                           ; preds = %if.end, %entry
  %retval.0 = phi i32 [ 1, %entry ], [ %., %if.end ], !dbg !1950
  ret i32 %retval.0, !dbg !2003
}

; Function Attrs: nounwind
define dso_local i32 @pqmayo_MAYO_5_ref_mayo_expand_pk(ptr noundef %p, ptr noundef %cpk, ptr noundef %pk) local_unnamed_addr #0 !dbg !2004 {
entry:
    #dbg_value(ptr %p, !2007, !DIExpression(), !2008)
    #dbg_value(ptr %cpk, !2009, !DIExpression(), !2008)
    #dbg_value(ptr %pk, !2010, !DIExpression(), !2008)
  call fastcc void @expand_P1_P2(ptr noundef %p, ptr noundef %pk, ptr noundef %cpk) #6, !dbg !2011
  %add.ptr = getelementptr inbounds nuw i8, ptr %cpk, i32 16, !dbg !2012
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %pk, i32 853704, !dbg !2013
  call fastcc void @unpack_m_vecs(ptr noundef nonnull %add.ptr, ptr noundef nonnull %add.ptr2, i32 noundef 78, i32 noundef 142) #6, !dbg !2014
  ret i32 0, !dbg !2015
}

; Function Attrs: nounwind
define internal fastcc void @eval_public_map(ptr noundef %p, ptr noundef %s, ptr noundef %P1, ptr noundef %P2, ptr noundef %P3, ptr noundef %eval) unnamed_addr #0 !dbg !2016 {
entry:
  %SPS = alloca [1296 x i64], align 8
  %zero = alloca [142 x i8], align 1
    #dbg_value(ptr %p, !2019, !DIExpression(), !2020)
    #dbg_value(ptr %s, !2021, !DIExpression(), !2020)
    #dbg_value(ptr %P1, !2022, !DIExpression(), !2020)
    #dbg_value(ptr %P2, !2023, !DIExpression(), !2020)
    #dbg_value(ptr %P3, !2024, !DIExpression(), !2020)
    #dbg_value(ptr %eval, !2025, !DIExpression(), !2020)
    #dbg_declare(ptr %SPS, !2026, !DIExpression(), !2027)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(10368) %SPS, i8 0, i32 10368, i1 false), !dbg !2027
  call fastcc void @m_calculate_PS_SPS(ptr noundef %p, ptr noundef %P1, ptr noundef %P2, ptr noundef %P3, ptr noundef %s, ptr noundef nonnull %SPS) #6, !dbg !2028
    #dbg_declare(ptr %zero, !2029, !DIExpression(), !2030)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(142) %zero, i8 0, i32 142, i1 false), !dbg !2030
  call fastcc void @compute_rhs(ptr noundef %p, ptr noundef nonnull %SPS, ptr noundef nonnull %zero, ptr noundef %eval) #6, !dbg !2031
  ret void, !dbg !2032
}

; Function Attrs: nounwind
define internal fastcc void @m_calculate_PS_SPS(ptr noundef %p, ptr noundef %P1, ptr noundef %P2, ptr noundef %P3, ptr noundef %s, ptr noundef %SPS) unnamed_addr #0 !dbg !2033 {
entry:
  %PS = alloca [16632 x i64], align 8
    #dbg_value(ptr %p, !2036, !DIExpression(), !2037)
    #dbg_value(ptr %P1, !2038, !DIExpression(), !2037)
    #dbg_value(ptr %P2, !2039, !DIExpression(), !2037)
    #dbg_value(ptr %P3, !2040, !DIExpression(), !2037)
    #dbg_value(ptr %s, !2041, !DIExpression(), !2037)
    #dbg_value(ptr %SPS, !2042, !DIExpression(), !2037)
    #dbg_declare(ptr %PS, !2043, !DIExpression(), !2047)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(133056) %PS, i8 0, i32 133056, i1 false), !dbg !2047
  call fastcc void @mayo_generic_m_calculate_PS(ptr noundef %P1, ptr noundef %P2, ptr noundef %P3, ptr noundef %s, i32 noundef 142, i32 noundef 142, i32 noundef 12, i32 noundef 12, ptr noundef nonnull %PS) #6, !dbg !2048
  call fastcc void @mayo_generic_m_calculate_SPS(ptr noundef nonnull %PS, ptr noundef %s, i32 noundef 142, i32 noundef 12, i32 noundef 154, ptr noundef %SPS) #6, !dbg !2049
  ret void, !dbg !2050
}

; Function Attrs: nounwind
define internal fastcc void @mayo_generic_m_calculate_PS(ptr noundef %P1, ptr noundef %P2, ptr noundef %P3, ptr noundef %S, i32 noundef %m, i32 noundef %v, i32 noundef %o, i32 noundef %k, ptr noundef %PS) unnamed_addr #0 !dbg !2051 {
entry:
  %accumulator = alloca [266112 x i64], align 8
    #dbg_value(ptr %P1, !2054, !DIExpression(), !2055)
    #dbg_value(ptr %P2, !2056, !DIExpression(), !2055)
    #dbg_value(ptr %P3, !2057, !DIExpression(), !2055)
    #dbg_value(ptr %S, !2058, !DIExpression(), !2055)
    #dbg_value(i32 %m, !2059, !DIExpression(), !2055)
    #dbg_value(i32 %v, !2060, !DIExpression(), !2055)
    #dbg_value(i32 %o, !2061, !DIExpression(), !2055)
    #dbg_value(i32 %k, !2062, !DIExpression(), !2055)
    #dbg_value(ptr %PS, !2063, !DIExpression(), !2055)
  %add = add i32 %o, %v, !dbg !2064
    #dbg_value(i32 %add, !2065, !DIExpression(), !2055)
  %add1 = add nsw i32 %m, 15, !dbg !2066
  %div = sdiv i32 %add1, 16, !dbg !2067
    #dbg_value(i32 %div, !2068, !DIExpression(), !2055)
    #dbg_declare(ptr %accumulator, !2069, !DIExpression(), !2073)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(2128896) %accumulator, i8 0, i32 2128896, i1 false), !dbg !2073
    #dbg_value(i32 0, !2074, !DIExpression(), !2055)
    #dbg_value(i32 0, !2075, !DIExpression(), !2077)
  %smax = call i32 @llvm.smax.i32(i32 %k, i32 0), !dbg !2078
  %smax3 = call i32 @llvm.smax.i32(i32 %o, i32 0), !dbg !2078
  %smax5 = call i32 @llvm.smax.i32(i32 %v, i32 0), !dbg !2078
  br label %for.cond, !dbg !2078

for.cond:                                         ; preds = %for.inc52, %entry
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.inc52 ], [ %v, %entry ], !dbg !2079
  %P1_used.0 = phi i32 [ %P1_used.1, %for.inc52 ], [ 0, %entry ], !dbg !2079
  %row.0 = phi i32 [ %inc53, %for.inc52 ], [ 0, %entry ], !dbg !2080
    #dbg_value(i32 %row.0, !2075, !DIExpression(), !2077)
    #dbg_value(i32 %P1_used.0, !2074, !DIExpression(), !2055)
  %exitcond6.not = icmp eq i32 %row.0, %smax5, !dbg !2081
  br i1 %exitcond6.not, label %for.cond56.preheader, label %for.cond2.preheader, !dbg !2083

for.cond2.preheader:                              ; preds = %for.cond
  %0 = add i32 %P1_used.0, %indvars.iv, !dbg !2084
  br label %for.cond2, !dbg !2084

for.cond56.preheader:                             ; preds = %for.cond
  %smax8 = call i32 @llvm.smax.i32(i32 %v, i32 %add), !dbg !2087
  br label %for.cond56, !dbg !2087

for.cond2:                                        ; preds = %for.cond2.preheader, %for.inc17
  %P1_used.1 = phi i32 [ %inc16, %for.inc17 ], [ %P1_used.0, %for.cond2.preheader ], !dbg !2055
  %j.0 = phi i32 [ %inc18, %for.inc17 ], [ %row.0, %for.cond2.preheader ], !dbg !2089
    #dbg_value(i32 %j.0, !2090, !DIExpression(), !2091)
    #dbg_value(i32 %P1_used.1, !2074, !DIExpression(), !2055)
  %exitcond1.not = icmp eq i32 %P1_used.1, %0, !dbg !2092
  br i1 %exitcond1.not, label %for.cond21, label %for.cond5, !dbg !2084

for.cond5:                                        ; preds = %for.cond2, %for.body7
  %col.0 = phi i32 [ %inc, %for.body7 ], [ 0, %for.cond2 ], !dbg !2094
    #dbg_value(i32 %col.0, !2097, !DIExpression(), !2098)
  %exitcond.not = icmp eq i32 %col.0, %smax, !dbg !2099
  br i1 %exitcond.not, label %for.inc17, label %for.body7, !dbg !2101

for.body7:                                        ; preds = %for.cond5
  %mul = mul nsw i32 %P1_used.1, %div, !dbg !2102
  %add.ptr = getelementptr inbounds i64, ptr %P1, i32 %mul, !dbg !2104
  %mul8 = mul nsw i32 %row.0, %k, !dbg !2105
  %add9 = add nsw i32 %mul8, %col.0, !dbg !2106
  %mul10 = shl nsw i32 %add9, 4, !dbg !2107
  %mul11 = mul nsw i32 %col.0, %add, !dbg !2108
  %1 = getelementptr i8, ptr %S, i32 %mul11, !dbg !2109
  %arrayidx = getelementptr i8, ptr %1, i32 %j.0, !dbg !2109
  %2 = load i8, ptr %arrayidx, align 1, !dbg !2109
  %conv = zext i8 %2 to i32, !dbg !2109
  %add13 = add nsw i32 %mul10, %conv, !dbg !2110
  %mul14 = mul nsw i32 %add13, %div, !dbg !2111
  %add.ptr15 = getelementptr inbounds i64, ptr %accumulator, i32 %mul14, !dbg !2112
  call fastcc void @m_vec_add(i32 noundef %div, ptr noundef %add.ptr, ptr noundef nonnull %add.ptr15) #6, !dbg !2113
  %inc = add nuw i32 %col.0, 1, !dbg !2114
    #dbg_value(i32 %inc, !2097, !DIExpression(), !2098)
  br label %for.cond5, !dbg !2115, !llvm.loop !2116

for.inc17:                                        ; preds = %for.cond5
    #dbg_value(i32 %P1_used.1, !2074, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2055)
  %inc16 = add i32 %P1_used.1, 1, !dbg !2118
    #dbg_value(i32 %inc16, !2074, !DIExpression(), !2055)
  %inc18 = add nuw nsw i32 %j.0, 1, !dbg !2119
    #dbg_value(i32 %inc18, !2090, !DIExpression(), !2091)
  br label %for.cond2, !dbg !2120, !llvm.loop !2121

for.cond21:                                       ; preds = %for.cond2, %for.inc49
  %j20.0 = phi i32 [ %inc50, %for.inc49 ], [ 0, %for.cond2 ], !dbg !2123
    #dbg_value(i32 %j20.0, !2125, !DIExpression(), !2126)
  %exitcond4.not = icmp eq i32 %j20.0, %smax3, !dbg !2127
  br i1 %exitcond4.not, label %for.inc52, label %for.cond26, !dbg !2129

for.cond26:                                       ; preds = %for.cond21, %for.body29
  %col25.0 = phi i32 [ %inc47, %for.body29 ], [ 0, %for.cond21 ], !dbg !2130
    #dbg_value(i32 %col25.0, !2133, !DIExpression(), !2134)
  %exitcond2.not = icmp eq i32 %col25.0, %smax, !dbg !2135
  br i1 %exitcond2.not, label %for.inc49, label %for.body29, !dbg !2137

for.body29:                                       ; preds = %for.cond26
  %mul30 = mul nsw i32 %row.0, %o, !dbg !2138
  %add31 = add nsw i32 %mul30, %j20.0, !dbg !2140
  %mul32 = mul nsw i32 %add31, %div, !dbg !2141
  %add.ptr33 = getelementptr inbounds i64, ptr %P2, i32 %mul32, !dbg !2142
  %mul35 = mul nsw i32 %row.0, %k, !dbg !2143
  %add36 = add nsw i32 %mul35, %col25.0, !dbg !2144
  %mul37 = shl nsw i32 %add36, 4, !dbg !2145
  %mul38 = mul nsw i32 %col25.0, %add, !dbg !2146
  %3 = getelementptr i8, ptr %S, i32 %mul38, !dbg !2147
  %4 = getelementptr i8, ptr %3, i32 %j20.0, !dbg !2147
  %arrayidx41 = getelementptr i8, ptr %4, i32 %v, !dbg !2147
  %5 = load i8, ptr %arrayidx41, align 1, !dbg !2147
  %conv42 = zext i8 %5 to i32, !dbg !2147
  %add43 = add nsw i32 %mul37, %conv42, !dbg !2148
  %mul44 = mul nsw i32 %add43, %div, !dbg !2149
  %add.ptr45 = getelementptr inbounds i64, ptr %accumulator, i32 %mul44, !dbg !2150
  call fastcc void @m_vec_add(i32 noundef %div, ptr noundef %add.ptr33, ptr noundef nonnull %add.ptr45) #6, !dbg !2151
  %inc47 = add nuw i32 %col25.0, 1, !dbg !2152
    #dbg_value(i32 %inc47, !2133, !DIExpression(), !2134)
  br label %for.cond26, !dbg !2153, !llvm.loop !2154

for.inc49:                                        ; preds = %for.cond26
  %inc50 = add nuw i32 %j20.0, 1, !dbg !2156
    #dbg_value(i32 %inc50, !2125, !DIExpression(), !2126)
  br label %for.cond21, !dbg !2157, !llvm.loop !2158

for.inc52:                                        ; preds = %for.cond21
  %inc53 = add nuw i32 %row.0, 1, !dbg !2160
    #dbg_value(i32 %inc53, !2075, !DIExpression(), !2077)
  %indvars.iv.next = add i32 %indvars.iv, -1, !dbg !2161
  br label %for.cond, !dbg !2161, !llvm.loop !2162

for.cond56:                                       ; preds = %for.cond56.preheader, %for.inc90
  %P3_used.0 = phi i32 [ %P3_used.1, %for.inc90 ], [ 0, %for.cond56.preheader ], !dbg !2164
  %row55.0 = phi i32 [ %inc91, %for.inc90 ], [ %v, %for.cond56.preheader ], !dbg !2165
    #dbg_value(i32 %row55.0, !2166, !DIExpression(), !2167)
    #dbg_value(i32 %P3_used.0, !2168, !DIExpression(), !2055)
  %exitcond9.not = icmp eq i32 %row55.0, %smax8, !dbg !2169
  br i1 %exitcond9.not, label %while.cond.preheader, label %for.cond61, !dbg !2087

while.cond.preheader:                             ; preds = %for.cond56
  %6 = mul i32 %k, %add, !dbg !2171
  %smax10 = call i32 @llvm.smax.i32(i32 %6, i32 0), !dbg !2171
  br label %while.cond, !dbg !2171

for.cond61:                                       ; preds = %for.cond56, %for.inc87
  %P3_used.1 = phi i32 [ %inc86, %for.inc87 ], [ %P3_used.0, %for.cond56 ], !dbg !2055
  %j60.0 = phi i32 [ %inc88, %for.inc87 ], [ %row55.0, %for.cond56 ], !dbg !2172
    #dbg_value(i32 %j60.0, !2175, !DIExpression(), !2176)
    #dbg_value(i32 %P3_used.1, !2168, !DIExpression(), !2055)
  %cmp62 = icmp slt i32 %j60.0, %add, !dbg !2177
  br i1 %cmp62, label %for.cond66, label %for.inc90, !dbg !2179

for.cond66:                                       ; preds = %for.cond61, %for.body69
  %col65.0 = phi i32 [ %inc84, %for.body69 ], [ 0, %for.cond61 ], !dbg !2180
    #dbg_value(i32 %col65.0, !2183, !DIExpression(), !2184)
  %exitcond7.not = icmp eq i32 %col65.0, %smax, !dbg !2185
  br i1 %exitcond7.not, label %for.inc87, label %for.body69, !dbg !2187

for.body69:                                       ; preds = %for.cond66
  %mul70 = mul nsw i32 %P3_used.1, %div, !dbg !2188
  %add.ptr71 = getelementptr inbounds i64, ptr %P3, i32 %mul70, !dbg !2190
  %mul73 = mul nsw i32 %row55.0, %k, !dbg !2191
  %add74 = add nsw i32 %mul73, %col65.0, !dbg !2192
  %mul75 = shl nsw i32 %add74, 4, !dbg !2193
  %mul76 = mul nsw i32 %col65.0, %add, !dbg !2194
  %7 = getelementptr i8, ptr %S, i32 %mul76, !dbg !2195
  %arrayidx78 = getelementptr i8, ptr %7, i32 %j60.0, !dbg !2195
  %8 = load i8, ptr %arrayidx78, align 1, !dbg !2195
  %conv79 = zext i8 %8 to i32, !dbg !2195
  %add80 = add nsw i32 %mul75, %conv79, !dbg !2196
  %mul81 = mul nsw i32 %add80, %div, !dbg !2197
  %add.ptr82 = getelementptr inbounds i64, ptr %accumulator, i32 %mul81, !dbg !2198
  call fastcc void @m_vec_add(i32 noundef %div, ptr noundef %add.ptr71, ptr noundef nonnull %add.ptr82) #6, !dbg !2199
  %inc84 = add nuw i32 %col65.0, 1, !dbg !2200
    #dbg_value(i32 %inc84, !2183, !DIExpression(), !2184)
  br label %for.cond66, !dbg !2201, !llvm.loop !2202

for.inc87:                                        ; preds = %for.cond66
    #dbg_value(i32 %P3_used.1, !2168, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2055)
  %inc86 = add nsw i32 %P3_used.1, 1, !dbg !2204
    #dbg_value(i32 %inc86, !2168, !DIExpression(), !2055)
  %inc88 = add nsw i32 %j60.0, 1, !dbg !2205
    #dbg_value(i32 %inc88, !2175, !DIExpression(), !2176)
  br label %for.cond61, !dbg !2206, !llvm.loop !2207

for.inc90:                                        ; preds = %for.cond61
  %inc91 = add i32 %row55.0, 1, !dbg !2209
    #dbg_value(i32 %inc91, !2166, !DIExpression(), !2167)
  br label %for.cond56, !dbg !2210, !llvm.loop !2211

while.cond:                                       ; preds = %while.cond.preheader, %while.body
  %i.0 = phi i32 [ %inc102, %while.body ], [ 0, %while.cond.preheader ], !dbg !2055
    #dbg_value(i32 %i.0, !2213, !DIExpression(), !2055)
  %exitcond11.not = icmp eq i32 %i.0, %smax10, !dbg !2214
  br i1 %exitcond11.not, label %while.end, label %while.body, !dbg !2171

while.body:                                       ; preds = %while.cond
  %mul97 = shl nsw i32 %i.0, 4, !dbg !2215
  %mul98 = mul nsw i32 %mul97, %div, !dbg !2217
  %add.ptr99 = getelementptr inbounds i64, ptr %accumulator, i32 %mul98, !dbg !2218
  %mul100 = mul nsw i32 %i.0, %div, !dbg !2219
  %add.ptr101 = getelementptr inbounds i64, ptr %PS, i32 %mul100, !dbg !2220
  call fastcc void @m_vec_multiply_bins(i32 noundef %div, ptr noundef nonnull %add.ptr99, ptr noundef %add.ptr101) #6, !dbg !2221
  %inc102 = add nuw i32 %i.0, 1, !dbg !2222
    #dbg_value(i32 %inc102, !2213, !DIExpression(), !2055)
  br label %while.cond, !dbg !2171, !llvm.loop !2223

while.end:                                        ; preds = %while.cond
  ret void, !dbg !2225
}

; Function Attrs: nounwind
define internal fastcc void @mayo_generic_m_calculate_SPS(ptr noundef %PS, ptr noundef %S, i32 noundef %m, i32 noundef %k, i32 noundef %n, ptr noundef %SPS) unnamed_addr #0 !dbg !2226 {
entry:
  %accumulator = alloca [20736 x i64], align 8
    #dbg_value(ptr %PS, !2229, !DIExpression(), !2230)
    #dbg_value(ptr %S, !2231, !DIExpression(), !2230)
    #dbg_value(i32 %m, !2232, !DIExpression(), !2230)
    #dbg_value(i32 %k, !2233, !DIExpression(), !2230)
    #dbg_value(i32 %n, !2234, !DIExpression(), !2230)
    #dbg_value(ptr %SPS, !2235, !DIExpression(), !2230)
    #dbg_declare(ptr %accumulator, !2236, !DIExpression(), !2240)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(165888) %accumulator, i8 0, i32 165888, i1 false), !dbg !2240
  %add = add nsw i32 %m, 15, !dbg !2241
  %div = sdiv i32 %add, 16, !dbg !2242
    #dbg_value(i32 %div, !2243, !DIExpression(), !2230)
    #dbg_value(i32 0, !2244, !DIExpression(), !2246)
  %smax = call i32 @llvm.smax.i32(i32 %n, i32 0), !dbg !2247
  %smax2 = call i32 @llvm.smax.i32(i32 %k, i32 0), !dbg !2247
  br label %for.cond, !dbg !2247

for.cond:                                         ; preds = %for.inc20, %entry
  %row.0 = phi i32 [ 0, %entry ], [ %inc21, %for.inc20 ], !dbg !2248
    #dbg_value(i32 %row.0, !2244, !DIExpression(), !2246)
  %exitcond3.not = icmp eq i32 %row.0, %smax2, !dbg !2249
  br i1 %exitcond3.not, label %while.cond.preheader, label %for.cond1, !dbg !2251

while.cond.preheader:                             ; preds = %for.cond
  %0 = mul i32 %k, %k, !dbg !2252
  br label %while.cond, !dbg !2252

for.cond1:                                        ; preds = %for.cond, %for.inc18
  %j.0 = phi i32 [ %inc, %for.inc18 ], [ 0, %for.cond ], !dbg !2253
    #dbg_value(i32 %j.0, !2256, !DIExpression(), !2257)
  %exitcond1.not = icmp eq i32 %j.0, %smax, !dbg !2258
  br i1 %exitcond1.not, label %for.inc20, label %for.cond4, !dbg !2260

for.cond4:                                        ; preds = %for.cond1, %for.body6
  %col.0 = phi i32 [ %add17, %for.body6 ], [ 0, %for.cond1 ], !dbg !2261
    #dbg_value(i32 %col.0, !2264, !DIExpression(), !2265)
  %exitcond.not = icmp eq i32 %col.0, %k, !dbg !2266
  br i1 %exitcond.not, label %for.inc18, label %for.body6, !dbg !2268

for.body6:                                        ; preds = %for.cond4
  %mul = mul nsw i32 %j.0, %k, !dbg !2269
  %add7 = add nsw i32 %mul, %col.0, !dbg !2271
  %mul8 = mul nsw i32 %add7, %div, !dbg !2272
  %add.ptr = getelementptr inbounds i64, ptr %PS, i32 %mul8, !dbg !2273
  %mul9 = mul nsw i32 %row.0, %k, !dbg !2274
  %add10 = add nsw i32 %mul9, %col.0, !dbg !2275
  %mul11 = shl nsw i32 %add10, 4, !dbg !2276
  %mul12 = mul nsw i32 %row.0, %n, !dbg !2277
  %1 = getelementptr i8, ptr %S, i32 %mul12, !dbg !2278
  %arrayidx = getelementptr i8, ptr %1, i32 %j.0, !dbg !2278
  %2 = load i8, ptr %arrayidx, align 1, !dbg !2278
  %conv = zext i8 %2 to i32, !dbg !2278
  %add14 = add nsw i32 %mul11, %conv, !dbg !2279
  %mul15 = mul nsw i32 %add14, %div, !dbg !2280
  %add.ptr16 = getelementptr inbounds i64, ptr %accumulator, i32 %mul15, !dbg !2281
  call fastcc void @m_vec_add(i32 noundef %div, ptr noundef %add.ptr, ptr noundef nonnull %add.ptr16) #6, !dbg !2282
  %add17 = add nuw i32 %col.0, 1, !dbg !2283
    #dbg_value(i32 %add17, !2264, !DIExpression(), !2265)
  br label %for.cond4, !dbg !2284, !llvm.loop !2285

for.inc18:                                        ; preds = %for.cond4
  %inc = add nuw i32 %j.0, 1, !dbg !2287
    #dbg_value(i32 %inc, !2256, !DIExpression(), !2257)
  br label %for.cond1, !dbg !2288, !llvm.loop !2289

for.inc20:                                        ; preds = %for.cond1
  %inc21 = add nuw i32 %row.0, 1, !dbg !2291
    #dbg_value(i32 %inc21, !2244, !DIExpression(), !2246)
  br label %for.cond, !dbg !2292, !llvm.loop !2293

while.cond:                                       ; preds = %while.cond.preheader, %while.body
  %i.0 = phi i32 [ %inc32, %while.body ], [ 0, %while.cond.preheader ], !dbg !2230
    #dbg_value(i32 %i.0, !2295, !DIExpression(), !2230)
  %exitcond4.not = icmp eq i32 %i.0, %0, !dbg !2296
  br i1 %exitcond4.not, label %while.end, label %while.body, !dbg !2252

while.body:                                       ; preds = %while.cond
  %mul27 = shl nsw i32 %i.0, 4, !dbg !2297
  %mul28 = mul nsw i32 %mul27, %div, !dbg !2299
  %add.ptr29 = getelementptr inbounds i64, ptr %accumulator, i32 %mul28, !dbg !2300
  %mul30 = mul nsw i32 %i.0, %div, !dbg !2301
  %add.ptr31 = getelementptr inbounds i64, ptr %SPS, i32 %mul30, !dbg !2302
  call fastcc void @m_vec_multiply_bins(i32 noundef %div, ptr noundef nonnull %add.ptr29, ptr noundef %add.ptr31) #6, !dbg !2303
  %inc32 = add nuw i32 %i.0, 1, !dbg !2304
    #dbg_value(i32 %inc32, !2295, !DIExpression(), !2230)
  br label %while.cond, !dbg !2252, !llvm.loop !2305

while.end:                                        ; preds = %while.cond
  ret void, !dbg !2307
}

; Function Attrs: nounwind
define internal fastcc void @m_vec_add(i32 noundef %m_vec_limbs, ptr noundef %in, ptr noundef %acc) unnamed_addr #0 !dbg !2308 {
entry:
    #dbg_value(i32 %m_vec_limbs, !2311, !DIExpression(), !2312)
    #dbg_value(ptr %in, !2313, !DIExpression(), !2312)
    #dbg_value(ptr %acc, !2314, !DIExpression(), !2312)
    #dbg_value(i32 0, !2315, !DIExpression(), !2317)
    #dbg_value(i32 0, !2315, !DIExpression(), !2317)
  %0 = load i64, ptr %in, align 8, !dbg !2318
  %1 = load i64, ptr %acc, align 8, !dbg !2321
  %xor = xor i64 %1, %0, !dbg !2321
  store i64 %xor, ptr %acc, align 8, !dbg !2321
    #dbg_value(i32 1, !2315, !DIExpression(), !2317)
  %arrayidx.1 = getelementptr inbounds nuw i8, ptr %in, i32 8, !dbg !2318
  %2 = load i64, ptr %arrayidx.1, align 8, !dbg !2318
  %arrayidx1.1 = getelementptr inbounds nuw i8, ptr %acc, i32 8, !dbg !2322
  %3 = load i64, ptr %arrayidx1.1, align 8, !dbg !2321
  %xor.1 = xor i64 %3, %2, !dbg !2321
  store i64 %xor.1, ptr %arrayidx1.1, align 8, !dbg !2321
    #dbg_value(i32 2, !2315, !DIExpression(), !2317)
  %arrayidx.2 = getelementptr inbounds nuw i8, ptr %in, i32 16, !dbg !2318
  %4 = load i64, ptr %arrayidx.2, align 8, !dbg !2318
  %arrayidx1.2 = getelementptr inbounds nuw i8, ptr %acc, i32 16, !dbg !2322
  %5 = load i64, ptr %arrayidx1.2, align 8, !dbg !2321
  %xor.2 = xor i64 %5, %4, !dbg !2321
  store i64 %xor.2, ptr %arrayidx1.2, align 8, !dbg !2321
    #dbg_value(i32 3, !2315, !DIExpression(), !2317)
  %arrayidx.3 = getelementptr inbounds nuw i8, ptr %in, i32 24, !dbg !2318
  %6 = load i64, ptr %arrayidx.3, align 8, !dbg !2318
  %arrayidx1.3 = getelementptr inbounds nuw i8, ptr %acc, i32 24, !dbg !2322
  %7 = load i64, ptr %arrayidx1.3, align 8, !dbg !2321
  %xor.3 = xor i64 %7, %6, !dbg !2321
  store i64 %xor.3, ptr %arrayidx1.3, align 8, !dbg !2321
    #dbg_value(i32 4, !2315, !DIExpression(), !2317)
  %arrayidx.4 = getelementptr inbounds nuw i8, ptr %in, i32 32, !dbg !2318
  %8 = load i64, ptr %arrayidx.4, align 8, !dbg !2318
  %arrayidx1.4 = getelementptr inbounds nuw i8, ptr %acc, i32 32, !dbg !2322
  %9 = load i64, ptr %arrayidx1.4, align 8, !dbg !2321
  %xor.4 = xor i64 %9, %8, !dbg !2321
  store i64 %xor.4, ptr %arrayidx1.4, align 8, !dbg !2321
    #dbg_value(i32 5, !2315, !DIExpression(), !2317)
  %arrayidx.5 = getelementptr inbounds nuw i8, ptr %in, i32 40, !dbg !2318
  %10 = load i64, ptr %arrayidx.5, align 8, !dbg !2318
  %arrayidx1.5 = getelementptr inbounds nuw i8, ptr %acc, i32 40, !dbg !2322
  %11 = load i64, ptr %arrayidx1.5, align 8, !dbg !2321
  %xor.5 = xor i64 %11, %10, !dbg !2321
  store i64 %xor.5, ptr %arrayidx1.5, align 8, !dbg !2321
    #dbg_value(i32 6, !2315, !DIExpression(), !2317)
  %arrayidx.6 = getelementptr inbounds nuw i8, ptr %in, i32 48, !dbg !2318
  %12 = load i64, ptr %arrayidx.6, align 8, !dbg !2318
  %arrayidx1.6 = getelementptr inbounds nuw i8, ptr %acc, i32 48, !dbg !2322
  %13 = load i64, ptr %arrayidx1.6, align 8, !dbg !2321
  %xor.6 = xor i64 %13, %12, !dbg !2321
  store i64 %xor.6, ptr %arrayidx1.6, align 8, !dbg !2321
    #dbg_value(i32 7, !2315, !DIExpression(), !2317)
  %arrayidx.7 = getelementptr inbounds nuw i8, ptr %in, i32 56, !dbg !2318
  %14 = load i64, ptr %arrayidx.7, align 8, !dbg !2318
  %arrayidx1.7 = getelementptr inbounds nuw i8, ptr %acc, i32 56, !dbg !2322
  %15 = load i64, ptr %arrayidx1.7, align 8, !dbg !2321
  %xor.7 = xor i64 %15, %14, !dbg !2321
  store i64 %xor.7, ptr %arrayidx1.7, align 8, !dbg !2321
    #dbg_value(i32 8, !2315, !DIExpression(), !2317)
  %arrayidx.8 = getelementptr inbounds nuw i8, ptr %in, i32 64, !dbg !2318
  %16 = load i64, ptr %arrayidx.8, align 8, !dbg !2318
  %arrayidx1.8 = getelementptr inbounds nuw i8, ptr %acc, i32 64, !dbg !2322
  %17 = load i64, ptr %arrayidx1.8, align 8, !dbg !2321
  %xor.8 = xor i64 %17, %16, !dbg !2321
  store i64 %xor.8, ptr %arrayidx1.8, align 8, !dbg !2321
    #dbg_value(i32 9, !2315, !DIExpression(), !2317)
  ret void, !dbg !2323
}

; Function Attrs: nounwind
define internal fastcc void @m_vec_multiply_bins(i32 noundef %m_vec_limbs, ptr noundef %bins, ptr noundef %out) unnamed_addr #0 !dbg !2324 {
entry:
    #dbg_value(i32 %m_vec_limbs, !2327, !DIExpression(), !2328)
    #dbg_value(ptr %bins, !2329, !DIExpression(), !2328)
    #dbg_value(ptr %out, !2330, !DIExpression(), !2328)
  %add.ptr = getelementptr inbounds nuw i8, ptr %bins, i32 360, !dbg !2331
  %add.ptr1 = getelementptr inbounds nuw i8, ptr %bins, i32 720, !dbg !2332
  call fastcc void @m_vec_mul_add_x_inv(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr, ptr noundef nonnull %add.ptr1) #6, !dbg !2333
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %bins, i32 792, !dbg !2334
  %add.ptr3 = getelementptr inbounds nuw i8, ptr %bins, i32 864, !dbg !2335
  call fastcc void @m_vec_mul_add_x(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr2, ptr noundef nonnull %add.ptr3) #6, !dbg !2336
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %bins, i32 720, !dbg !2337
  %add.ptr5 = getelementptr inbounds nuw i8, ptr %bins, i32 504, !dbg !2338
  call fastcc void @m_vec_mul_add_x_inv(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr4, ptr noundef nonnull %add.ptr5) #6, !dbg !2339
  %add.ptr6 = getelementptr inbounds nuw i8, ptr %bins, i32 864, !dbg !2340
  %add.ptr7 = getelementptr inbounds nuw i8, ptr %bins, i32 432, !dbg !2341
  call fastcc void @m_vec_mul_add_x(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr6, ptr noundef nonnull %add.ptr7) #6, !dbg !2342
  %add.ptr8 = getelementptr inbounds nuw i8, ptr %bins, i32 504, !dbg !2343
  %add.ptr9 = getelementptr inbounds nuw i8, ptr %bins, i32 1008, !dbg !2344
  call fastcc void @m_vec_mul_add_x_inv(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr8, ptr noundef nonnull %add.ptr9) #6, !dbg !2345
  %add.ptr10 = getelementptr inbounds nuw i8, ptr %bins, i32 432, !dbg !2346
  %add.ptr11 = getelementptr inbounds nuw i8, ptr %bins, i32 216, !dbg !2347
  call fastcc void @m_vec_mul_add_x(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr10, ptr noundef nonnull %add.ptr11) #6, !dbg !2348
  %add.ptr12 = getelementptr inbounds nuw i8, ptr %bins, i32 1008, !dbg !2349
  %add.ptr13 = getelementptr inbounds nuw i8, ptr %bins, i32 1080, !dbg !2350
  call fastcc void @m_vec_mul_add_x_inv(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr12, ptr noundef nonnull %add.ptr13) #6, !dbg !2351
  %add.ptr14 = getelementptr inbounds nuw i8, ptr %bins, i32 216, !dbg !2352
  %add.ptr15 = getelementptr inbounds nuw i8, ptr %bins, i32 576, !dbg !2353
  call fastcc void @m_vec_mul_add_x(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr14, ptr noundef nonnull %add.ptr15) #6, !dbg !2354
  %add.ptr16 = getelementptr inbounds nuw i8, ptr %bins, i32 1080, !dbg !2355
  %add.ptr17 = getelementptr inbounds nuw i8, ptr %bins, i32 936, !dbg !2356
  call fastcc void @m_vec_mul_add_x_inv(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr16, ptr noundef nonnull %add.ptr17) #6, !dbg !2357
  %add.ptr18 = getelementptr inbounds nuw i8, ptr %bins, i32 576, !dbg !2358
  %add.ptr19 = getelementptr inbounds nuw i8, ptr %bins, i32 288, !dbg !2359
  call fastcc void @m_vec_mul_add_x(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr18, ptr noundef nonnull %add.ptr19) #6, !dbg !2360
  %add.ptr20 = getelementptr inbounds nuw i8, ptr %bins, i32 936, !dbg !2361
  %add.ptr21 = getelementptr inbounds nuw i8, ptr %bins, i32 648, !dbg !2362
  call fastcc void @m_vec_mul_add_x_inv(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr20, ptr noundef nonnull %add.ptr21) #6, !dbg !2363
  %add.ptr22 = getelementptr inbounds nuw i8, ptr %bins, i32 288, !dbg !2364
  %add.ptr23 = getelementptr inbounds nuw i8, ptr %bins, i32 144, !dbg !2365
  call fastcc void @m_vec_mul_add_x(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr22, ptr noundef nonnull %add.ptr23) #6, !dbg !2366
  %add.ptr24 = getelementptr inbounds nuw i8, ptr %bins, i32 648, !dbg !2367
  %add.ptr25 = getelementptr inbounds nuw i8, ptr %bins, i32 72, !dbg !2368
  call fastcc void @m_vec_mul_add_x_inv(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr24, ptr noundef nonnull %add.ptr25) #6, !dbg !2369
  %add.ptr26 = getelementptr inbounds nuw i8, ptr %bins, i32 144, !dbg !2370
  %add.ptr27 = getelementptr inbounds nuw i8, ptr %bins, i32 72, !dbg !2371
  call fastcc void @m_vec_mul_add_x(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr26, ptr noundef nonnull %add.ptr27) #6, !dbg !2372
  %add.ptr28 = getelementptr inbounds nuw i8, ptr %bins, i32 72, !dbg !2373
  call fastcc void @m_vec_copy(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr28, ptr noundef %out) #6, !dbg !2374
  ret void, !dbg !2375
}

; Function Attrs: nounwind
define internal fastcc void @m_vec_mul_add_x_inv(i32 noundef %m_vec_limbs, ptr noundef %in, ptr noundef %acc) unnamed_addr #0 !dbg !2376 {
entry:
    #dbg_value(i32 %m_vec_limbs, !2377, !DIExpression(), !2378)
    #dbg_value(ptr %in, !2379, !DIExpression(), !2378)
    #dbg_value(ptr %acc, !2380, !DIExpression(), !2378)
    #dbg_value(i64 1229782938247303441, !2381, !DIExpression(), !2378)
    #dbg_value(i32 0, !2382, !DIExpression(), !2384)
    #dbg_value(i32 0, !2382, !DIExpression(), !2384)
  %0 = load i64, ptr %in, align 8, !dbg !2385
  %and = and i64 %0, 1229782938247303441, !dbg !2388
    #dbg_value(i64 %and, !2389, !DIExpression(), !2390)
  %xor = lshr i64 %0, 1, !dbg !2391
  %shr = and i64 %xor, 8608480567731124087, !dbg !2391
  %mul = mul nuw i64 %and, 9, !dbg !2392
  %xor2 = xor i64 %shr, %mul, !dbg !2393
  %1 = load i64, ptr %acc, align 8, !dbg !2394
  %xor4 = xor i64 %1, %xor2, !dbg !2394
  store i64 %xor4, ptr %acc, align 8, !dbg !2394
    #dbg_value(i32 1, !2382, !DIExpression(), !2384)
  %arrayidx.1 = getelementptr inbounds nuw i8, ptr %in, i32 8, !dbg !2385
  %2 = load i64, ptr %arrayidx.1, align 8, !dbg !2385
  %and.1 = and i64 %2, 1229782938247303441, !dbg !2388
    #dbg_value(i64 %and.1, !2389, !DIExpression(), !2390)
  %xor.1 = lshr i64 %2, 1, !dbg !2391
  %shr.1 = and i64 %xor.1, 8608480567731124087, !dbg !2391
  %mul.1 = mul nuw i64 %and.1, 9, !dbg !2392
  %xor2.1 = xor i64 %shr.1, %mul.1, !dbg !2393
  %arrayidx3.1 = getelementptr inbounds nuw i8, ptr %acc, i32 8, !dbg !2395
  %3 = load i64, ptr %arrayidx3.1, align 8, !dbg !2394
  %xor4.1 = xor i64 %3, %xor2.1, !dbg !2394
  store i64 %xor4.1, ptr %arrayidx3.1, align 8, !dbg !2394
    #dbg_value(i32 2, !2382, !DIExpression(), !2384)
  %arrayidx.2 = getelementptr inbounds nuw i8, ptr %in, i32 16, !dbg !2385
  %4 = load i64, ptr %arrayidx.2, align 8, !dbg !2385
  %and.2 = and i64 %4, 1229782938247303441, !dbg !2388
    #dbg_value(i64 %and.2, !2389, !DIExpression(), !2390)
  %xor.2 = lshr i64 %4, 1, !dbg !2391
  %shr.2 = and i64 %xor.2, 8608480567731124087, !dbg !2391
  %mul.2 = mul nuw i64 %and.2, 9, !dbg !2392
  %xor2.2 = xor i64 %shr.2, %mul.2, !dbg !2393
  %arrayidx3.2 = getelementptr inbounds nuw i8, ptr %acc, i32 16, !dbg !2395
  %5 = load i64, ptr %arrayidx3.2, align 8, !dbg !2394
  %xor4.2 = xor i64 %5, %xor2.2, !dbg !2394
  store i64 %xor4.2, ptr %arrayidx3.2, align 8, !dbg !2394
    #dbg_value(i32 3, !2382, !DIExpression(), !2384)
  %arrayidx.3 = getelementptr inbounds nuw i8, ptr %in, i32 24, !dbg !2385
  %6 = load i64, ptr %arrayidx.3, align 8, !dbg !2385
  %and.3 = and i64 %6, 1229782938247303441, !dbg !2388
    #dbg_value(i64 %and.3, !2389, !DIExpression(), !2390)
  %xor.3 = lshr i64 %6, 1, !dbg !2391
  %shr.3 = and i64 %xor.3, 8608480567731124087, !dbg !2391
  %mul.3 = mul nuw i64 %and.3, 9, !dbg !2392
  %xor2.3 = xor i64 %shr.3, %mul.3, !dbg !2393
  %arrayidx3.3 = getelementptr inbounds nuw i8, ptr %acc, i32 24, !dbg !2395
  %7 = load i64, ptr %arrayidx3.3, align 8, !dbg !2394
  %xor4.3 = xor i64 %7, %xor2.3, !dbg !2394
  store i64 %xor4.3, ptr %arrayidx3.3, align 8, !dbg !2394
    #dbg_value(i32 4, !2382, !DIExpression(), !2384)
  %arrayidx.4 = getelementptr inbounds nuw i8, ptr %in, i32 32, !dbg !2385
  %8 = load i64, ptr %arrayidx.4, align 8, !dbg !2385
  %and.4 = and i64 %8, 1229782938247303441, !dbg !2388
    #dbg_value(i64 %and.4, !2389, !DIExpression(), !2390)
  %xor.4 = lshr i64 %8, 1, !dbg !2391
  %shr.4 = and i64 %xor.4, 8608480567731124087, !dbg !2391
  %mul.4 = mul nuw i64 %and.4, 9, !dbg !2392
  %xor2.4 = xor i64 %shr.4, %mul.4, !dbg !2393
  %arrayidx3.4 = getelementptr inbounds nuw i8, ptr %acc, i32 32, !dbg !2395
  %9 = load i64, ptr %arrayidx3.4, align 8, !dbg !2394
  %xor4.4 = xor i64 %9, %xor2.4, !dbg !2394
  store i64 %xor4.4, ptr %arrayidx3.4, align 8, !dbg !2394
    #dbg_value(i32 5, !2382, !DIExpression(), !2384)
  %arrayidx.5 = getelementptr inbounds nuw i8, ptr %in, i32 40, !dbg !2385
  %10 = load i64, ptr %arrayidx.5, align 8, !dbg !2385
  %and.5 = and i64 %10, 1229782938247303441, !dbg !2388
    #dbg_value(i64 %and.5, !2389, !DIExpression(), !2390)
  %xor.5 = lshr i64 %10, 1, !dbg !2391
  %shr.5 = and i64 %xor.5, 8608480567731124087, !dbg !2391
  %mul.5 = mul nuw i64 %and.5, 9, !dbg !2392
  %xor2.5 = xor i64 %shr.5, %mul.5, !dbg !2393
  %arrayidx3.5 = getelementptr inbounds nuw i8, ptr %acc, i32 40, !dbg !2395
  %11 = load i64, ptr %arrayidx3.5, align 8, !dbg !2394
  %xor4.5 = xor i64 %11, %xor2.5, !dbg !2394
  store i64 %xor4.5, ptr %arrayidx3.5, align 8, !dbg !2394
    #dbg_value(i32 6, !2382, !DIExpression(), !2384)
  %arrayidx.6 = getelementptr inbounds nuw i8, ptr %in, i32 48, !dbg !2385
  %12 = load i64, ptr %arrayidx.6, align 8, !dbg !2385
  %and.6 = and i64 %12, 1229782938247303441, !dbg !2388
    #dbg_value(i64 %and.6, !2389, !DIExpression(), !2390)
  %xor.6 = lshr i64 %12, 1, !dbg !2391
  %shr.6 = and i64 %xor.6, 8608480567731124087, !dbg !2391
  %mul.6 = mul nuw i64 %and.6, 9, !dbg !2392
  %xor2.6 = xor i64 %shr.6, %mul.6, !dbg !2393
  %arrayidx3.6 = getelementptr inbounds nuw i8, ptr %acc, i32 48, !dbg !2395
  %13 = load i64, ptr %arrayidx3.6, align 8, !dbg !2394
  %xor4.6 = xor i64 %13, %xor2.6, !dbg !2394
  store i64 %xor4.6, ptr %arrayidx3.6, align 8, !dbg !2394
    #dbg_value(i32 7, !2382, !DIExpression(), !2384)
  %arrayidx.7 = getelementptr inbounds nuw i8, ptr %in, i32 56, !dbg !2385
  %14 = load i64, ptr %arrayidx.7, align 8, !dbg !2385
  %and.7 = and i64 %14, 1229782938247303441, !dbg !2388
    #dbg_value(i64 %and.7, !2389, !DIExpression(), !2390)
  %xor.7 = lshr i64 %14, 1, !dbg !2391
  %shr.7 = and i64 %xor.7, 8608480567731124087, !dbg !2391
  %mul.7 = mul nuw i64 %and.7, 9, !dbg !2392
  %xor2.7 = xor i64 %shr.7, %mul.7, !dbg !2393
  %arrayidx3.7 = getelementptr inbounds nuw i8, ptr %acc, i32 56, !dbg !2395
  %15 = load i64, ptr %arrayidx3.7, align 8, !dbg !2394
  %xor4.7 = xor i64 %15, %xor2.7, !dbg !2394
  store i64 %xor4.7, ptr %arrayidx3.7, align 8, !dbg !2394
    #dbg_value(i32 8, !2382, !DIExpression(), !2384)
  %arrayidx.8 = getelementptr inbounds nuw i8, ptr %in, i32 64, !dbg !2385
  %16 = load i64, ptr %arrayidx.8, align 8, !dbg !2385
  %and.8 = and i64 %16, 1229782938247303441, !dbg !2388
    #dbg_value(i64 %and.8, !2389, !DIExpression(), !2390)
  %xor.8 = lshr i64 %16, 1, !dbg !2391
  %shr.8 = and i64 %xor.8, 8608480567731124087, !dbg !2391
  %mul.8 = mul nuw i64 %and.8, 9, !dbg !2392
  %xor2.8 = xor i64 %shr.8, %mul.8, !dbg !2393
  %arrayidx3.8 = getelementptr inbounds nuw i8, ptr %acc, i32 64, !dbg !2395
  %17 = load i64, ptr %arrayidx3.8, align 8, !dbg !2394
  %xor4.8 = xor i64 %17, %xor2.8, !dbg !2394
  store i64 %xor4.8, ptr %arrayidx3.8, align 8, !dbg !2394
    #dbg_value(i32 9, !2382, !DIExpression(), !2384)
  ret void, !dbg !2396
}

; Function Attrs: nounwind
define internal fastcc void @m_vec_mul_add_x(i32 noundef %m_vec_limbs, ptr noundef %in, ptr noundef %acc) unnamed_addr #0 !dbg !2397 {
entry:
    #dbg_value(i32 %m_vec_limbs, !2398, !DIExpression(), !2399)
    #dbg_value(ptr %in, !2400, !DIExpression(), !2399)
    #dbg_value(ptr %acc, !2401, !DIExpression(), !2399)
    #dbg_value(i64 -8608480567731124088, !2402, !DIExpression(), !2399)
    #dbg_value(i32 0, !2403, !DIExpression(), !2405)
    #dbg_value(i32 0, !2403, !DIExpression(), !2405)
  %0 = load i64, ptr %in, align 8, !dbg !2406
    #dbg_value(i64 %0, !2409, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !2410)
  %xor = shl i64 %0, 1, !dbg !2411
  %shl = and i64 %xor, -1229782938247303442, !dbg !2411
  %and = lshr i64 %0, 3, !dbg !2412
  %shr = and i64 %and, 1229782938247303441, !dbg !2412
  %mul = mul nuw nsw i64 %shr, 3, !dbg !2413
  %xor2 = xor i64 %shl, %mul, !dbg !2414
  %1 = load i64, ptr %acc, align 8, !dbg !2415
  %xor4 = xor i64 %1, %xor2, !dbg !2415
  store i64 %xor4, ptr %acc, align 8, !dbg !2415
    #dbg_value(i32 1, !2403, !DIExpression(), !2405)
  %arrayidx.1 = getelementptr inbounds nuw i8, ptr %in, i32 8, !dbg !2406
  %2 = load i64, ptr %arrayidx.1, align 8, !dbg !2406
    #dbg_value(i64 %2, !2409, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !2410)
  %xor.1 = shl i64 %2, 1, !dbg !2411
  %shl.1 = and i64 %xor.1, -1229782938247303442, !dbg !2411
  %and.1 = lshr i64 %2, 3, !dbg !2412
  %shr.1 = and i64 %and.1, 1229782938247303441, !dbg !2412
  %mul.1 = mul nuw nsw i64 %shr.1, 3, !dbg !2413
  %xor2.1 = xor i64 %shl.1, %mul.1, !dbg !2414
  %arrayidx3.1 = getelementptr inbounds nuw i8, ptr %acc, i32 8, !dbg !2416
  %3 = load i64, ptr %arrayidx3.1, align 8, !dbg !2415
  %xor4.1 = xor i64 %3, %xor2.1, !dbg !2415
  store i64 %xor4.1, ptr %arrayidx3.1, align 8, !dbg !2415
    #dbg_value(i32 2, !2403, !DIExpression(), !2405)
  %arrayidx.2 = getelementptr inbounds nuw i8, ptr %in, i32 16, !dbg !2406
  %4 = load i64, ptr %arrayidx.2, align 8, !dbg !2406
    #dbg_value(i64 %4, !2409, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !2410)
  %xor.2 = shl i64 %4, 1, !dbg !2411
  %shl.2 = and i64 %xor.2, -1229782938247303442, !dbg !2411
  %and.2 = lshr i64 %4, 3, !dbg !2412
  %shr.2 = and i64 %and.2, 1229782938247303441, !dbg !2412
  %mul.2 = mul nuw nsw i64 %shr.2, 3, !dbg !2413
  %xor2.2 = xor i64 %shl.2, %mul.2, !dbg !2414
  %arrayidx3.2 = getelementptr inbounds nuw i8, ptr %acc, i32 16, !dbg !2416
  %5 = load i64, ptr %arrayidx3.2, align 8, !dbg !2415
  %xor4.2 = xor i64 %5, %xor2.2, !dbg !2415
  store i64 %xor4.2, ptr %arrayidx3.2, align 8, !dbg !2415
    #dbg_value(i32 3, !2403, !DIExpression(), !2405)
  %arrayidx.3 = getelementptr inbounds nuw i8, ptr %in, i32 24, !dbg !2406
  %6 = load i64, ptr %arrayidx.3, align 8, !dbg !2406
    #dbg_value(i64 %6, !2409, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !2410)
  %xor.3 = shl i64 %6, 1, !dbg !2411
  %shl.3 = and i64 %xor.3, -1229782938247303442, !dbg !2411
  %and.3 = lshr i64 %6, 3, !dbg !2412
  %shr.3 = and i64 %and.3, 1229782938247303441, !dbg !2412
  %mul.3 = mul nuw nsw i64 %shr.3, 3, !dbg !2413
  %xor2.3 = xor i64 %shl.3, %mul.3, !dbg !2414
  %arrayidx3.3 = getelementptr inbounds nuw i8, ptr %acc, i32 24, !dbg !2416
  %7 = load i64, ptr %arrayidx3.3, align 8, !dbg !2415
  %xor4.3 = xor i64 %7, %xor2.3, !dbg !2415
  store i64 %xor4.3, ptr %arrayidx3.3, align 8, !dbg !2415
    #dbg_value(i32 4, !2403, !DIExpression(), !2405)
  %arrayidx.4 = getelementptr inbounds nuw i8, ptr %in, i32 32, !dbg !2406
  %8 = load i64, ptr %arrayidx.4, align 8, !dbg !2406
    #dbg_value(i64 %8, !2409, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !2410)
  %xor.4 = shl i64 %8, 1, !dbg !2411
  %shl.4 = and i64 %xor.4, -1229782938247303442, !dbg !2411
  %and.4 = lshr i64 %8, 3, !dbg !2412
  %shr.4 = and i64 %and.4, 1229782938247303441, !dbg !2412
  %mul.4 = mul nuw nsw i64 %shr.4, 3, !dbg !2413
  %xor2.4 = xor i64 %shl.4, %mul.4, !dbg !2414
  %arrayidx3.4 = getelementptr inbounds nuw i8, ptr %acc, i32 32, !dbg !2416
  %9 = load i64, ptr %arrayidx3.4, align 8, !dbg !2415
  %xor4.4 = xor i64 %9, %xor2.4, !dbg !2415
  store i64 %xor4.4, ptr %arrayidx3.4, align 8, !dbg !2415
    #dbg_value(i32 5, !2403, !DIExpression(), !2405)
  %arrayidx.5 = getelementptr inbounds nuw i8, ptr %in, i32 40, !dbg !2406
  %10 = load i64, ptr %arrayidx.5, align 8, !dbg !2406
    #dbg_value(i64 %10, !2409, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !2410)
  %xor.5 = shl i64 %10, 1, !dbg !2411
  %shl.5 = and i64 %xor.5, -1229782938247303442, !dbg !2411
  %and.5 = lshr i64 %10, 3, !dbg !2412
  %shr.5 = and i64 %and.5, 1229782938247303441, !dbg !2412
  %mul.5 = mul nuw nsw i64 %shr.5, 3, !dbg !2413
  %xor2.5 = xor i64 %shl.5, %mul.5, !dbg !2414
  %arrayidx3.5 = getelementptr inbounds nuw i8, ptr %acc, i32 40, !dbg !2416
  %11 = load i64, ptr %arrayidx3.5, align 8, !dbg !2415
  %xor4.5 = xor i64 %11, %xor2.5, !dbg !2415
  store i64 %xor4.5, ptr %arrayidx3.5, align 8, !dbg !2415
    #dbg_value(i32 6, !2403, !DIExpression(), !2405)
  %arrayidx.6 = getelementptr inbounds nuw i8, ptr %in, i32 48, !dbg !2406
  %12 = load i64, ptr %arrayidx.6, align 8, !dbg !2406
    #dbg_value(i64 %12, !2409, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !2410)
  %xor.6 = shl i64 %12, 1, !dbg !2411
  %shl.6 = and i64 %xor.6, -1229782938247303442, !dbg !2411
  %and.6 = lshr i64 %12, 3, !dbg !2412
  %shr.6 = and i64 %and.6, 1229782938247303441, !dbg !2412
  %mul.6 = mul nuw nsw i64 %shr.6, 3, !dbg !2413
  %xor2.6 = xor i64 %shl.6, %mul.6, !dbg !2414
  %arrayidx3.6 = getelementptr inbounds nuw i8, ptr %acc, i32 48, !dbg !2416
  %13 = load i64, ptr %arrayidx3.6, align 8, !dbg !2415
  %xor4.6 = xor i64 %13, %xor2.6, !dbg !2415
  store i64 %xor4.6, ptr %arrayidx3.6, align 8, !dbg !2415
    #dbg_value(i32 7, !2403, !DIExpression(), !2405)
  %arrayidx.7 = getelementptr inbounds nuw i8, ptr %in, i32 56, !dbg !2406
  %14 = load i64, ptr %arrayidx.7, align 8, !dbg !2406
    #dbg_value(i64 %14, !2409, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !2410)
  %xor.7 = shl i64 %14, 1, !dbg !2411
  %shl.7 = and i64 %xor.7, -1229782938247303442, !dbg !2411
  %and.7 = lshr i64 %14, 3, !dbg !2412
  %shr.7 = and i64 %and.7, 1229782938247303441, !dbg !2412
  %mul.7 = mul nuw nsw i64 %shr.7, 3, !dbg !2413
  %xor2.7 = xor i64 %shl.7, %mul.7, !dbg !2414
  %arrayidx3.7 = getelementptr inbounds nuw i8, ptr %acc, i32 56, !dbg !2416
  %15 = load i64, ptr %arrayidx3.7, align 8, !dbg !2415
  %xor4.7 = xor i64 %15, %xor2.7, !dbg !2415
  store i64 %xor4.7, ptr %arrayidx3.7, align 8, !dbg !2415
    #dbg_value(i32 8, !2403, !DIExpression(), !2405)
  %arrayidx.8 = getelementptr inbounds nuw i8, ptr %in, i32 64, !dbg !2406
  %16 = load i64, ptr %arrayidx.8, align 8, !dbg !2406
    #dbg_value(i64 %16, !2409, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !2410)
  %xor.8 = shl i64 %16, 1, !dbg !2411
  %shl.8 = and i64 %xor.8, -1229782938247303442, !dbg !2411
  %and.8 = lshr i64 %16, 3, !dbg !2412
  %shr.8 = and i64 %and.8, 1229782938247303441, !dbg !2412
  %mul.8 = mul nuw nsw i64 %shr.8, 3, !dbg !2413
  %xor2.8 = xor i64 %shl.8, %mul.8, !dbg !2414
  %arrayidx3.8 = getelementptr inbounds nuw i8, ptr %acc, i32 64, !dbg !2416
  %17 = load i64, ptr %arrayidx3.8, align 8, !dbg !2415
  %xor4.8 = xor i64 %17, %xor2.8, !dbg !2415
  store i64 %xor4.8, ptr %arrayidx3.8, align 8, !dbg !2415
    #dbg_value(i32 9, !2403, !DIExpression(), !2405)
  ret void, !dbg !2417
}

; Function Attrs: nounwind
define internal fastcc void @m_vec_copy(i32 noundef %m_vec_limbs, ptr noundef %in, ptr noundef %out) unnamed_addr #0 !dbg !2418 {
entry:
    #dbg_value(i32 %m_vec_limbs, !2419, !DIExpression(), !2420)
    #dbg_value(ptr %in, !2421, !DIExpression(), !2420)
    #dbg_value(ptr %out, !2422, !DIExpression(), !2420)
    #dbg_value(i32 0, !2423, !DIExpression(), !2425)
    #dbg_value(i32 0, !2423, !DIExpression(), !2425)
  %0 = load i64, ptr %in, align 8, !dbg !2426
  store i64 %0, ptr %out, align 8, !dbg !2429
    #dbg_value(i32 1, !2423, !DIExpression(), !2425)
  %arrayidx.1 = getelementptr inbounds nuw i8, ptr %in, i32 8, !dbg !2426
  %1 = load i64, ptr %arrayidx.1, align 8, !dbg !2426
  %arrayidx1.1 = getelementptr inbounds nuw i8, ptr %out, i32 8, !dbg !2430
  store i64 %1, ptr %arrayidx1.1, align 8, !dbg !2429
    #dbg_value(i32 2, !2423, !DIExpression(), !2425)
  %arrayidx.2 = getelementptr inbounds nuw i8, ptr %in, i32 16, !dbg !2426
  %2 = load i64, ptr %arrayidx.2, align 8, !dbg !2426
  %arrayidx1.2 = getelementptr inbounds nuw i8, ptr %out, i32 16, !dbg !2430
  store i64 %2, ptr %arrayidx1.2, align 8, !dbg !2429
    #dbg_value(i32 3, !2423, !DIExpression(), !2425)
  %arrayidx.3 = getelementptr inbounds nuw i8, ptr %in, i32 24, !dbg !2426
  %3 = load i64, ptr %arrayidx.3, align 8, !dbg !2426
  %arrayidx1.3 = getelementptr inbounds nuw i8, ptr %out, i32 24, !dbg !2430
  store i64 %3, ptr %arrayidx1.3, align 8, !dbg !2429
    #dbg_value(i32 4, !2423, !DIExpression(), !2425)
  %arrayidx.4 = getelementptr inbounds nuw i8, ptr %in, i32 32, !dbg !2426
  %4 = load i64, ptr %arrayidx.4, align 8, !dbg !2426
  %arrayidx1.4 = getelementptr inbounds nuw i8, ptr %out, i32 32, !dbg !2430
  store i64 %4, ptr %arrayidx1.4, align 8, !dbg !2429
    #dbg_value(i32 5, !2423, !DIExpression(), !2425)
  %arrayidx.5 = getelementptr inbounds nuw i8, ptr %in, i32 40, !dbg !2426
  %5 = load i64, ptr %arrayidx.5, align 8, !dbg !2426
  %arrayidx1.5 = getelementptr inbounds nuw i8, ptr %out, i32 40, !dbg !2430
  store i64 %5, ptr %arrayidx1.5, align 8, !dbg !2429
    #dbg_value(i32 6, !2423, !DIExpression(), !2425)
  %arrayidx.6 = getelementptr inbounds nuw i8, ptr %in, i32 48, !dbg !2426
  %6 = load i64, ptr %arrayidx.6, align 8, !dbg !2426
  %arrayidx1.6 = getelementptr inbounds nuw i8, ptr %out, i32 48, !dbg !2430
  store i64 %6, ptr %arrayidx1.6, align 8, !dbg !2429
    #dbg_value(i32 7, !2423, !DIExpression(), !2425)
  %arrayidx.7 = getelementptr inbounds nuw i8, ptr %in, i32 56, !dbg !2426
  %7 = load i64, ptr %arrayidx.7, align 8, !dbg !2426
  %arrayidx1.7 = getelementptr inbounds nuw i8, ptr %out, i32 56, !dbg !2430
  store i64 %7, ptr %arrayidx1.7, align 8, !dbg !2429
    #dbg_value(i32 8, !2423, !DIExpression(), !2425)
  %arrayidx.8 = getelementptr inbounds nuw i8, ptr %in, i32 64, !dbg !2426
  %8 = load i64, ptr %arrayidx.8, align 8, !dbg !2426
  %arrayidx1.8 = getelementptr inbounds nuw i8, ptr %out, i32 64, !dbg !2430
  store i64 %8, ptr %arrayidx1.8, align 8, !dbg !2429
    #dbg_value(i32 9, !2423, !DIExpression(), !2425)
  ret void, !dbg !2431
}

; Function Attrs: nounwind
define dso_local void @pqmayo_MAYO_5_ref_m_upper(ptr noundef %p, ptr noundef %in, ptr noundef %out, i32 noundef %size) local_unnamed_addr #0 !dbg !2432 {
entry:
    #dbg_value(ptr %p, !2463, !DIExpression(), !2464)
    #dbg_value(ptr %in, !2465, !DIExpression(), !2464)
    #dbg_value(ptr %out, !2466, !DIExpression(), !2464)
    #dbg_value(i32 %size, !2467, !DIExpression(), !2464)
    #dbg_value(i32 9, !2468, !DIExpression(), !2464)
    #dbg_value(i32 0, !2469, !DIExpression(), !2464)
    #dbg_value(i32 0, !2470, !DIExpression(), !2472)
  %smax = call i32 @llvm.smax.i32(i32 %size, i32 0), !dbg !2473
  br label %for.cond, !dbg !2473

for.cond:                                         ; preds = %for.inc15, %entry
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.inc15 ], [ %size, %entry ], !dbg !2474
  %m_vecs_stored.0 = phi i32 [ %m_vecs_stored.1, %for.inc15 ], [ 0, %entry ], !dbg !2474
  %r.0 = phi i32 [ %inc16, %for.inc15 ], [ 0, %entry ], !dbg !2475
    #dbg_value(i32 %r.0, !2470, !DIExpression(), !2472)
    #dbg_value(i32 %m_vecs_stored.0, !2469, !DIExpression(), !2464)
  %exitcond1.not = icmp eq i32 %r.0, %smax, !dbg !2476
  br i1 %exitcond1.not, label %for.end17, label %for.cond1.preheader, !dbg !2478

for.cond1.preheader:                              ; preds = %for.cond
  %0 = add i32 %m_vecs_stored.0, %indvars.iv, !dbg !2479
  br label %for.cond1, !dbg !2479

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc
  %m_vecs_stored.1 = phi i32 [ %inc, %for.inc ], [ %m_vecs_stored.0, %for.cond1.preheader ], !dbg !2464
  %c.0 = phi i32 [ %inc14, %for.inc ], [ %r.0, %for.cond1.preheader ], !dbg !2482
    #dbg_value(i32 %c.0, !2483, !DIExpression(), !2484)
    #dbg_value(i32 %m_vecs_stored.1, !2469, !DIExpression(), !2464)
  %exitcond.not = icmp eq i32 %m_vecs_stored.1, %0, !dbg !2485
  br i1 %exitcond.not, label %for.inc15, label %for.body3, !dbg !2479

for.body3:                                        ; preds = %for.cond1
  %mul = mul nsw i32 %r.0, %size, !dbg !2487
  %add = add nsw i32 %mul, %c.0, !dbg !2489
  %add.ptr.idx = mul nsw i32 %add, 72, !dbg !2490
  %add.ptr = getelementptr inbounds i8, ptr %in, i32 %add.ptr.idx, !dbg !2490
  %add.ptr6.idx = mul nsw i32 %m_vecs_stored.1, 72, !dbg !2491
  %add.ptr6 = getelementptr inbounds i8, ptr %out, i32 %add.ptr6.idx, !dbg !2491
  call fastcc void @m_vec_copy.17(i32 noundef 9, ptr noundef %add.ptr, ptr noundef %add.ptr6) #6, !dbg !2492
  %cmp7.not = icmp eq i32 %r.0, %c.0, !dbg !2493
  br i1 %cmp7.not, label %for.inc, label %if.then, !dbg !2493

if.then:                                          ; preds = %for.body3
  %mul8 = mul nsw i32 %c.0, %size, !dbg !2495
  %add9 = add nsw i32 %mul8, %r.0, !dbg !2497
  %add.ptr11.idx = mul nsw i32 %add9, 72, !dbg !2498
  %add.ptr11 = getelementptr inbounds i8, ptr %in, i32 %add.ptr11.idx, !dbg !2498
  %add.ptr13.idx = mul nsw i32 %m_vecs_stored.1, 72, !dbg !2499
  %add.ptr13 = getelementptr inbounds i8, ptr %out, i32 %add.ptr13.idx, !dbg !2499
  call fastcc void @m_vec_add.18(i32 noundef 9, ptr noundef %add.ptr11, ptr noundef %add.ptr13) #6, !dbg !2500
  br label %for.inc, !dbg !2501

for.inc:                                          ; preds = %for.body3, %if.then
    #dbg_value(i32 %m_vecs_stored.1, !2469, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2464)
  %inc = add i32 %m_vecs_stored.1, 1, !dbg !2502
    #dbg_value(i32 %inc, !2469, !DIExpression(), !2464)
  %inc14 = add nuw nsw i32 %c.0, 1, !dbg !2503
    #dbg_value(i32 %inc14, !2483, !DIExpression(), !2484)
  br label %for.cond1, !dbg !2504, !llvm.loop !2505

for.inc15:                                        ; preds = %for.cond1
  %inc16 = add nuw i32 %r.0, 1, !dbg !2507
    #dbg_value(i32 %inc16, !2470, !DIExpression(), !2472)
  %indvars.iv.next = add i32 %indvars.iv, -1, !dbg !2508
  br label %for.cond, !dbg !2508, !llvm.loop !2509

for.end17:                                        ; preds = %for.cond
  ret void, !dbg !2511
}

; Function Attrs: nounwind
define internal fastcc void @m_vec_copy.17(i32 noundef %m_vec_limbs, ptr noundef %in, ptr noundef %out) unnamed_addr #0 !dbg !2512 {
entry:
    #dbg_value(i32 %m_vec_limbs, !2513, !DIExpression(), !2514)
    #dbg_value(ptr %in, !2515, !DIExpression(), !2514)
    #dbg_value(ptr %out, !2516, !DIExpression(), !2514)
    #dbg_value(i32 0, !2517, !DIExpression(), !2519)
    #dbg_value(i32 0, !2517, !DIExpression(), !2519)
  %0 = load i64, ptr %in, align 8, !dbg !2520
  store i64 %0, ptr %out, align 8, !dbg !2523
    #dbg_value(i32 1, !2517, !DIExpression(), !2519)
  %arrayidx.1 = getelementptr inbounds nuw i8, ptr %in, i32 8, !dbg !2520
  %1 = load i64, ptr %arrayidx.1, align 8, !dbg !2520
  %arrayidx1.1 = getelementptr inbounds nuw i8, ptr %out, i32 8, !dbg !2524
  store i64 %1, ptr %arrayidx1.1, align 8, !dbg !2523
    #dbg_value(i32 2, !2517, !DIExpression(), !2519)
  %arrayidx.2 = getelementptr inbounds nuw i8, ptr %in, i32 16, !dbg !2520
  %2 = load i64, ptr %arrayidx.2, align 8, !dbg !2520
  %arrayidx1.2 = getelementptr inbounds nuw i8, ptr %out, i32 16, !dbg !2524
  store i64 %2, ptr %arrayidx1.2, align 8, !dbg !2523
    #dbg_value(i32 3, !2517, !DIExpression(), !2519)
  %arrayidx.3 = getelementptr inbounds nuw i8, ptr %in, i32 24, !dbg !2520
  %3 = load i64, ptr %arrayidx.3, align 8, !dbg !2520
  %arrayidx1.3 = getelementptr inbounds nuw i8, ptr %out, i32 24, !dbg !2524
  store i64 %3, ptr %arrayidx1.3, align 8, !dbg !2523
    #dbg_value(i32 4, !2517, !DIExpression(), !2519)
  %arrayidx.4 = getelementptr inbounds nuw i8, ptr %in, i32 32, !dbg !2520
  %4 = load i64, ptr %arrayidx.4, align 8, !dbg !2520
  %arrayidx1.4 = getelementptr inbounds nuw i8, ptr %out, i32 32, !dbg !2524
  store i64 %4, ptr %arrayidx1.4, align 8, !dbg !2523
    #dbg_value(i32 5, !2517, !DIExpression(), !2519)
  %arrayidx.5 = getelementptr inbounds nuw i8, ptr %in, i32 40, !dbg !2520
  %5 = load i64, ptr %arrayidx.5, align 8, !dbg !2520
  %arrayidx1.5 = getelementptr inbounds nuw i8, ptr %out, i32 40, !dbg !2524
  store i64 %5, ptr %arrayidx1.5, align 8, !dbg !2523
    #dbg_value(i32 6, !2517, !DIExpression(), !2519)
  %arrayidx.6 = getelementptr inbounds nuw i8, ptr %in, i32 48, !dbg !2520
  %6 = load i64, ptr %arrayidx.6, align 8, !dbg !2520
  %arrayidx1.6 = getelementptr inbounds nuw i8, ptr %out, i32 48, !dbg !2524
  store i64 %6, ptr %arrayidx1.6, align 8, !dbg !2523
    #dbg_value(i32 7, !2517, !DIExpression(), !2519)
  %arrayidx.7 = getelementptr inbounds nuw i8, ptr %in, i32 56, !dbg !2520
  %7 = load i64, ptr %arrayidx.7, align 8, !dbg !2520
  %arrayidx1.7 = getelementptr inbounds nuw i8, ptr %out, i32 56, !dbg !2524
  store i64 %7, ptr %arrayidx1.7, align 8, !dbg !2523
    #dbg_value(i32 8, !2517, !DIExpression(), !2519)
  %arrayidx.8 = getelementptr inbounds nuw i8, ptr %in, i32 64, !dbg !2520
  %8 = load i64, ptr %arrayidx.8, align 8, !dbg !2520
  %arrayidx1.8 = getelementptr inbounds nuw i8, ptr %out, i32 64, !dbg !2524
  store i64 %8, ptr %arrayidx1.8, align 8, !dbg !2523
    #dbg_value(i32 9, !2517, !DIExpression(), !2519)
  ret void, !dbg !2525
}

; Function Attrs: nounwind
define internal fastcc void @m_vec_add.18(i32 noundef %m_vec_limbs, ptr noundef %in, ptr noundef %acc) unnamed_addr #0 !dbg !2526 {
entry:
    #dbg_value(i32 %m_vec_limbs, !2527, !DIExpression(), !2528)
    #dbg_value(ptr %in, !2529, !DIExpression(), !2528)
    #dbg_value(ptr %acc, !2530, !DIExpression(), !2528)
    #dbg_value(i32 0, !2531, !DIExpression(), !2533)
    #dbg_value(i32 0, !2531, !DIExpression(), !2533)
  %0 = load i64, ptr %in, align 8, !dbg !2534
  %1 = load i64, ptr %acc, align 8, !dbg !2537
  %xor = xor i64 %1, %0, !dbg !2537
  store i64 %xor, ptr %acc, align 8, !dbg !2537
    #dbg_value(i32 1, !2531, !DIExpression(), !2533)
  %arrayidx.1 = getelementptr inbounds nuw i8, ptr %in, i32 8, !dbg !2534
  %2 = load i64, ptr %arrayidx.1, align 8, !dbg !2534
  %arrayidx1.1 = getelementptr inbounds nuw i8, ptr %acc, i32 8, !dbg !2538
  %3 = load i64, ptr %arrayidx1.1, align 8, !dbg !2537
  %xor.1 = xor i64 %3, %2, !dbg !2537
  store i64 %xor.1, ptr %arrayidx1.1, align 8, !dbg !2537
    #dbg_value(i32 2, !2531, !DIExpression(), !2533)
  %arrayidx.2 = getelementptr inbounds nuw i8, ptr %in, i32 16, !dbg !2534
  %4 = load i64, ptr %arrayidx.2, align 8, !dbg !2534
  %arrayidx1.2 = getelementptr inbounds nuw i8, ptr %acc, i32 16, !dbg !2538
  %5 = load i64, ptr %arrayidx1.2, align 8, !dbg !2537
  %xor.2 = xor i64 %5, %4, !dbg !2537
  store i64 %xor.2, ptr %arrayidx1.2, align 8, !dbg !2537
    #dbg_value(i32 3, !2531, !DIExpression(), !2533)
  %arrayidx.3 = getelementptr inbounds nuw i8, ptr %in, i32 24, !dbg !2534
  %6 = load i64, ptr %arrayidx.3, align 8, !dbg !2534
  %arrayidx1.3 = getelementptr inbounds nuw i8, ptr %acc, i32 24, !dbg !2538
  %7 = load i64, ptr %arrayidx1.3, align 8, !dbg !2537
  %xor.3 = xor i64 %7, %6, !dbg !2537
  store i64 %xor.3, ptr %arrayidx1.3, align 8, !dbg !2537
    #dbg_value(i32 4, !2531, !DIExpression(), !2533)
  %arrayidx.4 = getelementptr inbounds nuw i8, ptr %in, i32 32, !dbg !2534
  %8 = load i64, ptr %arrayidx.4, align 8, !dbg !2534
  %arrayidx1.4 = getelementptr inbounds nuw i8, ptr %acc, i32 32, !dbg !2538
  %9 = load i64, ptr %arrayidx1.4, align 8, !dbg !2537
  %xor.4 = xor i64 %9, %8, !dbg !2537
  store i64 %xor.4, ptr %arrayidx1.4, align 8, !dbg !2537
    #dbg_value(i32 5, !2531, !DIExpression(), !2533)
  %arrayidx.5 = getelementptr inbounds nuw i8, ptr %in, i32 40, !dbg !2534
  %10 = load i64, ptr %arrayidx.5, align 8, !dbg !2534
  %arrayidx1.5 = getelementptr inbounds nuw i8, ptr %acc, i32 40, !dbg !2538
  %11 = load i64, ptr %arrayidx1.5, align 8, !dbg !2537
  %xor.5 = xor i64 %11, %10, !dbg !2537
  store i64 %xor.5, ptr %arrayidx1.5, align 8, !dbg !2537
    #dbg_value(i32 6, !2531, !DIExpression(), !2533)
  %arrayidx.6 = getelementptr inbounds nuw i8, ptr %in, i32 48, !dbg !2534
  %12 = load i64, ptr %arrayidx.6, align 8, !dbg !2534
  %arrayidx1.6 = getelementptr inbounds nuw i8, ptr %acc, i32 48, !dbg !2538
  %13 = load i64, ptr %arrayidx1.6, align 8, !dbg !2537
  %xor.6 = xor i64 %13, %12, !dbg !2537
  store i64 %xor.6, ptr %arrayidx1.6, align 8, !dbg !2537
    #dbg_value(i32 7, !2531, !DIExpression(), !2533)
  %arrayidx.7 = getelementptr inbounds nuw i8, ptr %in, i32 56, !dbg !2534
  %14 = load i64, ptr %arrayidx.7, align 8, !dbg !2534
  %arrayidx1.7 = getelementptr inbounds nuw i8, ptr %acc, i32 56, !dbg !2538
  %15 = load i64, ptr %arrayidx1.7, align 8, !dbg !2537
  %xor.7 = xor i64 %15, %14, !dbg !2537
  store i64 %xor.7, ptr %arrayidx1.7, align 8, !dbg !2537
    #dbg_value(i32 8, !2531, !DIExpression(), !2533)
  %arrayidx.8 = getelementptr inbounds nuw i8, ptr %in, i32 64, !dbg !2534
  %16 = load i64, ptr %arrayidx.8, align 8, !dbg !2534
  %arrayidx1.8 = getelementptr inbounds nuw i8, ptr %acc, i32 64, !dbg !2538
  %17 = load i64, ptr %arrayidx1.8, align 8, !dbg !2537
  %xor.8 = xor i64 %17, %16, !dbg !2537
  store i64 %xor.8, ptr %arrayidx1.8, align 8, !dbg !2537
    #dbg_value(i32 9, !2531, !DIExpression(), !2533)
  ret void, !dbg !2539
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqmayo_MAYO_5_ref_sample_solution(ptr noundef %p, ptr noundef %A, ptr noundef %y, ptr noundef %r, ptr noundef %x, i32 noundef %k, i32 noundef %o, i32 noundef %m, i32 noundef %A_cols) local_unnamed_addr #0 !dbg !2540 {
entry:
  %Ar = alloca [142 x i8], align 1
    #dbg_value(ptr %p, !2543, !DIExpression(), !2544)
    #dbg_value(ptr %A, !2545, !DIExpression(), !2544)
    #dbg_value(ptr %y, !2546, !DIExpression(), !2544)
    #dbg_value(ptr %r, !2547, !DIExpression(), !2544)
    #dbg_value(ptr %x, !2548, !DIExpression(), !2544)
    #dbg_value(i32 %k, !2549, !DIExpression(), !2544)
    #dbg_value(i32 %o, !2550, !DIExpression(), !2544)
    #dbg_value(i32 %m, !2551, !DIExpression(), !2544)
    #dbg_value(i32 %A_cols, !2552, !DIExpression(), !2544)
    #dbg_value(i32 0, !2553, !DIExpression(), !2555)
  %0 = mul nsw i32 %o, %k, !dbg !2556
  %smax = call i32 @llvm.smax.i32(i32 %0, i32 0), !dbg !2556
  br label %for.cond, !dbg !2556

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2557
    #dbg_value(i32 %i.0, !2553, !DIExpression(), !2555)
  %exitcond.not = icmp eq i32 %i.0, %smax, !dbg !2558
  br i1 %exitcond.not, label %for.cond3.preheader, label %for.body, !dbg !2560

for.cond3.preheader:                              ; preds = %for.cond
  %smax13 = call i32 @llvm.smax.i32(i32 %m, i32 0), !dbg !2561
  br label %for.cond3, !dbg !2561

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !2563
  %1 = load i8, ptr %arrayidx, align 1, !dbg !2563
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !2565
  store i8 %1, ptr %arrayidx1, align 1, !dbg !2566
  %inc = add nuw i32 %i.0, 1, !dbg !2567
    #dbg_value(i32 %inc, !2553, !DIExpression(), !2555)
  br label %for.cond, !dbg !2568, !llvm.loop !2569

for.cond3:                                        ; preds = %for.cond3.preheader, %for.body5
  %i2.0 = phi i32 [ %inc12, %for.body5 ], [ 0, %for.cond3.preheader ], !dbg !2571
    #dbg_value(i32 %i2.0, !2572, !DIExpression(), !2573)
  %exitcond14.not = icmp eq i32 %i2.0, %smax13, !dbg !2574
  br i1 %exitcond14.not, label %for.end13, label %for.body5, !dbg !2561

for.body5:                                        ; preds = %for.cond3
  %mul6 = mul nsw i32 %k, %o, !dbg !2576
  %mul7 = mul nsw i32 %k, %o, !dbg !2578
  %add = add nsw i32 %mul7, 1, !dbg !2579
  %mul8 = mul nsw i32 %i2.0, %add, !dbg !2580
  %2 = getelementptr i8, ptr %A, i32 %mul6, !dbg !2581
  %arrayidx10 = getelementptr i8, ptr %2, i32 %mul8, !dbg !2581
  store i8 0, ptr %arrayidx10, align 1, !dbg !2582
  %inc12 = add nuw i32 %i2.0, 1, !dbg !2583
    #dbg_value(i32 %inc12, !2572, !DIExpression(), !2573)
  br label %for.cond3, !dbg !2584, !llvm.loop !2585

for.end13:                                        ; preds = %for.cond3
  %mul14 = mul nsw i32 %k, %o, !dbg !2587
  %add15 = add nsw i32 %mul14, 1, !dbg !2588
  call fastcc void @mat_mul.21(ptr noundef %A, ptr noundef %r, ptr noundef nonnull %Ar, i32 noundef %add15, i32 noundef %m, i32 noundef 1) #6, !dbg !2589
    #dbg_value(i32 0, !2590, !DIExpression(), !2592)
  br label %for.cond17, !dbg !2593

for.cond17:                                       ; preds = %for.body19, %for.end13
  %i16.0 = phi i32 [ 0, %for.end13 ], [ %inc29, %for.body19 ], !dbg !2594
    #dbg_value(i32 %i16.0, !2590, !DIExpression(), !2592)
  %exitcond15.not = icmp eq i32 %i16.0, %smax13, !dbg !2595
  br i1 %exitcond15.not, label %for.end30, label %for.body19, !dbg !2597

for.body19:                                       ; preds = %for.cond17
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %y, i32 %i16.0, !dbg !2598
  %3 = load i8, ptr %arrayidx20, align 1, !dbg !2598
  %arrayidx21 = getelementptr inbounds nuw [142 x i8], ptr %Ar, i32 0, i32 %i16.0, !dbg !2600
  %4 = load i8, ptr %arrayidx21, align 1, !dbg !2600
  %call = call fastcc zeroext i8 @sub_f(i8 noundef zeroext %3, i8 noundef zeroext %4) #6, !dbg !2601
  %mul22 = mul nsw i32 %k, %o, !dbg !2602
  %mul23 = mul nsw i32 %k, %o, !dbg !2603
  %add24 = add nsw i32 %mul23, 1, !dbg !2604
  %mul25 = mul nsw i32 %i16.0, %add24, !dbg !2605
  %5 = getelementptr i8, ptr %A, i32 %mul22, !dbg !2606
  %arrayidx27 = getelementptr i8, ptr %5, i32 %mul25, !dbg !2606
  store i8 %call, ptr %arrayidx27, align 1, !dbg !2607
  %inc29 = add nuw i32 %i16.0, 1, !dbg !2608
    #dbg_value(i32 %inc29, !2590, !DIExpression(), !2592)
  br label %for.cond17, !dbg !2609, !llvm.loop !2610

for.end30:                                        ; preds = %for.cond17
  %mul31 = mul nsw i32 %k, %o, !dbg !2612
  %add32 = add nsw i32 %mul31, 1, !dbg !2613
  call fastcc void @EF(ptr noundef %A, i32 noundef %m, i32 noundef %add32) #6, !dbg !2614
    #dbg_value(i8 0, !2615, !DIExpression(), !2544)
    #dbg_value(i32 0, !2616, !DIExpression(), !2618)
  %6 = add i32 %A_cols, -1, !dbg !2619
  %smax16 = call i32 @llvm.smax.i32(i32 %6, i32 0), !dbg !2619
  br label %for.cond34, !dbg !2619

for.cond34:                                       ; preds = %for.inc43, %for.end30
  %full_rank.0 = phi i8 [ 0, %for.end30 ], [ %or12, %for.inc43 ], !dbg !2544
  %i33.0 = phi i32 [ 0, %for.end30 ], [ %inc44, %for.inc43 ], !dbg !2620
    #dbg_value(i32 %i33.0, !2616, !DIExpression(), !2618)
    #dbg_value(i8 %full_rank.0, !2615, !DIExpression(), !2544)
  %exitcond17.not = icmp eq i32 %i33.0, %smax16, !dbg !2621
  br i1 %exitcond17.not, label %for.end45, label %for.inc43, !dbg !2623

for.inc43:                                        ; preds = %for.cond34
    #dbg_value(!DIArgList(i8 poison, i8 poison), !2615, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !2544)
  %sub37 = add nsw i32 %m, -1, !dbg !2624
  %mul38 = mul nsw i32 %sub37, %A_cols, !dbg !2626
  %7 = getelementptr i8, ptr %A, i32 %mul38, !dbg !2627
  %arrayidx40 = getelementptr i8, ptr %7, i32 %i33.0, !dbg !2627
  %8 = load i8, ptr %arrayidx40, align 1, !dbg !2627
    #dbg_value(!DIArgList(i8 %full_rank.0, i8 %8), !2615, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !2544)
  %or12 = or i8 %full_rank.0, %8, !dbg !2628
    #dbg_value(i8 %or12, !2615, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !2544)
    #dbg_value(i8 %or12, !2615, !DIExpression(), !2544)
  %inc44 = add nuw i32 %i33.0, 1, !dbg !2629
    #dbg_value(i32 %inc44, !2616, !DIExpression(), !2618)
  br label %for.cond34, !dbg !2630, !llvm.loop !2631

for.end45:                                        ; preds = %for.cond34
  %cmp47 = icmp eq i8 %full_rank.0, 0, !dbg !2633
  br i1 %cmp47, label %return, label %for.cond50, !dbg !2633

for.cond50:                                       ; preds = %for.cond63, %for.end45
  %row.0.in = phi i32 [ %m, %for.end45 ], [ %row.0, %for.cond63 ]
  %row.0 = add nsw i32 %row.0.in, -1, !dbg !2635
    #dbg_value(i32 %row.0, !2637, !DIExpression(), !2638)
  %cmp51 = icmp sgt i32 %row.0.in, 0, !dbg !2639
  br i1 %cmp51, label %for.body53, label %return, !dbg !2641

for.body53:                                       ; preds = %for.cond50
    #dbg_value(i8 0, !2642, !DIExpression(), !2544)
  %sub54 = sub nsw i32 %m, %row.0, !dbg !2643
  %div = sdiv i32 32, %sub54, !dbg !2643
  %add55 = add nsw i32 %row.0, %div, !dbg !2643
  %mul56 = mul nsw i32 %k, %o, !dbg !2643
  %cmp57 = icmp slt i32 %add55, %mul56, !dbg !2643
  br i1 %cmp57, label %cond.true, label %cond.false, !dbg !2643

cond.true:                                        ; preds = %for.body53
  %sub59 = sub nsw i32 %m, %row.0, !dbg !2643
  %div60 = sdiv i32 32, %sub59, !dbg !2643
  %add61 = add nsw i32 %row.0, %div60, !dbg !2643
  br label %cond.end, !dbg !2643

cond.false:                                       ; preds = %for.body53
  %mul62 = mul nsw i32 %k, %o, !dbg !2643
  br label %cond.end, !dbg !2643

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %add61, %cond.true ], [ %mul62, %cond.false ], !dbg !2643
    #dbg_value(i32 %cond, !2645, !DIExpression(), !2544)
    #dbg_value(i32 %row.0, !2646, !DIExpression(), !2648)
  br label %for.cond63, !dbg !2649

for.cond63:                                       ; preds = %for.inc229, %cond.end
  %finished.0 = phi i8 [ 0, %cond.end ], [ %or2273, %for.inc229 ], !dbg !2650
  %col.0 = phi i32 [ %row.0, %cond.end ], [ %inc230, %for.inc229 ], !dbg !2651
    #dbg_value(i32 %col.0, !2646, !DIExpression(), !2648)
    #dbg_value(i8 %finished.0, !2642, !DIExpression(), !2544)
  %cmp64.not = icmp sgt i32 %col.0, %cond, !dbg !2652
  br i1 %cmp64.not, label %for.cond50, label %for.body66, !dbg !2654, !llvm.loop !2655

for.body66:                                       ; preds = %for.cond63
  %mul67 = mul nsw i32 %row.0, %A_cols, !dbg !2657
  %9 = getelementptr i8, ptr %A, i32 %mul67, !dbg !2659
  %arrayidx69 = getelementptr i8, ptr %9, i32 %col.0, !dbg !2659
  %10 = load i8, ptr %arrayidx69, align 1, !dbg !2659
  %call70 = call fastcc zeroext i8 @ct_compare_8(i8 noundef zeroext %10, i8 noundef zeroext 0) #6, !dbg !2660
  %not = xor i8 %finished.0, -1, !dbg !2661
    #dbg_value(!DIArgList(i8 %call70, i8 %not), !2662, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_and, DW_OP_stack_value), !2544)
  %add76 = mul i32 %row.0.in, %A_cols, !dbg !2663
  %11 = getelementptr i8, ptr %A, i32 %add76, !dbg !2664
  %arrayidx78 = getelementptr i8, ptr %11, i32 -1, !dbg !2664
  %12 = load i8, ptr %arrayidx78, align 1, !dbg !2664
  %13 = and i8 %12, %not, !dbg !2665
  %and801 = and i8 %13, %call70, !dbg !2665
    #dbg_value(i8 %and801, !2666, !DIExpression(), !2667)
  %arrayidx83 = getelementptr inbounds i8, ptr %x, i32 %col.0, !dbg !2668
  %14 = load i8, ptr %arrayidx83, align 1, !dbg !2669
  %xor2 = xor i8 %14, %and801, !dbg !2669
  store i8 %xor2, ptr %arrayidx83, align 1, !dbg !2669
    #dbg_value(i32 0, !2670, !DIExpression(), !2672)
  br label %for.cond87, !dbg !2673

for.cond87:                                       ; preds = %for.body90, %for.body66
  %i86.0 = phi i32 [ 0, %for.body66 ], [ %add223, %for.body90 ], !dbg !2674
    #dbg_value(i32 %i86.0, !2670, !DIExpression(), !2672)
  %cmp88 = icmp slt i32 %i86.0, %row.0, !dbg !2675
  br i1 %cmp88, label %for.body90, label %for.inc229, !dbg !2677

for.body90:                                       ; preds = %for.cond87
  %mul91 = mul nsw i32 %i86.0, %A_cols, !dbg !2678
  %15 = getelementptr i8, ptr %A, i32 %mul91, !dbg !2680
  %arrayidx93 = getelementptr i8, ptr %15, i32 %col.0, !dbg !2680
  %16 = load i8, ptr %arrayidx93, align 1, !dbg !2680
  %conv94 = zext i8 %16 to i64, !dbg !2681
  %add95 = or disjoint i32 %i86.0, 1, !dbg !2682
  %mul96 = mul nsw i32 %add95, %A_cols, !dbg !2683
  %17 = getelementptr i8, ptr %A, i32 %mul96, !dbg !2684
  %arrayidx98 = getelementptr i8, ptr %17, i32 %col.0, !dbg !2684
  %18 = load i8, ptr %arrayidx98, align 1, !dbg !2684
  %conv99 = zext i8 %18 to i64, !dbg !2685
  %shl100 = shl nuw nsw i64 %conv99, 8, !dbg !2686
  %xor101 = or disjoint i64 %shl100, %conv94, !dbg !2687
  %add102 = or disjoint i32 %i86.0, 2, !dbg !2688
  %mul103 = mul nsw i32 %add102, %A_cols, !dbg !2689
  %19 = getelementptr i8, ptr %A, i32 %mul103, !dbg !2690
  %arrayidx105 = getelementptr i8, ptr %19, i32 %col.0, !dbg !2690
  %20 = load i8, ptr %arrayidx105, align 1, !dbg !2690
  %conv106 = zext i8 %20 to i64, !dbg !2691
  %shl107 = shl nuw nsw i64 %conv106, 16, !dbg !2692
  %xor108 = or disjoint i64 %xor101, %shl107, !dbg !2693
  %add109 = or disjoint i32 %i86.0, 3, !dbg !2694
  %mul110 = mul nsw i32 %add109, %A_cols, !dbg !2695
  %21 = getelementptr i8, ptr %A, i32 %mul110, !dbg !2696
  %arrayidx112 = getelementptr i8, ptr %21, i32 %col.0, !dbg !2696
  %22 = load i8, ptr %arrayidx112, align 1, !dbg !2696
  %conv113 = zext i8 %22 to i64, !dbg !2697
  %shl114 = shl nuw nsw i64 %conv113, 24, !dbg !2698
  %xor115 = or disjoint i64 %xor108, %shl114, !dbg !2699
  %add116 = or disjoint i32 %i86.0, 4, !dbg !2700
  %mul117 = mul nsw i32 %add116, %A_cols, !dbg !2701
  %23 = getelementptr i8, ptr %A, i32 %mul117, !dbg !2702
  %arrayidx119 = getelementptr i8, ptr %23, i32 %col.0, !dbg !2702
  %24 = load i8, ptr %arrayidx119, align 1, !dbg !2702
  %conv120 = zext i8 %24 to i64, !dbg !2703
  %shl121 = shl nuw nsw i64 %conv120, 32, !dbg !2704
  %xor122 = or disjoint i64 %xor115, %shl121, !dbg !2705
  %add123 = or disjoint i32 %i86.0, 5, !dbg !2706
  %mul124 = mul nsw i32 %add123, %A_cols, !dbg !2707
  %25 = getelementptr i8, ptr %A, i32 %mul124, !dbg !2708
  %arrayidx126 = getelementptr i8, ptr %25, i32 %col.0, !dbg !2708
  %26 = load i8, ptr %arrayidx126, align 1, !dbg !2708
  %conv127 = zext i8 %26 to i64, !dbg !2709
  %shl128 = shl nuw nsw i64 %conv127, 40, !dbg !2710
  %xor129 = xor i64 %xor122, %shl128, !dbg !2711
  %add130 = or disjoint i32 %i86.0, 6, !dbg !2712
  %mul131 = mul nsw i32 %add130, %A_cols, !dbg !2713
  %27 = getelementptr i8, ptr %A, i32 %mul131, !dbg !2714
  %arrayidx133 = getelementptr i8, ptr %27, i32 %col.0, !dbg !2714
  %28 = load i8, ptr %arrayidx133, align 1, !dbg !2714
  %conv134 = zext i8 %28 to i64, !dbg !2715
  %shl135 = shl nuw nsw i64 %conv134, 48, !dbg !2716
  %xor136 = xor i64 %xor129, %shl135, !dbg !2717
  %add137 = or disjoint i32 %i86.0, 7, !dbg !2718
  %mul138 = mul nsw i32 %add137, %A_cols, !dbg !2719
  %29 = getelementptr i8, ptr %A, i32 %mul138, !dbg !2720
  %arrayidx140 = getelementptr i8, ptr %29, i32 %col.0, !dbg !2720
  %30 = load i8, ptr %arrayidx140, align 1, !dbg !2720
  %conv141 = zext i8 %30 to i64, !dbg !2721
  %shl142 = shl nuw i64 %conv141, 56, !dbg !2722
  %xor143 = xor i64 %xor136, %shl142, !dbg !2723
    #dbg_value(i64 %xor143, !2724, !DIExpression(), !2725)
  %call144 = call fastcc i64 @mul_fx8(i8 noundef zeroext %and801, i64 noundef %xor143) #6, !dbg !2726
    #dbg_value(i64 %call144, !2724, !DIExpression(), !2725)
  %mul1464 = or disjoint i32 %i86.0, 1, !dbg !2727
  %add147 = mul i32 %mul1464, %A_cols, !dbg !2727
  %31 = getelementptr i8, ptr %A, i32 %add147, !dbg !2728
  %arrayidx149 = getelementptr i8, ptr %31, i32 -1, !dbg !2728
  %32 = load i8, ptr %arrayidx149, align 1, !dbg !2729
  %33 = trunc i64 %call144 to i8, !dbg !2729
  %34 = and i8 %33, 15, !dbg !2729
  %conv152 = xor i8 %34, %32, !dbg !2729
  store i8 %conv152, ptr %arrayidx149, align 1, !dbg !2729
  %shr = lshr i64 %call144, 8, !dbg !2730
  %mul1555 = or disjoint i32 %i86.0, 2, !dbg !2731
  %add156 = mul i32 %mul1555, %A_cols, !dbg !2731
  %35 = getelementptr i8, ptr %A, i32 %add156, !dbg !2732
  %arrayidx158 = getelementptr i8, ptr %35, i32 -1, !dbg !2732
  %36 = load i8, ptr %arrayidx158, align 1, !dbg !2733
  %37 = trunc i64 %shr to i8, !dbg !2733
  %38 = and i8 %37, 15, !dbg !2733
  %conv161 = xor i8 %38, %36, !dbg !2733
  store i8 %conv161, ptr %arrayidx158, align 1, !dbg !2733
  %shr162 = lshr i64 %call144, 16, !dbg !2734
  %mul1656 = or disjoint i32 %i86.0, 3, !dbg !2735
  %add166 = mul i32 %mul1656, %A_cols, !dbg !2735
  %39 = getelementptr i8, ptr %A, i32 %add166, !dbg !2736
  %arrayidx168 = getelementptr i8, ptr %39, i32 -1, !dbg !2736
  %40 = load i8, ptr %arrayidx168, align 1, !dbg !2737
  %41 = trunc i64 %shr162 to i8, !dbg !2737
  %42 = and i8 %41, 15, !dbg !2737
  %conv171 = xor i8 %42, %40, !dbg !2737
  store i8 %conv171, ptr %arrayidx168, align 1, !dbg !2737
  %shr172 = lshr i64 %call144, 24, !dbg !2738
  %mul1757 = or disjoint i32 %i86.0, 4, !dbg !2739
  %add176 = mul i32 %mul1757, %A_cols, !dbg !2739
  %43 = getelementptr i8, ptr %A, i32 %add176, !dbg !2740
  %arrayidx178 = getelementptr i8, ptr %43, i32 -1, !dbg !2740
  %44 = load i8, ptr %arrayidx178, align 1, !dbg !2741
  %45 = trunc i64 %shr172 to i8, !dbg !2741
  %46 = and i8 %45, 15, !dbg !2741
  %conv181 = xor i8 %46, %44, !dbg !2741
  store i8 %conv181, ptr %arrayidx178, align 1, !dbg !2741
  %shr182 = lshr i64 %call144, 32, !dbg !2742
  %mul1858 = or disjoint i32 %i86.0, 5, !dbg !2743
  %add186 = mul i32 %mul1858, %A_cols, !dbg !2743
  %47 = getelementptr i8, ptr %A, i32 %add186, !dbg !2744
  %arrayidx188 = getelementptr i8, ptr %47, i32 -1, !dbg !2744
  %48 = load i8, ptr %arrayidx188, align 1, !dbg !2745
  %49 = trunc i64 %shr182 to i8, !dbg !2745
  %50 = and i8 %49, 15, !dbg !2745
  %conv191 = xor i8 %50, %48, !dbg !2745
  store i8 %conv191, ptr %arrayidx188, align 1, !dbg !2745
  %shr192 = lshr i64 %call144, 40, !dbg !2746
  %mul1959 = or disjoint i32 %i86.0, 6, !dbg !2747
  %add196 = mul i32 %mul1959, %A_cols, !dbg !2747
  %51 = getelementptr i8, ptr %A, i32 %add196, !dbg !2748
  %arrayidx198 = getelementptr i8, ptr %51, i32 -1, !dbg !2748
  %52 = load i8, ptr %arrayidx198, align 1, !dbg !2749
  %53 = trunc i64 %shr192 to i8, !dbg !2749
  %54 = and i8 %53, 15, !dbg !2749
  %conv201 = xor i8 %54, %52, !dbg !2749
  store i8 %conv201, ptr %arrayidx198, align 1, !dbg !2749
  %shr202 = lshr i64 %call144, 48, !dbg !2750
  %mul20510 = or disjoint i32 %i86.0, 7, !dbg !2751
  %add206 = mul i32 %mul20510, %A_cols, !dbg !2751
  %55 = getelementptr i8, ptr %A, i32 %add206, !dbg !2752
  %arrayidx208 = getelementptr i8, ptr %55, i32 -1, !dbg !2752
  %56 = load i8, ptr %arrayidx208, align 1, !dbg !2753
  %57 = trunc i64 %shr202 to i8, !dbg !2753
  %58 = and i8 %57, 15, !dbg !2753
  %conv211 = xor i8 %58, %56, !dbg !2753
  store i8 %conv211, ptr %arrayidx208, align 1, !dbg !2753
  %shr212 = lshr i64 %call144, 56, !dbg !2754
  %mul21511 = add nuw i32 %i86.0, 8, !dbg !2755
  %add216 = mul i32 %mul21511, %A_cols, !dbg !2755
  %59 = getelementptr i8, ptr %A, i32 %add216, !dbg !2756
  %arrayidx218 = getelementptr i8, ptr %59, i32 -1, !dbg !2756
  %60 = load i8, ptr %arrayidx218, align 1, !dbg !2757
  %61 = trunc nuw nsw i64 %shr212 to i8, !dbg !2757
  %conv221 = xor i8 %60, %61, !dbg !2757
  store i8 %conv221, ptr %arrayidx218, align 1, !dbg !2757
  %add223 = add nuw nsw i32 %i86.0, 8, !dbg !2758
    #dbg_value(i32 %add223, !2670, !DIExpression(), !2672)
  br label %for.cond87, !dbg !2759, !llvm.loop !2760

for.inc229:                                       ; preds = %for.cond87
    #dbg_value(!DIArgList(i8 %finished.0, i8 %call70), !2642, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !2544)
  %or2273 = or i8 %finished.0, %call70, !dbg !2762
    #dbg_value(i8 %or2273, !2642, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !2544)
    #dbg_value(i8 %or2273, !2642, !DIExpression(), !2544)
  %inc230 = add nsw i32 %col.0, 1, !dbg !2763
    #dbg_value(i32 %inc230, !2646, !DIExpression(), !2648)
  br label %for.cond63, !dbg !2764, !llvm.loop !2765

return:                                           ; preds = %for.cond50, %for.end45
  %retval.0 = phi i32 [ 0, %for.end45 ], [ 1, %for.cond50 ], !dbg !2544
  ret i32 %retval.0, !dbg !2767
}

; Function Attrs: nounwind
define internal fastcc void @mat_mul.21(ptr noundef %a, ptr noundef %b, ptr noundef %c, i32 noundef %colrow_ab, i32 noundef %row_a, i32 noundef %col_b) unnamed_addr #0 !dbg !2768 {
entry:
    #dbg_value(ptr %a, !2769, !DIExpression(), !2770)
    #dbg_value(ptr %b, !2771, !DIExpression(), !2770)
    #dbg_value(ptr %c, !2772, !DIExpression(), !2770)
    #dbg_value(i32 %colrow_ab, !2773, !DIExpression(), !2770)
    #dbg_value(i32 %row_a, !2774, !DIExpression(), !2770)
    #dbg_value(i32 %col_b, !2775, !DIExpression(), !2770)
    #dbg_value(i32 0, !2776, !DIExpression(), !2778)
  %smax = call i32 @llvm.smax.i32(i32 %col_b, i32 0), !dbg !2779
  %smax1 = call i32 @llvm.smax.i32(i32 %row_a, i32 0), !dbg !2779
  br label %for.cond, !dbg !2779

for.cond:                                         ; preds = %for.inc4, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc5, %for.inc4 ], !dbg !2780
  %c.addr.0 = phi ptr [ %c, %entry ], [ %c.addr.1, %for.inc4 ]
  %a.addr.0 = phi ptr [ %a, %entry ], [ %add.ptr6, %for.inc4 ]
    #dbg_value(ptr %a.addr.0, !2769, !DIExpression(), !2770)
    #dbg_value(ptr %c.addr.0, !2772, !DIExpression(), !2770)
    #dbg_value(i32 %i.0, !2776, !DIExpression(), !2778)
  %exitcond2.not = icmp eq i32 %i.0, %smax1, !dbg !2781
  br i1 %exitcond2.not, label %for.end7, label %for.cond1, !dbg !2783

for.cond1:                                        ; preds = %for.cond, %for.body3
  %c.addr.1 = phi ptr [ %incdec.ptr, %for.body3 ], [ %c.addr.0, %for.cond ]
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond ], !dbg !2784
    #dbg_value(i32 %j.0, !2787, !DIExpression(), !2788)
    #dbg_value(ptr %c.addr.1, !2772, !DIExpression(), !2770)
  %exitcond.not = icmp eq i32 %j.0, %smax, !dbg !2789
  br i1 %exitcond.not, label %for.inc4, label %for.body3, !dbg !2791

for.body3:                                        ; preds = %for.cond1
  %add.ptr = getelementptr inbounds nuw i8, ptr %b, i32 %j.0, !dbg !2792
  %call = call fastcc zeroext i8 @lincomb.24(ptr noundef %a.addr.0, ptr noundef %add.ptr, i32 noundef %colrow_ab, i32 noundef %col_b) #6, !dbg !2794
  store i8 %call, ptr %c.addr.1, align 1, !dbg !2795
  %inc = add nuw i32 %j.0, 1, !dbg !2796
    #dbg_value(i32 %inc, !2787, !DIExpression(), !2788)
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %c.addr.1, i32 1, !dbg !2797
    #dbg_value(ptr %incdec.ptr, !2772, !DIExpression(), !2770)
  br label %for.cond1, !dbg !2798, !llvm.loop !2799

for.inc4:                                         ; preds = %for.cond1
  %inc5 = add nuw i32 %i.0, 1, !dbg !2801
    #dbg_value(i32 %inc5, !2776, !DIExpression(), !2778)
  %add.ptr6 = getelementptr inbounds i8, ptr %a.addr.0, i32 %colrow_ab, !dbg !2802
    #dbg_value(ptr %add.ptr6, !2769, !DIExpression(), !2770)
  br label %for.cond, !dbg !2803, !llvm.loop !2804

for.end7:                                         ; preds = %for.cond
  %cmp8 = icmp eq i32 %row_a, %col_b, !dbg !2806
  %call9 = call zeroext i1 @assert(i1 noundef zeroext %cmp8) #8, !dbg !2807
  ret void, !dbg !2808
}

; Function Attrs: nounwind
define internal fastcc zeroext i8 @sub_f(i8 noundef zeroext %a, i8 noundef zeroext %b) unnamed_addr #0 !dbg !2809 {
entry:
    #dbg_value(i8 %a, !2810, !DIExpression(), !2811)
    #dbg_value(i8 %b, !2812, !DIExpression(), !2811)
  %xor1 = xor i8 %a, %b, !dbg !2813
  ret i8 %xor1, !dbg !2814
}

; Function Attrs: nounwind
define internal fastcc void @EF(ptr noundef %A, i32 noundef %nrows, i32 noundef %ncols) unnamed_addr #0 !dbg !2815 {
entry:
  %_pivot_row = alloca [10 x i64], align 32
  %_pivot_row2 = alloca [10 x i64], align 32
  %packed_A = alloca [1420 x i64], align 32
  %temp = alloca [160 x i8], align 1
    #dbg_value(ptr %A, !2819, !DIExpression(), !2820)
    #dbg_value(i32 %nrows, !2821, !DIExpression(), !2820)
    #dbg_value(i32 %ncols, !2822, !DIExpression(), !2820)
    #dbg_declare(ptr %_pivot_row, !2823, !DIExpression(), !2827)
    #dbg_declare(ptr %_pivot_row2, !2828, !DIExpression(), !2829)
    #dbg_declare(ptr %packed_A, !2830, !DIExpression(), !2834)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 32 dereferenceable(11360) %packed_A, i8 0, i32 11360, i1 false), !dbg !2834
  %add = add nsw i32 %ncols, 15, !dbg !2835
  %div = sdiv i32 %add, 16, !dbg !2836
    #dbg_value(i32 %div, !2837, !DIExpression(), !2820)
    #dbg_value(i32 0, !2838, !DIExpression(), !2840)
  %smax = call i32 @llvm.smax.i32(i32 %nrows, i32 0), !dbg !2841
  br label %for.cond, !dbg !2841

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2842
    #dbg_value(i32 %i.0, !2838, !DIExpression(), !2840)
  %exitcond.not = icmp eq i32 %i.0, %smax, !dbg !2843
  br i1 %exitcond.not, label %for.cond3.preheader, label %for.body, !dbg !2845

for.cond3.preheader:                              ; preds = %for.cond
  %smax1 = call i32 @llvm.smax.i32(i32 %div, i32 0), !dbg !2846
  %smax5 = call i32 @llvm.smax.i32(i32 %ncols, i32 0), !dbg !2846
  br label %for.cond3, !dbg !2846

for.body:                                         ; preds = %for.cond
  %mul = mul nsw i32 %i.0, %ncols, !dbg !2848
  %add.ptr = getelementptr inbounds i8, ptr %A, i32 %mul, !dbg !2850
  %mul1 = mul nsw i32 %i.0, %div, !dbg !2851
  %add.ptr2 = getelementptr inbounds i64, ptr %packed_A, i32 %mul1, !dbg !2852
  call fastcc void @ef_pack_m_vec(ptr noundef %add.ptr, ptr noundef nonnull %add.ptr2, i32 noundef %ncols) #6, !dbg !2853
  %inc = add nuw i32 %i.0, 1, !dbg !2854
    #dbg_value(i32 %inc, !2838, !DIExpression(), !2840)
  br label %for.cond, !dbg !2855, !llvm.loop !2856

for.cond3:                                        ; preds = %for.cond3.preheader, %for.inc117
  %pivot_col.0 = phi i32 [ %inc118, %for.inc117 ], [ 0, %for.cond3.preheader ], !dbg !2858
  %pivot_row.0 = phi i32 [ %conv116, %for.inc117 ], [ 0, %for.cond3.preheader ], !dbg !2820
    #dbg_value(i32 %pivot_row.0, !2859, !DIExpression(), !2820)
    #dbg_value(i32 %pivot_col.0, !2860, !DIExpression(), !2861)
  %exitcond6.not = icmp eq i32 %pivot_col.0, %smax5, !dbg !2862
  br i1 %exitcond6.not, label %for.cond121, label %for.body5, !dbg !2846

for.body5:                                        ; preds = %for.cond3
  %add6 = add nsw i32 %pivot_col.0, %nrows, !dbg !2864
  %cmp7 = icmp slt i32 %add6, %ncols, !dbg !2864
  %add8 = add nsw i32 %pivot_col.0, %nrows, !dbg !2864
  %sub9 = sub nsw i32 %add8, %ncols, !dbg !2864
  %cond = select i1 %cmp7, i32 0, i32 %sub9, !dbg !2864
    #dbg_value(i32 %cond, !2866, !DIExpression(), !2867)
  %sub13 = add nsw i32 %nrows, -1, !dbg !2868
    #dbg_value(i32 %cond16, !2869, !DIExpression(), !2867)
    #dbg_value(i32 0, !2870, !DIExpression(), !2872)
  br label %for.cond18, !dbg !2873

for.cond18:                                       ; preds = %for.body20, %for.body5
  %i17.0 = phi i32 [ 0, %for.body5 ], [ %inc23, %for.body20 ], !dbg !2874
    #dbg_value(i32 %i17.0, !2870, !DIExpression(), !2872)
  %exitcond2.not = icmp eq i32 %i17.0, %smax1, !dbg !2875
  br i1 %exitcond2.not, label %for.cond25.preheader, label %for.body20, !dbg !2877

for.cond25.preheader:                             ; preds = %for.cond18
  %cmp11.not = icmp sgt i32 %nrows, %pivot_col.0, !dbg !2868
  %cond16 = select i1 %cmp11.not, i32 %pivot_col.0, i32 %sub13, !dbg !2868
  br label %for.cond25, !dbg !2878

for.body20:                                       ; preds = %for.cond18
  %arrayidx = getelementptr inbounds nuw [10 x i64], ptr %_pivot_row, i32 0, i32 %i17.0, !dbg !2880
  store i64 0, ptr %arrayidx, align 8, !dbg !2882
  %arrayidx21 = getelementptr inbounds nuw [10 x i64], ptr %_pivot_row2, i32 0, i32 %i17.0, !dbg !2883
  store i64 0, ptr %arrayidx21, align 8, !dbg !2884
  %inc23 = add nuw nsw i32 %i17.0, 1, !dbg !2885
    #dbg_value(i32 %inc23, !2870, !DIExpression(), !2872)
  br label %for.cond18, !dbg !2886, !llvm.loop !2887

for.cond25:                                       ; preds = %for.cond25.preheader, %for.end48
  %pivot_is_zero.0 = phi i64 [ %not52, %for.end48 ], [ -1, %for.cond25.preheader ], !dbg !2867
  %pivot.0 = phi i8 [ %call50, %for.end48 ], [ 0, %for.cond25.preheader ], !dbg !2867
  %row.0 = phi i32 [ %inc54, %for.end48 ], [ %cond, %for.cond25.preheader ], !dbg !2889
    #dbg_value(i32 %row.0, !2890, !DIExpression(), !2889)
    #dbg_value(i8 %pivot.0, !2891, !DIExpression(), !2867)
    #dbg_value(i64 %pivot_is_zero.0, !2892, !DIExpression(), !2867)
  %add27 = add nsw i32 %cond16, 32, !dbg !2893
  %cmp28.not = icmp sgt i32 %nrows, %add27, !dbg !2893
  %sub30 = add nsw i32 %nrows, -1, !dbg !2893
  %add32 = add nsw i32 %cond16, 32, !dbg !2893
  %cond34 = select i1 %cmp28.not, i32 %add32, i32 %sub30, !dbg !2893
  %cmp35.not = icmp sgt i32 %row.0, %cond34, !dbg !2895
  br i1 %cmp35.not, label %for.end55, label %for.body36, !dbg !2878

for.body36:                                       ; preds = %for.cond25
  %call = call fastcc i64 @ct_compare_64(i32 noundef %row.0, i32 noundef %pivot_row.0) #6, !dbg !2896
  %not = xor i64 %call, -1, !dbg !2898
    #dbg_value(i64 %not, !2899, !DIExpression(), !2900)
  %call37 = call fastcc i64 @ct_64_is_greater_than(i32 noundef %row.0, i32 noundef %pivot_row.0) #6, !dbg !2901
    #dbg_value(i64 %call37, !2902, !DIExpression(), !2900)
    #dbg_value(i32 0, !2903, !DIExpression(), !2905)
  br label %for.cond38, !dbg !2906

for.cond38:                                       ; preds = %for.body40, %for.body36
  %j.0 = phi i32 [ 0, %for.body36 ], [ %inc47, %for.body40 ], !dbg !2907
    #dbg_value(i32 %j.0, !2903, !DIExpression(), !2905)
  %exitcond3.not = icmp eq i32 %j.0, %smax1, !dbg !2908
  br i1 %exitcond3.not, label %for.end48, label %for.body40, !dbg !2910

for.body40:                                       ; preds = %for.cond38
  %and = and i64 %call37, %pivot_is_zero.0, !dbg !2911
  %or = or i64 %and, %not, !dbg !2913
  %mul41 = mul nsw i32 %row.0, %div, !dbg !2914
  %add42 = add nsw i32 %mul41, %j.0, !dbg !2915
  %arrayidx43 = getelementptr inbounds [1420 x i64], ptr %packed_A, i32 0, i32 %add42, !dbg !2916
  %0 = load i64, ptr %arrayidx43, align 8, !dbg !2916
  %and44 = and i64 %or, %0, !dbg !2917
  %arrayidx45 = getelementptr inbounds nuw [10 x i64], ptr %_pivot_row, i32 0, i32 %j.0, !dbg !2918
  %1 = load i64, ptr %arrayidx45, align 8, !dbg !2919
  %xor = xor i64 %1, %and44, !dbg !2919
  store i64 %xor, ptr %arrayidx45, align 8, !dbg !2919
  %inc47 = add nuw nsw i32 %j.0, 1, !dbg !2920
    #dbg_value(i32 %inc47, !2903, !DIExpression(), !2905)
  br label %for.cond38, !dbg !2921, !llvm.loop !2922

for.end48:                                        ; preds = %for.cond38
  %call50 = call fastcc zeroext i8 @m_extract_element(ptr noundef nonnull %_pivot_row, i32 noundef %pivot_col.0) #6, !dbg !2924
    #dbg_value(i8 %call50, !2891, !DIExpression(), !2867)
  %conv = zext nneg i8 %call50 to i32, !dbg !2925
  %call51 = call fastcc i64 @ct_compare_64(i32 noundef %conv, i32 noundef 0) #6, !dbg !2926
    #dbg_value(i64 %call51, !2892, !DIExpression(DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_stack_value), !2867)
  %not52 = xor i64 %call51, -1, !dbg !2927
    #dbg_value(i64 %not52, !2892, !DIExpression(), !2867)
  %inc54 = add nsw i32 %row.0, 1, !dbg !2928
    #dbg_value(i32 %inc54, !2890, !DIExpression(), !2889)
  br label %for.cond25, !dbg !2929, !llvm.loop !2930

for.end55:                                        ; preds = %for.cond25
  %call56 = call fastcc zeroext i8 @inverse_f(i8 noundef zeroext %pivot.0) #6, !dbg !2932
    #dbg_value(i8 %call56, !2933, !DIExpression(), !2820)
  call fastcc void @vec_mul_add_u64(i32 noundef %div, ptr noundef nonnull %_pivot_row, i8 noundef zeroext %call56, ptr noundef nonnull %_pivot_row2) #6, !dbg !2934
    #dbg_value(i32 %cond, !2935, !DIExpression(), !2937)
  br label %for.cond60, !dbg !2938

for.cond60:                                       ; preds = %for.inc86, %for.end55
  %row59.0 = phi i32 [ %cond, %for.end55 ], [ %inc87, %for.inc86 ], !dbg !2939
    #dbg_value(i32 %row59.0, !2935, !DIExpression(), !2937)
  %cmp61.not = icmp sgt i32 %row59.0, %cond16, !dbg !2940
  br i1 %cmp61.not, label %for.cond90, label %for.body63, !dbg !2942

for.body63:                                       ; preds = %for.cond60
  %call64 = call fastcc i64 @ct_compare_64(i32 noundef %row59.0, i32 noundef %pivot_row.0) #6, !dbg !2943
  %and67.demorgan = or i64 %call64, %pivot_is_zero.0, !dbg !2945
  %and67 = xor i64 %and67.demorgan, -1, !dbg !2945
    #dbg_value(i64 %and67, !2946, !DIExpression(), !2947)
    #dbg_value(i64 %and67.demorgan, !2948, !DIExpression(), !2947)
    #dbg_value(i32 0, !2949, !DIExpression(), !2951)
  br label %for.cond69, !dbg !2952

for.cond69:                                       ; preds = %for.body72, %for.body63
  %col.0 = phi i32 [ 0, %for.body63 ], [ %inc84, %for.body72 ], !dbg !2953
    #dbg_value(i32 %col.0, !2949, !DIExpression(), !2951)
  %exitcond4.not = icmp eq i32 %col.0, %smax1, !dbg !2954
  br i1 %exitcond4.not, label %for.inc86, label %for.body72, !dbg !2956

for.body72:                                       ; preds = %for.cond69
  %mul73 = mul nsw i32 %row59.0, %div, !dbg !2957
  %add74 = add nsw i32 %mul73, %col.0, !dbg !2959
  %arrayidx75 = getelementptr inbounds [1420 x i64], ptr %packed_A, i32 0, i32 %add74, !dbg !2960
  %2 = load i64, ptr %arrayidx75, align 8, !dbg !2960
  %and76 = and i64 %and67.demorgan, %2, !dbg !2961
  %arrayidx77 = getelementptr inbounds nuw [10 x i64], ptr %_pivot_row2, i32 0, i32 %col.0, !dbg !2962
  %3 = load i64, ptr %arrayidx77, align 8, !dbg !2962
  %and78 = and i64 %3, %and67, !dbg !2963
  %add79 = add i64 %and76, %and78, !dbg !2964
  %mul80 = mul nsw i32 %row59.0, %div, !dbg !2965
  %add81 = add nsw i32 %mul80, %col.0, !dbg !2966
  %arrayidx82 = getelementptr inbounds [1420 x i64], ptr %packed_A, i32 0, i32 %add81, !dbg !2967
  store i64 %add79, ptr %arrayidx82, align 8, !dbg !2968
  %inc84 = add nuw nsw i32 %col.0, 1, !dbg !2969
    #dbg_value(i32 %inc84, !2949, !DIExpression(), !2951)
  br label %for.cond69, !dbg !2970, !llvm.loop !2971

for.inc86:                                        ; preds = %for.cond69
  %inc87 = add nsw i32 %row59.0, 1, !dbg !2973
    #dbg_value(i32 %inc87, !2935, !DIExpression(), !2937)
  br label %for.cond60, !dbg !2974, !llvm.loop !2975

for.cond90:                                       ; preds = %for.cond60, %for.body93
  %row89.0 = phi i32 [ %inc110, %for.body93 ], [ %cond, %for.cond60 ], !dbg !2977
    #dbg_value(i32 %row89.0, !2979, !DIExpression(), !2980)
  %cmp91 = icmp slt i32 %row89.0, %nrows, !dbg !2981
  br i1 %cmp91, label %for.body93, label %for.inc117, !dbg !2983

for.body93:                                       ; preds = %for.cond90
  %cmp94 = icmp sgt i32 %row89.0, %pivot_row.0, !dbg !2984
    #dbg_value(i1 %cmp94, !2986, !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !2987)
  %mul98 = mul nsw i32 %row89.0, %div, !dbg !2988
  %add.ptr99 = getelementptr inbounds i64, ptr %packed_A, i32 %mul98, !dbg !2989
  %call100 = call fastcc zeroext i8 @m_extract_element(ptr noundef nonnull %add.ptr99, i32 noundef %pivot_col.0) #6, !dbg !2990
    #dbg_value(i8 %call100, !2991, !DIExpression(), !2987)
  %conv105 = select i1 %cmp94, i8 %call100, i8 0, !dbg !2992
  %mul107 = mul nsw i32 %row89.0, %div, !dbg !2993
  %add.ptr108 = getelementptr inbounds i64, ptr %packed_A, i32 %mul107, !dbg !2994
  call fastcc void @vec_mul_add_u64(i32 noundef %div, ptr noundef nonnull %_pivot_row2, i8 noundef zeroext %conv105, ptr noundef nonnull %add.ptr108) #6, !dbg !2995
  %inc110 = add nsw i32 %row89.0, 1, !dbg !2996
    #dbg_value(i32 %inc110, !2979, !DIExpression(), !2980)
  br label %for.cond90, !dbg !2997, !llvm.loop !2998

for.inc117:                                       ; preds = %for.cond90
    #dbg_value(!DIArgList(i64 %pivot_is_zero.0, i32 %pivot_row.0), !2859, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_plus_uconst, 1, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_plus, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value), !2820)
  %4 = trunc i64 %pivot_is_zero.0 to i32, !dbg !3000
  %5 = add i32 %4, 1, !dbg !3000
  %conv116 = add i32 %5, %pivot_row.0, !dbg !3000
    #dbg_value(i32 %conv116, !2859, !DIExpression(), !2820)
  %inc118 = add nuw i32 %pivot_col.0, 1, !dbg !3001
    #dbg_value(i32 %inc118, !2860, !DIExpression(), !2861)
  br label %for.cond3, !dbg !3002, !llvm.loop !3003

for.cond121:                                      ; preds = %for.cond3, %for.inc141
  %i120.0 = phi i32 [ %inc142, %for.inc141 ], [ 0, %for.cond3 ], !dbg !3005
    #dbg_value(i32 %i120.0, !3007, !DIExpression(), !3008)
  %exitcond8.not = icmp eq i32 %i120.0, %smax, !dbg !3009
  br i1 %exitcond8.not, label %for.end143, label %for.body124, !dbg !3011

for.body124:                                      ; preds = %for.cond121
  %mul126 = mul nsw i32 %i120.0, %div, !dbg !3012
  %add.ptr127 = getelementptr inbounds i64, ptr %packed_A, i32 %mul126, !dbg !3014
  call fastcc void @ef_unpack_m_vec(i32 noundef %div, ptr noundef nonnull %add.ptr127, ptr noundef nonnull %temp) #6, !dbg !3015
    #dbg_value(i32 0, !3016, !DIExpression(), !3018)
  br label %for.cond130, !dbg !3019

for.cond130:                                      ; preds = %for.body133, %for.body124
  %j129.0 = phi i32 [ 0, %for.body124 ], [ %inc139, %for.body133 ], !dbg !3020
    #dbg_value(i32 %j129.0, !3016, !DIExpression(), !3018)
  %exitcond7.not = icmp eq i32 %j129.0, %smax5, !dbg !3021
  br i1 %exitcond7.not, label %for.inc141, label %for.body133, !dbg !3023

for.body133:                                      ; preds = %for.cond130
  %arrayidx134 = getelementptr inbounds nuw [160 x i8], ptr %temp, i32 0, i32 %j129.0, !dbg !3024
  %6 = load i8, ptr %arrayidx134, align 1, !dbg !3024
  %mul135 = mul nsw i32 %i120.0, %ncols, !dbg !3026
  %7 = getelementptr i8, ptr %A, i32 %mul135, !dbg !3027
  %arrayidx137 = getelementptr i8, ptr %7, i32 %j129.0, !dbg !3027
  store i8 %6, ptr %arrayidx137, align 1, !dbg !3028
  %inc139 = add nuw i32 %j129.0, 1, !dbg !3029
    #dbg_value(i32 %inc139, !3016, !DIExpression(), !3018)
  br label %for.cond130, !dbg !3030, !llvm.loop !3031

for.inc141:                                       ; preds = %for.cond130
  %inc142 = add nuw i32 %i120.0, 1, !dbg !3033
    #dbg_value(i32 %inc142, !3007, !DIExpression(), !3008)
  br label %for.cond121, !dbg !3034, !llvm.loop !3035

for.end143:                                       ; preds = %for.cond121
  call void @mayo_secure_clear(ptr noundef nonnull %temp, i32 noundef 160) #8, !dbg !3037
  call void @mayo_secure_clear(ptr noundef nonnull %_pivot_row, i32 noundef 80) #8, !dbg !3038
  call void @mayo_secure_clear(ptr noundef nonnull %_pivot_row2, i32 noundef 80) #8, !dbg !3039
  call void @mayo_secure_clear(ptr noundef nonnull %packed_A, i32 noundef 11360) #8, !dbg !3040
  ret void, !dbg !3041
}

; Function Attrs: nounwind
define internal fastcc zeroext i8 @ct_compare_8(i8 noundef zeroext %a, i8 noundef zeroext %b) unnamed_addr #0 !dbg !3042 {
entry:
    #dbg_value(i8 %a, !3044, !DIExpression(), !3045)
    #dbg_value(i8 %b, !3046, !DIExpression(), !3045)
  %0 = icmp ne i8 %a, %b, !dbg !3047
  %conv3 = sext i1 %0 to i8, !dbg !3048
  %1 = load volatile i8, ptr @pqmayo_MAYO_5_ref_unsigned_char_blocker, align 1, !dbg !3049
  %xor5 = xor i8 %1, %conv3, !dbg !3050
  ret i8 %xor5, !dbg !3051
}

; Function Attrs: nounwind
define internal fastcc range(i64 0, 1085102592571150096) i64 @mul_fx8(i8 noundef zeroext %a, i64 noundef %b) unnamed_addr #0 !dbg !3052 {
entry:
    #dbg_value(i8 %a, !3055, !DIExpression(), !3056)
    #dbg_value(i64 %b, !3057, !DIExpression(), !3056)
  %0 = and i8 %a, 1, !dbg !3058
  %conv1 = zext nneg i8 %0 to i64, !dbg !3059
  %mul = mul nuw nsw i64 %b, %conv1, !dbg !3060
    #dbg_value(i64 %mul, !3061, !DIExpression(), !3056)
  %1 = and i8 %a, 2, !dbg !3062
  %conv4 = zext nneg i8 %1 to i64, !dbg !3063
  %mul5 = mul i64 %b, %conv4, !dbg !3064
  %xor = xor i64 %mul, %mul5, !dbg !3065
    #dbg_value(i64 %xor, !3061, !DIExpression(), !3056)
  %2 = and i8 %a, 4, !dbg !3066
  %conv8 = zext nneg i8 %2 to i64, !dbg !3067
  %mul9 = mul i64 %b, %conv8, !dbg !3068
  %xor10 = xor i64 %xor, %mul9, !dbg !3069
    #dbg_value(i64 %xor10, !3061, !DIExpression(), !3056)
  %3 = and i8 %a, 8, !dbg !3070
  %conv13 = zext nneg i8 %3 to i64, !dbg !3071
  %mul14 = mul i64 %b, %conv13, !dbg !3072
  %xor15 = xor i64 %xor10, %mul14, !dbg !3073
    #dbg_value(i64 %xor15, !3061, !DIExpression(), !3056)
    #dbg_value(i64 %xor15, !3074, !DIExpression(DW_OP_constu, 17361641481138401520, DW_OP_and, DW_OP_stack_value), !3056)
  %shr = lshr i64 %xor15, 4, !dbg !3075
  %and16 = lshr i64 %xor15, 3, !dbg !3076
  %shr18 = and i64 %and16, 1012762419733073422, !dbg !3076
  %4 = xor i64 %shr, %shr18, !dbg !3077
  %xor19 = xor i64 %4, %xor15, !dbg !3077
  %and20 = and i64 %xor19, 1085102592571150095, !dbg !3078
    #dbg_value(i64 %and20, !3079, !DIExpression(), !3056)
  ret i64 %and20, !dbg !3080
}

; Function Attrs: nounwind
define internal fastcc void @ef_pack_m_vec(ptr noundef %in, ptr noundef %out, i32 noundef %ncols) unnamed_addr #0 !dbg !3081 {
entry:
    #dbg_value(ptr %in, !3084, !DIExpression(), !3085)
    #dbg_value(ptr %out, !3086, !DIExpression(), !3085)
    #dbg_value(i32 %ncols, !3087, !DIExpression(), !3085)
    #dbg_value(ptr %out, !3088, !DIExpression(), !3085)
    #dbg_value(i32 0, !3089, !DIExpression(), !3085)
  br label %for.cond, !dbg !3090

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %add8, %for.body ], !dbg !3092
    #dbg_value(i32 %i.0, !3089, !DIExpression(), !3085)
  %add = or disjoint i32 %i.0, 1, !dbg !3093
  %cmp = icmp slt i32 %add, %ncols, !dbg !3095
  br i1 %cmp, label %for.body, label %for.end, !dbg !3096

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %in, i32 %i.0, !dbg !3097
  %0 = load i8, ptr %arrayidx, align 1, !dbg !3097
  %add2 = or disjoint i32 %i.0, 1, !dbg !3099
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %in, i32 %add2, !dbg !3100
  %1 = load i8, ptr %arrayidx3, align 1, !dbg !3100
  %shl5 = shl i8 %1, 4, !dbg !3101
  %or = or i8 %shl5, %0, !dbg !3102
  %div = lshr exact i32 %i.0, 1, !dbg !3103
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %out, i32 %div, !dbg !3104
  store i8 %or, ptr %arrayidx7, align 1, !dbg !3105
  %add8 = add nuw nsw i32 %i.0, 2, !dbg !3106
    #dbg_value(i32 %add8, !3089, !DIExpression(), !3085)
  br label %for.cond, !dbg !3107, !llvm.loop !3108

for.end:                                          ; preds = %for.cond
  %2 = and i32 %ncols, -2147483647, !dbg !3110
  %cmp9 = icmp eq i32 %2, 1, !dbg !3110
  br i1 %cmp9, label %if.then, label %if.end, !dbg !3110

if.then:                                          ; preds = %for.end
  %arrayidx12 = getelementptr inbounds nuw i8, ptr %in, i32 %i.0, !dbg !3112
  %3 = load i8, ptr %arrayidx12, align 1, !dbg !3112
  %div16 = lshr exact i32 %i.0, 1, !dbg !3114
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %out, i32 %div16, !dbg !3115
  store i8 %3, ptr %arrayidx17, align 1, !dbg !3116
  br label %if.end, !dbg !3117

if.end:                                           ; preds = %if.then, %for.end
  ret void, !dbg !3118
}

; Function Attrs: nounwind
define internal fastcc i64 @ct_compare_64(i32 noundef %a, i32 noundef %b) unnamed_addr #0 !dbg !3119 {
entry:
    #dbg_value(i32 %a, !3122, !DIExpression(), !3123)
    #dbg_value(i32 %b, !3124, !DIExpression(), !3123)
  %xor = xor i32 %a, %b, !dbg !3125
  %0 = icmp sgt i32 %xor, 0, !dbg !3126
  %shr = sext i1 %0 to i64, !dbg !3126
  %1 = load volatile i64, ptr @pqmayo_MAYO_5_ref_uint64_t_blocker, align 8, !dbg !3127
  %xor1 = xor i64 %1, %shr, !dbg !3128
  ret i64 %xor1, !dbg !3129
}

; Function Attrs: nounwind
define internal fastcc i64 @ct_64_is_greater_than(i32 noundef %a, i32 noundef %b) unnamed_addr #0 !dbg !3130 {
entry:
    #dbg_value(i32 %a, !3131, !DIExpression(), !3132)
    #dbg_value(i32 %b, !3133, !DIExpression(), !3132)
    #dbg_value(!DIArgList(i32 %b, i32 %a), !3134, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_LLVM_convert, 64, DW_ATE_signed, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_LLVM_convert, 64, DW_ATE_signed, DW_OP_minus, DW_OP_stack_value), !3132)
  %0 = icmp slt i32 %b, %a, !dbg !3135
  %shr = sext i1 %0 to i64, !dbg !3135
  %1 = load volatile i64, ptr @pqmayo_MAYO_5_ref_uint64_t_blocker, align 8, !dbg !3136
  %xor = xor i64 %1, %shr, !dbg !3137
  ret i64 %xor, !dbg !3138
}

; Function Attrs: nounwind
define internal fastcc zeroext range(i8 0, 16) i8 @m_extract_element(ptr noundef %in, i32 noundef %index) unnamed_addr #0 !dbg !3139 {
entry:
    #dbg_value(ptr %in, !3142, !DIExpression(), !3143)
    #dbg_value(i32 %index, !3144, !DIExpression(), !3143)
  %div = sdiv i32 %index, 16, !dbg !3145
    #dbg_value(i32 %div, !3146, !DIExpression(), !3143)
  %rem = srem i32 %index, 16, !dbg !3147
    #dbg_value(i32 %rem, !3148, !DIExpression(), !3143)
  %arrayidx = getelementptr inbounds i64, ptr %in, i32 %div, !dbg !3149
  %0 = load i64, ptr %arrayidx, align 8, !dbg !3149
  %mul = shl nsw i32 %rem, 2, !dbg !3150
  %sh_prom = zext nneg i32 %mul to i64, !dbg !3151
  %shr = lshr i64 %0, %sh_prom, !dbg !3151
  %1 = trunc i64 %shr to i8, !dbg !3152
  %conv = and i8 %1, 15, !dbg !3152
  ret i8 %conv, !dbg !3153
}

; Function Attrs: nounwind
define internal fastcc zeroext range(i8 0, 16) i8 @inverse_f(i8 noundef zeroext %a) unnamed_addr #0 !dbg !3154 {
entry:
    #dbg_value(i8 %a, !3157, !DIExpression(), !3158)
  %call = call fastcc zeroext i8 @mul_f.23(i8 noundef zeroext %a, i8 noundef zeroext %a) #6, !dbg !3159
    #dbg_value(i8 %call, !3160, !DIExpression(), !3158)
  %call1 = call fastcc zeroext i8 @mul_f.23(i8 noundef zeroext %call, i8 noundef zeroext %call) #6, !dbg !3161
    #dbg_value(i8 %call1, !3162, !DIExpression(), !3158)
  %call2 = call fastcc zeroext i8 @mul_f.23(i8 noundef zeroext %call1, i8 noundef zeroext %call1) #6, !dbg !3163
    #dbg_value(i8 %call2, !3164, !DIExpression(), !3158)
  %call3 = call fastcc zeroext i8 @mul_f.23(i8 noundef zeroext %call, i8 noundef zeroext %call1) #6, !dbg !3165
    #dbg_value(i8 %call3, !3166, !DIExpression(), !3158)
  %call4 = call fastcc zeroext i8 @mul_f.23(i8 noundef zeroext %call2, i8 noundef zeroext %call3) #6, !dbg !3167
    #dbg_value(i8 %call4, !3168, !DIExpression(), !3158)
  ret i8 %call4, !dbg !3169
}

; Function Attrs: nounwind
define internal fastcc void @vec_mul_add_u64(i32 noundef %legs, ptr noundef %in, i8 noundef zeroext %a, ptr noundef %acc) unnamed_addr #0 !dbg !3170 {
entry:
    #dbg_value(i32 %legs, !3173, !DIExpression(), !3174)
    #dbg_value(ptr %in, !3175, !DIExpression(), !3174)
    #dbg_value(i8 %a, !3176, !DIExpression(), !3174)
    #dbg_value(ptr %acc, !3177, !DIExpression(), !3174)
  %call = call fastcc i32 @mul_table.22(i8 noundef zeroext %a) #6, !dbg !3178
    #dbg_value(i32 %call, !3179, !DIExpression(), !3174)
    #dbg_value(i64 1229782938247303441, !3180, !DIExpression(), !3174)
    #dbg_value(i32 0, !3181, !DIExpression(), !3183)
  %smax = call i32 @llvm.smax.i32(i32 %legs, i32 0), !dbg !3184
  br label %for.cond, !dbg !3184

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !3185
    #dbg_value(i32 %i.0, !3181, !DIExpression(), !3183)
  %exitcond.not = icmp eq i32 %i.0, %smax, !dbg !3186
  br i1 %exitcond.not, label %for.end, label %for.body, !dbg !3188

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %in, i32 %i.0, !dbg !3189
  %0 = load i64, ptr %arrayidx, align 8, !dbg !3189
  %and = and i64 %0, 1229782938247303441, !dbg !3191
  %and1 = and i32 %call, 255, !dbg !3192
  %conv = zext nneg i32 %and1 to i64, !dbg !3193
  %mul = mul i64 %and, %conv, !dbg !3194
  %shr = lshr i64 %0, 1, !dbg !3195
  %and3 = and i64 %shr, 1229782938247303441, !dbg !3196
  %shr4 = lshr i32 %call, 8, !dbg !3197
  %and5 = and i32 %shr4, 15, !dbg !3198
  %conv6 = zext nneg i32 %and5 to i64, !dbg !3199
  %mul7 = mul nuw i64 %and3, %conv6, !dbg !3200
  %xor = xor i64 %mul, %mul7, !dbg !3201
  %arrayidx8 = getelementptr inbounds nuw i64, ptr %in, i32 %i.0, !dbg !3202
  %1 = load i64, ptr %arrayidx8, align 8, !dbg !3202
  %shr9 = lshr i64 %1, 2, !dbg !3203
  %and10 = and i64 %shr9, 1229782938247303441, !dbg !3204
  %shr11 = lshr i32 %call, 16, !dbg !3205
  %and12 = and i32 %shr11, 15, !dbg !3206
  %conv13 = zext nneg i32 %and12 to i64, !dbg !3207
  %mul14 = mul nuw i64 %and10, %conv13, !dbg !3208
  %xor15 = xor i64 %xor, %mul14, !dbg !3209
  %arrayidx16 = getelementptr inbounds nuw i64, ptr %in, i32 %i.0, !dbg !3210
  %2 = load i64, ptr %arrayidx16, align 8, !dbg !3210
  %shr17 = lshr i64 %2, 3, !dbg !3211
  %and18 = and i64 %shr17, 1229782938247303441, !dbg !3212
  %shr19 = lshr i32 %call, 24, !dbg !3213
  %and20 = and i32 %shr19, 15, !dbg !3214
  %conv21 = zext nneg i32 %and20 to i64, !dbg !3215
  %mul22 = mul nuw i64 %and18, %conv21, !dbg !3216
  %xor23 = xor i64 %xor15, %mul22, !dbg !3217
  %arrayidx24 = getelementptr inbounds nuw i64, ptr %acc, i32 %i.0, !dbg !3218
  %3 = load i64, ptr %arrayidx24, align 8, !dbg !3219
  %xor25 = xor i64 %3, %xor23, !dbg !3219
  store i64 %xor25, ptr %arrayidx24, align 8, !dbg !3219
  %inc = add nuw i32 %i.0, 1, !dbg !3220
    #dbg_value(i32 %inc, !3181, !DIExpression(), !3183)
  br label %for.cond, !dbg !3221, !llvm.loop !3222

for.end:                                          ; preds = %for.cond
  ret void, !dbg !3224
}

; Function Attrs: nounwind
define internal fastcc void @ef_unpack_m_vec(i32 noundef %legs, ptr noundef %in, ptr noundef %out) unnamed_addr #0 !dbg !3225 {
entry:
    #dbg_value(i32 %legs, !3228, !DIExpression(), !3229)
    #dbg_value(ptr %in, !3230, !DIExpression(), !3229)
    #dbg_value(ptr %out, !3231, !DIExpression(), !3229)
    #dbg_value(ptr %in, !3232, !DIExpression(), !3229)
    #dbg_value(i32 0, !3233, !DIExpression(), !3235)
  br label %for.cond, !dbg !3236

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %add8, %for.body ], !dbg !3237
    #dbg_value(i32 %i.0, !3233, !DIExpression(), !3235)
  %mul = shl nsw i32 %legs, 4, !dbg !3238
  %cmp = icmp slt i32 %i.0, %mul, !dbg !3240
  br i1 %cmp, label %for.body, label %for.end, !dbg !3241

for.body:                                         ; preds = %for.cond
  %div = lshr exact i32 %i.0, 1, !dbg !3242
  %arrayidx = getelementptr inbounds nuw i8, ptr %in, i32 %div, !dbg !3244
  %0 = load i8, ptr %arrayidx, align 1, !dbg !3244
  %1 = and i8 %0, 15, !dbg !3245
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %out, i32 %i.0, !dbg !3246
  store i8 %1, ptr %arrayidx2, align 1, !dbg !3247
  %div3 = lshr exact i32 %i.0, 1, !dbg !3248
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %in, i32 %div3, !dbg !3249
  %2 = load i8, ptr %arrayidx4, align 1, !dbg !3249
  %3 = lshr i8 %2, 4, !dbg !3250
  %add = or disjoint i32 %i.0, 1, !dbg !3251
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %out, i32 %add, !dbg !3252
  store i8 %3, ptr %arrayidx7, align 1, !dbg !3253
  %add8 = add nuw nsw i32 %i.0, 2, !dbg !3254
    #dbg_value(i32 %add8, !3233, !DIExpression(), !3235)
  br label %for.cond, !dbg !3255, !llvm.loop !3256

for.end:                                          ; preds = %for.cond
  ret void, !dbg !3258
}

; Function Attrs: nounwind
define internal fastcc i32 @mul_table.22(i8 noundef zeroext %b) unnamed_addr #0 !dbg !3259 {
entry:
    #dbg_value(i8 %b, !3260, !DIExpression(), !3261)
  %conv = zext i8 %b to i32, !dbg !3262
  %mul = mul i32 %conv, 134480385, !dbg !3263
    #dbg_value(i32 %mul, !3264, !DIExpression(), !3261)
    #dbg_value(i32 -252645136, !3265, !DIExpression(), !3261)
  %and = and i32 %mul, -252645136, !dbg !3266
    #dbg_value(i32 %and, !3267, !DIExpression(), !3261)
  %shr = lshr exact i32 %and, 4, !dbg !3268
  %shr1 = lshr exact i32 %and, 3, !dbg !3269
  %0 = xor i32 %shr, %shr1, !dbg !3270
  %xor2 = xor i32 %0, %mul, !dbg !3270
  ret i32 %xor2, !dbg !3271
}

; Function Attrs: nounwind
define internal fastcc zeroext range(i8 0, 16) i8 @mul_f.23(i8 noundef zeroext %a, i8 noundef zeroext %b) unnamed_addr #0 !dbg !3272 {
entry:
    #dbg_value(i8 %a, !3273, !DIExpression(), !3274)
    #dbg_value(i8 %b, !3275, !DIExpression(), !3274)
  %0 = load volatile i8, ptr @pqmayo_MAYO_5_ref_unsigned_char_blocker, align 1, !dbg !3276
  %xor1 = xor i8 %a, %0, !dbg !3277
    #dbg_value(i8 %xor1, !3273, !DIExpression(), !3274)
  %1 = trunc i8 %xor1 to i1, !dbg !3278
    #dbg_value(i8 poison, !3279, !DIExpression(), !3274)
  %2 = and i8 %xor1, 2, !dbg !3280
  %mul9 = mul i8 %2, %b, !dbg !3281
  %conv10 = select i1 %1, i8 %b, i8 0, !dbg !3278
  %xor11 = xor i8 %conv10, %mul9, !dbg !3282
    #dbg_value(i8 %xor11, !3279, !DIExpression(), !3274)
  %3 = and i8 %xor1, 4, !dbg !3283
  %mul16 = mul i8 %3, %b, !dbg !3284
  %xor18 = xor i8 %mul16, %xor11, !dbg !3285
    #dbg_value(i8 %xor18, !3279, !DIExpression(), !3274)
  %4 = and i8 %xor1, 8, !dbg !3286
  %mul23 = mul i8 %4, %b, !dbg !3287
  %xor25 = xor i8 %mul23, %xor18, !dbg !3288
    #dbg_value(i8 %xor25, !3279, !DIExpression(), !3274)
    #dbg_value(i8 %xor25, !3289, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !3274)
  %5 = lshr i8 %xor25, 4, !dbg !3290
  %6 = lshr i8 %xor25, 3, !dbg !3291
  %7 = and i8 %6, 14, !dbg !3291
  %8 = xor i8 %5, %7, !dbg !3292
  %xor25.masked = and i8 %xor25, 15, !dbg !3293
  %9 = xor i8 %8, %xor25.masked, !dbg !3293
    #dbg_value(i8 %9, !3294, !DIExpression(), !3274)
  ret i8 %9, !dbg !3295
}

; Function Attrs: nounwind
define internal fastcc zeroext i8 @lincomb.24(ptr noundef %a, ptr noundef %b, i32 noundef %n, i32 noundef %m) unnamed_addr #0 !dbg !3296 {
entry:
    #dbg_value(ptr %a, !3297, !DIExpression(), !3298)
    #dbg_value(ptr %b, !3299, !DIExpression(), !3298)
    #dbg_value(i32 %n, !3300, !DIExpression(), !3298)
    #dbg_value(i32 %m, !3301, !DIExpression(), !3298)
    #dbg_value(i8 0, !3302, !DIExpression(), !3298)
    #dbg_value(i32 0, !3303, !DIExpression(), !3305)
  %smax = call i32 @llvm.smax.i32(i32 %n, i32 0), !dbg !3306
  br label %for.cond, !dbg !3306

for.cond:                                         ; preds = %for.body, %entry
  %ret.0 = phi i8 [ 0, %entry ], [ %call1, %for.body ], !dbg !3298
  %b.addr.0 = phi ptr [ %b, %entry ], [ %add.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !3307
    #dbg_value(i32 %i.0, !3303, !DIExpression(), !3305)
    #dbg_value(ptr %b.addr.0, !3299, !DIExpression(), !3298)
    #dbg_value(i8 %ret.0, !3302, !DIExpression(), !3298)
  %exitcond.not = icmp eq i32 %i.0, %smax, !dbg !3308
  br i1 %exitcond.not, label %for.end, label %for.body, !dbg !3310

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %i.0, !dbg !3311
  %0 = load i8, ptr %arrayidx, align 1, !dbg !3311
  %1 = load i8, ptr %b.addr.0, align 1, !dbg !3313
  %call = call fastcc zeroext i8 @mul_f.23(i8 noundef zeroext %0, i8 noundef zeroext %1) #6, !dbg !3314
  %call1 = call fastcc zeroext i8 @add_f.25(i8 noundef zeroext %call, i8 noundef zeroext %ret.0) #6, !dbg !3315
    #dbg_value(i8 %call1, !3302, !DIExpression(), !3298)
  %inc = add nuw i32 %i.0, 1, !dbg !3316
    #dbg_value(i32 %inc, !3303, !DIExpression(), !3305)
  %add.ptr = getelementptr inbounds i8, ptr %b.addr.0, i32 %m, !dbg !3317
    #dbg_value(ptr %add.ptr, !3299, !DIExpression(), !3298)
  br label %for.cond, !dbg !3318, !llvm.loop !3319

for.end:                                          ; preds = %for.cond
  ret i8 %ret.0, !dbg !3321
}

; Function Attrs: nounwind
define internal fastcc zeroext i8 @add_f.25(i8 noundef zeroext %a, i8 noundef zeroext %b) unnamed_addr #0 !dbg !3322 {
entry:
    #dbg_value(i8 %a, !3323, !DIExpression(), !3324)
    #dbg_value(i8 %b, !3325, !DIExpression(), !3324)
  %xor1 = xor i8 %a, %b, !dbg !3326
  ret i8 %xor1, !dbg !3327
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
!167 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sk_t", file: !79, line: 291, size: 6843264, elements: !168)
!168 = !{!169, !173}
!169 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !167, file: !79, line: 292, baseType: !170, size: 6829632)
!170 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 6829632, elements: !171)
!171 = !{!172}
!172 = !DISubrange(count: 106713)
!173 = !DIDerivedType(tag: DW_TAG_member, name: "O", scope: !167, file: !79, line: 293, baseType: !174, size: 13632, offset: 6829632)
!174 = !DICompositeType(tag: DW_TAG_array_type, baseType: !175, size: 13632, elements: !177)
!175 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !54, line: 24, baseType: !176)
!176 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !56, line: 43, baseType: !51)
!177 = !{!178}
!178 = !DISubrange(count: 1704)
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
!261 = distinct !DISubprogram(name: "pqmayo_MAYO_5_ref_mayo_keypair", scope: !68, file: !68, line: 298, type: !262, scopeLine: 298, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
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
!301 = distinct !DISubprogram(name: "pqmayo_MAYO_5_ref_mayo_keypair_compact", scope: !68, file: !68, line: 538, type: !262, scopeLine: 539, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!302 = !DILocalVariable(name: "p", arg: 1, scope: !301, file: !68, line: 538, type: !264)
!303 = !DILocation(line: 0, scope: !301)
!304 = !DILocalVariable(name: "cpk", arg: 2, scope: !301, file: !68, line: 538, type: !61)
!305 = !DILocalVariable(name: "csk", arg: 3, scope: !301, file: !68, line: 539, type: !61)
!306 = !DILocalVariable(name: "ret", scope: !301, file: !68, line: 540, type: !86)
!307 = !DILocalVariable(name: "seed_sk", scope: !301, file: !68, line: 541, type: !61)
!308 = !DILocalVariable(name: "S", scope: !301, file: !68, line: 542, type: !309)
!309 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 6944, elements: !310)
!310 = !{!311}
!311 = !DISubrange(count: 868)
!312 = !DILocation(line: 542, column: 19, scope: !301)
!313 = !DILocalVariable(name: "P", scope: !301, file: !68, line: 543, type: !170)
!314 = !DILocation(line: 543, column: 14, scope: !301)
!315 = !DILocalVariable(name: "P3", scope: !301, file: !68, line: 544, type: !316)
!316 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 82944, elements: !317)
!317 = !{!318}
!318 = !DISubrange(count: 1296)
!319 = !DILocation(line: 544, column: 14, scope: !301)
!320 = !DILocalVariable(name: "O", scope: !301, file: !68, line: 547, type: !321)
!321 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 13632, elements: !177)
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
!347 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 44928, elements: !348)
!348 = !{!349}
!349 = !DISubrange(count: 702)
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
!543 = !DILocation(line: 37, column: 9, scope: !541)
!544 = !DILocation(line: 37, scope: !541)
!545 = !DILocation(line: 38, column: 21, scope: !546)
!546 = distinct !DILexicalBlock(scope: !547, file: !529, line: 37, column: 43)
!547 = distinct !DILexicalBlock(scope: !541, file: !529, line: 37, column: 5)
!548 = !DILocation(line: 38, column: 33, scope: !546)
!549 = !DILocation(line: 38, column: 51, scope: !546)
!550 = !DILocation(line: 38, column: 46, scope: !546)
!551 = !DILocation(line: 38, column: 44, scope: !546)
!552 = !DILocation(line: 39, column: 27, scope: !546)
!553 = !DILocation(line: 39, column: 33, scope: !546)
!554 = !DILocation(line: 39, column: 52, scope: !546)
!555 = !DILocation(line: 39, column: 59, scope: !546)
!556 = !DILocation(line: 39, column: 46, scope: !546)
!557 = !DILocation(line: 39, column: 44, scope: !546)
!558 = !DILocation(line: 39, column: 17, scope: !546)
!559 = !DILocation(line: 40, column: 27, scope: !546)
!560 = !DILocation(line: 40, column: 33, scope: !546)
!561 = !DILocation(line: 40, column: 52, scope: !546)
!562 = !DILocation(line: 40, column: 59, scope: !546)
!563 = !DILocation(line: 40, column: 46, scope: !546)
!564 = !DILocation(line: 40, column: 44, scope: !546)
!565 = !DILocation(line: 40, column: 17, scope: !546)
!566 = !DILocation(line: 41, column: 27, scope: !546)
!567 = !DILocation(line: 41, column: 33, scope: !546)
!568 = !DILocation(line: 41, column: 52, scope: !546)
!569 = !DILocation(line: 41, column: 59, scope: !546)
!570 = !DILocation(line: 41, column: 46, scope: !546)
!571 = !DILocation(line: 41, column: 44, scope: !546)
!572 = !DILocation(line: 41, column: 17, scope: !546)
!573 = !DILocation(line: 38, column: 9, scope: !546)
!574 = !DILocation(line: 38, column: 16, scope: !546)
!575 = !DILocation(line: 37, column: 20, scope: !547)
!576 = !DILocation(line: 37, column: 5, scope: !541)
!577 = !DILocation(line: 37, column: 40, scope: !547)
!578 = !DILocation(line: 37, column: 5, scope: !547)
!579 = distinct !{!579, !576, !580, !388}
!580 = !DILocation(line: 42, column: 5, scope: !541)
!581 = !DILocation(line: 43, column: 1, scope: !528)
!582 = distinct !DISubprogram(name: "mul_table", scope: !583, file: !583, line: 130, type: !584, scopeLine: 130, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!583 = !DIFile(filename: "../../../src/simple_arithmetic.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!584 = !DISubroutineType(types: !585)
!585 = !{!62, !175}
!586 = !DILocalVariable(name: "b", arg: 1, scope: !582, file: !583, line: 130, type: !175)
!587 = !DILocation(line: 0, scope: !582)
!588 = !DILocation(line: 131, column: 19, scope: !582)
!589 = !DILocation(line: 131, column: 33, scope: !582)
!590 = !DILocalVariable(name: "x", scope: !582, file: !583, line: 131, type: !62)
!591 = !DILocalVariable(name: "high_nibble_mask", scope: !582, file: !583, line: 133, type: !62)
!592 = !DILocation(line: 135, column: 28, scope: !582)
!593 = !DILocalVariable(name: "high_half", scope: !582, file: !583, line: 135, type: !62)
!594 = !DILocation(line: 136, column: 28, scope: !582)
!595 = !DILocation(line: 136, column: 47, scope: !582)
!596 = !DILocation(line: 136, column: 34, scope: !582)
!597 = !DILocation(line: 136, column: 5, scope: !582)
!598 = distinct !DISubprogram(name: "mul_add_m_upper_triangular_mat_x_mat", scope: !408, file: !408, line: 16, type: !599, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!599 = !DISubroutineType(types: !600)
!600 = !{null, !324, !411, !90, !52, !324, !324, !324, !324}
!601 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !598, file: !408, line: 16, type: !324)
!602 = !DILocation(line: 0, scope: !598)
!603 = !DILocalVariable(name: "bs_mat", arg: 2, scope: !598, file: !408, line: 16, type: !411)
!604 = !DILocalVariable(name: "mat", arg: 3, scope: !598, file: !408, line: 16, type: !90)
!605 = !DILocalVariable(name: "acc", arg: 4, scope: !598, file: !408, line: 16, type: !52)
!606 = !DILocalVariable(name: "bs_mat_rows", arg: 5, scope: !598, file: !408, line: 17, type: !324)
!607 = !DILocalVariable(name: "bs_mat_cols", arg: 6, scope: !598, file: !408, line: 17, type: !324)
!608 = !DILocalVariable(name: "mat_cols", arg: 7, scope: !598, file: !408, line: 17, type: !324)
!609 = !DILocalVariable(name: "triangular", arg: 8, scope: !598, file: !408, line: 17, type: !324)
!610 = !DILocalVariable(name: "bs_mat_entries_used", scope: !598, file: !408, line: 19, type: !86)
!611 = !DILocalVariable(name: "r", scope: !612, file: !408, line: 20, type: !86)
!612 = distinct !DILexicalBlock(scope: !598, file: !408, line: 20, column: 5)
!613 = !DILocation(line: 0, scope: !612)
!614 = !DILocation(line: 20, column: 10, scope: !612)
!615 = !DILocation(line: 19, column: 9, scope: !598)
!616 = !DILocation(line: 20, scope: !612)
!617 = !DILocation(line: 20, column: 23, scope: !618)
!618 = distinct !DILexicalBlock(scope: !612, file: !408, line: 20, column: 5)
!619 = !DILocation(line: 20, column: 5, scope: !612)
!620 = !DILocation(line: 21, column: 33, scope: !621)
!621 = distinct !DILexicalBlock(scope: !622, file: !408, line: 21, column: 9)
!622 = distinct !DILexicalBlock(scope: !618, file: !408, line: 20, column: 43)
!623 = !DILocalVariable(name: "c", scope: !621, file: !408, line: 21, type: !86)
!624 = !DILocation(line: 0, scope: !621)
!625 = !DILocation(line: 21, column: 14, scope: !621)
!626 = !DILocation(line: 21, scope: !621)
!627 = !DILocation(line: 21, column: 40, scope: !628)
!628 = distinct !DILexicalBlock(scope: !621, file: !408, line: 21, column: 9)
!629 = !DILocation(line: 21, column: 9, scope: !621)
!630 = !DILocation(line: 22, scope: !631)
!631 = distinct !DILexicalBlock(scope: !632, file: !408, line: 22, column: 13)
!632 = distinct !DILexicalBlock(scope: !628, file: !408, line: 21, column: 60)
!633 = !DILocalVariable(name: "k", scope: !631, file: !408, line: 22, type: !86)
!634 = !DILocation(line: 0, scope: !631)
!635 = !DILocation(line: 22, column: 31, scope: !636)
!636 = distinct !DILexicalBlock(scope: !631, file: !408, line: 22, column: 13)
!637 = !DILocation(line: 22, column: 13, scope: !631)
!638 = !DILocation(line: 23, column: 65, scope: !639)
!639 = distinct !DILexicalBlock(scope: !636, file: !408, line: 22, column: 51)
!640 = !DILocation(line: 23, column: 51, scope: !639)
!641 = !DILocation(line: 23, column: 94, scope: !639)
!642 = !DILocation(line: 23, column: 88, scope: !639)
!643 = !DILocation(line: 23, column: 134, scope: !639)
!644 = !DILocation(line: 23, column: 145, scope: !639)
!645 = !DILocation(line: 23, column: 129, scope: !639)
!646 = !DILocation(line: 23, column: 115, scope: !639)
!647 = !DILocation(line: 23, column: 17, scope: !639)
!648 = !DILocation(line: 22, column: 45, scope: !636)
!649 = !DILocation(line: 22, column: 13, scope: !636)
!650 = distinct !{!650, !637, !651, !388}
!651 = !DILocation(line: 24, column: 13, scope: !631)
!652 = !DILocation(line: 25, column: 33, scope: !632)
!653 = !DILocation(line: 21, column: 56, scope: !628)
!654 = !DILocation(line: 21, column: 9, scope: !628)
!655 = distinct !{!655, !629, !656, !388}
!656 = !DILocation(line: 26, column: 9, scope: !621)
!657 = !DILocation(line: 20, column: 39, scope: !618)
!658 = !DILocation(line: 20, column: 5, scope: !618)
!659 = distinct !{!659, !619, !660, !388}
!660 = !DILocation(line: 27, column: 5, scope: !612)
!661 = !DILocation(line: 28, column: 1, scope: !598)
!662 = distinct !DISubprogram(name: "unpack_m_vecs", scope: !68, file: !68, line: 262, type: !663, scopeLine: 262, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!663 = !DISubroutineType(types: !664)
!664 = !{null, !90, !52, !86, !86}
!665 = !DILocalVariable(name: "in", arg: 1, scope: !662, file: !68, line: 262, type: !90)
!666 = !DILocation(line: 0, scope: !662)
!667 = !DILocalVariable(name: "out", arg: 2, scope: !662, file: !68, line: 262, type: !52)
!668 = !DILocalVariable(name: "vecs", arg: 3, scope: !662, file: !68, line: 262, type: !86)
!669 = !DILocalVariable(name: "m", arg: 4, scope: !662, file: !68, line: 262, type: !86)
!670 = !DILocation(line: 263, column: 32, scope: !662)
!671 = !DILocation(line: 263, column: 38, scope: !662)
!672 = !DILocalVariable(name: "m_vec_limbs", scope: !662, file: !68, line: 263, type: !324)
!673 = !DILocalVariable(name: "_out", scope: !662, file: !68, line: 264, type: !61)
!674 = !DILocalVariable(name: "tmp", scope: !662, file: !68, line: 265, type: !675)
!675 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 576, elements: !676)
!676 = !{!677}
!677 = !DISubrange(count: 9)
!678 = !DILocation(line: 265, column: 14, scope: !662)
!679 = !DILocalVariable(name: "i", scope: !680, file: !68, line: 266, type: !86)
!680 = distinct !DILexicalBlock(scope: !662, file: !68, line: 266, column: 5)
!681 = !DILocation(line: 0, scope: !680)
!682 = !DILocation(line: 266, column: 10, scope: !680)
!683 = !DILocation(line: 266, column: 28, scope: !684)
!684 = distinct !DILexicalBlock(scope: !680, file: !68, line: 266, column: 5)
!685 = !DILocation(line: 266, column: 5, scope: !680)
!686 = !DILocation(line: 266, scope: !680)
!687 = !DILocation(line: 268, column: 27, scope: !688)
!688 = distinct !DILexicalBlock(scope: !684, file: !68, line: 267, column: 5)
!689 = !DILocation(line: 268, column: 29, scope: !688)
!690 = !DILocation(line: 268, column: 24, scope: !688)
!691 = !DILocation(line: 268, column: 34, scope: !688)
!692 = !DILocation(line: 268, column: 9, scope: !688)
!693 = !DILocation(line: 269, column: 24, scope: !688)
!694 = !DILocation(line: 269, column: 36, scope: !688)
!695 = !DILocation(line: 269, column: 21, scope: !688)
!696 = !DILocation(line: 269, column: 71, scope: !688)
!697 = !DILocation(line: 269, column: 9, scope: !688)
!698 = !DILocation(line: 266, column: 5, scope: !684)
!699 = distinct !{!699, !685, !700, !388}
!700 = !DILocation(line: 270, column: 5, scope: !680)
!701 = !DILocation(line: 271, column: 1, scope: !662)
!702 = distinct !DISubprogram(name: "pqmayo_MAYO_5_ref_mayo_expand_sk", scope: !68, file: !68, line: 310, type: !703, scopeLine: 311, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!703 = !DISubroutineType(types: !704)
!704 = !{!86, !264, !90, !705}
!705 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !706, size: 32)
!706 = !DIDerivedType(tag: DW_TAG_typedef, name: "sk_t", file: !79, line: 294, baseType: !707)
!707 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sk_t", file: !79, line: 291, size: 6843264, elements: !708)
!708 = !{!709, !710}
!709 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !707, file: !79, line: 292, baseType: !170, size: 6829632)
!710 = !DIDerivedType(tag: DW_TAG_member, name: "O", scope: !707, file: !79, line: 293, baseType: !174, size: 13632, offset: 6829632)
!711 = !DILocalVariable(name: "p", arg: 1, scope: !702, file: !68, line: 310, type: !264)
!712 = !DILocation(line: 0, scope: !702)
!713 = !DILocalVariable(name: "csk", arg: 2, scope: !702, file: !68, line: 310, type: !90)
!714 = !DILocalVariable(name: "sk", arg: 3, scope: !702, file: !68, line: 311, type: !705)
!715 = !DILocalVariable(name: "ret", scope: !702, file: !68, line: 312, type: !86)
!716 = !DILocalVariable(name: "S", scope: !702, file: !68, line: 313, type: !309)
!717 = !DILocation(line: 313, column: 19, scope: !702)
!718 = !DILocalVariable(name: "P", scope: !702, file: !68, line: 314, type: !52)
!719 = !DILocation(line: 315, column: 28, scope: !702)
!720 = !DILocalVariable(name: "O", scope: !702, file: !68, line: 315, type: !61)
!721 = !DILocalVariable(name: "param_o", scope: !702, file: !68, line: 317, type: !324)
!722 = !DILocalVariable(name: "param_v", scope: !702, file: !68, line: 318, type: !324)
!723 = !DILocalVariable(name: "param_O_bytes", scope: !702, file: !68, line: 319, type: !324)
!724 = !DILocalVariable(name: "param_pk_seed_bytes", scope: !702, file: !68, line: 320, type: !324)
!725 = !DILocalVariable(name: "param_sk_seed_bytes", scope: !702, file: !68, line: 321, type: !324)
!726 = !DILocalVariable(name: "seed_sk", scope: !702, file: !68, line: 323, type: !90)
!727 = !DILocalVariable(name: "seed_pk", scope: !702, file: !68, line: 324, type: !61)
!728 = !DILocation(line: 326, column: 5, scope: !702)
!729 = !DILocation(line: 328, column: 14, scope: !702)
!730 = !DILocation(line: 328, column: 5, scope: !702)
!731 = !DILocation(line: 334, column: 5, scope: !702)
!732 = !DILocation(line: 341, column: 22, scope: !702)
!733 = !DILocalVariable(name: "P2", scope: !702, file: !68, line: 341, type: !52)
!734 = !DILocalVariable(name: "P1", scope: !702, file: !68, line: 343, type: !52)
!735 = !DILocalVariable(name: "L", scope: !702, file: !68, line: 346, type: !52)
!736 = !DILocation(line: 347, column: 5, scope: !702)
!737 = !DILocation(line: 355, column: 5, scope: !702)
!738 = !DILocation(line: 356, column: 5, scope: !702)
!739 = distinct !DISubprogram(name: "P1P1t_times_O", scope: !408, file: !408, line: 218, type: !459, scopeLine: 218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!740 = !DILocalVariable(name: "p", arg: 1, scope: !739, file: !408, line: 218, type: !264)
!741 = !DILocation(line: 0, scope: !739)
!742 = !DILocalVariable(name: "P1", arg: 2, scope: !739, file: !408, line: 218, type: !411)
!743 = !DILocalVariable(name: "O", arg: 3, scope: !739, file: !408, line: 218, type: !90)
!744 = !DILocalVariable(name: "acc", arg: 4, scope: !739, file: !408, line: 218, type: !52)
!745 = !DILocalVariable(name: "param_o", scope: !739, file: !408, line: 222, type: !324)
!746 = !DILocalVariable(name: "param_v", scope: !739, file: !408, line: 223, type: !324)
!747 = !DILocalVariable(name: "m_vec_limbs", scope: !739, file: !408, line: 224, type: !324)
!748 = !DILocalVariable(name: "bs_mat_entries_used", scope: !739, file: !408, line: 226, type: !86)
!749 = !DILocalVariable(name: "r", scope: !750, file: !408, line: 227, type: !86)
!750 = distinct !DILexicalBlock(scope: !739, file: !408, line: 227, column: 5)
!751 = !DILocation(line: 0, scope: !750)
!752 = !DILocation(line: 227, column: 10, scope: !750)
!753 = !DILocation(line: 226, column: 9, scope: !739)
!754 = !DILocation(line: 227, scope: !750)
!755 = !DILocation(line: 227, column: 23, scope: !756)
!756 = distinct !DILexicalBlock(scope: !750, file: !408, line: 227, column: 5)
!757 = !DILocation(line: 227, column: 5, scope: !750)
!758 = !DILocation(line: 228, column: 9, scope: !759)
!759 = distinct !DILexicalBlock(scope: !760, file: !408, line: 228, column: 9)
!760 = distinct !DILexicalBlock(scope: !756, file: !408, line: 227, column: 39)
!761 = !DILocation(line: 228, scope: !759)
!762 = !DILocalVariable(name: "c", scope: !759, file: !408, line: 228, type: !86)
!763 = !DILocation(line: 0, scope: !759)
!764 = !DILocation(line: 228, column: 27, scope: !765)
!765 = distinct !DILexicalBlock(scope: !759, file: !408, line: 228, column: 9)
!766 = !DILocation(line: 229, column: 17, scope: !767)
!767 = distinct !DILexicalBlock(scope: !768, file: !408, line: 229, column: 16)
!768 = distinct !DILexicalBlock(scope: !765, file: !408, line: 228, column: 43)
!769 = !DILocation(line: 233, scope: !770)
!770 = distinct !DILexicalBlock(scope: !768, file: !408, line: 233, column: 13)
!771 = !DILocalVariable(name: "k", scope: !770, file: !408, line: 233, type: !86)
!772 = !DILocation(line: 0, scope: !770)
!773 = !DILocation(line: 233, column: 31, scope: !774)
!774 = distinct !DILexicalBlock(scope: !770, file: !408, line: 233, column: 13)
!775 = !DILocation(line: 233, column: 13, scope: !770)
!776 = !DILocation(line: 234, column: 47, scope: !777)
!777 = distinct !DILexicalBlock(scope: !774, file: !408, line: 233, column: 50)
!778 = !DILocation(line: 234, column: 88, scope: !777)
!779 = !DILocation(line: 234, column: 84, scope: !777)
!780 = !DILocation(line: 234, column: 127, scope: !777)
!781 = !DILocation(line: 234, column: 137, scope: !777)
!782 = !DILocation(line: 234, column: 108, scope: !777)
!783 = !DILocation(line: 234, column: 17, scope: !777)
!784 = !DILocation(line: 235, column: 47, scope: !777)
!785 = !DILocation(line: 235, column: 88, scope: !777)
!786 = !DILocation(line: 235, column: 84, scope: !777)
!787 = !DILocation(line: 235, column: 127, scope: !777)
!788 = !DILocation(line: 235, column: 137, scope: !777)
!789 = !DILocation(line: 235, column: 108, scope: !777)
!790 = !DILocation(line: 235, column: 17, scope: !777)
!791 = !DILocation(line: 233, column: 44, scope: !774)
!792 = !DILocation(line: 233, column: 13, scope: !774)
!793 = distinct !{!793, !775, !794, !388}
!794 = !DILocation(line: 236, column: 13, scope: !770)
!795 = !DILocation(line: 0, scope: !768)
!796 = !DILocation(line: 228, column: 39, scope: !765)
!797 = !DILocation(line: 228, column: 9, scope: !765)
!798 = distinct !{!798, !758, !799, !388}
!799 = !DILocation(line: 238, column: 9, scope: !759)
!800 = !DILocation(line: 227, column: 35, scope: !756)
!801 = !DILocation(line: 227, column: 5, scope: !756)
!802 = distinct !{!802, !757, !803, !388}
!803 = !DILocation(line: 239, column: 5, scope: !750)
!804 = !DILocation(line: 240, column: 1, scope: !739)
!805 = distinct !DISubprogram(name: "pqmayo_MAYO_5_ref_mayo_sign_signature", scope: !68, file: !68, line: 359, type: !806, scopeLine: 361, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!806 = !DISubroutineType(types: !807)
!807 = !{!86, !264, !61, !808, !90, !58, !90}
!808 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 32)
!809 = !DILocalVariable(name: "p", arg: 1, scope: !805, file: !68, line: 359, type: !264)
!810 = !DILocation(line: 0, scope: !805)
!811 = !DILocalVariable(name: "sig", arg: 2, scope: !805, file: !68, line: 359, type: !61)
!812 = !DILocalVariable(name: "siglen", arg: 3, scope: !805, file: !68, line: 360, type: !808)
!813 = !DILocalVariable(name: "m", arg: 4, scope: !805, file: !68, line: 360, type: !90)
!814 = !DILocalVariable(name: "mlen", arg: 5, scope: !805, file: !68, line: 361, type: !58)
!815 = !DILocalVariable(name: "csk", arg: 6, scope: !805, file: !68, line: 361, type: !90)
!816 = !DILocalVariable(name: "ret", scope: !805, file: !68, line: 362, type: !86)
!817 = !DILocalVariable(name: "tenc", scope: !805, file: !68, line: 363, type: !818)
!818 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 568, elements: !819)
!819 = !{!820}
!820 = !DISubrange(count: 71)
!821 = !DILocation(line: 363, column: 19, scope: !805)
!822 = !DILocalVariable(name: "t", scope: !805, file: !68, line: 363, type: !823)
!823 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 1136, elements: !824)
!824 = !{!825}
!825 = !DISubrange(count: 142)
!826 = !DILocation(line: 363, column: 38, scope: !805)
!827 = !DILocalVariable(name: "y", scope: !805, file: !68, line: 364, type: !823)
!828 = !DILocation(line: 364, column: 19, scope: !805)
!829 = !DILocalVariable(name: "salt", scope: !805, file: !68, line: 365, type: !830)
!830 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 320, elements: !831)
!831 = !{!832}
!832 = !DISubrange(count: 40)
!833 = !DILocation(line: 365, column: 19, scope: !805)
!834 = !DILocalVariable(name: "V", scope: !805, file: !68, line: 366, type: !835)
!835 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 7392, elements: !836)
!836 = !{!837}
!837 = !DISubrange(count: 924)
!838 = !DILocation(line: 366, column: 19, scope: !805)
!839 = !DILocalVariable(name: "Vdec", scope: !805, file: !68, line: 366, type: !321)
!840 = !DILocation(line: 366, column: 57, scope: !805)
!841 = !DILocalVariable(name: "A", scope: !805, file: !68, line: 367, type: !842)
!842 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 167040, elements: !843)
!843 = !{!844}
!844 = !DISubrange(count: 20880)
!845 = !DILocation(line: 367, column: 19, scope: !805)
!846 = !DILocalVariable(name: "x", scope: !805, file: !68, line: 368, type: !847)
!847 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 14784, elements: !848)
!848 = !{!849}
!849 = !DISubrange(count: 1848)
!850 = !DILocation(line: 368, column: 19, scope: !805)
!851 = !DILocalVariable(name: "r", scope: !805, file: !68, line: 369, type: !852)
!852 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 1160, elements: !853)
!853 = !{!854}
!854 = !DISubrange(count: 145)
!855 = !DILocation(line: 369, column: 19, scope: !805)
!856 = !DILocalVariable(name: "s", scope: !805, file: !68, line: 370, type: !847)
!857 = !DILocation(line: 370, column: 19, scope: !805)
!858 = !DILocalVariable(name: "sk", scope: !805, file: !68, line: 372, type: !706, align: 256)
!859 = !DILocation(line: 372, column: 22, scope: !805)
!860 = !DILocalVariable(name: "Ox", scope: !805, file: !68, line: 373, type: !823)
!861 = !DILocation(line: 373, column: 19, scope: !805)
!862 = !DILocalVariable(name: "tmp", scope: !805, file: !68, line: 374, type: !852)
!863 = !DILocation(line: 374, column: 19, scope: !805)
!864 = !DILocalVariable(name: "param_m", scope: !805, file: !68, line: 378, type: !324)
!865 = !DILocalVariable(name: "param_n", scope: !805, file: !68, line: 379, type: !324)
!866 = !DILocalVariable(name: "param_o", scope: !805, file: !68, line: 380, type: !324)
!867 = !DILocalVariable(name: "param_k", scope: !805, file: !68, line: 381, type: !324)
!868 = !DILocalVariable(name: "param_v", scope: !805, file: !68, line: 382, type: !324)
!869 = !DILocalVariable(name: "param_m_bytes", scope: !805, file: !68, line: 383, type: !324)
!870 = !DILocalVariable(name: "param_v_bytes", scope: !805, file: !68, line: 384, type: !324)
!871 = !DILocalVariable(name: "param_r_bytes", scope: !805, file: !68, line: 385, type: !324)
!872 = !DILocalVariable(name: "param_sig_bytes", scope: !805, file: !68, line: 386, type: !324)
!873 = !DILocalVariable(name: "param_A_cols", scope: !805, file: !68, line: 387, type: !324)
!874 = !DILocalVariable(name: "param_digest_bytes", scope: !805, file: !68, line: 388, type: !324)
!875 = !DILocalVariable(name: "param_sk_seed_bytes", scope: !805, file: !68, line: 389, type: !324)
!876 = !DILocalVariable(name: "param_salt_bytes", scope: !805, file: !68, line: 390, type: !324)
!877 = !DILocation(line: 392, column: 11, scope: !805)
!878 = !DILocation(line: 393, column: 13, scope: !879)
!879 = distinct !DILexicalBlock(scope: !805, file: !68, line: 393, column: 9)
!880 = !DILocalVariable(name: "seed_sk", scope: !805, file: !68, line: 371, type: !90)
!881 = !DILocation(line: 401, column: 5, scope: !805)
!882 = !DILocalVariable(name: "P1", scope: !805, file: !68, line: 403, type: !52)
!883 = !DILocation(line: 404, column: 23, scope: !805)
!884 = !DILocalVariable(name: "L", scope: !805, file: !68, line: 404, type: !52)
!885 = !DILocalVariable(name: "Mtmp", scope: !805, file: !68, line: 405, type: !316)
!886 = !DILocation(line: 405, column: 14, scope: !805)
!887 = !DILocation(line: 420, column: 25, scope: !888)
!888 = distinct !DILexicalBlock(scope: !805, file: !68, line: 420, column: 9)
!889 = !DILocation(line: 420, column: 9, scope: !888)
!890 = !DILocation(line: 420, column: 65, scope: !888)
!891 = !DILocation(line: 427, column: 37, scope: !805)
!892 = !DILocation(line: 427, column: 5, scope: !805)
!893 = !DILocation(line: 429, column: 5, scope: !805)
!894 = !DILocation(line: 437, column: 16, scope: !805)
!895 = !DILocation(line: 437, column: 5, scope: !805)
!896 = !DILocation(line: 438, column: 59, scope: !805)
!897 = !DILocalVariable(name: "ctrbyte", scope: !805, file: !68, line: 375, type: !61)
!898 = !DILocation(line: 440, column: 5, scope: !805)
!899 = !DILocation(line: 442, column: 5, scope: !805)
!900 = !DILocalVariable(name: "ctr", scope: !901, file: !68, line: 444, type: !86)
!901 = distinct !DILexicalBlock(scope: !805, file: !68, line: 444, column: 5)
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
!935 = !DILocation(line: 461, column: 39, scope: !931)
!936 = !DILocation(line: 461, column: 27, scope: !931)
!937 = !DILocation(line: 461, column: 9, scope: !925)
!938 = !DILocation(line: 461, column: 9, scope: !931)
!939 = distinct !{!939, !937, !940, !388}
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
!952 = distinct !DILexicalBlock(scope: !805, file: !68, line: 478, column: 5)
!953 = !DILocation(line: 0, scope: !952)
!954 = !DILocation(line: 478, column: 10, scope: !952)
!955 = !DILocation(line: 478, scope: !952)
!956 = !DILocation(line: 478, column: 23, scope: !957)
!957 = distinct !DILexicalBlock(scope: !952, file: !68, line: 478, column: 5)
!958 = !DILocation(line: 478, column: 5, scope: !952)
!959 = !DILocation(line: 479, column: 23, scope: !960)
!960 = distinct !DILexicalBlock(scope: !957, file: !68, line: 478, column: 44)
!961 = !DILocation(line: 479, column: 19, scope: !960)
!962 = !DILocalVariable(name: "vi", scope: !805, file: !68, line: 376, type: !61)
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
!980 = !DILocation(line: 484, column: 5, scope: !805)
!981 = !DILocation(line: 486, column: 34, scope: !805)
!982 = !DILocation(line: 486, column: 5, scope: !805)
!983 = !DILocation(line: 487, column: 13, scope: !805)
!984 = !DILocation(line: 487, column: 5, scope: !805)
!985 = !DILabel(scope: !805, name: "err", file: !68, line: 489)
!986 = !DILocation(line: 489, column: 1, scope: !805)
!987 = !DILocation(line: 490, column: 5, scope: !805)
!988 = !DILocation(line: 491, column: 5, scope: !805)
!989 = !DILocation(line: 492, column: 5, scope: !805)
!990 = !DILocation(line: 493, column: 5, scope: !805)
!991 = !DILocation(line: 494, column: 26, scope: !805)
!992 = !DILocation(line: 494, column: 5, scope: !805)
!993 = !DILocation(line: 495, column: 5, scope: !805)
!994 = !DILocation(line: 496, column: 5, scope: !805)
!995 = !DILocation(line: 497, column: 5, scope: !805)
!996 = !DILocation(line: 498, column: 5, scope: !805)
!997 = !DILocation(line: 499, column: 5, scope: !805)
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
!1013 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 981504, elements: !1014)
!1014 = !{!1015}
!1015 = !DISubrange(count: 15336)
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
!1044 = !DILocation(line: 56, column: 53, scope: !1042)
!1045 = !DILocation(line: 56, column: 27, scope: !1042)
!1046 = !DILocation(line: 56, column: 9, scope: !1036)
!1047 = !DILocation(line: 56, column: 9, scope: !1042)
!1048 = distinct !{!1048, !1046, !1049, !388}
!1049 = !DILocation(line: 59, column: 9, scope: !1036)
!1050 = !DILocalVariable(name: "temp", scope: !1020, file: !68, line: 62, type: !675)
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
!1165 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 165888, elements: !1166)
!1166 = !{!1167}
!1167 = !DISubrange(count: 2592)
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
!1217 = !DILocation(line: 182, scope: !1218)
!1218 = distinct !DILexicalBlock(scope: !1219, file: !68, line: 182, column: 17)
!1219 = distinct !DILexicalBlock(scope: !1215, file: !68, line: 181, column: 50)
!1220 = !DILocalVariable(name: "k", scope: !1218, file: !68, line: 182, type: !86)
!1221 = !DILocation(line: 0, scope: !1218)
!1222 = !DILocation(line: 184, column: 78, scope: !1223)
!1223 = distinct !DILexicalBlock(scope: !1224, file: !68, line: 183, column: 17)
!1224 = distinct !DILexicalBlock(scope: !1218, file: !68, line: 182, column: 17)
!1225 = !DILocation(line: 184, column: 100, scope: !1223)
!1226 = !DILocation(line: 184, column: 35, scope: !1223)
!1227 = !DILocation(line: 184, column: 39, scope: !1223)
!1228 = !DILocation(line: 184, column: 48, scope: !1223)
!1229 = !DILocation(line: 184, column: 65, scope: !1223)
!1230 = !DILocation(line: 184, column: 43, scope: !1223)
!1231 = !DILocation(line: 184, column: 21, scope: !1223)
!1232 = !DILocation(line: 184, column: 75, scope: !1223)
!1233 = !DILocation(line: 185, column: 38, scope: !1234)
!1234 = distinct !DILexicalBlock(scope: !1223, file: !68, line: 185, column: 24)
!1235 = !DILocation(line: 186, column: 114, scope: !1236)
!1236 = distinct !DILexicalBlock(scope: !1234, file: !68, line: 185, column: 42)
!1237 = !DILocation(line: 186, column: 108, scope: !1236)
!1238 = !DILocation(line: 186, column: 39, scope: !1236)
!1239 = !DILocation(line: 186, column: 43, scope: !1236)
!1240 = !DILocation(line: 186, column: 52, scope: !1236)
!1241 = !DILocation(line: 186, column: 73, scope: !1236)
!1242 = !DILocation(line: 186, column: 47, scope: !1236)
!1243 = !DILocation(line: 186, column: 25, scope: !1236)
!1244 = !DILocation(line: 186, column: 83, scope: !1236)
!1245 = !DILocation(line: 187, column: 21, scope: !1236)
!1246 = !DILocation(line: 182, column: 51, scope: !1224)
!1247 = !DILocation(line: 182, column: 35, scope: !1224)
!1248 = !DILocation(line: 182, column: 17, scope: !1218)
!1249 = !DILocation(line: 182, column: 17, scope: !1224)
!1250 = distinct !{!1250, !1248, !1251, !388}
!1251 = !DILocation(line: 188, column: 17, scope: !1218)
!1252 = !DILocation(line: 181, column: 46, scope: !1215)
!1253 = !DILocation(line: 181, column: 13, scope: !1215)
!1254 = distinct !{!1254, !1216, !1255, !388}
!1255 = !DILocation(line: 189, column: 13, scope: !1210)
!1256 = !DILocation(line: 191, column: 19, scope: !1257)
!1257 = distinct !DILexicalBlock(scope: !1207, file: !68, line: 191, column: 17)
!1258 = !DILocation(line: 192, column: 26, scope: !1259)
!1259 = distinct !DILexicalBlock(scope: !1257, file: !68, line: 191, column: 25)
!1260 = !DILocalVariable(name: "Mi", scope: !1154, file: !68, line: 164, type: !411)
!1261 = !DILocalVariable(name: "c", scope: !1262, file: !68, line: 193, type: !86)
!1262 = distinct !DILexicalBlock(scope: !1259, file: !68, line: 193, column: 17)
!1263 = !DILocation(line: 0, scope: !1262)
!1264 = !DILocation(line: 193, column: 22, scope: !1262)
!1265 = !DILocation(line: 193, scope: !1262)
!1266 = !DILocation(line: 193, column: 35, scope: !1267)
!1267 = distinct !DILexicalBlock(scope: !1262, file: !68, line: 193, column: 17)
!1268 = !DILocation(line: 193, column: 17, scope: !1262)
!1269 = !DILocation(line: 194, scope: !1270)
!1270 = distinct !DILexicalBlock(scope: !1271, file: !68, line: 194, column: 21)
!1271 = distinct !DILexicalBlock(scope: !1267, file: !68, line: 193, column: 54)
!1272 = !DILocalVariable(name: "k", scope: !1270, file: !68, line: 194, type: !86)
!1273 = !DILocation(line: 0, scope: !1270)
!1274 = !DILocation(line: 196, column: 81, scope: !1275)
!1275 = distinct !DILexicalBlock(scope: !1276, file: !68, line: 195, column: 21)
!1276 = distinct !DILexicalBlock(scope: !1270, file: !68, line: 194, column: 21)
!1277 = !DILocation(line: 196, column: 103, scope: !1275)
!1278 = !DILocation(line: 196, column: 38, scope: !1275)
!1279 = !DILocation(line: 196, column: 42, scope: !1275)
!1280 = !DILocation(line: 196, column: 51, scope: !1275)
!1281 = !DILocation(line: 196, column: 68, scope: !1275)
!1282 = !DILocation(line: 196, column: 46, scope: !1275)
!1283 = !DILocation(line: 196, column: 25, scope: !1275)
!1284 = !DILocation(line: 196, column: 78, scope: !1275)
!1285 = !DILocation(line: 197, column: 42, scope: !1286)
!1286 = distinct !DILexicalBlock(scope: !1275, file: !68, line: 197, column: 28)
!1287 = !DILocation(line: 198, column: 117, scope: !1288)
!1288 = distinct !DILexicalBlock(scope: !1286, file: !68, line: 197, column: 46)
!1289 = !DILocation(line: 198, column: 111, scope: !1288)
!1290 = !DILocation(line: 198, column: 42, scope: !1288)
!1291 = !DILocation(line: 198, column: 46, scope: !1288)
!1292 = !DILocation(line: 198, column: 55, scope: !1288)
!1293 = !DILocation(line: 198, column: 76, scope: !1288)
!1294 = !DILocation(line: 198, column: 50, scope: !1288)
!1295 = !DILocation(line: 198, column: 29, scope: !1288)
!1296 = !DILocation(line: 198, column: 86, scope: !1288)
!1297 = !DILocation(line: 199, column: 25, scope: !1288)
!1298 = !DILocation(line: 194, column: 55, scope: !1276)
!1299 = !DILocation(line: 194, column: 39, scope: !1276)
!1300 = !DILocation(line: 194, column: 21, scope: !1270)
!1301 = !DILocation(line: 194, column: 21, scope: !1276)
!1302 = distinct !{!1302, !1300, !1303, !388}
!1303 = !DILocation(line: 200, column: 21, scope: !1270)
!1304 = !DILocation(line: 193, column: 50, scope: !1267)
!1305 = !DILocation(line: 193, column: 17, scope: !1267)
!1306 = distinct !{!1306, !1268, !1307, !388}
!1307 = !DILocation(line: 201, column: 17, scope: !1262)
!1308 = !DILocation(line: 204, column: 27, scope: !1207)
!1309 = !DILocation(line: 205, column: 30, scope: !1310)
!1310 = distinct !DILexicalBlock(scope: !1207, file: !68, line: 205, column: 16)
!1311 = !DILocation(line: 178, column: 46, scope: !1204)
!1312 = !DILocation(line: 178, column: 9, scope: !1204)
!1313 = distinct !{!1313, !1205, !1314, !388}
!1314 = !DILocation(line: 209, column: 9, scope: !1199)
!1315 = !DILocation(line: 177, column: 42, scope: !1196)
!1316 = !DILocation(line: 177, column: 5, scope: !1196)
!1317 = distinct !{!1317, !1197, !1318, !388}
!1318 = !DILocation(line: 210, column: 5, scope: !1190)
!1319 = !DILocation(line: 212, scope: !1320)
!1320 = distinct !DILexicalBlock(scope: !1154, file: !68, line: 212, column: 5)
!1321 = !DILocalVariable(name: "c", scope: !1320, file: !68, line: 212, type: !58)
!1322 = !DILocation(line: 0, scope: !1320)
!1323 = !DILocation(line: 212, column: 26, scope: !1324)
!1324 = distinct !DILexicalBlock(scope: !1320, file: !68, line: 212, column: 5)
!1325 = !DILocation(line: 212, column: 5, scope: !1320)
!1326 = !DILocation(line: 214, column: 35, scope: !1327)
!1327 = distinct !DILexicalBlock(scope: !1324, file: !68, line: 213, column: 5)
!1328 = !DILocation(line: 214, column: 9, scope: !1327)
!1329 = !DILocation(line: 212, column: 91, scope: !1324)
!1330 = !DILocation(line: 212, column: 5, scope: !1324)
!1331 = distinct !{!1331, !1325, !1332, !388}
!1332 = !DILocation(line: 215, column: 5, scope: !1320)
!1333 = !DILocalVariable(name: "tab", scope: !1154, file: !68, line: 217, type: !1334)
!1334 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 128, elements: !1335)
!1335 = !{!1336}
!1336 = !DISubrange(count: 16)
!1337 = !DILocation(line: 217, column: 19, scope: !1154)
!1338 = !DILocalVariable(name: "i", scope: !1339, file: !68, line: 218, type: !58)
!1339 = distinct !DILexicalBlock(scope: !1154, file: !68, line: 218, column: 5)
!1340 = !DILocation(line: 0, scope: !1339)
!1341 = !DILocation(line: 218, column: 10, scope: !1339)
!1342 = !DILocation(line: 218, scope: !1339)
!1343 = !DILocation(line: 218, column: 26, scope: !1344)
!1344 = distinct !DILexicalBlock(scope: !1339, file: !68, line: 218, column: 5)
!1345 = !DILocation(line: 218, column: 5, scope: !1339)
!1346 = !DILocation(line: 220, column: 28, scope: !1347)
!1347 = distinct !DILexicalBlock(scope: !1344, file: !68, line: 219, column: 5)
!1348 = !DILocation(line: 220, column: 22, scope: !1347)
!1349 = !DILocation(line: 220, column: 14, scope: !1347)
!1350 = !DILocation(line: 220, column: 9, scope: !1347)
!1351 = !DILocation(line: 220, column: 20, scope: !1347)
!1352 = !DILocation(line: 221, column: 22, scope: !1347)
!1353 = !DILocation(line: 221, column: 14, scope: !1347)
!1354 = !DILocation(line: 221, column: 16, scope: !1347)
!1355 = !DILocation(line: 221, column: 9, scope: !1347)
!1356 = !DILocation(line: 221, column: 20, scope: !1347)
!1357 = !DILocation(line: 222, column: 22, scope: !1347)
!1358 = !DILocation(line: 222, column: 14, scope: !1347)
!1359 = !DILocation(line: 222, column: 16, scope: !1347)
!1360 = !DILocation(line: 222, column: 9, scope: !1347)
!1361 = !DILocation(line: 222, column: 20, scope: !1347)
!1362 = !DILocation(line: 223, column: 22, scope: !1347)
!1363 = !DILocation(line: 223, column: 14, scope: !1347)
!1364 = !DILocation(line: 223, column: 16, scope: !1347)
!1365 = !DILocation(line: 223, column: 9, scope: !1347)
!1366 = !DILocation(line: 223, column: 20, scope: !1347)
!1367 = !DILocation(line: 218, column: 41, scope: !1344)
!1368 = !DILocation(line: 218, column: 5, scope: !1344)
!1369 = distinct !{!1369, !1345, !1370, !388}
!1370 = !DILocation(line: 224, column: 5, scope: !1339)
!1371 = !DILocation(line: 228, scope: !1372)
!1372 = distinct !DILexicalBlock(scope: !1154, file: !68, line: 228, column: 5)
!1373 = !DILocalVariable(name: "c", scope: !1372, file: !68, line: 228, type: !58)
!1374 = !DILocation(line: 0, scope: !1372)
!1375 = !DILocation(line: 228, column: 26, scope: !1376)
!1376 = distinct !DILexicalBlock(scope: !1372, file: !68, line: 228, column: 5)
!1377 = !DILocation(line: 228, column: 5, scope: !1372)
!1378 = !DILocation(line: 230, scope: !1379)
!1379 = distinct !DILexicalBlock(scope: !1380, file: !68, line: 230, column: 9)
!1380 = distinct !DILexicalBlock(scope: !1376, file: !68, line: 229, column: 5)
!1381 = !DILocalVariable(name: "r", scope: !1379, file: !68, line: 230, type: !86)
!1382 = !DILocation(line: 0, scope: !1379)
!1383 = !DILocation(line: 230, column: 36, scope: !1384)
!1384 = distinct !DILexicalBlock(scope: !1379, file: !68, line: 230, column: 9)
!1385 = !DILocation(line: 230, column: 9, scope: !1379)
!1386 = !DILocation(line: 232, column: 28, scope: !1387)
!1387 = distinct !DILexicalBlock(scope: !1384, file: !68, line: 231, column: 9)
!1388 = !DILocation(line: 232, column: 32, scope: !1387)
!1389 = !DILocation(line: 232, column: 41, scope: !1387)
!1390 = !DILocation(line: 232, column: 49, scope: !1387)
!1391 = !DILocation(line: 232, column: 45, scope: !1387)
!1392 = !DILocalVariable(name: "pos", scope: !1387, file: !68, line: 232, type: !58)
!1393 = !DILocation(line: 0, scope: !1387)
!1394 = !DILocation(line: 233, column: 28, scope: !1387)
!1395 = !DILocation(line: 233, column: 41, scope: !1387)
!1396 = !DILocalVariable(name: "t0", scope: !1387, file: !68, line: 233, type: !53)
!1397 = !DILocation(line: 234, column: 35, scope: !1387)
!1398 = !DILocation(line: 234, column: 41, scope: !1387)
!1399 = !DILocalVariable(name: "t1", scope: !1387, file: !68, line: 234, type: !53)
!1400 = !DILocation(line: 235, column: 35, scope: !1387)
!1401 = !DILocation(line: 235, column: 41, scope: !1387)
!1402 = !DILocalVariable(name: "t2", scope: !1387, file: !68, line: 235, type: !53)
!1403 = !DILocation(line: 236, column: 28, scope: !1387)
!1404 = !DILocation(line: 236, column: 35, scope: !1387)
!1405 = !DILocation(line: 236, column: 41, scope: !1387)
!1406 = !DILocalVariable(name: "t3", scope: !1387, file: !68, line: 236, type: !53)
!1407 = !DILocalVariable(name: "t", scope: !1408, file: !68, line: 237, type: !58)
!1408 = distinct !DILexicalBlock(scope: !1387, file: !68, line: 237, column: 13)
!1409 = !DILocation(line: 0, scope: !1408)
!1410 = !DILocation(line: 239, column: 84, scope: !1411)
!1411 = distinct !DILexicalBlock(scope: !1412, file: !68, line: 238, column: 13)
!1412 = distinct !DILexicalBlock(scope: !1408, file: !68, line: 237, column: 13)
!1413 = !DILocation(line: 239, column: 83, scope: !1411)
!1414 = !DILocation(line: 239, column: 100, scope: !1411)
!1415 = !DILocation(line: 239, column: 99, scope: !1411)
!1416 = !DILocation(line: 239, column: 95, scope: !1411)
!1417 = !DILocation(line: 239, column: 116, scope: !1411)
!1418 = !DILocation(line: 239, column: 115, scope: !1411)
!1419 = !DILocation(line: 239, column: 111, scope: !1411)
!1420 = !DILocation(line: 239, column: 132, scope: !1411)
!1421 = !DILocation(line: 239, column: 131, scope: !1411)
!1422 = !DILocation(line: 239, column: 127, scope: !1411)
!1423 = !DILocation(line: 239, column: 24, scope: !1411)
!1424 = !DILocation(line: 239, column: 36, scope: !1411)
!1425 = !DILocation(line: 239, column: 40, scope: !1411)
!1426 = !DILocation(line: 239, column: 49, scope: !1411)
!1427 = !DILocation(line: 239, column: 60, scope: !1411)
!1428 = !DILocation(line: 239, column: 72, scope: !1411)
!1429 = !DILocation(line: 239, column: 53, scope: !1411)
!1430 = !DILocation(line: 239, column: 17, scope: !1411)
!1431 = !DILocation(line: 239, column: 78, scope: !1411)
!1432 = !DILocation(line: 230, column: 82, scope: !1384)
!1433 = !DILocation(line: 230, column: 9, scope: !1384)
!1434 = distinct !{!1434, !1385, !1435, !388}
!1435 = !DILocation(line: 241, column: 9, scope: !1379)
!1436 = !DILocation(line: 228, column: 38, scope: !1376)
!1437 = !DILocation(line: 228, column: 5, scope: !1376)
!1438 = distinct !{!1438, !1377, !1439, !388}
!1439 = !DILocation(line: 242, column: 5, scope: !1372)
!1440 = !DILocation(line: 250, scope: !1441)
!1441 = distinct !DILexicalBlock(scope: !1154, file: !68, line: 250, column: 5)
!1442 = !DILocalVariable(name: "r", scope: !1441, file: !68, line: 250, type: !86)
!1443 = !DILocation(line: 0, scope: !1441)
!1444 = !DILocation(line: 250, column: 23, scope: !1445)
!1445 = distinct !DILexicalBlock(scope: !1441, file: !68, line: 250, column: 5)
!1446 = !DILocation(line: 250, column: 5, scope: !1441)
!1447 = !DILocation(line: 252, scope: !1448)
!1448 = distinct !DILexicalBlock(scope: !1449, file: !68, line: 252, column: 9)
!1449 = distinct !DILexicalBlock(scope: !1445, file: !68, line: 251, column: 5)
!1450 = !DILocalVariable(name: "c", scope: !1448, file: !68, line: 252, type: !86)
!1451 = !DILocation(line: 0, scope: !1448)
!1452 = !DILocation(line: 254, column: 13, scope: !1453)
!1453 = distinct !DILexicalBlock(scope: !1454, file: !68, line: 254, column: 13)
!1454 = distinct !DILexicalBlock(scope: !1455, file: !68, line: 253, column: 9)
!1455 = distinct !DILexicalBlock(scope: !1448, file: !68, line: 252, column: 9)
!1456 = !DILocation(line: 254, scope: !1453)
!1457 = !DILocalVariable(name: "i", scope: !1453, file: !68, line: 254, type: !86)
!1458 = !DILocation(line: 0, scope: !1453)
!1459 = !DILocation(line: 254, column: 35, scope: !1460)
!1460 = distinct !DILexicalBlock(scope: !1453, file: !68, line: 254, column: 13)
!1461 = !DILocation(line: 256, column: 55, scope: !1462)
!1462 = distinct !DILexicalBlock(scope: !1460, file: !68, line: 255, column: 13)
!1463 = !DILocation(line: 256, column: 59, scope: !1462)
!1464 = !DILocation(line: 256, column: 63, scope: !1462)
!1465 = !DILocation(line: 256, column: 44, scope: !1462)
!1466 = !DILocation(line: 256, column: 95, scope: !1462)
!1467 = !DILocation(line: 256, column: 92, scope: !1462)
!1468 = !DILocation(line: 256, column: 75, scope: !1462)
!1469 = !DILocation(line: 256, column: 99, scope: !1462)
!1470 = !DILocation(line: 256, column: 17, scope: !1462)
!1471 = !DILocation(line: 254, column: 50, scope: !1460)
!1472 = !DILocation(line: 254, column: 13, scope: !1460)
!1473 = distinct !{!1473, !1452, !1474, !388}
!1474 = !DILocation(line: 257, column: 13, scope: !1453)
!1475 = !DILocation(line: 252, column: 50, scope: !1455)
!1476 = !DILocation(line: 252, column: 27, scope: !1455)
!1477 = !DILocation(line: 252, column: 9, scope: !1448)
!1478 = !DILocation(line: 252, column: 9, scope: !1455)
!1479 = distinct !{!1479, !1477, !1480, !388}
!1480 = !DILocation(line: 258, column: 9, scope: !1448)
!1481 = !DILocation(line: 256, column: 104, scope: !1462)
!1482 = !DILocation(line: 250, column: 38, scope: !1445)
!1483 = !DILocation(line: 250, column: 5, scope: !1445)
!1484 = distinct !{!1484, !1446, !1485, !388}
!1485 = !DILocation(line: 259, column: 5, scope: !1441)
!1486 = !DILocation(line: 260, column: 1, scope: !1154)
!1487 = distinct !DISubprogram(name: "mat_mul", scope: !583, file: !583, line: 79, type: !1488, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1488 = !DISubroutineType(types: !1489)
!1489 = !{null, !90, !90, !61, !86, !86, !86}
!1490 = !DILocalVariable(name: "a", arg: 1, scope: !1487, file: !583, line: 79, type: !90)
!1491 = !DILocation(line: 0, scope: !1487)
!1492 = !DILocalVariable(name: "b", arg: 2, scope: !1487, file: !583, line: 79, type: !90)
!1493 = !DILocalVariable(name: "c", arg: 3, scope: !1487, file: !583, line: 80, type: !61)
!1494 = !DILocalVariable(name: "colrow_ab", arg: 4, scope: !1487, file: !583, line: 80, type: !86)
!1495 = !DILocalVariable(name: "row_a", arg: 5, scope: !1487, file: !583, line: 80, type: !86)
!1496 = !DILocalVariable(name: "col_b", arg: 6, scope: !1487, file: !583, line: 80, type: !86)
!1497 = !DILocalVariable(name: "i", scope: !1498, file: !583, line: 81, type: !86)
!1498 = distinct !DILexicalBlock(scope: !1487, file: !583, line: 81, column: 5)
!1499 = !DILocation(line: 0, scope: !1498)
!1500 = !DILocation(line: 81, column: 10, scope: !1498)
!1501 = !DILocation(line: 81, scope: !1498)
!1502 = !DILocation(line: 81, column: 23, scope: !1503)
!1503 = distinct !DILexicalBlock(scope: !1498, file: !583, line: 81, column: 5)
!1504 = !DILocation(line: 81, column: 5, scope: !1498)
!1505 = !DILocation(line: 82, scope: !1506)
!1506 = distinct !DILexicalBlock(scope: !1507, file: !583, line: 82, column: 9)
!1507 = distinct !DILexicalBlock(scope: !1503, file: !583, line: 81, column: 53)
!1508 = !DILocalVariable(name: "j", scope: !1506, file: !583, line: 82, type: !86)
!1509 = !DILocation(line: 0, scope: !1506)
!1510 = !DILocation(line: 82, column: 27, scope: !1511)
!1511 = distinct !DILexicalBlock(scope: !1506, file: !583, line: 82, column: 9)
!1512 = !DILocation(line: 82, column: 9, scope: !1506)
!1513 = !DILocation(line: 83, column: 31, scope: !1514)
!1514 = distinct !DILexicalBlock(scope: !1511, file: !583, line: 82, column: 46)
!1515 = !DILocation(line: 83, column: 18, scope: !1514)
!1516 = !DILocation(line: 83, column: 16, scope: !1514)
!1517 = !DILocation(line: 82, column: 36, scope: !1511)
!1518 = !DILocation(line: 82, column: 41, scope: !1511)
!1519 = !DILocation(line: 82, column: 9, scope: !1511)
!1520 = distinct !{!1520, !1512, !1521, !388}
!1521 = !DILocation(line: 84, column: 9, scope: !1506)
!1522 = !DILocation(line: 81, column: 32, scope: !1503)
!1523 = !DILocation(line: 81, column: 39, scope: !1503)
!1524 = !DILocation(line: 81, column: 5, scope: !1503)
!1525 = distinct !{!1525, !1504, !1526, !388}
!1526 = !DILocation(line: 85, column: 5, scope: !1498)
!1527 = !DILocation(line: 86, column: 18, scope: !1487)
!1528 = !DILocation(line: 86, column: 5, scope: !1487)
!1529 = !DILocation(line: 87, column: 1, scope: !1487)
!1530 = distinct !DISubprogram(name: "mat_add", scope: !583, file: !583, line: 89, type: !1531, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1531 = !DISubroutineType(types: !1532)
!1532 = !{null, !90, !90, !61, !86, !86}
!1533 = !DILocalVariable(name: "a", arg: 1, scope: !1530, file: !583, line: 89, type: !90)
!1534 = !DILocation(line: 0, scope: !1530)
!1535 = !DILocalVariable(name: "b", arg: 2, scope: !1530, file: !583, line: 89, type: !90)
!1536 = !DILocalVariable(name: "c", arg: 3, scope: !1530, file: !583, line: 90, type: !61)
!1537 = !DILocalVariable(name: "m", arg: 4, scope: !1530, file: !583, line: 90, type: !86)
!1538 = !DILocalVariable(name: "n", arg: 5, scope: !1530, file: !583, line: 90, type: !86)
!1539 = !DILocalVariable(name: "i", scope: !1540, file: !583, line: 91, type: !86)
!1540 = distinct !DILexicalBlock(scope: !1530, file: !583, line: 91, column: 5)
!1541 = !DILocation(line: 0, scope: !1540)
!1542 = !DILocation(line: 91, column: 10, scope: !1540)
!1543 = !DILocation(line: 91, scope: !1540)
!1544 = !DILocation(line: 91, column: 23, scope: !1545)
!1545 = distinct !DILexicalBlock(scope: !1540, file: !583, line: 91, column: 5)
!1546 = !DILocation(line: 91, column: 5, scope: !1540)
!1547 = !DILocation(line: 92, scope: !1548)
!1548 = distinct !DILexicalBlock(scope: !1549, file: !583, line: 92, column: 9)
!1549 = distinct !DILexicalBlock(scope: !1545, file: !583, line: 91, column: 33)
!1550 = !DILocalVariable(name: "j", scope: !1548, file: !583, line: 92, type: !86)
!1551 = !DILocation(line: 0, scope: !1548)
!1552 = !DILocation(line: 92, column: 27, scope: !1553)
!1553 = distinct !DILexicalBlock(scope: !1548, file: !583, line: 92, column: 9)
!1554 = !DILocation(line: 92, column: 9, scope: !1548)
!1555 = !DILocation(line: 93, column: 46, scope: !1556)
!1556 = distinct !DILexicalBlock(scope: !1553, file: !583, line: 92, column: 37)
!1557 = !DILocation(line: 93, column: 42, scope: !1556)
!1558 = !DILocation(line: 93, column: 50, scope: !1556)
!1559 = !DILocation(line: 93, column: 38, scope: !1556)
!1560 = !DILocation(line: 93, column: 64, scope: !1556)
!1561 = !DILocation(line: 93, column: 60, scope: !1556)
!1562 = !DILocation(line: 93, column: 68, scope: !1556)
!1563 = !DILocation(line: 93, column: 56, scope: !1556)
!1564 = !DILocation(line: 93, column: 32, scope: !1556)
!1565 = !DILocation(line: 93, column: 21, scope: !1556)
!1566 = !DILocation(line: 93, column: 17, scope: !1556)
!1567 = !DILocation(line: 93, column: 25, scope: !1556)
!1568 = !DILocation(line: 93, column: 30, scope: !1556)
!1569 = !DILocation(line: 92, column: 32, scope: !1553)
!1570 = !DILocation(line: 92, column: 9, scope: !1553)
!1571 = distinct !{!1571, !1554, !1572, !388}
!1572 = !DILocation(line: 94, column: 9, scope: !1548)
!1573 = !DILocation(line: 91, column: 28, scope: !1545)
!1574 = !DILocation(line: 91, column: 5, scope: !1545)
!1575 = distinct !{!1575, !1546, !1576, !388}
!1576 = !DILocation(line: 95, column: 5, scope: !1540)
!1577 = !DILocation(line: 96, column: 1, scope: !1530)
!1578 = distinct !DISubprogram(name: "encode", scope: !68, file: !68, line: 32, type: !361, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1579 = !DILocalVariable(name: "m", arg: 1, scope: !1578, file: !68, line: 32, type: !90)
!1580 = !DILocation(line: 0, scope: !1578)
!1581 = !DILocalVariable(name: "menc", arg: 2, scope: !1578, file: !68, line: 32, type: !61)
!1582 = !DILocalVariable(name: "mlen", arg: 3, scope: !1578, file: !68, line: 32, type: !86)
!1583 = !DILocalVariable(name: "i", scope: !1578, file: !68, line: 33, type: !86)
!1584 = !DILocation(line: 34, column: 10, scope: !1585)
!1585 = distinct !DILexicalBlock(scope: !1578, file: !68, line: 34, column: 5)
!1586 = !DILocation(line: 34, scope: !1585)
!1587 = !DILocation(line: 34, column: 26, scope: !1588)
!1588 = distinct !DILexicalBlock(scope: !1585, file: !68, line: 34, column: 5)
!1589 = !DILocation(line: 34, column: 19, scope: !1588)
!1590 = !DILocation(line: 34, column: 5, scope: !1585)
!1591 = !DILocation(line: 35, column: 20, scope: !1592)
!1592 = distinct !DILexicalBlock(scope: !1588, file: !68, line: 34, column: 44)
!1593 = !DILocation(line: 35, column: 31, scope: !1592)
!1594 = !DILocation(line: 35, column: 27, scope: !1592)
!1595 = !DILocation(line: 35, column: 36, scope: !1592)
!1596 = !DILocation(line: 35, column: 24, scope: !1592)
!1597 = !DILocation(line: 35, column: 9, scope: !1592)
!1598 = !DILocation(line: 35, column: 17, scope: !1592)
!1599 = !DILocation(line: 34, column: 31, scope: !1588)
!1600 = !DILocation(line: 34, column: 38, scope: !1588)
!1601 = !DILocation(line: 34, column: 5, scope: !1588)
!1602 = distinct !{!1602, !1590, !1603, !388}
!1603 = !DILocation(line: 36, column: 5, scope: !1585)
!1604 = !DILocation(line: 38, column: 18, scope: !1605)
!1605 = distinct !DILexicalBlock(scope: !1578, file: !68, line: 38, column: 9)
!1606 = !DILocation(line: 39, column: 20, scope: !1607)
!1607 = distinct !DILexicalBlock(scope: !1605, file: !68, line: 38, column: 24)
!1608 = !DILocation(line: 39, column: 9, scope: !1607)
!1609 = !DILocation(line: 39, column: 17, scope: !1607)
!1610 = !DILocation(line: 40, column: 5, scope: !1607)
!1611 = !DILocation(line: 41, column: 1, scope: !1578)
!1612 = distinct !DISubprogram(name: "add_f", scope: !583, file: !583, line: 43, type: !1613, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1613 = !DISubroutineType(types: !1614)
!1614 = !{!51, !51, !51}
!1615 = !DILocalVariable(name: "a", arg: 1, scope: !1612, file: !583, line: 43, type: !51)
!1616 = !DILocation(line: 0, scope: !1612)
!1617 = !DILocalVariable(name: "b", arg: 2, scope: !1612, file: !583, line: 43, type: !51)
!1618 = !DILocation(line: 44, column: 14, scope: !1612)
!1619 = !DILocation(line: 44, column: 5, scope: !1612)
!1620 = distinct !DISubprogram(name: "lincomb", scope: !583, file: !583, line: 70, type: !1621, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1621 = !DISubroutineType(types: !1622)
!1622 = !{!51, !90, !90, !86, !86}
!1623 = !DILocalVariable(name: "a", arg: 1, scope: !1620, file: !583, line: 70, type: !90)
!1624 = !DILocation(line: 0, scope: !1620)
!1625 = !DILocalVariable(name: "b", arg: 2, scope: !1620, file: !583, line: 71, type: !90)
!1626 = !DILocalVariable(name: "n", arg: 3, scope: !1620, file: !583, line: 71, type: !86)
!1627 = !DILocalVariable(name: "m", arg: 4, scope: !1620, file: !583, line: 71, type: !86)
!1628 = !DILocalVariable(name: "ret", scope: !1620, file: !583, line: 72, type: !51)
!1629 = !DILocalVariable(name: "i", scope: !1630, file: !583, line: 73, type: !86)
!1630 = distinct !DILexicalBlock(scope: !1620, file: !583, line: 73, column: 5)
!1631 = !DILocation(line: 0, scope: !1630)
!1632 = !DILocation(line: 73, column: 10, scope: !1630)
!1633 = !DILocation(line: 73, scope: !1630)
!1634 = !DILocation(line: 73, column: 23, scope: !1635)
!1635 = distinct !DILexicalBlock(scope: !1630, file: !583, line: 73, column: 5)
!1636 = !DILocation(line: 73, column: 5, scope: !1630)
!1637 = !DILocation(line: 74, column: 27, scope: !1638)
!1638 = distinct !DILexicalBlock(scope: !1635, file: !583, line: 73, column: 41)
!1639 = !DILocation(line: 74, column: 33, scope: !1638)
!1640 = !DILocation(line: 74, column: 21, scope: !1638)
!1641 = !DILocation(line: 74, column: 15, scope: !1638)
!1642 = !DILocation(line: 73, column: 28, scope: !1635)
!1643 = !DILocation(line: 73, column: 35, scope: !1635)
!1644 = !DILocation(line: 73, column: 5, scope: !1635)
!1645 = distinct !{!1645, !1636, !1646, !388}
!1646 = !DILocation(line: 75, column: 5, scope: !1630)
!1647 = !DILocation(line: 76, column: 5, scope: !1620)
!1648 = distinct !DISubprogram(name: "mul_f", scope: !583, file: !583, line: 9, type: !1613, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1649 = !DILocalVariable(name: "a", arg: 1, scope: !1648, file: !583, line: 9, type: !51)
!1650 = !DILocation(line: 0, scope: !1648)
!1651 = !DILocalVariable(name: "b", arg: 2, scope: !1648, file: !583, line: 9, type: !51)
!1652 = !DILocation(line: 14, column: 10, scope: !1648)
!1653 = !DILocation(line: 14, column: 7, scope: !1648)
!1654 = !DILocation(line: 17, column: 17, scope: !1648)
!1655 = !DILocalVariable(name: "p", scope: !1648, file: !583, line: 11, type: !51)
!1656 = !DILocation(line: 18, column: 13, scope: !1648)
!1657 = !DILocation(line: 18, column: 17, scope: !1648)
!1658 = !DILocation(line: 18, column: 7, scope: !1648)
!1659 = !DILocation(line: 19, column: 13, scope: !1648)
!1660 = !DILocation(line: 19, column: 17, scope: !1648)
!1661 = !DILocation(line: 19, column: 7, scope: !1648)
!1662 = !DILocation(line: 20, column: 13, scope: !1648)
!1663 = !DILocation(line: 20, column: 17, scope: !1648)
!1664 = !DILocation(line: 20, column: 7, scope: !1648)
!1665 = !DILocalVariable(name: "top_p", scope: !1648, file: !583, line: 23, type: !51)
!1666 = !DILocation(line: 24, column: 37, scope: !1648)
!1667 = !DILocation(line: 24, column: 52, scope: !1648)
!1668 = !DILocation(line: 24, column: 43, scope: !1648)
!1669 = !DILocation(line: 24, column: 59, scope: !1648)
!1670 = !DILocalVariable(name: "out", scope: !1648, file: !583, line: 24, type: !51)
!1671 = !DILocation(line: 25, column: 5, scope: !1648)
!1672 = !DILocalVariable(name: "M", arg: 1, scope: !67, file: !68, line: 111, type: !52)
!1673 = !DILocation(line: 0, scope: !67)
!1674 = !DILocalVariable(name: "i", scope: !1675, file: !68, line: 117, type: !58)
!1675 = distinct !DILexicalBlock(scope: !67, file: !68, line: 117, column: 5)
!1676 = !DILocation(line: 0, scope: !1675)
!1677 = !DILocation(line: 119, column: 24, scope: !1678)
!1678 = distinct !DILexicalBlock(scope: !1679, file: !68, line: 118, column: 5)
!1679 = distinct !DILexicalBlock(scope: !1675, file: !68, line: 117, column: 5)
!1680 = !DILocation(line: 119, column: 29, scope: !1678)
!1681 = !DILocation(line: 119, column: 38, scope: !1678)
!1682 = !DILocation(line: 119, column: 36, scope: !1678)
!1683 = !DILocation(line: 119, column: 46, scope: !1678)
!1684 = !DILocalVariable(name: "t", scope: !1678, file: !68, line: 119, type: !53)
!1685 = !DILocation(line: 0, scope: !1678)
!1686 = !DILocation(line: 120, column: 21, scope: !1678)
!1687 = !DILocation(line: 120, column: 16, scope: !1678)
!1688 = !DILocation(line: 121, column: 9, scope: !1678)
!1689 = !DILocation(line: 121, column: 16, scope: !1678)
!1690 = !DILocation(line: 120, column: 9, scope: !1678)
!1691 = !DILocalVariable(name: "i", scope: !1692, file: !68, line: 124, type: !58)
!1692 = distinct !DILexicalBlock(scope: !67, file: !68, line: 124, column: 5)
!1693 = !DILocation(line: 0, scope: !1692)
!1694 = !DILocation(line: 126, column: 25, scope: !1695)
!1695 = distinct !DILexicalBlock(scope: !1696, file: !68, line: 125, column: 5)
!1696 = distinct !DILexicalBlock(scope: !1692, file: !68, line: 124, column: 5)
!1697 = !DILocation(line: 126, column: 32, scope: !1695)
!1698 = !DILocation(line: 126, column: 40, scope: !1695)
!1699 = !DILocation(line: 126, column: 38, scope: !1695)
!1700 = !DILocation(line: 126, column: 48, scope: !1695)
!1701 = !DILocalVariable(name: "t0", scope: !1695, file: !68, line: 126, type: !53)
!1702 = !DILocation(line: 0, scope: !1695)
!1703 = !DILocation(line: 127, column: 25, scope: !1695)
!1704 = !DILocation(line: 127, column: 32, scope: !1695)
!1705 = !DILocation(line: 127, column: 40, scope: !1695)
!1706 = !DILocation(line: 127, column: 38, scope: !1695)
!1707 = !DILocation(line: 127, column: 48, scope: !1695)
!1708 = !DILocalVariable(name: "t1", scope: !1695, file: !68, line: 127, type: !53)
!1709 = !DILocation(line: 128, column: 23, scope: !1695)
!1710 = !DILocation(line: 128, column: 16, scope: !1695)
!1711 = !DILocation(line: 129, column: 23, scope: !1695)
!1712 = !DILocation(line: 129, column: 9, scope: !1695)
!1713 = !DILocation(line: 129, column: 16, scope: !1695)
!1714 = !DILocation(line: 130, column: 9, scope: !1695)
!1715 = !DILocation(line: 130, column: 16, scope: !1695)
!1716 = !DILocation(line: 131, column: 9, scope: !1695)
!1717 = !DILocation(line: 131, column: 16, scope: !1695)
!1718 = !DILocation(line: 128, column: 9, scope: !1695)
!1719 = !DILocalVariable(name: "i", scope: !1720, file: !68, line: 134, type: !58)
!1720 = distinct !DILexicalBlock(scope: !67, file: !68, line: 134, column: 5)
!1721 = !DILocation(line: 0, scope: !1720)
!1722 = !DILocation(line: 136, column: 25, scope: !1723)
!1723 = distinct !DILexicalBlock(scope: !1724, file: !68, line: 135, column: 5)
!1724 = distinct !DILexicalBlock(scope: !1720, file: !68, line: 134, column: 5)
!1725 = !DILocation(line: 136, column: 32, scope: !1723)
!1726 = !DILocation(line: 136, column: 41, scope: !1723)
!1727 = !DILocation(line: 136, column: 39, scope: !1723)
!1728 = !DILocation(line: 136, column: 50, scope: !1723)
!1729 = !DILocalVariable(name: "t0", scope: !1723, file: !68, line: 136, type: !53)
!1730 = !DILocation(line: 0, scope: !1723)
!1731 = !DILocation(line: 137, column: 25, scope: !1723)
!1732 = !DILocation(line: 137, column: 32, scope: !1723)
!1733 = !DILocation(line: 137, column: 41, scope: !1723)
!1734 = !DILocation(line: 137, column: 39, scope: !1723)
!1735 = !DILocation(line: 137, column: 50, scope: !1723)
!1736 = !DILocalVariable(name: "t1", scope: !1723, file: !68, line: 137, type: !53)
!1737 = !DILocation(line: 139, column: 23, scope: !1723)
!1738 = !DILocation(line: 139, column: 17, scope: !1723)
!1739 = !DILocation(line: 140, column: 23, scope: !1723)
!1740 = !DILocation(line: 140, column: 9, scope: !1723)
!1741 = !DILocation(line: 140, column: 17, scope: !1723)
!1742 = !DILocation(line: 141, column: 9, scope: !1723)
!1743 = !DILocation(line: 141, column: 17, scope: !1723)
!1744 = !DILocation(line: 142, column: 9, scope: !1723)
!1745 = !DILocation(line: 142, column: 17, scope: !1723)
!1746 = !DILocation(line: 139, column: 9, scope: !1723)
!1747 = !DILocalVariable(name: "i", scope: !1748, file: !68, line: 145, type: !58)
!1748 = distinct !DILexicalBlock(scope: !67, file: !68, line: 145, column: 5)
!1749 = !DILocation(line: 0, scope: !1748)
!1750 = !DILocation(line: 147, column: 24, scope: !1751)
!1751 = distinct !DILexicalBlock(scope: !1752, file: !68, line: 146, column: 5)
!1752 = distinct !DILexicalBlock(scope: !1748, file: !68, line: 145, column: 5)
!1753 = !DILocation(line: 147, column: 28, scope: !1751)
!1754 = !DILocation(line: 147, column: 36, scope: !1751)
!1755 = !DILocation(line: 147, column: 44, scope: !1751)
!1756 = !DILocalVariable(name: "t", scope: !1751, file: !68, line: 147, type: !53)
!1757 = !DILocation(line: 0, scope: !1751)
!1758 = !DILocation(line: 148, column: 21, scope: !1751)
!1759 = !DILocation(line: 148, column: 16, scope: !1751)
!1760 = !DILocation(line: 149, column: 9, scope: !1751)
!1761 = !DILocation(line: 149, column: 16, scope: !1751)
!1762 = !DILocation(line: 148, column: 9, scope: !1751)
!1763 = !DILocation(line: 151, column: 1, scope: !67)
!1764 = distinct !DISubprogram(name: "mul_add_mat_x_m_mat", scope: !408, file: !408, line: 61, type: !469, scopeLine: 62, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1765 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !1764, file: !408, line: 61, type: !324)
!1766 = !DILocation(line: 0, scope: !1764)
!1767 = !DILocalVariable(name: "mat", arg: 2, scope: !1764, file: !408, line: 61, type: !90)
!1768 = !DILocalVariable(name: "bs_mat", arg: 3, scope: !1764, file: !408, line: 61, type: !411)
!1769 = !DILocalVariable(name: "acc", arg: 4, scope: !1764, file: !408, line: 61, type: !52)
!1770 = !DILocalVariable(name: "mat_rows", arg: 5, scope: !1764, file: !408, line: 62, type: !324)
!1771 = !DILocalVariable(name: "mat_cols", arg: 6, scope: !1764, file: !408, line: 62, type: !324)
!1772 = !DILocalVariable(name: "bs_mat_cols", arg: 7, scope: !1764, file: !408, line: 62, type: !324)
!1773 = !DILocalVariable(name: "r", scope: !1774, file: !408, line: 64, type: !86)
!1774 = distinct !DILexicalBlock(scope: !1764, file: !408, line: 64, column: 5)
!1775 = !DILocation(line: 0, scope: !1774)
!1776 = !DILocation(line: 64, column: 10, scope: !1774)
!1777 = !DILocation(line: 64, scope: !1774)
!1778 = !DILocation(line: 64, column: 23, scope: !1779)
!1779 = distinct !DILexicalBlock(scope: !1774, file: !408, line: 64, column: 5)
!1780 = !DILocation(line: 64, column: 5, scope: !1774)
!1781 = !DILocation(line: 65, scope: !1782)
!1782 = distinct !DILexicalBlock(scope: !1783, file: !408, line: 65, column: 9)
!1783 = distinct !DILexicalBlock(scope: !1779, file: !408, line: 64, column: 40)
!1784 = !DILocalVariable(name: "c", scope: !1782, file: !408, line: 65, type: !86)
!1785 = !DILocation(line: 0, scope: !1782)
!1786 = !DILocation(line: 65, column: 27, scope: !1787)
!1787 = distinct !DILexicalBlock(scope: !1782, file: !408, line: 65, column: 9)
!1788 = !DILocation(line: 65, column: 9, scope: !1782)
!1789 = !DILocation(line: 66, scope: !1790)
!1790 = distinct !DILexicalBlock(scope: !1791, file: !408, line: 66, column: 13)
!1791 = distinct !DILexicalBlock(scope: !1787, file: !408, line: 65, column: 44)
!1792 = !DILocalVariable(name: "k", scope: !1790, file: !408, line: 66, type: !86)
!1793 = !DILocation(line: 0, scope: !1790)
!1794 = !DILocation(line: 66, column: 31, scope: !1795)
!1795 = distinct !DILexicalBlock(scope: !1790, file: !408, line: 66, column: 13)
!1796 = !DILocation(line: 66, column: 13, scope: !1790)
!1797 = !DILocation(line: 67, column: 70, scope: !1798)
!1798 = distinct !DILexicalBlock(scope: !1795, file: !408, line: 66, column: 54)
!1799 = !DILocation(line: 67, column: 84, scope: !1798)
!1800 = !DILocation(line: 67, column: 65, scope: !1798)
!1801 = !DILocation(line: 67, column: 51, scope: !1798)
!1802 = !DILocation(line: 67, column: 96, scope: !1798)
!1803 = !DILocation(line: 67, column: 90, scope: !1798)
!1804 = !DILocation(line: 67, column: 136, scope: !1798)
!1805 = !DILocation(line: 67, column: 150, scope: !1798)
!1806 = !DILocation(line: 67, column: 131, scope: !1798)
!1807 = !DILocation(line: 67, column: 117, scope: !1798)
!1808 = !DILocation(line: 67, column: 17, scope: !1798)
!1809 = !DILocation(line: 66, column: 48, scope: !1795)
!1810 = !DILocation(line: 66, column: 13, scope: !1795)
!1811 = distinct !{!1811, !1796, !1812, !388}
!1812 = !DILocation(line: 68, column: 13, scope: !1790)
!1813 = !DILocation(line: 65, column: 40, scope: !1787)
!1814 = !DILocation(line: 65, column: 9, scope: !1787)
!1815 = distinct !{!1815, !1788, !1816, !388}
!1816 = !DILocation(line: 69, column: 9, scope: !1782)
!1817 = !DILocation(line: 64, column: 36, scope: !1779)
!1818 = !DILocation(line: 64, column: 5, scope: !1779)
!1819 = distinct !{!1819, !1780, !1820, !388}
!1820 = !DILocation(line: 70, column: 5, scope: !1774)
!1821 = !DILocation(line: 71, column: 1, scope: !1764)
!1822 = distinct !DISubprogram(name: "P1_times_Vt", scope: !408, file: !408, line: 82, type: !459, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1823 = !DILocalVariable(name: "p", arg: 1, scope: !1822, file: !408, line: 82, type: !264)
!1824 = !DILocation(line: 0, scope: !1822)
!1825 = !DILocalVariable(name: "P1", arg: 2, scope: !1822, file: !408, line: 82, type: !411)
!1826 = !DILocalVariable(name: "V", arg: 3, scope: !1822, file: !408, line: 82, type: !90)
!1827 = !DILocalVariable(name: "acc", arg: 4, scope: !1822, file: !408, line: 82, type: !52)
!1828 = !DILocation(line: 86, column: 5, scope: !1822)
!1829 = !DILocation(line: 87, column: 1, scope: !1822)
!1830 = distinct !DISubprogram(name: "mul_add_m_upper_triangular_mat_x_mat_trans", scope: !408, file: !408, line: 32, type: !599, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1831 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !1830, file: !408, line: 32, type: !324)
!1832 = !DILocation(line: 0, scope: !1830)
!1833 = !DILocalVariable(name: "bs_mat", arg: 2, scope: !1830, file: !408, line: 32, type: !411)
!1834 = !DILocalVariable(name: "mat", arg: 3, scope: !1830, file: !408, line: 32, type: !90)
!1835 = !DILocalVariable(name: "acc", arg: 4, scope: !1830, file: !408, line: 32, type: !52)
!1836 = !DILocalVariable(name: "bs_mat_rows", arg: 5, scope: !1830, file: !408, line: 33, type: !324)
!1837 = !DILocalVariable(name: "bs_mat_cols", arg: 6, scope: !1830, file: !408, line: 33, type: !324)
!1838 = !DILocalVariable(name: "mat_rows", arg: 7, scope: !1830, file: !408, line: 33, type: !324)
!1839 = !DILocalVariable(name: "triangular", arg: 8, scope: !1830, file: !408, line: 33, type: !324)
!1840 = !DILocalVariable(name: "bs_mat_entries_used", scope: !1830, file: !408, line: 34, type: !86)
!1841 = !DILocalVariable(name: "r", scope: !1842, file: !408, line: 35, type: !86)
!1842 = distinct !DILexicalBlock(scope: !1830, file: !408, line: 35, column: 5)
!1843 = !DILocation(line: 0, scope: !1842)
!1844 = !DILocation(line: 35, column: 10, scope: !1842)
!1845 = !DILocation(line: 34, column: 9, scope: !1830)
!1846 = !DILocation(line: 35, scope: !1842)
!1847 = !DILocation(line: 35, column: 23, scope: !1848)
!1848 = distinct !DILexicalBlock(scope: !1842, file: !408, line: 35, column: 5)
!1849 = !DILocation(line: 35, column: 5, scope: !1842)
!1850 = !DILocation(line: 36, column: 33, scope: !1851)
!1851 = distinct !DILexicalBlock(scope: !1852, file: !408, line: 36, column: 9)
!1852 = distinct !DILexicalBlock(scope: !1848, file: !408, line: 35, column: 43)
!1853 = !DILocalVariable(name: "c", scope: !1851, file: !408, line: 36, type: !86)
!1854 = !DILocation(line: 0, scope: !1851)
!1855 = !DILocation(line: 36, column: 14, scope: !1851)
!1856 = !DILocation(line: 36, scope: !1851)
!1857 = !DILocation(line: 36, column: 40, scope: !1858)
!1858 = distinct !DILexicalBlock(scope: !1851, file: !408, line: 36, column: 9)
!1859 = !DILocation(line: 36, column: 9, scope: !1851)
!1860 = !DILocation(line: 37, scope: !1861)
!1861 = distinct !DILexicalBlock(scope: !1862, file: !408, line: 37, column: 13)
!1862 = distinct !DILexicalBlock(scope: !1858, file: !408, line: 36, column: 60)
!1863 = !DILocalVariable(name: "k", scope: !1861, file: !408, line: 37, type: !86)
!1864 = !DILocation(line: 0, scope: !1861)
!1865 = !DILocation(line: 37, column: 31, scope: !1866)
!1866 = distinct !DILexicalBlock(scope: !1861, file: !408, line: 37, column: 13)
!1867 = !DILocation(line: 37, column: 13, scope: !1861)
!1868 = !DILocation(line: 38, column: 65, scope: !1869)
!1869 = distinct !DILexicalBlock(scope: !1866, file: !408, line: 37, column: 51)
!1870 = !DILocation(line: 38, column: 51, scope: !1869)
!1871 = !DILocation(line: 38, column: 94, scope: !1869)
!1872 = !DILocation(line: 38, column: 88, scope: !1869)
!1873 = !DILocation(line: 38, column: 137, scope: !1869)
!1874 = !DILocation(line: 38, column: 148, scope: !1869)
!1875 = !DILocation(line: 38, column: 132, scope: !1869)
!1876 = !DILocation(line: 38, column: 118, scope: !1869)
!1877 = !DILocation(line: 38, column: 17, scope: !1869)
!1878 = !DILocation(line: 37, column: 45, scope: !1866)
!1879 = !DILocation(line: 37, column: 13, scope: !1866)
!1880 = distinct !{!1880, !1867, !1881, !388}
!1881 = !DILocation(line: 39, column: 13, scope: !1861)
!1882 = !DILocation(line: 40, column: 33, scope: !1862)
!1883 = !DILocation(line: 36, column: 56, scope: !1858)
!1884 = !DILocation(line: 36, column: 9, scope: !1858)
!1885 = distinct !{!1885, !1859, !1886, !388}
!1886 = !DILocation(line: 41, column: 9, scope: !1851)
!1887 = !DILocation(line: 35, column: 39, scope: !1848)
!1888 = !DILocation(line: 35, column: 5, scope: !1848)
!1889 = distinct !{!1889, !1849, !1890, !388}
!1890 = !DILocation(line: 42, column: 5, scope: !1842)
!1891 = !DILocation(line: 43, column: 1, scope: !1830)
!1892 = distinct !DISubprogram(name: "pqmayo_MAYO_5_ref_mayo_sign", scope: !68, file: !68, line: 502, type: !806, scopeLine: 504, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1893 = !DILocalVariable(name: "p", arg: 1, scope: !1892, file: !68, line: 502, type: !264)
!1894 = !DILocation(line: 0, scope: !1892)
!1895 = !DILocalVariable(name: "sm", arg: 2, scope: !1892, file: !68, line: 502, type: !61)
!1896 = !DILocalVariable(name: "smlen", arg: 3, scope: !1892, file: !68, line: 503, type: !808)
!1897 = !DILocalVariable(name: "m", arg: 4, scope: !1892, file: !68, line: 503, type: !90)
!1898 = !DILocalVariable(name: "mlen", arg: 5, scope: !1892, file: !68, line: 504, type: !58)
!1899 = !DILocalVariable(name: "csk", arg: 6, scope: !1892, file: !68, line: 504, type: !90)
!1900 = !DILocalVariable(name: "ret", scope: !1892, file: !68, line: 505, type: !86)
!1901 = !DILocalVariable(name: "param_sig_bytes", scope: !1892, file: !68, line: 506, type: !324)
!1902 = !DILocation(line: 508, column: 16, scope: !1892)
!1903 = !DILocation(line: 508, column: 5, scope: !1892)
!1904 = !DILocation(line: 509, column: 50, scope: !1892)
!1905 = !DILocalVariable(name: "siglen", scope: !1892, file: !68, line: 507, type: !58)
!1906 = !DILocation(line: 509, column: 11, scope: !1892)
!1907 = !DILocation(line: 510, column: 13, scope: !1908)
!1908 = distinct !DILexicalBlock(scope: !1892, file: !68, line: 510, column: 9)
!1909 = !DILocation(line: 510, column: 24, scope: !1908)
!1910 = !DILocation(line: 511, column: 23, scope: !1911)
!1911 = distinct !DILexicalBlock(scope: !1908, file: !68, line: 510, column: 62)
!1912 = !DILocation(line: 511, column: 30, scope: !1911)
!1913 = !DILocation(line: 511, column: 9, scope: !1911)
!1914 = !DILocation(line: 512, column: 9, scope: !1911)
!1915 = !DILocation(line: 515, column: 14, scope: !1892)
!1916 = !DILocation(line: 515, column: 21, scope: !1892)
!1917 = !DILocation(line: 515, column: 12, scope: !1892)
!1918 = !DILocation(line: 515, column: 5, scope: !1892)
!1919 = !DILabel(scope: !1892, name: "err", file: !68, line: 516)
!1920 = !DILocation(line: 516, column: 1, scope: !1892)
!1921 = !DILocation(line: 517, column: 5, scope: !1892)
!1922 = distinct !DISubprogram(name: "pqmayo_MAYO_5_ref_mayo_open", scope: !68, file: !68, line: 520, type: !806, scopeLine: 522, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1923 = !DILocalVariable(name: "p", arg: 1, scope: !1922, file: !68, line: 520, type: !264)
!1924 = !DILocation(line: 0, scope: !1922)
!1925 = !DILocalVariable(name: "m", arg: 2, scope: !1922, file: !68, line: 520, type: !61)
!1926 = !DILocalVariable(name: "mlen", arg: 3, scope: !1922, file: !68, line: 521, type: !808)
!1927 = !DILocalVariable(name: "sm", arg: 4, scope: !1922, file: !68, line: 521, type: !90)
!1928 = !DILocalVariable(name: "smlen", arg: 5, scope: !1922, file: !68, line: 522, type: !58)
!1929 = !DILocalVariable(name: "pk", arg: 6, scope: !1922, file: !68, line: 522, type: !90)
!1930 = !DILocalVariable(name: "param_sig_bytes", scope: !1922, file: !68, line: 523, type: !324)
!1931 = !DILocation(line: 524, column: 15, scope: !1932)
!1932 = distinct !DILexicalBlock(scope: !1922, file: !68, line: 524, column: 9)
!1933 = !DILocation(line: 527, column: 36, scope: !1922)
!1934 = !DILocation(line: 527, column: 61, scope: !1922)
!1935 = !DILocation(line: 527, column: 18, scope: !1922)
!1936 = !DILocalVariable(name: "result", scope: !1922, file: !68, line: 527, type: !86)
!1937 = !DILocation(line: 530, column: 16, scope: !1938)
!1938 = distinct !DILexicalBlock(scope: !1922, file: !68, line: 530, column: 9)
!1939 = !DILocation(line: 531, column: 23, scope: !1940)
!1940 = distinct !DILexicalBlock(scope: !1938, file: !68, line: 530, column: 28)
!1941 = !DILocation(line: 531, column: 15, scope: !1940)
!1942 = !DILocation(line: 532, column: 23, scope: !1940)
!1943 = !DILocation(line: 532, column: 9, scope: !1940)
!1944 = !DILocation(line: 533, column: 5, scope: !1940)
!1945 = !DILocation(line: 536, column: 1, scope: !1922)
!1946 = distinct !DISubprogram(name: "pqmayo_MAYO_5_ref_mayo_verify", scope: !68, file: !68, line: 617, type: !1947, scopeLine: 619, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1947 = !DISubroutineType(types: !1948)
!1948 = !{!86, !264, !90, !58, !90, !90}
!1949 = !DILocalVariable(name: "p", arg: 1, scope: !1946, file: !68, line: 617, type: !264)
!1950 = !DILocation(line: 0, scope: !1946)
!1951 = !DILocalVariable(name: "m", arg: 2, scope: !1946, file: !68, line: 617, type: !90)
!1952 = !DILocalVariable(name: "mlen", arg: 3, scope: !1946, file: !68, line: 618, type: !58)
!1953 = !DILocalVariable(name: "sig", arg: 4, scope: !1946, file: !68, line: 618, type: !90)
!1954 = !DILocalVariable(name: "cpk", arg: 5, scope: !1946, file: !68, line: 619, type: !90)
!1955 = !DILocalVariable(name: "tEnc", scope: !1946, file: !68, line: 620, type: !818)
!1956 = !DILocation(line: 620, column: 19, scope: !1946)
!1957 = !DILocalVariable(name: "t", scope: !1946, file: !68, line: 621, type: !823)
!1958 = !DILocation(line: 621, column: 19, scope: !1946)
!1959 = !DILocalVariable(name: "y", scope: !1946, file: !68, line: 622, type: !1960)
!1960 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 2272, elements: !1961)
!1961 = !{!1962}
!1962 = !DISubrange(count: 284)
!1963 = !DILocation(line: 622, column: 19, scope: !1946)
!1964 = !DILocalVariable(name: "s", scope: !1946, file: !68, line: 623, type: !847)
!1965 = !DILocation(line: 623, column: 19, scope: !1946)
!1966 = !DILocalVariable(name: "pk", scope: !1946, file: !68, line: 624, type: !1967)
!1967 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 6874560, elements: !1968)
!1968 = !{!1969}
!1969 = !DISubrange(count: 107415)
!1970 = !DILocation(line: 624, column: 14, scope: !1946)
!1971 = !DILocalVariable(name: "tmp", scope: !1946, file: !68, line: 625, type: !1972)
!1972 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 832, elements: !1973)
!1973 = !{!1974}
!1974 = !DISubrange(count: 104)
!1975 = !DILocation(line: 625, column: 19, scope: !1946)
!1976 = !DILocalVariable(name: "param_m", scope: !1946, file: !68, line: 627, type: !324)
!1977 = !DILocalVariable(name: "param_n", scope: !1946, file: !68, line: 628, type: !324)
!1978 = !DILocalVariable(name: "param_k", scope: !1946, file: !68, line: 629, type: !324)
!1979 = !DILocalVariable(name: "param_m_bytes", scope: !1946, file: !68, line: 630, type: !324)
!1980 = !DILocalVariable(name: "param_sig_bytes", scope: !1946, file: !68, line: 631, type: !324)
!1981 = !DILocalVariable(name: "param_digest_bytes", scope: !1946, file: !68, line: 632, type: !324)
!1982 = !DILocalVariable(name: "param_salt_bytes", scope: !1946, file: !68, line: 633, type: !324)
!1983 = !DILocation(line: 635, column: 15, scope: !1946)
!1984 = !DILocalVariable(name: "ret", scope: !1946, file: !68, line: 635, type: !86)
!1985 = !DILocation(line: 636, column: 13, scope: !1986)
!1986 = distinct !DILexicalBlock(scope: !1946, file: !68, line: 636, column: 9)
!1987 = !DILocalVariable(name: "P1", scope: !1946, file: !68, line: 640, type: !52)
!1988 = !DILocation(line: 641, column: 23, scope: !1946)
!1989 = !DILocalVariable(name: "P2", scope: !1946, file: !68, line: 641, type: !52)
!1990 = !DILocation(line: 642, column: 23, scope: !1946)
!1991 = !DILocalVariable(name: "P3", scope: !1946, file: !68, line: 642, type: !52)
!1992 = !DILocation(line: 657, column: 5, scope: !1946)
!1993 = !DILocation(line: 660, column: 16, scope: !1946)
!1994 = !DILocation(line: 660, column: 60, scope: !1946)
!1995 = !DILocation(line: 660, column: 5, scope: !1946)
!1996 = !DILocation(line: 662, column: 5, scope: !1946)
!1997 = !DILocation(line: 663, column: 5, scope: !1946)
!1998 = !DILocation(line: 666, column: 5, scope: !1946)
!1999 = !DILocation(line: 668, column: 5, scope: !1946)
!2000 = !DILocation(line: 670, column: 9, scope: !2001)
!2001 = distinct !DILexicalBlock(scope: !1946, file: !68, line: 670, column: 9)
!2002 = !DILocation(line: 670, column: 31, scope: !2001)
!2003 = !DILocation(line: 674, column: 1, scope: !1946)
!2004 = distinct !DISubprogram(name: "pqmayo_MAYO_5_ref_mayo_expand_pk", scope: !68, file: !68, line: 608, type: !2005, scopeLine: 609, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2005 = !DISubroutineType(types: !2006)
!2006 = !{!86, !264, !90, !52}
!2007 = !DILocalVariable(name: "p", arg: 1, scope: !2004, file: !68, line: 608, type: !264)
!2008 = !DILocation(line: 0, scope: !2004)
!2009 = !DILocalVariable(name: "cpk", arg: 2, scope: !2004, file: !68, line: 608, type: !90)
!2010 = !DILocalVariable(name: "pk", arg: 3, scope: !2004, file: !68, line: 609, type: !52)
!2011 = !DILocation(line: 610, column: 5, scope: !2004)
!2012 = !DILocation(line: 612, column: 23, scope: !2004)
!2013 = !DILocation(line: 612, column: 72, scope: !2004)
!2014 = !DILocation(line: 612, column: 5, scope: !2004)
!2015 = !DILocation(line: 614, column: 5, scope: !2004)
!2016 = distinct !DISubprogram(name: "eval_public_map", scope: !68, file: !68, line: 288, type: !2017, scopeLine: 288, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2017 = !DISubroutineType(types: !2018)
!2018 = !{null, !264, !90, !411, !411, !411, !61}
!2019 = !DILocalVariable(name: "p", arg: 1, scope: !2016, file: !68, line: 288, type: !264)
!2020 = !DILocation(line: 0, scope: !2016)
!2021 = !DILocalVariable(name: "s", arg: 2, scope: !2016, file: !68, line: 288, type: !90)
!2022 = !DILocalVariable(name: "P1", arg: 3, scope: !2016, file: !68, line: 288, type: !411)
!2023 = !DILocalVariable(name: "P2", arg: 4, scope: !2016, file: !68, line: 288, type: !411)
!2024 = !DILocalVariable(name: "P3", arg: 5, scope: !2016, file: !68, line: 288, type: !411)
!2025 = !DILocalVariable(name: "eval", arg: 6, scope: !2016, file: !68, line: 288, type: !61)
!2026 = !DILocalVariable(name: "SPS", scope: !2016, file: !68, line: 289, type: !316)
!2027 = !DILocation(line: 289, column: 14, scope: !2016)
!2028 = !DILocation(line: 291, column: 5, scope: !2016)
!2029 = !DILocalVariable(name: "zero", scope: !2016, file: !68, line: 292, type: !823)
!2030 = !DILocation(line: 292, column: 19, scope: !2016)
!2031 = !DILocation(line: 293, column: 5, scope: !2016)
!2032 = !DILocation(line: 294, column: 1, scope: !2016)
!2033 = distinct !DISubprogram(name: "m_calculate_PS_SPS", scope: !408, file: !408, line: 277, type: !2034, scopeLine: 278, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2034 = !DISubroutineType(types: !2035)
!2035 = !{null, !264, !411, !411, !411, !90, !52}
!2036 = !DILocalVariable(name: "p", arg: 1, scope: !2033, file: !408, line: 277, type: !264)
!2037 = !DILocation(line: 0, scope: !2033)
!2038 = !DILocalVariable(name: "P1", arg: 2, scope: !2033, file: !408, line: 277, type: !411)
!2039 = !DILocalVariable(name: "P2", arg: 3, scope: !2033, file: !408, line: 277, type: !411)
!2040 = !DILocalVariable(name: "P3", arg: 4, scope: !2033, file: !408, line: 277, type: !411)
!2041 = !DILocalVariable(name: "s", arg: 5, scope: !2033, file: !408, line: 277, type: !90)
!2042 = !DILocalVariable(name: "SPS", arg: 6, scope: !2033, file: !408, line: 278, type: !52)
!2043 = !DILocalVariable(name: "PS", scope: !2033, file: !408, line: 286, type: !2044)
!2044 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 1064448, elements: !2045)
!2045 = !{!2046}
!2046 = !DISubrange(count: 16632)
!2047 = !DILocation(line: 286, column: 14, scope: !2033)
!2048 = !DILocation(line: 287, column: 5, scope: !2033)
!2049 = !DILocation(line: 290, column: 5, scope: !2033)
!2050 = !DILocation(line: 292, column: 1, scope: !2033)
!2051 = distinct !DISubprogram(name: "mayo_generic_m_calculate_PS", scope: !408, file: !408, line: 151, type: !2052, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2052 = !DISubroutineType(types: !2053)
!2053 = !{null, !411, !411, !411, !90, !324, !324, !324, !324, !52}
!2054 = !DILocalVariable(name: "P1", arg: 1, scope: !2051, file: !408, line: 151, type: !411)
!2055 = !DILocation(line: 0, scope: !2051)
!2056 = !DILocalVariable(name: "P2", arg: 2, scope: !2051, file: !408, line: 151, type: !411)
!2057 = !DILocalVariable(name: "P3", arg: 3, scope: !2051, file: !408, line: 151, type: !411)
!2058 = !DILocalVariable(name: "S", arg: 4, scope: !2051, file: !408, line: 151, type: !90)
!2059 = !DILocalVariable(name: "m", arg: 5, scope: !2051, file: !408, line: 152, type: !324)
!2060 = !DILocalVariable(name: "v", arg: 6, scope: !2051, file: !408, line: 152, type: !324)
!2061 = !DILocalVariable(name: "o", arg: 7, scope: !2051, file: !408, line: 152, type: !324)
!2062 = !DILocalVariable(name: "k", arg: 8, scope: !2051, file: !408, line: 152, type: !324)
!2063 = !DILocalVariable(name: "PS", arg: 9, scope: !2051, file: !408, line: 152, type: !52)
!2064 = !DILocation(line: 154, column: 21, scope: !2051)
!2065 = !DILocalVariable(name: "n", scope: !2051, file: !408, line: 154, type: !324)
!2066 = !DILocation(line: 155, column: 32, scope: !2051)
!2067 = !DILocation(line: 155, column: 37, scope: !2051)
!2068 = !DILocalVariable(name: "m_vec_limbs", scope: !2051, file: !408, line: 155, type: !324)
!2069 = !DILocalVariable(name: "accumulator", scope: !2051, file: !408, line: 157, type: !2070)
!2070 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 17031168, elements: !2071)
!2071 = !{!2072}
!2072 = !DISubrange(count: 266112)
!2073 = !DILocation(line: 157, column: 14, scope: !2051)
!2074 = !DILocalVariable(name: "P1_used", scope: !2051, file: !408, line: 158, type: !86)
!2075 = !DILocalVariable(name: "row", scope: !2076, file: !408, line: 159, type: !86)
!2076 = distinct !DILexicalBlock(scope: !2051, file: !408, line: 159, column: 5)
!2077 = !DILocation(line: 0, scope: !2076)
!2078 = !DILocation(line: 159, column: 10, scope: !2076)
!2079 = !DILocation(line: 158, column: 9, scope: !2051)
!2080 = !DILocation(line: 159, scope: !2076)
!2081 = !DILocation(line: 159, column: 27, scope: !2082)
!2082 = distinct !DILexicalBlock(scope: !2076, file: !408, line: 159, column: 5)
!2083 = !DILocation(line: 159, column: 5, scope: !2076)
!2084 = !DILocation(line: 160, column: 9, scope: !2085)
!2085 = distinct !DILexicalBlock(scope: !2086, file: !408, line: 160, column: 9)
!2086 = distinct !DILexicalBlock(scope: !2082, file: !408, line: 159, column: 39)
!2087 = !DILocation(line: 175, column: 5, scope: !2088)
!2088 = distinct !DILexicalBlock(scope: !2051, file: !408, line: 175, column: 5)
!2089 = !DILocation(line: 160, scope: !2085)
!2090 = !DILocalVariable(name: "j", scope: !2085, file: !408, line: 160, type: !86)
!2091 = !DILocation(line: 0, scope: !2085)
!2092 = !DILocation(line: 160, column: 29, scope: !2093)
!2093 = distinct !DILexicalBlock(scope: !2085, file: !408, line: 160, column: 9)
!2094 = !DILocation(line: 161, scope: !2095)
!2095 = distinct !DILexicalBlock(scope: !2096, file: !408, line: 161, column: 13)
!2096 = distinct !DILexicalBlock(scope: !2093, file: !408, line: 160, column: 39)
!2097 = !DILocalVariable(name: "col", scope: !2095, file: !408, line: 161, type: !86)
!2098 = !DILocation(line: 0, scope: !2095)
!2099 = !DILocation(line: 161, column: 35, scope: !2100)
!2100 = distinct !DILexicalBlock(scope: !2095, file: !408, line: 161, column: 13)
!2101 = !DILocation(line: 161, column: 13, scope: !2095)
!2102 = !DILocation(line: 162, column: 54, scope: !2103)
!2103 = distinct !DILexicalBlock(scope: !2100, file: !408, line: 161, column: 47)
!2104 = !DILocation(line: 162, column: 43, scope: !2103)
!2105 = !DILocation(line: 162, column: 91, scope: !2103)
!2106 = !DILocation(line: 162, column: 95, scope: !2103)
!2107 = !DILocation(line: 162, column: 102, scope: !2103)
!2108 = !DILocation(line: 162, column: 115, scope: !2103)
!2109 = !DILocation(line: 162, column: 109, scope: !2103)
!2110 = !DILocation(line: 162, column: 107, scope: !2103)
!2111 = !DILocation(line: 162, column: 125, scope: !2103)
!2112 = !DILocation(line: 162, column: 82, scope: !2103)
!2113 = !DILocation(line: 162, column: 17, scope: !2103)
!2114 = !DILocation(line: 161, column: 43, scope: !2100)
!2115 = !DILocation(line: 161, column: 13, scope: !2100)
!2116 = distinct !{!2116, !2101, !2117, !388}
!2117 = !DILocation(line: 163, column: 13, scope: !2095)
!2118 = !DILocation(line: 164, column: 21, scope: !2096)
!2119 = !DILocation(line: 160, column: 35, scope: !2093)
!2120 = !DILocation(line: 160, column: 9, scope: !2093)
!2121 = distinct !{!2121, !2084, !2122, !388}
!2122 = !DILocation(line: 165, column: 9, scope: !2085)
!2123 = !DILocation(line: 167, scope: !2124)
!2124 = distinct !DILexicalBlock(scope: !2086, file: !408, line: 167, column: 9)
!2125 = !DILocalVariable(name: "j", scope: !2124, file: !408, line: 167, type: !86)
!2126 = !DILocation(line: 0, scope: !2124)
!2127 = !DILocation(line: 167, column: 27, scope: !2128)
!2128 = distinct !DILexicalBlock(scope: !2124, file: !408, line: 167, column: 9)
!2129 = !DILocation(line: 167, column: 9, scope: !2124)
!2130 = !DILocation(line: 168, scope: !2131)
!2131 = distinct !DILexicalBlock(scope: !2132, file: !408, line: 168, column: 13)
!2132 = distinct !DILexicalBlock(scope: !2128, file: !408, line: 167, column: 37)
!2133 = !DILocalVariable(name: "col", scope: !2131, file: !408, line: 168, type: !86)
!2134 = !DILocation(line: 0, scope: !2131)
!2135 = !DILocation(line: 168, column: 35, scope: !2136)
!2136 = distinct !DILexicalBlock(scope: !2131, file: !408, line: 168, column: 13)
!2137 = !DILocation(line: 168, column: 13, scope: !2131)
!2138 = !DILocation(line: 169, column: 50, scope: !2139)
!2139 = distinct !DILexicalBlock(scope: !2136, file: !408, line: 168, column: 47)
!2140 = !DILocation(line: 169, column: 54, scope: !2139)
!2141 = !DILocation(line: 169, column: 58, scope: !2139)
!2142 = !DILocation(line: 169, column: 43, scope: !2139)
!2143 = !DILocation(line: 169, column: 93, scope: !2139)
!2144 = !DILocation(line: 169, column: 97, scope: !2139)
!2145 = !DILocation(line: 169, column: 104, scope: !2139)
!2146 = !DILocation(line: 169, column: 118, scope: !2139)
!2147 = !DILocation(line: 169, column: 111, scope: !2139)
!2148 = !DILocation(line: 169, column: 109, scope: !2139)
!2149 = !DILocation(line: 169, column: 133, scope: !2139)
!2150 = !DILocation(line: 169, column: 84, scope: !2139)
!2151 = !DILocation(line: 169, column: 17, scope: !2139)
!2152 = !DILocation(line: 168, column: 43, scope: !2136)
!2153 = !DILocation(line: 168, column: 13, scope: !2136)
!2154 = distinct !{!2154, !2137, !2155, !388}
!2155 = !DILocation(line: 170, column: 13, scope: !2131)
!2156 = !DILocation(line: 167, column: 33, scope: !2128)
!2157 = !DILocation(line: 167, column: 9, scope: !2128)
!2158 = distinct !{!2158, !2129, !2159, !388}
!2159 = !DILocation(line: 171, column: 9, scope: !2124)
!2160 = !DILocation(line: 159, column: 35, scope: !2082)
!2161 = !DILocation(line: 159, column: 5, scope: !2082)
!2162 = distinct !{!2162, !2083, !2163, !388}
!2163 = !DILocation(line: 172, column: 5, scope: !2076)
!2164 = !DILocation(line: 174, column: 9, scope: !2051)
!2165 = !DILocation(line: 175, scope: !2088)
!2166 = !DILocalVariable(name: "row", scope: !2088, file: !408, line: 175, type: !86)
!2167 = !DILocation(line: 0, scope: !2088)
!2168 = !DILocalVariable(name: "P3_used", scope: !2051, file: !408, line: 174, type: !86)
!2169 = !DILocation(line: 175, column: 27, scope: !2170)
!2170 = distinct !DILexicalBlock(scope: !2088, file: !408, line: 175, column: 5)
!2171 = !DILocation(line: 186, column: 5, scope: !2051)
!2172 = !DILocation(line: 176, scope: !2173)
!2173 = distinct !DILexicalBlock(scope: !2174, file: !408, line: 176, column: 9)
!2174 = distinct !DILexicalBlock(scope: !2170, file: !408, line: 175, column: 39)
!2175 = !DILocalVariable(name: "j", scope: !2173, file: !408, line: 176, type: !86)
!2176 = !DILocation(line: 0, scope: !2173)
!2177 = !DILocation(line: 176, column: 29, scope: !2178)
!2178 = distinct !DILexicalBlock(scope: !2173, file: !408, line: 176, column: 9)
!2179 = !DILocation(line: 176, column: 9, scope: !2173)
!2180 = !DILocation(line: 177, scope: !2181)
!2181 = distinct !DILexicalBlock(scope: !2182, file: !408, line: 177, column: 13)
!2182 = distinct !DILexicalBlock(scope: !2178, file: !408, line: 176, column: 39)
!2183 = !DILocalVariable(name: "col", scope: !2181, file: !408, line: 177, type: !86)
!2184 = !DILocation(line: 0, scope: !2181)
!2185 = !DILocation(line: 177, column: 35, scope: !2186)
!2186 = distinct !DILexicalBlock(scope: !2181, file: !408, line: 177, column: 13)
!2187 = !DILocation(line: 177, column: 13, scope: !2181)
!2188 = !DILocation(line: 178, column: 53, scope: !2189)
!2189 = distinct !DILexicalBlock(scope: !2186, file: !408, line: 177, column: 47)
!2190 = !DILocation(line: 178, column: 43, scope: !2189)
!2191 = !DILocation(line: 178, column: 89, scope: !2189)
!2192 = !DILocation(line: 178, column: 93, scope: !2189)
!2193 = !DILocation(line: 178, column: 100, scope: !2189)
!2194 = !DILocation(line: 178, column: 113, scope: !2189)
!2195 = !DILocation(line: 178, column: 107, scope: !2189)
!2196 = !DILocation(line: 178, column: 105, scope: !2189)
!2197 = !DILocation(line: 178, column: 123, scope: !2189)
!2198 = !DILocation(line: 178, column: 80, scope: !2189)
!2199 = !DILocation(line: 178, column: 17, scope: !2189)
!2200 = !DILocation(line: 177, column: 43, scope: !2186)
!2201 = !DILocation(line: 177, column: 13, scope: !2186)
!2202 = distinct !{!2202, !2187, !2203, !388}
!2203 = !DILocation(line: 179, column: 13, scope: !2181)
!2204 = !DILocation(line: 180, column: 21, scope: !2182)
!2205 = !DILocation(line: 176, column: 35, scope: !2178)
!2206 = !DILocation(line: 176, column: 9, scope: !2178)
!2207 = distinct !{!2207, !2179, !2208, !388}
!2208 = !DILocation(line: 181, column: 9, scope: !2173)
!2209 = !DILocation(line: 175, column: 35, scope: !2170)
!2210 = !DILocation(line: 175, column: 5, scope: !2170)
!2211 = distinct !{!2211, !2087, !2212, !388}
!2212 = !DILocation(line: 182, column: 5, scope: !2088)
!2213 = !DILocalVariable(name: "i", scope: !2051, file: !408, line: 185, type: !86)
!2214 = !DILocation(line: 186, column: 14, scope: !2051)
!2215 = !DILocation(line: 187, column: 58, scope: !2216)
!2216 = distinct !DILexicalBlock(scope: !2051, file: !408, line: 186, column: 23)
!2217 = !DILocation(line: 187, column: 63, scope: !2216)
!2218 = !DILocation(line: 187, column: 54, scope: !2216)
!2219 = !DILocation(line: 187, column: 85, scope: !2216)
!2220 = !DILocation(line: 187, column: 81, scope: !2216)
!2221 = !DILocation(line: 187, column: 9, scope: !2216)
!2222 = !DILocation(line: 188, column: 10, scope: !2216)
!2223 = distinct !{!2223, !2171, !2224, !388}
!2224 = !DILocation(line: 189, column: 5, scope: !2051)
!2225 = !DILocation(line: 191, column: 1, scope: !2051)
!2226 = distinct !DISubprogram(name: "mayo_generic_m_calculate_SPS", scope: !408, file: !408, line: 195, type: !2227, scopeLine: 195, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2227 = !DISubroutineType(types: !2228)
!2228 = !{null, !411, !90, !86, !86, !86, !52}
!2229 = !DILocalVariable(name: "PS", arg: 1, scope: !2226, file: !408, line: 195, type: !411)
!2230 = !DILocation(line: 0, scope: !2226)
!2231 = !DILocalVariable(name: "S", arg: 2, scope: !2226, file: !408, line: 195, type: !90)
!2232 = !DILocalVariable(name: "m", arg: 3, scope: !2226, file: !408, line: 195, type: !86)
!2233 = !DILocalVariable(name: "k", arg: 4, scope: !2226, file: !408, line: 195, type: !86)
!2234 = !DILocalVariable(name: "n", arg: 5, scope: !2226, file: !408, line: 195, type: !86)
!2235 = !DILocalVariable(name: "SPS", arg: 6, scope: !2226, file: !408, line: 195, type: !52)
!2236 = !DILocalVariable(name: "accumulator", scope: !2226, file: !408, line: 196, type: !2237)
!2237 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 1327104, elements: !2238)
!2238 = !{!2239}
!2239 = !DISubrange(count: 20736)
!2240 = !DILocation(line: 196, column: 14, scope: !2226)
!2241 = !DILocation(line: 197, column: 32, scope: !2226)
!2242 = !DILocation(line: 197, column: 37, scope: !2226)
!2243 = !DILocalVariable(name: "m_vec_limbs", scope: !2226, file: !408, line: 197, type: !324)
!2244 = !DILocalVariable(name: "row", scope: !2245, file: !408, line: 198, type: !86)
!2245 = distinct !DILexicalBlock(scope: !2226, file: !408, line: 198, column: 5)
!2246 = !DILocation(line: 0, scope: !2245)
!2247 = !DILocation(line: 198, column: 10, scope: !2245)
!2248 = !DILocation(line: 198, scope: !2245)
!2249 = !DILocation(line: 198, column: 27, scope: !2250)
!2250 = distinct !DILexicalBlock(scope: !2245, file: !408, line: 198, column: 5)
!2251 = !DILocation(line: 198, column: 5, scope: !2245)
!2252 = !DILocation(line: 208, column: 5, scope: !2226)
!2253 = !DILocation(line: 199, scope: !2254)
!2254 = distinct !DILexicalBlock(scope: !2255, file: !408, line: 199, column: 9)
!2255 = distinct !DILexicalBlock(scope: !2250, file: !408, line: 198, column: 39)
!2256 = !DILocalVariable(name: "j", scope: !2254, file: !408, line: 199, type: !86)
!2257 = !DILocation(line: 0, scope: !2254)
!2258 = !DILocation(line: 199, column: 27, scope: !2259)
!2259 = distinct !DILexicalBlock(scope: !2254, file: !408, line: 199, column: 9)
!2260 = !DILocation(line: 199, column: 9, scope: !2254)
!2261 = !DILocation(line: 200, scope: !2262)
!2262 = distinct !DILexicalBlock(scope: !2263, file: !408, line: 200, column: 13)
!2263 = distinct !DILexicalBlock(scope: !2259, file: !408, line: 199, column: 37)
!2264 = !DILocalVariable(name: "col", scope: !2262, file: !408, line: 200, type: !86)
!2265 = !DILocation(line: 0, scope: !2262)
!2266 = !DILocation(line: 200, column: 35, scope: !2267)
!2267 = distinct !DILexicalBlock(scope: !2262, file: !408, line: 200, column: 13)
!2268 = !DILocation(line: 200, column: 13, scope: !2262)
!2269 = !DILocation(line: 201, column: 52, scope: !2270)
!2270 = distinct !DILexicalBlock(scope: !2267, file: !408, line: 200, column: 50)
!2271 = !DILocation(line: 201, column: 56, scope: !2270)
!2272 = !DILocation(line: 201, column: 63, scope: !2270)
!2273 = !DILocation(line: 201, column: 47, scope: !2270)
!2274 = !DILocation(line: 201, column: 99, scope: !2270)
!2275 = !DILocation(line: 201, column: 103, scope: !2270)
!2276 = !DILocation(line: 201, column: 110, scope: !2270)
!2277 = !DILocation(line: 201, column: 123, scope: !2270)
!2278 = !DILocation(line: 201, column: 117, scope: !2270)
!2279 = !DILocation(line: 201, column: 115, scope: !2270)
!2280 = !DILocation(line: 201, column: 133, scope: !2270)
!2281 = !DILocation(line: 201, column: 90, scope: !2270)
!2282 = !DILocation(line: 201, column: 21, scope: !2270)
!2283 = !DILocation(line: 200, column: 44, scope: !2267)
!2284 = !DILocation(line: 200, column: 13, scope: !2267)
!2285 = distinct !{!2285, !2268, !2286, !388}
!2286 = !DILocation(line: 202, column: 13, scope: !2262)
!2287 = !DILocation(line: 199, column: 33, scope: !2259)
!2288 = !DILocation(line: 199, column: 9, scope: !2259)
!2289 = distinct !{!2289, !2260, !2290, !388}
!2290 = !DILocation(line: 203, column: 9, scope: !2254)
!2291 = !DILocation(line: 198, column: 35, scope: !2250)
!2292 = !DILocation(line: 198, column: 5, scope: !2250)
!2293 = distinct !{!2293, !2251, !2294, !388}
!2294 = !DILocation(line: 204, column: 5, scope: !2245)
!2295 = !DILocalVariable(name: "i", scope: !2226, file: !408, line: 207, type: !86)
!2296 = !DILocation(line: 208, column: 14, scope: !2226)
!2297 = !DILocation(line: 209, column: 58, scope: !2298)
!2298 = distinct !DILexicalBlock(scope: !2226, file: !408, line: 208, column: 21)
!2299 = !DILocation(line: 209, column: 63, scope: !2298)
!2300 = !DILocation(line: 209, column: 54, scope: !2298)
!2301 = !DILocation(line: 209, column: 86, scope: !2298)
!2302 = !DILocation(line: 209, column: 82, scope: !2298)
!2303 = !DILocation(line: 209, column: 9, scope: !2298)
!2304 = !DILocation(line: 210, column: 10, scope: !2298)
!2305 = distinct !{!2305, !2252, !2306, !388}
!2306 = !DILocation(line: 211, column: 5, scope: !2226)
!2307 = !DILocation(line: 212, column: 1, scope: !2226)
!2308 = distinct !DISubprogram(name: "m_vec_add", scope: !529, file: !529, line: 22, type: !2309, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2309 = !DISubroutineType(types: !2310)
!2310 = !{null, !86, !411, !52}
!2311 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2308, file: !529, line: 22, type: !86)
!2312 = !DILocation(line: 0, scope: !2308)
!2313 = !DILocalVariable(name: "in", arg: 2, scope: !2308, file: !529, line: 22, type: !411)
!2314 = !DILocalVariable(name: "acc", arg: 3, scope: !2308, file: !529, line: 22, type: !52)
!2315 = !DILocalVariable(name: "i", scope: !2316, file: !529, line: 24, type: !58)
!2316 = distinct !DILexicalBlock(scope: !2308, file: !529, line: 24, column: 5)
!2317 = !DILocation(line: 0, scope: !2316)
!2318 = !DILocation(line: 26, column: 19, scope: !2319)
!2319 = distinct !DILexicalBlock(scope: !2320, file: !529, line: 25, column: 5)
!2320 = distinct !DILexicalBlock(scope: !2316, file: !529, line: 24, column: 5)
!2321 = !DILocation(line: 26, column: 16, scope: !2319)
!2322 = !DILocation(line: 26, column: 9, scope: !2319)
!2323 = !DILocation(line: 28, column: 1, scope: !2308)
!2324 = distinct !DISubprogram(name: "m_vec_multiply_bins", scope: !529, file: !529, line: 66, type: !2325, scopeLine: 66, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2325 = !DISubroutineType(types: !2326)
!2326 = !{null, !86, !52, !52}
!2327 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2324, file: !529, line: 66, type: !86)
!2328 = !DILocation(line: 0, scope: !2324)
!2329 = !DILocalVariable(name: "bins", arg: 2, scope: !2324, file: !529, line: 66, type: !52)
!2330 = !DILocalVariable(name: "out", arg: 3, scope: !2324, file: !529, line: 66, type: !52)
!2331 = !DILocation(line: 67, column: 44, scope: !2324)
!2332 = !DILocation(line: 67, column: 73, scope: !2324)
!2333 = !DILocation(line: 67, column: 5, scope: !2324)
!2334 = !DILocation(line: 68, column: 40, scope: !2324)
!2335 = !DILocation(line: 68, column: 69, scope: !2324)
!2336 = !DILocation(line: 68, column: 5, scope: !2324)
!2337 = !DILocation(line: 69, column: 44, scope: !2324)
!2338 = !DILocation(line: 69, column: 74, scope: !2324)
!2339 = !DILocation(line: 69, column: 5, scope: !2324)
!2340 = !DILocation(line: 70, column: 40, scope: !2324)
!2341 = !DILocation(line: 70, column: 69, scope: !2324)
!2342 = !DILocation(line: 70, column: 5, scope: !2324)
!2343 = !DILocation(line: 71, column: 44, scope: !2324)
!2344 = !DILocation(line: 71, column: 73, scope: !2324)
!2345 = !DILocation(line: 71, column: 5, scope: !2324)
!2346 = !DILocation(line: 72, column: 40, scope: !2324)
!2347 = !DILocation(line: 72, column: 69, scope: !2324)
!2348 = !DILocation(line: 72, column: 5, scope: !2324)
!2349 = !DILocation(line: 73, column: 44, scope: !2324)
!2350 = !DILocation(line: 73, column: 74, scope: !2324)
!2351 = !DILocation(line: 73, column: 5, scope: !2324)
!2352 = !DILocation(line: 74, column: 40, scope: !2324)
!2353 = !DILocation(line: 74, column: 69, scope: !2324)
!2354 = !DILocation(line: 74, column: 5, scope: !2324)
!2355 = !DILocation(line: 75, column: 44, scope: !2324)
!2356 = !DILocation(line: 75, column: 74, scope: !2324)
!2357 = !DILocation(line: 75, column: 5, scope: !2324)
!2358 = !DILocation(line: 76, column: 40, scope: !2324)
!2359 = !DILocation(line: 76, column: 69, scope: !2324)
!2360 = !DILocation(line: 76, column: 5, scope: !2324)
!2361 = !DILocation(line: 77, column: 44, scope: !2324)
!2362 = !DILocation(line: 77, column: 74, scope: !2324)
!2363 = !DILocation(line: 77, column: 5, scope: !2324)
!2364 = !DILocation(line: 78, column: 40, scope: !2324)
!2365 = !DILocation(line: 78, column: 69, scope: !2324)
!2366 = !DILocation(line: 78, column: 5, scope: !2324)
!2367 = !DILocation(line: 79, column: 44, scope: !2324)
!2368 = !DILocation(line: 79, column: 74, scope: !2324)
!2369 = !DILocation(line: 79, column: 5, scope: !2324)
!2370 = !DILocation(line: 80, column: 40, scope: !2324)
!2371 = !DILocation(line: 80, column: 69, scope: !2324)
!2372 = !DILocation(line: 80, column: 5, scope: !2324)
!2373 = !DILocation(line: 81, column: 35, scope: !2324)
!2374 = !DILocation(line: 81, column: 5, scope: !2324)
!2375 = !DILocation(line: 82, column: 1, scope: !2324)
!2376 = distinct !DISubprogram(name: "m_vec_mul_add_x_inv", scope: !529, file: !529, line: 56, type: !2309, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2377 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2376, file: !529, line: 56, type: !86)
!2378 = !DILocation(line: 0, scope: !2376)
!2379 = !DILocalVariable(name: "in", arg: 2, scope: !2376, file: !529, line: 56, type: !411)
!2380 = !DILocalVariable(name: "acc", arg: 3, scope: !2376, file: !529, line: 56, type: !52)
!2381 = !DILocalVariable(name: "mask_lsb", scope: !2376, file: !529, line: 58, type: !53)
!2382 = !DILocalVariable(name: "i", scope: !2383, file: !529, line: 59, type: !86)
!2383 = distinct !DILexicalBlock(scope: !2376, file: !529, line: 59, column: 5)
!2384 = !DILocation(line: 0, scope: !2383)
!2385 = !DILocation(line: 60, column: 22, scope: !2386)
!2386 = distinct !DILexicalBlock(scope: !2387, file: !529, line: 59, column: 43)
!2387 = distinct !DILexicalBlock(scope: !2383, file: !529, line: 59, column: 5)
!2388 = !DILocation(line: 60, column: 28, scope: !2386)
!2389 = !DILocalVariable(name: "t", scope: !2386, file: !529, line: 60, type: !53)
!2390 = !DILocation(line: 0, scope: !2386)
!2391 = !DILocation(line: 61, column: 32, scope: !2386)
!2392 = !DILocation(line: 61, column: 43, scope: !2386)
!2393 = !DILocation(line: 61, column: 38, scope: !2386)
!2394 = !DILocation(line: 61, column: 16, scope: !2386)
!2395 = !DILocation(line: 61, column: 9, scope: !2386)
!2396 = !DILocation(line: 63, column: 1, scope: !2376)
!2397 = distinct !DISubprogram(name: "m_vec_mul_add_x", scope: !529, file: !529, line: 46, type: !2309, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2398 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2397, file: !529, line: 46, type: !86)
!2399 = !DILocation(line: 0, scope: !2397)
!2400 = !DILocalVariable(name: "in", arg: 2, scope: !2397, file: !529, line: 46, type: !411)
!2401 = !DILocalVariable(name: "acc", arg: 3, scope: !2397, file: !529, line: 46, type: !52)
!2402 = !DILocalVariable(name: "mask_msb", scope: !2397, file: !529, line: 48, type: !53)
!2403 = !DILocalVariable(name: "i", scope: !2404, file: !529, line: 49, type: !86)
!2404 = distinct !DILexicalBlock(scope: !2397, file: !529, line: 49, column: 5)
!2405 = !DILocation(line: 0, scope: !2404)
!2406 = !DILocation(line: 50, column: 22, scope: !2407)
!2407 = distinct !DILexicalBlock(scope: !2408, file: !529, line: 49, column: 43)
!2408 = distinct !DILexicalBlock(scope: !2404, file: !529, line: 49, column: 5)
!2409 = !DILocalVariable(name: "t", scope: !2407, file: !529, line: 50, type: !53)
!2410 = !DILocation(line: 0, scope: !2407)
!2411 = !DILocation(line: 51, column: 32, scope: !2407)
!2412 = !DILocation(line: 51, column: 44, scope: !2407)
!2413 = !DILocation(line: 51, column: 50, scope: !2407)
!2414 = !DILocation(line: 51, column: 38, scope: !2407)
!2415 = !DILocation(line: 51, column: 16, scope: !2407)
!2416 = !DILocation(line: 51, column: 9, scope: !2407)
!2417 = !DILocation(line: 53, column: 1, scope: !2397)
!2418 = distinct !DISubprogram(name: "m_vec_copy", scope: !529, file: !529, line: 13, type: !2309, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2419 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2418, file: !529, line: 13, type: !86)
!2420 = !DILocation(line: 0, scope: !2418)
!2421 = !DILocalVariable(name: "in", arg: 2, scope: !2418, file: !529, line: 13, type: !411)
!2422 = !DILocalVariable(name: "out", arg: 3, scope: !2418, file: !529, line: 13, type: !52)
!2423 = !DILocalVariable(name: "i", scope: !2424, file: !529, line: 15, type: !58)
!2424 = distinct !DILexicalBlock(scope: !2418, file: !529, line: 15, column: 5)
!2425 = !DILocation(line: 0, scope: !2424)
!2426 = !DILocation(line: 17, column: 18, scope: !2427)
!2427 = distinct !DILexicalBlock(scope: !2428, file: !529, line: 16, column: 5)
!2428 = distinct !DILexicalBlock(scope: !2424, file: !529, line: 15, column: 5)
!2429 = !DILocation(line: 17, column: 16, scope: !2427)
!2430 = !DILocation(line: 17, column: 9, scope: !2427)
!2431 = !DILocation(line: 19, column: 1, scope: !2418)
!2432 = distinct !DISubprogram(name: "pqmayo_MAYO_5_ref_m_upper", scope: !99, file: !99, line: 14, type: !2433, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !71)
!2433 = !DISubroutineType(types: !2434)
!2434 = !{null, !2435, !411, !52, !86}
!2435 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2436, size: 32)
!2436 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2437)
!2437 = !DIDerivedType(tag: DW_TAG_typedef, name: "mayo_params_t", file: !79, line: 289, baseType: !2438)
!2438 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !79, line: 265, size: 736, elements: !2439)
!2439 = !{!2440, !2441, !2442, !2443, !2444, !2445, !2446, !2447, !2448, !2449, !2450, !2451, !2452, !2453, !2454, !2455, !2456, !2457, !2458, !2459, !2460, !2461, !2462}
!2440 = !DIDerivedType(tag: DW_TAG_member, name: "m", scope: !2438, file: !79, line: 266, baseType: !86, size: 32)
!2441 = !DIDerivedType(tag: DW_TAG_member, name: "n", scope: !2438, file: !79, line: 267, baseType: !86, size: 32, offset: 32)
!2442 = !DIDerivedType(tag: DW_TAG_member, name: "o", scope: !2438, file: !79, line: 268, baseType: !86, size: 32, offset: 64)
!2443 = !DIDerivedType(tag: DW_TAG_member, name: "k", scope: !2438, file: !79, line: 269, baseType: !86, size: 32, offset: 96)
!2444 = !DIDerivedType(tag: DW_TAG_member, name: "q", scope: !2438, file: !79, line: 270, baseType: !86, size: 32, offset: 128)
!2445 = !DIDerivedType(tag: DW_TAG_member, name: "f_tail", scope: !2438, file: !79, line: 271, baseType: !90, size: 32, offset: 160)
!2446 = !DIDerivedType(tag: DW_TAG_member, name: "m_bytes", scope: !2438, file: !79, line: 272, baseType: !86, size: 32, offset: 192)
!2447 = !DIDerivedType(tag: DW_TAG_member, name: "O_bytes", scope: !2438, file: !79, line: 273, baseType: !86, size: 32, offset: 224)
!2448 = !DIDerivedType(tag: DW_TAG_member, name: "v_bytes", scope: !2438, file: !79, line: 274, baseType: !86, size: 32, offset: 256)
!2449 = !DIDerivedType(tag: DW_TAG_member, name: "r_bytes", scope: !2438, file: !79, line: 275, baseType: !86, size: 32, offset: 288)
!2450 = !DIDerivedType(tag: DW_TAG_member, name: "R_bytes", scope: !2438, file: !79, line: 276, baseType: !86, size: 32, offset: 320)
!2451 = !DIDerivedType(tag: DW_TAG_member, name: "P1_bytes", scope: !2438, file: !79, line: 277, baseType: !86, size: 32, offset: 352)
!2452 = !DIDerivedType(tag: DW_TAG_member, name: "P2_bytes", scope: !2438, file: !79, line: 278, baseType: !86, size: 32, offset: 384)
!2453 = !DIDerivedType(tag: DW_TAG_member, name: "P3_bytes", scope: !2438, file: !79, line: 279, baseType: !86, size: 32, offset: 416)
!2454 = !DIDerivedType(tag: DW_TAG_member, name: "csk_bytes", scope: !2438, file: !79, line: 280, baseType: !86, size: 32, offset: 448)
!2455 = !DIDerivedType(tag: DW_TAG_member, name: "cpk_bytes", scope: !2438, file: !79, line: 281, baseType: !86, size: 32, offset: 480)
!2456 = !DIDerivedType(tag: DW_TAG_member, name: "sig_bytes", scope: !2438, file: !79, line: 282, baseType: !86, size: 32, offset: 512)
!2457 = !DIDerivedType(tag: DW_TAG_member, name: "salt_bytes", scope: !2438, file: !79, line: 283, baseType: !86, size: 32, offset: 544)
!2458 = !DIDerivedType(tag: DW_TAG_member, name: "sk_seed_bytes", scope: !2438, file: !79, line: 284, baseType: !86, size: 32, offset: 576)
!2459 = !DIDerivedType(tag: DW_TAG_member, name: "digest_bytes", scope: !2438, file: !79, line: 285, baseType: !86, size: 32, offset: 608)
!2460 = !DIDerivedType(tag: DW_TAG_member, name: "pk_seed_bytes", scope: !2438, file: !79, line: 286, baseType: !86, size: 32, offset: 640)
!2461 = !DIDerivedType(tag: DW_TAG_member, name: "m_vec_limbs", scope: !2438, file: !79, line: 287, baseType: !86, size: 32, offset: 672)
!2462 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !2438, file: !79, line: 288, baseType: !149, size: 32, offset: 704)
!2463 = !DILocalVariable(name: "p", arg: 1, scope: !2432, file: !99, line: 14, type: !2435)
!2464 = !DILocation(line: 0, scope: !2432)
!2465 = !DILocalVariable(name: "in", arg: 2, scope: !2432, file: !99, line: 14, type: !411)
!2466 = !DILocalVariable(name: "out", arg: 3, scope: !2432, file: !99, line: 14, type: !52)
!2467 = !DILocalVariable(name: "size", arg: 4, scope: !2432, file: !99, line: 14, type: !86)
!2468 = !DILocalVariable(name: "m_vec_limbs", scope: !2432, file: !99, line: 19, type: !324)
!2469 = !DILocalVariable(name: "m_vecs_stored", scope: !2432, file: !99, line: 20, type: !86)
!2470 = !DILocalVariable(name: "r", scope: !2471, file: !99, line: 21, type: !86)
!2471 = distinct !DILexicalBlock(scope: !2432, file: !99, line: 21, column: 5)
!2472 = !DILocation(line: 0, scope: !2471)
!2473 = !DILocation(line: 21, column: 10, scope: !2471)
!2474 = !DILocation(line: 20, column: 9, scope: !2432)
!2475 = !DILocation(line: 21, scope: !2471)
!2476 = !DILocation(line: 21, column: 23, scope: !2477)
!2477 = distinct !DILexicalBlock(scope: !2471, file: !99, line: 21, column: 5)
!2478 = !DILocation(line: 21, column: 5, scope: !2471)
!2479 = !DILocation(line: 22, column: 9, scope: !2480)
!2480 = distinct !DILexicalBlock(scope: !2481, file: !99, line: 22, column: 9)
!2481 = distinct !DILexicalBlock(scope: !2477, file: !99, line: 21, column: 36)
!2482 = !DILocation(line: 22, scope: !2480)
!2483 = !DILocalVariable(name: "c", scope: !2480, file: !99, line: 22, type: !86)
!2484 = !DILocation(line: 0, scope: !2480)
!2485 = !DILocation(line: 22, column: 27, scope: !2486)
!2486 = distinct !DILexicalBlock(scope: !2480, file: !99, line: 22, column: 9)
!2487 = !DILocation(line: 23, column: 59, scope: !2488)
!2488 = distinct !DILexicalBlock(scope: !2486, file: !99, line: 22, column: 40)
!2489 = !DILocation(line: 23, column: 66, scope: !2488)
!2490 = !DILocation(line: 23, column: 40, scope: !2488)
!2491 = !DILocation(line: 23, column: 76, scope: !2488)
!2492 = !DILocation(line: 23, column: 13, scope: !2488)
!2493 = !DILocation(line: 24, column: 19, scope: !2494)
!2494 = distinct !DILexicalBlock(scope: !2488, file: !99, line: 24, column: 17)
!2495 = !DILocation(line: 25, column: 62, scope: !2496)
!2496 = distinct !DILexicalBlock(scope: !2494, file: !99, line: 24, column: 25)
!2497 = !DILocation(line: 25, column: 69, scope: !2496)
!2498 = !DILocation(line: 25, column: 43, scope: !2496)
!2499 = !DILocation(line: 25, column: 79, scope: !2496)
!2500 = !DILocation(line: 25, column: 17, scope: !2496)
!2501 = !DILocation(line: 26, column: 13, scope: !2496)
!2502 = !DILocation(line: 27, column: 27, scope: !2488)
!2503 = !DILocation(line: 22, column: 36, scope: !2486)
!2504 = !DILocation(line: 22, column: 9, scope: !2486)
!2505 = distinct !{!2505, !2479, !2506, !388}
!2506 = !DILocation(line: 28, column: 9, scope: !2480)
!2507 = !DILocation(line: 21, column: 32, scope: !2477)
!2508 = !DILocation(line: 21, column: 5, scope: !2477)
!2509 = distinct !{!2509, !2478, !2510, !388}
!2510 = !DILocation(line: 29, column: 5, scope: !2471)
!2511 = !DILocation(line: 30, column: 1, scope: !2432)
!2512 = distinct !DISubprogram(name: "m_vec_copy", scope: !529, file: !529, line: 13, type: !2309, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!2513 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2512, file: !529, line: 13, type: !86)
!2514 = !DILocation(line: 0, scope: !2512)
!2515 = !DILocalVariable(name: "in", arg: 2, scope: !2512, file: !529, line: 13, type: !411)
!2516 = !DILocalVariable(name: "out", arg: 3, scope: !2512, file: !529, line: 13, type: !52)
!2517 = !DILocalVariable(name: "i", scope: !2518, file: !529, line: 15, type: !58)
!2518 = distinct !DILexicalBlock(scope: !2512, file: !529, line: 15, column: 5)
!2519 = !DILocation(line: 0, scope: !2518)
!2520 = !DILocation(line: 17, column: 18, scope: !2521)
!2521 = distinct !DILexicalBlock(scope: !2522, file: !529, line: 16, column: 5)
!2522 = distinct !DILexicalBlock(scope: !2518, file: !529, line: 15, column: 5)
!2523 = !DILocation(line: 17, column: 16, scope: !2521)
!2524 = !DILocation(line: 17, column: 9, scope: !2521)
!2525 = !DILocation(line: 19, column: 1, scope: !2512)
!2526 = distinct !DISubprogram(name: "m_vec_add", scope: !529, file: !529, line: 22, type: !2309, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!2527 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2526, file: !529, line: 22, type: !86)
!2528 = !DILocation(line: 0, scope: !2526)
!2529 = !DILocalVariable(name: "in", arg: 2, scope: !2526, file: !529, line: 22, type: !411)
!2530 = !DILocalVariable(name: "acc", arg: 3, scope: !2526, file: !529, line: 22, type: !52)
!2531 = !DILocalVariable(name: "i", scope: !2532, file: !529, line: 24, type: !58)
!2532 = distinct !DILexicalBlock(scope: !2526, file: !529, line: 24, column: 5)
!2533 = !DILocation(line: 0, scope: !2532)
!2534 = !DILocation(line: 26, column: 19, scope: !2535)
!2535 = distinct !DILexicalBlock(scope: !2536, file: !529, line: 25, column: 5)
!2536 = distinct !DILexicalBlock(scope: !2532, file: !529, line: 24, column: 5)
!2537 = !DILocation(line: 26, column: 16, scope: !2535)
!2538 = !DILocation(line: 26, column: 9, scope: !2535)
!2539 = !DILocation(line: 28, column: 1, scope: !2526)
!2540 = distinct !DISubprogram(name: "pqmayo_MAYO_5_ref_sample_solution", scope: !99, file: !99, line: 40, type: !2541, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !71)
!2541 = !DISubroutineType(types: !2542)
!2542 = !{!86, !2435, !61, !90, !90, !61, !86, !86, !86, !86}
!2543 = !DILocalVariable(name: "p", arg: 1, scope: !2540, file: !99, line: 40, type: !2435)
!2544 = !DILocation(line: 0, scope: !2540)
!2545 = !DILocalVariable(name: "A", arg: 2, scope: !2540, file: !99, line: 40, type: !61)
!2546 = !DILocalVariable(name: "y", arg: 3, scope: !2540, file: !99, line: 41, type: !90)
!2547 = !DILocalVariable(name: "r", arg: 4, scope: !2540, file: !99, line: 41, type: !90)
!2548 = !DILocalVariable(name: "x", arg: 5, scope: !2540, file: !99, line: 42, type: !61)
!2549 = !DILocalVariable(name: "k", arg: 6, scope: !2540, file: !99, line: 42, type: !86)
!2550 = !DILocalVariable(name: "o", arg: 7, scope: !2540, file: !99, line: 42, type: !86)
!2551 = !DILocalVariable(name: "m", arg: 8, scope: !2540, file: !99, line: 42, type: !86)
!2552 = !DILocalVariable(name: "A_cols", arg: 9, scope: !2540, file: !99, line: 42, type: !86)
!2553 = !DILocalVariable(name: "i", scope: !2554, file: !99, line: 51, type: !86)
!2554 = distinct !DILexicalBlock(scope: !2540, file: !99, line: 51, column: 5)
!2555 = !DILocation(line: 0, scope: !2554)
!2556 = !DILocation(line: 51, column: 10, scope: !2554)
!2557 = !DILocation(line: 51, scope: !2554)
!2558 = !DILocation(line: 51, column: 23, scope: !2559)
!2559 = distinct !DILexicalBlock(scope: !2554, file: !99, line: 51, column: 5)
!2560 = !DILocation(line: 51, column: 5, scope: !2554)
!2561 = !DILocation(line: 57, column: 5, scope: !2562)
!2562 = distinct !DILexicalBlock(scope: !2540, file: !99, line: 57, column: 5)
!2563 = !DILocation(line: 52, column: 16, scope: !2564)
!2564 = distinct !DILexicalBlock(scope: !2559, file: !99, line: 51, column: 37)
!2565 = !DILocation(line: 52, column: 9, scope: !2564)
!2566 = !DILocation(line: 52, column: 14, scope: !2564)
!2567 = !DILocation(line: 51, column: 33, scope: !2559)
!2568 = !DILocation(line: 51, column: 5, scope: !2559)
!2569 = distinct !{!2569, !2560, !2570, !388}
!2570 = !DILocation(line: 53, column: 5, scope: !2554)
!2571 = !DILocation(line: 57, scope: !2562)
!2572 = !DILocalVariable(name: "i", scope: !2562, file: !99, line: 57, type: !86)
!2573 = !DILocation(line: 0, scope: !2562)
!2574 = !DILocation(line: 57, column: 23, scope: !2575)
!2575 = distinct !DILexicalBlock(scope: !2562, file: !99, line: 57, column: 5)
!2576 = !DILocation(line: 58, column: 13, scope: !2577)
!2577 = distinct !DILexicalBlock(scope: !2575, file: !99, line: 57, column: 33)
!2578 = !DILocation(line: 58, column: 26, scope: !2577)
!2579 = !DILocation(line: 58, column: 30, scope: !2577)
!2580 = !DILocation(line: 58, column: 21, scope: !2577)
!2581 = !DILocation(line: 58, column: 9, scope: !2577)
!2582 = !DILocation(line: 58, column: 36, scope: !2577)
!2583 = !DILocation(line: 57, column: 29, scope: !2575)
!2584 = !DILocation(line: 57, column: 5, scope: !2575)
!2585 = distinct !{!2585, !2561, !2586, !388}
!2586 = !DILocation(line: 59, column: 5, scope: !2562)
!2587 = !DILocation(line: 60, column: 25, scope: !2540)
!2588 = !DILocation(line: 60, column: 29, scope: !2540)
!2589 = !DILocation(line: 60, column: 5, scope: !2540)
!2590 = !DILocalVariable(name: "i", scope: !2591, file: !99, line: 63, type: !86)
!2591 = distinct !DILexicalBlock(scope: !2540, file: !99, line: 63, column: 5)
!2592 = !DILocation(line: 0, scope: !2591)
!2593 = !DILocation(line: 63, column: 10, scope: !2591)
!2594 = !DILocation(line: 63, scope: !2591)
!2595 = !DILocation(line: 63, column: 23, scope: !2596)
!2596 = distinct !DILexicalBlock(scope: !2591, file: !99, line: 63, column: 5)
!2597 = !DILocation(line: 63, column: 5, scope: !2591)
!2598 = !DILocation(line: 64, column: 44, scope: !2599)
!2599 = distinct !DILexicalBlock(scope: !2596, file: !99, line: 63, column: 33)
!2600 = !DILocation(line: 64, column: 50, scope: !2599)
!2601 = !DILocation(line: 64, column: 38, scope: !2599)
!2602 = !DILocation(line: 64, column: 13, scope: !2599)
!2603 = !DILocation(line: 64, column: 26, scope: !2599)
!2604 = !DILocation(line: 64, column: 30, scope: !2599)
!2605 = !DILocation(line: 64, column: 21, scope: !2599)
!2606 = !DILocation(line: 64, column: 9, scope: !2599)
!2607 = !DILocation(line: 64, column: 36, scope: !2599)
!2608 = !DILocation(line: 63, column: 29, scope: !2596)
!2609 = !DILocation(line: 63, column: 5, scope: !2596)
!2610 = distinct !{!2610, !2597, !2611, !388}
!2611 = !DILocation(line: 65, column: 5, scope: !2591)
!2612 = !DILocation(line: 67, column: 16, scope: !2540)
!2613 = !DILocation(line: 67, column: 20, scope: !2540)
!2614 = !DILocation(line: 67, column: 5, scope: !2540)
!2615 = !DILocalVariable(name: "full_rank", scope: !2540, file: !99, line: 70, type: !51)
!2616 = !DILocalVariable(name: "i", scope: !2617, file: !99, line: 71, type: !86)
!2617 = distinct !DILexicalBlock(scope: !2540, file: !99, line: 71, column: 5)
!2618 = !DILocation(line: 0, scope: !2617)
!2619 = !DILocation(line: 71, column: 10, scope: !2617)
!2620 = !DILocation(line: 71, scope: !2617)
!2621 = !DILocation(line: 71, column: 23, scope: !2622)
!2622 = distinct !DILexicalBlock(scope: !2617, file: !99, line: 71, column: 5)
!2623 = !DILocation(line: 71, column: 5, scope: !2617)
!2624 = !DILocation(line: 72, column: 27, scope: !2625)
!2625 = distinct !DILexicalBlock(scope: !2622, file: !99, line: 71, column: 42)
!2626 = !DILocation(line: 72, column: 32, scope: !2625)
!2627 = !DILocation(line: 72, column: 22, scope: !2625)
!2628 = !DILocation(line: 72, column: 19, scope: !2625)
!2629 = !DILocation(line: 71, column: 38, scope: !2622)
!2630 = !DILocation(line: 71, column: 5, scope: !2622)
!2631 = distinct !{!2631, !2623, !2632, !388}
!2632 = !DILocation(line: 73, column: 5, scope: !2617)
!2633 = !DILocation(line: 80, column: 19, scope: !2634)
!2634 = distinct !DILexicalBlock(scope: !2540, file: !99, line: 80, column: 9)
!2635 = !DILocation(line: 88, scope: !2636)
!2636 = distinct !DILexicalBlock(scope: !2540, file: !99, line: 88, column: 5)
!2637 = !DILocalVariable(name: "row", scope: !2636, file: !99, line: 88, type: !86)
!2638 = !DILocation(line: 0, scope: !2636)
!2639 = !DILocation(line: 88, column: 31, scope: !2640)
!2640 = distinct !DILexicalBlock(scope: !2636, file: !99, line: 88, column: 5)
!2641 = !DILocation(line: 88, column: 5, scope: !2636)
!2642 = !DILocalVariable(name: "finished", scope: !2540, file: !99, line: 46, type: !51)
!2643 = !DILocation(line: 90, column: 27, scope: !2644)
!2644 = distinct !DILexicalBlock(scope: !2640, file: !99, line: 88, column: 44)
!2645 = !DILocalVariable(name: "col_upper_bound", scope: !2540, file: !99, line: 47, type: !86)
!2646 = !DILocalVariable(name: "col", scope: !2647, file: !99, line: 93, type: !86)
!2647 = distinct !DILexicalBlock(scope: !2644, file: !99, line: 93, column: 9)
!2648 = !DILocation(line: 0, scope: !2647)
!2649 = !DILocation(line: 93, column: 14, scope: !2647)
!2650 = !DILocation(line: 0, scope: !2644)
!2651 = !DILocation(line: 93, scope: !2647)
!2652 = !DILocation(line: 93, column: 33, scope: !2653)
!2653 = distinct !DILexicalBlock(scope: !2647, file: !99, line: 93, column: 9)
!2654 = !DILocation(line: 93, column: 9, scope: !2647)
!2655 = distinct !{!2655, !2641, !2656, !388}
!2656 = !DILocation(line: 122, column: 5, scope: !2636)
!2657 = !DILocation(line: 97, column: 50, scope: !2658)
!2658 = distinct !DILexicalBlock(scope: !2653, file: !99, line: 93, column: 60)
!2659 = !DILocation(line: 97, column: 44, scope: !2658)
!2660 = !DILocation(line: 97, column: 30, scope: !2658)
!2661 = !DILocation(line: 97, column: 73, scope: !2658)
!2662 = !DILocalVariable(name: "correct_column", scope: !2540, file: !99, line: 48, type: !51)
!2663 = !DILocation(line: 99, column: 63, scope: !2658)
!2664 = !DILocation(line: 99, column: 48, scope: !2658)
!2665 = !DILocation(line: 99, column: 46, scope: !2658)
!2666 = !DILocalVariable(name: "u", scope: !2658, file: !99, line: 99, type: !51)
!2667 = !DILocation(line: 0, scope: !2658)
!2668 = !DILocation(line: 100, column: 13, scope: !2658)
!2669 = !DILocation(line: 100, column: 20, scope: !2658)
!2670 = !DILocalVariable(name: "i", scope: !2671, file: !99, line: 102, type: !86)
!2671 = distinct !DILexicalBlock(scope: !2658, file: !99, line: 102, column: 13)
!2672 = !DILocation(line: 0, scope: !2671)
!2673 = !DILocation(line: 102, column: 18, scope: !2671)
!2674 = !DILocation(line: 102, scope: !2671)
!2675 = !DILocation(line: 102, column: 31, scope: !2676)
!2676 = distinct !DILexicalBlock(scope: !2671, file: !99, line: 102, column: 13)
!2677 = !DILocation(line: 102, column: 13, scope: !2671)
!2678 = !DILocation(line: 103, column: 53, scope: !2679)
!2679 = distinct !DILexicalBlock(scope: !2676, file: !99, line: 102, column: 46)
!2680 = !DILocation(line: 103, column: 45, scope: !2679)
!2681 = !DILocation(line: 103, column: 34, scope: !2679)
!2682 = !DILocation(line: 103, column: 95, scope: !2679)
!2683 = !DILocation(line: 103, column: 99, scope: !2679)
!2684 = !DILocation(line: 103, column: 91, scope: !2679)
!2685 = !DILocation(line: 103, column: 80, scope: !2679)
!2686 = !DILocation(line: 103, column: 115, scope: !2679)
!2687 = !DILocation(line: 103, column: 76, scope: !2679)
!2688 = !DILocation(line: 104, column: 49, scope: !2679)
!2689 = !DILocation(line: 104, column: 53, scope: !2679)
!2690 = !DILocation(line: 104, column: 45, scope: !2679)
!2691 = !DILocation(line: 104, column: 34, scope: !2679)
!2692 = !DILocation(line: 104, column: 69, scope: !2679)
!2693 = !DILocation(line: 104, column: 30, scope: !2679)
!2694 = !DILocation(line: 104, column: 95, scope: !2679)
!2695 = !DILocation(line: 104, column: 99, scope: !2679)
!2696 = !DILocation(line: 104, column: 91, scope: !2679)
!2697 = !DILocation(line: 104, column: 80, scope: !2679)
!2698 = !DILocation(line: 104, column: 115, scope: !2679)
!2699 = !DILocation(line: 104, column: 76, scope: !2679)
!2700 = !DILocation(line: 105, column: 49, scope: !2679)
!2701 = !DILocation(line: 105, column: 53, scope: !2679)
!2702 = !DILocation(line: 105, column: 45, scope: !2679)
!2703 = !DILocation(line: 105, column: 34, scope: !2679)
!2704 = !DILocation(line: 105, column: 69, scope: !2679)
!2705 = !DILocation(line: 105, column: 30, scope: !2679)
!2706 = !DILocation(line: 105, column: 95, scope: !2679)
!2707 = !DILocation(line: 105, column: 99, scope: !2679)
!2708 = !DILocation(line: 105, column: 91, scope: !2679)
!2709 = !DILocation(line: 105, column: 80, scope: !2679)
!2710 = !DILocation(line: 105, column: 115, scope: !2679)
!2711 = !DILocation(line: 105, column: 76, scope: !2679)
!2712 = !DILocation(line: 106, column: 49, scope: !2679)
!2713 = !DILocation(line: 106, column: 53, scope: !2679)
!2714 = !DILocation(line: 106, column: 45, scope: !2679)
!2715 = !DILocation(line: 106, column: 34, scope: !2679)
!2716 = !DILocation(line: 106, column: 69, scope: !2679)
!2717 = !DILocation(line: 106, column: 30, scope: !2679)
!2718 = !DILocation(line: 106, column: 95, scope: !2679)
!2719 = !DILocation(line: 106, column: 99, scope: !2679)
!2720 = !DILocation(line: 106, column: 91, scope: !2679)
!2721 = !DILocation(line: 106, column: 80, scope: !2679)
!2722 = !DILocation(line: 106, column: 115, scope: !2679)
!2723 = !DILocation(line: 106, column: 76, scope: !2679)
!2724 = !DILocalVariable(name: "tmp", scope: !2679, file: !99, line: 103, type: !53)
!2725 = !DILocation(line: 0, scope: !2679)
!2726 = !DILocation(line: 108, column: 23, scope: !2679)
!2727 = !DILocation(line: 110, column: 34, scope: !2679)
!2728 = !DILocation(line: 110, column: 17, scope: !2679)
!2729 = !DILocation(line: 110, column: 48, scope: !2679)
!2730 = !DILocation(line: 111, column: 56, scope: !2679)
!2731 = !DILocation(line: 111, column: 34, scope: !2679)
!2732 = !DILocation(line: 111, column: 17, scope: !2679)
!2733 = !DILocation(line: 111, column: 48, scope: !2679)
!2734 = !DILocation(line: 112, column: 56, scope: !2679)
!2735 = !DILocation(line: 112, column: 34, scope: !2679)
!2736 = !DILocation(line: 112, column: 17, scope: !2679)
!2737 = !DILocation(line: 112, column: 48, scope: !2679)
!2738 = !DILocation(line: 113, column: 56, scope: !2679)
!2739 = !DILocation(line: 113, column: 34, scope: !2679)
!2740 = !DILocation(line: 113, column: 17, scope: !2679)
!2741 = !DILocation(line: 113, column: 48, scope: !2679)
!2742 = !DILocation(line: 114, column: 56, scope: !2679)
!2743 = !DILocation(line: 114, column: 34, scope: !2679)
!2744 = !DILocation(line: 114, column: 17, scope: !2679)
!2745 = !DILocation(line: 114, column: 48, scope: !2679)
!2746 = !DILocation(line: 115, column: 56, scope: !2679)
!2747 = !DILocation(line: 115, column: 34, scope: !2679)
!2748 = !DILocation(line: 115, column: 17, scope: !2679)
!2749 = !DILocation(line: 115, column: 48, scope: !2679)
!2750 = !DILocation(line: 116, column: 56, scope: !2679)
!2751 = !DILocation(line: 116, column: 34, scope: !2679)
!2752 = !DILocation(line: 116, column: 17, scope: !2679)
!2753 = !DILocation(line: 116, column: 48, scope: !2679)
!2754 = !DILocation(line: 117, column: 56, scope: !2679)
!2755 = !DILocation(line: 117, column: 34, scope: !2679)
!2756 = !DILocation(line: 117, column: 17, scope: !2679)
!2757 = !DILocation(line: 117, column: 48, scope: !2679)
!2758 = !DILocation(line: 102, column: 40, scope: !2676)
!2759 = !DILocation(line: 102, column: 13, scope: !2676)
!2760 = distinct !{!2760, !2677, !2761, !388}
!2761 = !DILocation(line: 118, column: 13, scope: !2671)
!2762 = !DILocation(line: 120, column: 33, scope: !2658)
!2763 = !DILocation(line: 93, column: 56, scope: !2653)
!2764 = !DILocation(line: 93, column: 9, scope: !2653)
!2765 = distinct !{!2765, !2654, !2766, !388}
!2766 = !DILocation(line: 121, column: 9, scope: !2647)
!2767 = !DILocation(line: 124, column: 1, scope: !2540)
!2768 = distinct !DISubprogram(name: "mat_mul", scope: !583, file: !583, line: 79, type: !1488, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!2769 = !DILocalVariable(name: "a", arg: 1, scope: !2768, file: !583, line: 79, type: !90)
!2770 = !DILocation(line: 0, scope: !2768)
!2771 = !DILocalVariable(name: "b", arg: 2, scope: !2768, file: !583, line: 79, type: !90)
!2772 = !DILocalVariable(name: "c", arg: 3, scope: !2768, file: !583, line: 80, type: !61)
!2773 = !DILocalVariable(name: "colrow_ab", arg: 4, scope: !2768, file: !583, line: 80, type: !86)
!2774 = !DILocalVariable(name: "row_a", arg: 5, scope: !2768, file: !583, line: 80, type: !86)
!2775 = !DILocalVariable(name: "col_b", arg: 6, scope: !2768, file: !583, line: 80, type: !86)
!2776 = !DILocalVariable(name: "i", scope: !2777, file: !583, line: 81, type: !86)
!2777 = distinct !DILexicalBlock(scope: !2768, file: !583, line: 81, column: 5)
!2778 = !DILocation(line: 0, scope: !2777)
!2779 = !DILocation(line: 81, column: 10, scope: !2777)
!2780 = !DILocation(line: 81, scope: !2777)
!2781 = !DILocation(line: 81, column: 23, scope: !2782)
!2782 = distinct !DILexicalBlock(scope: !2777, file: !583, line: 81, column: 5)
!2783 = !DILocation(line: 81, column: 5, scope: !2777)
!2784 = !DILocation(line: 82, scope: !2785)
!2785 = distinct !DILexicalBlock(scope: !2786, file: !583, line: 82, column: 9)
!2786 = distinct !DILexicalBlock(scope: !2782, file: !583, line: 81, column: 53)
!2787 = !DILocalVariable(name: "j", scope: !2785, file: !583, line: 82, type: !86)
!2788 = !DILocation(line: 0, scope: !2785)
!2789 = !DILocation(line: 82, column: 27, scope: !2790)
!2790 = distinct !DILexicalBlock(scope: !2785, file: !583, line: 82, column: 9)
!2791 = !DILocation(line: 82, column: 9, scope: !2785)
!2792 = !DILocation(line: 83, column: 31, scope: !2793)
!2793 = distinct !DILexicalBlock(scope: !2790, file: !583, line: 82, column: 46)
!2794 = !DILocation(line: 83, column: 18, scope: !2793)
!2795 = !DILocation(line: 83, column: 16, scope: !2793)
!2796 = !DILocation(line: 82, column: 36, scope: !2790)
!2797 = !DILocation(line: 82, column: 41, scope: !2790)
!2798 = !DILocation(line: 82, column: 9, scope: !2790)
!2799 = distinct !{!2799, !2791, !2800, !388}
!2800 = !DILocation(line: 84, column: 9, scope: !2785)
!2801 = !DILocation(line: 81, column: 32, scope: !2782)
!2802 = !DILocation(line: 81, column: 39, scope: !2782)
!2803 = !DILocation(line: 81, column: 5, scope: !2782)
!2804 = distinct !{!2804, !2783, !2805, !388}
!2805 = !DILocation(line: 85, column: 5, scope: !2777)
!2806 = !DILocation(line: 86, column: 18, scope: !2768)
!2807 = !DILocation(line: 86, column: 5, scope: !2768)
!2808 = !DILocation(line: 87, column: 1, scope: !2768)
!2809 = distinct !DISubprogram(name: "sub_f", scope: !583, file: !583, line: 48, type: !1613, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!2810 = !DILocalVariable(name: "a", arg: 1, scope: !2809, file: !583, line: 48, type: !51)
!2811 = !DILocation(line: 0, scope: !2809)
!2812 = !DILocalVariable(name: "b", arg: 2, scope: !2809, file: !583, line: 48, type: !51)
!2813 = !DILocation(line: 49, column: 14, scope: !2809)
!2814 = !DILocation(line: 49, column: 5, scope: !2809)
!2815 = distinct !DISubprogram(name: "EF", scope: !2816, file: !2816, line: 60, type: !2817, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!2816 = !DIFile(filename: "../../../src/generic/echelon_form.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!2817 = !DISubroutineType(types: !2818)
!2818 = !{null, !61, !86, !86}
!2819 = !DILocalVariable(name: "A", arg: 1, scope: !2815, file: !2816, line: 60, type: !61)
!2820 = !DILocation(line: 0, scope: !2815)
!2821 = !DILocalVariable(name: "nrows", arg: 2, scope: !2815, file: !2816, line: 60, type: !86)
!2822 = !DILocalVariable(name: "ncols", arg: 3, scope: !2815, file: !2816, line: 60, type: !86)
!2823 = !DILocalVariable(name: "_pivot_row", scope: !2815, file: !2816, line: 62, type: !2824, align: 256)
!2824 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 640, elements: !2825)
!2825 = !{!2826}
!2826 = !DISubrange(count: 10)
!2827 = !DILocation(line: 62, column: 27, scope: !2815)
!2828 = !DILocalVariable(name: "_pivot_row2", scope: !2815, file: !2816, line: 63, type: !2824, align: 256)
!2829 = !DILocation(line: 63, column: 27, scope: !2815)
!2830 = !DILocalVariable(name: "packed_A", scope: !2815, file: !2816, line: 64, type: !2831, align: 256)
!2831 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 90880, elements: !2832)
!2832 = !{!2833}
!2833 = !DISubrange(count: 1420)
!2834 = !DILocation(line: 64, column: 27, scope: !2815)
!2835 = !DILocation(line: 66, column: 26, scope: !2815)
!2836 = !DILocation(line: 66, column: 32, scope: !2815)
!2837 = !DILocalVariable(name: "row_len", scope: !2815, file: !2816, line: 66, type: !86)
!2838 = !DILocalVariable(name: "i", scope: !2839, file: !2816, line: 69, type: !86)
!2839 = distinct !DILexicalBlock(scope: !2815, file: !2816, line: 69, column: 5)
!2840 = !DILocation(line: 0, scope: !2839)
!2841 = !DILocation(line: 69, column: 10, scope: !2839)
!2842 = !DILocation(line: 69, scope: !2839)
!2843 = !DILocation(line: 69, column: 23, scope: !2844)
!2844 = distinct !DILexicalBlock(scope: !2839, file: !2816, line: 69, column: 5)
!2845 = !DILocation(line: 69, column: 5, scope: !2839)
!2846 = !DILocation(line: 77, column: 5, scope: !2847)
!2847 = distinct !DILexicalBlock(scope: !2815, file: !2816, line: 77, column: 5)
!2848 = !DILocation(line: 70, column: 29, scope: !2849)
!2849 = distinct !DILexicalBlock(scope: !2844, file: !2816, line: 69, column: 37)
!2850 = !DILocation(line: 70, column: 25, scope: !2849)
!2851 = !DILocation(line: 70, column: 51, scope: !2849)
!2852 = !DILocation(line: 70, column: 47, scope: !2849)
!2853 = !DILocation(line: 70, column: 9, scope: !2849)
!2854 = !DILocation(line: 69, column: 33, scope: !2844)
!2855 = !DILocation(line: 69, column: 5, scope: !2844)
!2856 = distinct !{!2856, !2845, !2857, !388}
!2857 = !DILocation(line: 71, column: 5, scope: !2839)
!2858 = !DILocation(line: 77, scope: !2847)
!2859 = !DILocalVariable(name: "pivot_row", scope: !2815, file: !2816, line: 76, type: !86)
!2860 = !DILocalVariable(name: "pivot_col", scope: !2847, file: !2816, line: 77, type: !86)
!2861 = !DILocation(line: 0, scope: !2847)
!2862 = !DILocation(line: 77, column: 39, scope: !2863)
!2863 = distinct !DILexicalBlock(scope: !2847, file: !2816, line: 77, column: 5)
!2864 = !DILocation(line: 79, column: 37, scope: !2865)
!2865 = distinct !DILexicalBlock(scope: !2863, file: !2816, line: 77, column: 61)
!2866 = !DILocalVariable(name: "pivot_row_lower_bound", scope: !2865, file: !2816, line: 79, type: !86)
!2867 = !DILocation(line: 0, scope: !2865)
!2868 = !DILocation(line: 80, column: 37, scope: !2865)
!2869 = !DILocalVariable(name: "pivot_row_upper_bound", scope: !2865, file: !2816, line: 80, type: !86)
!2870 = !DILocalVariable(name: "i", scope: !2871, file: !2816, line: 85, type: !86)
!2871 = distinct !DILexicalBlock(scope: !2865, file: !2816, line: 85, column: 9)
!2872 = !DILocation(line: 0, scope: !2871)
!2873 = !DILocation(line: 85, column: 14, scope: !2871)
!2874 = !DILocation(line: 85, scope: !2871)
!2875 = !DILocation(line: 85, column: 27, scope: !2876)
!2876 = distinct !DILexicalBlock(scope: !2871, file: !2816, line: 85, column: 9)
!2877 = !DILocation(line: 85, column: 9, scope: !2871)
!2878 = !DILocation(line: 93, column: 9, scope: !2879)
!2879 = distinct !DILexicalBlock(scope: !2865, file: !2816, line: 93, column: 9)
!2880 = !DILocation(line: 86, column: 13, scope: !2881)
!2881 = distinct !DILexicalBlock(scope: !2876, file: !2816, line: 85, column: 43)
!2882 = !DILocation(line: 86, column: 27, scope: !2881)
!2883 = !DILocation(line: 87, column: 13, scope: !2881)
!2884 = !DILocation(line: 87, column: 28, scope: !2881)
!2885 = !DILocation(line: 85, column: 39, scope: !2876)
!2886 = !DILocation(line: 85, column: 9, scope: !2876)
!2887 = distinct !{!2887, !2877, !2888, !388}
!2888 = !DILocation(line: 88, column: 9, scope: !2871)
!2889 = !DILocation(line: 0, scope: !2879)
!2890 = !DILocalVariable(name: "row", scope: !2879, file: !2816, line: 93, type: !86)
!2891 = !DILocalVariable(name: "pivot", scope: !2865, file: !2816, line: 91, type: !51)
!2892 = !DILocalVariable(name: "pivot_is_zero", scope: !2865, file: !2816, line: 92, type: !53)
!2893 = !DILocation(line: 94, column: 24, scope: !2894)
!2894 = distinct !DILexicalBlock(scope: !2879, file: !2816, line: 93, column: 9)
!2895 = !DILocation(line: 94, column: 21, scope: !2894)
!2896 = !DILocation(line: 96, column: 38, scope: !2897)
!2897 = distinct !DILexicalBlock(scope: !2894, file: !2816, line: 94, column: 80)
!2898 = !DILocation(line: 96, column: 37, scope: !2897)
!2899 = !DILocalVariable(name: "is_pivot_row", scope: !2897, file: !2816, line: 96, type: !53)
!2900 = !DILocation(line: 0, scope: !2897)
!2901 = !DILocation(line: 97, column: 40, scope: !2897)
!2902 = !DILocalVariable(name: "below_pivot_row", scope: !2897, file: !2816, line: 97, type: !53)
!2903 = !DILocalVariable(name: "j", scope: !2904, file: !2816, line: 99, type: !86)
!2904 = distinct !DILexicalBlock(scope: !2897, file: !2816, line: 99, column: 13)
!2905 = !DILocation(line: 0, scope: !2904)
!2906 = !DILocation(line: 99, column: 18, scope: !2904)
!2907 = !DILocation(line: 99, scope: !2904)
!2908 = !DILocation(line: 99, column: 31, scope: !2909)
!2909 = distinct !DILexicalBlock(scope: !2904, file: !2816, line: 99, column: 13)
!2910 = !DILocation(line: 99, column: 13, scope: !2904)
!2911 = !DILocation(line: 100, column: 67, scope: !2912)
!2912 = distinct !DILexicalBlock(scope: !2909, file: !2816, line: 99, column: 47)
!2913 = !DILocation(line: 100, column: 48, scope: !2912)
!2914 = !DILocation(line: 101, column: 47, scope: !2912)
!2915 = !DILocation(line: 101, column: 57, scope: !2912)
!2916 = !DILocation(line: 101, column: 34, scope: !2912)
!2917 = !DILocation(line: 100, column: 85, scope: !2912)
!2918 = !DILocation(line: 100, column: 17, scope: !2912)
!2919 = !DILocation(line: 100, column: 31, scope: !2912)
!2920 = !DILocation(line: 99, column: 43, scope: !2909)
!2921 = !DILocation(line: 99, column: 13, scope: !2909)
!2922 = distinct !{!2922, !2910, !2923, !388}
!2923 = !DILocation(line: 102, column: 13, scope: !2904)
!2924 = !DILocation(line: 103, column: 21, scope: !2897)
!2925 = !DILocation(line: 104, column: 44, scope: !2897)
!2926 = !DILocation(line: 104, column: 30, scope: !2897)
!2927 = !DILocation(line: 104, column: 29, scope: !2897)
!2928 = !DILocation(line: 94, column: 76, scope: !2894)
!2929 = !DILocation(line: 93, column: 9, scope: !2894)
!2930 = distinct !{!2930, !2878, !2931, !388}
!2931 = !DILocation(line: 105, column: 9, scope: !2879)
!2932 = !DILocation(line: 108, column: 19, scope: !2865)
!2933 = !DILocalVariable(name: "inverse", scope: !2815, file: !2816, line: 75, type: !51)
!2934 = !DILocation(line: 109, column: 9, scope: !2865)
!2935 = !DILocalVariable(name: "row", scope: !2936, file: !2816, line: 113, type: !86)
!2936 = distinct !DILexicalBlock(scope: !2865, file: !2816, line: 113, column: 9)
!2937 = !DILocation(line: 0, scope: !2936)
!2938 = !DILocation(line: 113, column: 14, scope: !2936)
!2939 = !DILocation(line: 113, scope: !2936)
!2940 = !DILocation(line: 113, column: 51, scope: !2941)
!2941 = distinct !DILexicalBlock(scope: !2936, file: !2816, line: 113, column: 9)
!2942 = !DILocation(line: 113, column: 9, scope: !2936)
!2943 = !DILocation(line: 114, column: 33, scope: !2944)
!2944 = distinct !DILexicalBlock(scope: !2941, file: !2816, line: 113, column: 84)
!2945 = !DILocation(line: 114, column: 63, scope: !2944)
!2946 = !DILocalVariable(name: "do_copy", scope: !2944, file: !2816, line: 114, type: !53)
!2947 = !DILocation(line: 0, scope: !2944)
!2948 = !DILocalVariable(name: "do_not_copy", scope: !2944, file: !2816, line: 115, type: !53)
!2949 = !DILocalVariable(name: "col", scope: !2950, file: !2816, line: 116, type: !86)
!2950 = distinct !DILexicalBlock(scope: !2944, file: !2816, line: 116, column: 13)
!2951 = !DILocation(line: 0, scope: !2950)
!2952 = !DILocation(line: 116, column: 18, scope: !2950)
!2953 = !DILocation(line: 116, scope: !2950)
!2954 = !DILocation(line: 116, column: 35, scope: !2955)
!2955 = distinct !DILexicalBlock(scope: !2950, file: !2816, line: 116, column: 13)
!2956 = !DILocation(line: 116, column: 13, scope: !2950)
!2957 = !DILocation(line: 118, column: 49, scope: !2958)
!2958 = distinct !DILexicalBlock(scope: !2955, file: !2816, line: 116, column: 53)
!2959 = !DILocation(line: 118, column: 59, scope: !2958)
!2960 = !DILocation(line: 118, column: 36, scope: !2958)
!2961 = !DILocation(line: 118, column: 34, scope: !2958)
!2962 = !DILocation(line: 119, column: 32, scope: !2958)
!2963 = !DILocation(line: 119, column: 30, scope: !2958)
!2964 = !DILocation(line: 118, column: 67, scope: !2958)
!2965 = !DILocation(line: 117, column: 30, scope: !2958)
!2966 = !DILocation(line: 117, column: 40, scope: !2958)
!2967 = !DILocation(line: 117, column: 17, scope: !2958)
!2968 = !DILocation(line: 117, column: 47, scope: !2958)
!2969 = !DILocation(line: 116, column: 49, scope: !2955)
!2970 = !DILocation(line: 116, column: 13, scope: !2955)
!2971 = distinct !{!2971, !2956, !2972, !388}
!2972 = !DILocation(line: 120, column: 13, scope: !2950)
!2973 = !DILocation(line: 113, column: 80, scope: !2941)
!2974 = !DILocation(line: 113, column: 9, scope: !2941)
!2975 = distinct !{!2975, !2942, !2976, !388}
!2976 = !DILocation(line: 121, column: 9, scope: !2936)
!2977 = !DILocation(line: 124, scope: !2978)
!2978 = distinct !DILexicalBlock(scope: !2865, file: !2816, line: 124, column: 9)
!2979 = !DILocalVariable(name: "row", scope: !2978, file: !2816, line: 124, type: !86)
!2980 = !DILocation(line: 0, scope: !2978)
!2981 = !DILocation(line: 124, column: 51, scope: !2982)
!2982 = distinct !DILexicalBlock(scope: !2978, file: !2816, line: 124, column: 9)
!2983 = !DILocation(line: 124, column: 9, scope: !2978)
!2984 = !DILocation(line: 125, column: 46, scope: !2985)
!2985 = distinct !DILexicalBlock(scope: !2982, file: !2816, line: 124, column: 67)
!2986 = !DILocalVariable(name: "below_pivot", scope: !2985, file: !2816, line: 125, type: !51)
!2987 = !DILocation(line: 0, scope: !2985)
!2988 = !DILocation(line: 126, column: 74, scope: !2985)
!2989 = !DILocation(line: 126, column: 68, scope: !2985)
!2990 = !DILocation(line: 126, column: 41, scope: !2985)
!2991 = !DILocalVariable(name: "elt_to_elim", scope: !2985, file: !2816, line: 126, type: !51)
!2992 = !DILocation(line: 128, column: 63, scope: !2985)
!2993 = !DILocation(line: 129, column: 52, scope: !2985)
!2994 = !DILocation(line: 129, column: 46, scope: !2985)
!2995 = !DILocation(line: 128, column: 13, scope: !2985)
!2996 = !DILocation(line: 124, column: 63, scope: !2982)
!2997 = !DILocation(line: 124, column: 9, scope: !2982)
!2998 = distinct !{!2998, !2983, !2999, !388}
!2999 = !DILocation(line: 130, column: 9, scope: !2978)
!3000 = !DILocation(line: 132, column: 19, scope: !2865)
!3001 = !DILocation(line: 77, column: 57, scope: !2863)
!3002 = !DILocation(line: 77, column: 5, scope: !2863)
!3003 = distinct !{!3003, !2846, !3004, !388}
!3004 = !DILocation(line: 133, column: 5, scope: !2847)
!3005 = !DILocation(line: 138, scope: !3006)
!3006 = distinct !DILexicalBlock(scope: !2815, file: !2816, line: 138, column: 5)
!3007 = !DILocalVariable(name: "i", scope: !3006, file: !2816, line: 138, type: !86)
!3008 = !DILocation(line: 0, scope: !3006)
!3009 = !DILocation(line: 138, column: 23, scope: !3010)
!3010 = distinct !DILexicalBlock(scope: !3006, file: !2816, line: 138, column: 5)
!3011 = !DILocation(line: 138, column: 5, scope: !3006)
!3012 = !DILocation(line: 139, column: 47, scope: !3013)
!3013 = distinct !DILexicalBlock(scope: !3010, file: !2816, line: 138, column: 37)
!3014 = !DILocation(line: 139, column: 43, scope: !3013)
!3015 = !DILocation(line: 139, column: 9, scope: !3013)
!3016 = !DILocalVariable(name: "j", scope: !3017, file: !2816, line: 140, type: !86)
!3017 = distinct !DILexicalBlock(scope: !3013, file: !2816, line: 140, column: 9)
!3018 = !DILocation(line: 0, scope: !3017)
!3019 = !DILocation(line: 140, column: 14, scope: !3017)
!3020 = !DILocation(line: 140, scope: !3017)
!3021 = !DILocation(line: 140, column: 27, scope: !3022)
!3022 = distinct !DILexicalBlock(scope: !3017, file: !2816, line: 140, column: 9)
!3023 = !DILocation(line: 140, column: 9, scope: !3017)
!3024 = !DILocation(line: 141, column: 32, scope: !3025)
!3025 = distinct !DILexicalBlock(scope: !3022, file: !2816, line: 140, column: 41)
!3026 = !DILocation(line: 141, column: 17, scope: !3025)
!3027 = !DILocation(line: 141, column: 13, scope: !3025)
!3028 = !DILocation(line: 141, column: 30, scope: !3025)
!3029 = !DILocation(line: 140, column: 37, scope: !3022)
!3030 = !DILocation(line: 140, column: 9, scope: !3022)
!3031 = distinct !{!3031, !3023, !3032, !388}
!3032 = !DILocation(line: 142, column: 9, scope: !3017)
!3033 = !DILocation(line: 138, column: 33, scope: !3010)
!3034 = !DILocation(line: 138, column: 5, scope: !3010)
!3035 = distinct !{!3035, !3011, !3036, !388}
!3036 = !DILocation(line: 143, column: 5, scope: !3006)
!3037 = !DILocation(line: 145, column: 5, scope: !2815)
!3038 = !DILocation(line: 146, column: 5, scope: !2815)
!3039 = !DILocation(line: 147, column: 5, scope: !2815)
!3040 = !DILocation(line: 148, column: 5, scope: !2815)
!3041 = !DILocation(line: 149, column: 1, scope: !2815)
!3042 = distinct !DISubprogram(name: "ct_compare_8", scope: !3043, file: !3043, line: 51, type: !1613, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3043 = !DIFile(filename: "../../../src/arithmetic.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!3044 = !DILocalVariable(name: "a", arg: 1, scope: !3042, file: !3043, line: 51, type: !51)
!3045 = !DILocation(line: 0, scope: !3042)
!3046 = !DILocalVariable(name: "b", arg: 2, scope: !3042, file: !3043, line: 51, type: !51)
!3047 = !DILocation(line: 52, column: 42, scope: !3042)
!3048 = !DILocation(line: 52, column: 13, scope: !3042)
!3049 = !DILocation(line: 52, column: 71, scope: !3042)
!3050 = !DILocation(line: 52, column: 69, scope: !3042)
!3051 = !DILocation(line: 52, column: 5, scope: !3042)
!3052 = distinct !DISubprogram(name: "mul_fx8", scope: !583, file: !583, line: 28, type: !3053, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3053 = !DISubroutineType(types: !3054)
!3054 = !{!53, !51, !53}
!3055 = !DILocalVariable(name: "a", arg: 1, scope: !3052, file: !583, line: 28, type: !51)
!3056 = !DILocation(line: 0, scope: !3052)
!3057 = !DILocalVariable(name: "b", arg: 2, scope: !3052, file: !583, line: 28, type: !53)
!3058 = !DILocation(line: 31, column: 13, scope: !3052)
!3059 = !DILocation(line: 31, column: 10, scope: !3052)
!3060 = !DILocation(line: 31, column: 17, scope: !3052)
!3061 = !DILocalVariable(name: "p", scope: !3052, file: !583, line: 30, type: !53)
!3062 = !DILocation(line: 32, column: 13, scope: !3052)
!3063 = !DILocation(line: 32, column: 10, scope: !3052)
!3064 = !DILocation(line: 32, column: 17, scope: !3052)
!3065 = !DILocation(line: 32, column: 7, scope: !3052)
!3066 = !DILocation(line: 33, column: 13, scope: !3052)
!3067 = !DILocation(line: 33, column: 10, scope: !3052)
!3068 = !DILocation(line: 33, column: 17, scope: !3052)
!3069 = !DILocation(line: 33, column: 7, scope: !3052)
!3070 = !DILocation(line: 34, column: 13, scope: !3052)
!3071 = !DILocation(line: 34, column: 10, scope: !3052)
!3072 = !DILocation(line: 34, column: 17, scope: !3052)
!3073 = !DILocation(line: 34, column: 7, scope: !3052)
!3074 = !DILocalVariable(name: "top_p", scope: !3052, file: !583, line: 37, type: !53)
!3075 = !DILocation(line: 38, column: 32, scope: !3052)
!3076 = !DILocation(line: 38, column: 47, scope: !3052)
!3077 = !DILocation(line: 38, column: 38, scope: !3052)
!3078 = !DILocation(line: 38, column: 54, scope: !3052)
!3079 = !DILocalVariable(name: "out", scope: !3052, file: !583, line: 38, type: !53)
!3080 = !DILocation(line: 39, column: 5, scope: !3052)
!3081 = distinct !DISubprogram(name: "ef_pack_m_vec", scope: !2816, file: !2816, line: 24, type: !3082, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3082 = !DISubroutineType(types: !3083)
!3083 = !{null, !90, !52, !86}
!3084 = !DILocalVariable(name: "in", arg: 1, scope: !3081, file: !2816, line: 24, type: !90)
!3085 = !DILocation(line: 0, scope: !3081)
!3086 = !DILocalVariable(name: "out", arg: 2, scope: !3081, file: !2816, line: 24, type: !52)
!3087 = !DILocalVariable(name: "ncols", arg: 3, scope: !3081, file: !2816, line: 24, type: !86)
!3088 = !DILocalVariable(name: "out8", scope: !3081, file: !2816, line: 26, type: !61)
!3089 = !DILocalVariable(name: "i", scope: !3081, file: !2816, line: 25, type: !86)
!3090 = !DILocation(line: 27, column: 9, scope: !3091)
!3091 = distinct !DILexicalBlock(scope: !3081, file: !2816, line: 27, column: 5)
!3092 = !DILocation(line: 27, scope: !3091)
!3093 = !DILocation(line: 27, column: 17, scope: !3094)
!3094 = distinct !DILexicalBlock(scope: !3091, file: !2816, line: 27, column: 5)
!3095 = !DILocation(line: 27, column: 20, scope: !3094)
!3096 = !DILocation(line: 27, column: 5, scope: !3091)
!3097 = !DILocation(line: 31, column: 23, scope: !3098)
!3098 = distinct !DILexicalBlock(scope: !3094, file: !2816, line: 27, column: 36)
!3099 = !DILocation(line: 31, column: 44, scope: !3098)
!3100 = !DILocation(line: 31, column: 40, scope: !3098)
!3101 = !DILocation(line: 31, column: 48, scope: !3098)
!3102 = !DILocation(line: 31, column: 37, scope: !3098)
!3103 = !DILocation(line: 31, column: 15, scope: !3098)
!3104 = !DILocation(line: 31, column: 9, scope: !3098)
!3105 = !DILocation(line: 31, column: 20, scope: !3098)
!3106 = !DILocation(line: 27, column: 31, scope: !3094)
!3107 = !DILocation(line: 27, column: 5, scope: !3094)
!3108 = distinct !{!3108, !3096, !3109, !388}
!3109 = !DILocation(line: 33, column: 5, scope: !3091)
!3110 = !DILocation(line: 34, column: 19, scope: !3111)
!3111 = distinct !DILexicalBlock(scope: !3081, file: !2816, line: 34, column: 9)
!3112 = !DILocation(line: 38, column: 23, scope: !3113)
!3113 = distinct !DILexicalBlock(scope: !3111, file: !2816, line: 34, column: 24)
!3114 = !DILocation(line: 38, column: 15, scope: !3113)
!3115 = !DILocation(line: 38, column: 9, scope: !3113)
!3116 = !DILocation(line: 38, column: 20, scope: !3113)
!3117 = !DILocation(line: 40, column: 5, scope: !3113)
!3118 = !DILocation(line: 41, column: 1, scope: !3081)
!3119 = distinct !DISubprogram(name: "ct_compare_64", scope: !3043, file: !3043, line: 46, type: !3120, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3120 = !DISubroutineType(types: !3121)
!3121 = !{!53, !86, !86}
!3122 = !DILocalVariable(name: "a", arg: 1, scope: !3119, file: !3043, line: 46, type: !86)
!3123 = !DILocation(line: 0, scope: !3119)
!3124 = !DILocalVariable(name: "b", arg: 2, scope: !3119, file: !3043, line: 46, type: !86)
!3125 = !DILocation(line: 47, column: 38, scope: !3119)
!3126 = !DILocation(line: 47, column: 44, scope: !3119)
!3127 = !DILocation(line: 47, column: 73, scope: !3119)
!3128 = !DILocation(line: 47, column: 71, scope: !3119)
!3129 = !DILocation(line: 47, column: 5, scope: !3119)
!3130 = distinct !DISubprogram(name: "ct_64_is_greater_than", scope: !3043, file: !3043, line: 35, type: !3120, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3131 = !DILocalVariable(name: "a", arg: 1, scope: !3130, file: !3043, line: 35, type: !86)
!3132 = !DILocation(line: 0, scope: !3130)
!3133 = !DILocalVariable(name: "b", arg: 2, scope: !3130, file: !3043, line: 35, type: !86)
!3134 = !DILocalVariable(name: "diff", scope: !3130, file: !3043, line: 36, type: !87)
!3135 = !DILocation(line: 37, column: 30, scope: !3130)
!3136 = !DILocation(line: 37, column: 59, scope: !3130)
!3137 = !DILocation(line: 37, column: 57, scope: !3130)
!3138 = !DILocation(line: 37, column: 5, scope: !3130)
!3139 = distinct !DISubprogram(name: "m_extract_element", scope: !2816, file: !2816, line: 16, type: !3140, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3140 = !DISubroutineType(types: !3141)
!3141 = !{!51, !411, !86}
!3142 = !DILocalVariable(name: "in", arg: 1, scope: !3139, file: !2816, line: 16, type: !411)
!3143 = !DILocation(line: 0, scope: !3139)
!3144 = !DILocalVariable(name: "index", arg: 2, scope: !3139, file: !2816, line: 16, type: !86)
!3145 = !DILocation(line: 17, column: 27, scope: !3139)
!3146 = !DILocalVariable(name: "leg", scope: !3139, file: !2816, line: 17, type: !324)
!3147 = !DILocation(line: 18, column: 30, scope: !3139)
!3148 = !DILocalVariable(name: "offset", scope: !3139, file: !2816, line: 18, type: !324)
!3149 = !DILocation(line: 20, column: 13, scope: !3139)
!3150 = !DILocation(line: 20, column: 31, scope: !3139)
!3151 = !DILocation(line: 20, column: 21, scope: !3139)
!3152 = !DILocation(line: 20, column: 12, scope: !3139)
!3153 = !DILocation(line: 20, column: 5, scope: !3139)
!3154 = distinct !DISubprogram(name: "inverse_f", scope: !583, file: !583, line: 57, type: !3155, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3155 = !DISubroutineType(types: !3156)
!3156 = !{!51, !51}
!3157 = !DILocalVariable(name: "a", arg: 1, scope: !3154, file: !583, line: 57, type: !51)
!3158 = !DILocation(line: 0, scope: !3154)
!3159 = !DILocation(line: 61, column: 24, scope: !3154)
!3160 = !DILocalVariable(name: "a2", scope: !3154, file: !583, line: 61, type: !51)
!3161 = !DILocation(line: 62, column: 24, scope: !3154)
!3162 = !DILocalVariable(name: "a4", scope: !3154, file: !583, line: 62, type: !51)
!3163 = !DILocation(line: 63, column: 24, scope: !3154)
!3164 = !DILocalVariable(name: "a8", scope: !3154, file: !583, line: 63, type: !51)
!3165 = !DILocation(line: 64, column: 24, scope: !3154)
!3166 = !DILocalVariable(name: "a6", scope: !3154, file: !583, line: 64, type: !51)
!3167 = !DILocation(line: 65, column: 25, scope: !3154)
!3168 = !DILocalVariable(name: "a14", scope: !3154, file: !583, line: 65, type: !51)
!3169 = !DILocation(line: 67, column: 5, scope: !3154)
!3170 = distinct !DISubprogram(name: "vec_mul_add_u64", scope: !3043, file: !3043, line: 94, type: !3171, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3171 = !DISubroutineType(types: !3172)
!3172 = !{null, !324, !411, !51, !52}
!3173 = !DILocalVariable(name: "legs", arg: 1, scope: !3170, file: !3043, line: 94, type: !324)
!3174 = !DILocation(line: 0, scope: !3170)
!3175 = !DILocalVariable(name: "in", arg: 2, scope: !3170, file: !3043, line: 94, type: !411)
!3176 = !DILocalVariable(name: "a", arg: 3, scope: !3170, file: !3043, line: 94, type: !51)
!3177 = !DILocalVariable(name: "acc", arg: 4, scope: !3170, file: !3043, line: 94, type: !52)
!3178 = !DILocation(line: 95, column: 20, scope: !3170)
!3179 = !DILocalVariable(name: "tab", scope: !3170, file: !3043, line: 95, type: !62)
!3180 = !DILocalVariable(name: "lsb_ask", scope: !3170, file: !3043, line: 97, type: !53)
!3181 = !DILocalVariable(name: "i", scope: !3182, file: !3043, line: 99, type: !86)
!3182 = distinct !DILexicalBlock(scope: !3170, file: !3043, line: 99, column: 5)
!3183 = !DILocation(line: 0, scope: !3182)
!3184 = !DILocation(line: 99, column: 9, scope: !3182)
!3185 = !DILocation(line: 99, scope: !3182)
!3186 = !DILocation(line: 99, column: 20, scope: !3187)
!3187 = distinct !DILexicalBlock(scope: !3182, file: !3043, line: 99, column: 5)
!3188 = !DILocation(line: 99, column: 5, scope: !3182)
!3189 = !DILocation(line: 100, column: 21, scope: !3190)
!3190 = distinct !DILexicalBlock(scope: !3187, file: !3043, line: 99, column: 32)
!3191 = !DILocation(line: 100, column: 33, scope: !3190)
!3192 = !DILocation(line: 100, column: 51, scope: !3190)
!3193 = !DILocation(line: 100, column: 46, scope: !3190)
!3194 = !DILocation(line: 100, column: 44, scope: !3190)
!3195 = !DILocation(line: 101, column: 27, scope: !3190)
!3196 = !DILocation(line: 101, column: 33, scope: !3190)
!3197 = !DILocation(line: 101, column: 52, scope: !3190)
!3198 = !DILocation(line: 101, column: 59, scope: !3190)
!3199 = !DILocation(line: 101, column: 46, scope: !3190)
!3200 = !DILocation(line: 101, column: 44, scope: !3190)
!3201 = !DILocation(line: 101, column: 17, scope: !3190)
!3202 = !DILocation(line: 102, column: 21, scope: !3190)
!3203 = !DILocation(line: 102, column: 27, scope: !3190)
!3204 = !DILocation(line: 102, column: 33, scope: !3190)
!3205 = !DILocation(line: 102, column: 52, scope: !3190)
!3206 = !DILocation(line: 102, column: 59, scope: !3190)
!3207 = !DILocation(line: 102, column: 46, scope: !3190)
!3208 = !DILocation(line: 102, column: 44, scope: !3190)
!3209 = !DILocation(line: 102, column: 17, scope: !3190)
!3210 = !DILocation(line: 103, column: 21, scope: !3190)
!3211 = !DILocation(line: 103, column: 27, scope: !3190)
!3212 = !DILocation(line: 103, column: 33, scope: !3190)
!3213 = !DILocation(line: 103, column: 52, scope: !3190)
!3214 = !DILocation(line: 103, column: 59, scope: !3190)
!3215 = !DILocation(line: 103, column: 46, scope: !3190)
!3216 = !DILocation(line: 103, column: 44, scope: !3190)
!3217 = !DILocation(line: 103, column: 17, scope: !3190)
!3218 = !DILocation(line: 100, column: 9, scope: !3190)
!3219 = !DILocation(line: 100, column: 16, scope: !3190)
!3220 = !DILocation(line: 99, column: 29, scope: !3187)
!3221 = !DILocation(line: 99, column: 5, scope: !3187)
!3222 = distinct !{!3222, !3188, !3223, !388}
!3223 = !DILocation(line: 104, column: 5, scope: !3182)
!3224 = !DILocation(line: 105, column: 1, scope: !3170)
!3225 = distinct !DISubprogram(name: "ef_unpack_m_vec", scope: !2816, file: !2816, line: 44, type: !3226, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3226 = !DISubroutineType(types: !3227)
!3227 = !{null, !86, !411, !61}
!3228 = !DILocalVariable(name: "legs", arg: 1, scope: !3225, file: !2816, line: 44, type: !86)
!3229 = !DILocation(line: 0, scope: !3225)
!3230 = !DILocalVariable(name: "in", arg: 2, scope: !3225, file: !2816, line: 44, type: !411)
!3231 = !DILocalVariable(name: "out", arg: 3, scope: !3225, file: !2816, line: 44, type: !61)
!3232 = !DILocalVariable(name: "in8", scope: !3225, file: !2816, line: 45, type: !90)
!3233 = !DILocalVariable(name: "i", scope: !3234, file: !2816, line: 46, type: !86)
!3234 = distinct !DILexicalBlock(scope: !3225, file: !2816, line: 46, column: 5)
!3235 = !DILocation(line: 0, scope: !3234)
!3236 = !DILocation(line: 46, column: 9, scope: !3234)
!3237 = !DILocation(line: 46, scope: !3234)
!3238 = !DILocation(line: 46, column: 29, scope: !3239)
!3239 = distinct !DILexicalBlock(scope: !3234, file: !2816, line: 46, column: 5)
!3240 = !DILocation(line: 46, column: 22, scope: !3239)
!3241 = !DILocation(line: 46, column: 5, scope: !3234)
!3242 = !DILocation(line: 51, column: 26, scope: !3243)
!3243 = distinct !DILexicalBlock(scope: !3239, file: !2816, line: 46, column: 42)
!3244 = !DILocation(line: 51, column: 21, scope: !3243)
!3245 = !DILocation(line: 51, column: 31, scope: !3243)
!3246 = !DILocation(line: 51, column: 9, scope: !3243)
!3247 = !DILocation(line: 51, column: 18, scope: !3243)
!3248 = !DILocation(line: 52, column: 26, scope: !3243)
!3249 = !DILocation(line: 52, column: 21, scope: !3243)
!3250 = !DILocation(line: 52, column: 30, scope: !3243)
!3251 = !DILocation(line: 52, column: 14, scope: !3243)
!3252 = !DILocation(line: 52, column: 9, scope: !3243)
!3253 = !DILocation(line: 52, column: 18, scope: !3243)
!3254 = !DILocation(line: 46, column: 37, scope: !3239)
!3255 = !DILocation(line: 46, column: 5, scope: !3239)
!3256 = distinct !{!3256, !3241, !3257, !388}
!3257 = !DILocation(line: 54, column: 5, scope: !3234)
!3258 = !DILocation(line: 55, column: 1, scope: !3225)
!3259 = distinct !DISubprogram(name: "mul_table", scope: !583, file: !583, line: 130, type: !584, scopeLine: 130, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3260 = !DILocalVariable(name: "b", arg: 1, scope: !3259, file: !583, line: 130, type: !175)
!3261 = !DILocation(line: 0, scope: !3259)
!3262 = !DILocation(line: 131, column: 19, scope: !3259)
!3263 = !DILocation(line: 131, column: 33, scope: !3259)
!3264 = !DILocalVariable(name: "x", scope: !3259, file: !583, line: 131, type: !62)
!3265 = !DILocalVariable(name: "high_nibble_mask", scope: !3259, file: !583, line: 133, type: !62)
!3266 = !DILocation(line: 135, column: 28, scope: !3259)
!3267 = !DILocalVariable(name: "high_half", scope: !3259, file: !583, line: 135, type: !62)
!3268 = !DILocation(line: 136, column: 28, scope: !3259)
!3269 = !DILocation(line: 136, column: 47, scope: !3259)
!3270 = !DILocation(line: 136, column: 34, scope: !3259)
!3271 = !DILocation(line: 136, column: 5, scope: !3259)
!3272 = distinct !DISubprogram(name: "mul_f", scope: !583, file: !583, line: 9, type: !1613, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3273 = !DILocalVariable(name: "a", arg: 1, scope: !3272, file: !583, line: 9, type: !51)
!3274 = !DILocation(line: 0, scope: !3272)
!3275 = !DILocalVariable(name: "b", arg: 2, scope: !3272, file: !583, line: 9, type: !51)
!3276 = !DILocation(line: 14, column: 10, scope: !3272)
!3277 = !DILocation(line: 14, column: 7, scope: !3272)
!3278 = !DILocation(line: 17, column: 17, scope: !3272)
!3279 = !DILocalVariable(name: "p", scope: !3272, file: !583, line: 11, type: !51)
!3280 = !DILocation(line: 18, column: 13, scope: !3272)
!3281 = !DILocation(line: 18, column: 17, scope: !3272)
!3282 = !DILocation(line: 18, column: 7, scope: !3272)
!3283 = !DILocation(line: 19, column: 13, scope: !3272)
!3284 = !DILocation(line: 19, column: 17, scope: !3272)
!3285 = !DILocation(line: 19, column: 7, scope: !3272)
!3286 = !DILocation(line: 20, column: 13, scope: !3272)
!3287 = !DILocation(line: 20, column: 17, scope: !3272)
!3288 = !DILocation(line: 20, column: 7, scope: !3272)
!3289 = !DILocalVariable(name: "top_p", scope: !3272, file: !583, line: 23, type: !51)
!3290 = !DILocation(line: 24, column: 37, scope: !3272)
!3291 = !DILocation(line: 24, column: 52, scope: !3272)
!3292 = !DILocation(line: 24, column: 43, scope: !3272)
!3293 = !DILocation(line: 24, column: 59, scope: !3272)
!3294 = !DILocalVariable(name: "out", scope: !3272, file: !583, line: 24, type: !51)
!3295 = !DILocation(line: 25, column: 5, scope: !3272)
!3296 = distinct !DISubprogram(name: "lincomb", scope: !583, file: !583, line: 70, type: !1621, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3297 = !DILocalVariable(name: "a", arg: 1, scope: !3296, file: !583, line: 70, type: !90)
!3298 = !DILocation(line: 0, scope: !3296)
!3299 = !DILocalVariable(name: "b", arg: 2, scope: !3296, file: !583, line: 71, type: !90)
!3300 = !DILocalVariable(name: "n", arg: 3, scope: !3296, file: !583, line: 71, type: !86)
!3301 = !DILocalVariable(name: "m", arg: 4, scope: !3296, file: !583, line: 71, type: !86)
!3302 = !DILocalVariable(name: "ret", scope: !3296, file: !583, line: 72, type: !51)
!3303 = !DILocalVariable(name: "i", scope: !3304, file: !583, line: 73, type: !86)
!3304 = distinct !DILexicalBlock(scope: !3296, file: !583, line: 73, column: 5)
!3305 = !DILocation(line: 0, scope: !3304)
!3306 = !DILocation(line: 73, column: 10, scope: !3304)
!3307 = !DILocation(line: 73, scope: !3304)
!3308 = !DILocation(line: 73, column: 23, scope: !3309)
!3309 = distinct !DILexicalBlock(scope: !3304, file: !583, line: 73, column: 5)
!3310 = !DILocation(line: 73, column: 5, scope: !3304)
!3311 = !DILocation(line: 74, column: 27, scope: !3312)
!3312 = distinct !DILexicalBlock(scope: !3309, file: !583, line: 73, column: 41)
!3313 = !DILocation(line: 74, column: 33, scope: !3312)
!3314 = !DILocation(line: 74, column: 21, scope: !3312)
!3315 = !DILocation(line: 74, column: 15, scope: !3312)
!3316 = !DILocation(line: 73, column: 28, scope: !3309)
!3317 = !DILocation(line: 73, column: 35, scope: !3309)
!3318 = !DILocation(line: 73, column: 5, scope: !3309)
!3319 = distinct !{!3319, !3310, !3320, !388}
!3320 = !DILocation(line: 75, column: 5, scope: !3304)
!3321 = !DILocation(line: 76, column: 5, scope: !3296)
!3322 = distinct !DISubprogram(name: "add_f", scope: !583, file: !583, line: 43, type: !1613, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3323 = !DILocalVariable(name: "a", arg: 1, scope: !3322, file: !583, line: 43, type: !51)
!3324 = !DILocation(line: 0, scope: !3322)
!3325 = !DILocalVariable(name: "b", arg: 2, scope: !3322, file: !583, line: 43, type: !51)
!3326 = !DILocation(line: 44, column: 14, scope: !3322)
!3327 = !DILocation(line: 44, column: 5, scope: !3322)
