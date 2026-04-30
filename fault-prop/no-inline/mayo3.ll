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
    #dbg_value(i32 713, !155, !DIExpression(), !152)
  store i32 713, ptr %smlen, align 4, !dbg !156
  %call = call dereferenceable_or_null(2986) ptr @calloc(i32 noundef 2986, i32 noundef 1) #7, !dbg !157
    #dbg_value(ptr %call, !158, !DIExpression(), !152)
  %call1 = call dereferenceable_or_null(32) ptr @calloc(i32 noundef 32, i32 noundef 1) #7, !dbg !159
    #dbg_value(ptr %call1, !160, !DIExpression(), !152)
  %call2 = call dereferenceable_or_null(393176) ptr @calloc(i32 noundef 1, i32 noundef 393176) #7, !dbg !161
    #dbg_value(ptr %call2, !162, !DIExpression(), !152)
  %call3 = call dereferenceable_or_null(391176) ptr @calloc(i32 noundef 1, i32 noundef 391176) #7, !dbg !163
    #dbg_value(ptr %call3, !164, !DIExpression(), !152)
  %0 = load i32, ptr %msglen, align 4, !dbg !179
    #dbg_value(i32 %0, !153, !DIExpression(), !152)
  %add4 = add i32 %0, 681, !dbg !180
  %call5 = call ptr @calloc(i32 noundef %add4, i32 noundef 1) #7, !dbg !181
    #dbg_value(ptr %call5, !182, !DIExpression(), !152)
    #dbg_declare(ptr %msg, !183, !DIExpression(), !187)
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(32) %msg, ptr noundef nonnull align 1 dereferenceable(32) @__const.example_mayo.msg, i32 32, i1 false), !dbg !187
    #dbg_declare(ptr %msg2, !188, !DIExpression(), !189)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(32) %msg2, i8 0, i32 32, i1 false), !dbg !189
  %call6 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str, ptr noundef nonnull @.str.1) #8, !dbg !190
  %call7 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.2) #8, !dbg !191
  %call8 = call i32 @pqmayo_MAYO_3_ref_mayo_keypair(ptr noundef %p, ptr noundef %call, ptr noundef %call1) #6, !dbg !192
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
  %call12 = call i32 @pqmayo_MAYO_3_ref_mayo_expand_sk(ptr noundef %p, ptr noundef %call1, ptr noundef %call3) #6, !dbg !202
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
  %call20 = call i32 @pqmayo_MAYO_3_ref_mayo_expand_pk(ptr noundef %p, ptr noundef %call, ptr noundef %call2) #6, !dbg !211
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
  %call28 = call i32 @pqmayo_MAYO_3_ref_mayo_sign(ptr noundef %p, ptr noundef %call5, ptr noundef nonnull %smlen, ptr noundef nonnull %msg, i32 noundef %1, ptr noundef %call1) #6, !dbg !221
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
  %call37 = call i32 @pqmayo_MAYO_3_ref_mayo_open(ptr noundef %p, ptr noundef nonnull %msg2, ptr noundef nonnull %msglen, ptr noundef %call5, i32 noundef %2, ptr noundef %call) #6, !dbg !231
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
  %call49 = call i32 @pqmayo_MAYO_3_ref_mayo_verify(ptr noundef %p, ptr noundef nonnull %msg, i32 noundef %4, ptr noundef %call5, ptr noundef %call) #6, !dbg !244
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
  call void @mayo_secure_free(ptr noundef %call1, i32 noundef 32) #8, !dbg !257
  call void @mayo_secure_free(ptr noundef %call3, i32 noundef 391176) #8, !dbg !258
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
define dso_local range(i32 0, 2) i32 @pqmayo_MAYO_3_ref_mayo_keypair(ptr noundef %p, ptr noundef %pk, ptr noundef %sk) local_unnamed_addr #0 !dbg !261 {
entry:
    #dbg_value(ptr %p, !292, !DIExpression(), !293)
    #dbg_value(ptr %pk, !294, !DIExpression(), !293)
    #dbg_value(ptr %sk, !295, !DIExpression(), !293)
    #dbg_value(i32 0, !296, !DIExpression(), !293)
  %call = call i32 @pqmayo_MAYO_3_ref_mayo_keypair_compact(ptr noundef %p, ptr noundef %pk, ptr noundef %sk) #6, !dbg !297
    #dbg_value(i32 %call, !296, !DIExpression(), !293)
    #dbg_label(!298, !299)
  ret i32 %call, !dbg !300
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqmayo_MAYO_3_ref_mayo_keypair_compact(ptr noundef %p, ptr noundef %cpk, ptr noundef %csk) local_unnamed_addr #0 !dbg !301 {
entry:
  %S = alloca [556 x i8], align 1
  %P = alloca [48762 x i64], align 8
  %P3 = alloca [700 x i64], align 8
  %O = alloca [1080 x i8], align 1
  %P3_upper = alloca [385 x i64], align 8
    #dbg_value(ptr %p, !302, !DIExpression(), !303)
    #dbg_value(ptr %cpk, !304, !DIExpression(), !303)
    #dbg_value(ptr %csk, !305, !DIExpression(), !303)
    #dbg_value(i32 0, !306, !DIExpression(), !303)
    #dbg_value(ptr %csk, !307, !DIExpression(), !303)
    #dbg_declare(ptr %S, !308, !DIExpression(), !312)
    #dbg_declare(ptr %P, !313, !DIExpression(), !314)
    #dbg_declare(ptr %P3, !315, !DIExpression(), !319)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(5600) %P3, i8 0, i32 5600, i1 false), !dbg !319
    #dbg_declare(ptr %O, !320, !DIExpression(), !322)
    #dbg_value(i32 7, !323, !DIExpression(), !303)
    #dbg_value(i32 108, !325, !DIExpression(), !303)
    #dbg_value(i32 108, !326, !DIExpression(), !303)
    #dbg_value(i32 10, !327, !DIExpression(), !303)
    #dbg_value(i32 540, !328, !DIExpression(), !303)
    #dbg_value(i32 41202, !329, !DIExpression(), !303)
    #dbg_value(i32 385, !330, !DIExpression(), !303)
    #dbg_value(i32 16, !331, !DIExpression(), !303)
    #dbg_value(i32 32, !332, !DIExpression(), !303)
    #dbg_value(ptr %P, !333, !DIExpression(), !303)
  %add.ptr = getelementptr inbounds nuw i8, ptr %P, i32 329616, !dbg !334
    #dbg_value(ptr %add.ptr, !335, !DIExpression(), !303)
  %call = call i32 @randombytes(ptr noundef %csk, i32 noundef 32) #8, !dbg !336
  %cmp.not = icmp eq i32 %call, 0, !dbg !338
  br i1 %cmp.not, label %if.end, label %err, !dbg !338

if.end:                                           ; preds = %entry
    #dbg_value(ptr %P, !333, !DIExpression(), !303)
  %call3 = call i32 @shake256(ptr noundef nonnull %S, i32 noundef 556, ptr noundef %csk, i32 noundef 32) #8, !dbg !339
    #dbg_value(ptr %S, !340, !DIExpression(), !303)
  %add.ptr6 = getelementptr inbounds nuw i8, ptr %S, i32 16, !dbg !341
  call fastcc void @decode(ptr noundef nonnull %add.ptr6, ptr noundef nonnull %O, i32 noundef 1080) #6, !dbg !342
  call fastcc void @expand_P1_P2(ptr noundef %p, ptr noundef nonnull %P, ptr noundef nonnull %S) #6, !dbg !343
  call fastcc void @compute_P3(ptr noundef %p, ptr noundef nonnull %P, ptr noundef nonnull %add.ptr, ptr noundef nonnull %O, ptr noundef nonnull %P3) #6, !dbg !344
  %call11 = call ptr @memcpy(ptr noundef %cpk, ptr noundef nonnull %S, i32 noundef 16) #8, !dbg !345
    #dbg_declare(ptr %P3_upper, !346, !DIExpression(), !350)
  call void @pqmayo_MAYO_3_ref_m_upper(ptr noundef %p, ptr noundef nonnull %P3, ptr noundef nonnull %P3_upper, i32 noundef 10) #6, !dbg !351
  %add.ptr15 = getelementptr inbounds nuw i8, ptr %cpk, i32 16, !dbg !352
  call fastcc void @pack_m_vecs(ptr noundef nonnull %P3_upper, ptr noundef nonnull %add.ptr15, i32 noundef 55, i32 noundef 108) #6, !dbg !353
  br label %err, !dbg !353

err:                                              ; preds = %entry, %if.end
  %ret.0 = phi i32 [ 0, %if.end ], [ 1, %entry ], !dbg !303
    #dbg_value(i32 %ret.0, !306, !DIExpression(), !303)
    #dbg_label(!354, !355)
  call void @mayo_secure_clear(ptr noundef nonnull %O, i32 noundef 1080) #8, !dbg !356
  call void @mayo_secure_clear(ptr noundef nonnull %add.ptr, i32 noundef 60480) #8, !dbg !357
  call void @mayo_secure_clear(ptr noundef nonnull %P3, i32 noundef 5600) #8, !dbg !358
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
  %call = call i32 @AES_128_CTR(ptr noundef %P, i32 noundef 376164, ptr noundef %seed_pk, i32 noundef 16) #8, !dbg !404
  call fastcc void @unpack_m_vecs(ptr noundef %P, ptr noundef %P, i32 noundef 6966, i32 noundef 108) #6, !dbg !405
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
    #dbg_value(i32 7, !418, !DIExpression(), !413)
    #dbg_value(i32 108, !419, !DIExpression(), !413)
    #dbg_value(i32 10, !420, !DIExpression(), !413)
  call fastcc void @P1_times_O(ptr noundef %p, ptr noundef %P1, ptr noundef %O, ptr noundef %P2) #6, !dbg !421
  call fastcc void @mul_add_mat_trans_x_m_mat(i32 noundef 7, ptr noundef %O, ptr noundef %P2, ptr noundef %P3, i32 noundef 108, i32 noundef 10, i32 noundef 10) #6, !dbg !422
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
  call fastcc void @mul_add_m_upper_triangular_mat_x_mat(i32 noundef 7, ptr noundef %P1, ptr noundef %O, ptr noundef %acc, i32 noundef 108, i32 noundef 108, i32 noundef 10, i32 noundef 1) #6, !dbg !466
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
  %arrayidx.5 = getelementptr inbounds nuw i8, ptr %in, i32 40, !dbg !543
  %20 = load i64, ptr %arrayidx.5, align 8, !dbg !543
  %and.5 = and i64 %20, 1229782938247303441, !dbg !546
  %and1.5 = and i32 %call, 255, !dbg !547
  %conv.5 = zext nneg i32 %and1.5 to i64, !dbg !548
  %mul.5 = mul i64 %and.5, %conv.5, !dbg !549
  %shr.5 = lshr i64 %20, 1, !dbg !550
  %and3.5 = and i64 %shr.5, 1229782938247303441, !dbg !551
  %shr4.5 = lshr i32 %call, 8, !dbg !552
  %and5.5 = and i32 %shr4.5, 15, !dbg !553
  %conv6.5 = zext nneg i32 %and5.5 to i64, !dbg !554
  %mul7.5 = mul nuw i64 %and3.5, %conv6.5, !dbg !555
  %xor.5 = xor i64 %mul.5, %mul7.5, !dbg !556
  %arrayidx8.5 = getelementptr inbounds nuw i8, ptr %in, i32 40, !dbg !557
  %21 = load i64, ptr %arrayidx8.5, align 8, !dbg !557
  %shr9.5 = lshr i64 %21, 2, !dbg !558
  %and10.5 = and i64 %shr9.5, 1229782938247303441, !dbg !559
  %shr11.5 = lshr i32 %call, 16, !dbg !560
  %and12.5 = and i32 %shr11.5, 15, !dbg !561
  %conv13.5 = zext nneg i32 %and12.5 to i64, !dbg !562
  %mul14.5 = mul nuw i64 %and10.5, %conv13.5, !dbg !563
  %xor15.5 = xor i64 %xor.5, %mul14.5, !dbg !564
  %arrayidx16.5 = getelementptr inbounds nuw i8, ptr %in, i32 40, !dbg !565
  %22 = load i64, ptr %arrayidx16.5, align 8, !dbg !565
  %shr17.5 = lshr i64 %22, 3, !dbg !566
  %and18.5 = and i64 %shr17.5, 1229782938247303441, !dbg !567
  %shr19.5 = lshr i32 %call, 24, !dbg !568
  %and20.5 = and i32 %shr19.5, 15, !dbg !569
  %conv21.5 = zext nneg i32 %and20.5 to i64, !dbg !570
  %mul22.5 = mul nuw i64 %and18.5, %conv21.5, !dbg !571
  %xor23.5 = xor i64 %xor15.5, %mul22.5, !dbg !572
  %arrayidx24.5 = getelementptr inbounds nuw i8, ptr %acc, i32 40, !dbg !574
  %23 = load i64, ptr %arrayidx24.5, align 8, !dbg !573
  %xor25.5 = xor i64 %23, %xor23.5, !dbg !573
  store i64 %xor25.5, ptr %arrayidx24.5, align 8, !dbg !573
    #dbg_value(i32 6, !540, !DIExpression(), !542)
  %arrayidx.6 = getelementptr inbounds nuw i8, ptr %in, i32 48, !dbg !543
  %24 = load i64, ptr %arrayidx.6, align 8, !dbg !543
  %and.6 = and i64 %24, 1229782938247303441, !dbg !546
  %and1.6 = and i32 %call, 255, !dbg !547
  %conv.6 = zext nneg i32 %and1.6 to i64, !dbg !548
  %mul.6 = mul i64 %and.6, %conv.6, !dbg !549
  %shr.6 = lshr i64 %24, 1, !dbg !550
  %and3.6 = and i64 %shr.6, 1229782938247303441, !dbg !551
  %shr4.6 = lshr i32 %call, 8, !dbg !552
  %and5.6 = and i32 %shr4.6, 15, !dbg !553
  %conv6.6 = zext nneg i32 %and5.6 to i64, !dbg !554
  %mul7.6 = mul nuw i64 %and3.6, %conv6.6, !dbg !555
  %xor.6 = xor i64 %mul.6, %mul7.6, !dbg !556
  %arrayidx8.6 = getelementptr inbounds nuw i8, ptr %in, i32 48, !dbg !557
  %25 = load i64, ptr %arrayidx8.6, align 8, !dbg !557
  %shr9.6 = lshr i64 %25, 2, !dbg !558
  %and10.6 = and i64 %shr9.6, 1229782938247303441, !dbg !559
  %shr11.6 = lshr i32 %call, 16, !dbg !560
  %and12.6 = and i32 %shr11.6, 15, !dbg !561
  %conv13.6 = zext nneg i32 %and12.6 to i64, !dbg !562
  %mul14.6 = mul nuw i64 %and10.6, %conv13.6, !dbg !563
  %xor15.6 = xor i64 %xor.6, %mul14.6, !dbg !564
  %arrayidx16.6 = getelementptr inbounds nuw i8, ptr %in, i32 48, !dbg !565
  %26 = load i64, ptr %arrayidx16.6, align 8, !dbg !565
  %shr17.6 = lshr i64 %26, 3, !dbg !566
  %and18.6 = and i64 %shr17.6, 1229782938247303441, !dbg !567
  %shr19.6 = lshr i32 %call, 24, !dbg !568
  %and20.6 = and i32 %shr19.6, 15, !dbg !569
  %conv21.6 = zext nneg i32 %and20.6 to i64, !dbg !570
  %mul22.6 = mul nuw i64 %and18.6, %conv21.6, !dbg !571
  %xor23.6 = xor i64 %xor15.6, %mul22.6, !dbg !572
  %arrayidx24.6 = getelementptr inbounds nuw i8, ptr %acc, i32 48, !dbg !574
  %27 = load i64, ptr %arrayidx24.6, align 8, !dbg !573
  %xor25.6 = xor i64 %27, %xor23.6, !dbg !573
  store i64 %xor25.6, ptr %arrayidx24.6, align 8, !dbg !573
    #dbg_value(i32 7, !540, !DIExpression(), !542)
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
  %tmp = alloca [7 x i64], align 8
    #dbg_value(ptr %in, !659, !DIExpression(), !660)
    #dbg_value(ptr %out, !661, !DIExpression(), !660)
    #dbg_value(i32 %vecs, !662, !DIExpression(), !660)
    #dbg_value(i32 %m, !663, !DIExpression(), !660)
  %add = add nsw i32 %m, 15, !dbg !664
  %div = sdiv i32 %add, 16, !dbg !665
    #dbg_value(i32 %div, !666, !DIExpression(), !660)
    #dbg_value(ptr %out, !667, !DIExpression(), !660)
    #dbg_declare(ptr %tmp, !668, !DIExpression(), !670)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(56) %tmp, i8 0, i32 56, i1 false), !dbg !670
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
define dso_local i32 @pqmayo_MAYO_3_ref_mayo_expand_sk(ptr noundef %p, ptr noundef %csk, ptr noundef %sk) local_unnamed_addr #0 !dbg !694 {
entry:
  %S = alloca [556 x i8], align 1
    #dbg_value(ptr %p, !703, !DIExpression(), !704)
    #dbg_value(ptr %csk, !705, !DIExpression(), !704)
    #dbg_value(ptr %sk, !706, !DIExpression(), !704)
    #dbg_value(i32 0, !707, !DIExpression(), !704)
    #dbg_declare(ptr %S, !708, !DIExpression(), !709)
    #dbg_value(ptr %sk, !710, !DIExpression(), !704)
  %O2 = getelementptr inbounds nuw i8, ptr %sk, i32 390096, !dbg !711
    #dbg_value(ptr %O2, !712, !DIExpression(), !704)
    #dbg_value(i32 10, !713, !DIExpression(), !704)
    #dbg_value(i32 108, !714, !DIExpression(), !704)
    #dbg_value(i32 540, !715, !DIExpression(), !704)
    #dbg_value(i32 16, !716, !DIExpression(), !704)
    #dbg_value(i32 32, !717, !DIExpression(), !704)
    #dbg_value(ptr %csk, !718, !DIExpression(), !704)
    #dbg_value(ptr %S, !719, !DIExpression(), !704)
  %call = call i32 @shake256(ptr noundef nonnull %S, i32 noundef 556, ptr noundef %csk, i32 noundef 32) #8, !dbg !720
  %add.ptr = getelementptr inbounds nuw i8, ptr %S, i32 16, !dbg !721
  call fastcc void @decode(ptr noundef nonnull %add.ptr, ptr noundef nonnull %O2, i32 noundef 1080) #6, !dbg !722
  call fastcc void @expand_P1_P2(ptr noundef %p, ptr noundef %sk, ptr noundef nonnull %S) #6, !dbg !723
  %add.ptr7 = getelementptr inbounds nuw i8, ptr %sk, i32 329616, !dbg !724
    #dbg_value(ptr %add.ptr7, !725, !DIExpression(), !704)
    #dbg_value(ptr %sk, !726, !DIExpression(), !704)
    #dbg_value(ptr %add.ptr7, !727, !DIExpression(), !704)
  call fastcc void @P1P1t_times_O(ptr noundef %p, ptr noundef %sk, ptr noundef nonnull %O2, ptr noundef nonnull %add.ptr7) #6, !dbg !728
  call void @mayo_secure_clear(ptr noundef nonnull %S, i32 noundef 556) #8, !dbg !729
  ret i32 0, !dbg !730
}

; Function Attrs: nounwind
define internal fastcc void @P1P1t_times_O(ptr noundef %p, ptr noundef %P1, ptr noundef %O, ptr noundef %acc) unnamed_addr #0 !dbg !731 {
entry:
    #dbg_value(ptr %p, !732, !DIExpression(), !733)
    #dbg_value(ptr %P1, !734, !DIExpression(), !733)
    #dbg_value(ptr %O, !735, !DIExpression(), !733)
    #dbg_value(ptr %acc, !736, !DIExpression(), !733)
    #dbg_value(i32 10, !737, !DIExpression(), !733)
    #dbg_value(i32 108, !738, !DIExpression(), !733)
    #dbg_value(i32 7, !739, !DIExpression(), !733)
    #dbg_value(i32 0, !740, !DIExpression(), !733)
    #dbg_value(i32 0, !741, !DIExpression(), !743)
  br label %for.cond, !dbg !744

for.cond:                                         ; preds = %for.inc27, %entry
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.inc27 ], [ 108, %entry ], !dbg !745
  %bs_mat_entries_used.0 = phi i32 [ %bs_mat_entries_used.1, %for.inc27 ], [ 0, %entry ], !dbg !745
  %r.0 = phi i32 [ %inc28, %for.inc27 ], [ 0, %entry ], !dbg !746
    #dbg_value(i32 %r.0, !741, !DIExpression(), !743)
    #dbg_value(i32 %bs_mat_entries_used.0, !740, !DIExpression(), !733)
  %exitcond2.not = icmp eq i32 %r.0, 108, !dbg !747
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
  %add.ptr.idx.1 = mul nsw i32 %bs_mat_entries_used.1, 56, !dbg !761
  %add.ptr.1 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.1, !dbg !761
  %mul8.1 = mul nuw nsw i32 %c.0, 10, !dbg !765
  %1 = getelementptr inbounds nuw i8, ptr %O, i32 %mul8.1, !dbg !766
  br label %for.cond5, !dbg !767

for.cond5:                                        ; preds = %for.body7.2, %for.cond5.preheader
  %k.0 = phi i32 [ 0, %for.cond5.preheader ], [ %add23.3, %for.body7.2 ], !dbg !768
    #dbg_value(i32 %k.0, !769, !DIExpression(), !770)
  %add.ptr.idx = mul nsw i32 %bs_mat_entries_used.1, 56, !dbg !761
  %add.ptr = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx, !dbg !761
  %mul8 = mul nuw nsw i32 %c.0, 10, !dbg !765
  %2 = getelementptr inbounds nuw i8, ptr %O, i32 %mul8, !dbg !766
  %arrayidx = getelementptr inbounds nuw i8, ptr %2, i32 %k.0, !dbg !766
  %3 = load i8, ptr %arrayidx, align 1, !dbg !766
  %mul10 = mul nuw nsw i32 %r.0, 10, !dbg !771
  %add11 = add nuw nsw i32 %mul10, %k.0, !dbg !772
  %add.ptr13.idx = mul nuw nsw i32 %add11, 56, !dbg !773
  %add.ptr13 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr13.idx, !dbg !773
  call fastcc void @m_vec_mul_add(i32 noundef 7, ptr noundef %add.ptr, i8 noundef zeroext %3, ptr noundef %add.ptr13) #6, !dbg !774
  %add.ptr15.idx = mul nsw i32 %bs_mat_entries_used.1, 56, !dbg !775
  %add.ptr15 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr15.idx, !dbg !775
  %mul16 = mul nuw nsw i32 %r.0, 10, !dbg !776
  %4 = getelementptr inbounds nuw i8, ptr %O, i32 %mul16, !dbg !777
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %4, i32 %k.0, !dbg !777
  %5 = load i8, ptr %arrayidx18, align 1, !dbg !777
  %mul19 = mul nuw nsw i32 %c.0, 10, !dbg !778
  %add20 = add nuw nsw i32 %mul19, %k.0, !dbg !779
  %add.ptr22.idx = mul nuw nsw i32 %add20, 56, !dbg !780
  %add.ptr22 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr22.idx, !dbg !780
  call fastcc void @m_vec_mul_add(i32 noundef 7, ptr noundef %add.ptr15, i8 noundef zeroext %5, ptr noundef %add.ptr22) #6, !dbg !781
    #dbg_value(i32 %k.0, !769, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !770)
  %add23 = or disjoint i32 %k.0, 1, !dbg !782
    #dbg_value(i32 %add23, !769, !DIExpression(), !770)
  %arrayidx.1 = getelementptr inbounds nuw i8, ptr %1, i32 %add23, !dbg !766
  %6 = load i8, ptr %arrayidx.1, align 1, !dbg !766
  %mul10.1 = mul nuw nsw i32 %r.0, 10, !dbg !771
  %add11.1 = add nuw nsw i32 %mul10.1, %add23, !dbg !772
  %add.ptr13.idx.1 = mul nuw nsw i32 %add11.1, 56, !dbg !773
  %add.ptr13.1 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr13.idx.1, !dbg !773
  call fastcc void @m_vec_mul_add(i32 noundef 7, ptr noundef %add.ptr.1, i8 noundef zeroext %6, ptr noundef nonnull %add.ptr13.1) #6, !dbg !774
  %add.ptr15.idx.1 = mul nsw i32 %bs_mat_entries_used.1, 56, !dbg !775
  %add.ptr15.1 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr15.idx.1, !dbg !775
  %mul16.1 = mul nuw nsw i32 %r.0, 10, !dbg !776
  %7 = getelementptr inbounds nuw i8, ptr %O, i32 %mul16.1, !dbg !777
  %arrayidx18.1 = getelementptr inbounds nuw i8, ptr %7, i32 %add23, !dbg !777
  %8 = load i8, ptr %arrayidx18.1, align 1, !dbg !777
  %mul19.1 = mul nuw nsw i32 %c.0, 10, !dbg !778
  %add20.1 = add nuw nsw i32 %mul19.1, %add23, !dbg !779
  %add.ptr22.idx.1 = mul nuw nsw i32 %add20.1, 56, !dbg !780
  %add.ptr22.1 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr22.idx.1, !dbg !780
  call fastcc void @m_vec_mul_add(i32 noundef 7, ptr noundef %add.ptr15.1, i8 noundef zeroext %8, ptr noundef nonnull %add.ptr22.1) #6, !dbg !781
    #dbg_value(i32 %k.0, !769, !DIExpression(DW_OP_constu, 2, DW_OP_or, DW_OP_stack_value), !770)
  %exitcond.2.not = icmp eq i32 %k.0, 8, !dbg !783
  br i1 %exitcond.2.not, label %for.inc25, label %for.body7.2, !dbg !767

for.body7.2:                                      ; preds = %for.cond5
  %add23.1 = or disjoint i32 %k.0, 2, !dbg !782
    #dbg_value(i32 %add23.1, !769, !DIExpression(), !770)
  %add.ptr.idx.2 = mul nsw i32 %bs_mat_entries_used.1, 56, !dbg !761
  %add.ptr.2 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.2, !dbg !761
  %mul8.2 = mul nuw nsw i32 %c.0, 10, !dbg !765
  %9 = getelementptr inbounds nuw i8, ptr %O, i32 %mul8.2, !dbg !766
  %arrayidx.2 = getelementptr inbounds nuw i8, ptr %9, i32 %add23.1, !dbg !766
  %10 = load i8, ptr %arrayidx.2, align 1, !dbg !766
  %mul10.2 = mul nuw nsw i32 %r.0, 10, !dbg !771
  %add11.2 = add nuw nsw i32 %mul10.2, %add23.1, !dbg !772
  %add.ptr13.idx.2 = mul nuw nsw i32 %add11.2, 56, !dbg !773
  %add.ptr13.2 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr13.idx.2, !dbg !773
  call fastcc void @m_vec_mul_add(i32 noundef 7, ptr noundef %add.ptr.2, i8 noundef zeroext %10, ptr noundef nonnull %add.ptr13.2) #6, !dbg !774
  %add.ptr15.idx.2 = mul nsw i32 %bs_mat_entries_used.1, 56, !dbg !775
  %add.ptr15.2 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr15.idx.2, !dbg !775
  %mul16.2 = mul nuw nsw i32 %r.0, 10, !dbg !776
  %11 = getelementptr inbounds nuw i8, ptr %O, i32 %mul16.2, !dbg !777
  %arrayidx18.2 = getelementptr inbounds nuw i8, ptr %11, i32 %add23.1, !dbg !777
  %12 = load i8, ptr %arrayidx18.2, align 1, !dbg !777
  %mul19.2 = mul nuw nsw i32 %c.0, 10, !dbg !778
  %add20.2 = add nuw nsw i32 %mul19.2, %add23.1, !dbg !779
  %add.ptr22.idx.2 = mul nuw nsw i32 %add20.2, 56, !dbg !780
  %add.ptr22.2 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr22.idx.2, !dbg !780
  call fastcc void @m_vec_mul_add(i32 noundef 7, ptr noundef %add.ptr15.2, i8 noundef zeroext %12, ptr noundef nonnull %add.ptr22.2) #6, !dbg !781
    #dbg_value(i32 %k.0, !769, !DIExpression(DW_OP_plus_uconst, 3, DW_OP_stack_value), !770)
  %add23.2 = or disjoint i32 %k.0, 3, !dbg !782
    #dbg_value(i32 %add23.2, !769, !DIExpression(), !770)
  %add.ptr.idx.3 = mul nsw i32 %bs_mat_entries_used.1, 56, !dbg !761
  %add.ptr.3 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.3, !dbg !761
  %mul8.3 = mul nuw nsw i32 %c.0, 10, !dbg !765
  %13 = getelementptr inbounds nuw i8, ptr %O, i32 %mul8.3, !dbg !766
  %arrayidx.3 = getelementptr inbounds nuw i8, ptr %13, i32 %add23.2, !dbg !766
  %14 = load i8, ptr %arrayidx.3, align 1, !dbg !766
  %mul10.3 = mul nuw nsw i32 %r.0, 10, !dbg !771
  %add11.3 = add nuw nsw i32 %mul10.3, %add23.2, !dbg !772
  %add.ptr13.idx.3 = mul nuw nsw i32 %add11.3, 56, !dbg !773
  %add.ptr13.3 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr13.idx.3, !dbg !773
  call fastcc void @m_vec_mul_add(i32 noundef 7, ptr noundef %add.ptr.3, i8 noundef zeroext %14, ptr noundef nonnull %add.ptr13.3) #6, !dbg !774
  %add.ptr15.idx.3 = mul nsw i32 %bs_mat_entries_used.1, 56, !dbg !775
  %add.ptr15.3 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr15.idx.3, !dbg !775
  %mul16.3 = mul nuw nsw i32 %r.0, 10, !dbg !776
  %15 = getelementptr inbounds nuw i8, ptr %O, i32 %mul16.3, !dbg !777
  %arrayidx18.3 = getelementptr inbounds nuw i8, ptr %15, i32 %add23.2, !dbg !777
  %16 = load i8, ptr %arrayidx18.3, align 1, !dbg !777
  %mul19.3 = mul nuw nsw i32 %c.0, 10, !dbg !778
  %add20.3 = add nuw nsw i32 %mul19.3, %add23.2, !dbg !779
  %add.ptr22.idx.3 = mul nuw nsw i32 %add20.3, 56, !dbg !780
  %add.ptr22.3 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr22.idx.3, !dbg !780
  call fastcc void @m_vec_mul_add(i32 noundef 7, ptr noundef %add.ptr15.3, i8 noundef zeroext %16, ptr noundef nonnull %add.ptr22.3) #6, !dbg !781
  %add23.3 = add nuw nsw i32 %k.0, 4, !dbg !782
    #dbg_value(i32 %add23.3, !769, !DIExpression(), !770)
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
define dso_local i32 @pqmayo_MAYO_3_ref_mayo_sign_signature(ptr noundef %p, ptr noundef %sig, ptr noundef %siglen, ptr noundef %m, i32 noundef %mlen, ptr noundef %csk) local_unnamed_addr #0 !dbg !797 {
entry:
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
    #dbg_value(ptr %p, !801, !DIExpression(), !802)
    #dbg_value(ptr %sig, !803, !DIExpression(), !802)
    #dbg_value(ptr %siglen, !804, !DIExpression(), !802)
    #dbg_value(ptr %m, !805, !DIExpression(), !802)
    #dbg_value(i32 %mlen, !806, !DIExpression(), !802)
    #dbg_value(ptr %csk, !807, !DIExpression(), !802)
    #dbg_value(i32 0, !808, !DIExpression(), !802)
    #dbg_declare(ptr %tenc, !809, !DIExpression(), !813)
    #dbg_declare(ptr %t, !814, !DIExpression(), !818)
    #dbg_declare(ptr %y, !819, !DIExpression(), !820)
    #dbg_declare(ptr %salt, !821, !DIExpression(), !822)
    #dbg_declare(ptr %V, !823, !DIExpression(), !827)
    #dbg_declare(ptr %Vdec, !828, !DIExpression(), !832)
    #dbg_declare(ptr %A, !833, !DIExpression(), !837)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(12432) %A, i8 0, i32 12432, i1 false), !dbg !837
    #dbg_declare(ptr %x, !838, !DIExpression(), !842)
    #dbg_declare(ptr %r, !843, !DIExpression(), !847)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(111) %r, i8 0, i32 111, i1 false), !dbg !847
    #dbg_declare(ptr %s, !848, !DIExpression(), !849)
    #dbg_declare(ptr %sk, !850, !DIExpression(), !851)
    #dbg_declare(ptr %Ox, !852, !DIExpression(), !853)
    #dbg_declare(ptr %tmp, !854, !DIExpression(), !858)
    #dbg_value(i32 108, !859, !DIExpression(), !802)
    #dbg_value(i32 118, !860, !DIExpression(), !802)
    #dbg_value(i32 10, !861, !DIExpression(), !802)
    #dbg_value(i32 11, !862, !DIExpression(), !802)
    #dbg_value(i32 108, !863, !DIExpression(), !802)
    #dbg_value(i32 54, !864, !DIExpression(), !802)
    #dbg_value(i32 54, !865, !DIExpression(), !802)
    #dbg_value(i32 55, !866, !DIExpression(), !802)
    #dbg_value(i32 681, !867, !DIExpression(), !802)
    #dbg_value(i32 111, !868, !DIExpression(), !802)
    #dbg_value(i32 48, !869, !DIExpression(), !802)
    #dbg_value(i32 32, !870, !DIExpression(), !802)
    #dbg_value(i32 32, !871, !DIExpression(), !802)
  %call = call i32 @pqmayo_MAYO_3_ref_mayo_expand_sk(ptr noundef %p, ptr noundef %csk, ptr noundef nonnull %sk) #6, !dbg !872
    #dbg_value(i32 %call, !808, !DIExpression(), !802)
  %cmp.not = icmp eq i32 %call, 0, !dbg !873
  br i1 %cmp.not, label %if.end, label %err, !dbg !873

if.end:                                           ; preds = %entry
    #dbg_value(ptr %csk, !875, !DIExpression(), !802)
  %call1 = call i32 @shake256(ptr noundef nonnull %tmp, i32 noundef 48, ptr noundef %m, i32 noundef %mlen) #8, !dbg !876
    #dbg_value(ptr %sk, !877, !DIExpression(), !802)
  %add.ptr = getelementptr inbounds nuw i8, ptr %sk, i32 329616, !dbg !878
    #dbg_value(ptr %add.ptr, !879, !DIExpression(), !802)
    #dbg_declare(ptr %Mtmp, !880, !DIExpression(), !884)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(6160) %Mtmp, i8 0, i32 6160, i1 false), !dbg !884
  %add.ptr5 = getelementptr inbounds nuw i8, ptr %tmp, i32 48, !dbg !885
  %call6 = call i32 @randombytes(ptr noundef nonnull %add.ptr5, i32 noundef 32) #8, !dbg !887
  %cmp7.not = icmp eq i32 %call6, 0, !dbg !888
  br i1 %cmp7.not, label %if.end9, label %err, !dbg !888

if.end9:                                          ; preds = %if.end
  %add.ptr12 = getelementptr inbounds nuw i8, ptr %tmp, i32 80, !dbg !889
  %call13 = call ptr @memcpy(ptr noundef nonnull %add.ptr12, ptr noundef %csk, i32 noundef 32) #8, !dbg !890
  %call16 = call i32 @shake256(ptr noundef nonnull %salt, i32 noundef 32, ptr noundef nonnull %tmp, i32 noundef 112) #8, !dbg !891
  %add.ptr18 = getelementptr inbounds nuw i8, ptr %tmp, i32 48, !dbg !892
  %call20 = call ptr @memcpy(ptr noundef nonnull %add.ptr18, ptr noundef nonnull %salt, i32 noundef 32) #8, !dbg !893
  %add.ptr24 = getelementptr inbounds nuw i8, ptr %tmp, i32 112, !dbg !894
    #dbg_value(ptr %add.ptr24, !895, !DIExpression(), !802)
  %call27 = call i32 @shake256(ptr noundef nonnull %tenc, i32 noundef 54, ptr noundef nonnull %tmp, i32 noundef 80) #8, !dbg !896
  call fastcc void @decode(ptr noundef nonnull %tenc, ptr noundef nonnull %t, i32 noundef 108) #6, !dbg !897
    #dbg_value(i32 0, !898, !DIExpression(), !900)
  %add.ptr61 = getelementptr inbounds nuw i8, ptr %V, i32 594, !dbg !901
  br label %for.cond, !dbg !904

for.cond:                                         ; preds = %if.else, %if.end9
  %ctr.0 = phi i32 [ 0, %if.end9 ], [ %inc75, %if.else ], !dbg !905
    #dbg_value(i32 %ctr.0, !898, !DIExpression(), !900)
  %exitcond2.not = icmp eq i32 %ctr.0, 256, !dbg !906
  br i1 %exitcond2.not, label %for.end76, label %for.body, !dbg !907

for.body:                                         ; preds = %for.cond
  %conv = trunc nuw i32 %ctr.0 to i8, !dbg !908
  store i8 %conv, ptr %add.ptr24, align 1, !dbg !909
  %call33 = call i32 @shake256(ptr noundef nonnull %V, i32 noundef 649, ptr noundef nonnull %tmp, i32 noundef 113) #8, !dbg !910
    #dbg_value(i32 0, !911, !DIExpression(), !913)
    #dbg_value(i32 0, !911, !DIExpression(), !913)
  call fastcc void @decode(ptr noundef nonnull %V, ptr noundef nonnull %Vdec, i32 noundef 108) #6, !dbg !914
    #dbg_value(i32 1, !911, !DIExpression(), !913)
  %add.ptr39.1 = getelementptr inbounds nuw i8, ptr %V, i32 54, !dbg !917
  %add.ptr42.1 = getelementptr inbounds nuw i8, ptr %Vdec, i32 108, !dbg !918
  call fastcc void @decode(ptr noundef nonnull %add.ptr39.1, ptr noundef nonnull %add.ptr42.1, i32 noundef 108) #6, !dbg !914
    #dbg_value(i32 2, !911, !DIExpression(), !913)
  %add.ptr39.2 = getelementptr inbounds nuw i8, ptr %V, i32 108, !dbg !917
  %add.ptr42.2 = getelementptr inbounds nuw i8, ptr %Vdec, i32 216, !dbg !918
  call fastcc void @decode(ptr noundef nonnull %add.ptr39.2, ptr noundef nonnull %add.ptr42.2, i32 noundef 108) #6, !dbg !914
    #dbg_value(i32 3, !911, !DIExpression(), !913)
  %add.ptr39.3 = getelementptr inbounds nuw i8, ptr %V, i32 162, !dbg !917
  %add.ptr42.3 = getelementptr inbounds nuw i8, ptr %Vdec, i32 324, !dbg !918
  call fastcc void @decode(ptr noundef nonnull %add.ptr39.3, ptr noundef nonnull %add.ptr42.3, i32 noundef 108) #6, !dbg !914
    #dbg_value(i32 4, !911, !DIExpression(), !913)
  %add.ptr39.4 = getelementptr inbounds nuw i8, ptr %V, i32 216, !dbg !917
  %add.ptr42.4 = getelementptr inbounds nuw i8, ptr %Vdec, i32 432, !dbg !918
  call fastcc void @decode(ptr noundef nonnull %add.ptr39.4, ptr noundef nonnull %add.ptr42.4, i32 noundef 108) #6, !dbg !914
    #dbg_value(i32 5, !911, !DIExpression(), !913)
  %add.ptr39.5 = getelementptr inbounds nuw i8, ptr %V, i32 270, !dbg !917
  %add.ptr42.5 = getelementptr inbounds nuw i8, ptr %Vdec, i32 540, !dbg !918
  call fastcc void @decode(ptr noundef nonnull %add.ptr39.5, ptr noundef nonnull %add.ptr42.5, i32 noundef 108) #6, !dbg !914
    #dbg_value(i32 6, !911, !DIExpression(), !913)
  %add.ptr39.6 = getelementptr inbounds nuw i8, ptr %V, i32 324, !dbg !917
  %add.ptr42.6 = getelementptr inbounds nuw i8, ptr %Vdec, i32 648, !dbg !918
  call fastcc void @decode(ptr noundef nonnull %add.ptr39.6, ptr noundef nonnull %add.ptr42.6, i32 noundef 108) #6, !dbg !914
    #dbg_value(i32 7, !911, !DIExpression(), !913)
  %add.ptr39.7 = getelementptr inbounds nuw i8, ptr %V, i32 378, !dbg !917
  %add.ptr42.7 = getelementptr inbounds nuw i8, ptr %Vdec, i32 756, !dbg !918
  call fastcc void @decode(ptr noundef nonnull %add.ptr39.7, ptr noundef nonnull %add.ptr42.7, i32 noundef 108) #6, !dbg !914
    #dbg_value(i32 8, !911, !DIExpression(), !913)
  %add.ptr39.8 = getelementptr inbounds nuw i8, ptr %V, i32 432, !dbg !917
  %add.ptr42.8 = getelementptr inbounds nuw i8, ptr %Vdec, i32 864, !dbg !918
  call fastcc void @decode(ptr noundef nonnull %add.ptr39.8, ptr noundef nonnull %add.ptr42.8, i32 noundef 108) #6, !dbg !914
    #dbg_value(i32 9, !911, !DIExpression(), !913)
  %add.ptr39.9 = getelementptr inbounds nuw i8, ptr %V, i32 486, !dbg !917
  %add.ptr42.9 = getelementptr inbounds nuw i8, ptr %Vdec, i32 972, !dbg !918
  call fastcc void @decode(ptr noundef nonnull %add.ptr39.9, ptr noundef nonnull %add.ptr42.9, i32 noundef 108) #6, !dbg !914
    #dbg_value(i32 10, !911, !DIExpression(), !913)
  %add.ptr39.10 = getelementptr inbounds nuw i8, ptr %V, i32 540, !dbg !917
  %add.ptr42.10 = getelementptr inbounds nuw i8, ptr %Vdec, i32 1080, !dbg !918
  call fastcc void @decode(ptr noundef nonnull %add.ptr39.10, ptr noundef nonnull %add.ptr42.10, i32 noundef 108) #6, !dbg !914
    #dbg_value(i32 11, !911, !DIExpression(), !913)
  call fastcc void @compute_M_and_VPV(ptr noundef %p, ptr noundef nonnull %Vdec, ptr noundef nonnull %add.ptr, ptr noundef nonnull %sk, ptr noundef nonnull %Mtmp, ptr noundef nonnull %A) #6, !dbg !919
  call fastcc void @compute_rhs(ptr noundef %p, ptr noundef nonnull %A, ptr noundef nonnull %t, ptr noundef nonnull %y) #6, !dbg !920
  call fastcc void @compute_A(ptr noundef %p, ptr noundef nonnull %Mtmp, ptr noundef nonnull %A) #6, !dbg !921
    #dbg_value(i32 0, !922, !DIExpression(), !924)
  br label %for.cond52, !dbg !925

for.cond52:                                       ; preds = %for.body55.4, %for.body
  %i51.0 = phi i32 [ 0, %for.body ], [ %inc58.7, %for.body55.4 ], !dbg !926
    #dbg_value(i32 %i51.0, !922, !DIExpression(), !924)
  %0 = mul nuw nsw i32 %i51.0, 111, !dbg !927
  %sub = add nuw nsw i32 %0, 110, !dbg !930
  %arrayidx = getelementptr inbounds nuw [12432 x i8], ptr %A, i32 0, i32 %sub, !dbg !931
  store i8 0, ptr %arrayidx, align 1, !dbg !932
    #dbg_value(i32 %i51.0, !922, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !924)
    #dbg_value(i32 %i51.0, !922, !DIExpression(DW_OP_constu, 1, DW_OP_or, DW_OP_stack_value), !924)
  %1 = mul nuw i32 %i51.0, 111, !dbg !927
  %sub.1 = add nuw i32 %1, 221, !dbg !930
  %arrayidx.1 = getelementptr inbounds nuw [12432 x i8], ptr %A, i32 0, i32 %sub.1, !dbg !931
  store i8 0, ptr %arrayidx.1, align 1, !dbg !932
    #dbg_value(i32 %i51.0, !922, !DIExpression(DW_OP_plus_uconst, 2, DW_OP_stack_value), !924)
    #dbg_value(i32 %i51.0, !922, !DIExpression(DW_OP_constu, 2, DW_OP_or, DW_OP_stack_value), !924)
  %2 = mul nuw i32 %i51.0, 111, !dbg !927
  %sub.2 = add nuw i32 %2, 332, !dbg !930
  %arrayidx.2 = getelementptr inbounds nuw [12432 x i8], ptr %A, i32 0, i32 %sub.2, !dbg !931
  store i8 0, ptr %arrayidx.2, align 1, !dbg !932
    #dbg_value(i32 %i51.0, !922, !DIExpression(DW_OP_plus_uconst, 3, DW_OP_stack_value), !924)
    #dbg_value(i32 %i51.0, !922, !DIExpression(DW_OP_constu, 3, DW_OP_or, DW_OP_stack_value), !924)
  %3 = mul nuw i32 %i51.0, 111, !dbg !927
  %sub.3 = add nuw i32 %3, 443, !dbg !930
  %arrayidx.3 = getelementptr inbounds nuw [12432 x i8], ptr %A, i32 0, i32 %sub.3, !dbg !931
  store i8 0, ptr %arrayidx.3, align 1, !dbg !932
    #dbg_value(i32 %i51.0, !922, !DIExpression(DW_OP_constu, 4, DW_OP_or, DW_OP_stack_value), !924)
  %exitcond1.4.not = icmp eq i32 %i51.0, 104, !dbg !933
  br i1 %exitcond1.4.not, label %for.end59, label %for.body55.4, !dbg !934

for.body55.4:                                     ; preds = %for.cond52
    #dbg_value(i32 %i51.0, !922, !DIExpression(DW_OP_constu, 4, DW_OP_or, DW_OP_stack_value), !924)
  %4 = mul nuw i32 %i51.0, 111, !dbg !927
  %sub.4 = add nuw i32 %4, 554, !dbg !930
  %arrayidx.4 = getelementptr inbounds nuw [12432 x i8], ptr %A, i32 0, i32 %sub.4, !dbg !931
  store i8 0, ptr %arrayidx.4, align 1, !dbg !932
    #dbg_value(i32 %i51.0, !922, !DIExpression(DW_OP_plus_uconst, 5, DW_OP_stack_value), !924)
    #dbg_value(i32 %i51.0, !922, !DIExpression(DW_OP_constu, 5, DW_OP_or, DW_OP_stack_value), !924)
  %5 = mul nuw i32 %i51.0, 111, !dbg !927
  %sub.5 = add nuw i32 %5, 665, !dbg !930
  %arrayidx.5 = getelementptr inbounds nuw [12432 x i8], ptr %A, i32 0, i32 %sub.5, !dbg !931
  store i8 0, ptr %arrayidx.5, align 1, !dbg !932
    #dbg_value(i32 %i51.0, !922, !DIExpression(DW_OP_plus_uconst, 6, DW_OP_stack_value), !924)
    #dbg_value(i32 %i51.0, !922, !DIExpression(DW_OP_constu, 6, DW_OP_or, DW_OP_stack_value), !924)
  %6 = mul nuw i32 %i51.0, 111, !dbg !927
  %sub.6 = add nuw i32 %6, 776, !dbg !930
  %arrayidx.6 = getelementptr inbounds nuw [12432 x i8], ptr %A, i32 0, i32 %sub.6, !dbg !931
  store i8 0, ptr %arrayidx.6, align 1, !dbg !932
    #dbg_value(i32 %i51.0, !922, !DIExpression(DW_OP_plus_uconst, 7, DW_OP_stack_value), !924)
    #dbg_value(i32 %i51.0, !922, !DIExpression(DW_OP_constu, 7, DW_OP_or, DW_OP_stack_value), !924)
  %7 = mul nuw i32 %i51.0, 111, !dbg !927
  %sub.7 = add nuw i32 %7, 887, !dbg !930
  %arrayidx.7 = getelementptr inbounds nuw [12432 x i8], ptr %A, i32 0, i32 %sub.7, !dbg !931
  store i8 0, ptr %arrayidx.7, align 1, !dbg !932
  %inc58.7 = add nuw nsw i32 %i51.0, 8, !dbg !935
    #dbg_value(i32 %inc58.7, !922, !DIExpression(), !924)
  br label %for.cond52, !dbg !936, !llvm.loop !937

for.end59:                                        ; preds = %for.cond52
  call fastcc void @decode(ptr noundef nonnull %add.ptr61, ptr noundef nonnull %r, i32 noundef 110) #6, !dbg !939
  %call67 = call i32 @pqmayo_MAYO_3_ref_sample_solution(ptr noundef %p, ptr noundef nonnull %A, ptr noundef nonnull %y, ptr noundef nonnull %r, ptr noundef nonnull %x, i32 noundef 11, i32 noundef 10, i32 noundef 108, i32 noundef 111) #6, !dbg !940
  %tobool.not = icmp eq i32 %call67, 0, !dbg !940
  br i1 %tobool.not, label %if.else, label %for.end76, !dbg !940

if.else:                                          ; preds = %for.end59
  %call70 = call ptr @memset(ptr noundef nonnull %Mtmp, i32 noundef 0, i32 noundef 6160) #8, !dbg !942
  %call72 = call ptr @memset(ptr noundef nonnull %A, i32 noundef 0, i32 noundef 12432) #8, !dbg !944
  %inc75 = add nuw nsw i32 %ctr.0, 1, !dbg !945
    #dbg_value(i32 %inc75, !898, !DIExpression(), !900)
  br label %for.cond, !dbg !946, !llvm.loop !947

for.end76:                                        ; preds = %for.end59, %for.cond
    #dbg_value(i32 0, !949, !DIExpression(), !951)
  br label %for.cond78, !dbg !952

for.cond78:                                       ; preds = %for.body81, %for.end76
  %i77.0 = phi i32 [ 0, %for.end76 ], [ %inc103, %for.body81 ], !dbg !953
    #dbg_value(i32 %i77.0, !949, !DIExpression(), !951)
  %exitcond3.not = icmp eq i32 %i77.0, 11, !dbg !954
  br i1 %exitcond3.not, label %for.end104, label %for.body81, !dbg !956

for.body81:                                       ; preds = %for.cond78
  %mul83 = mul nuw nsw i32 %i77.0, 108, !dbg !957
  %add.ptr84 = getelementptr inbounds nuw i8, ptr %Vdec, i32 %mul83, !dbg !959
    #dbg_value(ptr %add.ptr84, !960, !DIExpression(), !802)
  %O = getelementptr inbounds nuw i8, ptr %sk, i32 390096, !dbg !961
  %mul87 = mul nuw nsw i32 %i77.0, 10, !dbg !962
  %add.ptr88 = getelementptr inbounds nuw i8, ptr %x, i32 %mul87, !dbg !963
  call fastcc void @mat_mul(ptr noundef nonnull %O, ptr noundef nonnull %add.ptr88, ptr noundef nonnull %Ox, i32 noundef 10, i32 noundef 108, i32 noundef 1) #6, !dbg !964
  %mul92 = mul nuw nsw i32 %i77.0, 118, !dbg !965
  %add.ptr93 = getelementptr inbounds nuw i8, ptr %s, i32 %mul92, !dbg !966
  call fastcc void @mat_add(ptr noundef nonnull %add.ptr84, ptr noundef nonnull %Ox, ptr noundef nonnull %add.ptr93, i32 noundef 108, i32 noundef 1) #6, !dbg !967
  %mul95 = mul nuw nsw i32 %i77.0, 118, !dbg !968
  %add.ptr96 = getelementptr inbounds nuw i8, ptr %s, i32 %mul95, !dbg !969
  %add.ptr97 = getelementptr inbounds nuw i8, ptr %add.ptr96, i32 108, !dbg !970
  %mul99 = mul nuw nsw i32 %i77.0, 10, !dbg !971
  %add.ptr100 = getelementptr inbounds nuw i8, ptr %x, i32 %mul99, !dbg !972
  %call101 = call ptr @memcpy(ptr noundef nonnull %add.ptr97, ptr noundef nonnull %add.ptr100, i32 noundef 10) #8, !dbg !973
  %inc103 = add nuw nsw i32 %i77.0, 1, !dbg !974
    #dbg_value(i32 %inc103, !949, !DIExpression(), !951)
  br label %for.cond78, !dbg !975, !llvm.loop !976

for.end104:                                       ; preds = %for.cond78
  call fastcc void @encode(ptr noundef nonnull %s, ptr noundef %sig, i32 noundef 1298) #6, !dbg !978
  %add.ptr107 = getelementptr inbounds nuw i8, ptr %sig, i32 649, !dbg !979
  %call109 = call ptr @memcpy(ptr noundef nonnull %add.ptr107, ptr noundef nonnull %salt, i32 noundef 32) #8, !dbg !980
  store i32 681, ptr %siglen, align 4, !dbg !981
  br label %err, !dbg !982

err:                                              ; preds = %if.end, %entry, %for.end104
  %ret.0 = phi i32 [ %call, %for.end104 ], [ %call, %entry ], [ 1, %if.end ], !dbg !802
    #dbg_value(i32 %ret.0, !808, !DIExpression(), !802)
    #dbg_label(!983, !984)
  call void @mayo_secure_clear(ptr noundef nonnull %V, i32 noundef 649) #8, !dbg !985
  call void @mayo_secure_clear(ptr noundef nonnull %Vdec, i32 noundef 1188) #8, !dbg !986
  call void @mayo_secure_clear(ptr noundef nonnull %A, i32 noundef 12432) #8, !dbg !987
  call void @mayo_secure_clear(ptr noundef nonnull %r, i32 noundef 111) #8, !dbg !988
  %O114 = getelementptr inbounds nuw i8, ptr %sk, i32 390096, !dbg !989
  call void @mayo_secure_clear(ptr noundef nonnull %O114, i32 noundef 1080) #8, !dbg !990
  call void @mayo_secure_clear(ptr noundef nonnull %sk, i32 noundef 391176) #8, !dbg !991
  call void @mayo_secure_clear(ptr noundef nonnull %Ox, i32 noundef 108) #8, !dbg !992
  call void @mayo_secure_clear(ptr noundef nonnull %tmp, i32 noundef 113) #8, !dbg !993
  call void @mayo_secure_clear(ptr noundef nonnull %Mtmp, i32 noundef 6160) #8, !dbg !994
  ret i32 %ret.0, !dbg !995
}

; Function Attrs: nounwind
define internal fastcc void @compute_M_and_VPV(ptr noundef %p, ptr noundef %Vdec, ptr noundef %L, ptr noundef %P1, ptr noundef %VL, ptr noundef %VP1V) unnamed_addr #0 !dbg !996 {
entry:
  %Pv = alloca [8316 x i64], align 8
    #dbg_value(ptr %p, !999, !DIExpression(), !1000)
    #dbg_value(ptr %Vdec, !1001, !DIExpression(), !1000)
    #dbg_value(ptr %L, !1002, !DIExpression(), !1000)
    #dbg_value(ptr %P1, !1003, !DIExpression(), !1000)
    #dbg_value(ptr %VL, !1004, !DIExpression(), !1000)
    #dbg_value(ptr %VP1V, !1005, !DIExpression(), !1000)
    #dbg_value(i32 11, !1006, !DIExpression(), !1000)
    #dbg_value(i32 108, !1007, !DIExpression(), !1000)
    #dbg_value(i32 10, !1008, !DIExpression(), !1000)
  call fastcc void @mul_add_mat_x_m_mat(i32 noundef 7, ptr noundef %Vdec, ptr noundef %L, ptr noundef %VL, i32 noundef 11, i32 noundef 108, i32 noundef 10) #6, !dbg !1009
    #dbg_declare(ptr %Pv, !1010, !DIExpression(), !1014)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(66528) %Pv, i8 0, i32 66528, i1 false), !dbg !1014
  call fastcc void @P1_times_Vt(ptr noundef %p, ptr noundef %P1, ptr noundef %Vdec, ptr noundef nonnull %Pv) #6, !dbg !1015
  call fastcc void @mul_add_mat_x_m_mat(i32 noundef 7, ptr noundef %Vdec, ptr noundef nonnull %Pv, ptr noundef %VP1V, i32 noundef 11, i32 noundef 108, i32 noundef 11) #6, !dbg !1016
  ret void, !dbg !1017
}

; Function Attrs: nounwind
define internal fastcc void @compute_rhs(ptr noundef %p, ptr noundef %vPv, ptr noundef %t, ptr noundef %y) unnamed_addr #0 !dbg !1018 {
entry:
  %temp = alloca [7 x i64], align 8
    #dbg_value(ptr %p, !1021, !DIExpression(), !1022)
    #dbg_value(ptr %vPv, !1023, !DIExpression(), !1022)
    #dbg_value(ptr %t, !1024, !DIExpression(), !1022)
    #dbg_value(ptr %y, !1025, !DIExpression(), !1022)
    #dbg_value(i32 44, !1026, !DIExpression(), !1022)
    #dbg_value(i32 7, !1028, !DIExpression(), !1022)
    #dbg_value(i64 1, !1029, !DIExpression(), !1032)
    #dbg_value(i64 281474976710656, !1029, !DIExpression(), !1032)
    #dbg_value(i64 281474976710655, !1029, !DIExpression(), !1032)
    #dbg_value(i32 0, !1033, !DIExpression(), !1035)
  br label %for.cond, !dbg !1036

for.cond:                                         ; preds = %for.body.1, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc.1, %for.body.1 ], !dbg !1037
    #dbg_value(i32 %i.0, !1033, !DIExpression(), !1035)
  %.idx7 = mul nuw nsw i32 %i.0, 56, !dbg !1038
  %0 = getelementptr inbounds nuw i8, ptr %vPv, i32 %.idx7, !dbg !1038
  %arrayidx = getelementptr inbounds nuw i8, ptr %0, i32 48, !dbg !1038
  %1 = load i64, ptr %arrayidx, align 8, !dbg !1041
  %and = and i64 %1, 281474976710655, !dbg !1041
  store i64 %and, ptr %arrayidx, align 8, !dbg !1041
    #dbg_value(i32 %i.0, !1033, !DIExpression(DW_OP_constu, 1, DW_OP_or, DW_OP_stack_value), !1035)
  %exitcond.1.not = icmp eq i32 %i.0, 120, !dbg !1042
  br i1 %exitcond.1.not, label %for.end, label %for.body.1, !dbg !1043

for.body.1:                                       ; preds = %for.cond
    #dbg_value(i32 %i.0, !1033, !DIExpression(DW_OP_constu, 1, DW_OP_or, DW_OP_stack_value), !1035)
  %2 = mul nuw i32 %i.0, 56, !dbg !1038
  %3 = getelementptr i8, ptr %vPv, i32 %2, !dbg !1038
  %arrayidx.1 = getelementptr i8, ptr %3, i32 104, !dbg !1038
  %4 = load i64, ptr %arrayidx.1, align 8, !dbg !1041
  %and.1 = and i64 %4, 281474976710655, !dbg !1041
  store i64 %and.1, ptr %arrayidx.1, align 8, !dbg !1041
  %inc.1 = add nuw nsw i32 %i.0, 2, !dbg !1044
    #dbg_value(i32 %inc.1, !1033, !DIExpression(), !1035)
  br label %for.cond, !dbg !1045, !llvm.loop !1046

for.end:                                          ; preds = %for.cond
    #dbg_declare(ptr %temp, !1048, !DIExpression(), !1049)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(56) %temp, i8 0, i32 56, i1 false), !dbg !1049
    #dbg_value(ptr %temp, !1050, !DIExpression(), !1022)
    #dbg_value(i32 10, !1051, !DIExpression(), !1053)
  br label %for.cond3, !dbg !1054

for.cond3:                                        ; preds = %for.inc77, %for.end
  %i2.0 = phi i32 [ 10, %for.end ], [ %dec78, %for.inc77 ], !dbg !1055
    #dbg_value(i32 %i2.0, !1051, !DIExpression(), !1053)
  %cmp4 = icmp sgt i32 %i2.0, -1, !dbg !1056
  br i1 %cmp4, label %for.cond6, label %for.cond81, !dbg !1058

for.cond6:                                        ; preds = %for.cond3, %for.body8
  %j.0 = phi i32 [ %inc75, %for.body8 ], [ %i2.0, %for.cond3 ], !dbg !1059
    #dbg_value(i32 %j.0, !1062, !DIExpression(), !1063)
  %exitcond10.not = icmp eq i32 %j.0, 11, !dbg !1064
  br i1 %exitcond10.not, label %for.inc77, label %for.body8, !dbg !1066

for.body8:                                        ; preds = %for.cond6
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %temp, i32 48, !dbg !1067
  %5 = load i64, ptr %arrayidx9, align 8, !dbg !1067
  %shr = lshr i64 %5, 44, !dbg !1069
  %rem.lhs.trunc = trunc i64 %shr to i8, !dbg !1070
    #dbg_value(i8 %rem1, !1071, !DIExpression(), !1072)
  %arrayidx10 = getelementptr inbounds nuw i8, ptr %temp, i32 48, !dbg !1073
  %shl11 = shl i64 %5, 4, !dbg !1074
  store i64 %shl11, ptr %arrayidx10, align 8, !dbg !1074
    #dbg_value(i32 5, !1075, !DIExpression(), !1077)
    #dbg_value(i32 5, !1075, !DIExpression(), !1077)
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %temp, i32 40, !dbg !1078
  %6 = load i64, ptr %arrayidx16, align 8, !dbg !1078
  %shr17 = lshr i64 %6, 60, !dbg !1081
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %temp, i32 48, !dbg !1082
  %7 = load i64, ptr %arrayidx19, align 8, !dbg !1083
  %xor = xor i64 %7, %shr17, !dbg !1083
  store i64 %xor, ptr %arrayidx19, align 8, !dbg !1083
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %temp, i32 40, !dbg !1084
  %8 = load i64, ptr %arrayidx20, align 8, !dbg !1085
  %shl21 = shl i64 %8, 4, !dbg !1085
  store i64 %shl21, ptr %arrayidx20, align 8, !dbg !1085
    #dbg_value(i32 4, !1075, !DIExpression(), !1077)
  %arrayidx16.1 = getelementptr inbounds nuw i8, ptr %temp, i32 32, !dbg !1078
  %9 = load i64, ptr %arrayidx16.1, align 8, !dbg !1078
  %shr17.1 = lshr i64 %9, 60, !dbg !1081
  %arrayidx19.1 = getelementptr inbounds nuw i8, ptr %temp, i32 40, !dbg !1082
  %10 = load i64, ptr %arrayidx19.1, align 8, !dbg !1083
  %xor.1 = xor i64 %10, %shr17.1, !dbg !1083
  store i64 %xor.1, ptr %arrayidx19.1, align 8, !dbg !1083
  %arrayidx20.1 = getelementptr inbounds nuw i8, ptr %temp, i32 32, !dbg !1084
  %11 = load i64, ptr %arrayidx20.1, align 8, !dbg !1085
  %shl21.1 = shl i64 %11, 4, !dbg !1085
  store i64 %shl21.1, ptr %arrayidx20.1, align 8, !dbg !1085
    #dbg_value(i32 3, !1075, !DIExpression(), !1077)
  %arrayidx16.2 = getelementptr inbounds nuw i8, ptr %temp, i32 24, !dbg !1078
  %12 = load i64, ptr %arrayidx16.2, align 8, !dbg !1078
  %shr17.2 = lshr i64 %12, 60, !dbg !1081
  %arrayidx19.2 = getelementptr inbounds nuw i8, ptr %temp, i32 32, !dbg !1082
  %13 = load i64, ptr %arrayidx19.2, align 8, !dbg !1083
  %xor.2 = xor i64 %13, %shr17.2, !dbg !1083
  store i64 %xor.2, ptr %arrayidx19.2, align 8, !dbg !1083
  %arrayidx20.2 = getelementptr inbounds nuw i8, ptr %temp, i32 24, !dbg !1084
  %14 = load i64, ptr %arrayidx20.2, align 8, !dbg !1085
  %shl21.2 = shl i64 %14, 4, !dbg !1085
  store i64 %shl21.2, ptr %arrayidx20.2, align 8, !dbg !1085
    #dbg_value(i32 2, !1075, !DIExpression(), !1077)
  %arrayidx16.3 = getelementptr inbounds nuw i8, ptr %temp, i32 16, !dbg !1078
  %15 = load i64, ptr %arrayidx16.3, align 8, !dbg !1078
  %shr17.3 = lshr i64 %15, 60, !dbg !1081
  %arrayidx19.3 = getelementptr inbounds nuw i8, ptr %temp, i32 24, !dbg !1082
  %16 = load i64, ptr %arrayidx19.3, align 8, !dbg !1083
  %xor.3 = xor i64 %16, %shr17.3, !dbg !1083
  store i64 %xor.3, ptr %arrayidx19.3, align 8, !dbg !1083
  %arrayidx20.3 = getelementptr inbounds nuw i8, ptr %temp, i32 16, !dbg !1084
  %17 = load i64, ptr %arrayidx20.3, align 8, !dbg !1085
  %shl21.3 = shl i64 %17, 4, !dbg !1085
  store i64 %shl21.3, ptr %arrayidx20.3, align 8, !dbg !1085
    #dbg_value(i32 1, !1075, !DIExpression(), !1077)
  %arrayidx16.4 = getelementptr inbounds nuw i8, ptr %temp, i32 8, !dbg !1078
  %18 = load i64, ptr %arrayidx16.4, align 8, !dbg !1078
  %shr17.4 = lshr i64 %18, 60, !dbg !1081
  %arrayidx19.4 = getelementptr inbounds nuw i8, ptr %temp, i32 16, !dbg !1082
  %19 = load i64, ptr %arrayidx19.4, align 8, !dbg !1083
  %xor.4 = xor i64 %19, %shr17.4, !dbg !1083
  store i64 %xor.4, ptr %arrayidx19.4, align 8, !dbg !1083
  %arrayidx20.4 = getelementptr inbounds nuw i8, ptr %temp, i32 8, !dbg !1084
  %20 = load i64, ptr %arrayidx20.4, align 8, !dbg !1085
  %shl21.4 = shl i64 %20, 4, !dbg !1085
  store i64 %shl21.4, ptr %arrayidx20.4, align 8, !dbg !1085
    #dbg_value(i32 0, !1075, !DIExpression(), !1077)
  %21 = load i64, ptr %temp, align 8, !dbg !1078
  %shr17.5 = lshr i64 %21, 60, !dbg !1081
  %arrayidx19.5 = getelementptr inbounds nuw i8, ptr %temp, i32 8, !dbg !1082
  %22 = load i64, ptr %arrayidx19.5, align 8, !dbg !1083
  %xor.5 = xor i64 %22, %shr17.5, !dbg !1083
  store i64 %xor.5, ptr %arrayidx19.5, align 8, !dbg !1083
  %shl21.5 = shl i64 %21, 4, !dbg !1085
  store i64 %shl21.5, ptr %temp, align 8, !dbg !1085
    #dbg_value(i32 -1, !1075, !DIExpression(), !1077)
  %rem1 = and i8 %rem.lhs.trunc, 15, !dbg !1070
    #dbg_value(i32 0, !1086, !DIExpression(), !1088)
  %call = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %rem1, i8 noundef zeroext 8) #6, !dbg !1089
  %23 = load i8, ptr %temp, align 1, !dbg !1094
  %xor356 = xor i8 %23, %call, !dbg !1094
  store i8 %xor356, ptr %temp, align 1, !dbg !1094
    #dbg_value(i32 1, !1086, !DIExpression(), !1088)
  %call38.1 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %rem1, i8 noundef zeroext 0) #6, !dbg !1095
  %shl40.1 = shl nuw i8 %call38.1, 4, !dbg !1097
  %24 = load i8, ptr %temp, align 1, !dbg !1098
  %xor44.1 = xor i8 %shl40.1, %24, !dbg !1098
  store i8 %xor44.1, ptr %temp, align 1, !dbg !1098
    #dbg_value(i32 2, !1086, !DIExpression(), !1088)
  %call.2 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %rem1, i8 noundef zeroext 1) #6, !dbg !1089
  %arrayidx33.2 = getelementptr inbounds nuw i8, ptr %temp, i32 1, !dbg !1099
  %25 = load i8, ptr %arrayidx33.2, align 1, !dbg !1094
  %xor356.2 = xor i8 %25, %call.2, !dbg !1094
  store i8 %xor356.2, ptr %arrayidx33.2, align 1, !dbg !1094
    #dbg_value(i32 3, !1086, !DIExpression(), !1088)
  %call38.3 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %rem1, i8 noundef zeroext 7) #6, !dbg !1095
  %shl40.3 = shl nuw i8 %call38.3, 4, !dbg !1097
  %arrayidx42.3 = getelementptr inbounds nuw i8, ptr %temp, i32 1, !dbg !1100
  %26 = load i8, ptr %arrayidx42.3, align 1, !dbg !1098
  %xor44.3 = xor i8 %shl40.3, %26, !dbg !1098
  store i8 %xor44.3, ptr %arrayidx42.3, align 1, !dbg !1098
    #dbg_value(i32 4, !1086, !DIExpression(), !1088)
    #dbg_value(i32 0, !1101, !DIExpression(), !1103)
  %mul54 = mul nuw nsw i32 %i2.0, 11, !dbg !1104
  %add55 = add nuw nsw i32 %mul54, %j.0, !dbg !1107
  %.idx = mul nuw nsw i32 %add55, 56, !dbg !1108
  %27 = getelementptr i8, ptr %vPv, i32 %.idx, !dbg !1108
  %28 = load i64, ptr %27, align 8, !dbg !1108
  %cmp59.not = icmp eq i32 %i2.0, %j.0, !dbg !1109
  %mul62 = mul nuw nsw i32 %j.0, 11, !dbg !1110
  %add63 = add nuw nsw i32 %mul62, %i2.0, !dbg !1111
  %.idx4 = mul nuw nsw i32 %add63, 56, !dbg !1112
  %29 = getelementptr i8, ptr %vPv, i32 %.idx4, !dbg !1112
  %30 = load i64, ptr %29, align 8, !dbg !1112
  %mul67 = select i1 %cmp59.not, i64 0, i64 %30, !dbg !1113
  %xor68 = xor i64 %28, %mul67, !dbg !1114
  %31 = load i64, ptr %temp, align 8, !dbg !1115
  %xor70 = xor i64 %31, %xor68, !dbg !1115
  store i64 %xor70, ptr %temp, align 8, !dbg !1115
    #dbg_value(i32 1, !1101, !DIExpression(), !1103)
  %mul54.1 = mul nuw nsw i32 %i2.0, 11, !dbg !1104
  %add55.1 = add nuw nsw i32 %mul54.1, %j.0, !dbg !1107
  %.idx.1 = mul nuw nsw i32 %add55.1, 56, !dbg !1108
  %32 = getelementptr i8, ptr %vPv, i32 %.idx.1, !dbg !1108
  %arrayidx58.1 = getelementptr i8, ptr %32, i32 8, !dbg !1108
  %33 = load i64, ptr %arrayidx58.1, align 8, !dbg !1108
  %cmp59.not.1 = icmp eq i32 %i2.0, %j.0, !dbg !1109
  %mul62.1 = mul nuw nsw i32 %j.0, 11, !dbg !1110
  %add63.1 = add nuw nsw i32 %mul62.1, %i2.0, !dbg !1111
  %.idx4.1 = mul nuw nsw i32 %add63.1, 56, !dbg !1112
  %34 = getelementptr i8, ptr %vPv, i32 %.idx4.1, !dbg !1112
  %arrayidx66.1 = getelementptr i8, ptr %34, i32 8, !dbg !1112
  %35 = load i64, ptr %arrayidx66.1, align 8, !dbg !1112
  %mul67.1 = select i1 %cmp59.not.1, i64 0, i64 %35, !dbg !1113
  %xor68.1 = xor i64 %33, %mul67.1, !dbg !1114
  %arrayidx69.1 = getelementptr inbounds nuw i8, ptr %temp, i32 8, !dbg !1116
  %36 = load i64, ptr %arrayidx69.1, align 8, !dbg !1115
  %xor70.1 = xor i64 %36, %xor68.1, !dbg !1115
  store i64 %xor70.1, ptr %arrayidx69.1, align 8, !dbg !1115
    #dbg_value(i32 2, !1101, !DIExpression(), !1103)
  %mul54.2 = mul nuw nsw i32 %i2.0, 11, !dbg !1104
  %add55.2 = add nuw nsw i32 %mul54.2, %j.0, !dbg !1107
  %.idx.2 = mul nuw nsw i32 %add55.2, 56, !dbg !1108
  %37 = getelementptr i8, ptr %vPv, i32 %.idx.2, !dbg !1108
  %arrayidx58.2 = getelementptr i8, ptr %37, i32 16, !dbg !1108
  %38 = load i64, ptr %arrayidx58.2, align 8, !dbg !1108
  %cmp59.not.2 = icmp eq i32 %i2.0, %j.0, !dbg !1109
  %mul62.2 = mul nuw nsw i32 %j.0, 11, !dbg !1110
  %add63.2 = add nuw nsw i32 %mul62.2, %i2.0, !dbg !1111
  %.idx4.2 = mul nuw nsw i32 %add63.2, 56, !dbg !1112
  %39 = getelementptr i8, ptr %vPv, i32 %.idx4.2, !dbg !1112
  %arrayidx66.2 = getelementptr i8, ptr %39, i32 16, !dbg !1112
  %40 = load i64, ptr %arrayidx66.2, align 8, !dbg !1112
  %mul67.2 = select i1 %cmp59.not.2, i64 0, i64 %40, !dbg !1113
  %xor68.2 = xor i64 %38, %mul67.2, !dbg !1114
  %arrayidx69.2 = getelementptr inbounds nuw i8, ptr %temp, i32 16, !dbg !1116
  %41 = load i64, ptr %arrayidx69.2, align 8, !dbg !1115
  %xor70.2 = xor i64 %41, %xor68.2, !dbg !1115
  store i64 %xor70.2, ptr %arrayidx69.2, align 8, !dbg !1115
    #dbg_value(i32 3, !1101, !DIExpression(), !1103)
  %mul54.3 = mul nuw nsw i32 %i2.0, 11, !dbg !1104
  %add55.3 = add nuw nsw i32 %mul54.3, %j.0, !dbg !1107
  %.idx.3 = mul nuw nsw i32 %add55.3, 56, !dbg !1108
  %42 = getelementptr i8, ptr %vPv, i32 %.idx.3, !dbg !1108
  %arrayidx58.3 = getelementptr i8, ptr %42, i32 24, !dbg !1108
  %43 = load i64, ptr %arrayidx58.3, align 8, !dbg !1108
  %cmp59.not.3 = icmp eq i32 %i2.0, %j.0, !dbg !1109
  %mul62.3 = mul nuw nsw i32 %j.0, 11, !dbg !1110
  %add63.3 = add nuw nsw i32 %mul62.3, %i2.0, !dbg !1111
  %.idx4.3 = mul nuw nsw i32 %add63.3, 56, !dbg !1112
  %44 = getelementptr i8, ptr %vPv, i32 %.idx4.3, !dbg !1112
  %arrayidx66.3 = getelementptr i8, ptr %44, i32 24, !dbg !1112
  %45 = load i64, ptr %arrayidx66.3, align 8, !dbg !1112
  %mul67.3 = select i1 %cmp59.not.3, i64 0, i64 %45, !dbg !1113
  %xor68.3 = xor i64 %43, %mul67.3, !dbg !1114
  %arrayidx69.3 = getelementptr inbounds nuw i8, ptr %temp, i32 24, !dbg !1116
  %46 = load i64, ptr %arrayidx69.3, align 8, !dbg !1115
  %xor70.3 = xor i64 %46, %xor68.3, !dbg !1115
  store i64 %xor70.3, ptr %arrayidx69.3, align 8, !dbg !1115
    #dbg_value(i32 4, !1101, !DIExpression(), !1103)
  %mul54.4 = mul nuw nsw i32 %i2.0, 11, !dbg !1104
  %add55.4 = add nuw nsw i32 %mul54.4, %j.0, !dbg !1107
  %.idx.4 = mul nuw nsw i32 %add55.4, 56, !dbg !1108
  %47 = getelementptr i8, ptr %vPv, i32 %.idx.4, !dbg !1108
  %arrayidx58.4 = getelementptr i8, ptr %47, i32 32, !dbg !1108
  %48 = load i64, ptr %arrayidx58.4, align 8, !dbg !1108
  %cmp59.not.4 = icmp eq i32 %i2.0, %j.0, !dbg !1109
  %mul62.4 = mul nuw nsw i32 %j.0, 11, !dbg !1110
  %add63.4 = add nuw nsw i32 %mul62.4, %i2.0, !dbg !1111
  %.idx4.4 = mul nuw nsw i32 %add63.4, 56, !dbg !1112
  %49 = getelementptr i8, ptr %vPv, i32 %.idx4.4, !dbg !1112
  %arrayidx66.4 = getelementptr i8, ptr %49, i32 32, !dbg !1112
  %50 = load i64, ptr %arrayidx66.4, align 8, !dbg !1112
  %mul67.4 = select i1 %cmp59.not.4, i64 0, i64 %50, !dbg !1113
  %xor68.4 = xor i64 %48, %mul67.4, !dbg !1114
  %arrayidx69.4 = getelementptr inbounds nuw i8, ptr %temp, i32 32, !dbg !1116
  %51 = load i64, ptr %arrayidx69.4, align 8, !dbg !1115
  %xor70.4 = xor i64 %51, %xor68.4, !dbg !1115
  store i64 %xor70.4, ptr %arrayidx69.4, align 8, !dbg !1115
    #dbg_value(i32 5, !1101, !DIExpression(), !1103)
  %mul54.5 = mul nuw nsw i32 %i2.0, 11, !dbg !1104
  %add55.5 = add nuw nsw i32 %mul54.5, %j.0, !dbg !1107
  %.idx.5 = mul nuw nsw i32 %add55.5, 56, !dbg !1108
  %52 = getelementptr i8, ptr %vPv, i32 %.idx.5, !dbg !1108
  %arrayidx58.5 = getelementptr i8, ptr %52, i32 40, !dbg !1108
  %53 = load i64, ptr %arrayidx58.5, align 8, !dbg !1108
  %cmp59.not.5 = icmp eq i32 %i2.0, %j.0, !dbg !1109
  %mul62.5 = mul nuw nsw i32 %j.0, 11, !dbg !1110
  %add63.5 = add nuw nsw i32 %mul62.5, %i2.0, !dbg !1111
  %.idx4.5 = mul nuw nsw i32 %add63.5, 56, !dbg !1112
  %54 = getelementptr i8, ptr %vPv, i32 %.idx4.5, !dbg !1112
  %arrayidx66.5 = getelementptr i8, ptr %54, i32 40, !dbg !1112
  %55 = load i64, ptr %arrayidx66.5, align 8, !dbg !1112
  %mul67.5 = select i1 %cmp59.not.5, i64 0, i64 %55, !dbg !1113
  %xor68.5 = xor i64 %53, %mul67.5, !dbg !1114
  %arrayidx69.5 = getelementptr inbounds nuw i8, ptr %temp, i32 40, !dbg !1116
  %56 = load i64, ptr %arrayidx69.5, align 8, !dbg !1115
  %xor70.5 = xor i64 %56, %xor68.5, !dbg !1115
  store i64 %xor70.5, ptr %arrayidx69.5, align 8, !dbg !1115
    #dbg_value(i32 6, !1101, !DIExpression(), !1103)
  %mul54.6 = mul nuw nsw i32 %i2.0, 11, !dbg !1104
  %add55.6 = add nuw nsw i32 %mul54.6, %j.0, !dbg !1107
  %.idx.6 = mul nuw nsw i32 %add55.6, 56, !dbg !1108
  %57 = getelementptr i8, ptr %vPv, i32 %.idx.6, !dbg !1108
  %arrayidx58.6 = getelementptr i8, ptr %57, i32 48, !dbg !1108
  %58 = load i64, ptr %arrayidx58.6, align 8, !dbg !1108
  %cmp59.not.6 = icmp eq i32 %i2.0, %j.0, !dbg !1109
  %mul62.6 = mul nuw nsw i32 %j.0, 11, !dbg !1110
  %add63.6 = add nuw nsw i32 %mul62.6, %i2.0, !dbg !1111
  %.idx4.6 = mul nuw nsw i32 %add63.6, 56, !dbg !1112
  %59 = getelementptr i8, ptr %vPv, i32 %.idx4.6, !dbg !1112
  %arrayidx66.6 = getelementptr i8, ptr %59, i32 48, !dbg !1112
  %60 = load i64, ptr %arrayidx66.6, align 8, !dbg !1112
  %mul67.6 = select i1 %cmp59.not.6, i64 0, i64 %60, !dbg !1113
  %xor68.6 = xor i64 %58, %mul67.6, !dbg !1114
  %arrayidx69.6 = getelementptr inbounds nuw i8, ptr %temp, i32 48, !dbg !1116
  %61 = load i64, ptr %arrayidx69.6, align 8, !dbg !1115
  %xor70.6 = xor i64 %61, %xor68.6, !dbg !1115
  store i64 %xor70.6, ptr %arrayidx69.6, align 8, !dbg !1115
    #dbg_value(i32 7, !1101, !DIExpression(), !1103)
  %inc75 = add nuw nsw i32 %j.0, 1, !dbg !1117
    #dbg_value(i32 %inc75, !1062, !DIExpression(), !1063)
  br label %for.cond6, !dbg !1118, !llvm.loop !1119

for.inc77:                                        ; preds = %for.cond6
  %dec78 = add nsw i32 %i2.0, -1, !dbg !1121
    #dbg_value(i32 %dec78, !1051, !DIExpression(), !1053)
  br label %for.cond3, !dbg !1122, !llvm.loop !1123

for.cond81:                                       ; preds = %for.cond3, %for.body84.4
  %i80.0 = phi i32 [ %add106.4, %for.body84.4 ], [ 0, %for.cond3 ], !dbg !1125
    #dbg_value(i32 %i80.0, !1127, !DIExpression(), !1128)
  %arrayidx85 = getelementptr inbounds nuw i8, ptr %t, i32 %i80.0, !dbg !1129
  %62 = load i8, ptr %arrayidx85, align 1, !dbg !1129
  %div87 = lshr exact i32 %i80.0, 1, !dbg !1132
  %arrayidx88 = getelementptr inbounds nuw i8, ptr %temp, i32 %div87, !dbg !1133
  %63 = load i8, ptr %arrayidx88, align 1, !dbg !1133
  %64 = and i8 %63, 15, !dbg !1134
  %xor912 = xor i8 %62, %64, !dbg !1135
  %arrayidx93 = getelementptr inbounds nuw i8, ptr %y, i32 %i80.0, !dbg !1136
  store i8 %xor912, ptr %arrayidx93, align 1, !dbg !1137
  %add94 = or disjoint i32 %i80.0, 1, !dbg !1138
  %arrayidx95 = getelementptr inbounds nuw i8, ptr %t, i32 %add94, !dbg !1139
  %65 = load i8, ptr %arrayidx95, align 1, !dbg !1139
  %66 = lshr i8 %63, 4, !dbg !1140
  %xor1013 = xor i8 %65, %66, !dbg !1141
  %add103 = or disjoint i32 %i80.0, 1, !dbg !1142
  %arrayidx104 = getelementptr inbounds nuw i8, ptr %y, i32 %add103, !dbg !1143
  store i8 %xor1013, ptr %arrayidx104, align 1, !dbg !1144
    #dbg_value(i32 %i80.0, !1127, !DIExpression(DW_OP_plus_uconst, 2, DW_OP_stack_value), !1128)
  %add106 = add nuw nsw i32 %i80.0, 2, !dbg !1145
    #dbg_value(i32 %add106, !1127, !DIExpression(), !1128)
  %arrayidx85.1 = getelementptr inbounds nuw i8, ptr %t, i32 %add106, !dbg !1129
  %67 = load i8, ptr %arrayidx85.1, align 1, !dbg !1129
  %div87.1 = lshr exact i32 %add106, 1, !dbg !1132
  %arrayidx88.1 = getelementptr inbounds nuw i8, ptr %temp, i32 %div87.1, !dbg !1133
  %68 = load i8, ptr %arrayidx88.1, align 1, !dbg !1133
  %69 = and i8 %68, 15, !dbg !1134
  %xor912.1 = xor i8 %67, %69, !dbg !1135
  %arrayidx93.1 = getelementptr inbounds nuw i8, ptr %y, i32 %add106, !dbg !1136
  store i8 %xor912.1, ptr %arrayidx93.1, align 1, !dbg !1137
  %add94.1 = or disjoint i32 %add106, 1, !dbg !1138
  %arrayidx95.1 = getelementptr inbounds nuw i8, ptr %t, i32 %add94.1, !dbg !1139
  %70 = load i8, ptr %arrayidx95.1, align 1, !dbg !1139
  %71 = lshr i8 %68, 4, !dbg !1140
  %xor1013.1 = xor i8 %70, %71, !dbg !1141
  %add103.1 = or disjoint i32 %add106, 1, !dbg !1142
  %arrayidx104.1 = getelementptr inbounds nuw i8, ptr %y, i32 %add103.1, !dbg !1143
  store i8 %xor1013.1, ptr %arrayidx104.1, align 1, !dbg !1144
    #dbg_value(i32 %i80.0, !1127, !DIExpression(DW_OP_plus_uconst, 4, DW_OP_stack_value), !1128)
  %add106.1 = add nuw nsw i32 %i80.0, 4, !dbg !1145
    #dbg_value(i32 %add106.1, !1127, !DIExpression(), !1128)
  %arrayidx85.2 = getelementptr inbounds nuw i8, ptr %t, i32 %add106.1, !dbg !1129
  %72 = load i8, ptr %arrayidx85.2, align 1, !dbg !1129
  %div87.2 = lshr exact i32 %add106.1, 1, !dbg !1132
  %arrayidx88.2 = getelementptr inbounds nuw i8, ptr %temp, i32 %div87.2, !dbg !1133
  %73 = load i8, ptr %arrayidx88.2, align 1, !dbg !1133
  %74 = and i8 %73, 15, !dbg !1134
  %xor912.2 = xor i8 %72, %74, !dbg !1135
  %arrayidx93.2 = getelementptr inbounds nuw i8, ptr %y, i32 %add106.1, !dbg !1136
  store i8 %xor912.2, ptr %arrayidx93.2, align 1, !dbg !1137
  %add94.2 = or disjoint i32 %add106.1, 1, !dbg !1138
  %arrayidx95.2 = getelementptr inbounds nuw i8, ptr %t, i32 %add94.2, !dbg !1139
  %75 = load i8, ptr %arrayidx95.2, align 1, !dbg !1139
  %76 = lshr i8 %73, 4, !dbg !1140
  %xor1013.2 = xor i8 %75, %76, !dbg !1141
  %add103.2 = or disjoint i32 %add106.1, 1, !dbg !1142
  %arrayidx104.2 = getelementptr inbounds nuw i8, ptr %y, i32 %add103.2, !dbg !1143
  store i8 %xor1013.2, ptr %arrayidx104.2, align 1, !dbg !1144
    #dbg_value(i32 %i80.0, !1127, !DIExpression(DW_OP_plus_uconst, 6, DW_OP_stack_value), !1128)
  %add106.2 = add nuw nsw i32 %i80.0, 6, !dbg !1145
    #dbg_value(i32 %add106.2, !1127, !DIExpression(), !1128)
  %arrayidx85.3 = getelementptr inbounds nuw i8, ptr %t, i32 %add106.2, !dbg !1129
  %77 = load i8, ptr %arrayidx85.3, align 1, !dbg !1129
  %div87.3 = lshr exact i32 %add106.2, 1, !dbg !1132
  %arrayidx88.3 = getelementptr inbounds nuw i8, ptr %temp, i32 %div87.3, !dbg !1133
  %78 = load i8, ptr %arrayidx88.3, align 1, !dbg !1133
  %79 = and i8 %78, 15, !dbg !1134
  %xor912.3 = xor i8 %77, %79, !dbg !1135
  %arrayidx93.3 = getelementptr inbounds nuw i8, ptr %y, i32 %add106.2, !dbg !1136
  store i8 %xor912.3, ptr %arrayidx93.3, align 1, !dbg !1137
  %add94.3 = or disjoint i32 %add106.2, 1, !dbg !1138
  %arrayidx95.3 = getelementptr inbounds nuw i8, ptr %t, i32 %add94.3, !dbg !1139
  %80 = load i8, ptr %arrayidx95.3, align 1, !dbg !1139
  %81 = lshr i8 %78, 4, !dbg !1140
  %xor1013.3 = xor i8 %80, %81, !dbg !1141
  %add103.3 = or disjoint i32 %add106.2, 1, !dbg !1142
  %arrayidx104.3 = getelementptr inbounds nuw i8, ptr %y, i32 %add103.3, !dbg !1143
  store i8 %xor1013.3, ptr %arrayidx104.3, align 1, !dbg !1144
    #dbg_value(i32 %i80.0, !1127, !DIExpression(DW_OP_plus_uconst, 8, DW_OP_stack_value), !1128)
  %cmp82.4 = icmp samesign ult i32 %i80.0, 100, !dbg !1146
  br i1 %cmp82.4, label %for.body84.4, label %for.end107, !dbg !1147

for.body84.4:                                     ; preds = %for.cond81
  %add106.3 = add nuw nsw i32 %i80.0, 8, !dbg !1145
    #dbg_value(i32 %add106.3, !1127, !DIExpression(), !1128)
  %arrayidx85.4 = getelementptr inbounds nuw i8, ptr %t, i32 %add106.3, !dbg !1129
  %82 = load i8, ptr %arrayidx85.4, align 1, !dbg !1129
  %div87.4 = lshr exact i32 %add106.3, 1, !dbg !1132
  %arrayidx88.4 = getelementptr inbounds nuw i8, ptr %temp, i32 %div87.4, !dbg !1133
  %83 = load i8, ptr %arrayidx88.4, align 1, !dbg !1133
  %84 = and i8 %83, 15, !dbg !1134
  %xor912.4 = xor i8 %82, %84, !dbg !1135
  %arrayidx93.4 = getelementptr inbounds nuw i8, ptr %y, i32 %add106.3, !dbg !1136
  store i8 %xor912.4, ptr %arrayidx93.4, align 1, !dbg !1137
  %add94.4 = or disjoint i32 %add106.3, 1, !dbg !1138
  %arrayidx95.4 = getelementptr inbounds nuw i8, ptr %t, i32 %add94.4, !dbg !1139
  %85 = load i8, ptr %arrayidx95.4, align 1, !dbg !1139
  %86 = lshr i8 %83, 4, !dbg !1140
  %xor1013.4 = xor i8 %85, %86, !dbg !1141
  %add103.4 = or disjoint i32 %add106.3, 1, !dbg !1142
  %arrayidx104.4 = getelementptr inbounds nuw i8, ptr %y, i32 %add103.4, !dbg !1143
  store i8 %xor1013.4, ptr %arrayidx104.4, align 1, !dbg !1144
  %add106.4 = add nuw nsw i32 %i80.0, 10, !dbg !1145
    #dbg_value(i32 %add106.4, !1127, !DIExpression(), !1128)
  br label %for.cond81, !dbg !1148, !llvm.loop !1149

for.end107:                                       ; preds = %for.cond81
  ret void, !dbg !1151
}

; Function Attrs: nounwind
define internal fastcc void @compute_A(ptr noundef %p, ptr noundef %VtL, ptr noundef %A_out) unnamed_addr #0 !dbg !1152 {
entry:
  %A = alloca [1568 x i64], align 8
  %tab = alloca [16 x i8], align 1
    #dbg_value(ptr %p, !1155, !DIExpression(), !1156)
    #dbg_value(ptr %VtL, !1157, !DIExpression(), !1156)
    #dbg_value(ptr %A_out, !1158, !DIExpression(), !1156)
    #dbg_value(i32 0, !1159, !DIExpression(), !1156)
    #dbg_value(i32 0, !1160, !DIExpression(), !1156)
    #dbg_value(i32 7, !1161, !DIExpression(), !1156)
    #dbg_declare(ptr %A, !1162, !DIExpression(), !1166)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(12544) %A, i8 0, i32 12544, i1 false), !dbg !1166
    #dbg_value(i32 112, !1167, !DIExpression(), !1156)
    #dbg_value(i64 1, !1168, !DIExpression(), !1171)
    #dbg_value(i64 281474976710656, !1168, !DIExpression(), !1171)
    #dbg_value(i64 281474976710655, !1168, !DIExpression(), !1171)
    #dbg_value(i32 0, !1172, !DIExpression(), !1174)
  br label %for.cond, !dbg !1175

for.cond:                                         ; preds = %for.body.2, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc.2, %for.body.2 ], !dbg !1176
    #dbg_value(i32 %i.0, !1172, !DIExpression(), !1174)
  %.idx = mul nuw nsw i32 %i.0, 56, !dbg !1177
  %0 = getelementptr inbounds nuw i8, ptr %VtL, i32 %.idx, !dbg !1177
  %arrayidx = getelementptr inbounds nuw i8, ptr %0, i32 48, !dbg !1177
  %1 = load i64, ptr %arrayidx, align 8, !dbg !1180
  %and = and i64 %1, 281474976710655, !dbg !1180
  store i64 %and, ptr %arrayidx, align 8, !dbg !1180
    #dbg_value(i32 %i.0, !1172, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1174)
    #dbg_value(i32 %i.0, !1172, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1174)
  %2 = mul nuw i32 %i.0, 56, !dbg !1177
  %3 = getelementptr i8, ptr %VtL, i32 %2, !dbg !1177
  %arrayidx.1 = getelementptr i8, ptr %3, i32 104, !dbg !1177
  %4 = load i64, ptr %arrayidx.1, align 8, !dbg !1180
  %and.1 = and i64 %4, 281474976710655, !dbg !1180
  store i64 %and.1, ptr %arrayidx.1, align 8, !dbg !1180
  %inc.1 = add nuw nsw i32 %i.0, 2, !dbg !1181
    #dbg_value(i32 %inc.1, !1172, !DIExpression(), !1174)
  %exitcond.2.not = icmp eq i32 %inc.1, 110, !dbg !1182
  br i1 %exitcond.2.not, label %for.cond3, label %for.body.2, !dbg !1183

for.body.2:                                       ; preds = %for.cond
  %.idx.2 = mul nuw nsw i32 %inc.1, 56, !dbg !1177
  %5 = getelementptr inbounds nuw i8, ptr %VtL, i32 %.idx.2, !dbg !1177
  %arrayidx.2 = getelementptr inbounds nuw i8, ptr %5, i32 48, !dbg !1177
  %6 = load i64, ptr %arrayidx.2, align 8, !dbg !1180
  %and.2 = and i64 %6, 281474976710655, !dbg !1180
  store i64 %and.2, ptr %arrayidx.2, align 8, !dbg !1180
  %inc.2 = add nuw nsw i32 %i.0, 3, !dbg !1181
    #dbg_value(i32 %inc.2, !1172, !DIExpression(), !1174)
  br label %for.cond, !dbg !1184, !llvm.loop !1185

for.cond3:                                        ; preds = %for.cond, %for.inc103
  %i2.0 = phi i32 [ %inc104, %for.inc103 ], [ 0, %for.cond ], !dbg !1187
  %words_to_shift.0 = phi i32 [ %words_to_shift.1, %for.inc103 ], [ 0, %for.cond ], !dbg !1189
  %bits_to_shift.0 = phi i32 [ %bits_to_shift.1, %for.inc103 ], [ 0, %for.cond ], !dbg !1190
    #dbg_value(i32 %bits_to_shift.0, !1159, !DIExpression(), !1156)
    #dbg_value(i32 %words_to_shift.0, !1160, !DIExpression(), !1156)
    #dbg_value(i32 %i2.0, !1191, !DIExpression(), !1192)
  %exitcond8.not = icmp eq i32 %i2.0, 11, !dbg !1193
  br i1 %exitcond8.not, label %for.cond107, label %for.cond6, !dbg !1195

for.cond6:                                        ; preds = %for.cond3, %if.end95
  %j.0 = phi i32 [ %dec, %if.end95 ], [ 10, %for.cond3 ], !dbg !1196
  %words_to_shift.1 = phi i32 [ %spec.select, %if.end95 ], [ %words_to_shift.0, %for.cond3 ], !dbg !1156
  %bits_to_shift.1 = phi i32 [ %spec.select3, %if.end95 ], [ %bits_to_shift.0, %for.cond3 ], !dbg !1156
    #dbg_value(i32 %bits_to_shift.1, !1159, !DIExpression(), !1156)
    #dbg_value(i32 %words_to_shift.1, !1160, !DIExpression(), !1156)
    #dbg_value(i32 %j.0, !1199, !DIExpression(), !1200)
  %cmp7.not = icmp slt i32 %j.0, %i2.0, !dbg !1201
  br i1 %cmp7.not, label %for.inc103, label %for.body8, !dbg !1203

for.body8:                                        ; preds = %for.cond6
  %add.ptr.idx = mul nsw i32 %j.0, 560, !dbg !1204
  %add.ptr = getelementptr inbounds i8, ptr %VtL, i32 %add.ptr.idx, !dbg !1204
    #dbg_value(ptr %add.ptr, !1206, !DIExpression(), !1156)
    #dbg_value(i32 0, !1207, !DIExpression(), !1209)
  br label %for.cond11, !dbg !1210

for.cond11:                                       ; preds = %for.inc44, %for.body8
  %c.0 = phi i32 [ 0, %for.body8 ], [ %inc45, %for.inc44 ], !dbg !1211
    #dbg_value(i32 %c.0, !1207, !DIExpression(), !1209)
  %exitcond5.not = icmp eq i32 %c.0, 10, !dbg !1212
  br i1 %exitcond5.not, label %for.end46, label %for.body16, !dbg !1214

for.body16:                                       ; preds = %for.cond11
    #dbg_value(i32 0, !1215, !DIExpression(), !1218)
  %arrayidx19.idx = mul nuw nsw i32 %c.0, 56, !dbg !1219
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %arrayidx19.idx, !dbg !1219
  %7 = load i64, ptr %arrayidx19, align 8, !dbg !1219
  %sh_prom = zext nneg i32 %bits_to_shift.1 to i64, !dbg !1222
  %shl20 = shl i64 %7, %sh_prom, !dbg !1222
  %mul21 = mul nuw nsw i32 %i2.0, 10, !dbg !1223
  %add22 = add nuw nsw i32 %mul21, %c.0, !dbg !1224
  %mul24 = mul i32 %words_to_shift.1, 112, !dbg !1225
  %add25 = add i32 %add22, %mul24, !dbg !1226
  %arrayidx26 = getelementptr inbounds nuw [1568 x i64], ptr %A, i32 0, i32 %add25, !dbg !1227
  %8 = load i64, ptr %arrayidx26, align 8, !dbg !1228
  %xor = xor i64 %8, %shl20, !dbg !1228
  store i64 %xor, ptr %arrayidx26, align 8, !dbg !1228
  %cmp27 = icmp sgt i32 %bits_to_shift.1, 0, !dbg !1229
  br i1 %cmp27, label %if.then, label %for.body16.1, !dbg !1229

if.then:                                          ; preds = %for.body16
  %arrayidx30.idx = mul nuw nsw i32 %c.0, 56, !dbg !1231
  %arrayidx30 = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %arrayidx30.idx, !dbg !1231
  %9 = load i64, ptr %arrayidx30, align 8, !dbg !1231
  %sub31 = sub nsw i32 64, %bits_to_shift.1, !dbg !1233
  %sh_prom32 = zext nneg i32 %sub31 to i64, !dbg !1234
  %shr = lshr i64 %9, %sh_prom32, !dbg !1234
  %mul33 = mul nuw nsw i32 %i2.0, 10, !dbg !1235
  %add34 = add nuw nsw i32 %mul33, %c.0, !dbg !1236
  %10 = mul i32 %words_to_shift.1, 112, !dbg !1237
  %mul37 = add i32 %10, 112, !dbg !1237
  %add38 = add i32 %add34, %mul37, !dbg !1238
  %arrayidx39 = getelementptr inbounds nuw [1568 x i64], ptr %A, i32 0, i32 %add38, !dbg !1239
  %11 = load i64, ptr %arrayidx39, align 8, !dbg !1240
  %xor40 = xor i64 %11, %shr, !dbg !1240
  store i64 %xor40, ptr %arrayidx39, align 8, !dbg !1240
  br label %for.body16.1, !dbg !1241

for.body16.1:                                     ; preds = %if.then, %for.body16
    #dbg_value(i32 1, !1215, !DIExpression(), !1218)
  %12 = getelementptr inbounds nuw i8, ptr %add.ptr, i32 8, !dbg !1219
  %arrayidx19.idx.1 = mul nuw nsw i32 %c.0, 56, !dbg !1219
  %arrayidx19.1 = getelementptr inbounds nuw i8, ptr %12, i32 %arrayidx19.idx.1, !dbg !1219
  %13 = load i64, ptr %arrayidx19.1, align 8, !dbg !1219
  %sh_prom.1 = zext nneg i32 %bits_to_shift.1 to i64, !dbg !1222
  %shl20.1 = shl i64 %13, %sh_prom.1, !dbg !1222
  %mul21.1 = mul nuw nsw i32 %i2.0, 10, !dbg !1223
  %add22.1 = add nuw nsw i32 %mul21.1, %c.0, !dbg !1224
  %14 = mul i32 %words_to_shift.1, 112, !dbg !1225
  %mul24.1 = add i32 %14, 112, !dbg !1225
  %add25.1 = add i32 %add22.1, %mul24.1, !dbg !1226
  %arrayidx26.1 = getelementptr inbounds nuw [1568 x i64], ptr %A, i32 0, i32 %add25.1, !dbg !1227
  %15 = load i64, ptr %arrayidx26.1, align 8, !dbg !1228
  %xor.1 = xor i64 %15, %shl20.1, !dbg !1228
  store i64 %xor.1, ptr %arrayidx26.1, align 8, !dbg !1228
  %cmp27.1 = icmp sgt i32 %bits_to_shift.1, 0, !dbg !1229
  br i1 %cmp27.1, label %if.then.1, label %for.body16.2, !dbg !1229

if.then.1:                                        ; preds = %for.body16.1
  %16 = getelementptr inbounds nuw i8, ptr %add.ptr, i32 8, !dbg !1231
  %arrayidx30.idx.1 = mul nuw nsw i32 %c.0, 56, !dbg !1231
  %arrayidx30.1 = getelementptr inbounds nuw i8, ptr %16, i32 %arrayidx30.idx.1, !dbg !1231
  %17 = load i64, ptr %arrayidx30.1, align 8, !dbg !1231
  %sub31.1 = sub nsw i32 64, %bits_to_shift.1, !dbg !1233
  %sh_prom32.1 = zext nneg i32 %sub31.1 to i64, !dbg !1234
  %shr.1 = lshr i64 %17, %sh_prom32.1, !dbg !1234
  %mul33.1 = mul nuw nsw i32 %i2.0, 10, !dbg !1235
  %add34.1 = add nuw nsw i32 %mul33.1, %c.0, !dbg !1236
  %18 = mul i32 %words_to_shift.1, 112, !dbg !1237
  %mul37.1 = add i32 %18, 224, !dbg !1237
  %add38.1 = add i32 %add34.1, %mul37.1, !dbg !1238
  %arrayidx39.1 = getelementptr inbounds nuw [1568 x i64], ptr %A, i32 0, i32 %add38.1, !dbg !1239
  %19 = load i64, ptr %arrayidx39.1, align 8, !dbg !1240
  %xor40.1 = xor i64 %19, %shr.1, !dbg !1240
  store i64 %xor40.1, ptr %arrayidx39.1, align 8, !dbg !1240
  br label %for.body16.2, !dbg !1241

for.body16.2:                                     ; preds = %for.body16.1, %if.then.1
    #dbg_value(i32 2, !1215, !DIExpression(), !1218)
  %20 = getelementptr inbounds nuw i8, ptr %add.ptr, i32 16, !dbg !1219
  %arrayidx19.idx.2 = mul nuw nsw i32 %c.0, 56, !dbg !1219
  %arrayidx19.2 = getelementptr inbounds nuw i8, ptr %20, i32 %arrayidx19.idx.2, !dbg !1219
  %21 = load i64, ptr %arrayidx19.2, align 8, !dbg !1219
  %sh_prom.2 = zext nneg i32 %bits_to_shift.1 to i64, !dbg !1222
  %shl20.2 = shl i64 %21, %sh_prom.2, !dbg !1222
  %mul21.2 = mul nuw nsw i32 %i2.0, 10, !dbg !1223
  %add22.2 = add nuw nsw i32 %mul21.2, %c.0, !dbg !1224
  %22 = mul i32 %words_to_shift.1, 112, !dbg !1225
  %mul24.2 = add i32 %22, 224, !dbg !1225
  %add25.2 = add i32 %add22.2, %mul24.2, !dbg !1226
  %arrayidx26.2 = getelementptr inbounds nuw [1568 x i64], ptr %A, i32 0, i32 %add25.2, !dbg !1227
  %23 = load i64, ptr %arrayidx26.2, align 8, !dbg !1228
  %xor.2 = xor i64 %23, %shl20.2, !dbg !1228
  store i64 %xor.2, ptr %arrayidx26.2, align 8, !dbg !1228
  %cmp27.2 = icmp sgt i32 %bits_to_shift.1, 0, !dbg !1229
  br i1 %cmp27.2, label %if.then.2, label %for.body16.3, !dbg !1229

if.then.2:                                        ; preds = %for.body16.2
  %24 = getelementptr inbounds nuw i8, ptr %add.ptr, i32 16, !dbg !1231
  %arrayidx30.idx.2 = mul nuw nsw i32 %c.0, 56, !dbg !1231
  %arrayidx30.2 = getelementptr inbounds nuw i8, ptr %24, i32 %arrayidx30.idx.2, !dbg !1231
  %25 = load i64, ptr %arrayidx30.2, align 8, !dbg !1231
  %sub31.2 = sub nsw i32 64, %bits_to_shift.1, !dbg !1233
  %sh_prom32.2 = zext nneg i32 %sub31.2 to i64, !dbg !1234
  %shr.2 = lshr i64 %25, %sh_prom32.2, !dbg !1234
  %mul33.2 = mul nuw nsw i32 %i2.0, 10, !dbg !1235
  %add34.2 = add nuw nsw i32 %mul33.2, %c.0, !dbg !1236
  %26 = mul i32 %words_to_shift.1, 112, !dbg !1237
  %mul37.2 = add i32 %26, 336, !dbg !1237
  %add38.2 = add i32 %add34.2, %mul37.2, !dbg !1238
  %arrayidx39.2 = getelementptr inbounds nuw [1568 x i64], ptr %A, i32 0, i32 %add38.2, !dbg !1239
  %27 = load i64, ptr %arrayidx39.2, align 8, !dbg !1240
  %xor40.2 = xor i64 %27, %shr.2, !dbg !1240
  store i64 %xor40.2, ptr %arrayidx39.2, align 8, !dbg !1240
  br label %for.body16.3, !dbg !1241

for.body16.3:                                     ; preds = %for.body16.2, %if.then.2
    #dbg_value(i32 3, !1215, !DIExpression(), !1218)
  %28 = getelementptr inbounds nuw i8, ptr %add.ptr, i32 24, !dbg !1219
  %arrayidx19.idx.3 = mul nuw nsw i32 %c.0, 56, !dbg !1219
  %arrayidx19.3 = getelementptr inbounds nuw i8, ptr %28, i32 %arrayidx19.idx.3, !dbg !1219
  %29 = load i64, ptr %arrayidx19.3, align 8, !dbg !1219
  %sh_prom.3 = zext nneg i32 %bits_to_shift.1 to i64, !dbg !1222
  %shl20.3 = shl i64 %29, %sh_prom.3, !dbg !1222
  %mul21.3 = mul nuw nsw i32 %i2.0, 10, !dbg !1223
  %add22.3 = add nuw nsw i32 %mul21.3, %c.0, !dbg !1224
  %30 = mul i32 %words_to_shift.1, 112, !dbg !1225
  %mul24.3 = add i32 %30, 336, !dbg !1225
  %add25.3 = add i32 %add22.3, %mul24.3, !dbg !1226
  %arrayidx26.3 = getelementptr inbounds nuw [1568 x i64], ptr %A, i32 0, i32 %add25.3, !dbg !1227
  %31 = load i64, ptr %arrayidx26.3, align 8, !dbg !1228
  %xor.3 = xor i64 %31, %shl20.3, !dbg !1228
  store i64 %xor.3, ptr %arrayidx26.3, align 8, !dbg !1228
  %cmp27.3 = icmp sgt i32 %bits_to_shift.1, 0, !dbg !1229
  br i1 %cmp27.3, label %if.then.3, label %for.body16.4, !dbg !1229

if.then.3:                                        ; preds = %for.body16.3
  %32 = getelementptr inbounds nuw i8, ptr %add.ptr, i32 24, !dbg !1231
  %arrayidx30.idx.3 = mul nuw nsw i32 %c.0, 56, !dbg !1231
  %arrayidx30.3 = getelementptr inbounds nuw i8, ptr %32, i32 %arrayidx30.idx.3, !dbg !1231
  %33 = load i64, ptr %arrayidx30.3, align 8, !dbg !1231
  %sub31.3 = sub nsw i32 64, %bits_to_shift.1, !dbg !1233
  %sh_prom32.3 = zext nneg i32 %sub31.3 to i64, !dbg !1234
  %shr.3 = lshr i64 %33, %sh_prom32.3, !dbg !1234
  %mul33.3 = mul nuw nsw i32 %i2.0, 10, !dbg !1235
  %add34.3 = add nuw nsw i32 %mul33.3, %c.0, !dbg !1236
  %34 = mul i32 %words_to_shift.1, 112, !dbg !1237
  %mul37.3 = add i32 %34, 448, !dbg !1237
  %add38.3 = add i32 %add34.3, %mul37.3, !dbg !1238
  %arrayidx39.3 = getelementptr inbounds nuw [1568 x i64], ptr %A, i32 0, i32 %add38.3, !dbg !1239
  %35 = load i64, ptr %arrayidx39.3, align 8, !dbg !1240
  %xor40.3 = xor i64 %35, %shr.3, !dbg !1240
  store i64 %xor40.3, ptr %arrayidx39.3, align 8, !dbg !1240
  br label %for.body16.4, !dbg !1241

for.body16.4:                                     ; preds = %for.body16.3, %if.then.3
    #dbg_value(i32 4, !1215, !DIExpression(), !1218)
  %36 = getelementptr inbounds nuw i8, ptr %add.ptr, i32 32, !dbg !1219
  %arrayidx19.idx.4 = mul nuw nsw i32 %c.0, 56, !dbg !1219
  %arrayidx19.4 = getelementptr inbounds nuw i8, ptr %36, i32 %arrayidx19.idx.4, !dbg !1219
  %37 = load i64, ptr %arrayidx19.4, align 8, !dbg !1219
  %sh_prom.4 = zext nneg i32 %bits_to_shift.1 to i64, !dbg !1222
  %shl20.4 = shl i64 %37, %sh_prom.4, !dbg !1222
  %mul21.4 = mul nuw nsw i32 %i2.0, 10, !dbg !1223
  %add22.4 = add nuw nsw i32 %mul21.4, %c.0, !dbg !1224
  %38 = mul i32 %words_to_shift.1, 112, !dbg !1225
  %mul24.4 = add i32 %38, 448, !dbg !1225
  %add25.4 = add i32 %add22.4, %mul24.4, !dbg !1226
  %arrayidx26.4 = getelementptr inbounds nuw [1568 x i64], ptr %A, i32 0, i32 %add25.4, !dbg !1227
  %39 = load i64, ptr %arrayidx26.4, align 8, !dbg !1228
  %xor.4 = xor i64 %39, %shl20.4, !dbg !1228
  store i64 %xor.4, ptr %arrayidx26.4, align 8, !dbg !1228
  %cmp27.4 = icmp sgt i32 %bits_to_shift.1, 0, !dbg !1229
  br i1 %cmp27.4, label %if.then.4, label %for.body16.5, !dbg !1229

if.then.4:                                        ; preds = %for.body16.4
  %40 = getelementptr inbounds nuw i8, ptr %add.ptr, i32 32, !dbg !1231
  %arrayidx30.idx.4 = mul nuw nsw i32 %c.0, 56, !dbg !1231
  %arrayidx30.4 = getelementptr inbounds nuw i8, ptr %40, i32 %arrayidx30.idx.4, !dbg !1231
  %41 = load i64, ptr %arrayidx30.4, align 8, !dbg !1231
  %sub31.4 = sub nsw i32 64, %bits_to_shift.1, !dbg !1233
  %sh_prom32.4 = zext nneg i32 %sub31.4 to i64, !dbg !1234
  %shr.4 = lshr i64 %41, %sh_prom32.4, !dbg !1234
  %mul33.4 = mul nuw nsw i32 %i2.0, 10, !dbg !1235
  %add34.4 = add nuw nsw i32 %mul33.4, %c.0, !dbg !1236
  %42 = mul i32 %words_to_shift.1, 112, !dbg !1237
  %mul37.4 = add i32 %42, 560, !dbg !1237
  %add38.4 = add i32 %add34.4, %mul37.4, !dbg !1238
  %arrayidx39.4 = getelementptr inbounds nuw [1568 x i64], ptr %A, i32 0, i32 %add38.4, !dbg !1239
  %43 = load i64, ptr %arrayidx39.4, align 8, !dbg !1240
  %xor40.4 = xor i64 %43, %shr.4, !dbg !1240
  store i64 %xor40.4, ptr %arrayidx39.4, align 8, !dbg !1240
  br label %for.body16.5, !dbg !1241

for.body16.5:                                     ; preds = %for.body16.4, %if.then.4
    #dbg_value(i32 5, !1215, !DIExpression(), !1218)
  %44 = getelementptr inbounds nuw i8, ptr %add.ptr, i32 40, !dbg !1219
  %arrayidx19.idx.5 = mul nuw nsw i32 %c.0, 56, !dbg !1219
  %arrayidx19.5 = getelementptr inbounds nuw i8, ptr %44, i32 %arrayidx19.idx.5, !dbg !1219
  %45 = load i64, ptr %arrayidx19.5, align 8, !dbg !1219
  %sh_prom.5 = zext nneg i32 %bits_to_shift.1 to i64, !dbg !1222
  %shl20.5 = shl i64 %45, %sh_prom.5, !dbg !1222
  %mul21.5 = mul nuw nsw i32 %i2.0, 10, !dbg !1223
  %add22.5 = add nuw nsw i32 %mul21.5, %c.0, !dbg !1224
  %46 = mul i32 %words_to_shift.1, 112, !dbg !1225
  %mul24.5 = add i32 %46, 560, !dbg !1225
  %add25.5 = add i32 %add22.5, %mul24.5, !dbg !1226
  %arrayidx26.5 = getelementptr inbounds nuw [1568 x i64], ptr %A, i32 0, i32 %add25.5, !dbg !1227
  %47 = load i64, ptr %arrayidx26.5, align 8, !dbg !1228
  %xor.5 = xor i64 %47, %shl20.5, !dbg !1228
  store i64 %xor.5, ptr %arrayidx26.5, align 8, !dbg !1228
  %cmp27.5 = icmp sgt i32 %bits_to_shift.1, 0, !dbg !1229
  br i1 %cmp27.5, label %if.then.5, label %for.body16.6, !dbg !1229

if.then.5:                                        ; preds = %for.body16.5
  %48 = getelementptr inbounds nuw i8, ptr %add.ptr, i32 40, !dbg !1231
  %arrayidx30.idx.5 = mul nuw nsw i32 %c.0, 56, !dbg !1231
  %arrayidx30.5 = getelementptr inbounds nuw i8, ptr %48, i32 %arrayidx30.idx.5, !dbg !1231
  %49 = load i64, ptr %arrayidx30.5, align 8, !dbg !1231
  %sub31.5 = sub nsw i32 64, %bits_to_shift.1, !dbg !1233
  %sh_prom32.5 = zext nneg i32 %sub31.5 to i64, !dbg !1234
  %shr.5 = lshr i64 %49, %sh_prom32.5, !dbg !1234
  %mul33.5 = mul nuw nsw i32 %i2.0, 10, !dbg !1235
  %add34.5 = add nuw nsw i32 %mul33.5, %c.0, !dbg !1236
  %50 = mul i32 %words_to_shift.1, 112, !dbg !1237
  %mul37.5 = add i32 %50, 672, !dbg !1237
  %add38.5 = add i32 %add34.5, %mul37.5, !dbg !1238
  %arrayidx39.5 = getelementptr inbounds nuw [1568 x i64], ptr %A, i32 0, i32 %add38.5, !dbg !1239
  %51 = load i64, ptr %arrayidx39.5, align 8, !dbg !1240
  %xor40.5 = xor i64 %51, %shr.5, !dbg !1240
  store i64 %xor40.5, ptr %arrayidx39.5, align 8, !dbg !1240
  br label %for.body16.6, !dbg !1241

for.body16.6:                                     ; preds = %for.body16.5, %if.then.5
    #dbg_value(i32 6, !1215, !DIExpression(), !1218)
  %52 = getelementptr inbounds nuw i8, ptr %add.ptr, i32 48, !dbg !1219
  %arrayidx19.idx.6 = mul nuw nsw i32 %c.0, 56, !dbg !1219
  %arrayidx19.6 = getelementptr inbounds nuw i8, ptr %52, i32 %arrayidx19.idx.6, !dbg !1219
  %53 = load i64, ptr %arrayidx19.6, align 8, !dbg !1219
  %sh_prom.6 = zext nneg i32 %bits_to_shift.1 to i64, !dbg !1222
  %shl20.6 = shl i64 %53, %sh_prom.6, !dbg !1222
  %mul21.6 = mul nuw nsw i32 %i2.0, 10, !dbg !1223
  %add22.6 = add nuw nsw i32 %mul21.6, %c.0, !dbg !1224
  %54 = mul i32 %words_to_shift.1, 112, !dbg !1225
  %mul24.6 = add i32 %54, 672, !dbg !1225
  %add25.6 = add i32 %add22.6, %mul24.6, !dbg !1226
  %arrayidx26.6 = getelementptr inbounds nuw [1568 x i64], ptr %A, i32 0, i32 %add25.6, !dbg !1227
  %55 = load i64, ptr %arrayidx26.6, align 8, !dbg !1228
  %xor.6 = xor i64 %55, %shl20.6, !dbg !1228
  store i64 %xor.6, ptr %arrayidx26.6, align 8, !dbg !1228
  %cmp27.6 = icmp sgt i32 %bits_to_shift.1, 0, !dbg !1229
  br i1 %cmp27.6, label %if.then.6, label %for.inc44, !dbg !1229

if.then.6:                                        ; preds = %for.body16.6
  %56 = getelementptr inbounds nuw i8, ptr %add.ptr, i32 48, !dbg !1231
  %arrayidx30.idx.6 = mul nuw nsw i32 %c.0, 56, !dbg !1231
  %arrayidx30.6 = getelementptr inbounds nuw i8, ptr %56, i32 %arrayidx30.idx.6, !dbg !1231
  %57 = load i64, ptr %arrayidx30.6, align 8, !dbg !1231
  %sub31.6 = sub nsw i32 64, %bits_to_shift.1, !dbg !1233
  %sh_prom32.6 = zext nneg i32 %sub31.6 to i64, !dbg !1234
  %shr.6 = lshr i64 %57, %sh_prom32.6, !dbg !1234
  %mul33.6 = mul nuw nsw i32 %i2.0, 10, !dbg !1235
  %add34.6 = add nuw nsw i32 %mul33.6, %c.0, !dbg !1236
  %58 = mul i32 %words_to_shift.1, 112, !dbg !1237
  %mul37.6 = add i32 %58, 784, !dbg !1237
  %add38.6 = add i32 %add34.6, %mul37.6, !dbg !1238
  %arrayidx39.6 = getelementptr inbounds nuw [1568 x i64], ptr %A, i32 0, i32 %add38.6, !dbg !1239
  %59 = load i64, ptr %arrayidx39.6, align 8, !dbg !1240
  %xor40.6 = xor i64 %59, %shr.6, !dbg !1240
  store i64 %xor40.6, ptr %arrayidx39.6, align 8, !dbg !1240
  br label %for.inc44, !dbg !1241

for.inc44:                                        ; preds = %for.body16.6, %if.then.6
    #dbg_value(i32 7, !1215, !DIExpression(), !1218)
  %inc45 = add nuw nsw i32 %c.0, 1, !dbg !1242
    #dbg_value(i32 %inc45, !1207, !DIExpression(), !1209)
  br label %for.cond11, !dbg !1243, !llvm.loop !1244

for.end46:                                        ; preds = %for.cond11
  %cmp47.not = icmp eq i32 %i2.0, %j.0, !dbg !1246
  br i1 %cmp47.not, label %if.end95, label %if.then48, !dbg !1246

if.then48:                                        ; preds = %for.end46
  %add.ptr51.idx = mul nuw nsw i32 %i2.0, 560, !dbg !1248
  %add.ptr51 = getelementptr inbounds nuw i8, ptr %VtL, i32 %add.ptr51.idx, !dbg !1248
    #dbg_value(ptr %add.ptr51, !1250, !DIExpression(), !1156)
    #dbg_value(i32 0, !1251, !DIExpression(), !1253)
  br label %for.cond53, !dbg !1254

for.cond53:                                       ; preds = %for.inc92, %if.then48
  %c52.0 = phi i32 [ 0, %if.then48 ], [ %inc93, %for.inc92 ], !dbg !1255
    #dbg_value(i32 %c52.0, !1251, !DIExpression(), !1253)
  %exitcond7.not = icmp eq i32 %c52.0, 10, !dbg !1256
  br i1 %exitcond7.not, label %if.end95, label %for.body59, !dbg !1258

for.body59:                                       ; preds = %for.cond53
    #dbg_value(i32 0, !1259, !DIExpression(), !1262)
  %arrayidx62.idx = mul nuw nsw i32 %c52.0, 56, !dbg !1263
  %arrayidx62 = getelementptr inbounds nuw i8, ptr %add.ptr51, i32 %arrayidx62.idx, !dbg !1263
  %60 = load i64, ptr %arrayidx62, align 8, !dbg !1263
  %sh_prom63 = zext nneg i32 %bits_to_shift.1 to i64, !dbg !1266
  %shl64 = shl i64 %60, %sh_prom63, !dbg !1266
  %mul65 = mul nsw i32 %j.0, 10, !dbg !1267
  %add66 = add nsw i32 %mul65, %c52.0, !dbg !1268
  %mul68 = mul i32 %words_to_shift.1, 112, !dbg !1269
  %add69 = add i32 %add66, %mul68, !dbg !1270
  %arrayidx70 = getelementptr inbounds nuw [1568 x i64], ptr %A, i32 0, i32 %add69, !dbg !1271
  %61 = load i64, ptr %arrayidx70, align 8, !dbg !1272
  %xor71 = xor i64 %61, %shl64, !dbg !1272
  store i64 %xor71, ptr %arrayidx70, align 8, !dbg !1272
  %cmp72 = icmp sgt i32 %bits_to_shift.1, 0, !dbg !1273
  br i1 %cmp72, label %if.then73, label %for.body59.1, !dbg !1273

if.then73:                                        ; preds = %for.body59
  %arrayidx76.idx = mul nuw nsw i32 %c52.0, 56, !dbg !1275
  %arrayidx76 = getelementptr inbounds nuw i8, ptr %add.ptr51, i32 %arrayidx76.idx, !dbg !1275
  %62 = load i64, ptr %arrayidx76, align 8, !dbg !1275
  %sub77 = sub nsw i32 64, %bits_to_shift.1, !dbg !1277
  %sh_prom78 = zext nneg i32 %sub77 to i64, !dbg !1278
  %shr79 = lshr i64 %62, %sh_prom78, !dbg !1278
  %mul80 = mul nsw i32 %j.0, 10, !dbg !1279
  %add81 = add nsw i32 %mul80, %c52.0, !dbg !1280
  %63 = mul i32 %words_to_shift.1, 112, !dbg !1281
  %mul84 = add i32 %63, 112, !dbg !1281
  %add85 = add i32 %add81, %mul84, !dbg !1282
  %arrayidx86 = getelementptr inbounds nuw [1568 x i64], ptr %A, i32 0, i32 %add85, !dbg !1283
  %64 = load i64, ptr %arrayidx86, align 8, !dbg !1284
  %xor87 = xor i64 %64, %shr79, !dbg !1284
  store i64 %xor87, ptr %arrayidx86, align 8, !dbg !1284
  br label %for.body59.1, !dbg !1285

for.body59.1:                                     ; preds = %if.then73, %for.body59
    #dbg_value(i32 1, !1259, !DIExpression(), !1262)
  %65 = getelementptr inbounds nuw i8, ptr %add.ptr51, i32 8, !dbg !1263
  %arrayidx62.idx.1 = mul nuw nsw i32 %c52.0, 56, !dbg !1263
  %arrayidx62.1 = getelementptr inbounds nuw i8, ptr %65, i32 %arrayidx62.idx.1, !dbg !1263
  %66 = load i64, ptr %arrayidx62.1, align 8, !dbg !1263
  %sh_prom63.1 = zext nneg i32 %bits_to_shift.1 to i64, !dbg !1266
  %shl64.1 = shl i64 %66, %sh_prom63.1, !dbg !1266
  %mul65.1 = mul nsw i32 %j.0, 10, !dbg !1267
  %add66.1 = add nsw i32 %mul65.1, %c52.0, !dbg !1268
  %67 = mul i32 %words_to_shift.1, 112, !dbg !1269
  %mul68.1 = add i32 %67, 112, !dbg !1269
  %add69.1 = add i32 %add66.1, %mul68.1, !dbg !1270
  %arrayidx70.1 = getelementptr inbounds nuw [1568 x i64], ptr %A, i32 0, i32 %add69.1, !dbg !1271
  %68 = load i64, ptr %arrayidx70.1, align 8, !dbg !1272
  %xor71.1 = xor i64 %68, %shl64.1, !dbg !1272
  store i64 %xor71.1, ptr %arrayidx70.1, align 8, !dbg !1272
  %cmp72.1 = icmp sgt i32 %bits_to_shift.1, 0, !dbg !1273
  br i1 %cmp72.1, label %if.then73.1, label %for.body59.2, !dbg !1273

if.then73.1:                                      ; preds = %for.body59.1
  %69 = getelementptr inbounds nuw i8, ptr %add.ptr51, i32 8, !dbg !1275
  %arrayidx76.idx.1 = mul nuw nsw i32 %c52.0, 56, !dbg !1275
  %arrayidx76.1 = getelementptr inbounds nuw i8, ptr %69, i32 %arrayidx76.idx.1, !dbg !1275
  %70 = load i64, ptr %arrayidx76.1, align 8, !dbg !1275
  %sub77.1 = sub nsw i32 64, %bits_to_shift.1, !dbg !1277
  %sh_prom78.1 = zext nneg i32 %sub77.1 to i64, !dbg !1278
  %shr79.1 = lshr i64 %70, %sh_prom78.1, !dbg !1278
  %mul80.1 = mul nsw i32 %j.0, 10, !dbg !1279
  %add81.1 = add nsw i32 %mul80.1, %c52.0, !dbg !1280
  %71 = mul i32 %words_to_shift.1, 112, !dbg !1281
  %mul84.1 = add i32 %71, 224, !dbg !1281
  %add85.1 = add i32 %add81.1, %mul84.1, !dbg !1282
  %arrayidx86.1 = getelementptr inbounds nuw [1568 x i64], ptr %A, i32 0, i32 %add85.1, !dbg !1283
  %72 = load i64, ptr %arrayidx86.1, align 8, !dbg !1284
  %xor87.1 = xor i64 %72, %shr79.1, !dbg !1284
  store i64 %xor87.1, ptr %arrayidx86.1, align 8, !dbg !1284
  br label %for.body59.2, !dbg !1285

for.body59.2:                                     ; preds = %for.body59.1, %if.then73.1
    #dbg_value(i32 2, !1259, !DIExpression(), !1262)
  %73 = getelementptr inbounds nuw i8, ptr %add.ptr51, i32 16, !dbg !1263
  %arrayidx62.idx.2 = mul nuw nsw i32 %c52.0, 56, !dbg !1263
  %arrayidx62.2 = getelementptr inbounds nuw i8, ptr %73, i32 %arrayidx62.idx.2, !dbg !1263
  %74 = load i64, ptr %arrayidx62.2, align 8, !dbg !1263
  %sh_prom63.2 = zext nneg i32 %bits_to_shift.1 to i64, !dbg !1266
  %shl64.2 = shl i64 %74, %sh_prom63.2, !dbg !1266
  %mul65.2 = mul nsw i32 %j.0, 10, !dbg !1267
  %add66.2 = add nsw i32 %mul65.2, %c52.0, !dbg !1268
  %75 = mul i32 %words_to_shift.1, 112, !dbg !1269
  %mul68.2 = add i32 %75, 224, !dbg !1269
  %add69.2 = add i32 %add66.2, %mul68.2, !dbg !1270
  %arrayidx70.2 = getelementptr inbounds nuw [1568 x i64], ptr %A, i32 0, i32 %add69.2, !dbg !1271
  %76 = load i64, ptr %arrayidx70.2, align 8, !dbg !1272
  %xor71.2 = xor i64 %76, %shl64.2, !dbg !1272
  store i64 %xor71.2, ptr %arrayidx70.2, align 8, !dbg !1272
  %cmp72.2 = icmp sgt i32 %bits_to_shift.1, 0, !dbg !1273
  br i1 %cmp72.2, label %if.then73.2, label %for.body59.3, !dbg !1273

if.then73.2:                                      ; preds = %for.body59.2
  %77 = getelementptr inbounds nuw i8, ptr %add.ptr51, i32 16, !dbg !1275
  %arrayidx76.idx.2 = mul nuw nsw i32 %c52.0, 56, !dbg !1275
  %arrayidx76.2 = getelementptr inbounds nuw i8, ptr %77, i32 %arrayidx76.idx.2, !dbg !1275
  %78 = load i64, ptr %arrayidx76.2, align 8, !dbg !1275
  %sub77.2 = sub nsw i32 64, %bits_to_shift.1, !dbg !1277
  %sh_prom78.2 = zext nneg i32 %sub77.2 to i64, !dbg !1278
  %shr79.2 = lshr i64 %78, %sh_prom78.2, !dbg !1278
  %mul80.2 = mul nsw i32 %j.0, 10, !dbg !1279
  %add81.2 = add nsw i32 %mul80.2, %c52.0, !dbg !1280
  %79 = mul i32 %words_to_shift.1, 112, !dbg !1281
  %mul84.2 = add i32 %79, 336, !dbg !1281
  %add85.2 = add i32 %add81.2, %mul84.2, !dbg !1282
  %arrayidx86.2 = getelementptr inbounds nuw [1568 x i64], ptr %A, i32 0, i32 %add85.2, !dbg !1283
  %80 = load i64, ptr %arrayidx86.2, align 8, !dbg !1284
  %xor87.2 = xor i64 %80, %shr79.2, !dbg !1284
  store i64 %xor87.2, ptr %arrayidx86.2, align 8, !dbg !1284
  br label %for.body59.3, !dbg !1285

for.body59.3:                                     ; preds = %for.body59.2, %if.then73.2
    #dbg_value(i32 3, !1259, !DIExpression(), !1262)
  %81 = getelementptr inbounds nuw i8, ptr %add.ptr51, i32 24, !dbg !1263
  %arrayidx62.idx.3 = mul nuw nsw i32 %c52.0, 56, !dbg !1263
  %arrayidx62.3 = getelementptr inbounds nuw i8, ptr %81, i32 %arrayidx62.idx.3, !dbg !1263
  %82 = load i64, ptr %arrayidx62.3, align 8, !dbg !1263
  %sh_prom63.3 = zext nneg i32 %bits_to_shift.1 to i64, !dbg !1266
  %shl64.3 = shl i64 %82, %sh_prom63.3, !dbg !1266
  %mul65.3 = mul nsw i32 %j.0, 10, !dbg !1267
  %add66.3 = add nsw i32 %mul65.3, %c52.0, !dbg !1268
  %83 = mul i32 %words_to_shift.1, 112, !dbg !1269
  %mul68.3 = add i32 %83, 336, !dbg !1269
  %add69.3 = add i32 %add66.3, %mul68.3, !dbg !1270
  %arrayidx70.3 = getelementptr inbounds nuw [1568 x i64], ptr %A, i32 0, i32 %add69.3, !dbg !1271
  %84 = load i64, ptr %arrayidx70.3, align 8, !dbg !1272
  %xor71.3 = xor i64 %84, %shl64.3, !dbg !1272
  store i64 %xor71.3, ptr %arrayidx70.3, align 8, !dbg !1272
  %cmp72.3 = icmp sgt i32 %bits_to_shift.1, 0, !dbg !1273
  br i1 %cmp72.3, label %if.then73.3, label %for.body59.4, !dbg !1273

if.then73.3:                                      ; preds = %for.body59.3
  %85 = getelementptr inbounds nuw i8, ptr %add.ptr51, i32 24, !dbg !1275
  %arrayidx76.idx.3 = mul nuw nsw i32 %c52.0, 56, !dbg !1275
  %arrayidx76.3 = getelementptr inbounds nuw i8, ptr %85, i32 %arrayidx76.idx.3, !dbg !1275
  %86 = load i64, ptr %arrayidx76.3, align 8, !dbg !1275
  %sub77.3 = sub nsw i32 64, %bits_to_shift.1, !dbg !1277
  %sh_prom78.3 = zext nneg i32 %sub77.3 to i64, !dbg !1278
  %shr79.3 = lshr i64 %86, %sh_prom78.3, !dbg !1278
  %mul80.3 = mul nsw i32 %j.0, 10, !dbg !1279
  %add81.3 = add nsw i32 %mul80.3, %c52.0, !dbg !1280
  %87 = mul i32 %words_to_shift.1, 112, !dbg !1281
  %mul84.3 = add i32 %87, 448, !dbg !1281
  %add85.3 = add i32 %add81.3, %mul84.3, !dbg !1282
  %arrayidx86.3 = getelementptr inbounds nuw [1568 x i64], ptr %A, i32 0, i32 %add85.3, !dbg !1283
  %88 = load i64, ptr %arrayidx86.3, align 8, !dbg !1284
  %xor87.3 = xor i64 %88, %shr79.3, !dbg !1284
  store i64 %xor87.3, ptr %arrayidx86.3, align 8, !dbg !1284
  br label %for.body59.4, !dbg !1285

for.body59.4:                                     ; preds = %for.body59.3, %if.then73.3
    #dbg_value(i32 4, !1259, !DIExpression(), !1262)
  %89 = getelementptr inbounds nuw i8, ptr %add.ptr51, i32 32, !dbg !1263
  %arrayidx62.idx.4 = mul nuw nsw i32 %c52.0, 56, !dbg !1263
  %arrayidx62.4 = getelementptr inbounds nuw i8, ptr %89, i32 %arrayidx62.idx.4, !dbg !1263
  %90 = load i64, ptr %arrayidx62.4, align 8, !dbg !1263
  %sh_prom63.4 = zext nneg i32 %bits_to_shift.1 to i64, !dbg !1266
  %shl64.4 = shl i64 %90, %sh_prom63.4, !dbg !1266
  %mul65.4 = mul nsw i32 %j.0, 10, !dbg !1267
  %add66.4 = add nsw i32 %mul65.4, %c52.0, !dbg !1268
  %91 = mul i32 %words_to_shift.1, 112, !dbg !1269
  %mul68.4 = add i32 %91, 448, !dbg !1269
  %add69.4 = add i32 %add66.4, %mul68.4, !dbg !1270
  %arrayidx70.4 = getelementptr inbounds nuw [1568 x i64], ptr %A, i32 0, i32 %add69.4, !dbg !1271
  %92 = load i64, ptr %arrayidx70.4, align 8, !dbg !1272
  %xor71.4 = xor i64 %92, %shl64.4, !dbg !1272
  store i64 %xor71.4, ptr %arrayidx70.4, align 8, !dbg !1272
  %cmp72.4 = icmp sgt i32 %bits_to_shift.1, 0, !dbg !1273
  br i1 %cmp72.4, label %if.then73.4, label %for.body59.5, !dbg !1273

if.then73.4:                                      ; preds = %for.body59.4
  %93 = getelementptr inbounds nuw i8, ptr %add.ptr51, i32 32, !dbg !1275
  %arrayidx76.idx.4 = mul nuw nsw i32 %c52.0, 56, !dbg !1275
  %arrayidx76.4 = getelementptr inbounds nuw i8, ptr %93, i32 %arrayidx76.idx.4, !dbg !1275
  %94 = load i64, ptr %arrayidx76.4, align 8, !dbg !1275
  %sub77.4 = sub nsw i32 64, %bits_to_shift.1, !dbg !1277
  %sh_prom78.4 = zext nneg i32 %sub77.4 to i64, !dbg !1278
  %shr79.4 = lshr i64 %94, %sh_prom78.4, !dbg !1278
  %mul80.4 = mul nsw i32 %j.0, 10, !dbg !1279
  %add81.4 = add nsw i32 %mul80.4, %c52.0, !dbg !1280
  %95 = mul i32 %words_to_shift.1, 112, !dbg !1281
  %mul84.4 = add i32 %95, 560, !dbg !1281
  %add85.4 = add i32 %add81.4, %mul84.4, !dbg !1282
  %arrayidx86.4 = getelementptr inbounds nuw [1568 x i64], ptr %A, i32 0, i32 %add85.4, !dbg !1283
  %96 = load i64, ptr %arrayidx86.4, align 8, !dbg !1284
  %xor87.4 = xor i64 %96, %shr79.4, !dbg !1284
  store i64 %xor87.4, ptr %arrayidx86.4, align 8, !dbg !1284
  br label %for.body59.5, !dbg !1285

for.body59.5:                                     ; preds = %for.body59.4, %if.then73.4
    #dbg_value(i32 5, !1259, !DIExpression(), !1262)
  %97 = getelementptr inbounds nuw i8, ptr %add.ptr51, i32 40, !dbg !1263
  %arrayidx62.idx.5 = mul nuw nsw i32 %c52.0, 56, !dbg !1263
  %arrayidx62.5 = getelementptr inbounds nuw i8, ptr %97, i32 %arrayidx62.idx.5, !dbg !1263
  %98 = load i64, ptr %arrayidx62.5, align 8, !dbg !1263
  %sh_prom63.5 = zext nneg i32 %bits_to_shift.1 to i64, !dbg !1266
  %shl64.5 = shl i64 %98, %sh_prom63.5, !dbg !1266
  %mul65.5 = mul nsw i32 %j.0, 10, !dbg !1267
  %add66.5 = add nsw i32 %mul65.5, %c52.0, !dbg !1268
  %99 = mul i32 %words_to_shift.1, 112, !dbg !1269
  %mul68.5 = add i32 %99, 560, !dbg !1269
  %add69.5 = add i32 %add66.5, %mul68.5, !dbg !1270
  %arrayidx70.5 = getelementptr inbounds nuw [1568 x i64], ptr %A, i32 0, i32 %add69.5, !dbg !1271
  %100 = load i64, ptr %arrayidx70.5, align 8, !dbg !1272
  %xor71.5 = xor i64 %100, %shl64.5, !dbg !1272
  store i64 %xor71.5, ptr %arrayidx70.5, align 8, !dbg !1272
  %cmp72.5 = icmp sgt i32 %bits_to_shift.1, 0, !dbg !1273
  br i1 %cmp72.5, label %if.then73.5, label %for.body59.6, !dbg !1273

if.then73.5:                                      ; preds = %for.body59.5
  %101 = getelementptr inbounds nuw i8, ptr %add.ptr51, i32 40, !dbg !1275
  %arrayidx76.idx.5 = mul nuw nsw i32 %c52.0, 56, !dbg !1275
  %arrayidx76.5 = getelementptr inbounds nuw i8, ptr %101, i32 %arrayidx76.idx.5, !dbg !1275
  %102 = load i64, ptr %arrayidx76.5, align 8, !dbg !1275
  %sub77.5 = sub nsw i32 64, %bits_to_shift.1, !dbg !1277
  %sh_prom78.5 = zext nneg i32 %sub77.5 to i64, !dbg !1278
  %shr79.5 = lshr i64 %102, %sh_prom78.5, !dbg !1278
  %mul80.5 = mul nsw i32 %j.0, 10, !dbg !1279
  %add81.5 = add nsw i32 %mul80.5, %c52.0, !dbg !1280
  %103 = mul i32 %words_to_shift.1, 112, !dbg !1281
  %mul84.5 = add i32 %103, 672, !dbg !1281
  %add85.5 = add i32 %add81.5, %mul84.5, !dbg !1282
  %arrayidx86.5 = getelementptr inbounds nuw [1568 x i64], ptr %A, i32 0, i32 %add85.5, !dbg !1283
  %104 = load i64, ptr %arrayidx86.5, align 8, !dbg !1284
  %xor87.5 = xor i64 %104, %shr79.5, !dbg !1284
  store i64 %xor87.5, ptr %arrayidx86.5, align 8, !dbg !1284
  br label %for.body59.6, !dbg !1285

for.body59.6:                                     ; preds = %for.body59.5, %if.then73.5
    #dbg_value(i32 6, !1259, !DIExpression(), !1262)
  %105 = getelementptr inbounds nuw i8, ptr %add.ptr51, i32 48, !dbg !1263
  %arrayidx62.idx.6 = mul nuw nsw i32 %c52.0, 56, !dbg !1263
  %arrayidx62.6 = getelementptr inbounds nuw i8, ptr %105, i32 %arrayidx62.idx.6, !dbg !1263
  %106 = load i64, ptr %arrayidx62.6, align 8, !dbg !1263
  %sh_prom63.6 = zext nneg i32 %bits_to_shift.1 to i64, !dbg !1266
  %shl64.6 = shl i64 %106, %sh_prom63.6, !dbg !1266
  %mul65.6 = mul nsw i32 %j.0, 10, !dbg !1267
  %add66.6 = add nsw i32 %mul65.6, %c52.0, !dbg !1268
  %107 = mul i32 %words_to_shift.1, 112, !dbg !1269
  %mul68.6 = add i32 %107, 672, !dbg !1269
  %add69.6 = add i32 %add66.6, %mul68.6, !dbg !1270
  %arrayidx70.6 = getelementptr inbounds nuw [1568 x i64], ptr %A, i32 0, i32 %add69.6, !dbg !1271
  %108 = load i64, ptr %arrayidx70.6, align 8, !dbg !1272
  %xor71.6 = xor i64 %108, %shl64.6, !dbg !1272
  store i64 %xor71.6, ptr %arrayidx70.6, align 8, !dbg !1272
  %cmp72.6 = icmp sgt i32 %bits_to_shift.1, 0, !dbg !1273
  br i1 %cmp72.6, label %if.then73.6, label %for.inc92, !dbg !1273

if.then73.6:                                      ; preds = %for.body59.6
  %109 = getelementptr inbounds nuw i8, ptr %add.ptr51, i32 48, !dbg !1275
  %arrayidx76.idx.6 = mul nuw nsw i32 %c52.0, 56, !dbg !1275
  %arrayidx76.6 = getelementptr inbounds nuw i8, ptr %109, i32 %arrayidx76.idx.6, !dbg !1275
  %110 = load i64, ptr %arrayidx76.6, align 8, !dbg !1275
  %sub77.6 = sub nsw i32 64, %bits_to_shift.1, !dbg !1277
  %sh_prom78.6 = zext nneg i32 %sub77.6 to i64, !dbg !1278
  %shr79.6 = lshr i64 %110, %sh_prom78.6, !dbg !1278
  %mul80.6 = mul nsw i32 %j.0, 10, !dbg !1279
  %add81.6 = add nsw i32 %mul80.6, %c52.0, !dbg !1280
  %111 = mul i32 %words_to_shift.1, 112, !dbg !1281
  %mul84.6 = add i32 %111, 784, !dbg !1281
  %add85.6 = add i32 %add81.6, %mul84.6, !dbg !1282
  %arrayidx86.6 = getelementptr inbounds nuw [1568 x i64], ptr %A, i32 0, i32 %add85.6, !dbg !1283
  %112 = load i64, ptr %arrayidx86.6, align 8, !dbg !1284
  %xor87.6 = xor i64 %112, %shr79.6, !dbg !1284
  store i64 %xor87.6, ptr %arrayidx86.6, align 8, !dbg !1284
  br label %for.inc92, !dbg !1285

for.inc92:                                        ; preds = %for.body59.6, %if.then73.6
    #dbg_value(i32 7, !1259, !DIExpression(), !1262)
  %inc93 = add nuw nsw i32 %c52.0, 1, !dbg !1286
    #dbg_value(i32 %inc93, !1251, !DIExpression(), !1253)
  br label %for.cond53, !dbg !1287, !llvm.loop !1288

if.end95:                                         ; preds = %for.cond53, %for.end46
  %add96 = add nsw i32 %bits_to_shift.1, 4, !dbg !1290
    #dbg_value(i32 %add96, !1159, !DIExpression(), !1156)
  %cmp97 = icmp eq i32 %add96, 64, !dbg !1291
  %inc99 = zext i1 %cmp97 to i32, !dbg !1291
  %spec.select = add nsw i32 %words_to_shift.1, %inc99, !dbg !1291
  %spec.select3 = select i1 %cmp97, i32 0, i32 %add96, !dbg !1291
    #dbg_value(i32 %spec.select3, !1159, !DIExpression(), !1156)
    #dbg_value(i32 %spec.select, !1160, !DIExpression(), !1156)
  %dec = add nsw i32 %j.0, -1, !dbg !1293
    #dbg_value(i32 %dec, !1199, !DIExpression(), !1200)
  br label %for.cond6, !dbg !1294, !llvm.loop !1295

for.inc103:                                       ; preds = %for.cond6
  %inc104 = add nuw nsw i32 %i2.0, 1, !dbg !1297
    #dbg_value(i32 %inc104, !1191, !DIExpression(), !1192)
  br label %for.cond3, !dbg !1298, !llvm.loop !1299

for.cond107:                                      ; preds = %for.cond3, %for.body110
  %c106.0 = phi i32 [ %add113, %for.body110 ], [ 0, %for.cond3 ], !dbg !1301
    #dbg_value(i32 %c106.0, !1303, !DIExpression(), !1304)
  %cmp109 = icmp samesign ult i32 %c106.0, 1232, !dbg !1305
  br i1 %cmp109, label %for.body110, label %for.end114, !dbg !1307

for.body110:                                      ; preds = %for.cond107
  %add.ptr111 = getelementptr inbounds nuw i64, ptr %A, i32 %c106.0, !dbg !1308
  call fastcc void @transpose_16x16_nibbles(ptr noundef nonnull %add.ptr111) #6, !dbg !1310
  %add113 = add nuw nsw i32 %c106.0, 16, !dbg !1311
    #dbg_value(i32 %add113, !1303, !DIExpression(), !1304)
  br label %for.cond107, !dbg !1312, !llvm.loop !1313

for.end114:                                       ; preds = %for.cond107
    #dbg_declare(ptr %tab, !1315, !DIExpression(), !1319)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(16) %tab, i8 0, i32 16, i1 false), !dbg !1319
    #dbg_value(i32 0, !1320, !DIExpression(), !1322)
  br label %for.cond116, !dbg !1323

for.cond116:                                      ; preds = %for.body118, %for.end114
  %i115.0 = phi i32 [ 0, %for.end114 ], [ %inc138.3, %for.body118 ], !dbg !1324
    #dbg_value(i32 %i115.0, !1320, !DIExpression(), !1322)
  %exitcond9.not = icmp eq i32 %i115.0, 4, !dbg !1325
  br i1 %exitcond9.not, label %for.cond141, label %for.body118, !dbg !1327

for.body118:                                      ; preds = %for.cond116
  %arrayidx119 = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %i115.0, !dbg !1328
  %113 = load i8, ptr %arrayidx119, align 1, !dbg !1328
  %call = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %113, i8 noundef zeroext 1) #6, !dbg !1330
  %mul120 = shl nuw nsw i32 %i115.0, 2, !dbg !1331
  %arrayidx121 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %mul120, !dbg !1332
  store i8 %call, ptr %arrayidx121, align 1, !dbg !1333
  %call123 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %113, i8 noundef zeroext 2) #6, !dbg !1334
  %mul124 = shl nuw nsw i32 %i115.0, 2, !dbg !1335
  %add125 = or disjoint i32 %mul124, 1, !dbg !1336
  %arrayidx126 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add125, !dbg !1337
  store i8 %call123, ptr %arrayidx126, align 1, !dbg !1338
  %call128 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %113, i8 noundef zeroext 4) #6, !dbg !1339
  %mul129 = shl nuw nsw i32 %i115.0, 2, !dbg !1340
  %add130 = or disjoint i32 %mul129, 2, !dbg !1341
  %arrayidx131 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add130, !dbg !1342
  store i8 %call128, ptr %arrayidx131, align 1, !dbg !1343
  %call133 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %113, i8 noundef zeroext 8) #6, !dbg !1344
  %mul134 = shl nuw nsw i32 %i115.0, 2, !dbg !1345
  %add135 = or disjoint i32 %mul134, 3, !dbg !1346
  %arrayidx136 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add135, !dbg !1347
  store i8 %call133, ptr %arrayidx136, align 1, !dbg !1348
    #dbg_value(i32 %i115.0, !1320, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1322)
  %inc138 = or disjoint i32 %i115.0, 1, !dbg !1349
    #dbg_value(i32 %inc138, !1320, !DIExpression(), !1322)
  %arrayidx119.1 = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %inc138, !dbg !1328
  %114 = load i8, ptr %arrayidx119.1, align 1, !dbg !1328
  %call.1 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %114, i8 noundef zeroext 1) #6, !dbg !1330
  %mul120.1 = shl nuw nsw i32 %inc138, 2, !dbg !1331
  %arrayidx121.1 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %mul120.1, !dbg !1332
  store i8 %call.1, ptr %arrayidx121.1, align 1, !dbg !1333
  %call123.1 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %114, i8 noundef zeroext 2) #6, !dbg !1334
  %mul124.1 = shl nuw nsw i32 %inc138, 2, !dbg !1335
  %add125.1 = or disjoint i32 %mul124.1, 1, !dbg !1336
  %arrayidx126.1 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add125.1, !dbg !1337
  store i8 %call123.1, ptr %arrayidx126.1, align 1, !dbg !1338
  %call128.1 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %114, i8 noundef zeroext 4) #6, !dbg !1339
  %mul129.1 = shl nuw nsw i32 %inc138, 2, !dbg !1340
  %add130.1 = or disjoint i32 %mul129.1, 2, !dbg !1341
  %arrayidx131.1 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add130.1, !dbg !1342
  store i8 %call128.1, ptr %arrayidx131.1, align 1, !dbg !1343
  %call133.1 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %114, i8 noundef zeroext 8) #6, !dbg !1344
  %mul134.1 = shl nuw nsw i32 %inc138, 2, !dbg !1345
  %add135.1 = or disjoint i32 %mul134.1, 3, !dbg !1346
  %arrayidx136.1 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add135.1, !dbg !1347
  store i8 %call133.1, ptr %arrayidx136.1, align 1, !dbg !1348
    #dbg_value(i32 %i115.0, !1320, !DIExpression(DW_OP_plus_uconst, 2, DW_OP_stack_value), !1322)
  %inc138.1 = or disjoint i32 %i115.0, 2, !dbg !1349
    #dbg_value(i32 %inc138.1, !1320, !DIExpression(), !1322)
  %arrayidx119.2 = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %inc138.1, !dbg !1328
  %115 = load i8, ptr %arrayidx119.2, align 1, !dbg !1328
  %call.2 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %115, i8 noundef zeroext 1) #6, !dbg !1330
  %mul120.2 = shl nuw nsw i32 %inc138.1, 2, !dbg !1331
  %arrayidx121.2 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %mul120.2, !dbg !1332
  store i8 %call.2, ptr %arrayidx121.2, align 1, !dbg !1333
  %call123.2 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %115, i8 noundef zeroext 2) #6, !dbg !1334
  %mul124.2 = shl nuw nsw i32 %inc138.1, 2, !dbg !1335
  %add125.2 = or disjoint i32 %mul124.2, 1, !dbg !1336
  %arrayidx126.2 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add125.2, !dbg !1337
  store i8 %call123.2, ptr %arrayidx126.2, align 1, !dbg !1338
  %call128.2 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %115, i8 noundef zeroext 4) #6, !dbg !1339
  %mul129.2 = shl nuw nsw i32 %inc138.1, 2, !dbg !1340
  %add130.2 = or disjoint i32 %mul129.2, 2, !dbg !1341
  %arrayidx131.2 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add130.2, !dbg !1342
  store i8 %call128.2, ptr %arrayidx131.2, align 1, !dbg !1343
  %call133.2 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %115, i8 noundef zeroext 8) #6, !dbg !1344
  %mul134.2 = shl nuw nsw i32 %inc138.1, 2, !dbg !1345
  %add135.2 = or disjoint i32 %mul134.2, 3, !dbg !1346
  %arrayidx136.2 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add135.2, !dbg !1347
  store i8 %call133.2, ptr %arrayidx136.2, align 1, !dbg !1348
    #dbg_value(i32 %i115.0, !1320, !DIExpression(DW_OP_plus_uconst, 3, DW_OP_stack_value), !1322)
  %inc138.2 = or disjoint i32 %i115.0, 3, !dbg !1349
    #dbg_value(i32 %inc138.2, !1320, !DIExpression(), !1322)
  %arrayidx119.3 = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %inc138.2, !dbg !1328
  %116 = load i8, ptr %arrayidx119.3, align 1, !dbg !1328
  %call.3 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %116, i8 noundef zeroext 1) #6, !dbg !1330
  %mul120.3 = shl nuw nsw i32 %inc138.2, 2, !dbg !1331
  %arrayidx121.3 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %mul120.3, !dbg !1332
  store i8 %call.3, ptr %arrayidx121.3, align 1, !dbg !1333
  %call123.3 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %116, i8 noundef zeroext 2) #6, !dbg !1334
  %mul124.3 = shl nuw nsw i32 %inc138.2, 2, !dbg !1335
  %add125.3 = or disjoint i32 %mul124.3, 1, !dbg !1336
  %arrayidx126.3 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add125.3, !dbg !1337
  store i8 %call123.3, ptr %arrayidx126.3, align 1, !dbg !1338
  %call128.3 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %116, i8 noundef zeroext 4) #6, !dbg !1339
  %mul129.3 = shl nuw nsw i32 %inc138.2, 2, !dbg !1340
  %add130.3 = or disjoint i32 %mul129.3, 2, !dbg !1341
  %arrayidx131.3 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add130.3, !dbg !1342
  store i8 %call128.3, ptr %arrayidx131.3, align 1, !dbg !1343
  %call133.3 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %116, i8 noundef zeroext 8) #6, !dbg !1344
  %mul134.3 = shl nuw nsw i32 %inc138.2, 2, !dbg !1345
  %add135.3 = or disjoint i32 %mul134.3, 3, !dbg !1346
  %arrayidx136.3 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add135.3, !dbg !1347
  store i8 %call133.3, ptr %arrayidx136.3, align 1, !dbg !1348
  %inc138.3 = add nuw nsw i32 %i115.0, 4, !dbg !1349
    #dbg_value(i32 %inc138.3, !1320, !DIExpression(), !1322)
  br label %for.cond116, !dbg !1350, !llvm.loop !1351

for.cond141:                                      ; preds = %for.cond116, %for.inc203
  %c140.0 = phi i32 [ %add204, %for.inc203 ], [ 0, %for.cond116 ], !dbg !1353
    #dbg_value(i32 %c140.0, !1355, !DIExpression(), !1356)
  %cmp142 = icmp samesign ult i32 %c140.0, 112, !dbg !1357
  br i1 %cmp142, label %for.cond144, label %for.cond207, !dbg !1359

for.cond144:                                      ; preds = %for.cond141, %for.body146
  %r.0 = phi i32 [ %inc201, %for.body146 ], [ 108, %for.cond141 ], !dbg !1360
    #dbg_value(i32 %r.0, !1363, !DIExpression(), !1364)
  %exitcond11.not = icmp eq i32 %r.0, 174, !dbg !1365
  br i1 %exitcond11.not, label %for.inc203, label %for.body146, !dbg !1367

for.body146:                                      ; preds = %for.cond144
  %div1 = lshr i32 %r.0, 4, !dbg !1368
  %mul147 = mul nuw nsw i32 %div1, 112, !dbg !1370
  %add148 = add nuw nsw i32 %mul147, %c140.0, !dbg !1371
  %rem = and i32 %r.0, 15, !dbg !1372
  %add149 = or disjoint i32 %add148, %rem, !dbg !1373
    #dbg_value(i32 %add149, !1374, !DIExpression(), !1375)
  %arrayidx150 = getelementptr inbounds nuw [1568 x i64], ptr %A, i32 0, i32 %add149, !dbg !1376
  %117 = load i64, ptr %arrayidx150, align 8, !dbg !1376
  %and151 = and i64 %117, 1229782938247303441, !dbg !1377
    #dbg_value(i64 %and151, !1378, !DIExpression(), !1375)
  %shr153 = lshr i64 %117, 1, !dbg !1379
  %and154 = and i64 %shr153, 1229782938247303441, !dbg !1380
    #dbg_value(i64 %and154, !1381, !DIExpression(), !1375)
  %shr156 = lshr i64 %117, 2, !dbg !1382
  %and157 = and i64 %shr156, 1229782938247303441, !dbg !1383
    #dbg_value(i64 %and157, !1384, !DIExpression(), !1375)
  %arrayidx158 = getelementptr inbounds nuw [1568 x i64], ptr %A, i32 0, i32 %add149, !dbg !1385
  %118 = load i64, ptr %arrayidx158, align 8, !dbg !1385
  %shr159 = lshr i64 %118, 3, !dbg !1386
  %and160 = and i64 %shr159, 1229782938247303441, !dbg !1387
    #dbg_value(i64 %and160, !1388, !DIExpression(), !1375)
    #dbg_value(i32 0, !1389, !DIExpression(), !1391)
    #dbg_value(i32 0, !1389, !DIExpression(), !1391)
  %119 = load i8, ptr %tab, align 1, !dbg !1392
  %conv = zext i8 %119 to i64, !dbg !1392
  %mul167 = mul i64 %and151, %conv, !dbg !1395
  %arrayidx170 = getelementptr inbounds nuw i8, ptr %tab, i32 1, !dbg !1396
  %120 = load i8, ptr %arrayidx170, align 1, !dbg !1396
  %conv171 = zext i8 %120 to i64, !dbg !1396
  %mul172 = mul i64 %and154, %conv171, !dbg !1397
  %xor173 = xor i64 %mul167, %mul172, !dbg !1398
  %arrayidx176 = getelementptr inbounds nuw i8, ptr %tab, i32 2, !dbg !1399
  %121 = load i8, ptr %arrayidx176, align 1, !dbg !1399
  %conv177 = zext i8 %121 to i64, !dbg !1399
  %mul178 = mul i64 %and157, %conv177, !dbg !1400
  %xor179 = xor i64 %xor173, %mul178, !dbg !1401
  %arrayidx182 = getelementptr inbounds nuw i8, ptr %tab, i32 3, !dbg !1402
  %122 = load i8, ptr %arrayidx182, align 1, !dbg !1402
  %conv183 = zext i8 %122 to i64, !dbg !1402
  %mul184 = mul i64 %and160, %conv183, !dbg !1403
  %xor185 = xor i64 %xor179, %mul184, !dbg !1404
  %sub187 = add nsw i32 %r.0, -108, !dbg !1405
  %div1882 = lshr i32 %sub187, 4, !dbg !1406
  %mul189 = mul i32 %div1882, 112, !dbg !1407
  %add190 = add i32 %mul189, %c140.0, !dbg !1408
  %sub192 = add nuw nsw i32 %r.0, 4, !dbg !1409
  %rem193 = and i32 %sub192, 15, !dbg !1410
  %add194 = or disjoint i32 %add190, %rem193, !dbg !1411
  %arrayidx195 = getelementptr inbounds nuw [1568 x i64], ptr %A, i32 0, i32 %add194, !dbg !1412
  %123 = load i64, ptr %arrayidx195, align 8, !dbg !1413
  %xor196 = xor i64 %123, %xor185, !dbg !1413
  store i64 %xor196, ptr %arrayidx195, align 8, !dbg !1413
    #dbg_value(i32 1, !1389, !DIExpression(), !1391)
  %arrayidx166.1 = getelementptr inbounds nuw i8, ptr %tab, i32 4, !dbg !1392
  %124 = load i8, ptr %arrayidx166.1, align 1, !dbg !1392
  %conv.1 = zext i8 %124 to i64, !dbg !1392
  %mul167.1 = mul i64 %and151, %conv.1, !dbg !1395
  %arrayidx170.1 = getelementptr inbounds nuw i8, ptr %tab, i32 5, !dbg !1396
  %125 = load i8, ptr %arrayidx170.1, align 1, !dbg !1396
  %conv171.1 = zext i8 %125 to i64, !dbg !1396
  %mul172.1 = mul i64 %and154, %conv171.1, !dbg !1397
  %xor173.1 = xor i64 %mul167.1, %mul172.1, !dbg !1398
  %arrayidx176.1 = getelementptr inbounds nuw i8, ptr %tab, i32 6, !dbg !1399
  %126 = load i8, ptr %arrayidx176.1, align 1, !dbg !1399
  %conv177.1 = zext i8 %126 to i64, !dbg !1399
  %mul178.1 = mul i64 %and157, %conv177.1, !dbg !1400
  %xor179.1 = xor i64 %xor173.1, %mul178.1, !dbg !1401
  %arrayidx182.1 = getelementptr inbounds nuw i8, ptr %tab, i32 7, !dbg !1402
  %127 = load i8, ptr %arrayidx182.1, align 1, !dbg !1402
  %conv183.1 = zext i8 %127 to i64, !dbg !1402
  %mul184.1 = mul i64 %and160, %conv183.1, !dbg !1403
  %xor185.1 = xor i64 %xor179.1, %mul184.1, !dbg !1404
  %sub187.1 = add nsw i32 %r.0, -107, !dbg !1405
  %div1882.1 = lshr i32 %sub187.1, 4, !dbg !1406
  %mul189.1 = mul i32 %div1882.1, 112, !dbg !1407
  %add190.1 = add i32 %mul189.1, %c140.0, !dbg !1408
  %sub192.1 = add nuw nsw i32 %r.0, 5, !dbg !1409
  %rem193.1 = and i32 %sub192.1, 15, !dbg !1410
  %add194.1 = or disjoint i32 %add190.1, %rem193.1, !dbg !1411
  %arrayidx195.1 = getelementptr inbounds nuw [1568 x i64], ptr %A, i32 0, i32 %add194.1, !dbg !1412
  %128 = load i64, ptr %arrayidx195.1, align 8, !dbg !1413
  %xor196.1 = xor i64 %128, %xor185.1, !dbg !1413
  store i64 %xor196.1, ptr %arrayidx195.1, align 8, !dbg !1413
    #dbg_value(i32 2, !1389, !DIExpression(), !1391)
  %arrayidx166.2 = getelementptr inbounds nuw i8, ptr %tab, i32 8, !dbg !1392
  %129 = load i8, ptr %arrayidx166.2, align 1, !dbg !1392
  %conv.2 = zext i8 %129 to i64, !dbg !1392
  %mul167.2 = mul i64 %and151, %conv.2, !dbg !1395
  %arrayidx170.2 = getelementptr inbounds nuw i8, ptr %tab, i32 9, !dbg !1396
  %130 = load i8, ptr %arrayidx170.2, align 1, !dbg !1396
  %conv171.2 = zext i8 %130 to i64, !dbg !1396
  %mul172.2 = mul i64 %and154, %conv171.2, !dbg !1397
  %xor173.2 = xor i64 %mul167.2, %mul172.2, !dbg !1398
  %arrayidx176.2 = getelementptr inbounds nuw i8, ptr %tab, i32 10, !dbg !1399
  %131 = load i8, ptr %arrayidx176.2, align 1, !dbg !1399
  %conv177.2 = zext i8 %131 to i64, !dbg !1399
  %mul178.2 = mul i64 %and157, %conv177.2, !dbg !1400
  %xor179.2 = xor i64 %xor173.2, %mul178.2, !dbg !1401
  %arrayidx182.2 = getelementptr inbounds nuw i8, ptr %tab, i32 11, !dbg !1402
  %132 = load i8, ptr %arrayidx182.2, align 1, !dbg !1402
  %conv183.2 = zext i8 %132 to i64, !dbg !1402
  %mul184.2 = mul i64 %and160, %conv183.2, !dbg !1403
  %xor185.2 = xor i64 %xor179.2, %mul184.2, !dbg !1404
  %sub187.2 = add nsw i32 %r.0, -106, !dbg !1405
  %div1882.2 = lshr i32 %sub187.2, 4, !dbg !1406
  %mul189.2 = mul i32 %div1882.2, 112, !dbg !1407
  %add190.2 = add i32 %mul189.2, %c140.0, !dbg !1408
  %sub192.2 = add nuw nsw i32 %r.0, 6, !dbg !1409
  %rem193.2 = and i32 %sub192.2, 15, !dbg !1410
  %add194.2 = or disjoint i32 %add190.2, %rem193.2, !dbg !1411
  %arrayidx195.2 = getelementptr inbounds nuw [1568 x i64], ptr %A, i32 0, i32 %add194.2, !dbg !1412
  %133 = load i64, ptr %arrayidx195.2, align 8, !dbg !1413
  %xor196.2 = xor i64 %133, %xor185.2, !dbg !1413
  store i64 %xor196.2, ptr %arrayidx195.2, align 8, !dbg !1413
    #dbg_value(i32 3, !1389, !DIExpression(), !1391)
  %arrayidx166.3 = getelementptr inbounds nuw i8, ptr %tab, i32 12, !dbg !1392
  %134 = load i8, ptr %arrayidx166.3, align 1, !dbg !1392
  %conv.3 = zext i8 %134 to i64, !dbg !1392
  %mul167.3 = mul i64 %and151, %conv.3, !dbg !1395
  %arrayidx170.3 = getelementptr inbounds nuw i8, ptr %tab, i32 13, !dbg !1396
  %135 = load i8, ptr %arrayidx170.3, align 1, !dbg !1396
  %conv171.3 = zext i8 %135 to i64, !dbg !1396
  %mul172.3 = mul i64 %and154, %conv171.3, !dbg !1397
  %xor173.3 = xor i64 %mul167.3, %mul172.3, !dbg !1398
  %arrayidx176.3 = getelementptr inbounds nuw i8, ptr %tab, i32 14, !dbg !1399
  %136 = load i8, ptr %arrayidx176.3, align 1, !dbg !1399
  %conv177.3 = zext i8 %136 to i64, !dbg !1399
  %mul178.3 = mul i64 %and157, %conv177.3, !dbg !1400
  %xor179.3 = xor i64 %xor173.3, %mul178.3, !dbg !1401
  %arrayidx182.3 = getelementptr inbounds nuw i8, ptr %tab, i32 15, !dbg !1402
  %137 = load i8, ptr %arrayidx182.3, align 1, !dbg !1402
  %conv183.3 = zext i8 %137 to i64, !dbg !1402
  %mul184.3 = mul i64 %and160, %conv183.3, !dbg !1403
  %xor185.3 = xor i64 %xor179.3, %mul184.3, !dbg !1404
  %sub187.3 = add nsw i32 %r.0, -105, !dbg !1405
  %div1882.3 = lshr i32 %sub187.3, 4, !dbg !1406
  %mul189.3 = mul i32 %div1882.3, 112, !dbg !1407
  %add190.3 = add i32 %mul189.3, %c140.0, !dbg !1408
  %sub192.3 = add nuw nsw i32 %r.0, 7, !dbg !1409
  %rem193.3 = and i32 %sub192.3, 15, !dbg !1410
  %add194.3 = or disjoint i32 %add190.3, %rem193.3, !dbg !1411
  %arrayidx195.3 = getelementptr inbounds nuw [1568 x i64], ptr %A, i32 0, i32 %add194.3, !dbg !1412
  %138 = load i64, ptr %arrayidx195.3, align 8, !dbg !1413
  %xor196.3 = xor i64 %138, %xor185.3, !dbg !1413
  store i64 %xor196.3, ptr %arrayidx195.3, align 8, !dbg !1413
    #dbg_value(i32 4, !1389, !DIExpression(), !1391)
  %inc201 = add nuw nsw i32 %r.0, 1, !dbg !1414
    #dbg_value(i32 %inc201, !1363, !DIExpression(), !1364)
  br label %for.cond144, !dbg !1415, !llvm.loop !1416

for.inc203:                                       ; preds = %for.cond144
  %add204 = add nuw nsw i32 %c140.0, 16, !dbg !1418
    #dbg_value(i32 %add204, !1355, !DIExpression(), !1356)
  br label %for.cond141, !dbg !1419, !llvm.loop !1420

for.cond207:                                      ; preds = %for.cond141, %for.inc241
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.inc241 ], [ 108, %for.cond141 ], !dbg !1422
  %r206.0 = phi i32 [ %add242, %for.inc241 ], [ 0, %for.cond141 ], !dbg !1422
    #dbg_value(i32 %r206.0, !1424, !DIExpression(), !1425)
  %cmp208 = icmp samesign ult i32 %r206.0, 108, !dbg !1426
  br i1 %cmp208, label %for.cond212, label %for.end243, !dbg !1428

for.cond212:                                      ; preds = %for.cond207, %for.inc238.3
  %c211.0 = phi i32 [ %add239.3, %for.inc238.3 ], [ 0, %for.cond207 ], !dbg !1429
    #dbg_value(i32 %c211.0, !1432, !DIExpression(), !1433)
  br label %for.cond217, !dbg !1434

for.cond217:                                      ; preds = %for.cond212, %for.body221
  %i216.0 = phi i32 [ %inc236, %for.body221 ], [ 0, %for.cond212 ], !dbg !1438
    #dbg_value(i32 %i216.0, !1439, !DIExpression(), !1440)
  %exitcond12.not = icmp eq i32 %i216.0, %indvars.iv, !dbg !1441
  br i1 %exitcond12.not, label %for.inc238, label %for.body221, !dbg !1434

for.body221:                                      ; preds = %for.cond217
  %div223 = mul nuw nsw i32 %r206.0, 7, !dbg !1443
  %add224 = add nuw nsw i32 %div223, %c211.0, !dbg !1445
  %add225 = add nuw nsw i32 %add224, %i216.0, !dbg !1446
  %arrayidx226 = getelementptr inbounds nuw [1568 x i64], ptr %A, i32 0, i32 %add225, !dbg !1447
  %add227 = add nuw nsw i32 %r206.0, %i216.0, !dbg !1448
  %mul228 = mul nuw nsw i32 %add227, 111, !dbg !1449
  %add.ptr229 = getelementptr inbounds nuw i8, ptr %A_out, i32 %mul228, !dbg !1450
  %add.ptr230 = getelementptr inbounds nuw i8, ptr %add.ptr229, i32 %c211.0, !dbg !1451
  call fastcc void @decode(ptr noundef nonnull %arrayidx226, ptr noundef %add.ptr230, i32 noundef 16) #6, !dbg !1452
  %inc236 = add nuw nsw i32 %i216.0, 1, !dbg !1453
    #dbg_value(i32 %inc236, !1439, !DIExpression(), !1440)
  br label %for.cond217, !dbg !1454, !llvm.loop !1455

for.inc238:                                       ; preds = %for.cond217
  %add239 = or disjoint i32 %c211.0, 16, !dbg !1457
    #dbg_value(i32 %add239, !1432, !DIExpression(), !1433)
  br label %for.cond217.1, !dbg !1434

for.cond217.1:                                    ; preds = %for.body221.1, %for.inc238
  %i216.0.1 = phi i32 [ %inc236.1, %for.body221.1 ], [ 0, %for.inc238 ], !dbg !1438
    #dbg_value(i32 %i216.0.1, !1439, !DIExpression(), !1440)
  %exitcond12.1.not = icmp eq i32 %i216.0.1, %indvars.iv, !dbg !1441
  br i1 %exitcond12.1.not, label %for.inc238.1, label %for.body221.1, !dbg !1434

for.inc238.1:                                     ; preds = %for.cond217.1
  %add239.1 = or disjoint i32 %c211.0, 32, !dbg !1457
    #dbg_value(i32 %add239.1, !1432, !DIExpression(), !1433)
  br label %for.cond217.2, !dbg !1434

for.body221.1:                                    ; preds = %for.cond217.1
  %div223.1 = mul nuw nsw i32 %r206.0, 7, !dbg !1443
  %add224.1 = add nuw nsw i32 %div223.1, %add239, !dbg !1445
  %add225.1 = add nuw nsw i32 %add224.1, %i216.0.1, !dbg !1446
  %arrayidx226.1 = getelementptr inbounds nuw [1568 x i64], ptr %A, i32 0, i32 %add225.1, !dbg !1447
  %add227.1 = add nuw nsw i32 %r206.0, %i216.0.1, !dbg !1448
  %mul228.1 = mul nuw nsw i32 %add227.1, 111, !dbg !1449
  %add.ptr229.1 = getelementptr inbounds nuw i8, ptr %A_out, i32 %mul228.1, !dbg !1450
  %add.ptr230.1 = getelementptr inbounds nuw i8, ptr %add.ptr229.1, i32 %add239, !dbg !1451
  call fastcc void @decode(ptr noundef nonnull %arrayidx226.1, ptr noundef nonnull %add.ptr230.1, i32 noundef 16) #6, !dbg !1452
  %inc236.1 = add nuw nsw i32 %i216.0.1, 1, !dbg !1453
    #dbg_value(i32 %inc236.1, !1439, !DIExpression(), !1440)
  br label %for.cond217.1, !dbg !1454, !llvm.loop !1455

for.cond217.2:                                    ; preds = %for.body221.2, %for.inc238.1
  %i216.0.2 = phi i32 [ %inc236.2, %for.body221.2 ], [ 0, %for.inc238.1 ], !dbg !1438
    #dbg_value(i32 %i216.0.2, !1439, !DIExpression(), !1440)
  %exitcond12.2.not = icmp eq i32 %i216.0.2, %indvars.iv, !dbg !1441
  br i1 %exitcond12.2.not, label %for.inc238.2, label %for.body221.2, !dbg !1434

for.inc238.2:                                     ; preds = %for.cond217.2
  %add239.2 = or disjoint i32 %c211.0, 48, !dbg !1457
    #dbg_value(i32 %add239.2, !1432, !DIExpression(), !1433)
  %cmp213.3 = icmp samesign ult i32 %add239.2, 110, !dbg !1458
  br i1 %cmp213.3, label %for.cond217.3, label %for.inc241, !dbg !1459

for.body221.2:                                    ; preds = %for.cond217.2
  %div223.2 = mul nuw nsw i32 %r206.0, 7, !dbg !1443
  %add224.2 = add nuw nsw i32 %div223.2, %add239.1, !dbg !1445
  %add225.2 = add nuw nsw i32 %add224.2, %i216.0.2, !dbg !1446
  %arrayidx226.2 = getelementptr inbounds nuw [1568 x i64], ptr %A, i32 0, i32 %add225.2, !dbg !1447
  %add227.2 = add nuw nsw i32 %r206.0, %i216.0.2, !dbg !1448
  %mul228.2 = mul nuw nsw i32 %add227.2, 111, !dbg !1449
  %add.ptr229.2 = getelementptr inbounds nuw i8, ptr %A_out, i32 %mul228.2, !dbg !1450
  %add.ptr230.2 = getelementptr inbounds nuw i8, ptr %add.ptr229.2, i32 %add239.1, !dbg !1451
  %cmp232.2 = icmp samesign ult i32 %add239.1, 94, !dbg !1460
  %sub234.2 = sub nuw nsw i32 110, %add239.1, !dbg !1460
  %cond.2 = select i1 %cmp232.2, i32 16, i32 %sub234.2, !dbg !1460
  call fastcc void @decode(ptr noundef nonnull %arrayidx226.2, ptr noundef nonnull %add.ptr230.2, i32 noundef %cond.2) #6, !dbg !1452
  %inc236.2 = add nuw nsw i32 %i216.0.2, 1, !dbg !1453
    #dbg_value(i32 %inc236.2, !1439, !DIExpression(), !1440)
  br label %for.cond217.2, !dbg !1454, !llvm.loop !1455

for.cond217.3:                                    ; preds = %for.inc238.2, %for.body221.3
  %i216.0.3 = phi i32 [ %inc236.3, %for.body221.3 ], [ 0, %for.inc238.2 ], !dbg !1438
    #dbg_value(i32 %i216.0.3, !1439, !DIExpression(), !1440)
  %exitcond12.3.not = icmp eq i32 %i216.0.3, %indvars.iv, !dbg !1441
  br i1 %exitcond12.3.not, label %for.inc238.3, label %for.body221.3, !dbg !1434

for.inc238.3:                                     ; preds = %for.cond217.3
  %add239.3 = add nuw nsw i32 %c211.0, 64, !dbg !1457
    #dbg_value(i32 %add239.3, !1432, !DIExpression(), !1433)
  br label %for.cond212, !dbg !1461, !llvm.loop !1462

for.body221.3:                                    ; preds = %for.cond217.3
  %div223.3 = mul nuw nsw i32 %r206.0, 7, !dbg !1443
  %add224.3 = add nuw nsw i32 %div223.3, %add239.2, !dbg !1445
  %add225.3 = add nuw nsw i32 %add224.3, %i216.0.3, !dbg !1446
  %arrayidx226.3 = getelementptr inbounds nuw [1568 x i64], ptr %A, i32 0, i32 %add225.3, !dbg !1447
  %add227.3 = add nuw nsw i32 %r206.0, %i216.0.3, !dbg !1448
  %mul228.3 = mul nuw nsw i32 %add227.3, 111, !dbg !1449
  %add.ptr229.3 = getelementptr inbounds nuw i8, ptr %A_out, i32 %mul228.3, !dbg !1450
  %add.ptr230.3 = getelementptr inbounds nuw i8, ptr %add.ptr229.3, i32 %add239.2, !dbg !1451
  %cmp232.3 = icmp samesign ult i32 %add239.2, 94, !dbg !1460
  %sub234.3 = sub nsw i32 110, %add239.2, !dbg !1460
  %cond.3 = select i1 %cmp232.3, i32 16, i32 %sub234.3, !dbg !1460
  call fastcc void @decode(ptr noundef nonnull %arrayidx226.3, ptr noundef nonnull %add.ptr230.3, i32 noundef %cond.3) #6, !dbg !1452
  %inc236.3 = add nuw nsw i32 %i216.0.3, 1, !dbg !1453
    #dbg_value(i32 %inc236.3, !1439, !DIExpression(), !1440)
  br label %for.cond217.3, !dbg !1454, !llvm.loop !1455

for.inc241:                                       ; preds = %for.inc238.2
  %add242 = add nuw nsw i32 %r206.0, 16, !dbg !1464
    #dbg_value(i32 %add242, !1424, !DIExpression(), !1425)
  %indvars.iv.next = add nsw i32 %indvars.iv, -16, !dbg !1465
  br label %for.cond207, !dbg !1465, !llvm.loop !1466

for.end243:                                       ; preds = %for.cond207
  ret void, !dbg !1468
}

declare dso_local ptr @memset(ptr noundef, i32 noundef, i32 noundef) local_unnamed_addr #4

; Function Attrs: nounwind
define internal fastcc void @mat_mul(ptr noundef %a, ptr noundef %b, ptr noundef %c, i32 noundef %colrow_ab, i32 noundef %row_a, i32 noundef %col_b) unnamed_addr #0 !dbg !1469 {
entry:
    #dbg_value(ptr %a, !1472, !DIExpression(), !1473)
    #dbg_value(ptr %b, !1474, !DIExpression(), !1473)
    #dbg_value(ptr %c, !1475, !DIExpression(), !1473)
    #dbg_value(i32 %colrow_ab, !1476, !DIExpression(), !1473)
    #dbg_value(i32 %row_a, !1477, !DIExpression(), !1473)
    #dbg_value(i32 %col_b, !1478, !DIExpression(), !1473)
    #dbg_value(i32 0, !1479, !DIExpression(), !1481)
  %smax = call i32 @llvm.smax.i32(i32 %col_b, i32 0), !dbg !1482
  %smax1 = call i32 @llvm.smax.i32(i32 %row_a, i32 0), !dbg !1482
  br label %for.cond, !dbg !1482

for.cond:                                         ; preds = %for.inc4, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc5, %for.inc4 ], !dbg !1483
  %c.addr.0 = phi ptr [ %c, %entry ], [ %c.addr.1, %for.inc4 ]
  %a.addr.0 = phi ptr [ %a, %entry ], [ %add.ptr6, %for.inc4 ]
    #dbg_value(ptr %a.addr.0, !1472, !DIExpression(), !1473)
    #dbg_value(ptr %c.addr.0, !1475, !DIExpression(), !1473)
    #dbg_value(i32 %i.0, !1479, !DIExpression(), !1481)
  %exitcond2.not = icmp eq i32 %i.0, %smax1, !dbg !1484
  br i1 %exitcond2.not, label %for.end7, label %for.cond1, !dbg !1486

for.cond1:                                        ; preds = %for.cond, %for.body3
  %c.addr.1 = phi ptr [ %incdec.ptr, %for.body3 ], [ %c.addr.0, %for.cond ]
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond ], !dbg !1487
    #dbg_value(i32 %j.0, !1490, !DIExpression(), !1491)
    #dbg_value(ptr %c.addr.1, !1475, !DIExpression(), !1473)
  %exitcond.not = icmp eq i32 %j.0, %smax, !dbg !1492
  br i1 %exitcond.not, label %for.inc4, label %for.body3, !dbg !1494

for.body3:                                        ; preds = %for.cond1
  %add.ptr = getelementptr inbounds nuw i8, ptr %b, i32 %j.0, !dbg !1495
  %call = call fastcc zeroext i8 @lincomb(ptr noundef %a.addr.0, ptr noundef %add.ptr, i32 noundef %colrow_ab, i32 noundef %col_b) #6, !dbg !1497
  store i8 %call, ptr %c.addr.1, align 1, !dbg !1498
  %inc = add nuw i32 %j.0, 1, !dbg !1499
    #dbg_value(i32 %inc, !1490, !DIExpression(), !1491)
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %c.addr.1, i32 1, !dbg !1500
    #dbg_value(ptr %incdec.ptr, !1475, !DIExpression(), !1473)
  br label %for.cond1, !dbg !1501, !llvm.loop !1502

for.inc4:                                         ; preds = %for.cond1
  %inc5 = add nuw i32 %i.0, 1, !dbg !1504
    #dbg_value(i32 %inc5, !1479, !DIExpression(), !1481)
  %add.ptr6 = getelementptr inbounds i8, ptr %a.addr.0, i32 %colrow_ab, !dbg !1505
    #dbg_value(ptr %add.ptr6, !1472, !DIExpression(), !1473)
  br label %for.cond, !dbg !1506, !llvm.loop !1507

for.end7:                                         ; preds = %for.cond
  %cmp8 = icmp eq i32 %row_a, %col_b, !dbg !1509
  %call9 = call zeroext i1 @assert(i1 noundef zeroext %cmp8) #8, !dbg !1510
  ret void, !dbg !1511
}

; Function Attrs: nounwind
define internal fastcc void @mat_add(ptr noundef %a, ptr noundef %b, ptr noundef %c, i32 noundef %m, i32 noundef %n) unnamed_addr #0 !dbg !1512 {
entry:
    #dbg_value(ptr %a, !1515, !DIExpression(), !1516)
    #dbg_value(ptr %b, !1517, !DIExpression(), !1516)
    #dbg_value(ptr %c, !1518, !DIExpression(), !1516)
    #dbg_value(i32 %m, !1519, !DIExpression(), !1516)
    #dbg_value(i32 %n, !1520, !DIExpression(), !1516)
    #dbg_value(i32 0, !1521, !DIExpression(), !1523)
  %smax = call i32 @llvm.smax.i32(i32 %n, i32 0), !dbg !1524
  %smax1 = call i32 @llvm.smax.i32(i32 %m, i32 0), !dbg !1524
  br label %for.cond, !dbg !1524

for.cond:                                         ; preds = %for.inc11, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc12, %for.inc11 ], !dbg !1525
    #dbg_value(i32 %i.0, !1521, !DIExpression(), !1523)
  %exitcond2.not = icmp eq i32 %i.0, %smax1, !dbg !1526
  br i1 %exitcond2.not, label %for.end13, label %for.cond1, !dbg !1528

for.cond1:                                        ; preds = %for.cond, %for.body3
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond ], !dbg !1529
    #dbg_value(i32 %j.0, !1532, !DIExpression(), !1533)
  %exitcond.not = icmp eq i32 %j.0, %smax, !dbg !1534
  br i1 %exitcond.not, label %for.inc11, label %for.body3, !dbg !1536

for.body3:                                        ; preds = %for.cond1
  %mul = mul nsw i32 %i.0, %n, !dbg !1537
  %add.ptr = getelementptr inbounds i8, ptr %a, i32 %mul, !dbg !1539
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %j.0, !dbg !1540
  %0 = load i8, ptr %add.ptr4, align 1, !dbg !1541
  %mul5 = mul nsw i32 %i.0, %n, !dbg !1542
  %add.ptr6 = getelementptr inbounds i8, ptr %b, i32 %mul5, !dbg !1543
  %add.ptr7 = getelementptr inbounds nuw i8, ptr %add.ptr6, i32 %j.0, !dbg !1544
  %1 = load i8, ptr %add.ptr7, align 1, !dbg !1545
  %call = call fastcc zeroext i8 @add_f(i8 noundef zeroext %0, i8 noundef zeroext %1) #6, !dbg !1546
  %mul8 = mul nsw i32 %i.0, %n, !dbg !1547
  %add.ptr9 = getelementptr inbounds i8, ptr %c, i32 %mul8, !dbg !1548
  %add.ptr10 = getelementptr inbounds nuw i8, ptr %add.ptr9, i32 %j.0, !dbg !1549
  store i8 %call, ptr %add.ptr10, align 1, !dbg !1550
  %inc = add nuw i32 %j.0, 1, !dbg !1551
    #dbg_value(i32 %inc, !1532, !DIExpression(), !1533)
  br label %for.cond1, !dbg !1552, !llvm.loop !1553

for.inc11:                                        ; preds = %for.cond1
  %inc12 = add nuw i32 %i.0, 1, !dbg !1555
    #dbg_value(i32 %inc12, !1521, !DIExpression(), !1523)
  br label %for.cond, !dbg !1556, !llvm.loop !1557

for.end13:                                        ; preds = %for.cond
  ret void, !dbg !1559
}

; Function Attrs: nounwind
define internal fastcc void @encode(ptr noundef %m, ptr noundef %menc, i32 noundef %mlen) unnamed_addr #0 !dbg !1560 {
entry:
    #dbg_value(ptr %m, !1561, !DIExpression(), !1562)
    #dbg_value(ptr %menc, !1563, !DIExpression(), !1562)
    #dbg_value(i32 %mlen, !1564, !DIExpression(), !1562)
    #dbg_value(i32 0, !1565, !DIExpression(), !1562)
  br label %for.cond, !dbg !1566

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1568
  %m.addr.0 = phi ptr [ %m, %entry ], [ %add.ptr3, %for.body ]
    #dbg_value(ptr %m.addr.0, !1561, !DIExpression(), !1562)
    #dbg_value(i32 %i.0, !1565, !DIExpression(), !1562)
  %div = sdiv i32 %mlen, 2, !dbg !1569
  %cmp = icmp slt i32 %i.0, %div, !dbg !1571
  br i1 %cmp, label %for.body, label %for.end, !dbg !1572

for.body:                                         ; preds = %for.cond
  %0 = load i8, ptr %m.addr.0, align 1, !dbg !1573
  %add.ptr = getelementptr inbounds nuw i8, ptr %m.addr.0, i32 1, !dbg !1575
  %1 = load i8, ptr %add.ptr, align 1, !dbg !1576
  %shl = shl i8 %1, 4, !dbg !1577
  %or = or i8 %shl, %0, !dbg !1578
  %arrayidx = getelementptr inbounds nuw i8, ptr %menc, i32 %i.0, !dbg !1579
  store i8 %or, ptr %arrayidx, align 1, !dbg !1580
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1581
    #dbg_value(i32 %inc, !1565, !DIExpression(), !1562)
  %add.ptr3 = getelementptr inbounds nuw i8, ptr %m.addr.0, i32 2, !dbg !1582
    #dbg_value(ptr %add.ptr3, !1561, !DIExpression(), !1562)
  br label %for.cond, !dbg !1583, !llvm.loop !1584

for.end:                                          ; preds = %for.cond
  %2 = and i32 %mlen, -2147483647, !dbg !1586
  %cmp4 = icmp eq i32 %2, 1, !dbg !1586
  br i1 %cmp4, label %if.then, label %if.end, !dbg !1586

if.then:                                          ; preds = %for.end
  %3 = load i8, ptr %m.addr.0, align 1, !dbg !1588
  %arrayidx6 = getelementptr inbounds nuw i8, ptr %menc, i32 %i.0, !dbg !1590
  store i8 %3, ptr %arrayidx6, align 1, !dbg !1591
  br label %if.end, !dbg !1592

if.end:                                           ; preds = %if.then, %for.end
  ret void, !dbg !1593
}

; Function Attrs: nounwind
define internal fastcc zeroext i8 @add_f(i8 noundef zeroext %a, i8 noundef zeroext %b) unnamed_addr #0 !dbg !1594 {
entry:
    #dbg_value(i8 %a, !1597, !DIExpression(), !1598)
    #dbg_value(i8 %b, !1599, !DIExpression(), !1598)
  %xor1 = xor i8 %a, %b, !dbg !1600
  ret i8 %xor1, !dbg !1601
}

; Function Attrs: nounwind
define internal fastcc zeroext i8 @lincomb(ptr noundef %a, ptr noundef %b, i32 noundef %n, i32 noundef %m) unnamed_addr #0 !dbg !1602 {
entry:
    #dbg_value(ptr %a, !1605, !DIExpression(), !1606)
    #dbg_value(ptr %b, !1607, !DIExpression(), !1606)
    #dbg_value(i32 %n, !1608, !DIExpression(), !1606)
    #dbg_value(i32 %m, !1609, !DIExpression(), !1606)
    #dbg_value(i8 0, !1610, !DIExpression(), !1606)
    #dbg_value(i32 0, !1611, !DIExpression(), !1613)
  %smax = call i32 @llvm.smax.i32(i32 %n, i32 0), !dbg !1614
  br label %for.cond, !dbg !1614

for.cond:                                         ; preds = %for.body, %entry
  %ret.0 = phi i8 [ 0, %entry ], [ %call1, %for.body ], !dbg !1606
  %b.addr.0 = phi ptr [ %b, %entry ], [ %add.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1615
    #dbg_value(i32 %i.0, !1611, !DIExpression(), !1613)
    #dbg_value(ptr %b.addr.0, !1607, !DIExpression(), !1606)
    #dbg_value(i8 %ret.0, !1610, !DIExpression(), !1606)
  %exitcond.not = icmp eq i32 %i.0, %smax, !dbg !1616
  br i1 %exitcond.not, label %for.end, label %for.body, !dbg !1618

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %i.0, !dbg !1619
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1619
  %1 = load i8, ptr %b.addr.0, align 1, !dbg !1621
  %call = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %0, i8 noundef zeroext %1) #6, !dbg !1622
  %call1 = call fastcc zeroext i8 @add_f(i8 noundef zeroext %call, i8 noundef zeroext %ret.0) #6, !dbg !1623
    #dbg_value(i8 %call1, !1610, !DIExpression(), !1606)
  %inc = add nuw i32 %i.0, 1, !dbg !1624
    #dbg_value(i32 %inc, !1611, !DIExpression(), !1613)
  %add.ptr = getelementptr inbounds i8, ptr %b.addr.0, i32 %m, !dbg !1625
    #dbg_value(ptr %add.ptr, !1607, !DIExpression(), !1606)
  br label %for.cond, !dbg !1626, !llvm.loop !1627

for.end:                                          ; preds = %for.cond
  ret i8 %ret.0, !dbg !1629
}

declare dso_local zeroext i1 @assert(i1 noundef zeroext) local_unnamed_addr #4

; Function Attrs: nounwind
define internal fastcc zeroext range(i8 0, 16) i8 @mul_f(i8 noundef zeroext %a, i8 noundef zeroext %b) unnamed_addr #0 !dbg !1630 {
entry:
    #dbg_value(i8 %a, !1631, !DIExpression(), !1632)
    #dbg_value(i8 %b, !1633, !DIExpression(), !1632)
  %0 = load volatile i8, ptr @pqmayo_MAYO_3_ref_unsigned_char_blocker, align 1, !dbg !1634
  %xor1 = xor i8 %a, %0, !dbg !1635
    #dbg_value(i8 %xor1, !1631, !DIExpression(), !1632)
  %1 = trunc i8 %xor1 to i1, !dbg !1636
    #dbg_value(i8 poison, !1637, !DIExpression(), !1632)
  %2 = and i8 %xor1, 2, !dbg !1638
  %mul9 = mul i8 %2, %b, !dbg !1639
  %conv10 = select i1 %1, i8 %b, i8 0, !dbg !1636
  %xor11 = xor i8 %conv10, %mul9, !dbg !1640
    #dbg_value(i8 %xor11, !1637, !DIExpression(), !1632)
  %3 = and i8 %xor1, 4, !dbg !1641
  %mul16 = mul i8 %3, %b, !dbg !1642
  %xor18 = xor i8 %mul16, %xor11, !dbg !1643
    #dbg_value(i8 %xor18, !1637, !DIExpression(), !1632)
  %4 = and i8 %xor1, 8, !dbg !1644
  %mul23 = mul i8 %4, %b, !dbg !1645
  %xor25 = xor i8 %mul23, %xor18, !dbg !1646
    #dbg_value(i8 %xor25, !1637, !DIExpression(), !1632)
    #dbg_value(i8 %xor25, !1647, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !1632)
  %5 = lshr i8 %xor25, 4, !dbg !1648
  %6 = lshr i8 %xor25, 3, !dbg !1649
  %7 = and i8 %6, 14, !dbg !1649
  %8 = xor i8 %5, %7, !dbg !1650
  %xor25.masked = and i8 %xor25, 15, !dbg !1651
  %9 = xor i8 %8, %xor25.masked, !dbg !1651
    #dbg_value(i8 %9, !1652, !DIExpression(), !1632)
  ret i8 %9, !dbg !1653
}

; Function Attrs: nounwind
define internal fastcc void @transpose_16x16_nibbles(ptr noundef %M) unnamed_addr #0 !dbg !67 {
entry:
    #dbg_value(ptr %M, !1654, !DIExpression(), !1655)
    #dbg_value(i32 0, !1656, !DIExpression(), !1658)
    #dbg_value(i32 0, !1656, !DIExpression(), !1658)
  %0 = load i64, ptr %M, align 8, !dbg !1659
  %shr = lshr i64 %0, 4, !dbg !1662
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %M, i32 8, !dbg !1663
  %1 = load i64, ptr %arrayidx1, align 8, !dbg !1663
  %xor = xor i64 %shr, %1, !dbg !1664
  %and = and i64 %xor, 1085102592571150095, !dbg !1665
    #dbg_value(i64 %and, !1666, !DIExpression(), !1667)
  %shl = shl nuw i64 %and, 4, !dbg !1668
  %2 = load i64, ptr %M, align 8, !dbg !1669
  %xor3 = xor i64 %2, %shl, !dbg !1669
  store i64 %xor3, ptr %M, align 8, !dbg !1669
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %M, i32 8, !dbg !1670
  %3 = load i64, ptr %arrayidx5, align 8, !dbg !1671
  %xor6 = xor i64 %3, %and, !dbg !1671
  store i64 %xor6, ptr %arrayidx5, align 8, !dbg !1671
    #dbg_value(i32 2, !1656, !DIExpression(), !1658)
  %arrayidx.1 = getelementptr inbounds nuw i8, ptr %M, i32 16, !dbg !1659
  %4 = load i64, ptr %arrayidx.1, align 8, !dbg !1659
  %shr.1 = lshr i64 %4, 4, !dbg !1662
  %arrayidx1.1 = getelementptr inbounds nuw i8, ptr %M, i32 24, !dbg !1663
  %5 = load i64, ptr %arrayidx1.1, align 8, !dbg !1663
  %xor.1 = xor i64 %shr.1, %5, !dbg !1664
  %and.1 = and i64 %xor.1, 1085102592571150095, !dbg !1665
    #dbg_value(i64 %and.1, !1666, !DIExpression(), !1667)
  %shl.1 = shl nuw i64 %and.1, 4, !dbg !1668
  %arrayidx2.1 = getelementptr inbounds nuw i8, ptr %M, i32 16, !dbg !1672
  %6 = load i64, ptr %arrayidx2.1, align 8, !dbg !1669
  %xor3.1 = xor i64 %6, %shl.1, !dbg !1669
  store i64 %xor3.1, ptr %arrayidx2.1, align 8, !dbg !1669
  %arrayidx5.1 = getelementptr inbounds nuw i8, ptr %M, i32 24, !dbg !1670
  %7 = load i64, ptr %arrayidx5.1, align 8, !dbg !1671
  %xor6.1 = xor i64 %7, %and.1, !dbg !1671
  store i64 %xor6.1, ptr %arrayidx5.1, align 8, !dbg !1671
    #dbg_value(i32 4, !1656, !DIExpression(), !1658)
  %arrayidx.2 = getelementptr inbounds nuw i8, ptr %M, i32 32, !dbg !1659
  %8 = load i64, ptr %arrayidx.2, align 8, !dbg !1659
  %shr.2 = lshr i64 %8, 4, !dbg !1662
  %arrayidx1.2 = getelementptr inbounds nuw i8, ptr %M, i32 40, !dbg !1663
  %9 = load i64, ptr %arrayidx1.2, align 8, !dbg !1663
  %xor.2 = xor i64 %shr.2, %9, !dbg !1664
  %and.2 = and i64 %xor.2, 1085102592571150095, !dbg !1665
    #dbg_value(i64 %and.2, !1666, !DIExpression(), !1667)
  %shl.2 = shl nuw i64 %and.2, 4, !dbg !1668
  %arrayidx2.2 = getelementptr inbounds nuw i8, ptr %M, i32 32, !dbg !1672
  %10 = load i64, ptr %arrayidx2.2, align 8, !dbg !1669
  %xor3.2 = xor i64 %10, %shl.2, !dbg !1669
  store i64 %xor3.2, ptr %arrayidx2.2, align 8, !dbg !1669
  %arrayidx5.2 = getelementptr inbounds nuw i8, ptr %M, i32 40, !dbg !1670
  %11 = load i64, ptr %arrayidx5.2, align 8, !dbg !1671
  %xor6.2 = xor i64 %11, %and.2, !dbg !1671
  store i64 %xor6.2, ptr %arrayidx5.2, align 8, !dbg !1671
    #dbg_value(i32 6, !1656, !DIExpression(), !1658)
  %arrayidx.3 = getelementptr inbounds nuw i8, ptr %M, i32 48, !dbg !1659
  %12 = load i64, ptr %arrayidx.3, align 8, !dbg !1659
  %shr.3 = lshr i64 %12, 4, !dbg !1662
  %arrayidx1.3 = getelementptr inbounds nuw i8, ptr %M, i32 56, !dbg !1663
  %13 = load i64, ptr %arrayidx1.3, align 8, !dbg !1663
  %xor.3 = xor i64 %shr.3, %13, !dbg !1664
  %and.3 = and i64 %xor.3, 1085102592571150095, !dbg !1665
    #dbg_value(i64 %and.3, !1666, !DIExpression(), !1667)
  %shl.3 = shl nuw i64 %and.3, 4, !dbg !1668
  %arrayidx2.3 = getelementptr inbounds nuw i8, ptr %M, i32 48, !dbg !1672
  %14 = load i64, ptr %arrayidx2.3, align 8, !dbg !1669
  %xor3.3 = xor i64 %14, %shl.3, !dbg !1669
  store i64 %xor3.3, ptr %arrayidx2.3, align 8, !dbg !1669
  %arrayidx5.3 = getelementptr inbounds nuw i8, ptr %M, i32 56, !dbg !1670
  %15 = load i64, ptr %arrayidx5.3, align 8, !dbg !1671
  %xor6.3 = xor i64 %15, %and.3, !dbg !1671
  store i64 %xor6.3, ptr %arrayidx5.3, align 8, !dbg !1671
    #dbg_value(i32 8, !1656, !DIExpression(), !1658)
  %arrayidx.4 = getelementptr inbounds nuw i8, ptr %M, i32 64, !dbg !1659
  %16 = load i64, ptr %arrayidx.4, align 8, !dbg !1659
  %shr.4 = lshr i64 %16, 4, !dbg !1662
  %arrayidx1.4 = getelementptr inbounds nuw i8, ptr %M, i32 72, !dbg !1663
  %17 = load i64, ptr %arrayidx1.4, align 8, !dbg !1663
  %xor.4 = xor i64 %shr.4, %17, !dbg !1664
  %and.4 = and i64 %xor.4, 1085102592571150095, !dbg !1665
    #dbg_value(i64 %and.4, !1666, !DIExpression(), !1667)
  %shl.4 = shl nuw i64 %and.4, 4, !dbg !1668
  %arrayidx2.4 = getelementptr inbounds nuw i8, ptr %M, i32 64, !dbg !1672
  %18 = load i64, ptr %arrayidx2.4, align 8, !dbg !1669
  %xor3.4 = xor i64 %18, %shl.4, !dbg !1669
  store i64 %xor3.4, ptr %arrayidx2.4, align 8, !dbg !1669
  %arrayidx5.4 = getelementptr inbounds nuw i8, ptr %M, i32 72, !dbg !1670
  %19 = load i64, ptr %arrayidx5.4, align 8, !dbg !1671
  %xor6.4 = xor i64 %19, %and.4, !dbg !1671
  store i64 %xor6.4, ptr %arrayidx5.4, align 8, !dbg !1671
    #dbg_value(i32 10, !1656, !DIExpression(), !1658)
  %arrayidx.5 = getelementptr inbounds nuw i8, ptr %M, i32 80, !dbg !1659
  %20 = load i64, ptr %arrayidx.5, align 8, !dbg !1659
  %shr.5 = lshr i64 %20, 4, !dbg !1662
  %arrayidx1.5 = getelementptr inbounds nuw i8, ptr %M, i32 88, !dbg !1663
  %21 = load i64, ptr %arrayidx1.5, align 8, !dbg !1663
  %xor.5 = xor i64 %shr.5, %21, !dbg !1664
  %and.5 = and i64 %xor.5, 1085102592571150095, !dbg !1665
    #dbg_value(i64 %and.5, !1666, !DIExpression(), !1667)
  %shl.5 = shl nuw i64 %and.5, 4, !dbg !1668
  %arrayidx2.5 = getelementptr inbounds nuw i8, ptr %M, i32 80, !dbg !1672
  %22 = load i64, ptr %arrayidx2.5, align 8, !dbg !1669
  %xor3.5 = xor i64 %22, %shl.5, !dbg !1669
  store i64 %xor3.5, ptr %arrayidx2.5, align 8, !dbg !1669
  %arrayidx5.5 = getelementptr inbounds nuw i8, ptr %M, i32 88, !dbg !1670
  %23 = load i64, ptr %arrayidx5.5, align 8, !dbg !1671
  %xor6.5 = xor i64 %23, %and.5, !dbg !1671
  store i64 %xor6.5, ptr %arrayidx5.5, align 8, !dbg !1671
    #dbg_value(i32 12, !1656, !DIExpression(), !1658)
  %arrayidx.6 = getelementptr inbounds nuw i8, ptr %M, i32 96, !dbg !1659
  %24 = load i64, ptr %arrayidx.6, align 8, !dbg !1659
  %shr.6 = lshr i64 %24, 4, !dbg !1662
  %arrayidx1.6 = getelementptr inbounds nuw i8, ptr %M, i32 104, !dbg !1663
  %25 = load i64, ptr %arrayidx1.6, align 8, !dbg !1663
  %xor.6 = xor i64 %shr.6, %25, !dbg !1664
  %and.6 = and i64 %xor.6, 1085102592571150095, !dbg !1665
    #dbg_value(i64 %and.6, !1666, !DIExpression(), !1667)
  %shl.6 = shl nuw i64 %and.6, 4, !dbg !1668
  %arrayidx2.6 = getelementptr inbounds nuw i8, ptr %M, i32 96, !dbg !1672
  %26 = load i64, ptr %arrayidx2.6, align 8, !dbg !1669
  %xor3.6 = xor i64 %26, %shl.6, !dbg !1669
  store i64 %xor3.6, ptr %arrayidx2.6, align 8, !dbg !1669
  %arrayidx5.6 = getelementptr inbounds nuw i8, ptr %M, i32 104, !dbg !1670
  %27 = load i64, ptr %arrayidx5.6, align 8, !dbg !1671
  %xor6.6 = xor i64 %27, %and.6, !dbg !1671
  store i64 %xor6.6, ptr %arrayidx5.6, align 8, !dbg !1671
    #dbg_value(i32 14, !1656, !DIExpression(), !1658)
  %arrayidx.7 = getelementptr inbounds nuw i8, ptr %M, i32 112, !dbg !1659
  %28 = load i64, ptr %arrayidx.7, align 8, !dbg !1659
  %shr.7 = lshr i64 %28, 4, !dbg !1662
  %arrayidx1.7 = getelementptr inbounds nuw i8, ptr %M, i32 120, !dbg !1663
  %29 = load i64, ptr %arrayidx1.7, align 8, !dbg !1663
  %xor.7 = xor i64 %shr.7, %29, !dbg !1664
  %and.7 = and i64 %xor.7, 1085102592571150095, !dbg !1665
    #dbg_value(i64 %and.7, !1666, !DIExpression(), !1667)
  %shl.7 = shl nuw i64 %and.7, 4, !dbg !1668
  %arrayidx2.7 = getelementptr inbounds nuw i8, ptr %M, i32 112, !dbg !1672
  %30 = load i64, ptr %arrayidx2.7, align 8, !dbg !1669
  %xor3.7 = xor i64 %30, %shl.7, !dbg !1669
  store i64 %xor3.7, ptr %arrayidx2.7, align 8, !dbg !1669
  %arrayidx5.7 = getelementptr inbounds nuw i8, ptr %M, i32 120, !dbg !1670
  %31 = load i64, ptr %arrayidx5.7, align 8, !dbg !1671
  %xor6.7 = xor i64 %31, %and.7, !dbg !1671
  store i64 %xor6.7, ptr %arrayidx5.7, align 8, !dbg !1671
    #dbg_value(i32 16, !1656, !DIExpression(), !1658)
    #dbg_value(i32 0, !1673, !DIExpression(), !1675)
  %32 = load i64, ptr %M, align 8, !dbg !1676
  %shr13 = lshr i64 %32, 8, !dbg !1679
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %M, i32 16, !dbg !1680
  %33 = load i64, ptr %arrayidx15, align 8, !dbg !1680
  %xor16 = xor i64 %shr13, %33, !dbg !1681
  %and17 = and i64 %xor16, 71777214294589695, !dbg !1682
    #dbg_value(i64 %and17, !1683, !DIExpression(), !1684)
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %M, i32 8, !dbg !1685
  %34 = load i64, ptr %arrayidx19, align 8, !dbg !1685
  %shr20 = lshr i64 %34, 8, !dbg !1686
  %arrayidx22 = getelementptr inbounds nuw i8, ptr %M, i32 24, !dbg !1687
  %35 = load i64, ptr %arrayidx22, align 8, !dbg !1687
  %xor23 = xor i64 %shr20, %35, !dbg !1688
  %and24 = and i64 %xor23, 71777214294589695, !dbg !1689
    #dbg_value(i64 %and24, !1690, !DIExpression(), !1684)
  %shl25 = shl nuw i64 %and17, 8, !dbg !1691
  %36 = load i64, ptr %M, align 8, !dbg !1692
  %xor27 = xor i64 %36, %shl25, !dbg !1692
  store i64 %xor27, ptr %M, align 8, !dbg !1692
  %shl28 = shl nuw i64 %and24, 8, !dbg !1693
  %arrayidx30 = getelementptr inbounds nuw i8, ptr %M, i32 8, !dbg !1694
  %37 = load i64, ptr %arrayidx30, align 8, !dbg !1695
  %xor31 = xor i64 %37, %shl28, !dbg !1695
  store i64 %xor31, ptr %arrayidx30, align 8, !dbg !1695
  %arrayidx33 = getelementptr inbounds nuw i8, ptr %M, i32 16, !dbg !1696
  %38 = load i64, ptr %arrayidx33, align 8, !dbg !1697
  %xor34 = xor i64 %38, %and17, !dbg !1697
  store i64 %xor34, ptr %arrayidx33, align 8, !dbg !1697
  %arrayidx36 = getelementptr inbounds nuw i8, ptr %M, i32 24, !dbg !1698
  %39 = load i64, ptr %arrayidx36, align 8, !dbg !1699
  %xor37 = xor i64 %39, %and24, !dbg !1699
  store i64 %xor37, ptr %arrayidx36, align 8, !dbg !1699
    #dbg_value(i32 4, !1673, !DIExpression(), !1675)
  %arrayidx12.1 = getelementptr inbounds nuw i8, ptr %M, i32 32, !dbg !1676
  %40 = load i64, ptr %arrayidx12.1, align 8, !dbg !1676
  %shr13.1 = lshr i64 %40, 8, !dbg !1679
  %arrayidx15.1 = getelementptr inbounds nuw i8, ptr %M, i32 48, !dbg !1680
  %41 = load i64, ptr %arrayidx15.1, align 8, !dbg !1680
  %xor16.1 = xor i64 %shr13.1, %41, !dbg !1681
  %and17.1 = and i64 %xor16.1, 71777214294589695, !dbg !1682
    #dbg_value(i64 %and17.1, !1683, !DIExpression(), !1684)
  %arrayidx19.1 = getelementptr inbounds nuw i8, ptr %M, i32 40, !dbg !1685
  %42 = load i64, ptr %arrayidx19.1, align 8, !dbg !1685
  %shr20.1 = lshr i64 %42, 8, !dbg !1686
  %arrayidx22.1 = getelementptr inbounds nuw i8, ptr %M, i32 56, !dbg !1687
  %43 = load i64, ptr %arrayidx22.1, align 8, !dbg !1687
  %xor23.1 = xor i64 %shr20.1, %43, !dbg !1688
  %and24.1 = and i64 %xor23.1, 71777214294589695, !dbg !1689
    #dbg_value(i64 %and24.1, !1690, !DIExpression(), !1684)
  %shl25.1 = shl nuw i64 %and17.1, 8, !dbg !1691
  %arrayidx26.1 = getelementptr inbounds nuw i8, ptr %M, i32 32, !dbg !1700
  %44 = load i64, ptr %arrayidx26.1, align 8, !dbg !1692
  %xor27.1 = xor i64 %44, %shl25.1, !dbg !1692
  store i64 %xor27.1, ptr %arrayidx26.1, align 8, !dbg !1692
  %shl28.1 = shl nuw i64 %and24.1, 8, !dbg !1693
  %arrayidx30.1 = getelementptr inbounds nuw i8, ptr %M, i32 40, !dbg !1694
  %45 = load i64, ptr %arrayidx30.1, align 8, !dbg !1695
  %xor31.1 = xor i64 %45, %shl28.1, !dbg !1695
  store i64 %xor31.1, ptr %arrayidx30.1, align 8, !dbg !1695
  %arrayidx33.1 = getelementptr inbounds nuw i8, ptr %M, i32 48, !dbg !1696
  %46 = load i64, ptr %arrayidx33.1, align 8, !dbg !1697
  %xor34.1 = xor i64 %46, %and17.1, !dbg !1697
  store i64 %xor34.1, ptr %arrayidx33.1, align 8, !dbg !1697
  %arrayidx36.1 = getelementptr inbounds nuw i8, ptr %M, i32 56, !dbg !1698
  %47 = load i64, ptr %arrayidx36.1, align 8, !dbg !1699
  %xor37.1 = xor i64 %47, %and24.1, !dbg !1699
  store i64 %xor37.1, ptr %arrayidx36.1, align 8, !dbg !1699
    #dbg_value(i32 8, !1673, !DIExpression(), !1675)
  %arrayidx12.2 = getelementptr inbounds nuw i8, ptr %M, i32 64, !dbg !1676
  %48 = load i64, ptr %arrayidx12.2, align 8, !dbg !1676
  %shr13.2 = lshr i64 %48, 8, !dbg !1679
  %arrayidx15.2 = getelementptr inbounds nuw i8, ptr %M, i32 80, !dbg !1680
  %49 = load i64, ptr %arrayidx15.2, align 8, !dbg !1680
  %xor16.2 = xor i64 %shr13.2, %49, !dbg !1681
  %and17.2 = and i64 %xor16.2, 71777214294589695, !dbg !1682
    #dbg_value(i64 %and17.2, !1683, !DIExpression(), !1684)
  %arrayidx19.2 = getelementptr inbounds nuw i8, ptr %M, i32 72, !dbg !1685
  %50 = load i64, ptr %arrayidx19.2, align 8, !dbg !1685
  %shr20.2 = lshr i64 %50, 8, !dbg !1686
  %arrayidx22.2 = getelementptr inbounds nuw i8, ptr %M, i32 88, !dbg !1687
  %51 = load i64, ptr %arrayidx22.2, align 8, !dbg !1687
  %xor23.2 = xor i64 %shr20.2, %51, !dbg !1688
  %and24.2 = and i64 %xor23.2, 71777214294589695, !dbg !1689
    #dbg_value(i64 %and24.2, !1690, !DIExpression(), !1684)
  %shl25.2 = shl nuw i64 %and17.2, 8, !dbg !1691
  %arrayidx26.2 = getelementptr inbounds nuw i8, ptr %M, i32 64, !dbg !1700
  %52 = load i64, ptr %arrayidx26.2, align 8, !dbg !1692
  %xor27.2 = xor i64 %52, %shl25.2, !dbg !1692
  store i64 %xor27.2, ptr %arrayidx26.2, align 8, !dbg !1692
  %shl28.2 = shl nuw i64 %and24.2, 8, !dbg !1693
  %arrayidx30.2 = getelementptr inbounds nuw i8, ptr %M, i32 72, !dbg !1694
  %53 = load i64, ptr %arrayidx30.2, align 8, !dbg !1695
  %xor31.2 = xor i64 %53, %shl28.2, !dbg !1695
  store i64 %xor31.2, ptr %arrayidx30.2, align 8, !dbg !1695
  %arrayidx33.2 = getelementptr inbounds nuw i8, ptr %M, i32 80, !dbg !1696
  %54 = load i64, ptr %arrayidx33.2, align 8, !dbg !1697
  %xor34.2 = xor i64 %54, %and17.2, !dbg !1697
  store i64 %xor34.2, ptr %arrayidx33.2, align 8, !dbg !1697
  %arrayidx36.2 = getelementptr inbounds nuw i8, ptr %M, i32 88, !dbg !1698
  %55 = load i64, ptr %arrayidx36.2, align 8, !dbg !1699
  %xor37.2 = xor i64 %55, %and24.2, !dbg !1699
  store i64 %xor37.2, ptr %arrayidx36.2, align 8, !dbg !1699
    #dbg_value(i32 12, !1673, !DIExpression(), !1675)
  %arrayidx12.3 = getelementptr inbounds nuw i8, ptr %M, i32 96, !dbg !1676
  %56 = load i64, ptr %arrayidx12.3, align 8, !dbg !1676
  %shr13.3 = lshr i64 %56, 8, !dbg !1679
  %arrayidx15.3 = getelementptr inbounds nuw i8, ptr %M, i32 112, !dbg !1680
  %57 = load i64, ptr %arrayidx15.3, align 8, !dbg !1680
  %xor16.3 = xor i64 %shr13.3, %57, !dbg !1681
  %and17.3 = and i64 %xor16.3, 71777214294589695, !dbg !1682
    #dbg_value(i64 %and17.3, !1683, !DIExpression(), !1684)
  %arrayidx19.3 = getelementptr inbounds nuw i8, ptr %M, i32 104, !dbg !1685
  %58 = load i64, ptr %arrayidx19.3, align 8, !dbg !1685
  %shr20.3 = lshr i64 %58, 8, !dbg !1686
  %arrayidx22.3 = getelementptr inbounds nuw i8, ptr %M, i32 120, !dbg !1687
  %59 = load i64, ptr %arrayidx22.3, align 8, !dbg !1687
  %xor23.3 = xor i64 %shr20.3, %59, !dbg !1688
  %and24.3 = and i64 %xor23.3, 71777214294589695, !dbg !1689
    #dbg_value(i64 %and24.3, !1690, !DIExpression(), !1684)
  %shl25.3 = shl nuw i64 %and17.3, 8, !dbg !1691
  %arrayidx26.3 = getelementptr inbounds nuw i8, ptr %M, i32 96, !dbg !1700
  %60 = load i64, ptr %arrayidx26.3, align 8, !dbg !1692
  %xor27.3 = xor i64 %60, %shl25.3, !dbg !1692
  store i64 %xor27.3, ptr %arrayidx26.3, align 8, !dbg !1692
  %shl28.3 = shl nuw i64 %and24.3, 8, !dbg !1693
  %arrayidx30.3 = getelementptr inbounds nuw i8, ptr %M, i32 104, !dbg !1694
  %61 = load i64, ptr %arrayidx30.3, align 8, !dbg !1695
  %xor31.3 = xor i64 %61, %shl28.3, !dbg !1695
  store i64 %xor31.3, ptr %arrayidx30.3, align 8, !dbg !1695
  %arrayidx33.3 = getelementptr inbounds nuw i8, ptr %M, i32 112, !dbg !1696
  %62 = load i64, ptr %arrayidx33.3, align 8, !dbg !1697
  %xor34.3 = xor i64 %62, %and17.3, !dbg !1697
  store i64 %xor34.3, ptr %arrayidx33.3, align 8, !dbg !1697
  %arrayidx36.3 = getelementptr inbounds nuw i8, ptr %M, i32 120, !dbg !1698
  %63 = load i64, ptr %arrayidx36.3, align 8, !dbg !1699
  %xor37.3 = xor i64 %63, %and24.3, !dbg !1699
  store i64 %xor37.3, ptr %arrayidx36.3, align 8, !dbg !1699
    #dbg_value(i32 16, !1673, !DIExpression(), !1675)
    #dbg_value(i32 0, !1701, !DIExpression(), !1703)
  %64 = load i64, ptr %M, align 8, !dbg !1704
  %shr47 = lshr i64 %64, 16, !dbg !1707
  %arrayidx49 = getelementptr inbounds nuw i8, ptr %M, i32 32, !dbg !1708
  %65 = load i64, ptr %arrayidx49, align 8, !dbg !1708
  %xor50 = xor i64 %shr47, %65, !dbg !1709
  %and51 = and i64 %xor50, 281470681808895, !dbg !1710
    #dbg_value(i64 %and51, !1711, !DIExpression(), !1712)
  %arrayidx54 = getelementptr inbounds nuw i8, ptr %M, i32 64, !dbg !1713
  %66 = load i64, ptr %arrayidx54, align 8, !dbg !1713
  %shr55 = lshr i64 %66, 16, !dbg !1714
  %arrayidx57 = getelementptr inbounds nuw i8, ptr %M, i32 96, !dbg !1715
  %67 = load i64, ptr %arrayidx57, align 8, !dbg !1715
  %xor58 = xor i64 %shr55, %67, !dbg !1716
  %and59 = and i64 %xor58, 281470681808895, !dbg !1717
    #dbg_value(i64 %and59, !1718, !DIExpression(), !1712)
  %shl60 = shl nuw i64 %and51, 16, !dbg !1719
  %68 = load i64, ptr %M, align 8, !dbg !1720
  %xor62 = xor i64 %68, %shl60, !dbg !1720
  store i64 %xor62, ptr %M, align 8, !dbg !1720
  %shl63 = shl nuw i64 %and59, 16, !dbg !1721
  %arrayidx65 = getelementptr inbounds nuw i8, ptr %M, i32 64, !dbg !1722
  %69 = load i64, ptr %arrayidx65, align 8, !dbg !1723
  %xor66 = xor i64 %69, %shl63, !dbg !1723
  store i64 %xor66, ptr %arrayidx65, align 8, !dbg !1723
  %arrayidx68 = getelementptr inbounds nuw i8, ptr %M, i32 32, !dbg !1724
  %70 = load i64, ptr %arrayidx68, align 8, !dbg !1725
  %xor69 = xor i64 %70, %and51, !dbg !1725
  store i64 %xor69, ptr %arrayidx68, align 8, !dbg !1725
  %arrayidx71 = getelementptr inbounds nuw i8, ptr %M, i32 96, !dbg !1726
  %71 = load i64, ptr %arrayidx71, align 8, !dbg !1727
  %xor72 = xor i64 %71, %and59, !dbg !1727
  store i64 %xor72, ptr %arrayidx71, align 8, !dbg !1727
    #dbg_value(i32 1, !1701, !DIExpression(), !1703)
  %arrayidx46.1 = getelementptr inbounds nuw i8, ptr %M, i32 8, !dbg !1704
  %72 = load i64, ptr %arrayidx46.1, align 8, !dbg !1704
  %shr47.1 = lshr i64 %72, 16, !dbg !1707
  %arrayidx49.1 = getelementptr inbounds nuw i8, ptr %M, i32 40, !dbg !1708
  %73 = load i64, ptr %arrayidx49.1, align 8, !dbg !1708
  %xor50.1 = xor i64 %shr47.1, %73, !dbg !1709
  %and51.1 = and i64 %xor50.1, 281470681808895, !dbg !1710
    #dbg_value(i64 %and51.1, !1711, !DIExpression(), !1712)
  %arrayidx54.1 = getelementptr inbounds nuw i8, ptr %M, i32 72, !dbg !1713
  %74 = load i64, ptr %arrayidx54.1, align 8, !dbg !1713
  %shr55.1 = lshr i64 %74, 16, !dbg !1714
  %arrayidx57.1 = getelementptr inbounds nuw i8, ptr %M, i32 104, !dbg !1715
  %75 = load i64, ptr %arrayidx57.1, align 8, !dbg !1715
  %xor58.1 = xor i64 %shr55.1, %75, !dbg !1716
  %and59.1 = and i64 %xor58.1, 281470681808895, !dbg !1717
    #dbg_value(i64 %and59.1, !1718, !DIExpression(), !1712)
  %shl60.1 = shl nuw i64 %and51.1, 16, !dbg !1719
  %arrayidx61.1 = getelementptr inbounds nuw i8, ptr %M, i32 8, !dbg !1728
  %76 = load i64, ptr %arrayidx61.1, align 8, !dbg !1720
  %xor62.1 = xor i64 %76, %shl60.1, !dbg !1720
  store i64 %xor62.1, ptr %arrayidx61.1, align 8, !dbg !1720
  %shl63.1 = shl nuw i64 %and59.1, 16, !dbg !1721
  %arrayidx65.1 = getelementptr inbounds nuw i8, ptr %M, i32 72, !dbg !1722
  %77 = load i64, ptr %arrayidx65.1, align 8, !dbg !1723
  %xor66.1 = xor i64 %77, %shl63.1, !dbg !1723
  store i64 %xor66.1, ptr %arrayidx65.1, align 8, !dbg !1723
  %arrayidx68.1 = getelementptr inbounds nuw i8, ptr %M, i32 40, !dbg !1724
  %78 = load i64, ptr %arrayidx68.1, align 8, !dbg !1725
  %xor69.1 = xor i64 %78, %and51.1, !dbg !1725
  store i64 %xor69.1, ptr %arrayidx68.1, align 8, !dbg !1725
  %arrayidx71.1 = getelementptr inbounds nuw i8, ptr %M, i32 104, !dbg !1726
  %79 = load i64, ptr %arrayidx71.1, align 8, !dbg !1727
  %xor72.1 = xor i64 %79, %and59.1, !dbg !1727
  store i64 %xor72.1, ptr %arrayidx71.1, align 8, !dbg !1727
    #dbg_value(i32 2, !1701, !DIExpression(), !1703)
  %arrayidx46.2 = getelementptr inbounds nuw i8, ptr %M, i32 16, !dbg !1704
  %80 = load i64, ptr %arrayidx46.2, align 8, !dbg !1704
  %shr47.2 = lshr i64 %80, 16, !dbg !1707
  %arrayidx49.2 = getelementptr inbounds nuw i8, ptr %M, i32 48, !dbg !1708
  %81 = load i64, ptr %arrayidx49.2, align 8, !dbg !1708
  %xor50.2 = xor i64 %shr47.2, %81, !dbg !1709
  %and51.2 = and i64 %xor50.2, 281470681808895, !dbg !1710
    #dbg_value(i64 %and51.2, !1711, !DIExpression(), !1712)
  %arrayidx54.2 = getelementptr inbounds nuw i8, ptr %M, i32 80, !dbg !1713
  %82 = load i64, ptr %arrayidx54.2, align 8, !dbg !1713
  %shr55.2 = lshr i64 %82, 16, !dbg !1714
  %arrayidx57.2 = getelementptr inbounds nuw i8, ptr %M, i32 112, !dbg !1715
  %83 = load i64, ptr %arrayidx57.2, align 8, !dbg !1715
  %xor58.2 = xor i64 %shr55.2, %83, !dbg !1716
  %and59.2 = and i64 %xor58.2, 281470681808895, !dbg !1717
    #dbg_value(i64 %and59.2, !1718, !DIExpression(), !1712)
  %shl60.2 = shl nuw i64 %and51.2, 16, !dbg !1719
  %arrayidx61.2 = getelementptr inbounds nuw i8, ptr %M, i32 16, !dbg !1728
  %84 = load i64, ptr %arrayidx61.2, align 8, !dbg !1720
  %xor62.2 = xor i64 %84, %shl60.2, !dbg !1720
  store i64 %xor62.2, ptr %arrayidx61.2, align 8, !dbg !1720
  %shl63.2 = shl nuw i64 %and59.2, 16, !dbg !1721
  %arrayidx65.2 = getelementptr inbounds nuw i8, ptr %M, i32 80, !dbg !1722
  %85 = load i64, ptr %arrayidx65.2, align 8, !dbg !1723
  %xor66.2 = xor i64 %85, %shl63.2, !dbg !1723
  store i64 %xor66.2, ptr %arrayidx65.2, align 8, !dbg !1723
  %arrayidx68.2 = getelementptr inbounds nuw i8, ptr %M, i32 48, !dbg !1724
  %86 = load i64, ptr %arrayidx68.2, align 8, !dbg !1725
  %xor69.2 = xor i64 %86, %and51.2, !dbg !1725
  store i64 %xor69.2, ptr %arrayidx68.2, align 8, !dbg !1725
  %arrayidx71.2 = getelementptr inbounds nuw i8, ptr %M, i32 112, !dbg !1726
  %87 = load i64, ptr %arrayidx71.2, align 8, !dbg !1727
  %xor72.2 = xor i64 %87, %and59.2, !dbg !1727
  store i64 %xor72.2, ptr %arrayidx71.2, align 8, !dbg !1727
    #dbg_value(i32 3, !1701, !DIExpression(), !1703)
  %arrayidx46.3 = getelementptr inbounds nuw i8, ptr %M, i32 24, !dbg !1704
  %88 = load i64, ptr %arrayidx46.3, align 8, !dbg !1704
  %shr47.3 = lshr i64 %88, 16, !dbg !1707
  %arrayidx49.3 = getelementptr inbounds nuw i8, ptr %M, i32 56, !dbg !1708
  %89 = load i64, ptr %arrayidx49.3, align 8, !dbg !1708
  %xor50.3 = xor i64 %shr47.3, %89, !dbg !1709
  %and51.3 = and i64 %xor50.3, 281470681808895, !dbg !1710
    #dbg_value(i64 %and51.3, !1711, !DIExpression(), !1712)
  %arrayidx54.3 = getelementptr inbounds nuw i8, ptr %M, i32 88, !dbg !1713
  %90 = load i64, ptr %arrayidx54.3, align 8, !dbg !1713
  %shr55.3 = lshr i64 %90, 16, !dbg !1714
  %arrayidx57.3 = getelementptr inbounds nuw i8, ptr %M, i32 120, !dbg !1715
  %91 = load i64, ptr %arrayidx57.3, align 8, !dbg !1715
  %xor58.3 = xor i64 %shr55.3, %91, !dbg !1716
  %and59.3 = and i64 %xor58.3, 281470681808895, !dbg !1717
    #dbg_value(i64 %and59.3, !1718, !DIExpression(), !1712)
  %shl60.3 = shl nuw i64 %and51.3, 16, !dbg !1719
  %arrayidx61.3 = getelementptr inbounds nuw i8, ptr %M, i32 24, !dbg !1728
  %92 = load i64, ptr %arrayidx61.3, align 8, !dbg !1720
  %xor62.3 = xor i64 %92, %shl60.3, !dbg !1720
  store i64 %xor62.3, ptr %arrayidx61.3, align 8, !dbg !1720
  %shl63.3 = shl nuw i64 %and59.3, 16, !dbg !1721
  %arrayidx65.3 = getelementptr inbounds nuw i8, ptr %M, i32 88, !dbg !1722
  %93 = load i64, ptr %arrayidx65.3, align 8, !dbg !1723
  %xor66.3 = xor i64 %93, %shl63.3, !dbg !1723
  store i64 %xor66.3, ptr %arrayidx65.3, align 8, !dbg !1723
  %arrayidx68.3 = getelementptr inbounds nuw i8, ptr %M, i32 56, !dbg !1724
  %94 = load i64, ptr %arrayidx68.3, align 8, !dbg !1725
  %xor69.3 = xor i64 %94, %and51.3, !dbg !1725
  store i64 %xor69.3, ptr %arrayidx68.3, align 8, !dbg !1725
  %arrayidx71.3 = getelementptr inbounds nuw i8, ptr %M, i32 120, !dbg !1726
  %95 = load i64, ptr %arrayidx71.3, align 8, !dbg !1727
  %xor72.3 = xor i64 %95, %and59.3, !dbg !1727
  store i64 %xor72.3, ptr %arrayidx71.3, align 8, !dbg !1727
    #dbg_value(i32 4, !1701, !DIExpression(), !1703)
    #dbg_value(i32 0, !1729, !DIExpression(), !1731)
  %96 = load i64, ptr %M, align 8, !dbg !1732
  %shr81 = lshr i64 %96, 32, !dbg !1735
  %arrayidx83 = getelementptr inbounds nuw i8, ptr %M, i32 64, !dbg !1736
  %97 = load i64, ptr %arrayidx83, align 8, !dbg !1736
  %.masked = and i64 %97, 4294967295, !dbg !1737
  %and85 = xor i64 %shr81, %.masked, !dbg !1737
    #dbg_value(i64 %and85, !1738, !DIExpression(), !1739)
  %shl86 = shl nuw i64 %and85, 32, !dbg !1740
  %98 = load i64, ptr %M, align 8, !dbg !1741
  %xor88 = xor i64 %98, %shl86, !dbg !1741
  store i64 %xor88, ptr %M, align 8, !dbg !1741
  %arrayidx90 = getelementptr inbounds nuw i8, ptr %M, i32 64, !dbg !1742
  %99 = load i64, ptr %arrayidx90, align 8, !dbg !1743
  %xor91 = xor i64 %99, %and85, !dbg !1743
  store i64 %xor91, ptr %arrayidx90, align 8, !dbg !1743
    #dbg_value(i32 1, !1729, !DIExpression(), !1731)
  %arrayidx80.1 = getelementptr inbounds nuw i8, ptr %M, i32 8, !dbg !1732
  %100 = load i64, ptr %arrayidx80.1, align 8, !dbg !1732
  %shr81.1 = lshr i64 %100, 32, !dbg !1735
  %arrayidx83.1 = getelementptr inbounds nuw i8, ptr %M, i32 72, !dbg !1736
  %101 = load i64, ptr %arrayidx83.1, align 8, !dbg !1736
  %.masked.1 = and i64 %101, 4294967295, !dbg !1737
  %and85.1 = xor i64 %shr81.1, %.masked.1, !dbg !1737
    #dbg_value(i64 %and85.1, !1738, !DIExpression(), !1739)
  %shl86.1 = shl nuw i64 %and85.1, 32, !dbg !1740
  %arrayidx87.1 = getelementptr inbounds nuw i8, ptr %M, i32 8, !dbg !1744
  %102 = load i64, ptr %arrayidx87.1, align 8, !dbg !1741
  %xor88.1 = xor i64 %102, %shl86.1, !dbg !1741
  store i64 %xor88.1, ptr %arrayidx87.1, align 8, !dbg !1741
  %arrayidx90.1 = getelementptr inbounds nuw i8, ptr %M, i32 72, !dbg !1742
  %103 = load i64, ptr %arrayidx90.1, align 8, !dbg !1743
  %xor91.1 = xor i64 %103, %and85.1, !dbg !1743
  store i64 %xor91.1, ptr %arrayidx90.1, align 8, !dbg !1743
    #dbg_value(i32 2, !1729, !DIExpression(), !1731)
  %arrayidx80.2 = getelementptr inbounds nuw i8, ptr %M, i32 16, !dbg !1732
  %104 = load i64, ptr %arrayidx80.2, align 8, !dbg !1732
  %shr81.2 = lshr i64 %104, 32, !dbg !1735
  %arrayidx83.2 = getelementptr inbounds nuw i8, ptr %M, i32 80, !dbg !1736
  %105 = load i64, ptr %arrayidx83.2, align 8, !dbg !1736
  %.masked.2 = and i64 %105, 4294967295, !dbg !1737
  %and85.2 = xor i64 %shr81.2, %.masked.2, !dbg !1737
    #dbg_value(i64 %and85.2, !1738, !DIExpression(), !1739)
  %shl86.2 = shl nuw i64 %and85.2, 32, !dbg !1740
  %arrayidx87.2 = getelementptr inbounds nuw i8, ptr %M, i32 16, !dbg !1744
  %106 = load i64, ptr %arrayidx87.2, align 8, !dbg !1741
  %xor88.2 = xor i64 %106, %shl86.2, !dbg !1741
  store i64 %xor88.2, ptr %arrayidx87.2, align 8, !dbg !1741
  %arrayidx90.2 = getelementptr inbounds nuw i8, ptr %M, i32 80, !dbg !1742
  %107 = load i64, ptr %arrayidx90.2, align 8, !dbg !1743
  %xor91.2 = xor i64 %107, %and85.2, !dbg !1743
  store i64 %xor91.2, ptr %arrayidx90.2, align 8, !dbg !1743
    #dbg_value(i32 3, !1729, !DIExpression(), !1731)
  %arrayidx80.3 = getelementptr inbounds nuw i8, ptr %M, i32 24, !dbg !1732
  %108 = load i64, ptr %arrayidx80.3, align 8, !dbg !1732
  %shr81.3 = lshr i64 %108, 32, !dbg !1735
  %arrayidx83.3 = getelementptr inbounds nuw i8, ptr %M, i32 88, !dbg !1736
  %109 = load i64, ptr %arrayidx83.3, align 8, !dbg !1736
  %.masked.3 = and i64 %109, 4294967295, !dbg !1737
  %and85.3 = xor i64 %shr81.3, %.masked.3, !dbg !1737
    #dbg_value(i64 %and85.3, !1738, !DIExpression(), !1739)
  %shl86.3 = shl nuw i64 %and85.3, 32, !dbg !1740
  %arrayidx87.3 = getelementptr inbounds nuw i8, ptr %M, i32 24, !dbg !1744
  %110 = load i64, ptr %arrayidx87.3, align 8, !dbg !1741
  %xor88.3 = xor i64 %110, %shl86.3, !dbg !1741
  store i64 %xor88.3, ptr %arrayidx87.3, align 8, !dbg !1741
  %arrayidx90.3 = getelementptr inbounds nuw i8, ptr %M, i32 88, !dbg !1742
  %111 = load i64, ptr %arrayidx90.3, align 8, !dbg !1743
  %xor91.3 = xor i64 %111, %and85.3, !dbg !1743
  store i64 %xor91.3, ptr %arrayidx90.3, align 8, !dbg !1743
    #dbg_value(i32 4, !1729, !DIExpression(), !1731)
  %arrayidx80.4 = getelementptr inbounds nuw i8, ptr %M, i32 32, !dbg !1732
  %112 = load i64, ptr %arrayidx80.4, align 8, !dbg !1732
  %shr81.4 = lshr i64 %112, 32, !dbg !1735
  %arrayidx83.4 = getelementptr inbounds nuw i8, ptr %M, i32 96, !dbg !1736
  %113 = load i64, ptr %arrayidx83.4, align 8, !dbg !1736
  %.masked.4 = and i64 %113, 4294967295, !dbg !1737
  %and85.4 = xor i64 %shr81.4, %.masked.4, !dbg !1737
    #dbg_value(i64 %and85.4, !1738, !DIExpression(), !1739)
  %shl86.4 = shl nuw i64 %and85.4, 32, !dbg !1740
  %arrayidx87.4 = getelementptr inbounds nuw i8, ptr %M, i32 32, !dbg !1744
  %114 = load i64, ptr %arrayidx87.4, align 8, !dbg !1741
  %xor88.4 = xor i64 %114, %shl86.4, !dbg !1741
  store i64 %xor88.4, ptr %arrayidx87.4, align 8, !dbg !1741
  %arrayidx90.4 = getelementptr inbounds nuw i8, ptr %M, i32 96, !dbg !1742
  %115 = load i64, ptr %arrayidx90.4, align 8, !dbg !1743
  %xor91.4 = xor i64 %115, %and85.4, !dbg !1743
  store i64 %xor91.4, ptr %arrayidx90.4, align 8, !dbg !1743
    #dbg_value(i32 5, !1729, !DIExpression(), !1731)
  %arrayidx80.5 = getelementptr inbounds nuw i8, ptr %M, i32 40, !dbg !1732
  %116 = load i64, ptr %arrayidx80.5, align 8, !dbg !1732
  %shr81.5 = lshr i64 %116, 32, !dbg !1735
  %arrayidx83.5 = getelementptr inbounds nuw i8, ptr %M, i32 104, !dbg !1736
  %117 = load i64, ptr %arrayidx83.5, align 8, !dbg !1736
  %.masked.5 = and i64 %117, 4294967295, !dbg !1737
  %and85.5 = xor i64 %shr81.5, %.masked.5, !dbg !1737
    #dbg_value(i64 %and85.5, !1738, !DIExpression(), !1739)
  %shl86.5 = shl nuw i64 %and85.5, 32, !dbg !1740
  %arrayidx87.5 = getelementptr inbounds nuw i8, ptr %M, i32 40, !dbg !1744
  %118 = load i64, ptr %arrayidx87.5, align 8, !dbg !1741
  %xor88.5 = xor i64 %118, %shl86.5, !dbg !1741
  store i64 %xor88.5, ptr %arrayidx87.5, align 8, !dbg !1741
  %arrayidx90.5 = getelementptr inbounds nuw i8, ptr %M, i32 104, !dbg !1742
  %119 = load i64, ptr %arrayidx90.5, align 8, !dbg !1743
  %xor91.5 = xor i64 %119, %and85.5, !dbg !1743
  store i64 %xor91.5, ptr %arrayidx90.5, align 8, !dbg !1743
    #dbg_value(i32 6, !1729, !DIExpression(), !1731)
  %arrayidx80.6 = getelementptr inbounds nuw i8, ptr %M, i32 48, !dbg !1732
  %120 = load i64, ptr %arrayidx80.6, align 8, !dbg !1732
  %shr81.6 = lshr i64 %120, 32, !dbg !1735
  %arrayidx83.6 = getelementptr inbounds nuw i8, ptr %M, i32 112, !dbg !1736
  %121 = load i64, ptr %arrayidx83.6, align 8, !dbg !1736
  %.masked.6 = and i64 %121, 4294967295, !dbg !1737
  %and85.6 = xor i64 %shr81.6, %.masked.6, !dbg !1737
    #dbg_value(i64 %and85.6, !1738, !DIExpression(), !1739)
  %shl86.6 = shl nuw i64 %and85.6, 32, !dbg !1740
  %arrayidx87.6 = getelementptr inbounds nuw i8, ptr %M, i32 48, !dbg !1744
  %122 = load i64, ptr %arrayidx87.6, align 8, !dbg !1741
  %xor88.6 = xor i64 %122, %shl86.6, !dbg !1741
  store i64 %xor88.6, ptr %arrayidx87.6, align 8, !dbg !1741
  %arrayidx90.6 = getelementptr inbounds nuw i8, ptr %M, i32 112, !dbg !1742
  %123 = load i64, ptr %arrayidx90.6, align 8, !dbg !1743
  %xor91.6 = xor i64 %123, %and85.6, !dbg !1743
  store i64 %xor91.6, ptr %arrayidx90.6, align 8, !dbg !1743
    #dbg_value(i32 7, !1729, !DIExpression(), !1731)
  %arrayidx80.7 = getelementptr inbounds nuw i8, ptr %M, i32 56, !dbg !1732
  %124 = load i64, ptr %arrayidx80.7, align 8, !dbg !1732
  %shr81.7 = lshr i64 %124, 32, !dbg !1735
  %arrayidx83.7 = getelementptr inbounds nuw i8, ptr %M, i32 120, !dbg !1736
  %125 = load i64, ptr %arrayidx83.7, align 8, !dbg !1736
  %.masked.7 = and i64 %125, 4294967295, !dbg !1737
  %and85.7 = xor i64 %shr81.7, %.masked.7, !dbg !1737
    #dbg_value(i64 %and85.7, !1738, !DIExpression(), !1739)
  %shl86.7 = shl nuw i64 %and85.7, 32, !dbg !1740
  %arrayidx87.7 = getelementptr inbounds nuw i8, ptr %M, i32 56, !dbg !1744
  %126 = load i64, ptr %arrayidx87.7, align 8, !dbg !1741
  %xor88.7 = xor i64 %126, %shl86.7, !dbg !1741
  store i64 %xor88.7, ptr %arrayidx87.7, align 8, !dbg !1741
  %arrayidx90.7 = getelementptr inbounds nuw i8, ptr %M, i32 120, !dbg !1742
  %127 = load i64, ptr %arrayidx90.7, align 8, !dbg !1743
  %xor91.7 = xor i64 %127, %and85.7, !dbg !1743
  store i64 %xor91.7, ptr %arrayidx90.7, align 8, !dbg !1743
    #dbg_value(i32 8, !1729, !DIExpression(), !1731)
  ret void, !dbg !1745
}

; Function Attrs: nounwind
define internal fastcc void @mul_add_mat_x_m_mat(i32 noundef %m_vec_limbs, ptr noundef %mat, ptr noundef %bs_mat, ptr noundef %acc, i32 noundef %mat_rows, i32 noundef %mat_cols, i32 noundef %bs_mat_cols) unnamed_addr #0 !dbg !1746 {
entry:
    #dbg_value(i32 %m_vec_limbs, !1747, !DIExpression(), !1748)
    #dbg_value(ptr %mat, !1749, !DIExpression(), !1748)
    #dbg_value(ptr %bs_mat, !1750, !DIExpression(), !1748)
    #dbg_value(ptr %acc, !1751, !DIExpression(), !1748)
    #dbg_value(i32 %mat_rows, !1752, !DIExpression(), !1748)
    #dbg_value(i32 %mat_cols, !1753, !DIExpression(), !1748)
    #dbg_value(i32 %bs_mat_cols, !1754, !DIExpression(), !1748)
    #dbg_value(i32 0, !1755, !DIExpression(), !1757)
  %smax = call i32 @llvm.smax.i32(i32 %bs_mat_cols, i32 0), !dbg !1758
  %smax1 = call i32 @llvm.smax.i32(i32 %mat_cols, i32 0), !dbg !1758
  %smax3 = call i32 @llvm.smax.i32(i32 %mat_rows, i32 0), !dbg !1758
  br label %for.cond, !dbg !1758

for.cond:                                         ; preds = %for.inc17, %entry
  %r.0 = phi i32 [ 0, %entry ], [ %inc18, %for.inc17 ], !dbg !1759
    #dbg_value(i32 %r.0, !1755, !DIExpression(), !1757)
  %exitcond4.not = icmp eq i32 %r.0, %smax3, !dbg !1760
  br i1 %exitcond4.not, label %for.end19, label %for.cond1, !dbg !1762

for.cond1:                                        ; preds = %for.cond, %for.inc15
  %c.0 = phi i32 [ %inc, %for.inc15 ], [ 0, %for.cond ], !dbg !1763
    #dbg_value(i32 %c.0, !1766, !DIExpression(), !1767)
  %exitcond2.not = icmp eq i32 %c.0, %smax1, !dbg !1768
  br i1 %exitcond2.not, label %for.inc17, label %for.cond4, !dbg !1770

for.cond4:                                        ; preds = %for.cond1, %for.body6
  %k.0 = phi i32 [ %add14, %for.body6 ], [ 0, %for.cond1 ], !dbg !1771
    #dbg_value(i32 %k.0, !1774, !DIExpression(), !1775)
  %exitcond.not = icmp eq i32 %k.0, %smax, !dbg !1776
  br i1 %exitcond.not, label %for.inc15, label %for.body6, !dbg !1778

for.body6:                                        ; preds = %for.cond4
  %mul = mul nsw i32 %c.0, %bs_mat_cols, !dbg !1779
  %add = add nsw i32 %mul, %k.0, !dbg !1781
  %mul7 = mul nsw i32 %m_vec_limbs, %add, !dbg !1782
  %add.ptr = getelementptr inbounds i64, ptr %bs_mat, i32 %mul7, !dbg !1783
  %mul8 = mul nsw i32 %r.0, %mat_cols, !dbg !1784
  %0 = getelementptr i8, ptr %mat, i32 %mul8, !dbg !1785
  %arrayidx = getelementptr i8, ptr %0, i32 %c.0, !dbg !1785
  %1 = load i8, ptr %arrayidx, align 1, !dbg !1785
  %mul10 = mul nsw i32 %r.0, %bs_mat_cols, !dbg !1786
  %add11 = add nsw i32 %mul10, %k.0, !dbg !1787
  %mul12 = mul nsw i32 %m_vec_limbs, %add11, !dbg !1788
  %add.ptr13 = getelementptr inbounds i64, ptr %acc, i32 %mul12, !dbg !1789
  call fastcc void @m_vec_mul_add(i32 noundef %m_vec_limbs, ptr noundef %add.ptr, i8 noundef zeroext %1, ptr noundef %add.ptr13) #6, !dbg !1790
  %add14 = add nuw i32 %k.0, 1, !dbg !1791
    #dbg_value(i32 %add14, !1774, !DIExpression(), !1775)
  br label %for.cond4, !dbg !1792, !llvm.loop !1793

for.inc15:                                        ; preds = %for.cond4
  %inc = add nuw i32 %c.0, 1, !dbg !1795
    #dbg_value(i32 %inc, !1766, !DIExpression(), !1767)
  br label %for.cond1, !dbg !1796, !llvm.loop !1797

for.inc17:                                        ; preds = %for.cond1
  %inc18 = add nuw i32 %r.0, 1, !dbg !1799
    #dbg_value(i32 %inc18, !1755, !DIExpression(), !1757)
  br label %for.cond, !dbg !1800, !llvm.loop !1801

for.end19:                                        ; preds = %for.cond
  ret void, !dbg !1803
}

; Function Attrs: nounwind
define internal fastcc void @P1_times_Vt(ptr noundef %p, ptr noundef %P1, ptr noundef %V, ptr noundef %acc) unnamed_addr #0 !dbg !1804 {
entry:
    #dbg_value(ptr %p, !1805, !DIExpression(), !1806)
    #dbg_value(ptr %P1, !1807, !DIExpression(), !1806)
    #dbg_value(ptr %V, !1808, !DIExpression(), !1806)
    #dbg_value(ptr %acc, !1809, !DIExpression(), !1806)
  call fastcc void @mul_add_m_upper_triangular_mat_x_mat_trans(i32 noundef 7, ptr noundef %P1, ptr noundef %V, ptr noundef %acc, i32 noundef 108, i32 noundef 108, i32 noundef 11, i32 noundef 1) #6, !dbg !1810
  ret void, !dbg !1811
}

; Function Attrs: nounwind
define internal fastcc void @mul_add_m_upper_triangular_mat_x_mat_trans(i32 noundef %m_vec_limbs, ptr noundef %bs_mat, ptr noundef %mat, ptr noundef %acc, i32 noundef %bs_mat_rows, i32 noundef %bs_mat_cols, i32 noundef %mat_rows, i32 noundef %triangular) unnamed_addr #0 !dbg !1812 {
entry:
    #dbg_value(i32 %m_vec_limbs, !1813, !DIExpression(), !1814)
    #dbg_value(ptr %bs_mat, !1815, !DIExpression(), !1814)
    #dbg_value(ptr %mat, !1816, !DIExpression(), !1814)
    #dbg_value(ptr %acc, !1817, !DIExpression(), !1814)
    #dbg_value(i32 %bs_mat_rows, !1818, !DIExpression(), !1814)
    #dbg_value(i32 %bs_mat_cols, !1819, !DIExpression(), !1814)
    #dbg_value(i32 %mat_rows, !1820, !DIExpression(), !1814)
    #dbg_value(i32 %triangular, !1821, !DIExpression(), !1814)
    #dbg_value(i32 0, !1822, !DIExpression(), !1814)
    #dbg_value(i32 0, !1823, !DIExpression(), !1825)
  %smax = call i32 @llvm.smax.i32(i32 %mat_rows, i32 0), !dbg !1826
  %smax1 = call i32 @llvm.smax.i32(i32 %bs_mat_rows, i32 0), !dbg !1826
  br label %for.cond, !dbg !1826

for.cond:                                         ; preds = %for.inc17, %entry
  %bs_mat_entries_used.0 = phi i32 [ 0, %entry ], [ %bs_mat_entries_used.1, %for.inc17 ], !dbg !1827
  %r.0 = phi i32 [ 0, %entry ], [ %inc18, %for.inc17 ], !dbg !1828
    #dbg_value(i32 %r.0, !1823, !DIExpression(), !1825)
    #dbg_value(i32 %bs_mat_entries_used.0, !1822, !DIExpression(), !1814)
  %exitcond2.not = icmp eq i32 %r.0, %smax1, !dbg !1829
  br i1 %exitcond2.not, label %for.end19, label %for.body, !dbg !1831

for.body:                                         ; preds = %for.cond
  %mul = mul nsw i32 %triangular, %r.0, !dbg !1832
    #dbg_value(i32 %mul, !1835, !DIExpression(), !1836)
  br label %for.cond1, !dbg !1837

for.cond1:                                        ; preds = %for.inc15, %for.body
  %bs_mat_entries_used.1 = phi i32 [ %bs_mat_entries_used.0, %for.body ], [ %add14, %for.inc15 ], !dbg !1814
  %c.0 = phi i32 [ %mul, %for.body ], [ %inc, %for.inc15 ], !dbg !1838
    #dbg_value(i32 %c.0, !1835, !DIExpression(), !1836)
    #dbg_value(i32 %bs_mat_entries_used.1, !1822, !DIExpression(), !1814)
  %cmp2 = icmp slt i32 %c.0, %bs_mat_cols, !dbg !1839
  br i1 %cmp2, label %for.cond4, label %for.inc17, !dbg !1841

for.cond4:                                        ; preds = %for.cond1, %for.body6
  %k.0 = phi i32 [ %add13, %for.body6 ], [ 0, %for.cond1 ], !dbg !1842
    #dbg_value(i32 %k.0, !1845, !DIExpression(), !1846)
  %exitcond.not = icmp eq i32 %k.0, %smax, !dbg !1847
  br i1 %exitcond.not, label %for.inc15, label %for.body6, !dbg !1849

for.body6:                                        ; preds = %for.cond4
  %mul7 = mul nsw i32 %m_vec_limbs, %bs_mat_entries_used.1, !dbg !1850
  %add.ptr = getelementptr inbounds i64, ptr %bs_mat, i32 %mul7, !dbg !1852
  %mul8 = mul nsw i32 %k.0, %bs_mat_cols, !dbg !1853
  %0 = getelementptr i8, ptr %mat, i32 %mul8, !dbg !1854
  %arrayidx = getelementptr i8, ptr %0, i32 %c.0, !dbg !1854
  %1 = load i8, ptr %arrayidx, align 1, !dbg !1854
  %mul9 = mul nsw i32 %r.0, %mat_rows, !dbg !1855
  %add10 = add nsw i32 %mul9, %k.0, !dbg !1856
  %mul11 = mul nsw i32 %m_vec_limbs, %add10, !dbg !1857
  %add.ptr12 = getelementptr inbounds i64, ptr %acc, i32 %mul11, !dbg !1858
  call fastcc void @m_vec_mul_add(i32 noundef %m_vec_limbs, ptr noundef %add.ptr, i8 noundef zeroext %1, ptr noundef %add.ptr12) #6, !dbg !1859
  %add13 = add nuw i32 %k.0, 1, !dbg !1860
    #dbg_value(i32 %add13, !1845, !DIExpression(), !1846)
  br label %for.cond4, !dbg !1861, !llvm.loop !1862

for.inc15:                                        ; preds = %for.cond4
    #dbg_value(i32 %bs_mat_entries_used.1, !1822, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1814)
  %add14 = add nsw i32 %bs_mat_entries_used.1, 1, !dbg !1864
    #dbg_value(i32 %add14, !1822, !DIExpression(), !1814)
  %inc = add nsw i32 %c.0, 1, !dbg !1865
    #dbg_value(i32 %inc, !1835, !DIExpression(), !1836)
  br label %for.cond1, !dbg !1866, !llvm.loop !1867

for.inc17:                                        ; preds = %for.cond1
  %inc18 = add nuw i32 %r.0, 1, !dbg !1869
    #dbg_value(i32 %inc18, !1823, !DIExpression(), !1825)
  br label %for.cond, !dbg !1870, !llvm.loop !1871

for.end19:                                        ; preds = %for.cond
  ret void, !dbg !1873
}

; Function Attrs: nounwind
define dso_local i32 @pqmayo_MAYO_3_ref_mayo_sign(ptr noundef %p, ptr noundef %sm, ptr noundef %smlen, ptr noundef %m, i32 noundef %mlen, ptr noundef %csk) local_unnamed_addr #0 !dbg !1874 {
entry:
  %siglen = alloca i32, align 4
    #dbg_value(ptr %p, !1875, !DIExpression(), !1876)
    #dbg_value(ptr %sm, !1877, !DIExpression(), !1876)
    #dbg_value(ptr %smlen, !1878, !DIExpression(), !1876)
    #dbg_value(ptr %m, !1879, !DIExpression(), !1876)
    #dbg_value(i32 %mlen, !1880, !DIExpression(), !1876)
    #dbg_value(ptr %csk, !1881, !DIExpression(), !1876)
    #dbg_value(i32 0, !1882, !DIExpression(), !1876)
    #dbg_value(i32 681, !1883, !DIExpression(), !1876)
  %add.ptr = getelementptr inbounds nuw i8, ptr %sm, i32 681, !dbg !1884
  %call = call ptr @memmove(ptr noundef nonnull %add.ptr, ptr noundef %m, i32 noundef %mlen) #8, !dbg !1885
  %add.ptr1 = getelementptr inbounds nuw i8, ptr %sm, i32 681, !dbg !1886
    #dbg_value(ptr %siglen, !1887, !DIExpression(DW_OP_deref), !1876)
  %call2 = call i32 @pqmayo_MAYO_3_ref_mayo_sign_signature(ptr noundef %p, ptr noundef %sm, ptr noundef nonnull %siglen, ptr noundef nonnull %add.ptr1, i32 noundef %mlen, ptr noundef %csk) #6, !dbg !1888
    #dbg_value(i32 %call2, !1882, !DIExpression(), !1876)
  %cmp.not = icmp eq i32 %call2, 0, !dbg !1889
  %0 = load i32, ptr %siglen, align 4
    #dbg_value(i32 %0, !1887, !DIExpression(), !1876)
  %cmp3.not = icmp eq i32 %0, 681
  %or.cond = select i1 %cmp.not, i1 %cmp3.not, i1 false, !dbg !1891
  br i1 %or.cond, label %if.end, label %if.then, !dbg !1891

if.then:                                          ; preds = %entry
  %1 = load i32, ptr %siglen, align 4, !dbg !1892
    #dbg_value(i32 %1, !1887, !DIExpression(), !1876)
  %add = add i32 %1, %mlen, !dbg !1894
  %call4 = call ptr @memset(ptr noundef %sm, i32 noundef 0, i32 noundef %add) #8, !dbg !1895
  br label %err, !dbg !1896

if.end:                                           ; preds = %entry
  %2 = load i32, ptr %siglen, align 4, !dbg !1897
    #dbg_value(i32 %2, !1887, !DIExpression(), !1876)
  %add5 = add i32 %2, %mlen, !dbg !1898
  store i32 %add5, ptr %smlen, align 4, !dbg !1899
  br label %err, !dbg !1900

err:                                              ; preds = %if.end, %if.then
    #dbg_label(!1901, !1902)
  ret i32 %call2, !dbg !1903
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqmayo_MAYO_3_ref_mayo_open(ptr noundef %p, ptr noundef %m, ptr noundef %mlen, ptr noundef %sm, i32 noundef %smlen, ptr noundef %pk) local_unnamed_addr #0 !dbg !1904 {
entry:
    #dbg_value(ptr %p, !1905, !DIExpression(), !1906)
    #dbg_value(ptr %m, !1907, !DIExpression(), !1906)
    #dbg_value(ptr %mlen, !1908, !DIExpression(), !1906)
    #dbg_value(ptr %sm, !1909, !DIExpression(), !1906)
    #dbg_value(i32 %smlen, !1910, !DIExpression(), !1906)
    #dbg_value(ptr %pk, !1911, !DIExpression(), !1906)
    #dbg_value(i32 681, !1912, !DIExpression(), !1906)
  %cmp = icmp ult i32 %smlen, 681, !dbg !1913
  br i1 %cmp, label %return, label %if.end, !dbg !1913

if.end:                                           ; preds = %entry
  %add.ptr = getelementptr inbounds nuw i8, ptr %sm, i32 681, !dbg !1915
  %sub = add i32 %smlen, -681, !dbg !1916
  %call = call i32 @pqmayo_MAYO_3_ref_mayo_verify(ptr noundef %p, ptr noundef nonnull %add.ptr, i32 noundef %sub, ptr noundef %sm, ptr noundef %pk) #6, !dbg !1917
    #dbg_value(i32 %call, !1918, !DIExpression(), !1906)
  %cmp1 = icmp eq i32 %call, 0, !dbg !1919
  br i1 %cmp1, label %if.then2, label %return, !dbg !1919

if.then2:                                         ; preds = %if.end
  %sub3 = add i32 %smlen, -681, !dbg !1921
  store i32 %sub3, ptr %mlen, align 4, !dbg !1923
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %sm, i32 681, !dbg !1924
  %call5 = call ptr @memmove(ptr noundef %m, ptr noundef nonnull %add.ptr4, i32 noundef %sub3) #8, !dbg !1925
  br label %return, !dbg !1926

return:                                           ; preds = %if.end, %if.then2, %entry
  %retval.0 = phi i32 [ 1, %entry ], [ %call, %if.then2 ], [ %call, %if.end ], !dbg !1906
  ret i32 %retval.0, !dbg !1927
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqmayo_MAYO_3_ref_mayo_verify(ptr noundef %p, ptr noundef %m, i32 noundef %mlen, ptr noundef %sig, ptr noundef %cpk) local_unnamed_addr #0 !dbg !1928 {
entry:
  %tEnc = alloca [54 x i8], align 1
  %t = alloca [108 x i8], align 1
  %y = alloca [216 x i8], align 1
  %s = alloca [1298 x i8], align 1
  %pk = alloca [49147 x i64], align 8
  %tmp = alloca [80 x i8], align 1
    #dbg_value(ptr %p, !1931, !DIExpression(), !1932)
    #dbg_value(ptr %m, !1933, !DIExpression(), !1932)
    #dbg_value(i32 %mlen, !1934, !DIExpression(), !1932)
    #dbg_value(ptr %sig, !1935, !DIExpression(), !1932)
    #dbg_value(ptr %cpk, !1936, !DIExpression(), !1932)
    #dbg_declare(ptr %tEnc, !1937, !DIExpression(), !1938)
    #dbg_declare(ptr %t, !1939, !DIExpression(), !1940)
    #dbg_declare(ptr %y, !1941, !DIExpression(), !1945)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(216) %y, i8 0, i32 216, i1 false), !dbg !1945
    #dbg_declare(ptr %s, !1946, !DIExpression(), !1947)
    #dbg_declare(ptr %pk, !1948, !DIExpression(), !1952)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(393176) %pk, i8 0, i32 393176, i1 false), !dbg !1952
    #dbg_declare(ptr %tmp, !1953, !DIExpression(), !1957)
    #dbg_value(i32 108, !1958, !DIExpression(), !1932)
    #dbg_value(i32 118, !1959, !DIExpression(), !1932)
    #dbg_value(i32 11, !1960, !DIExpression(), !1932)
    #dbg_value(i32 54, !1961, !DIExpression(), !1932)
    #dbg_value(i32 681, !1962, !DIExpression(), !1932)
    #dbg_value(i32 48, !1963, !DIExpression(), !1932)
    #dbg_value(i32 32, !1964, !DIExpression(), !1932)
  %call = call i32 @pqmayo_MAYO_3_ref_mayo_expand_pk(ptr noundef %p, ptr noundef %cpk, ptr noundef nonnull %pk) #6, !dbg !1965
    #dbg_value(i32 %call, !1966, !DIExpression(), !1932)
  %cmp.not = icmp eq i32 %call, 0, !dbg !1967
  br i1 %cmp.not, label %if.end, label %return, !dbg !1967

if.end:                                           ; preds = %entry
    #dbg_value(ptr %pk, !1969, !DIExpression(), !1932)
  %add.ptr = getelementptr inbounds nuw i8, ptr %pk, i32 329616, !dbg !1970
    #dbg_value(ptr %add.ptr, !1971, !DIExpression(), !1932)
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %pk, i32 390096, !dbg !1972
    #dbg_value(ptr %add.ptr2, !1973, !DIExpression(), !1932)
  %call4 = call i32 @shake256(ptr noundef nonnull %tmp, i32 noundef 48, ptr noundef %m, i32 noundef %mlen) #8, !dbg !1974
  %add.ptr6 = getelementptr inbounds nuw i8, ptr %tmp, i32 48, !dbg !1975
  %add.ptr8 = getelementptr inbounds nuw i8, ptr %sig, i32 649, !dbg !1976
  %call9 = call ptr @memcpy(ptr noundef nonnull %add.ptr6, ptr noundef nonnull %add.ptr8, i32 noundef 32) #8, !dbg !1977
  %call12 = call i32 @shake256(ptr noundef nonnull %tEnc, i32 noundef 54, ptr noundef nonnull %tmp, i32 noundef 80) #8, !dbg !1978
  call fastcc void @decode(ptr noundef nonnull %tEnc, ptr noundef nonnull %t, i32 noundef 108) #6, !dbg !1979
  call fastcc void @decode(ptr noundef %sig, ptr noundef nonnull %s, i32 noundef 1298) #6, !dbg !1980
  call fastcc void @eval_public_map(ptr noundef %p, ptr noundef nonnull %s, ptr noundef nonnull %pk, ptr noundef nonnull %add.ptr, ptr noundef nonnull %add.ptr2, ptr noundef nonnull %y) #6, !dbg !1981
  %call20 = call i32 @memcmp(ptr noundef nonnull %y, ptr noundef nonnull %t, i32 noundef 108) #8, !dbg !1982
  %cmp21 = icmp ne i32 %call20, 0, !dbg !1984
  %. = zext i1 %cmp21 to i32, !dbg !1932
  br label %return, !dbg !1932

return:                                           ; preds = %if.end, %entry
  %retval.0 = phi i32 [ 1, %entry ], [ %., %if.end ], !dbg !1932
  ret i32 %retval.0, !dbg !1985
}

; Function Attrs: nounwind
define dso_local i32 @pqmayo_MAYO_3_ref_mayo_expand_pk(ptr noundef %p, ptr noundef %cpk, ptr noundef %pk) local_unnamed_addr #0 !dbg !1986 {
entry:
    #dbg_value(ptr %p, !1989, !DIExpression(), !1990)
    #dbg_value(ptr %cpk, !1991, !DIExpression(), !1990)
    #dbg_value(ptr %pk, !1992, !DIExpression(), !1990)
  call fastcc void @expand_P1_P2(ptr noundef %p, ptr noundef %pk, ptr noundef %cpk) #6, !dbg !1993
  %add.ptr = getelementptr inbounds nuw i8, ptr %cpk, i32 16, !dbg !1994
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %pk, i32 390096, !dbg !1995
  call fastcc void @unpack_m_vecs(ptr noundef nonnull %add.ptr, ptr noundef nonnull %add.ptr2, i32 noundef 55, i32 noundef 108) #6, !dbg !1996
  ret i32 0, !dbg !1997
}

; Function Attrs: nounwind
define internal fastcc void @eval_public_map(ptr noundef %p, ptr noundef %s, ptr noundef %P1, ptr noundef %P2, ptr noundef %P3, ptr noundef %eval) unnamed_addr #0 !dbg !1998 {
entry:
  %SPS = alloca [847 x i64], align 8
  %zero = alloca [108 x i8], align 1
    #dbg_value(ptr %p, !2001, !DIExpression(), !2002)
    #dbg_value(ptr %s, !2003, !DIExpression(), !2002)
    #dbg_value(ptr %P1, !2004, !DIExpression(), !2002)
    #dbg_value(ptr %P2, !2005, !DIExpression(), !2002)
    #dbg_value(ptr %P3, !2006, !DIExpression(), !2002)
    #dbg_value(ptr %eval, !2007, !DIExpression(), !2002)
    #dbg_declare(ptr %SPS, !2008, !DIExpression(), !2012)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(6776) %SPS, i8 0, i32 6776, i1 false), !dbg !2012
  call fastcc void @m_calculate_PS_SPS(ptr noundef %p, ptr noundef %P1, ptr noundef %P2, ptr noundef %P3, ptr noundef %s, ptr noundef nonnull %SPS) #6, !dbg !2013
    #dbg_declare(ptr %zero, !2014, !DIExpression(), !2015)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(108) %zero, i8 0, i32 108, i1 false), !dbg !2015
  call fastcc void @compute_rhs(ptr noundef %p, ptr noundef nonnull %SPS, ptr noundef nonnull %zero, ptr noundef %eval) #6, !dbg !2016
  ret void, !dbg !2017
}

; Function Attrs: nounwind
define internal fastcc void @m_calculate_PS_SPS(ptr noundef %p, ptr noundef %P1, ptr noundef %P2, ptr noundef %P3, ptr noundef %s, ptr noundef %SPS) unnamed_addr #0 !dbg !2018 {
entry:
  %PS = alloca [9086 x i64], align 8
    #dbg_value(ptr %p, !2021, !DIExpression(), !2022)
    #dbg_value(ptr %P1, !2023, !DIExpression(), !2022)
    #dbg_value(ptr %P2, !2024, !DIExpression(), !2022)
    #dbg_value(ptr %P3, !2025, !DIExpression(), !2022)
    #dbg_value(ptr %s, !2026, !DIExpression(), !2022)
    #dbg_value(ptr %SPS, !2027, !DIExpression(), !2022)
    #dbg_declare(ptr %PS, !2028, !DIExpression(), !2032)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(72688) %PS, i8 0, i32 72688, i1 false), !dbg !2032
  call fastcc void @mayo_generic_m_calculate_PS(ptr noundef %P1, ptr noundef %P2, ptr noundef %P3, ptr noundef %s, i32 noundef 108, i32 noundef 108, i32 noundef 10, i32 noundef 11, ptr noundef nonnull %PS) #6, !dbg !2033
  call fastcc void @mayo_generic_m_calculate_SPS(ptr noundef nonnull %PS, ptr noundef %s, i32 noundef 108, i32 noundef 11, i32 noundef 118, ptr noundef %SPS) #6, !dbg !2034
  ret void, !dbg !2035
}

; Function Attrs: nounwind
define internal fastcc void @mayo_generic_m_calculate_PS(ptr noundef %P1, ptr noundef %P2, ptr noundef %P3, ptr noundef %S, i32 noundef %m, i32 noundef %v, i32 noundef %o, i32 noundef %k, ptr noundef %PS) unnamed_addr #0 !dbg !2036 {
entry:
  %accumulator = alloca [145376 x i64], align 8
    #dbg_value(ptr %P1, !2039, !DIExpression(), !2040)
    #dbg_value(ptr %P2, !2041, !DIExpression(), !2040)
    #dbg_value(ptr %P3, !2042, !DIExpression(), !2040)
    #dbg_value(ptr %S, !2043, !DIExpression(), !2040)
    #dbg_value(i32 %m, !2044, !DIExpression(), !2040)
    #dbg_value(i32 %v, !2045, !DIExpression(), !2040)
    #dbg_value(i32 %o, !2046, !DIExpression(), !2040)
    #dbg_value(i32 %k, !2047, !DIExpression(), !2040)
    #dbg_value(ptr %PS, !2048, !DIExpression(), !2040)
  %add = add i32 %o, %v, !dbg !2049
    #dbg_value(i32 %add, !2050, !DIExpression(), !2040)
  %add1 = add nsw i32 %m, 15, !dbg !2051
  %div = sdiv i32 %add1, 16, !dbg !2052
    #dbg_value(i32 %div, !2053, !DIExpression(), !2040)
    #dbg_declare(ptr %accumulator, !2054, !DIExpression(), !2058)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(1163008) %accumulator, i8 0, i32 1163008, i1 false), !dbg !2058
    #dbg_value(i32 0, !2059, !DIExpression(), !2040)
    #dbg_value(i32 0, !2060, !DIExpression(), !2062)
  %smax = call i32 @llvm.smax.i32(i32 %k, i32 0), !dbg !2063
  %smax3 = call i32 @llvm.smax.i32(i32 %o, i32 0), !dbg !2063
  %smax5 = call i32 @llvm.smax.i32(i32 %v, i32 0), !dbg !2063
  br label %for.cond, !dbg !2063

for.cond:                                         ; preds = %for.inc52, %entry
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.inc52 ], [ %v, %entry ], !dbg !2064
  %P1_used.0 = phi i32 [ %P1_used.1, %for.inc52 ], [ 0, %entry ], !dbg !2064
  %row.0 = phi i32 [ %inc53, %for.inc52 ], [ 0, %entry ], !dbg !2065
    #dbg_value(i32 %row.0, !2060, !DIExpression(), !2062)
    #dbg_value(i32 %P1_used.0, !2059, !DIExpression(), !2040)
  %exitcond6.not = icmp eq i32 %row.0, %smax5, !dbg !2066
  br i1 %exitcond6.not, label %for.cond56.preheader, label %for.cond2.preheader, !dbg !2068

for.cond2.preheader:                              ; preds = %for.cond
  %0 = add i32 %P1_used.0, %indvars.iv, !dbg !2069
  br label %for.cond2, !dbg !2069

for.cond56.preheader:                             ; preds = %for.cond
  %smax8 = call i32 @llvm.smax.i32(i32 %v, i32 %add), !dbg !2072
  br label %for.cond56, !dbg !2072

for.cond2:                                        ; preds = %for.cond2.preheader, %for.inc17
  %P1_used.1 = phi i32 [ %inc16, %for.inc17 ], [ %P1_used.0, %for.cond2.preheader ], !dbg !2040
  %j.0 = phi i32 [ %inc18, %for.inc17 ], [ %row.0, %for.cond2.preheader ], !dbg !2074
    #dbg_value(i32 %j.0, !2075, !DIExpression(), !2076)
    #dbg_value(i32 %P1_used.1, !2059, !DIExpression(), !2040)
  %exitcond1.not = icmp eq i32 %P1_used.1, %0, !dbg !2077
  br i1 %exitcond1.not, label %for.cond21, label %for.cond5, !dbg !2069

for.cond5:                                        ; preds = %for.cond2, %for.body7
  %col.0 = phi i32 [ %inc, %for.body7 ], [ 0, %for.cond2 ], !dbg !2079
    #dbg_value(i32 %col.0, !2082, !DIExpression(), !2083)
  %exitcond.not = icmp eq i32 %col.0, %smax, !dbg !2084
  br i1 %exitcond.not, label %for.inc17, label %for.body7, !dbg !2086

for.body7:                                        ; preds = %for.cond5
  %mul = mul nsw i32 %P1_used.1, %div, !dbg !2087
  %add.ptr = getelementptr inbounds i64, ptr %P1, i32 %mul, !dbg !2089
  %mul8 = mul nsw i32 %row.0, %k, !dbg !2090
  %add9 = add nsw i32 %mul8, %col.0, !dbg !2091
  %mul10 = shl nsw i32 %add9, 4, !dbg !2092
  %mul11 = mul nsw i32 %col.0, %add, !dbg !2093
  %1 = getelementptr i8, ptr %S, i32 %mul11, !dbg !2094
  %arrayidx = getelementptr i8, ptr %1, i32 %j.0, !dbg !2094
  %2 = load i8, ptr %arrayidx, align 1, !dbg !2094
  %conv = zext i8 %2 to i32, !dbg !2094
  %add13 = add nsw i32 %mul10, %conv, !dbg !2095
  %mul14 = mul nsw i32 %add13, %div, !dbg !2096
  %add.ptr15 = getelementptr inbounds i64, ptr %accumulator, i32 %mul14, !dbg !2097
  call fastcc void @m_vec_add(i32 noundef %div, ptr noundef %add.ptr, ptr noundef nonnull %add.ptr15) #6, !dbg !2098
  %inc = add nuw i32 %col.0, 1, !dbg !2099
    #dbg_value(i32 %inc, !2082, !DIExpression(), !2083)
  br label %for.cond5, !dbg !2100, !llvm.loop !2101

for.inc17:                                        ; preds = %for.cond5
    #dbg_value(i32 %P1_used.1, !2059, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2040)
  %inc16 = add i32 %P1_used.1, 1, !dbg !2103
    #dbg_value(i32 %inc16, !2059, !DIExpression(), !2040)
  %inc18 = add nuw nsw i32 %j.0, 1, !dbg !2104
    #dbg_value(i32 %inc18, !2075, !DIExpression(), !2076)
  br label %for.cond2, !dbg !2105, !llvm.loop !2106

for.cond21:                                       ; preds = %for.cond2, %for.inc49
  %j20.0 = phi i32 [ %inc50, %for.inc49 ], [ 0, %for.cond2 ], !dbg !2108
    #dbg_value(i32 %j20.0, !2110, !DIExpression(), !2111)
  %exitcond4.not = icmp eq i32 %j20.0, %smax3, !dbg !2112
  br i1 %exitcond4.not, label %for.inc52, label %for.cond26, !dbg !2114

for.cond26:                                       ; preds = %for.cond21, %for.body29
  %col25.0 = phi i32 [ %inc47, %for.body29 ], [ 0, %for.cond21 ], !dbg !2115
    #dbg_value(i32 %col25.0, !2118, !DIExpression(), !2119)
  %exitcond2.not = icmp eq i32 %col25.0, %smax, !dbg !2120
  br i1 %exitcond2.not, label %for.inc49, label %for.body29, !dbg !2122

for.body29:                                       ; preds = %for.cond26
  %mul30 = mul nsw i32 %row.0, %o, !dbg !2123
  %add31 = add nsw i32 %mul30, %j20.0, !dbg !2125
  %mul32 = mul nsw i32 %add31, %div, !dbg !2126
  %add.ptr33 = getelementptr inbounds i64, ptr %P2, i32 %mul32, !dbg !2127
  %mul35 = mul nsw i32 %row.0, %k, !dbg !2128
  %add36 = add nsw i32 %mul35, %col25.0, !dbg !2129
  %mul37 = shl nsw i32 %add36, 4, !dbg !2130
  %mul38 = mul nsw i32 %col25.0, %add, !dbg !2131
  %3 = getelementptr i8, ptr %S, i32 %mul38, !dbg !2132
  %4 = getelementptr i8, ptr %3, i32 %j20.0, !dbg !2132
  %arrayidx41 = getelementptr i8, ptr %4, i32 %v, !dbg !2132
  %5 = load i8, ptr %arrayidx41, align 1, !dbg !2132
  %conv42 = zext i8 %5 to i32, !dbg !2132
  %add43 = add nsw i32 %mul37, %conv42, !dbg !2133
  %mul44 = mul nsw i32 %add43, %div, !dbg !2134
  %add.ptr45 = getelementptr inbounds i64, ptr %accumulator, i32 %mul44, !dbg !2135
  call fastcc void @m_vec_add(i32 noundef %div, ptr noundef %add.ptr33, ptr noundef nonnull %add.ptr45) #6, !dbg !2136
  %inc47 = add nuw i32 %col25.0, 1, !dbg !2137
    #dbg_value(i32 %inc47, !2118, !DIExpression(), !2119)
  br label %for.cond26, !dbg !2138, !llvm.loop !2139

for.inc49:                                        ; preds = %for.cond26
  %inc50 = add nuw i32 %j20.0, 1, !dbg !2141
    #dbg_value(i32 %inc50, !2110, !DIExpression(), !2111)
  br label %for.cond21, !dbg !2142, !llvm.loop !2143

for.inc52:                                        ; preds = %for.cond21
  %inc53 = add nuw i32 %row.0, 1, !dbg !2145
    #dbg_value(i32 %inc53, !2060, !DIExpression(), !2062)
  %indvars.iv.next = add i32 %indvars.iv, -1, !dbg !2146
  br label %for.cond, !dbg !2146, !llvm.loop !2147

for.cond56:                                       ; preds = %for.cond56.preheader, %for.inc90
  %P3_used.0 = phi i32 [ %P3_used.1, %for.inc90 ], [ 0, %for.cond56.preheader ], !dbg !2149
  %row55.0 = phi i32 [ %inc91, %for.inc90 ], [ %v, %for.cond56.preheader ], !dbg !2150
    #dbg_value(i32 %row55.0, !2151, !DIExpression(), !2152)
    #dbg_value(i32 %P3_used.0, !2153, !DIExpression(), !2040)
  %exitcond9.not = icmp eq i32 %row55.0, %smax8, !dbg !2154
  br i1 %exitcond9.not, label %while.cond.preheader, label %for.cond61, !dbg !2072

while.cond.preheader:                             ; preds = %for.cond56
  %6 = mul i32 %k, %add, !dbg !2156
  %smax10 = call i32 @llvm.smax.i32(i32 %6, i32 0), !dbg !2156
  br label %while.cond, !dbg !2156

for.cond61:                                       ; preds = %for.cond56, %for.inc87
  %P3_used.1 = phi i32 [ %inc86, %for.inc87 ], [ %P3_used.0, %for.cond56 ], !dbg !2040
  %j60.0 = phi i32 [ %inc88, %for.inc87 ], [ %row55.0, %for.cond56 ], !dbg !2157
    #dbg_value(i32 %j60.0, !2160, !DIExpression(), !2161)
    #dbg_value(i32 %P3_used.1, !2153, !DIExpression(), !2040)
  %cmp62 = icmp slt i32 %j60.0, %add, !dbg !2162
  br i1 %cmp62, label %for.cond66, label %for.inc90, !dbg !2164

for.cond66:                                       ; preds = %for.cond61, %for.body69
  %col65.0 = phi i32 [ %inc84, %for.body69 ], [ 0, %for.cond61 ], !dbg !2165
    #dbg_value(i32 %col65.0, !2168, !DIExpression(), !2169)
  %exitcond7.not = icmp eq i32 %col65.0, %smax, !dbg !2170
  br i1 %exitcond7.not, label %for.inc87, label %for.body69, !dbg !2172

for.body69:                                       ; preds = %for.cond66
  %mul70 = mul nsw i32 %P3_used.1, %div, !dbg !2173
  %add.ptr71 = getelementptr inbounds i64, ptr %P3, i32 %mul70, !dbg !2175
  %mul73 = mul nsw i32 %row55.0, %k, !dbg !2176
  %add74 = add nsw i32 %mul73, %col65.0, !dbg !2177
  %mul75 = shl nsw i32 %add74, 4, !dbg !2178
  %mul76 = mul nsw i32 %col65.0, %add, !dbg !2179
  %7 = getelementptr i8, ptr %S, i32 %mul76, !dbg !2180
  %arrayidx78 = getelementptr i8, ptr %7, i32 %j60.0, !dbg !2180
  %8 = load i8, ptr %arrayidx78, align 1, !dbg !2180
  %conv79 = zext i8 %8 to i32, !dbg !2180
  %add80 = add nsw i32 %mul75, %conv79, !dbg !2181
  %mul81 = mul nsw i32 %add80, %div, !dbg !2182
  %add.ptr82 = getelementptr inbounds i64, ptr %accumulator, i32 %mul81, !dbg !2183
  call fastcc void @m_vec_add(i32 noundef %div, ptr noundef %add.ptr71, ptr noundef nonnull %add.ptr82) #6, !dbg !2184
  %inc84 = add nuw i32 %col65.0, 1, !dbg !2185
    #dbg_value(i32 %inc84, !2168, !DIExpression(), !2169)
  br label %for.cond66, !dbg !2186, !llvm.loop !2187

for.inc87:                                        ; preds = %for.cond66
    #dbg_value(i32 %P3_used.1, !2153, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2040)
  %inc86 = add nsw i32 %P3_used.1, 1, !dbg !2189
    #dbg_value(i32 %inc86, !2153, !DIExpression(), !2040)
  %inc88 = add nsw i32 %j60.0, 1, !dbg !2190
    #dbg_value(i32 %inc88, !2160, !DIExpression(), !2161)
  br label %for.cond61, !dbg !2191, !llvm.loop !2192

for.inc90:                                        ; preds = %for.cond61
  %inc91 = add i32 %row55.0, 1, !dbg !2194
    #dbg_value(i32 %inc91, !2151, !DIExpression(), !2152)
  br label %for.cond56, !dbg !2195, !llvm.loop !2196

while.cond:                                       ; preds = %while.cond.preheader, %while.body
  %i.0 = phi i32 [ %inc102, %while.body ], [ 0, %while.cond.preheader ], !dbg !2040
    #dbg_value(i32 %i.0, !2198, !DIExpression(), !2040)
  %exitcond11.not = icmp eq i32 %i.0, %smax10, !dbg !2199
  br i1 %exitcond11.not, label %while.end, label %while.body, !dbg !2156

while.body:                                       ; preds = %while.cond
  %mul97 = shl nsw i32 %i.0, 4, !dbg !2200
  %mul98 = mul nsw i32 %mul97, %div, !dbg !2202
  %add.ptr99 = getelementptr inbounds i64, ptr %accumulator, i32 %mul98, !dbg !2203
  %mul100 = mul nsw i32 %i.0, %div, !dbg !2204
  %add.ptr101 = getelementptr inbounds i64, ptr %PS, i32 %mul100, !dbg !2205
  call fastcc void @m_vec_multiply_bins(i32 noundef %div, ptr noundef nonnull %add.ptr99, ptr noundef %add.ptr101) #6, !dbg !2206
  %inc102 = add nuw i32 %i.0, 1, !dbg !2207
    #dbg_value(i32 %inc102, !2198, !DIExpression(), !2040)
  br label %while.cond, !dbg !2156, !llvm.loop !2208

while.end:                                        ; preds = %while.cond
  ret void, !dbg !2210
}

; Function Attrs: nounwind
define internal fastcc void @mayo_generic_m_calculate_SPS(ptr noundef %PS, ptr noundef %S, i32 noundef %m, i32 noundef %k, i32 noundef %n, ptr noundef %SPS) unnamed_addr #0 !dbg !2211 {
entry:
  %accumulator = alloca [13552 x i64], align 8
    #dbg_value(ptr %PS, !2214, !DIExpression(), !2215)
    #dbg_value(ptr %S, !2216, !DIExpression(), !2215)
    #dbg_value(i32 %m, !2217, !DIExpression(), !2215)
    #dbg_value(i32 %k, !2218, !DIExpression(), !2215)
    #dbg_value(i32 %n, !2219, !DIExpression(), !2215)
    #dbg_value(ptr %SPS, !2220, !DIExpression(), !2215)
    #dbg_declare(ptr %accumulator, !2221, !DIExpression(), !2225)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(108416) %accumulator, i8 0, i32 108416, i1 false), !dbg !2225
  %add = add nsw i32 %m, 15, !dbg !2226
  %div = sdiv i32 %add, 16, !dbg !2227
    #dbg_value(i32 %div, !2228, !DIExpression(), !2215)
    #dbg_value(i32 0, !2229, !DIExpression(), !2231)
  %smax = call i32 @llvm.smax.i32(i32 %n, i32 0), !dbg !2232
  %smax2 = call i32 @llvm.smax.i32(i32 %k, i32 0), !dbg !2232
  br label %for.cond, !dbg !2232

for.cond:                                         ; preds = %for.inc20, %entry
  %row.0 = phi i32 [ 0, %entry ], [ %inc21, %for.inc20 ], !dbg !2233
    #dbg_value(i32 %row.0, !2229, !DIExpression(), !2231)
  %exitcond3.not = icmp eq i32 %row.0, %smax2, !dbg !2234
  br i1 %exitcond3.not, label %while.cond.preheader, label %for.cond1, !dbg !2236

while.cond.preheader:                             ; preds = %for.cond
  %0 = mul i32 %k, %k, !dbg !2237
  br label %while.cond, !dbg !2237

for.cond1:                                        ; preds = %for.cond, %for.inc18
  %j.0 = phi i32 [ %inc, %for.inc18 ], [ 0, %for.cond ], !dbg !2238
    #dbg_value(i32 %j.0, !2241, !DIExpression(), !2242)
  %exitcond1.not = icmp eq i32 %j.0, %smax, !dbg !2243
  br i1 %exitcond1.not, label %for.inc20, label %for.cond4, !dbg !2245

for.cond4:                                        ; preds = %for.cond1, %for.body6
  %col.0 = phi i32 [ %add17, %for.body6 ], [ 0, %for.cond1 ], !dbg !2246
    #dbg_value(i32 %col.0, !2249, !DIExpression(), !2250)
  %exitcond.not = icmp eq i32 %col.0, %k, !dbg !2251
  br i1 %exitcond.not, label %for.inc18, label %for.body6, !dbg !2253

for.body6:                                        ; preds = %for.cond4
  %mul = mul nsw i32 %j.0, %k, !dbg !2254
  %add7 = add nsw i32 %mul, %col.0, !dbg !2256
  %mul8 = mul nsw i32 %add7, %div, !dbg !2257
  %add.ptr = getelementptr inbounds i64, ptr %PS, i32 %mul8, !dbg !2258
  %mul9 = mul nsw i32 %row.0, %k, !dbg !2259
  %add10 = add nsw i32 %mul9, %col.0, !dbg !2260
  %mul11 = shl nsw i32 %add10, 4, !dbg !2261
  %mul12 = mul nsw i32 %row.0, %n, !dbg !2262
  %1 = getelementptr i8, ptr %S, i32 %mul12, !dbg !2263
  %arrayidx = getelementptr i8, ptr %1, i32 %j.0, !dbg !2263
  %2 = load i8, ptr %arrayidx, align 1, !dbg !2263
  %conv = zext i8 %2 to i32, !dbg !2263
  %add14 = add nsw i32 %mul11, %conv, !dbg !2264
  %mul15 = mul nsw i32 %add14, %div, !dbg !2265
  %add.ptr16 = getelementptr inbounds i64, ptr %accumulator, i32 %mul15, !dbg !2266
  call fastcc void @m_vec_add(i32 noundef %div, ptr noundef %add.ptr, ptr noundef nonnull %add.ptr16) #6, !dbg !2267
  %add17 = add nuw i32 %col.0, 1, !dbg !2268
    #dbg_value(i32 %add17, !2249, !DIExpression(), !2250)
  br label %for.cond4, !dbg !2269, !llvm.loop !2270

for.inc18:                                        ; preds = %for.cond4
  %inc = add nuw i32 %j.0, 1, !dbg !2272
    #dbg_value(i32 %inc, !2241, !DIExpression(), !2242)
  br label %for.cond1, !dbg !2273, !llvm.loop !2274

for.inc20:                                        ; preds = %for.cond1
  %inc21 = add nuw i32 %row.0, 1, !dbg !2276
    #dbg_value(i32 %inc21, !2229, !DIExpression(), !2231)
  br label %for.cond, !dbg !2277, !llvm.loop !2278

while.cond:                                       ; preds = %while.cond.preheader, %while.body
  %i.0 = phi i32 [ %inc32, %while.body ], [ 0, %while.cond.preheader ], !dbg !2215
    #dbg_value(i32 %i.0, !2280, !DIExpression(), !2215)
  %exitcond4.not = icmp eq i32 %i.0, %0, !dbg !2281
  br i1 %exitcond4.not, label %while.end, label %while.body, !dbg !2237

while.body:                                       ; preds = %while.cond
  %mul27 = shl nsw i32 %i.0, 4, !dbg !2282
  %mul28 = mul nsw i32 %mul27, %div, !dbg !2284
  %add.ptr29 = getelementptr inbounds i64, ptr %accumulator, i32 %mul28, !dbg !2285
  %mul30 = mul nsw i32 %i.0, %div, !dbg !2286
  %add.ptr31 = getelementptr inbounds i64, ptr %SPS, i32 %mul30, !dbg !2287
  call fastcc void @m_vec_multiply_bins(i32 noundef %div, ptr noundef nonnull %add.ptr29, ptr noundef %add.ptr31) #6, !dbg !2288
  %inc32 = add nuw i32 %i.0, 1, !dbg !2289
    #dbg_value(i32 %inc32, !2280, !DIExpression(), !2215)
  br label %while.cond, !dbg !2237, !llvm.loop !2290

while.end:                                        ; preds = %while.cond
  ret void, !dbg !2292
}

; Function Attrs: nounwind
define internal fastcc void @m_vec_add(i32 noundef %m_vec_limbs, ptr noundef %in, ptr noundef %acc) unnamed_addr #0 !dbg !2293 {
entry:
    #dbg_value(i32 %m_vec_limbs, !2296, !DIExpression(), !2297)
    #dbg_value(ptr %in, !2298, !DIExpression(), !2297)
    #dbg_value(ptr %acc, !2299, !DIExpression(), !2297)
    #dbg_value(i32 0, !2300, !DIExpression(), !2302)
    #dbg_value(i32 0, !2300, !DIExpression(), !2302)
  %0 = load i64, ptr %in, align 8, !dbg !2303
  %1 = load i64, ptr %acc, align 8, !dbg !2306
  %xor = xor i64 %1, %0, !dbg !2306
  store i64 %xor, ptr %acc, align 8, !dbg !2306
    #dbg_value(i32 1, !2300, !DIExpression(), !2302)
  %arrayidx.1 = getelementptr inbounds nuw i8, ptr %in, i32 8, !dbg !2303
  %2 = load i64, ptr %arrayidx.1, align 8, !dbg !2303
  %arrayidx1.1 = getelementptr inbounds nuw i8, ptr %acc, i32 8, !dbg !2307
  %3 = load i64, ptr %arrayidx1.1, align 8, !dbg !2306
  %xor.1 = xor i64 %3, %2, !dbg !2306
  store i64 %xor.1, ptr %arrayidx1.1, align 8, !dbg !2306
    #dbg_value(i32 2, !2300, !DIExpression(), !2302)
  %arrayidx.2 = getelementptr inbounds nuw i8, ptr %in, i32 16, !dbg !2303
  %4 = load i64, ptr %arrayidx.2, align 8, !dbg !2303
  %arrayidx1.2 = getelementptr inbounds nuw i8, ptr %acc, i32 16, !dbg !2307
  %5 = load i64, ptr %arrayidx1.2, align 8, !dbg !2306
  %xor.2 = xor i64 %5, %4, !dbg !2306
  store i64 %xor.2, ptr %arrayidx1.2, align 8, !dbg !2306
    #dbg_value(i32 3, !2300, !DIExpression(), !2302)
  %arrayidx.3 = getelementptr inbounds nuw i8, ptr %in, i32 24, !dbg !2303
  %6 = load i64, ptr %arrayidx.3, align 8, !dbg !2303
  %arrayidx1.3 = getelementptr inbounds nuw i8, ptr %acc, i32 24, !dbg !2307
  %7 = load i64, ptr %arrayidx1.3, align 8, !dbg !2306
  %xor.3 = xor i64 %7, %6, !dbg !2306
  store i64 %xor.3, ptr %arrayidx1.3, align 8, !dbg !2306
    #dbg_value(i32 4, !2300, !DIExpression(), !2302)
  %arrayidx.4 = getelementptr inbounds nuw i8, ptr %in, i32 32, !dbg !2303
  %8 = load i64, ptr %arrayidx.4, align 8, !dbg !2303
  %arrayidx1.4 = getelementptr inbounds nuw i8, ptr %acc, i32 32, !dbg !2307
  %9 = load i64, ptr %arrayidx1.4, align 8, !dbg !2306
  %xor.4 = xor i64 %9, %8, !dbg !2306
  store i64 %xor.4, ptr %arrayidx1.4, align 8, !dbg !2306
    #dbg_value(i32 5, !2300, !DIExpression(), !2302)
  %arrayidx.5 = getelementptr inbounds nuw i8, ptr %in, i32 40, !dbg !2303
  %10 = load i64, ptr %arrayidx.5, align 8, !dbg !2303
  %arrayidx1.5 = getelementptr inbounds nuw i8, ptr %acc, i32 40, !dbg !2307
  %11 = load i64, ptr %arrayidx1.5, align 8, !dbg !2306
  %xor.5 = xor i64 %11, %10, !dbg !2306
  store i64 %xor.5, ptr %arrayidx1.5, align 8, !dbg !2306
    #dbg_value(i32 6, !2300, !DIExpression(), !2302)
  %arrayidx.6 = getelementptr inbounds nuw i8, ptr %in, i32 48, !dbg !2303
  %12 = load i64, ptr %arrayidx.6, align 8, !dbg !2303
  %arrayidx1.6 = getelementptr inbounds nuw i8, ptr %acc, i32 48, !dbg !2307
  %13 = load i64, ptr %arrayidx1.6, align 8, !dbg !2306
  %xor.6 = xor i64 %13, %12, !dbg !2306
  store i64 %xor.6, ptr %arrayidx1.6, align 8, !dbg !2306
    #dbg_value(i32 7, !2300, !DIExpression(), !2302)
  ret void, !dbg !2308
}

; Function Attrs: nounwind
define internal fastcc void @m_vec_multiply_bins(i32 noundef %m_vec_limbs, ptr noundef %bins, ptr noundef %out) unnamed_addr #0 !dbg !2309 {
entry:
    #dbg_value(i32 %m_vec_limbs, !2312, !DIExpression(), !2313)
    #dbg_value(ptr %bins, !2314, !DIExpression(), !2313)
    #dbg_value(ptr %out, !2315, !DIExpression(), !2313)
  %add.ptr = getelementptr inbounds nuw i8, ptr %bins, i32 280, !dbg !2316
  %add.ptr1 = getelementptr inbounds nuw i8, ptr %bins, i32 560, !dbg !2317
  call fastcc void @m_vec_mul_add_x_inv(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr, ptr noundef nonnull %add.ptr1) #6, !dbg !2318
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %bins, i32 616, !dbg !2319
  %add.ptr3 = getelementptr inbounds nuw i8, ptr %bins, i32 672, !dbg !2320
  call fastcc void @m_vec_mul_add_x(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr2, ptr noundef nonnull %add.ptr3) #6, !dbg !2321
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %bins, i32 560, !dbg !2322
  %add.ptr5 = getelementptr inbounds nuw i8, ptr %bins, i32 392, !dbg !2323
  call fastcc void @m_vec_mul_add_x_inv(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr4, ptr noundef nonnull %add.ptr5) #6, !dbg !2324
  %add.ptr6 = getelementptr inbounds nuw i8, ptr %bins, i32 672, !dbg !2325
  %add.ptr7 = getelementptr inbounds nuw i8, ptr %bins, i32 336, !dbg !2326
  call fastcc void @m_vec_mul_add_x(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr6, ptr noundef nonnull %add.ptr7) #6, !dbg !2327
  %add.ptr8 = getelementptr inbounds nuw i8, ptr %bins, i32 392, !dbg !2328
  %add.ptr9 = getelementptr inbounds nuw i8, ptr %bins, i32 784, !dbg !2329
  call fastcc void @m_vec_mul_add_x_inv(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr8, ptr noundef nonnull %add.ptr9) #6, !dbg !2330
  %add.ptr10 = getelementptr inbounds nuw i8, ptr %bins, i32 336, !dbg !2331
  %add.ptr11 = getelementptr inbounds nuw i8, ptr %bins, i32 168, !dbg !2332
  call fastcc void @m_vec_mul_add_x(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr10, ptr noundef nonnull %add.ptr11) #6, !dbg !2333
  %add.ptr12 = getelementptr inbounds nuw i8, ptr %bins, i32 784, !dbg !2334
  %add.ptr13 = getelementptr inbounds nuw i8, ptr %bins, i32 840, !dbg !2335
  call fastcc void @m_vec_mul_add_x_inv(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr12, ptr noundef nonnull %add.ptr13) #6, !dbg !2336
  %add.ptr14 = getelementptr inbounds nuw i8, ptr %bins, i32 168, !dbg !2337
  %add.ptr15 = getelementptr inbounds nuw i8, ptr %bins, i32 448, !dbg !2338
  call fastcc void @m_vec_mul_add_x(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr14, ptr noundef nonnull %add.ptr15) #6, !dbg !2339
  %add.ptr16 = getelementptr inbounds nuw i8, ptr %bins, i32 840, !dbg !2340
  %add.ptr17 = getelementptr inbounds nuw i8, ptr %bins, i32 728, !dbg !2341
  call fastcc void @m_vec_mul_add_x_inv(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr16, ptr noundef nonnull %add.ptr17) #6, !dbg !2342
  %add.ptr18 = getelementptr inbounds nuw i8, ptr %bins, i32 448, !dbg !2343
  %add.ptr19 = getelementptr inbounds nuw i8, ptr %bins, i32 224, !dbg !2344
  call fastcc void @m_vec_mul_add_x(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr18, ptr noundef nonnull %add.ptr19) #6, !dbg !2345
  %add.ptr20 = getelementptr inbounds nuw i8, ptr %bins, i32 728, !dbg !2346
  %add.ptr21 = getelementptr inbounds nuw i8, ptr %bins, i32 504, !dbg !2347
  call fastcc void @m_vec_mul_add_x_inv(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr20, ptr noundef nonnull %add.ptr21) #6, !dbg !2348
  %add.ptr22 = getelementptr inbounds nuw i8, ptr %bins, i32 224, !dbg !2349
  %add.ptr23 = getelementptr inbounds nuw i8, ptr %bins, i32 112, !dbg !2350
  call fastcc void @m_vec_mul_add_x(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr22, ptr noundef nonnull %add.ptr23) #6, !dbg !2351
  %add.ptr24 = getelementptr inbounds nuw i8, ptr %bins, i32 504, !dbg !2352
  %add.ptr25 = getelementptr inbounds nuw i8, ptr %bins, i32 56, !dbg !2353
  call fastcc void @m_vec_mul_add_x_inv(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr24, ptr noundef nonnull %add.ptr25) #6, !dbg !2354
  %add.ptr26 = getelementptr inbounds nuw i8, ptr %bins, i32 112, !dbg !2355
  %add.ptr27 = getelementptr inbounds nuw i8, ptr %bins, i32 56, !dbg !2356
  call fastcc void @m_vec_mul_add_x(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr26, ptr noundef nonnull %add.ptr27) #6, !dbg !2357
  %add.ptr28 = getelementptr inbounds nuw i8, ptr %bins, i32 56, !dbg !2358
  call fastcc void @m_vec_copy(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr28, ptr noundef %out) #6, !dbg !2359
  ret void, !dbg !2360
}

; Function Attrs: nounwind
define internal fastcc void @m_vec_mul_add_x_inv(i32 noundef %m_vec_limbs, ptr noundef %in, ptr noundef %acc) unnamed_addr #0 !dbg !2361 {
entry:
    #dbg_value(i32 %m_vec_limbs, !2362, !DIExpression(), !2363)
    #dbg_value(ptr %in, !2364, !DIExpression(), !2363)
    #dbg_value(ptr %acc, !2365, !DIExpression(), !2363)
    #dbg_value(i64 1229782938247303441, !2366, !DIExpression(), !2363)
    #dbg_value(i32 0, !2367, !DIExpression(), !2369)
    #dbg_value(i32 0, !2367, !DIExpression(), !2369)
  %0 = load i64, ptr %in, align 8, !dbg !2370
  %and = and i64 %0, 1229782938247303441, !dbg !2373
    #dbg_value(i64 %and, !2374, !DIExpression(), !2375)
  %xor = lshr i64 %0, 1, !dbg !2376
  %shr = and i64 %xor, 8608480567731124087, !dbg !2376
  %mul = mul nuw i64 %and, 9, !dbg !2377
  %xor2 = xor i64 %shr, %mul, !dbg !2378
  %1 = load i64, ptr %acc, align 8, !dbg !2379
  %xor4 = xor i64 %1, %xor2, !dbg !2379
  store i64 %xor4, ptr %acc, align 8, !dbg !2379
    #dbg_value(i32 1, !2367, !DIExpression(), !2369)
  %arrayidx.1 = getelementptr inbounds nuw i8, ptr %in, i32 8, !dbg !2370
  %2 = load i64, ptr %arrayidx.1, align 8, !dbg !2370
  %and.1 = and i64 %2, 1229782938247303441, !dbg !2373
    #dbg_value(i64 %and.1, !2374, !DIExpression(), !2375)
  %xor.1 = lshr i64 %2, 1, !dbg !2376
  %shr.1 = and i64 %xor.1, 8608480567731124087, !dbg !2376
  %mul.1 = mul nuw i64 %and.1, 9, !dbg !2377
  %xor2.1 = xor i64 %shr.1, %mul.1, !dbg !2378
  %arrayidx3.1 = getelementptr inbounds nuw i8, ptr %acc, i32 8, !dbg !2380
  %3 = load i64, ptr %arrayidx3.1, align 8, !dbg !2379
  %xor4.1 = xor i64 %3, %xor2.1, !dbg !2379
  store i64 %xor4.1, ptr %arrayidx3.1, align 8, !dbg !2379
    #dbg_value(i32 2, !2367, !DIExpression(), !2369)
  %arrayidx.2 = getelementptr inbounds nuw i8, ptr %in, i32 16, !dbg !2370
  %4 = load i64, ptr %arrayidx.2, align 8, !dbg !2370
  %and.2 = and i64 %4, 1229782938247303441, !dbg !2373
    #dbg_value(i64 %and.2, !2374, !DIExpression(), !2375)
  %xor.2 = lshr i64 %4, 1, !dbg !2376
  %shr.2 = and i64 %xor.2, 8608480567731124087, !dbg !2376
  %mul.2 = mul nuw i64 %and.2, 9, !dbg !2377
  %xor2.2 = xor i64 %shr.2, %mul.2, !dbg !2378
  %arrayidx3.2 = getelementptr inbounds nuw i8, ptr %acc, i32 16, !dbg !2380
  %5 = load i64, ptr %arrayidx3.2, align 8, !dbg !2379
  %xor4.2 = xor i64 %5, %xor2.2, !dbg !2379
  store i64 %xor4.2, ptr %arrayidx3.2, align 8, !dbg !2379
    #dbg_value(i32 3, !2367, !DIExpression(), !2369)
  %arrayidx.3 = getelementptr inbounds nuw i8, ptr %in, i32 24, !dbg !2370
  %6 = load i64, ptr %arrayidx.3, align 8, !dbg !2370
  %and.3 = and i64 %6, 1229782938247303441, !dbg !2373
    #dbg_value(i64 %and.3, !2374, !DIExpression(), !2375)
  %xor.3 = lshr i64 %6, 1, !dbg !2376
  %shr.3 = and i64 %xor.3, 8608480567731124087, !dbg !2376
  %mul.3 = mul nuw i64 %and.3, 9, !dbg !2377
  %xor2.3 = xor i64 %shr.3, %mul.3, !dbg !2378
  %arrayidx3.3 = getelementptr inbounds nuw i8, ptr %acc, i32 24, !dbg !2380
  %7 = load i64, ptr %arrayidx3.3, align 8, !dbg !2379
  %xor4.3 = xor i64 %7, %xor2.3, !dbg !2379
  store i64 %xor4.3, ptr %arrayidx3.3, align 8, !dbg !2379
    #dbg_value(i32 4, !2367, !DIExpression(), !2369)
  %arrayidx.4 = getelementptr inbounds nuw i8, ptr %in, i32 32, !dbg !2370
  %8 = load i64, ptr %arrayidx.4, align 8, !dbg !2370
  %and.4 = and i64 %8, 1229782938247303441, !dbg !2373
    #dbg_value(i64 %and.4, !2374, !DIExpression(), !2375)
  %xor.4 = lshr i64 %8, 1, !dbg !2376
  %shr.4 = and i64 %xor.4, 8608480567731124087, !dbg !2376
  %mul.4 = mul nuw i64 %and.4, 9, !dbg !2377
  %xor2.4 = xor i64 %shr.4, %mul.4, !dbg !2378
  %arrayidx3.4 = getelementptr inbounds nuw i8, ptr %acc, i32 32, !dbg !2380
  %9 = load i64, ptr %arrayidx3.4, align 8, !dbg !2379
  %xor4.4 = xor i64 %9, %xor2.4, !dbg !2379
  store i64 %xor4.4, ptr %arrayidx3.4, align 8, !dbg !2379
    #dbg_value(i32 5, !2367, !DIExpression(), !2369)
  %arrayidx.5 = getelementptr inbounds nuw i8, ptr %in, i32 40, !dbg !2370
  %10 = load i64, ptr %arrayidx.5, align 8, !dbg !2370
  %and.5 = and i64 %10, 1229782938247303441, !dbg !2373
    #dbg_value(i64 %and.5, !2374, !DIExpression(), !2375)
  %xor.5 = lshr i64 %10, 1, !dbg !2376
  %shr.5 = and i64 %xor.5, 8608480567731124087, !dbg !2376
  %mul.5 = mul nuw i64 %and.5, 9, !dbg !2377
  %xor2.5 = xor i64 %shr.5, %mul.5, !dbg !2378
  %arrayidx3.5 = getelementptr inbounds nuw i8, ptr %acc, i32 40, !dbg !2380
  %11 = load i64, ptr %arrayidx3.5, align 8, !dbg !2379
  %xor4.5 = xor i64 %11, %xor2.5, !dbg !2379
  store i64 %xor4.5, ptr %arrayidx3.5, align 8, !dbg !2379
    #dbg_value(i32 6, !2367, !DIExpression(), !2369)
  %arrayidx.6 = getelementptr inbounds nuw i8, ptr %in, i32 48, !dbg !2370
  %12 = load i64, ptr %arrayidx.6, align 8, !dbg !2370
  %and.6 = and i64 %12, 1229782938247303441, !dbg !2373
    #dbg_value(i64 %and.6, !2374, !DIExpression(), !2375)
  %xor.6 = lshr i64 %12, 1, !dbg !2376
  %shr.6 = and i64 %xor.6, 8608480567731124087, !dbg !2376
  %mul.6 = mul nuw i64 %and.6, 9, !dbg !2377
  %xor2.6 = xor i64 %shr.6, %mul.6, !dbg !2378
  %arrayidx3.6 = getelementptr inbounds nuw i8, ptr %acc, i32 48, !dbg !2380
  %13 = load i64, ptr %arrayidx3.6, align 8, !dbg !2379
  %xor4.6 = xor i64 %13, %xor2.6, !dbg !2379
  store i64 %xor4.6, ptr %arrayidx3.6, align 8, !dbg !2379
    #dbg_value(i32 7, !2367, !DIExpression(), !2369)
  ret void, !dbg !2381
}

; Function Attrs: nounwind
define internal fastcc void @m_vec_mul_add_x(i32 noundef %m_vec_limbs, ptr noundef %in, ptr noundef %acc) unnamed_addr #0 !dbg !2382 {
entry:
    #dbg_value(i32 %m_vec_limbs, !2383, !DIExpression(), !2384)
    #dbg_value(ptr %in, !2385, !DIExpression(), !2384)
    #dbg_value(ptr %acc, !2386, !DIExpression(), !2384)
    #dbg_value(i64 -8608480567731124088, !2387, !DIExpression(), !2384)
    #dbg_value(i32 0, !2388, !DIExpression(), !2390)
    #dbg_value(i32 0, !2388, !DIExpression(), !2390)
  %0 = load i64, ptr %in, align 8, !dbg !2391
    #dbg_value(i64 %0, !2394, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !2395)
  %xor = shl i64 %0, 1, !dbg !2396
  %shl = and i64 %xor, -1229782938247303442, !dbg !2396
  %and = lshr i64 %0, 3, !dbg !2397
  %shr = and i64 %and, 1229782938247303441, !dbg !2397
  %mul = mul nuw nsw i64 %shr, 3, !dbg !2398
  %xor2 = xor i64 %shl, %mul, !dbg !2399
  %1 = load i64, ptr %acc, align 8, !dbg !2400
  %xor4 = xor i64 %1, %xor2, !dbg !2400
  store i64 %xor4, ptr %acc, align 8, !dbg !2400
    #dbg_value(i32 1, !2388, !DIExpression(), !2390)
  %arrayidx.1 = getelementptr inbounds nuw i8, ptr %in, i32 8, !dbg !2391
  %2 = load i64, ptr %arrayidx.1, align 8, !dbg !2391
    #dbg_value(i64 %2, !2394, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !2395)
  %xor.1 = shl i64 %2, 1, !dbg !2396
  %shl.1 = and i64 %xor.1, -1229782938247303442, !dbg !2396
  %and.1 = lshr i64 %2, 3, !dbg !2397
  %shr.1 = and i64 %and.1, 1229782938247303441, !dbg !2397
  %mul.1 = mul nuw nsw i64 %shr.1, 3, !dbg !2398
  %xor2.1 = xor i64 %shl.1, %mul.1, !dbg !2399
  %arrayidx3.1 = getelementptr inbounds nuw i8, ptr %acc, i32 8, !dbg !2401
  %3 = load i64, ptr %arrayidx3.1, align 8, !dbg !2400
  %xor4.1 = xor i64 %3, %xor2.1, !dbg !2400
  store i64 %xor4.1, ptr %arrayidx3.1, align 8, !dbg !2400
    #dbg_value(i32 2, !2388, !DIExpression(), !2390)
  %arrayidx.2 = getelementptr inbounds nuw i8, ptr %in, i32 16, !dbg !2391
  %4 = load i64, ptr %arrayidx.2, align 8, !dbg !2391
    #dbg_value(i64 %4, !2394, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !2395)
  %xor.2 = shl i64 %4, 1, !dbg !2396
  %shl.2 = and i64 %xor.2, -1229782938247303442, !dbg !2396
  %and.2 = lshr i64 %4, 3, !dbg !2397
  %shr.2 = and i64 %and.2, 1229782938247303441, !dbg !2397
  %mul.2 = mul nuw nsw i64 %shr.2, 3, !dbg !2398
  %xor2.2 = xor i64 %shl.2, %mul.2, !dbg !2399
  %arrayidx3.2 = getelementptr inbounds nuw i8, ptr %acc, i32 16, !dbg !2401
  %5 = load i64, ptr %arrayidx3.2, align 8, !dbg !2400
  %xor4.2 = xor i64 %5, %xor2.2, !dbg !2400
  store i64 %xor4.2, ptr %arrayidx3.2, align 8, !dbg !2400
    #dbg_value(i32 3, !2388, !DIExpression(), !2390)
  %arrayidx.3 = getelementptr inbounds nuw i8, ptr %in, i32 24, !dbg !2391
  %6 = load i64, ptr %arrayidx.3, align 8, !dbg !2391
    #dbg_value(i64 %6, !2394, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !2395)
  %xor.3 = shl i64 %6, 1, !dbg !2396
  %shl.3 = and i64 %xor.3, -1229782938247303442, !dbg !2396
  %and.3 = lshr i64 %6, 3, !dbg !2397
  %shr.3 = and i64 %and.3, 1229782938247303441, !dbg !2397
  %mul.3 = mul nuw nsw i64 %shr.3, 3, !dbg !2398
  %xor2.3 = xor i64 %shl.3, %mul.3, !dbg !2399
  %arrayidx3.3 = getelementptr inbounds nuw i8, ptr %acc, i32 24, !dbg !2401
  %7 = load i64, ptr %arrayidx3.3, align 8, !dbg !2400
  %xor4.3 = xor i64 %7, %xor2.3, !dbg !2400
  store i64 %xor4.3, ptr %arrayidx3.3, align 8, !dbg !2400
    #dbg_value(i32 4, !2388, !DIExpression(), !2390)
  %arrayidx.4 = getelementptr inbounds nuw i8, ptr %in, i32 32, !dbg !2391
  %8 = load i64, ptr %arrayidx.4, align 8, !dbg !2391
    #dbg_value(i64 %8, !2394, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !2395)
  %xor.4 = shl i64 %8, 1, !dbg !2396
  %shl.4 = and i64 %xor.4, -1229782938247303442, !dbg !2396
  %and.4 = lshr i64 %8, 3, !dbg !2397
  %shr.4 = and i64 %and.4, 1229782938247303441, !dbg !2397
  %mul.4 = mul nuw nsw i64 %shr.4, 3, !dbg !2398
  %xor2.4 = xor i64 %shl.4, %mul.4, !dbg !2399
  %arrayidx3.4 = getelementptr inbounds nuw i8, ptr %acc, i32 32, !dbg !2401
  %9 = load i64, ptr %arrayidx3.4, align 8, !dbg !2400
  %xor4.4 = xor i64 %9, %xor2.4, !dbg !2400
  store i64 %xor4.4, ptr %arrayidx3.4, align 8, !dbg !2400
    #dbg_value(i32 5, !2388, !DIExpression(), !2390)
  %arrayidx.5 = getelementptr inbounds nuw i8, ptr %in, i32 40, !dbg !2391
  %10 = load i64, ptr %arrayidx.5, align 8, !dbg !2391
    #dbg_value(i64 %10, !2394, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !2395)
  %xor.5 = shl i64 %10, 1, !dbg !2396
  %shl.5 = and i64 %xor.5, -1229782938247303442, !dbg !2396
  %and.5 = lshr i64 %10, 3, !dbg !2397
  %shr.5 = and i64 %and.5, 1229782938247303441, !dbg !2397
  %mul.5 = mul nuw nsw i64 %shr.5, 3, !dbg !2398
  %xor2.5 = xor i64 %shl.5, %mul.5, !dbg !2399
  %arrayidx3.5 = getelementptr inbounds nuw i8, ptr %acc, i32 40, !dbg !2401
  %11 = load i64, ptr %arrayidx3.5, align 8, !dbg !2400
  %xor4.5 = xor i64 %11, %xor2.5, !dbg !2400
  store i64 %xor4.5, ptr %arrayidx3.5, align 8, !dbg !2400
    #dbg_value(i32 6, !2388, !DIExpression(), !2390)
  %arrayidx.6 = getelementptr inbounds nuw i8, ptr %in, i32 48, !dbg !2391
  %12 = load i64, ptr %arrayidx.6, align 8, !dbg !2391
    #dbg_value(i64 %12, !2394, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !2395)
  %xor.6 = shl i64 %12, 1, !dbg !2396
  %shl.6 = and i64 %xor.6, -1229782938247303442, !dbg !2396
  %and.6 = lshr i64 %12, 3, !dbg !2397
  %shr.6 = and i64 %and.6, 1229782938247303441, !dbg !2397
  %mul.6 = mul nuw nsw i64 %shr.6, 3, !dbg !2398
  %xor2.6 = xor i64 %shl.6, %mul.6, !dbg !2399
  %arrayidx3.6 = getelementptr inbounds nuw i8, ptr %acc, i32 48, !dbg !2401
  %13 = load i64, ptr %arrayidx3.6, align 8, !dbg !2400
  %xor4.6 = xor i64 %13, %xor2.6, !dbg !2400
  store i64 %xor4.6, ptr %arrayidx3.6, align 8, !dbg !2400
    #dbg_value(i32 7, !2388, !DIExpression(), !2390)
  ret void, !dbg !2402
}

; Function Attrs: nounwind
define internal fastcc void @m_vec_copy(i32 noundef %m_vec_limbs, ptr noundef %in, ptr noundef %out) unnamed_addr #0 !dbg !2403 {
entry:
    #dbg_value(i32 %m_vec_limbs, !2404, !DIExpression(), !2405)
    #dbg_value(ptr %in, !2406, !DIExpression(), !2405)
    #dbg_value(ptr %out, !2407, !DIExpression(), !2405)
    #dbg_value(i32 0, !2408, !DIExpression(), !2410)
    #dbg_value(i32 0, !2408, !DIExpression(), !2410)
  %0 = load i64, ptr %in, align 8, !dbg !2411
  store i64 %0, ptr %out, align 8, !dbg !2414
    #dbg_value(i32 1, !2408, !DIExpression(), !2410)
  %arrayidx.1 = getelementptr inbounds nuw i8, ptr %in, i32 8, !dbg !2411
  %1 = load i64, ptr %arrayidx.1, align 8, !dbg !2411
  %arrayidx1.1 = getelementptr inbounds nuw i8, ptr %out, i32 8, !dbg !2415
  store i64 %1, ptr %arrayidx1.1, align 8, !dbg !2414
    #dbg_value(i32 2, !2408, !DIExpression(), !2410)
  %arrayidx.2 = getelementptr inbounds nuw i8, ptr %in, i32 16, !dbg !2411
  %2 = load i64, ptr %arrayidx.2, align 8, !dbg !2411
  %arrayidx1.2 = getelementptr inbounds nuw i8, ptr %out, i32 16, !dbg !2415
  store i64 %2, ptr %arrayidx1.2, align 8, !dbg !2414
    #dbg_value(i32 3, !2408, !DIExpression(), !2410)
  %arrayidx.3 = getelementptr inbounds nuw i8, ptr %in, i32 24, !dbg !2411
  %3 = load i64, ptr %arrayidx.3, align 8, !dbg !2411
  %arrayidx1.3 = getelementptr inbounds nuw i8, ptr %out, i32 24, !dbg !2415
  store i64 %3, ptr %arrayidx1.3, align 8, !dbg !2414
    #dbg_value(i32 4, !2408, !DIExpression(), !2410)
  %arrayidx.4 = getelementptr inbounds nuw i8, ptr %in, i32 32, !dbg !2411
  %4 = load i64, ptr %arrayidx.4, align 8, !dbg !2411
  %arrayidx1.4 = getelementptr inbounds nuw i8, ptr %out, i32 32, !dbg !2415
  store i64 %4, ptr %arrayidx1.4, align 8, !dbg !2414
    #dbg_value(i32 5, !2408, !DIExpression(), !2410)
  %arrayidx.5 = getelementptr inbounds nuw i8, ptr %in, i32 40, !dbg !2411
  %5 = load i64, ptr %arrayidx.5, align 8, !dbg !2411
  %arrayidx1.5 = getelementptr inbounds nuw i8, ptr %out, i32 40, !dbg !2415
  store i64 %5, ptr %arrayidx1.5, align 8, !dbg !2414
    #dbg_value(i32 6, !2408, !DIExpression(), !2410)
  %arrayidx.6 = getelementptr inbounds nuw i8, ptr %in, i32 48, !dbg !2411
  %6 = load i64, ptr %arrayidx.6, align 8, !dbg !2411
  %arrayidx1.6 = getelementptr inbounds nuw i8, ptr %out, i32 48, !dbg !2415
  store i64 %6, ptr %arrayidx1.6, align 8, !dbg !2414
    #dbg_value(i32 7, !2408, !DIExpression(), !2410)
  ret void, !dbg !2416
}

; Function Attrs: nounwind
define dso_local void @pqmayo_MAYO_3_ref_m_upper(ptr noundef %p, ptr noundef %in, ptr noundef %out, i32 noundef %size) local_unnamed_addr #0 !dbg !2417 {
entry:
    #dbg_value(ptr %p, !2448, !DIExpression(), !2449)
    #dbg_value(ptr %in, !2450, !DIExpression(), !2449)
    #dbg_value(ptr %out, !2451, !DIExpression(), !2449)
    #dbg_value(i32 %size, !2452, !DIExpression(), !2449)
    #dbg_value(i32 7, !2453, !DIExpression(), !2449)
    #dbg_value(i32 0, !2454, !DIExpression(), !2449)
    #dbg_value(i32 0, !2455, !DIExpression(), !2457)
  %smax = call i32 @llvm.smax.i32(i32 %size, i32 0), !dbg !2458
  br label %for.cond, !dbg !2458

for.cond:                                         ; preds = %for.inc15, %entry
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.inc15 ], [ %size, %entry ], !dbg !2459
  %m_vecs_stored.0 = phi i32 [ %m_vecs_stored.1, %for.inc15 ], [ 0, %entry ], !dbg !2459
  %r.0 = phi i32 [ %inc16, %for.inc15 ], [ 0, %entry ], !dbg !2460
    #dbg_value(i32 %r.0, !2455, !DIExpression(), !2457)
    #dbg_value(i32 %m_vecs_stored.0, !2454, !DIExpression(), !2449)
  %exitcond1.not = icmp eq i32 %r.0, %smax, !dbg !2461
  br i1 %exitcond1.not, label %for.end17, label %for.cond1.preheader, !dbg !2463

for.cond1.preheader:                              ; preds = %for.cond
  %0 = add i32 %m_vecs_stored.0, %indvars.iv, !dbg !2464
  br label %for.cond1, !dbg !2464

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc
  %m_vecs_stored.1 = phi i32 [ %inc, %for.inc ], [ %m_vecs_stored.0, %for.cond1.preheader ], !dbg !2449
  %c.0 = phi i32 [ %inc14, %for.inc ], [ %r.0, %for.cond1.preheader ], !dbg !2467
    #dbg_value(i32 %c.0, !2468, !DIExpression(), !2469)
    #dbg_value(i32 %m_vecs_stored.1, !2454, !DIExpression(), !2449)
  %exitcond.not = icmp eq i32 %m_vecs_stored.1, %0, !dbg !2470
  br i1 %exitcond.not, label %for.inc15, label %for.body3, !dbg !2464

for.body3:                                        ; preds = %for.cond1
  %mul = mul nsw i32 %r.0, %size, !dbg !2472
  %add = add nsw i32 %mul, %c.0, !dbg !2474
  %add.ptr.idx = mul nsw i32 %add, 56, !dbg !2475
  %add.ptr = getelementptr inbounds i8, ptr %in, i32 %add.ptr.idx, !dbg !2475
  %add.ptr6.idx = mul nsw i32 %m_vecs_stored.1, 56, !dbg !2476
  %add.ptr6 = getelementptr inbounds i8, ptr %out, i32 %add.ptr6.idx, !dbg !2476
  call fastcc void @m_vec_copy.17(i32 noundef 7, ptr noundef %add.ptr, ptr noundef %add.ptr6) #6, !dbg !2477
  %cmp7.not = icmp eq i32 %r.0, %c.0, !dbg !2478
  br i1 %cmp7.not, label %for.inc, label %if.then, !dbg !2478

if.then:                                          ; preds = %for.body3
  %mul8 = mul nsw i32 %c.0, %size, !dbg !2480
  %add9 = add nsw i32 %mul8, %r.0, !dbg !2482
  %add.ptr11.idx = mul nsw i32 %add9, 56, !dbg !2483
  %add.ptr11 = getelementptr inbounds i8, ptr %in, i32 %add.ptr11.idx, !dbg !2483
  %add.ptr13.idx = mul nsw i32 %m_vecs_stored.1, 56, !dbg !2484
  %add.ptr13 = getelementptr inbounds i8, ptr %out, i32 %add.ptr13.idx, !dbg !2484
  call fastcc void @m_vec_add.18(i32 noundef 7, ptr noundef %add.ptr11, ptr noundef %add.ptr13) #6, !dbg !2485
  br label %for.inc, !dbg !2486

for.inc:                                          ; preds = %for.body3, %if.then
    #dbg_value(i32 %m_vecs_stored.1, !2454, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2449)
  %inc = add i32 %m_vecs_stored.1, 1, !dbg !2487
    #dbg_value(i32 %inc, !2454, !DIExpression(), !2449)
  %inc14 = add nuw nsw i32 %c.0, 1, !dbg !2488
    #dbg_value(i32 %inc14, !2468, !DIExpression(), !2469)
  br label %for.cond1, !dbg !2489, !llvm.loop !2490

for.inc15:                                        ; preds = %for.cond1
  %inc16 = add nuw i32 %r.0, 1, !dbg !2492
    #dbg_value(i32 %inc16, !2455, !DIExpression(), !2457)
  %indvars.iv.next = add i32 %indvars.iv, -1, !dbg !2493
  br label %for.cond, !dbg !2493, !llvm.loop !2494

for.end17:                                        ; preds = %for.cond
  ret void, !dbg !2496
}

; Function Attrs: nounwind
define internal fastcc void @m_vec_copy.17(i32 noundef %m_vec_limbs, ptr noundef %in, ptr noundef %out) unnamed_addr #0 !dbg !2497 {
entry:
    #dbg_value(i32 %m_vec_limbs, !2498, !DIExpression(), !2499)
    #dbg_value(ptr %in, !2500, !DIExpression(), !2499)
    #dbg_value(ptr %out, !2501, !DIExpression(), !2499)
    #dbg_value(i32 0, !2502, !DIExpression(), !2504)
    #dbg_value(i32 0, !2502, !DIExpression(), !2504)
  %0 = load i64, ptr %in, align 8, !dbg !2505
  store i64 %0, ptr %out, align 8, !dbg !2508
    #dbg_value(i32 1, !2502, !DIExpression(), !2504)
  %arrayidx.1 = getelementptr inbounds nuw i8, ptr %in, i32 8, !dbg !2505
  %1 = load i64, ptr %arrayidx.1, align 8, !dbg !2505
  %arrayidx1.1 = getelementptr inbounds nuw i8, ptr %out, i32 8, !dbg !2509
  store i64 %1, ptr %arrayidx1.1, align 8, !dbg !2508
    #dbg_value(i32 2, !2502, !DIExpression(), !2504)
  %arrayidx.2 = getelementptr inbounds nuw i8, ptr %in, i32 16, !dbg !2505
  %2 = load i64, ptr %arrayidx.2, align 8, !dbg !2505
  %arrayidx1.2 = getelementptr inbounds nuw i8, ptr %out, i32 16, !dbg !2509
  store i64 %2, ptr %arrayidx1.2, align 8, !dbg !2508
    #dbg_value(i32 3, !2502, !DIExpression(), !2504)
  %arrayidx.3 = getelementptr inbounds nuw i8, ptr %in, i32 24, !dbg !2505
  %3 = load i64, ptr %arrayidx.3, align 8, !dbg !2505
  %arrayidx1.3 = getelementptr inbounds nuw i8, ptr %out, i32 24, !dbg !2509
  store i64 %3, ptr %arrayidx1.3, align 8, !dbg !2508
    #dbg_value(i32 4, !2502, !DIExpression(), !2504)
  %arrayidx.4 = getelementptr inbounds nuw i8, ptr %in, i32 32, !dbg !2505
  %4 = load i64, ptr %arrayidx.4, align 8, !dbg !2505
  %arrayidx1.4 = getelementptr inbounds nuw i8, ptr %out, i32 32, !dbg !2509
  store i64 %4, ptr %arrayidx1.4, align 8, !dbg !2508
    #dbg_value(i32 5, !2502, !DIExpression(), !2504)
  %arrayidx.5 = getelementptr inbounds nuw i8, ptr %in, i32 40, !dbg !2505
  %5 = load i64, ptr %arrayidx.5, align 8, !dbg !2505
  %arrayidx1.5 = getelementptr inbounds nuw i8, ptr %out, i32 40, !dbg !2509
  store i64 %5, ptr %arrayidx1.5, align 8, !dbg !2508
    #dbg_value(i32 6, !2502, !DIExpression(), !2504)
  %arrayidx.6 = getelementptr inbounds nuw i8, ptr %in, i32 48, !dbg !2505
  %6 = load i64, ptr %arrayidx.6, align 8, !dbg !2505
  %arrayidx1.6 = getelementptr inbounds nuw i8, ptr %out, i32 48, !dbg !2509
  store i64 %6, ptr %arrayidx1.6, align 8, !dbg !2508
    #dbg_value(i32 7, !2502, !DIExpression(), !2504)
  ret void, !dbg !2510
}

; Function Attrs: nounwind
define internal fastcc void @m_vec_add.18(i32 noundef %m_vec_limbs, ptr noundef %in, ptr noundef %acc) unnamed_addr #0 !dbg !2511 {
entry:
    #dbg_value(i32 %m_vec_limbs, !2512, !DIExpression(), !2513)
    #dbg_value(ptr %in, !2514, !DIExpression(), !2513)
    #dbg_value(ptr %acc, !2515, !DIExpression(), !2513)
    #dbg_value(i32 0, !2516, !DIExpression(), !2518)
    #dbg_value(i32 0, !2516, !DIExpression(), !2518)
  %0 = load i64, ptr %in, align 8, !dbg !2519
  %1 = load i64, ptr %acc, align 8, !dbg !2522
  %xor = xor i64 %1, %0, !dbg !2522
  store i64 %xor, ptr %acc, align 8, !dbg !2522
    #dbg_value(i32 1, !2516, !DIExpression(), !2518)
  %arrayidx.1 = getelementptr inbounds nuw i8, ptr %in, i32 8, !dbg !2519
  %2 = load i64, ptr %arrayidx.1, align 8, !dbg !2519
  %arrayidx1.1 = getelementptr inbounds nuw i8, ptr %acc, i32 8, !dbg !2523
  %3 = load i64, ptr %arrayidx1.1, align 8, !dbg !2522
  %xor.1 = xor i64 %3, %2, !dbg !2522
  store i64 %xor.1, ptr %arrayidx1.1, align 8, !dbg !2522
    #dbg_value(i32 2, !2516, !DIExpression(), !2518)
  %arrayidx.2 = getelementptr inbounds nuw i8, ptr %in, i32 16, !dbg !2519
  %4 = load i64, ptr %arrayidx.2, align 8, !dbg !2519
  %arrayidx1.2 = getelementptr inbounds nuw i8, ptr %acc, i32 16, !dbg !2523
  %5 = load i64, ptr %arrayidx1.2, align 8, !dbg !2522
  %xor.2 = xor i64 %5, %4, !dbg !2522
  store i64 %xor.2, ptr %arrayidx1.2, align 8, !dbg !2522
    #dbg_value(i32 3, !2516, !DIExpression(), !2518)
  %arrayidx.3 = getelementptr inbounds nuw i8, ptr %in, i32 24, !dbg !2519
  %6 = load i64, ptr %arrayidx.3, align 8, !dbg !2519
  %arrayidx1.3 = getelementptr inbounds nuw i8, ptr %acc, i32 24, !dbg !2523
  %7 = load i64, ptr %arrayidx1.3, align 8, !dbg !2522
  %xor.3 = xor i64 %7, %6, !dbg !2522
  store i64 %xor.3, ptr %arrayidx1.3, align 8, !dbg !2522
    #dbg_value(i32 4, !2516, !DIExpression(), !2518)
  %arrayidx.4 = getelementptr inbounds nuw i8, ptr %in, i32 32, !dbg !2519
  %8 = load i64, ptr %arrayidx.4, align 8, !dbg !2519
  %arrayidx1.4 = getelementptr inbounds nuw i8, ptr %acc, i32 32, !dbg !2523
  %9 = load i64, ptr %arrayidx1.4, align 8, !dbg !2522
  %xor.4 = xor i64 %9, %8, !dbg !2522
  store i64 %xor.4, ptr %arrayidx1.4, align 8, !dbg !2522
    #dbg_value(i32 5, !2516, !DIExpression(), !2518)
  %arrayidx.5 = getelementptr inbounds nuw i8, ptr %in, i32 40, !dbg !2519
  %10 = load i64, ptr %arrayidx.5, align 8, !dbg !2519
  %arrayidx1.5 = getelementptr inbounds nuw i8, ptr %acc, i32 40, !dbg !2523
  %11 = load i64, ptr %arrayidx1.5, align 8, !dbg !2522
  %xor.5 = xor i64 %11, %10, !dbg !2522
  store i64 %xor.5, ptr %arrayidx1.5, align 8, !dbg !2522
    #dbg_value(i32 6, !2516, !DIExpression(), !2518)
  %arrayidx.6 = getelementptr inbounds nuw i8, ptr %in, i32 48, !dbg !2519
  %12 = load i64, ptr %arrayidx.6, align 8, !dbg !2519
  %arrayidx1.6 = getelementptr inbounds nuw i8, ptr %acc, i32 48, !dbg !2523
  %13 = load i64, ptr %arrayidx1.6, align 8, !dbg !2522
  %xor.6 = xor i64 %13, %12, !dbg !2522
  store i64 %xor.6, ptr %arrayidx1.6, align 8, !dbg !2522
    #dbg_value(i32 7, !2516, !DIExpression(), !2518)
  ret void, !dbg !2524
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqmayo_MAYO_3_ref_sample_solution(ptr noundef %p, ptr noundef %A, ptr noundef %y, ptr noundef %r, ptr noundef %x, i32 noundef %k, i32 noundef %o, i32 noundef %m, i32 noundef %A_cols) local_unnamed_addr #0 !dbg !2525 {
entry:
  %Ar = alloca [108 x i8], align 1
    #dbg_value(ptr %p, !2528, !DIExpression(), !2529)
    #dbg_value(ptr %A, !2530, !DIExpression(), !2529)
    #dbg_value(ptr %y, !2531, !DIExpression(), !2529)
    #dbg_value(ptr %r, !2532, !DIExpression(), !2529)
    #dbg_value(ptr %x, !2533, !DIExpression(), !2529)
    #dbg_value(i32 %k, !2534, !DIExpression(), !2529)
    #dbg_value(i32 %o, !2535, !DIExpression(), !2529)
    #dbg_value(i32 %m, !2536, !DIExpression(), !2529)
    #dbg_value(i32 %A_cols, !2537, !DIExpression(), !2529)
    #dbg_value(i32 0, !2538, !DIExpression(), !2540)
  %0 = mul nsw i32 %o, %k, !dbg !2541
  %smax = call i32 @llvm.smax.i32(i32 %0, i32 0), !dbg !2541
  br label %for.cond, !dbg !2541

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2542
    #dbg_value(i32 %i.0, !2538, !DIExpression(), !2540)
  %exitcond.not = icmp eq i32 %i.0, %smax, !dbg !2543
  br i1 %exitcond.not, label %for.cond3.preheader, label %for.body, !dbg !2545

for.cond3.preheader:                              ; preds = %for.cond
  %smax13 = call i32 @llvm.smax.i32(i32 %m, i32 0), !dbg !2546
  br label %for.cond3, !dbg !2546

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !2548
  %1 = load i8, ptr %arrayidx, align 1, !dbg !2548
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !2550
  store i8 %1, ptr %arrayidx1, align 1, !dbg !2551
  %inc = add nuw i32 %i.0, 1, !dbg !2552
    #dbg_value(i32 %inc, !2538, !DIExpression(), !2540)
  br label %for.cond, !dbg !2553, !llvm.loop !2554

for.cond3:                                        ; preds = %for.cond3.preheader, %for.body5
  %i2.0 = phi i32 [ %inc12, %for.body5 ], [ 0, %for.cond3.preheader ], !dbg !2556
    #dbg_value(i32 %i2.0, !2557, !DIExpression(), !2558)
  %exitcond14.not = icmp eq i32 %i2.0, %smax13, !dbg !2559
  br i1 %exitcond14.not, label %for.end13, label %for.body5, !dbg !2546

for.body5:                                        ; preds = %for.cond3
  %mul6 = mul nsw i32 %k, %o, !dbg !2561
  %mul7 = mul nsw i32 %k, %o, !dbg !2563
  %add = add nsw i32 %mul7, 1, !dbg !2564
  %mul8 = mul nsw i32 %i2.0, %add, !dbg !2565
  %2 = getelementptr i8, ptr %A, i32 %mul6, !dbg !2566
  %arrayidx10 = getelementptr i8, ptr %2, i32 %mul8, !dbg !2566
  store i8 0, ptr %arrayidx10, align 1, !dbg !2567
  %inc12 = add nuw i32 %i2.0, 1, !dbg !2568
    #dbg_value(i32 %inc12, !2557, !DIExpression(), !2558)
  br label %for.cond3, !dbg !2569, !llvm.loop !2570

for.end13:                                        ; preds = %for.cond3
  %mul14 = mul nsw i32 %k, %o, !dbg !2572
  %add15 = add nsw i32 %mul14, 1, !dbg !2573
  call fastcc void @mat_mul.21(ptr noundef %A, ptr noundef %r, ptr noundef nonnull %Ar, i32 noundef %add15, i32 noundef %m, i32 noundef 1) #6, !dbg !2574
    #dbg_value(i32 0, !2575, !DIExpression(), !2577)
  br label %for.cond17, !dbg !2578

for.cond17:                                       ; preds = %for.body19, %for.end13
  %i16.0 = phi i32 [ 0, %for.end13 ], [ %inc29, %for.body19 ], !dbg !2579
    #dbg_value(i32 %i16.0, !2575, !DIExpression(), !2577)
  %exitcond15.not = icmp eq i32 %i16.0, %smax13, !dbg !2580
  br i1 %exitcond15.not, label %for.end30, label %for.body19, !dbg !2582

for.body19:                                       ; preds = %for.cond17
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %y, i32 %i16.0, !dbg !2583
  %3 = load i8, ptr %arrayidx20, align 1, !dbg !2583
  %arrayidx21 = getelementptr inbounds nuw [108 x i8], ptr %Ar, i32 0, i32 %i16.0, !dbg !2585
  %4 = load i8, ptr %arrayidx21, align 1, !dbg !2585
  %call = call fastcc zeroext i8 @sub_f(i8 noundef zeroext %3, i8 noundef zeroext %4) #6, !dbg !2586
  %mul22 = mul nsw i32 %k, %o, !dbg !2587
  %mul23 = mul nsw i32 %k, %o, !dbg !2588
  %add24 = add nsw i32 %mul23, 1, !dbg !2589
  %mul25 = mul nsw i32 %i16.0, %add24, !dbg !2590
  %5 = getelementptr i8, ptr %A, i32 %mul22, !dbg !2591
  %arrayidx27 = getelementptr i8, ptr %5, i32 %mul25, !dbg !2591
  store i8 %call, ptr %arrayidx27, align 1, !dbg !2592
  %inc29 = add nuw i32 %i16.0, 1, !dbg !2593
    #dbg_value(i32 %inc29, !2575, !DIExpression(), !2577)
  br label %for.cond17, !dbg !2594, !llvm.loop !2595

for.end30:                                        ; preds = %for.cond17
  %mul31 = mul nsw i32 %k, %o, !dbg !2597
  %add32 = add nsw i32 %mul31, 1, !dbg !2598
  call fastcc void @EF(ptr noundef %A, i32 noundef %m, i32 noundef %add32) #6, !dbg !2599
    #dbg_value(i8 0, !2600, !DIExpression(), !2529)
    #dbg_value(i32 0, !2601, !DIExpression(), !2603)
  %6 = add i32 %A_cols, -1, !dbg !2604
  %smax16 = call i32 @llvm.smax.i32(i32 %6, i32 0), !dbg !2604
  br label %for.cond34, !dbg !2604

for.cond34:                                       ; preds = %for.inc43, %for.end30
  %full_rank.0 = phi i8 [ 0, %for.end30 ], [ %or12, %for.inc43 ], !dbg !2529
  %i33.0 = phi i32 [ 0, %for.end30 ], [ %inc44, %for.inc43 ], !dbg !2605
    #dbg_value(i32 %i33.0, !2601, !DIExpression(), !2603)
    #dbg_value(i8 %full_rank.0, !2600, !DIExpression(), !2529)
  %exitcond17.not = icmp eq i32 %i33.0, %smax16, !dbg !2606
  br i1 %exitcond17.not, label %for.end45, label %for.inc43, !dbg !2608

for.inc43:                                        ; preds = %for.cond34
    #dbg_value(!DIArgList(i8 poison, i8 poison), !2600, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !2529)
  %sub37 = add nsw i32 %m, -1, !dbg !2609
  %mul38 = mul nsw i32 %sub37, %A_cols, !dbg !2611
  %7 = getelementptr i8, ptr %A, i32 %mul38, !dbg !2612
  %arrayidx40 = getelementptr i8, ptr %7, i32 %i33.0, !dbg !2612
  %8 = load i8, ptr %arrayidx40, align 1, !dbg !2612
    #dbg_value(!DIArgList(i8 %full_rank.0, i8 %8), !2600, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !2529)
  %or12 = or i8 %full_rank.0, %8, !dbg !2613
    #dbg_value(i8 %or12, !2600, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !2529)
    #dbg_value(i8 %or12, !2600, !DIExpression(), !2529)
  %inc44 = add nuw i32 %i33.0, 1, !dbg !2614
    #dbg_value(i32 %inc44, !2601, !DIExpression(), !2603)
  br label %for.cond34, !dbg !2615, !llvm.loop !2616

for.end45:                                        ; preds = %for.cond34
  %cmp47 = icmp eq i8 %full_rank.0, 0, !dbg !2618
  br i1 %cmp47, label %return, label %for.cond50, !dbg !2618

for.cond50:                                       ; preds = %for.cond63, %for.end45
  %row.0.in = phi i32 [ %m, %for.end45 ], [ %row.0, %for.cond63 ]
  %row.0 = add nsw i32 %row.0.in, -1, !dbg !2620
    #dbg_value(i32 %row.0, !2622, !DIExpression(), !2623)
  %cmp51 = icmp sgt i32 %row.0.in, 0, !dbg !2624
  br i1 %cmp51, label %for.body53, label %return, !dbg !2626

for.body53:                                       ; preds = %for.cond50
    #dbg_value(i8 0, !2627, !DIExpression(), !2529)
  %sub54 = sub nsw i32 %m, %row.0, !dbg !2628
  %div = sdiv i32 32, %sub54, !dbg !2628
  %add55 = add nsw i32 %row.0, %div, !dbg !2628
  %mul56 = mul nsw i32 %k, %o, !dbg !2628
  %cmp57 = icmp slt i32 %add55, %mul56, !dbg !2628
  br i1 %cmp57, label %cond.true, label %cond.false, !dbg !2628

cond.true:                                        ; preds = %for.body53
  %sub59 = sub nsw i32 %m, %row.0, !dbg !2628
  %div60 = sdiv i32 32, %sub59, !dbg !2628
  %add61 = add nsw i32 %row.0, %div60, !dbg !2628
  br label %cond.end, !dbg !2628

cond.false:                                       ; preds = %for.body53
  %mul62 = mul nsw i32 %k, %o, !dbg !2628
  br label %cond.end, !dbg !2628

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %add61, %cond.true ], [ %mul62, %cond.false ], !dbg !2628
    #dbg_value(i32 %cond, !2630, !DIExpression(), !2529)
    #dbg_value(i32 %row.0, !2631, !DIExpression(), !2633)
  br label %for.cond63, !dbg !2634

for.cond63:                                       ; preds = %for.inc229, %cond.end
  %finished.0 = phi i8 [ 0, %cond.end ], [ %or2273, %for.inc229 ], !dbg !2635
  %col.0 = phi i32 [ %row.0, %cond.end ], [ %inc230, %for.inc229 ], !dbg !2636
    #dbg_value(i32 %col.0, !2631, !DIExpression(), !2633)
    #dbg_value(i8 %finished.0, !2627, !DIExpression(), !2529)
  %cmp64.not = icmp sgt i32 %col.0, %cond, !dbg !2637
  br i1 %cmp64.not, label %for.cond50, label %for.body66, !dbg !2639, !llvm.loop !2640

for.body66:                                       ; preds = %for.cond63
  %mul67 = mul nsw i32 %row.0, %A_cols, !dbg !2642
  %9 = getelementptr i8, ptr %A, i32 %mul67, !dbg !2644
  %arrayidx69 = getelementptr i8, ptr %9, i32 %col.0, !dbg !2644
  %10 = load i8, ptr %arrayidx69, align 1, !dbg !2644
  %call70 = call fastcc zeroext i8 @ct_compare_8(i8 noundef zeroext %10, i8 noundef zeroext 0) #6, !dbg !2645
  %not = xor i8 %finished.0, -1, !dbg !2646
    #dbg_value(!DIArgList(i8 %call70, i8 %not), !2647, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_and, DW_OP_stack_value), !2529)
  %add76 = mul i32 %row.0.in, %A_cols, !dbg !2648
  %11 = getelementptr i8, ptr %A, i32 %add76, !dbg !2649
  %arrayidx78 = getelementptr i8, ptr %11, i32 -1, !dbg !2649
  %12 = load i8, ptr %arrayidx78, align 1, !dbg !2649
  %13 = and i8 %12, %not, !dbg !2650
  %and801 = and i8 %13, %call70, !dbg !2650
    #dbg_value(i8 %and801, !2651, !DIExpression(), !2652)
  %arrayidx83 = getelementptr inbounds i8, ptr %x, i32 %col.0, !dbg !2653
  %14 = load i8, ptr %arrayidx83, align 1, !dbg !2654
  %xor2 = xor i8 %14, %and801, !dbg !2654
  store i8 %xor2, ptr %arrayidx83, align 1, !dbg !2654
    #dbg_value(i32 0, !2655, !DIExpression(), !2657)
  br label %for.cond87, !dbg !2658

for.cond87:                                       ; preds = %for.body90, %for.body66
  %i86.0 = phi i32 [ 0, %for.body66 ], [ %add223, %for.body90 ], !dbg !2659
    #dbg_value(i32 %i86.0, !2655, !DIExpression(), !2657)
  %cmp88 = icmp slt i32 %i86.0, %row.0, !dbg !2660
  br i1 %cmp88, label %for.body90, label %for.inc229, !dbg !2662

for.body90:                                       ; preds = %for.cond87
  %mul91 = mul nsw i32 %i86.0, %A_cols, !dbg !2663
  %15 = getelementptr i8, ptr %A, i32 %mul91, !dbg !2665
  %arrayidx93 = getelementptr i8, ptr %15, i32 %col.0, !dbg !2665
  %16 = load i8, ptr %arrayidx93, align 1, !dbg !2665
  %conv94 = zext i8 %16 to i64, !dbg !2666
  %add95 = or disjoint i32 %i86.0, 1, !dbg !2667
  %mul96 = mul nsw i32 %add95, %A_cols, !dbg !2668
  %17 = getelementptr i8, ptr %A, i32 %mul96, !dbg !2669
  %arrayidx98 = getelementptr i8, ptr %17, i32 %col.0, !dbg !2669
  %18 = load i8, ptr %arrayidx98, align 1, !dbg !2669
  %conv99 = zext i8 %18 to i64, !dbg !2670
  %shl100 = shl nuw nsw i64 %conv99, 8, !dbg !2671
  %xor101 = or disjoint i64 %shl100, %conv94, !dbg !2672
  %add102 = or disjoint i32 %i86.0, 2, !dbg !2673
  %mul103 = mul nsw i32 %add102, %A_cols, !dbg !2674
  %19 = getelementptr i8, ptr %A, i32 %mul103, !dbg !2675
  %arrayidx105 = getelementptr i8, ptr %19, i32 %col.0, !dbg !2675
  %20 = load i8, ptr %arrayidx105, align 1, !dbg !2675
  %conv106 = zext i8 %20 to i64, !dbg !2676
  %shl107 = shl nuw nsw i64 %conv106, 16, !dbg !2677
  %xor108 = or disjoint i64 %xor101, %shl107, !dbg !2678
  %add109 = or disjoint i32 %i86.0, 3, !dbg !2679
  %mul110 = mul nsw i32 %add109, %A_cols, !dbg !2680
  %21 = getelementptr i8, ptr %A, i32 %mul110, !dbg !2681
  %arrayidx112 = getelementptr i8, ptr %21, i32 %col.0, !dbg !2681
  %22 = load i8, ptr %arrayidx112, align 1, !dbg !2681
  %conv113 = zext i8 %22 to i64, !dbg !2682
  %shl114 = shl nuw nsw i64 %conv113, 24, !dbg !2683
  %xor115 = or disjoint i64 %xor108, %shl114, !dbg !2684
  %add116 = or disjoint i32 %i86.0, 4, !dbg !2685
  %mul117 = mul nsw i32 %add116, %A_cols, !dbg !2686
  %23 = getelementptr i8, ptr %A, i32 %mul117, !dbg !2687
  %arrayidx119 = getelementptr i8, ptr %23, i32 %col.0, !dbg !2687
  %24 = load i8, ptr %arrayidx119, align 1, !dbg !2687
  %conv120 = zext i8 %24 to i64, !dbg !2688
  %shl121 = shl nuw nsw i64 %conv120, 32, !dbg !2689
  %xor122 = or disjoint i64 %xor115, %shl121, !dbg !2690
  %add123 = or disjoint i32 %i86.0, 5, !dbg !2691
  %mul124 = mul nsw i32 %add123, %A_cols, !dbg !2692
  %25 = getelementptr i8, ptr %A, i32 %mul124, !dbg !2693
  %arrayidx126 = getelementptr i8, ptr %25, i32 %col.0, !dbg !2693
  %26 = load i8, ptr %arrayidx126, align 1, !dbg !2693
  %conv127 = zext i8 %26 to i64, !dbg !2694
  %shl128 = shl nuw nsw i64 %conv127, 40, !dbg !2695
  %xor129 = xor i64 %xor122, %shl128, !dbg !2696
  %add130 = or disjoint i32 %i86.0, 6, !dbg !2697
  %mul131 = mul nsw i32 %add130, %A_cols, !dbg !2698
  %27 = getelementptr i8, ptr %A, i32 %mul131, !dbg !2699
  %arrayidx133 = getelementptr i8, ptr %27, i32 %col.0, !dbg !2699
  %28 = load i8, ptr %arrayidx133, align 1, !dbg !2699
  %conv134 = zext i8 %28 to i64, !dbg !2700
  %shl135 = shl nuw nsw i64 %conv134, 48, !dbg !2701
  %xor136 = xor i64 %xor129, %shl135, !dbg !2702
  %add137 = or disjoint i32 %i86.0, 7, !dbg !2703
  %mul138 = mul nsw i32 %add137, %A_cols, !dbg !2704
  %29 = getelementptr i8, ptr %A, i32 %mul138, !dbg !2705
  %arrayidx140 = getelementptr i8, ptr %29, i32 %col.0, !dbg !2705
  %30 = load i8, ptr %arrayidx140, align 1, !dbg !2705
  %conv141 = zext i8 %30 to i64, !dbg !2706
  %shl142 = shl nuw i64 %conv141, 56, !dbg !2707
  %xor143 = xor i64 %xor136, %shl142, !dbg !2708
    #dbg_value(i64 %xor143, !2709, !DIExpression(), !2710)
  %call144 = call fastcc i64 @mul_fx8(i8 noundef zeroext %and801, i64 noundef %xor143) #6, !dbg !2711
    #dbg_value(i64 %call144, !2709, !DIExpression(), !2710)
  %mul1464 = or disjoint i32 %i86.0, 1, !dbg !2712
  %add147 = mul i32 %mul1464, %A_cols, !dbg !2712
  %31 = getelementptr i8, ptr %A, i32 %add147, !dbg !2713
  %arrayidx149 = getelementptr i8, ptr %31, i32 -1, !dbg !2713
  %32 = load i8, ptr %arrayidx149, align 1, !dbg !2714
  %33 = trunc i64 %call144 to i8, !dbg !2714
  %34 = and i8 %33, 15, !dbg !2714
  %conv152 = xor i8 %34, %32, !dbg !2714
  store i8 %conv152, ptr %arrayidx149, align 1, !dbg !2714
  %shr = lshr i64 %call144, 8, !dbg !2715
  %mul1555 = or disjoint i32 %i86.0, 2, !dbg !2716
  %add156 = mul i32 %mul1555, %A_cols, !dbg !2716
  %35 = getelementptr i8, ptr %A, i32 %add156, !dbg !2717
  %arrayidx158 = getelementptr i8, ptr %35, i32 -1, !dbg !2717
  %36 = load i8, ptr %arrayidx158, align 1, !dbg !2718
  %37 = trunc i64 %shr to i8, !dbg !2718
  %38 = and i8 %37, 15, !dbg !2718
  %conv161 = xor i8 %38, %36, !dbg !2718
  store i8 %conv161, ptr %arrayidx158, align 1, !dbg !2718
  %shr162 = lshr i64 %call144, 16, !dbg !2719
  %mul1656 = or disjoint i32 %i86.0, 3, !dbg !2720
  %add166 = mul i32 %mul1656, %A_cols, !dbg !2720
  %39 = getelementptr i8, ptr %A, i32 %add166, !dbg !2721
  %arrayidx168 = getelementptr i8, ptr %39, i32 -1, !dbg !2721
  %40 = load i8, ptr %arrayidx168, align 1, !dbg !2722
  %41 = trunc i64 %shr162 to i8, !dbg !2722
  %42 = and i8 %41, 15, !dbg !2722
  %conv171 = xor i8 %42, %40, !dbg !2722
  store i8 %conv171, ptr %arrayidx168, align 1, !dbg !2722
  %shr172 = lshr i64 %call144, 24, !dbg !2723
  %mul1757 = or disjoint i32 %i86.0, 4, !dbg !2724
  %add176 = mul i32 %mul1757, %A_cols, !dbg !2724
  %43 = getelementptr i8, ptr %A, i32 %add176, !dbg !2725
  %arrayidx178 = getelementptr i8, ptr %43, i32 -1, !dbg !2725
  %44 = load i8, ptr %arrayidx178, align 1, !dbg !2726
  %45 = trunc i64 %shr172 to i8, !dbg !2726
  %46 = and i8 %45, 15, !dbg !2726
  %conv181 = xor i8 %46, %44, !dbg !2726
  store i8 %conv181, ptr %arrayidx178, align 1, !dbg !2726
  %shr182 = lshr i64 %call144, 32, !dbg !2727
  %mul1858 = or disjoint i32 %i86.0, 5, !dbg !2728
  %add186 = mul i32 %mul1858, %A_cols, !dbg !2728
  %47 = getelementptr i8, ptr %A, i32 %add186, !dbg !2729
  %arrayidx188 = getelementptr i8, ptr %47, i32 -1, !dbg !2729
  %48 = load i8, ptr %arrayidx188, align 1, !dbg !2730
  %49 = trunc i64 %shr182 to i8, !dbg !2730
  %50 = and i8 %49, 15, !dbg !2730
  %conv191 = xor i8 %50, %48, !dbg !2730
  store i8 %conv191, ptr %arrayidx188, align 1, !dbg !2730
  %shr192 = lshr i64 %call144, 40, !dbg !2731
  %mul1959 = or disjoint i32 %i86.0, 6, !dbg !2732
  %add196 = mul i32 %mul1959, %A_cols, !dbg !2732
  %51 = getelementptr i8, ptr %A, i32 %add196, !dbg !2733
  %arrayidx198 = getelementptr i8, ptr %51, i32 -1, !dbg !2733
  %52 = load i8, ptr %arrayidx198, align 1, !dbg !2734
  %53 = trunc i64 %shr192 to i8, !dbg !2734
  %54 = and i8 %53, 15, !dbg !2734
  %conv201 = xor i8 %54, %52, !dbg !2734
  store i8 %conv201, ptr %arrayidx198, align 1, !dbg !2734
  %shr202 = lshr i64 %call144, 48, !dbg !2735
  %mul20510 = or disjoint i32 %i86.0, 7, !dbg !2736
  %add206 = mul i32 %mul20510, %A_cols, !dbg !2736
  %55 = getelementptr i8, ptr %A, i32 %add206, !dbg !2737
  %arrayidx208 = getelementptr i8, ptr %55, i32 -1, !dbg !2737
  %56 = load i8, ptr %arrayidx208, align 1, !dbg !2738
  %57 = trunc i64 %shr202 to i8, !dbg !2738
  %58 = and i8 %57, 15, !dbg !2738
  %conv211 = xor i8 %58, %56, !dbg !2738
  store i8 %conv211, ptr %arrayidx208, align 1, !dbg !2738
  %shr212 = lshr i64 %call144, 56, !dbg !2739
  %mul21511 = add nuw i32 %i86.0, 8, !dbg !2740
  %add216 = mul i32 %mul21511, %A_cols, !dbg !2740
  %59 = getelementptr i8, ptr %A, i32 %add216, !dbg !2741
  %arrayidx218 = getelementptr i8, ptr %59, i32 -1, !dbg !2741
  %60 = load i8, ptr %arrayidx218, align 1, !dbg !2742
  %61 = trunc nuw nsw i64 %shr212 to i8, !dbg !2742
  %conv221 = xor i8 %60, %61, !dbg !2742
  store i8 %conv221, ptr %arrayidx218, align 1, !dbg !2742
  %add223 = add nuw nsw i32 %i86.0, 8, !dbg !2743
    #dbg_value(i32 %add223, !2655, !DIExpression(), !2657)
  br label %for.cond87, !dbg !2744, !llvm.loop !2745

for.inc229:                                       ; preds = %for.cond87
    #dbg_value(!DIArgList(i8 %finished.0, i8 %call70), !2627, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !2529)
  %or2273 = or i8 %finished.0, %call70, !dbg !2747
    #dbg_value(i8 %or2273, !2627, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !2529)
    #dbg_value(i8 %or2273, !2627, !DIExpression(), !2529)
  %inc230 = add nsw i32 %col.0, 1, !dbg !2748
    #dbg_value(i32 %inc230, !2631, !DIExpression(), !2633)
  br label %for.cond63, !dbg !2749, !llvm.loop !2750

return:                                           ; preds = %for.cond50, %for.end45
  %retval.0 = phi i32 [ 0, %for.end45 ], [ 1, %for.cond50 ], !dbg !2529
  ret i32 %retval.0, !dbg !2752
}

; Function Attrs: nounwind
define internal fastcc void @mat_mul.21(ptr noundef %a, ptr noundef %b, ptr noundef %c, i32 noundef %colrow_ab, i32 noundef %row_a, i32 noundef %col_b) unnamed_addr #0 !dbg !2753 {
entry:
    #dbg_value(ptr %a, !2754, !DIExpression(), !2755)
    #dbg_value(ptr %b, !2756, !DIExpression(), !2755)
    #dbg_value(ptr %c, !2757, !DIExpression(), !2755)
    #dbg_value(i32 %colrow_ab, !2758, !DIExpression(), !2755)
    #dbg_value(i32 %row_a, !2759, !DIExpression(), !2755)
    #dbg_value(i32 %col_b, !2760, !DIExpression(), !2755)
    #dbg_value(i32 0, !2761, !DIExpression(), !2763)
  %smax = call i32 @llvm.smax.i32(i32 %col_b, i32 0), !dbg !2764
  %smax1 = call i32 @llvm.smax.i32(i32 %row_a, i32 0), !dbg !2764
  br label %for.cond, !dbg !2764

for.cond:                                         ; preds = %for.inc4, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc5, %for.inc4 ], !dbg !2765
  %c.addr.0 = phi ptr [ %c, %entry ], [ %c.addr.1, %for.inc4 ]
  %a.addr.0 = phi ptr [ %a, %entry ], [ %add.ptr6, %for.inc4 ]
    #dbg_value(ptr %a.addr.0, !2754, !DIExpression(), !2755)
    #dbg_value(ptr %c.addr.0, !2757, !DIExpression(), !2755)
    #dbg_value(i32 %i.0, !2761, !DIExpression(), !2763)
  %exitcond2.not = icmp eq i32 %i.0, %smax1, !dbg !2766
  br i1 %exitcond2.not, label %for.end7, label %for.cond1, !dbg !2768

for.cond1:                                        ; preds = %for.cond, %for.body3
  %c.addr.1 = phi ptr [ %incdec.ptr, %for.body3 ], [ %c.addr.0, %for.cond ]
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond ], !dbg !2769
    #dbg_value(i32 %j.0, !2772, !DIExpression(), !2773)
    #dbg_value(ptr %c.addr.1, !2757, !DIExpression(), !2755)
  %exitcond.not = icmp eq i32 %j.0, %smax, !dbg !2774
  br i1 %exitcond.not, label %for.inc4, label %for.body3, !dbg !2776

for.body3:                                        ; preds = %for.cond1
  %add.ptr = getelementptr inbounds nuw i8, ptr %b, i32 %j.0, !dbg !2777
  %call = call fastcc zeroext i8 @lincomb.24(ptr noundef %a.addr.0, ptr noundef %add.ptr, i32 noundef %colrow_ab, i32 noundef %col_b) #6, !dbg !2779
  store i8 %call, ptr %c.addr.1, align 1, !dbg !2780
  %inc = add nuw i32 %j.0, 1, !dbg !2781
    #dbg_value(i32 %inc, !2772, !DIExpression(), !2773)
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %c.addr.1, i32 1, !dbg !2782
    #dbg_value(ptr %incdec.ptr, !2757, !DIExpression(), !2755)
  br label %for.cond1, !dbg !2783, !llvm.loop !2784

for.inc4:                                         ; preds = %for.cond1
  %inc5 = add nuw i32 %i.0, 1, !dbg !2786
    #dbg_value(i32 %inc5, !2761, !DIExpression(), !2763)
  %add.ptr6 = getelementptr inbounds i8, ptr %a.addr.0, i32 %colrow_ab, !dbg !2787
    #dbg_value(ptr %add.ptr6, !2754, !DIExpression(), !2755)
  br label %for.cond, !dbg !2788, !llvm.loop !2789

for.end7:                                         ; preds = %for.cond
  %cmp8 = icmp eq i32 %row_a, %col_b, !dbg !2791
  %call9 = call zeroext i1 @assert(i1 noundef zeroext %cmp8) #8, !dbg !2792
  ret void, !dbg !2793
}

; Function Attrs: nounwind
define internal fastcc zeroext i8 @sub_f(i8 noundef zeroext %a, i8 noundef zeroext %b) unnamed_addr #0 !dbg !2794 {
entry:
    #dbg_value(i8 %a, !2795, !DIExpression(), !2796)
    #dbg_value(i8 %b, !2797, !DIExpression(), !2796)
  %xor1 = xor i8 %a, %b, !dbg !2798
  ret i8 %xor1, !dbg !2799
}

; Function Attrs: nounwind
define internal fastcc void @EF(ptr noundef %A, i32 noundef %nrows, i32 noundef %ncols) unnamed_addr #0 !dbg !2800 {
entry:
  %_pivot_row = alloca [7 x i64], align 32
  %_pivot_row2 = alloca [7 x i64], align 32
  %packed_A = alloca [756 x i64], align 32
  %temp = alloca [126 x i8], align 1
    #dbg_value(ptr %A, !2804, !DIExpression(), !2805)
    #dbg_value(i32 %nrows, !2806, !DIExpression(), !2805)
    #dbg_value(i32 %ncols, !2807, !DIExpression(), !2805)
    #dbg_declare(ptr %_pivot_row, !2808, !DIExpression(), !2809)
    #dbg_declare(ptr %_pivot_row2, !2810, !DIExpression(), !2811)
    #dbg_declare(ptr %packed_A, !2812, !DIExpression(), !2816)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 32 dereferenceable(6048) %packed_A, i8 0, i32 6048, i1 false), !dbg !2816
  %add = add nsw i32 %ncols, 15, !dbg !2817
  %div = sdiv i32 %add, 16, !dbg !2818
    #dbg_value(i32 %div, !2819, !DIExpression(), !2805)
    #dbg_value(i32 0, !2820, !DIExpression(), !2822)
  %smax = call i32 @llvm.smax.i32(i32 %nrows, i32 0), !dbg !2823
  br label %for.cond, !dbg !2823

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2824
    #dbg_value(i32 %i.0, !2820, !DIExpression(), !2822)
  %exitcond.not = icmp eq i32 %i.0, %smax, !dbg !2825
  br i1 %exitcond.not, label %for.cond3.preheader, label %for.body, !dbg !2827

for.cond3.preheader:                              ; preds = %for.cond
  %smax1 = call i32 @llvm.smax.i32(i32 %div, i32 0), !dbg !2828
  %smax5 = call i32 @llvm.smax.i32(i32 %ncols, i32 0), !dbg !2828
  br label %for.cond3, !dbg !2828

for.body:                                         ; preds = %for.cond
  %mul = mul nsw i32 %i.0, %ncols, !dbg !2830
  %add.ptr = getelementptr inbounds i8, ptr %A, i32 %mul, !dbg !2832
  %mul1 = mul nsw i32 %i.0, %div, !dbg !2833
  %add.ptr2 = getelementptr inbounds i64, ptr %packed_A, i32 %mul1, !dbg !2834
  call fastcc void @ef_pack_m_vec(ptr noundef %add.ptr, ptr noundef nonnull %add.ptr2, i32 noundef %ncols) #6, !dbg !2835
  %inc = add nuw i32 %i.0, 1, !dbg !2836
    #dbg_value(i32 %inc, !2820, !DIExpression(), !2822)
  br label %for.cond, !dbg !2837, !llvm.loop !2838

for.cond3:                                        ; preds = %for.cond3.preheader, %for.inc117
  %pivot_col.0 = phi i32 [ %inc118, %for.inc117 ], [ 0, %for.cond3.preheader ], !dbg !2840
  %pivot_row.0 = phi i32 [ %conv116, %for.inc117 ], [ 0, %for.cond3.preheader ], !dbg !2805
    #dbg_value(i32 %pivot_row.0, !2841, !DIExpression(), !2805)
    #dbg_value(i32 %pivot_col.0, !2842, !DIExpression(), !2843)
  %exitcond6.not = icmp eq i32 %pivot_col.0, %smax5, !dbg !2844
  br i1 %exitcond6.not, label %for.cond121, label %for.body5, !dbg !2828

for.body5:                                        ; preds = %for.cond3
  %add6 = add nsw i32 %pivot_col.0, %nrows, !dbg !2846
  %cmp7 = icmp slt i32 %add6, %ncols, !dbg !2846
  %add8 = add nsw i32 %pivot_col.0, %nrows, !dbg !2846
  %sub9 = sub nsw i32 %add8, %ncols, !dbg !2846
  %cond = select i1 %cmp7, i32 0, i32 %sub9, !dbg !2846
    #dbg_value(i32 %cond, !2848, !DIExpression(), !2849)
  %sub13 = add nsw i32 %nrows, -1, !dbg !2850
    #dbg_value(i32 %cond16, !2851, !DIExpression(), !2849)
    #dbg_value(i32 0, !2852, !DIExpression(), !2854)
  br label %for.cond18, !dbg !2855

for.cond18:                                       ; preds = %for.body20, %for.body5
  %i17.0 = phi i32 [ 0, %for.body5 ], [ %inc23, %for.body20 ], !dbg !2856
    #dbg_value(i32 %i17.0, !2852, !DIExpression(), !2854)
  %exitcond2.not = icmp eq i32 %i17.0, %smax1, !dbg !2857
  br i1 %exitcond2.not, label %for.cond25.preheader, label %for.body20, !dbg !2859

for.cond25.preheader:                             ; preds = %for.cond18
  %cmp11.not = icmp sgt i32 %nrows, %pivot_col.0, !dbg !2850
  %cond16 = select i1 %cmp11.not, i32 %pivot_col.0, i32 %sub13, !dbg !2850
  br label %for.cond25, !dbg !2860

for.body20:                                       ; preds = %for.cond18
  %arrayidx = getelementptr inbounds nuw [7 x i64], ptr %_pivot_row, i32 0, i32 %i17.0, !dbg !2862
  store i64 0, ptr %arrayidx, align 8, !dbg !2864
  %arrayidx21 = getelementptr inbounds nuw [7 x i64], ptr %_pivot_row2, i32 0, i32 %i17.0, !dbg !2865
  store i64 0, ptr %arrayidx21, align 8, !dbg !2866
  %inc23 = add nuw nsw i32 %i17.0, 1, !dbg !2867
    #dbg_value(i32 %inc23, !2852, !DIExpression(), !2854)
  br label %for.cond18, !dbg !2868, !llvm.loop !2869

for.cond25:                                       ; preds = %for.cond25.preheader, %for.end48
  %pivot_is_zero.0 = phi i64 [ %not52, %for.end48 ], [ -1, %for.cond25.preheader ], !dbg !2849
  %pivot.0 = phi i8 [ %call50, %for.end48 ], [ 0, %for.cond25.preheader ], !dbg !2849
  %row.0 = phi i32 [ %inc54, %for.end48 ], [ %cond, %for.cond25.preheader ], !dbg !2871
    #dbg_value(i32 %row.0, !2872, !DIExpression(), !2871)
    #dbg_value(i8 %pivot.0, !2873, !DIExpression(), !2849)
    #dbg_value(i64 %pivot_is_zero.0, !2874, !DIExpression(), !2849)
  %add27 = add nsw i32 %cond16, 32, !dbg !2875
  %cmp28.not = icmp sgt i32 %nrows, %add27, !dbg !2875
  %sub30 = add nsw i32 %nrows, -1, !dbg !2875
  %add32 = add nsw i32 %cond16, 32, !dbg !2875
  %cond34 = select i1 %cmp28.not, i32 %add32, i32 %sub30, !dbg !2875
  %cmp35.not = icmp sgt i32 %row.0, %cond34, !dbg !2877
  br i1 %cmp35.not, label %for.end55, label %for.body36, !dbg !2860

for.body36:                                       ; preds = %for.cond25
  %call = call fastcc i64 @ct_compare_64(i32 noundef %row.0, i32 noundef %pivot_row.0) #6, !dbg !2878
  %not = xor i64 %call, -1, !dbg !2880
    #dbg_value(i64 %not, !2881, !DIExpression(), !2882)
  %call37 = call fastcc i64 @ct_64_is_greater_than(i32 noundef %row.0, i32 noundef %pivot_row.0) #6, !dbg !2883
    #dbg_value(i64 %call37, !2884, !DIExpression(), !2882)
    #dbg_value(i32 0, !2885, !DIExpression(), !2887)
  br label %for.cond38, !dbg !2888

for.cond38:                                       ; preds = %for.body40, %for.body36
  %j.0 = phi i32 [ 0, %for.body36 ], [ %inc47, %for.body40 ], !dbg !2889
    #dbg_value(i32 %j.0, !2885, !DIExpression(), !2887)
  %exitcond3.not = icmp eq i32 %j.0, %smax1, !dbg !2890
  br i1 %exitcond3.not, label %for.end48, label %for.body40, !dbg !2892

for.body40:                                       ; preds = %for.cond38
  %and = and i64 %call37, %pivot_is_zero.0, !dbg !2893
  %or = or i64 %and, %not, !dbg !2895
  %mul41 = mul nsw i32 %row.0, %div, !dbg !2896
  %add42 = add nsw i32 %mul41, %j.0, !dbg !2897
  %arrayidx43 = getelementptr inbounds [756 x i64], ptr %packed_A, i32 0, i32 %add42, !dbg !2898
  %0 = load i64, ptr %arrayidx43, align 8, !dbg !2898
  %and44 = and i64 %or, %0, !dbg !2899
  %arrayidx45 = getelementptr inbounds nuw [7 x i64], ptr %_pivot_row, i32 0, i32 %j.0, !dbg !2900
  %1 = load i64, ptr %arrayidx45, align 8, !dbg !2901
  %xor = xor i64 %1, %and44, !dbg !2901
  store i64 %xor, ptr %arrayidx45, align 8, !dbg !2901
  %inc47 = add nuw nsw i32 %j.0, 1, !dbg !2902
    #dbg_value(i32 %inc47, !2885, !DIExpression(), !2887)
  br label %for.cond38, !dbg !2903, !llvm.loop !2904

for.end48:                                        ; preds = %for.cond38
  %call50 = call fastcc zeroext i8 @m_extract_element(ptr noundef nonnull %_pivot_row, i32 noundef %pivot_col.0) #6, !dbg !2906
    #dbg_value(i8 %call50, !2873, !DIExpression(), !2849)
  %conv = zext nneg i8 %call50 to i32, !dbg !2907
  %call51 = call fastcc i64 @ct_compare_64(i32 noundef %conv, i32 noundef 0) #6, !dbg !2908
    #dbg_value(i64 %call51, !2874, !DIExpression(DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_stack_value), !2849)
  %not52 = xor i64 %call51, -1, !dbg !2909
    #dbg_value(i64 %not52, !2874, !DIExpression(), !2849)
  %inc54 = add nsw i32 %row.0, 1, !dbg !2910
    #dbg_value(i32 %inc54, !2872, !DIExpression(), !2871)
  br label %for.cond25, !dbg !2911, !llvm.loop !2912

for.end55:                                        ; preds = %for.cond25
  %call56 = call fastcc zeroext i8 @inverse_f(i8 noundef zeroext %pivot.0) #6, !dbg !2914
    #dbg_value(i8 %call56, !2915, !DIExpression(), !2805)
  call fastcc void @vec_mul_add_u64(i32 noundef %div, ptr noundef nonnull %_pivot_row, i8 noundef zeroext %call56, ptr noundef nonnull %_pivot_row2) #6, !dbg !2916
    #dbg_value(i32 %cond, !2917, !DIExpression(), !2919)
  br label %for.cond60, !dbg !2920

for.cond60:                                       ; preds = %for.inc86, %for.end55
  %row59.0 = phi i32 [ %cond, %for.end55 ], [ %inc87, %for.inc86 ], !dbg !2921
    #dbg_value(i32 %row59.0, !2917, !DIExpression(), !2919)
  %cmp61.not = icmp sgt i32 %row59.0, %cond16, !dbg !2922
  br i1 %cmp61.not, label %for.cond90, label %for.body63, !dbg !2924

for.body63:                                       ; preds = %for.cond60
  %call64 = call fastcc i64 @ct_compare_64(i32 noundef %row59.0, i32 noundef %pivot_row.0) #6, !dbg !2925
  %and67.demorgan = or i64 %call64, %pivot_is_zero.0, !dbg !2927
  %and67 = xor i64 %and67.demorgan, -1, !dbg !2927
    #dbg_value(i64 %and67, !2928, !DIExpression(), !2929)
    #dbg_value(i64 %and67.demorgan, !2930, !DIExpression(), !2929)
    #dbg_value(i32 0, !2931, !DIExpression(), !2933)
  br label %for.cond69, !dbg !2934

for.cond69:                                       ; preds = %for.body72, %for.body63
  %col.0 = phi i32 [ 0, %for.body63 ], [ %inc84, %for.body72 ], !dbg !2935
    #dbg_value(i32 %col.0, !2931, !DIExpression(), !2933)
  %exitcond4.not = icmp eq i32 %col.0, %smax1, !dbg !2936
  br i1 %exitcond4.not, label %for.inc86, label %for.body72, !dbg !2938

for.body72:                                       ; preds = %for.cond69
  %mul73 = mul nsw i32 %row59.0, %div, !dbg !2939
  %add74 = add nsw i32 %mul73, %col.0, !dbg !2941
  %arrayidx75 = getelementptr inbounds [756 x i64], ptr %packed_A, i32 0, i32 %add74, !dbg !2942
  %2 = load i64, ptr %arrayidx75, align 8, !dbg !2942
  %and76 = and i64 %and67.demorgan, %2, !dbg !2943
  %arrayidx77 = getelementptr inbounds nuw [7 x i64], ptr %_pivot_row2, i32 0, i32 %col.0, !dbg !2944
  %3 = load i64, ptr %arrayidx77, align 8, !dbg !2944
  %and78 = and i64 %3, %and67, !dbg !2945
  %add79 = add i64 %and76, %and78, !dbg !2946
  %mul80 = mul nsw i32 %row59.0, %div, !dbg !2947
  %add81 = add nsw i32 %mul80, %col.0, !dbg !2948
  %arrayidx82 = getelementptr inbounds [756 x i64], ptr %packed_A, i32 0, i32 %add81, !dbg !2949
  store i64 %add79, ptr %arrayidx82, align 8, !dbg !2950
  %inc84 = add nuw nsw i32 %col.0, 1, !dbg !2951
    #dbg_value(i32 %inc84, !2931, !DIExpression(), !2933)
  br label %for.cond69, !dbg !2952, !llvm.loop !2953

for.inc86:                                        ; preds = %for.cond69
  %inc87 = add nsw i32 %row59.0, 1, !dbg !2955
    #dbg_value(i32 %inc87, !2917, !DIExpression(), !2919)
  br label %for.cond60, !dbg !2956, !llvm.loop !2957

for.cond90:                                       ; preds = %for.cond60, %for.body93
  %row89.0 = phi i32 [ %inc110, %for.body93 ], [ %cond, %for.cond60 ], !dbg !2959
    #dbg_value(i32 %row89.0, !2961, !DIExpression(), !2962)
  %cmp91 = icmp slt i32 %row89.0, %nrows, !dbg !2963
  br i1 %cmp91, label %for.body93, label %for.inc117, !dbg !2965

for.body93:                                       ; preds = %for.cond90
  %cmp94 = icmp sgt i32 %row89.0, %pivot_row.0, !dbg !2966
    #dbg_value(i1 %cmp94, !2968, !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !2969)
  %mul98 = mul nsw i32 %row89.0, %div, !dbg !2970
  %add.ptr99 = getelementptr inbounds i64, ptr %packed_A, i32 %mul98, !dbg !2971
  %call100 = call fastcc zeroext i8 @m_extract_element(ptr noundef nonnull %add.ptr99, i32 noundef %pivot_col.0) #6, !dbg !2972
    #dbg_value(i8 %call100, !2973, !DIExpression(), !2969)
  %conv105 = select i1 %cmp94, i8 %call100, i8 0, !dbg !2974
  %mul107 = mul nsw i32 %row89.0, %div, !dbg !2975
  %add.ptr108 = getelementptr inbounds i64, ptr %packed_A, i32 %mul107, !dbg !2976
  call fastcc void @vec_mul_add_u64(i32 noundef %div, ptr noundef nonnull %_pivot_row2, i8 noundef zeroext %conv105, ptr noundef nonnull %add.ptr108) #6, !dbg !2977
  %inc110 = add nsw i32 %row89.0, 1, !dbg !2978
    #dbg_value(i32 %inc110, !2961, !DIExpression(), !2962)
  br label %for.cond90, !dbg !2979, !llvm.loop !2980

for.inc117:                                       ; preds = %for.cond90
    #dbg_value(!DIArgList(i64 %pivot_is_zero.0, i32 %pivot_row.0), !2841, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_plus_uconst, 1, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_plus, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value), !2805)
  %4 = trunc i64 %pivot_is_zero.0 to i32, !dbg !2982
  %5 = add i32 %4, 1, !dbg !2982
  %conv116 = add i32 %5, %pivot_row.0, !dbg !2982
    #dbg_value(i32 %conv116, !2841, !DIExpression(), !2805)
  %inc118 = add nuw i32 %pivot_col.0, 1, !dbg !2983
    #dbg_value(i32 %inc118, !2842, !DIExpression(), !2843)
  br label %for.cond3, !dbg !2984, !llvm.loop !2985

for.cond121:                                      ; preds = %for.cond3, %for.inc141
  %i120.0 = phi i32 [ %inc142, %for.inc141 ], [ 0, %for.cond3 ], !dbg !2987
    #dbg_value(i32 %i120.0, !2989, !DIExpression(), !2990)
  %exitcond8.not = icmp eq i32 %i120.0, %smax, !dbg !2991
  br i1 %exitcond8.not, label %for.end143, label %for.body124, !dbg !2993

for.body124:                                      ; preds = %for.cond121
  %mul126 = mul nsw i32 %i120.0, %div, !dbg !2994
  %add.ptr127 = getelementptr inbounds i64, ptr %packed_A, i32 %mul126, !dbg !2996
  call fastcc void @ef_unpack_m_vec(i32 noundef %div, ptr noundef nonnull %add.ptr127, ptr noundef nonnull %temp) #6, !dbg !2997
    #dbg_value(i32 0, !2998, !DIExpression(), !3000)
  br label %for.cond130, !dbg !3001

for.cond130:                                      ; preds = %for.body133, %for.body124
  %j129.0 = phi i32 [ 0, %for.body124 ], [ %inc139, %for.body133 ], !dbg !3002
    #dbg_value(i32 %j129.0, !2998, !DIExpression(), !3000)
  %exitcond7.not = icmp eq i32 %j129.0, %smax5, !dbg !3003
  br i1 %exitcond7.not, label %for.inc141, label %for.body133, !dbg !3005

for.body133:                                      ; preds = %for.cond130
  %arrayidx134 = getelementptr inbounds nuw [126 x i8], ptr %temp, i32 0, i32 %j129.0, !dbg !3006
  %6 = load i8, ptr %arrayidx134, align 1, !dbg !3006
  %mul135 = mul nsw i32 %i120.0, %ncols, !dbg !3008
  %7 = getelementptr i8, ptr %A, i32 %mul135, !dbg !3009
  %arrayidx137 = getelementptr i8, ptr %7, i32 %j129.0, !dbg !3009
  store i8 %6, ptr %arrayidx137, align 1, !dbg !3010
  %inc139 = add nuw i32 %j129.0, 1, !dbg !3011
    #dbg_value(i32 %inc139, !2998, !DIExpression(), !3000)
  br label %for.cond130, !dbg !3012, !llvm.loop !3013

for.inc141:                                       ; preds = %for.cond130
  %inc142 = add nuw i32 %i120.0, 1, !dbg !3015
    #dbg_value(i32 %inc142, !2989, !DIExpression(), !2990)
  br label %for.cond121, !dbg !3016, !llvm.loop !3017

for.end143:                                       ; preds = %for.cond121
  call void @mayo_secure_clear(ptr noundef nonnull %temp, i32 noundef 126) #8, !dbg !3019
  call void @mayo_secure_clear(ptr noundef nonnull %_pivot_row, i32 noundef 56) #8, !dbg !3020
  call void @mayo_secure_clear(ptr noundef nonnull %_pivot_row2, i32 noundef 56) #8, !dbg !3021
  call void @mayo_secure_clear(ptr noundef nonnull %packed_A, i32 noundef 6048) #8, !dbg !3022
  ret void, !dbg !3023
}

; Function Attrs: nounwind
define internal fastcc zeroext i8 @ct_compare_8(i8 noundef zeroext %a, i8 noundef zeroext %b) unnamed_addr #0 !dbg !3024 {
entry:
    #dbg_value(i8 %a, !3026, !DIExpression(), !3027)
    #dbg_value(i8 %b, !3028, !DIExpression(), !3027)
  %0 = icmp ne i8 %a, %b, !dbg !3029
  %conv3 = sext i1 %0 to i8, !dbg !3030
  %1 = load volatile i8, ptr @pqmayo_MAYO_3_ref_unsigned_char_blocker, align 1, !dbg !3031
  %xor5 = xor i8 %1, %conv3, !dbg !3032
  ret i8 %xor5, !dbg !3033
}

; Function Attrs: nounwind
define internal fastcc range(i64 0, 1085102592571150096) i64 @mul_fx8(i8 noundef zeroext %a, i64 noundef %b) unnamed_addr #0 !dbg !3034 {
entry:
    #dbg_value(i8 %a, !3037, !DIExpression(), !3038)
    #dbg_value(i64 %b, !3039, !DIExpression(), !3038)
  %0 = and i8 %a, 1, !dbg !3040
  %conv1 = zext nneg i8 %0 to i64, !dbg !3041
  %mul = mul nuw nsw i64 %b, %conv1, !dbg !3042
    #dbg_value(i64 %mul, !3043, !DIExpression(), !3038)
  %1 = and i8 %a, 2, !dbg !3044
  %conv4 = zext nneg i8 %1 to i64, !dbg !3045
  %mul5 = mul i64 %b, %conv4, !dbg !3046
  %xor = xor i64 %mul, %mul5, !dbg !3047
    #dbg_value(i64 %xor, !3043, !DIExpression(), !3038)
  %2 = and i8 %a, 4, !dbg !3048
  %conv8 = zext nneg i8 %2 to i64, !dbg !3049
  %mul9 = mul i64 %b, %conv8, !dbg !3050
  %xor10 = xor i64 %xor, %mul9, !dbg !3051
    #dbg_value(i64 %xor10, !3043, !DIExpression(), !3038)
  %3 = and i8 %a, 8, !dbg !3052
  %conv13 = zext nneg i8 %3 to i64, !dbg !3053
  %mul14 = mul i64 %b, %conv13, !dbg !3054
  %xor15 = xor i64 %xor10, %mul14, !dbg !3055
    #dbg_value(i64 %xor15, !3043, !DIExpression(), !3038)
    #dbg_value(i64 %xor15, !3056, !DIExpression(DW_OP_constu, 17361641481138401520, DW_OP_and, DW_OP_stack_value), !3038)
  %shr = lshr i64 %xor15, 4, !dbg !3057
  %and16 = lshr i64 %xor15, 3, !dbg !3058
  %shr18 = and i64 %and16, 1012762419733073422, !dbg !3058
  %4 = xor i64 %shr, %shr18, !dbg !3059
  %xor19 = xor i64 %4, %xor15, !dbg !3059
  %and20 = and i64 %xor19, 1085102592571150095, !dbg !3060
    #dbg_value(i64 %and20, !3061, !DIExpression(), !3038)
  ret i64 %and20, !dbg !3062
}

; Function Attrs: nounwind
define internal fastcc void @ef_pack_m_vec(ptr noundef %in, ptr noundef %out, i32 noundef %ncols) unnamed_addr #0 !dbg !3063 {
entry:
    #dbg_value(ptr %in, !3066, !DIExpression(), !3067)
    #dbg_value(ptr %out, !3068, !DIExpression(), !3067)
    #dbg_value(i32 %ncols, !3069, !DIExpression(), !3067)
    #dbg_value(ptr %out, !3070, !DIExpression(), !3067)
    #dbg_value(i32 0, !3071, !DIExpression(), !3067)
  br label %for.cond, !dbg !3072

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %add8, %for.body ], !dbg !3074
    #dbg_value(i32 %i.0, !3071, !DIExpression(), !3067)
  %add = or disjoint i32 %i.0, 1, !dbg !3075
  %cmp = icmp slt i32 %add, %ncols, !dbg !3077
  br i1 %cmp, label %for.body, label %for.end, !dbg !3078

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %in, i32 %i.0, !dbg !3079
  %0 = load i8, ptr %arrayidx, align 1, !dbg !3079
  %add2 = or disjoint i32 %i.0, 1, !dbg !3081
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %in, i32 %add2, !dbg !3082
  %1 = load i8, ptr %arrayidx3, align 1, !dbg !3082
  %shl5 = shl i8 %1, 4, !dbg !3083
  %or = or i8 %shl5, %0, !dbg !3084
  %div = lshr exact i32 %i.0, 1, !dbg !3085
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %out, i32 %div, !dbg !3086
  store i8 %or, ptr %arrayidx7, align 1, !dbg !3087
  %add8 = add nuw nsw i32 %i.0, 2, !dbg !3088
    #dbg_value(i32 %add8, !3071, !DIExpression(), !3067)
  br label %for.cond, !dbg !3089, !llvm.loop !3090

for.end:                                          ; preds = %for.cond
  %2 = and i32 %ncols, -2147483647, !dbg !3092
  %cmp9 = icmp eq i32 %2, 1, !dbg !3092
  br i1 %cmp9, label %if.then, label %if.end, !dbg !3092

if.then:                                          ; preds = %for.end
  %arrayidx12 = getelementptr inbounds nuw i8, ptr %in, i32 %i.0, !dbg !3094
  %3 = load i8, ptr %arrayidx12, align 1, !dbg !3094
  %div16 = lshr exact i32 %i.0, 1, !dbg !3096
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %out, i32 %div16, !dbg !3097
  store i8 %3, ptr %arrayidx17, align 1, !dbg !3098
  br label %if.end, !dbg !3099

if.end:                                           ; preds = %if.then, %for.end
  ret void, !dbg !3100
}

; Function Attrs: nounwind
define internal fastcc i64 @ct_compare_64(i32 noundef %a, i32 noundef %b) unnamed_addr #0 !dbg !3101 {
entry:
    #dbg_value(i32 %a, !3104, !DIExpression(), !3105)
    #dbg_value(i32 %b, !3106, !DIExpression(), !3105)
  %xor = xor i32 %a, %b, !dbg !3107
  %0 = icmp sgt i32 %xor, 0, !dbg !3108
  %shr = sext i1 %0 to i64, !dbg !3108
  %1 = load volatile i64, ptr @pqmayo_MAYO_3_ref_uint64_t_blocker, align 8, !dbg !3109
  %xor1 = xor i64 %1, %shr, !dbg !3110
  ret i64 %xor1, !dbg !3111
}

; Function Attrs: nounwind
define internal fastcc i64 @ct_64_is_greater_than(i32 noundef %a, i32 noundef %b) unnamed_addr #0 !dbg !3112 {
entry:
    #dbg_value(i32 %a, !3113, !DIExpression(), !3114)
    #dbg_value(i32 %b, !3115, !DIExpression(), !3114)
    #dbg_value(!DIArgList(i32 %b, i32 %a), !3116, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_LLVM_convert, 64, DW_ATE_signed, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_LLVM_convert, 64, DW_ATE_signed, DW_OP_minus, DW_OP_stack_value), !3114)
  %0 = icmp slt i32 %b, %a, !dbg !3117
  %shr = sext i1 %0 to i64, !dbg !3117
  %1 = load volatile i64, ptr @pqmayo_MAYO_3_ref_uint64_t_blocker, align 8, !dbg !3118
  %xor = xor i64 %1, %shr, !dbg !3119
  ret i64 %xor, !dbg !3120
}

; Function Attrs: nounwind
define internal fastcc zeroext range(i8 0, 16) i8 @m_extract_element(ptr noundef %in, i32 noundef %index) unnamed_addr #0 !dbg !3121 {
entry:
    #dbg_value(ptr %in, !3124, !DIExpression(), !3125)
    #dbg_value(i32 %index, !3126, !DIExpression(), !3125)
  %div = sdiv i32 %index, 16, !dbg !3127
    #dbg_value(i32 %div, !3128, !DIExpression(), !3125)
  %rem = srem i32 %index, 16, !dbg !3129
    #dbg_value(i32 %rem, !3130, !DIExpression(), !3125)
  %arrayidx = getelementptr inbounds i64, ptr %in, i32 %div, !dbg !3131
  %0 = load i64, ptr %arrayidx, align 8, !dbg !3131
  %mul = shl nsw i32 %rem, 2, !dbg !3132
  %sh_prom = zext nneg i32 %mul to i64, !dbg !3133
  %shr = lshr i64 %0, %sh_prom, !dbg !3133
  %1 = trunc i64 %shr to i8, !dbg !3134
  %conv = and i8 %1, 15, !dbg !3134
  ret i8 %conv, !dbg !3135
}

; Function Attrs: nounwind
define internal fastcc zeroext range(i8 0, 16) i8 @inverse_f(i8 noundef zeroext %a) unnamed_addr #0 !dbg !3136 {
entry:
    #dbg_value(i8 %a, !3139, !DIExpression(), !3140)
  %call = call fastcc zeroext i8 @mul_f.23(i8 noundef zeroext %a, i8 noundef zeroext %a) #6, !dbg !3141
    #dbg_value(i8 %call, !3142, !DIExpression(), !3140)
  %call1 = call fastcc zeroext i8 @mul_f.23(i8 noundef zeroext %call, i8 noundef zeroext %call) #6, !dbg !3143
    #dbg_value(i8 %call1, !3144, !DIExpression(), !3140)
  %call2 = call fastcc zeroext i8 @mul_f.23(i8 noundef zeroext %call1, i8 noundef zeroext %call1) #6, !dbg !3145
    #dbg_value(i8 %call2, !3146, !DIExpression(), !3140)
  %call3 = call fastcc zeroext i8 @mul_f.23(i8 noundef zeroext %call, i8 noundef zeroext %call1) #6, !dbg !3147
    #dbg_value(i8 %call3, !3148, !DIExpression(), !3140)
  %call4 = call fastcc zeroext i8 @mul_f.23(i8 noundef zeroext %call2, i8 noundef zeroext %call3) #6, !dbg !3149
    #dbg_value(i8 %call4, !3150, !DIExpression(), !3140)
  ret i8 %call4, !dbg !3151
}

; Function Attrs: nounwind
define internal fastcc void @vec_mul_add_u64(i32 noundef %legs, ptr noundef %in, i8 noundef zeroext %a, ptr noundef %acc) unnamed_addr #0 !dbg !3152 {
entry:
    #dbg_value(i32 %legs, !3155, !DIExpression(), !3156)
    #dbg_value(ptr %in, !3157, !DIExpression(), !3156)
    #dbg_value(i8 %a, !3158, !DIExpression(), !3156)
    #dbg_value(ptr %acc, !3159, !DIExpression(), !3156)
  %call = call fastcc i32 @mul_table.22(i8 noundef zeroext %a) #6, !dbg !3160
    #dbg_value(i32 %call, !3161, !DIExpression(), !3156)
    #dbg_value(i64 1229782938247303441, !3162, !DIExpression(), !3156)
    #dbg_value(i32 0, !3163, !DIExpression(), !3165)
  %smax = call i32 @llvm.smax.i32(i32 %legs, i32 0), !dbg !3166
  br label %for.cond, !dbg !3166

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !3167
    #dbg_value(i32 %i.0, !3163, !DIExpression(), !3165)
  %exitcond.not = icmp eq i32 %i.0, %smax, !dbg !3168
  br i1 %exitcond.not, label %for.end, label %for.body, !dbg !3170

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %in, i32 %i.0, !dbg !3171
  %0 = load i64, ptr %arrayidx, align 8, !dbg !3171
  %and = and i64 %0, 1229782938247303441, !dbg !3173
  %and1 = and i32 %call, 255, !dbg !3174
  %conv = zext nneg i32 %and1 to i64, !dbg !3175
  %mul = mul i64 %and, %conv, !dbg !3176
  %shr = lshr i64 %0, 1, !dbg !3177
  %and3 = and i64 %shr, 1229782938247303441, !dbg !3178
  %shr4 = lshr i32 %call, 8, !dbg !3179
  %and5 = and i32 %shr4, 15, !dbg !3180
  %conv6 = zext nneg i32 %and5 to i64, !dbg !3181
  %mul7 = mul nuw i64 %and3, %conv6, !dbg !3182
  %xor = xor i64 %mul, %mul7, !dbg !3183
  %arrayidx8 = getelementptr inbounds nuw i64, ptr %in, i32 %i.0, !dbg !3184
  %1 = load i64, ptr %arrayidx8, align 8, !dbg !3184
  %shr9 = lshr i64 %1, 2, !dbg !3185
  %and10 = and i64 %shr9, 1229782938247303441, !dbg !3186
  %shr11 = lshr i32 %call, 16, !dbg !3187
  %and12 = and i32 %shr11, 15, !dbg !3188
  %conv13 = zext nneg i32 %and12 to i64, !dbg !3189
  %mul14 = mul nuw i64 %and10, %conv13, !dbg !3190
  %xor15 = xor i64 %xor, %mul14, !dbg !3191
  %arrayidx16 = getelementptr inbounds nuw i64, ptr %in, i32 %i.0, !dbg !3192
  %2 = load i64, ptr %arrayidx16, align 8, !dbg !3192
  %shr17 = lshr i64 %2, 3, !dbg !3193
  %and18 = and i64 %shr17, 1229782938247303441, !dbg !3194
  %shr19 = lshr i32 %call, 24, !dbg !3195
  %and20 = and i32 %shr19, 15, !dbg !3196
  %conv21 = zext nneg i32 %and20 to i64, !dbg !3197
  %mul22 = mul nuw i64 %and18, %conv21, !dbg !3198
  %xor23 = xor i64 %xor15, %mul22, !dbg !3199
  %arrayidx24 = getelementptr inbounds nuw i64, ptr %acc, i32 %i.0, !dbg !3200
  %3 = load i64, ptr %arrayidx24, align 8, !dbg !3201
  %xor25 = xor i64 %3, %xor23, !dbg !3201
  store i64 %xor25, ptr %arrayidx24, align 8, !dbg !3201
  %inc = add nuw i32 %i.0, 1, !dbg !3202
    #dbg_value(i32 %inc, !3163, !DIExpression(), !3165)
  br label %for.cond, !dbg !3203, !llvm.loop !3204

for.end:                                          ; preds = %for.cond
  ret void, !dbg !3206
}

; Function Attrs: nounwind
define internal fastcc void @ef_unpack_m_vec(i32 noundef %legs, ptr noundef %in, ptr noundef %out) unnamed_addr #0 !dbg !3207 {
entry:
    #dbg_value(i32 %legs, !3210, !DIExpression(), !3211)
    #dbg_value(ptr %in, !3212, !DIExpression(), !3211)
    #dbg_value(ptr %out, !3213, !DIExpression(), !3211)
    #dbg_value(ptr %in, !3214, !DIExpression(), !3211)
    #dbg_value(i32 0, !3215, !DIExpression(), !3217)
  br label %for.cond, !dbg !3218

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %add8, %for.body ], !dbg !3219
    #dbg_value(i32 %i.0, !3215, !DIExpression(), !3217)
  %mul = shl nsw i32 %legs, 4, !dbg !3220
  %cmp = icmp slt i32 %i.0, %mul, !dbg !3222
  br i1 %cmp, label %for.body, label %for.end, !dbg !3223

for.body:                                         ; preds = %for.cond
  %div = lshr exact i32 %i.0, 1, !dbg !3224
  %arrayidx = getelementptr inbounds nuw i8, ptr %in, i32 %div, !dbg !3226
  %0 = load i8, ptr %arrayidx, align 1, !dbg !3226
  %1 = and i8 %0, 15, !dbg !3227
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %out, i32 %i.0, !dbg !3228
  store i8 %1, ptr %arrayidx2, align 1, !dbg !3229
  %div3 = lshr exact i32 %i.0, 1, !dbg !3230
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %in, i32 %div3, !dbg !3231
  %2 = load i8, ptr %arrayidx4, align 1, !dbg !3231
  %3 = lshr i8 %2, 4, !dbg !3232
  %add = or disjoint i32 %i.0, 1, !dbg !3233
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %out, i32 %add, !dbg !3234
  store i8 %3, ptr %arrayidx7, align 1, !dbg !3235
  %add8 = add nuw nsw i32 %i.0, 2, !dbg !3236
    #dbg_value(i32 %add8, !3215, !DIExpression(), !3217)
  br label %for.cond, !dbg !3237, !llvm.loop !3238

for.end:                                          ; preds = %for.cond
  ret void, !dbg !3240
}

; Function Attrs: nounwind
define internal fastcc i32 @mul_table.22(i8 noundef zeroext %b) unnamed_addr #0 !dbg !3241 {
entry:
    #dbg_value(i8 %b, !3242, !DIExpression(), !3243)
  %conv = zext i8 %b to i32, !dbg !3244
  %mul = mul i32 %conv, 134480385, !dbg !3245
    #dbg_value(i32 %mul, !3246, !DIExpression(), !3243)
    #dbg_value(i32 -252645136, !3247, !DIExpression(), !3243)
  %and = and i32 %mul, -252645136, !dbg !3248
    #dbg_value(i32 %and, !3249, !DIExpression(), !3243)
  %shr = lshr exact i32 %and, 4, !dbg !3250
  %shr1 = lshr exact i32 %and, 3, !dbg !3251
  %0 = xor i32 %shr, %shr1, !dbg !3252
  %xor2 = xor i32 %0, %mul, !dbg !3252
  ret i32 %xor2, !dbg !3253
}

; Function Attrs: nounwind
define internal fastcc zeroext range(i8 0, 16) i8 @mul_f.23(i8 noundef zeroext %a, i8 noundef zeroext %b) unnamed_addr #0 !dbg !3254 {
entry:
    #dbg_value(i8 %a, !3255, !DIExpression(), !3256)
    #dbg_value(i8 %b, !3257, !DIExpression(), !3256)
  %0 = load volatile i8, ptr @pqmayo_MAYO_3_ref_unsigned_char_blocker, align 1, !dbg !3258
  %xor1 = xor i8 %a, %0, !dbg !3259
    #dbg_value(i8 %xor1, !3255, !DIExpression(), !3256)
  %1 = trunc i8 %xor1 to i1, !dbg !3260
    #dbg_value(i8 poison, !3261, !DIExpression(), !3256)
  %2 = and i8 %xor1, 2, !dbg !3262
  %mul9 = mul i8 %2, %b, !dbg !3263
  %conv10 = select i1 %1, i8 %b, i8 0, !dbg !3260
  %xor11 = xor i8 %conv10, %mul9, !dbg !3264
    #dbg_value(i8 %xor11, !3261, !DIExpression(), !3256)
  %3 = and i8 %xor1, 4, !dbg !3265
  %mul16 = mul i8 %3, %b, !dbg !3266
  %xor18 = xor i8 %mul16, %xor11, !dbg !3267
    #dbg_value(i8 %xor18, !3261, !DIExpression(), !3256)
  %4 = and i8 %xor1, 8, !dbg !3268
  %mul23 = mul i8 %4, %b, !dbg !3269
  %xor25 = xor i8 %mul23, %xor18, !dbg !3270
    #dbg_value(i8 %xor25, !3261, !DIExpression(), !3256)
    #dbg_value(i8 %xor25, !3271, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !3256)
  %5 = lshr i8 %xor25, 4, !dbg !3272
  %6 = lshr i8 %xor25, 3, !dbg !3273
  %7 = and i8 %6, 14, !dbg !3273
  %8 = xor i8 %5, %7, !dbg !3274
  %xor25.masked = and i8 %xor25, 15, !dbg !3275
  %9 = xor i8 %8, %xor25.masked, !dbg !3275
    #dbg_value(i8 %9, !3276, !DIExpression(), !3256)
  ret i8 %9, !dbg !3277
}

; Function Attrs: nounwind
define internal fastcc zeroext i8 @lincomb.24(ptr noundef %a, ptr noundef %b, i32 noundef %n, i32 noundef %m) unnamed_addr #0 !dbg !3278 {
entry:
    #dbg_value(ptr %a, !3279, !DIExpression(), !3280)
    #dbg_value(ptr %b, !3281, !DIExpression(), !3280)
    #dbg_value(i32 %n, !3282, !DIExpression(), !3280)
    #dbg_value(i32 %m, !3283, !DIExpression(), !3280)
    #dbg_value(i8 0, !3284, !DIExpression(), !3280)
    #dbg_value(i32 0, !3285, !DIExpression(), !3287)
  %smax = call i32 @llvm.smax.i32(i32 %n, i32 0), !dbg !3288
  br label %for.cond, !dbg !3288

for.cond:                                         ; preds = %for.body, %entry
  %ret.0 = phi i8 [ 0, %entry ], [ %call1, %for.body ], !dbg !3280
  %b.addr.0 = phi ptr [ %b, %entry ], [ %add.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !3289
    #dbg_value(i32 %i.0, !3285, !DIExpression(), !3287)
    #dbg_value(ptr %b.addr.0, !3281, !DIExpression(), !3280)
    #dbg_value(i8 %ret.0, !3284, !DIExpression(), !3280)
  %exitcond.not = icmp eq i32 %i.0, %smax, !dbg !3290
  br i1 %exitcond.not, label %for.end, label %for.body, !dbg !3292

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %i.0, !dbg !3293
  %0 = load i8, ptr %arrayidx, align 1, !dbg !3293
  %1 = load i8, ptr %b.addr.0, align 1, !dbg !3295
  %call = call fastcc zeroext i8 @mul_f.23(i8 noundef zeroext %0, i8 noundef zeroext %1) #6, !dbg !3296
  %call1 = call fastcc zeroext i8 @add_f.25(i8 noundef zeroext %call, i8 noundef zeroext %ret.0) #6, !dbg !3297
    #dbg_value(i8 %call1, !3284, !DIExpression(), !3280)
  %inc = add nuw i32 %i.0, 1, !dbg !3298
    #dbg_value(i32 %inc, !3285, !DIExpression(), !3287)
  %add.ptr = getelementptr inbounds i8, ptr %b.addr.0, i32 %m, !dbg !3299
    #dbg_value(ptr %add.ptr, !3281, !DIExpression(), !3280)
  br label %for.cond, !dbg !3300, !llvm.loop !3301

for.end:                                          ; preds = %for.cond
  ret i8 %ret.0, !dbg !3303
}

; Function Attrs: nounwind
define internal fastcc zeroext i8 @add_f.25(i8 noundef zeroext %a, i8 noundef zeroext %b) unnamed_addr #0 !dbg !3304 {
entry:
    #dbg_value(i8 %a, !3305, !DIExpression(), !3306)
    #dbg_value(i8 %b, !3307, !DIExpression(), !3306)
  %xor1 = xor i8 %a, %b, !dbg !3308
  ret i8 %xor1, !dbg !3309
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
!167 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sk_t", file: !79, line: 291, size: 3129408, elements: !168)
!168 = !{!169, !173}
!169 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !167, file: !79, line: 292, baseType: !170, size: 3120768)
!170 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 3120768, elements: !171)
!171 = !{!172}
!172 = !DISubrange(count: 48762)
!173 = !DIDerivedType(tag: DW_TAG_member, name: "O", scope: !167, file: !79, line: 293, baseType: !174, size: 8640, offset: 3120768)
!174 = !DICompositeType(tag: DW_TAG_array_type, baseType: !175, size: 8640, elements: !177)
!175 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !54, line: 24, baseType: !176)
!176 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !56, line: 43, baseType: !51)
!177 = !{!178}
!178 = !DISubrange(count: 1080)
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
!261 = distinct !DISubprogram(name: "pqmayo_MAYO_3_ref_mayo_keypair", scope: !68, file: !68, line: 298, type: !262, scopeLine: 298, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
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
!301 = distinct !DISubprogram(name: "pqmayo_MAYO_3_ref_mayo_keypair_compact", scope: !68, file: !68, line: 538, type: !262, scopeLine: 539, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!302 = !DILocalVariable(name: "p", arg: 1, scope: !301, file: !68, line: 538, type: !264)
!303 = !DILocation(line: 0, scope: !301)
!304 = !DILocalVariable(name: "cpk", arg: 2, scope: !301, file: !68, line: 538, type: !61)
!305 = !DILocalVariable(name: "csk", arg: 3, scope: !301, file: !68, line: 539, type: !61)
!306 = !DILocalVariable(name: "ret", scope: !301, file: !68, line: 540, type: !86)
!307 = !DILocalVariable(name: "seed_sk", scope: !301, file: !68, line: 541, type: !61)
!308 = !DILocalVariable(name: "S", scope: !301, file: !68, line: 542, type: !309)
!309 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 4448, elements: !310)
!310 = !{!311}
!311 = !DISubrange(count: 556)
!312 = !DILocation(line: 542, column: 19, scope: !301)
!313 = !DILocalVariable(name: "P", scope: !301, file: !68, line: 543, type: !170)
!314 = !DILocation(line: 543, column: 14, scope: !301)
!315 = !DILocalVariable(name: "P3", scope: !301, file: !68, line: 544, type: !316)
!316 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 44800, elements: !317)
!317 = !{!318}
!318 = !DISubrange(count: 700)
!319 = !DILocation(line: 544, column: 14, scope: !301)
!320 = !DILocalVariable(name: "O", scope: !301, file: !68, line: 547, type: !321)
!321 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 8640, elements: !177)
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
!347 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 24640, elements: !348)
!348 = !{!349}
!349 = !DISubrange(count: 385)
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
!669 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 448, elements: !10)
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
!694 = distinct !DISubprogram(name: "pqmayo_MAYO_3_ref_mayo_expand_sk", scope: !68, file: !68, line: 310, type: !695, scopeLine: 311, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!695 = !DISubroutineType(types: !696)
!696 = !{!86, !264, !90, !697}
!697 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !698, size: 32)
!698 = !DIDerivedType(tag: DW_TAG_typedef, name: "sk_t", file: !79, line: 294, baseType: !699)
!699 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sk_t", file: !79, line: 291, size: 3129408, elements: !700)
!700 = !{!701, !702}
!701 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !699, file: !79, line: 292, baseType: !170, size: 3120768)
!702 = !DIDerivedType(tag: DW_TAG_member, name: "O", scope: !699, file: !79, line: 293, baseType: !174, size: 8640, offset: 3120768)
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
!797 = distinct !DISubprogram(name: "pqmayo_MAYO_3_ref_mayo_sign_signature", scope: !68, file: !68, line: 359, type: !798, scopeLine: 361, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
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
!809 = !DILocalVariable(name: "tenc", scope: !797, file: !68, line: 363, type: !810)
!810 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 432, elements: !811)
!811 = !{!812}
!812 = !DISubrange(count: 54)
!813 = !DILocation(line: 363, column: 19, scope: !797)
!814 = !DILocalVariable(name: "t", scope: !797, file: !68, line: 363, type: !815)
!815 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 864, elements: !816)
!816 = !{!817}
!817 = !DISubrange(count: 108)
!818 = !DILocation(line: 363, column: 38, scope: !797)
!819 = !DILocalVariable(name: "y", scope: !797, file: !68, line: 364, type: !815)
!820 = !DILocation(line: 364, column: 19, scope: !797)
!821 = !DILocalVariable(name: "salt", scope: !797, file: !68, line: 365, type: !184)
!822 = !DILocation(line: 365, column: 19, scope: !797)
!823 = !DILocalVariable(name: "V", scope: !797, file: !68, line: 366, type: !824)
!824 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 5192, elements: !825)
!825 = !{!826}
!826 = !DISubrange(count: 649)
!827 = !DILocation(line: 366, column: 19, scope: !797)
!828 = !DILocalVariable(name: "Vdec", scope: !797, file: !68, line: 366, type: !829)
!829 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 9504, elements: !830)
!830 = !{!831}
!831 = !DISubrange(count: 1188)
!832 = !DILocation(line: 366, column: 57, scope: !797)
!833 = !DILocalVariable(name: "A", scope: !797, file: !68, line: 367, type: !834)
!834 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 99456, elements: !835)
!835 = !{!836}
!836 = !DISubrange(count: 12432)
!837 = !DILocation(line: 367, column: 19, scope: !797)
!838 = !DILocalVariable(name: "x", scope: !797, file: !68, line: 368, type: !839)
!839 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 10384, elements: !840)
!840 = !{!841}
!841 = !DISubrange(count: 1298)
!842 = !DILocation(line: 368, column: 19, scope: !797)
!843 = !DILocalVariable(name: "r", scope: !797, file: !68, line: 369, type: !844)
!844 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 888, elements: !845)
!845 = !{!846}
!846 = !DISubrange(count: 111)
!847 = !DILocation(line: 369, column: 19, scope: !797)
!848 = !DILocalVariable(name: "s", scope: !797, file: !68, line: 370, type: !839)
!849 = !DILocation(line: 370, column: 19, scope: !797)
!850 = !DILocalVariable(name: "sk", scope: !797, file: !68, line: 372, type: !698, align: 256)
!851 = !DILocation(line: 372, column: 22, scope: !797)
!852 = !DILocalVariable(name: "Ox", scope: !797, file: !68, line: 373, type: !815)
!853 = !DILocation(line: 373, column: 19, scope: !797)
!854 = !DILocalVariable(name: "tmp", scope: !797, file: !68, line: 374, type: !855)
!855 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 904, elements: !856)
!856 = !{!857}
!857 = !DISubrange(count: 113)
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
!881 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 49280, elements: !882)
!882 = !{!883}
!883 = !DISubrange(count: 770)
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
!933 = !DILocation(line: 461, column: 27, scope: !929)
!934 = !DILocation(line: 461, column: 9, scope: !923)
!935 = !DILocation(line: 461, column: 39, scope: !929)
!936 = !DILocation(line: 461, column: 9, scope: !929)
!937 = distinct !{!937, !934, !938, !388}
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
!1011 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 532224, elements: !1012)
!1012 = !{!1013}
!1013 = !DISubrange(count: 8316)
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
!1029 = !DILocalVariable(name: "mask", scope: !1030, file: !68, line: 53, type: !53)
!1030 = distinct !DILexicalBlock(scope: !1031, file: !68, line: 52, column: 29)
!1031 = distinct !DILexicalBlock(scope: !1018, file: !68, line: 52, column: 8)
!1032 = !DILocation(line: 0, scope: !1030)
!1033 = !DILocalVariable(name: "i", scope: !1034, file: !68, line: 56, type: !86)
!1034 = distinct !DILexicalBlock(scope: !1030, file: !68, line: 56, column: 9)
!1035 = !DILocation(line: 0, scope: !1034)
!1036 = !DILocation(line: 56, column: 14, scope: !1034)
!1037 = !DILocation(line: 56, scope: !1034)
!1038 = !DILocation(line: 58, column: 13, scope: !1039)
!1039 = distinct !DILexicalBlock(scope: !1040, file: !68, line: 57, column: 9)
!1040 = distinct !DILexicalBlock(scope: !1034, file: !68, line: 56, column: 9)
!1041 = !DILocation(line: 58, column: 50, scope: !1039)
!1042 = !DILocation(line: 56, column: 27, scope: !1040)
!1043 = !DILocation(line: 56, column: 9, scope: !1034)
!1044 = !DILocation(line: 56, column: 53, scope: !1040)
!1045 = !DILocation(line: 56, column: 9, scope: !1040)
!1046 = distinct !{!1046, !1043, !1047, !388}
!1047 = !DILocation(line: 59, column: 9, scope: !1034)
!1048 = !DILocalVariable(name: "temp", scope: !1018, file: !68, line: 62, type: !669)
!1049 = !DILocation(line: 62, column: 14, scope: !1018)
!1050 = !DILocalVariable(name: "temp_bytes", scope: !1018, file: !68, line: 63, type: !61)
!1051 = !DILocalVariable(name: "i", scope: !1052, file: !68, line: 64, type: !86)
!1052 = distinct !DILexicalBlock(scope: !1018, file: !68, line: 64, column: 5)
!1053 = !DILocation(line: 0, scope: !1052)
!1054 = !DILocation(line: 64, column: 10, scope: !1052)
!1055 = !DILocation(line: 64, scope: !1052)
!1056 = !DILocation(line: 64, column: 36, scope: !1057)
!1057 = distinct !DILexicalBlock(scope: !1052, file: !68, line: 64, column: 5)
!1058 = !DILocation(line: 64, column: 5, scope: !1052)
!1059 = !DILocation(line: 65, scope: !1060)
!1060 = distinct !DILexicalBlock(scope: !1061, file: !68, line: 65, column: 9)
!1061 = distinct !DILexicalBlock(scope: !1057, file: !68, line: 64, column: 48)
!1062 = !DILocalVariable(name: "j", scope: !1060, file: !68, line: 65, type: !86)
!1063 = !DILocation(line: 0, scope: !1060)
!1064 = !DILocation(line: 65, column: 27, scope: !1065)
!1065 = distinct !DILexicalBlock(scope: !1060, file: !68, line: 65, column: 9)
!1066 = !DILocation(line: 65, column: 9, scope: !1060)
!1067 = !DILocation(line: 67, column: 34, scope: !1068)
!1068 = distinct !DILexicalBlock(scope: !1065, file: !68, line: 65, column: 46)
!1069 = !DILocation(line: 67, column: 54, scope: !1068)
!1070 = !DILocation(line: 67, column: 66, scope: !1068)
!1071 = !DILocalVariable(name: "top", scope: !1068, file: !68, line: 67, type: !51)
!1072 = !DILocation(line: 0, scope: !1068)
!1073 = !DILocation(line: 68, column: 13, scope: !1068)
!1074 = !DILocation(line: 68, column: 33, scope: !1068)
!1075 = !DILocalVariable(name: "k", scope: !1076, file: !68, line: 69, type: !86)
!1076 = distinct !DILexicalBlock(scope: !1068, file: !68, line: 69, column: 13)
!1077 = !DILocation(line: 0, scope: !1076)
!1078 = !DILocation(line: 70, column: 30, scope: !1079)
!1079 = distinct !DILexicalBlock(scope: !1080, file: !68, line: 69, column: 52)
!1080 = distinct !DILexicalBlock(scope: !1076, file: !68, line: 69, column: 13)
!1081 = !DILocation(line: 70, column: 38, scope: !1079)
!1082 = !DILocation(line: 70, column: 17, scope: !1079)
!1083 = !DILocation(line: 70, column: 27, scope: !1079)
!1084 = !DILocation(line: 71, column: 17, scope: !1079)
!1085 = !DILocation(line: 71, column: 25, scope: !1079)
!1086 = !DILocalVariable(name: "jj", scope: !1087, file: !68, line: 74, type: !86)
!1087 = distinct !DILexicalBlock(scope: !1068, file: !68, line: 74, column: 13)
!1088 = !DILocation(line: 0, scope: !1087)
!1089 = !DILocation(line: 79, column: 41, scope: !1090)
!1090 = distinct !DILexicalBlock(scope: !1091, file: !68, line: 75, column: 30)
!1091 = distinct !DILexicalBlock(scope: !1092, file: !68, line: 75, column: 20)
!1092 = distinct !DILexicalBlock(scope: !1093, file: !68, line: 74, column: 53)
!1093 = distinct !DILexicalBlock(scope: !1087, file: !68, line: 74, column: 13)
!1094 = !DILocation(line: 79, column: 38, scope: !1090)
!1095 = !DILocation(line: 86, column: 41, scope: !1096)
!1096 = distinct !DILexicalBlock(scope: !1091, file: !68, line: 82, column: 22)
!1097 = !DILocation(line: 86, column: 73, scope: !1096)
!1098 = !DILocation(line: 86, column: 38, scope: !1096)
!1099 = !DILocation(line: 79, column: 21, scope: !1090)
!1100 = !DILocation(line: 86, column: 21, scope: !1096)
!1101 = !DILocalVariable(name: "k", scope: !1102, file: !68, line: 92, type: !58)
!1102 = distinct !DILexicalBlock(scope: !1068, file: !68, line: 92, column: 13)
!1103 = !DILocation(line: 0, scope: !1102)
!1104 = !DILocation(line: 93, column: 36, scope: !1105)
!1105 = distinct !DILexicalBlock(scope: !1106, file: !68, line: 92, column: 51)
!1106 = distinct !DILexicalBlock(scope: !1102, file: !68, line: 92, column: 13)
!1107 = !DILocation(line: 93, column: 49, scope: !1105)
!1108 = !DILocation(line: 93, column: 28, scope: !1105)
!1109 = !DILocation(line: 93, column: 78, scope: !1105)
!1110 = !DILocation(line: 93, column: 91, scope: !1105)
!1111 = !DILocation(line: 93, column: 104, scope: !1105)
!1112 = !DILocation(line: 93, column: 83, scope: !1105)
!1113 = !DILocation(line: 93, column: 82, scope: !1105)
!1114 = !DILocation(line: 93, column: 73, scope: !1105)
!1115 = !DILocation(line: 93, column: 25, scope: !1105)
!1116 = !DILocation(line: 93, column: 17, scope: !1105)
!1117 = !DILocation(line: 65, column: 42, scope: !1065)
!1118 = !DILocation(line: 65, column: 9, scope: !1065)
!1119 = distinct !{!1119, !1066, !1120, !388}
!1120 = !DILocation(line: 95, column: 9, scope: !1060)
!1121 = !DILocation(line: 64, column: 44, scope: !1057)
!1122 = !DILocation(line: 64, column: 5, scope: !1057)
!1123 = distinct !{!1123, !1058, !1124, !388}
!1124 = !DILocation(line: 96, column: 5, scope: !1052)
!1125 = !DILocation(line: 99, scope: !1126)
!1126 = distinct !DILexicalBlock(scope: !1018, file: !68, line: 99, column: 5)
!1127 = !DILocalVariable(name: "i", scope: !1126, file: !68, line: 99, type: !86)
!1128 = !DILocation(line: 0, scope: !1126)
!1129 = !DILocation(line: 105, column: 18, scope: !1130)
!1130 = distinct !DILexicalBlock(scope: !1131, file: !68, line: 100, column: 5)
!1131 = distinct !DILexicalBlock(scope: !1126, file: !68, line: 99, column: 5)
!1132 = !DILocation(line: 105, column: 40, scope: !1130)
!1133 = !DILocation(line: 105, column: 28, scope: !1130)
!1134 = !DILocation(line: 105, column: 44, scope: !1130)
!1135 = !DILocation(line: 105, column: 25, scope: !1130)
!1136 = !DILocation(line: 105, column: 9, scope: !1130)
!1137 = !DILocation(line: 105, column: 16, scope: !1130)
!1138 = !DILocation(line: 106, column: 21, scope: !1130)
!1139 = !DILocation(line: 106, column: 18, scope: !1130)
!1140 = !DILocation(line: 106, column: 44, scope: !1130)
!1141 = !DILocation(line: 106, column: 25, scope: !1130)
!1142 = !DILocation(line: 106, column: 12, scope: !1130)
!1143 = !DILocation(line: 106, column: 9, scope: !1130)
!1144 = !DILocation(line: 106, column: 16, scope: !1130)
!1145 = !DILocation(line: 99, column: 38, scope: !1131)
!1146 = !DILocation(line: 99, column: 23, scope: !1131)
!1147 = !DILocation(line: 99, column: 5, scope: !1126)
!1148 = !DILocation(line: 99, column: 5, scope: !1131)
!1149 = distinct !{!1149, !1147, !1150, !388}
!1150 = !DILocation(line: 108, column: 5, scope: !1126)
!1151 = !DILocation(line: 109, column: 1, scope: !1018)
!1152 = distinct !DISubprogram(name: "compute_A", scope: !68, file: !68, line: 154, type: !1153, scopeLine: 154, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1153 = !DISubroutineType(types: !1154)
!1154 = !{null, !264, !52, !61}
!1155 = !DILocalVariable(name: "p", arg: 1, scope: !1152, file: !68, line: 154, type: !264)
!1156 = !DILocation(line: 0, scope: !1152)
!1157 = !DILocalVariable(name: "VtL", arg: 2, scope: !1152, file: !68, line: 154, type: !52)
!1158 = !DILocalVariable(name: "A_out", arg: 3, scope: !1152, file: !68, line: 154, type: !61)
!1159 = !DILocalVariable(name: "bits_to_shift", scope: !1152, file: !68, line: 159, type: !86)
!1160 = !DILocalVariable(name: "words_to_shift", scope: !1152, file: !68, line: 160, type: !86)
!1161 = !DILocalVariable(name: "m_vec_limbs", scope: !1152, file: !68, line: 161, type: !324)
!1162 = !DILocalVariable(name: "A", scope: !1152, file: !68, line: 162, type: !1163)
!1163 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 100352, elements: !1164)
!1164 = !{!1165}
!1165 = !DISubrange(count: 1568)
!1166 = !DILocation(line: 162, column: 14, scope: !1152)
!1167 = !DILocalVariable(name: "A_width", scope: !1152, file: !68, line: 163, type: !58)
!1168 = !DILocalVariable(name: "mask", scope: !1169, file: !68, line: 168, type: !53)
!1169 = distinct !DILexicalBlock(scope: !1170, file: !68, line: 167, column: 29)
!1170 = distinct !DILexicalBlock(scope: !1152, file: !68, line: 167, column: 8)
!1171 = !DILocation(line: 0, scope: !1169)
!1172 = !DILocalVariable(name: "i", scope: !1173, file: !68, line: 171, type: !86)
!1173 = distinct !DILexicalBlock(scope: !1169, file: !68, line: 171, column: 9)
!1174 = !DILocation(line: 0, scope: !1173)
!1175 = !DILocation(line: 171, column: 14, scope: !1173)
!1176 = !DILocation(line: 171, scope: !1173)
!1177 = !DILocation(line: 173, column: 13, scope: !1178)
!1178 = distinct !DILexicalBlock(scope: !1179, file: !68, line: 172, column: 9)
!1179 = distinct !DILexicalBlock(scope: !1173, file: !68, line: 171, column: 9)
!1180 = !DILocation(line: 173, column: 50, scope: !1178)
!1181 = !DILocation(line: 171, column: 53, scope: !1179)
!1182 = !DILocation(line: 171, column: 27, scope: !1179)
!1183 = !DILocation(line: 171, column: 9, scope: !1173)
!1184 = !DILocation(line: 171, column: 9, scope: !1179)
!1185 = distinct !{!1185, !1183, !1186, !388}
!1186 = !DILocation(line: 174, column: 9, scope: !1173)
!1187 = !DILocation(line: 177, scope: !1188)
!1188 = distinct !DILexicalBlock(scope: !1152, file: !68, line: 177, column: 5)
!1189 = !DILocation(line: 160, column: 9, scope: !1152)
!1190 = !DILocation(line: 159, column: 9, scope: !1152)
!1191 = !DILocalVariable(name: "i", scope: !1188, file: !68, line: 177, type: !86)
!1192 = !DILocation(line: 0, scope: !1188)
!1193 = !DILocation(line: 177, column: 23, scope: !1194)
!1194 = distinct !DILexicalBlock(scope: !1188, file: !68, line: 177, column: 5)
!1195 = !DILocation(line: 177, column: 5, scope: !1188)
!1196 = !DILocation(line: 178, scope: !1197)
!1197 = distinct !DILexicalBlock(scope: !1198, file: !68, line: 178, column: 9)
!1198 = distinct !DILexicalBlock(scope: !1194, file: !68, line: 177, column: 47)
!1199 = !DILocalVariable(name: "j", scope: !1197, file: !68, line: 178, type: !86)
!1200 = !DILocation(line: 0, scope: !1197)
!1201 = !DILocation(line: 178, column: 40, scope: !1202)
!1202 = distinct !DILexicalBlock(scope: !1197, file: !68, line: 178, column: 9)
!1203 = !DILocation(line: 178, column: 9, scope: !1197)
!1204 = !DILocation(line: 180, column: 22, scope: !1205)
!1205 = distinct !DILexicalBlock(scope: !1202, file: !68, line: 178, column: 51)
!1206 = !DILocalVariable(name: "Mj", scope: !1152, file: !68, line: 164, type: !411)
!1207 = !DILocalVariable(name: "c", scope: !1208, file: !68, line: 181, type: !86)
!1208 = distinct !DILexicalBlock(scope: !1205, file: !68, line: 181, column: 13)
!1209 = !DILocation(line: 0, scope: !1208)
!1210 = !DILocation(line: 181, column: 18, scope: !1208)
!1211 = !DILocation(line: 181, scope: !1208)
!1212 = !DILocation(line: 181, column: 31, scope: !1213)
!1213 = distinct !DILexicalBlock(scope: !1208, file: !68, line: 181, column: 13)
!1214 = !DILocation(line: 181, column: 13, scope: !1208)
!1215 = !DILocalVariable(name: "k", scope: !1216, file: !68, line: 182, type: !86)
!1216 = distinct !DILexicalBlock(scope: !1217, file: !68, line: 182, column: 17)
!1217 = distinct !DILexicalBlock(scope: !1213, file: !68, line: 181, column: 50)
!1218 = !DILocation(line: 0, scope: !1216)
!1219 = !DILocation(line: 184, column: 78, scope: !1220)
!1220 = distinct !DILexicalBlock(scope: !1221, file: !68, line: 183, column: 17)
!1221 = distinct !DILexicalBlock(scope: !1216, file: !68, line: 182, column: 17)
!1222 = !DILocation(line: 184, column: 100, scope: !1220)
!1223 = !DILocation(line: 184, column: 35, scope: !1220)
!1224 = !DILocation(line: 184, column: 39, scope: !1220)
!1225 = !DILocation(line: 184, column: 65, scope: !1220)
!1226 = !DILocation(line: 184, column: 43, scope: !1220)
!1227 = !DILocation(line: 184, column: 21, scope: !1220)
!1228 = !DILocation(line: 184, column: 75, scope: !1220)
!1229 = !DILocation(line: 185, column: 38, scope: !1230)
!1230 = distinct !DILexicalBlock(scope: !1220, file: !68, line: 185, column: 24)
!1231 = !DILocation(line: 186, column: 86, scope: !1232)
!1232 = distinct !DILexicalBlock(scope: !1230, file: !68, line: 185, column: 42)
!1233 = !DILocation(line: 186, column: 114, scope: !1232)
!1234 = !DILocation(line: 186, column: 108, scope: !1232)
!1235 = !DILocation(line: 186, column: 39, scope: !1232)
!1236 = !DILocation(line: 186, column: 43, scope: !1232)
!1237 = !DILocation(line: 186, column: 73, scope: !1232)
!1238 = !DILocation(line: 186, column: 47, scope: !1232)
!1239 = !DILocation(line: 186, column: 25, scope: !1232)
!1240 = !DILocation(line: 186, column: 83, scope: !1232)
!1241 = !DILocation(line: 187, column: 21, scope: !1232)
!1242 = !DILocation(line: 181, column: 46, scope: !1213)
!1243 = !DILocation(line: 181, column: 13, scope: !1213)
!1244 = distinct !{!1244, !1214, !1245, !388}
!1245 = !DILocation(line: 189, column: 13, scope: !1208)
!1246 = !DILocation(line: 191, column: 19, scope: !1247)
!1247 = distinct !DILexicalBlock(scope: !1205, file: !68, line: 191, column: 17)
!1248 = !DILocation(line: 192, column: 26, scope: !1249)
!1249 = distinct !DILexicalBlock(scope: !1247, file: !68, line: 191, column: 25)
!1250 = !DILocalVariable(name: "Mi", scope: !1152, file: !68, line: 164, type: !411)
!1251 = !DILocalVariable(name: "c", scope: !1252, file: !68, line: 193, type: !86)
!1252 = distinct !DILexicalBlock(scope: !1249, file: !68, line: 193, column: 17)
!1253 = !DILocation(line: 0, scope: !1252)
!1254 = !DILocation(line: 193, column: 22, scope: !1252)
!1255 = !DILocation(line: 193, scope: !1252)
!1256 = !DILocation(line: 193, column: 35, scope: !1257)
!1257 = distinct !DILexicalBlock(scope: !1252, file: !68, line: 193, column: 17)
!1258 = !DILocation(line: 193, column: 17, scope: !1252)
!1259 = !DILocalVariable(name: "k", scope: !1260, file: !68, line: 194, type: !86)
!1260 = distinct !DILexicalBlock(scope: !1261, file: !68, line: 194, column: 21)
!1261 = distinct !DILexicalBlock(scope: !1257, file: !68, line: 193, column: 54)
!1262 = !DILocation(line: 0, scope: !1260)
!1263 = !DILocation(line: 196, column: 81, scope: !1264)
!1264 = distinct !DILexicalBlock(scope: !1265, file: !68, line: 195, column: 21)
!1265 = distinct !DILexicalBlock(scope: !1260, file: !68, line: 194, column: 21)
!1266 = !DILocation(line: 196, column: 103, scope: !1264)
!1267 = !DILocation(line: 196, column: 38, scope: !1264)
!1268 = !DILocation(line: 196, column: 42, scope: !1264)
!1269 = !DILocation(line: 196, column: 68, scope: !1264)
!1270 = !DILocation(line: 196, column: 46, scope: !1264)
!1271 = !DILocation(line: 196, column: 25, scope: !1264)
!1272 = !DILocation(line: 196, column: 78, scope: !1264)
!1273 = !DILocation(line: 197, column: 42, scope: !1274)
!1274 = distinct !DILexicalBlock(scope: !1264, file: !68, line: 197, column: 28)
!1275 = !DILocation(line: 198, column: 89, scope: !1276)
!1276 = distinct !DILexicalBlock(scope: !1274, file: !68, line: 197, column: 46)
!1277 = !DILocation(line: 198, column: 117, scope: !1276)
!1278 = !DILocation(line: 198, column: 111, scope: !1276)
!1279 = !DILocation(line: 198, column: 42, scope: !1276)
!1280 = !DILocation(line: 198, column: 46, scope: !1276)
!1281 = !DILocation(line: 198, column: 76, scope: !1276)
!1282 = !DILocation(line: 198, column: 50, scope: !1276)
!1283 = !DILocation(line: 198, column: 29, scope: !1276)
!1284 = !DILocation(line: 198, column: 86, scope: !1276)
!1285 = !DILocation(line: 199, column: 25, scope: !1276)
!1286 = !DILocation(line: 193, column: 50, scope: !1257)
!1287 = !DILocation(line: 193, column: 17, scope: !1257)
!1288 = distinct !{!1288, !1258, !1289, !388}
!1289 = !DILocation(line: 201, column: 17, scope: !1252)
!1290 = !DILocation(line: 204, column: 27, scope: !1205)
!1291 = !DILocation(line: 205, column: 30, scope: !1292)
!1292 = distinct !DILexicalBlock(scope: !1205, file: !68, line: 205, column: 16)
!1293 = !DILocation(line: 178, column: 46, scope: !1202)
!1294 = !DILocation(line: 178, column: 9, scope: !1202)
!1295 = distinct !{!1295, !1203, !1296, !388}
!1296 = !DILocation(line: 209, column: 9, scope: !1197)
!1297 = !DILocation(line: 177, column: 42, scope: !1194)
!1298 = !DILocation(line: 177, column: 5, scope: !1194)
!1299 = distinct !{!1299, !1195, !1300, !388}
!1300 = !DILocation(line: 210, column: 5, scope: !1188)
!1301 = !DILocation(line: 212, scope: !1302)
!1302 = distinct !DILexicalBlock(scope: !1152, file: !68, line: 212, column: 5)
!1303 = !DILocalVariable(name: "c", scope: !1302, file: !68, line: 212, type: !58)
!1304 = !DILocation(line: 0, scope: !1302)
!1305 = !DILocation(line: 212, column: 26, scope: !1306)
!1306 = distinct !DILexicalBlock(scope: !1302, file: !68, line: 212, column: 5)
!1307 = !DILocation(line: 212, column: 5, scope: !1302)
!1308 = !DILocation(line: 214, column: 35, scope: !1309)
!1309 = distinct !DILexicalBlock(scope: !1306, file: !68, line: 213, column: 5)
!1310 = !DILocation(line: 214, column: 9, scope: !1309)
!1311 = !DILocation(line: 212, column: 91, scope: !1306)
!1312 = !DILocation(line: 212, column: 5, scope: !1306)
!1313 = distinct !{!1313, !1307, !1314, !388}
!1314 = !DILocation(line: 215, column: 5, scope: !1302)
!1315 = !DILocalVariable(name: "tab", scope: !1152, file: !68, line: 217, type: !1316)
!1316 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 128, elements: !1317)
!1317 = !{!1318}
!1318 = !DISubrange(count: 16)
!1319 = !DILocation(line: 217, column: 19, scope: !1152)
!1320 = !DILocalVariable(name: "i", scope: !1321, file: !68, line: 218, type: !58)
!1321 = distinct !DILexicalBlock(scope: !1152, file: !68, line: 218, column: 5)
!1322 = !DILocation(line: 0, scope: !1321)
!1323 = !DILocation(line: 218, column: 10, scope: !1321)
!1324 = !DILocation(line: 218, scope: !1321)
!1325 = !DILocation(line: 218, column: 26, scope: !1326)
!1326 = distinct !DILexicalBlock(scope: !1321, file: !68, line: 218, column: 5)
!1327 = !DILocation(line: 218, column: 5, scope: !1321)
!1328 = !DILocation(line: 220, column: 28, scope: !1329)
!1329 = distinct !DILexicalBlock(scope: !1326, file: !68, line: 219, column: 5)
!1330 = !DILocation(line: 220, column: 22, scope: !1329)
!1331 = !DILocation(line: 220, column: 14, scope: !1329)
!1332 = !DILocation(line: 220, column: 9, scope: !1329)
!1333 = !DILocation(line: 220, column: 20, scope: !1329)
!1334 = !DILocation(line: 221, column: 22, scope: !1329)
!1335 = !DILocation(line: 221, column: 14, scope: !1329)
!1336 = !DILocation(line: 221, column: 16, scope: !1329)
!1337 = !DILocation(line: 221, column: 9, scope: !1329)
!1338 = !DILocation(line: 221, column: 20, scope: !1329)
!1339 = !DILocation(line: 222, column: 22, scope: !1329)
!1340 = !DILocation(line: 222, column: 14, scope: !1329)
!1341 = !DILocation(line: 222, column: 16, scope: !1329)
!1342 = !DILocation(line: 222, column: 9, scope: !1329)
!1343 = !DILocation(line: 222, column: 20, scope: !1329)
!1344 = !DILocation(line: 223, column: 22, scope: !1329)
!1345 = !DILocation(line: 223, column: 14, scope: !1329)
!1346 = !DILocation(line: 223, column: 16, scope: !1329)
!1347 = !DILocation(line: 223, column: 9, scope: !1329)
!1348 = !DILocation(line: 223, column: 20, scope: !1329)
!1349 = !DILocation(line: 218, column: 41, scope: !1326)
!1350 = !DILocation(line: 218, column: 5, scope: !1326)
!1351 = distinct !{!1351, !1327, !1352, !388}
!1352 = !DILocation(line: 224, column: 5, scope: !1321)
!1353 = !DILocation(line: 228, scope: !1354)
!1354 = distinct !DILexicalBlock(scope: !1152, file: !68, line: 228, column: 5)
!1355 = !DILocalVariable(name: "c", scope: !1354, file: !68, line: 228, type: !58)
!1356 = !DILocation(line: 0, scope: !1354)
!1357 = !DILocation(line: 228, column: 26, scope: !1358)
!1358 = distinct !DILexicalBlock(scope: !1354, file: !68, line: 228, column: 5)
!1359 = !DILocation(line: 228, column: 5, scope: !1354)
!1360 = !DILocation(line: 230, scope: !1361)
!1361 = distinct !DILexicalBlock(scope: !1362, file: !68, line: 230, column: 9)
!1362 = distinct !DILexicalBlock(scope: !1358, file: !68, line: 229, column: 5)
!1363 = !DILocalVariable(name: "r", scope: !1361, file: !68, line: 230, type: !86)
!1364 = !DILocation(line: 0, scope: !1361)
!1365 = !DILocation(line: 230, column: 36, scope: !1366)
!1366 = distinct !DILexicalBlock(scope: !1361, file: !68, line: 230, column: 9)
!1367 = !DILocation(line: 230, column: 9, scope: !1361)
!1368 = !DILocation(line: 232, column: 28, scope: !1369)
!1369 = distinct !DILexicalBlock(scope: !1366, file: !68, line: 231, column: 9)
!1370 = !DILocation(line: 232, column: 32, scope: !1369)
!1371 = !DILocation(line: 232, column: 41, scope: !1369)
!1372 = !DILocation(line: 232, column: 49, scope: !1369)
!1373 = !DILocation(line: 232, column: 45, scope: !1369)
!1374 = !DILocalVariable(name: "pos", scope: !1369, file: !68, line: 232, type: !58)
!1375 = !DILocation(line: 0, scope: !1369)
!1376 = !DILocation(line: 233, column: 28, scope: !1369)
!1377 = !DILocation(line: 233, column: 41, scope: !1369)
!1378 = !DILocalVariable(name: "t0", scope: !1369, file: !68, line: 233, type: !53)
!1379 = !DILocation(line: 234, column: 35, scope: !1369)
!1380 = !DILocation(line: 234, column: 41, scope: !1369)
!1381 = !DILocalVariable(name: "t1", scope: !1369, file: !68, line: 234, type: !53)
!1382 = !DILocation(line: 235, column: 35, scope: !1369)
!1383 = !DILocation(line: 235, column: 41, scope: !1369)
!1384 = !DILocalVariable(name: "t2", scope: !1369, file: !68, line: 235, type: !53)
!1385 = !DILocation(line: 236, column: 28, scope: !1369)
!1386 = !DILocation(line: 236, column: 35, scope: !1369)
!1387 = !DILocation(line: 236, column: 41, scope: !1369)
!1388 = !DILocalVariable(name: "t3", scope: !1369, file: !68, line: 236, type: !53)
!1389 = !DILocalVariable(name: "t", scope: !1390, file: !68, line: 237, type: !58)
!1390 = distinct !DILexicalBlock(scope: !1369, file: !68, line: 237, column: 13)
!1391 = !DILocation(line: 0, scope: !1390)
!1392 = !DILocation(line: 239, column: 84, scope: !1393)
!1393 = distinct !DILexicalBlock(scope: !1394, file: !68, line: 238, column: 13)
!1394 = distinct !DILexicalBlock(scope: !1390, file: !68, line: 237, column: 13)
!1395 = !DILocation(line: 239, column: 83, scope: !1393)
!1396 = !DILocation(line: 239, column: 100, scope: !1393)
!1397 = !DILocation(line: 239, column: 99, scope: !1393)
!1398 = !DILocation(line: 239, column: 95, scope: !1393)
!1399 = !DILocation(line: 239, column: 116, scope: !1393)
!1400 = !DILocation(line: 239, column: 115, scope: !1393)
!1401 = !DILocation(line: 239, column: 111, scope: !1393)
!1402 = !DILocation(line: 239, column: 132, scope: !1393)
!1403 = !DILocation(line: 239, column: 131, scope: !1393)
!1404 = !DILocation(line: 239, column: 127, scope: !1393)
!1405 = !DILocation(line: 239, column: 24, scope: !1393)
!1406 = !DILocation(line: 239, column: 36, scope: !1393)
!1407 = !DILocation(line: 239, column: 40, scope: !1393)
!1408 = !DILocation(line: 239, column: 49, scope: !1393)
!1409 = !DILocation(line: 239, column: 60, scope: !1393)
!1410 = !DILocation(line: 239, column: 72, scope: !1393)
!1411 = !DILocation(line: 239, column: 53, scope: !1393)
!1412 = !DILocation(line: 239, column: 17, scope: !1393)
!1413 = !DILocation(line: 239, column: 78, scope: !1393)
!1414 = !DILocation(line: 230, column: 82, scope: !1366)
!1415 = !DILocation(line: 230, column: 9, scope: !1366)
!1416 = distinct !{!1416, !1367, !1417, !388}
!1417 = !DILocation(line: 241, column: 9, scope: !1361)
!1418 = !DILocation(line: 228, column: 38, scope: !1358)
!1419 = !DILocation(line: 228, column: 5, scope: !1358)
!1420 = distinct !{!1420, !1359, !1421, !388}
!1421 = !DILocation(line: 242, column: 5, scope: !1354)
!1422 = !DILocation(line: 250, scope: !1423)
!1423 = distinct !DILexicalBlock(scope: !1152, file: !68, line: 250, column: 5)
!1424 = !DILocalVariable(name: "r", scope: !1423, file: !68, line: 250, type: !86)
!1425 = !DILocation(line: 0, scope: !1423)
!1426 = !DILocation(line: 250, column: 23, scope: !1427)
!1427 = distinct !DILexicalBlock(scope: !1423, file: !68, line: 250, column: 5)
!1428 = !DILocation(line: 250, column: 5, scope: !1423)
!1429 = !DILocation(line: 252, scope: !1430)
!1430 = distinct !DILexicalBlock(scope: !1431, file: !68, line: 252, column: 9)
!1431 = distinct !DILexicalBlock(scope: !1427, file: !68, line: 251, column: 5)
!1432 = !DILocalVariable(name: "c", scope: !1430, file: !68, line: 252, type: !86)
!1433 = !DILocation(line: 0, scope: !1430)
!1434 = !DILocation(line: 254, column: 13, scope: !1435)
!1435 = distinct !DILexicalBlock(scope: !1436, file: !68, line: 254, column: 13)
!1436 = distinct !DILexicalBlock(scope: !1437, file: !68, line: 253, column: 9)
!1437 = distinct !DILexicalBlock(scope: !1430, file: !68, line: 252, column: 9)
!1438 = !DILocation(line: 254, scope: !1435)
!1439 = !DILocalVariable(name: "i", scope: !1435, file: !68, line: 254, type: !86)
!1440 = !DILocation(line: 0, scope: !1435)
!1441 = !DILocation(line: 254, column: 35, scope: !1442)
!1442 = distinct !DILexicalBlock(scope: !1435, file: !68, line: 254, column: 13)
!1443 = !DILocation(line: 256, column: 55, scope: !1444)
!1444 = distinct !DILexicalBlock(scope: !1442, file: !68, line: 255, column: 13)
!1445 = !DILocation(line: 256, column: 59, scope: !1444)
!1446 = !DILocation(line: 256, column: 63, scope: !1444)
!1447 = !DILocation(line: 256, column: 44, scope: !1444)
!1448 = !DILocation(line: 256, column: 95, scope: !1444)
!1449 = !DILocation(line: 256, column: 92, scope: !1444)
!1450 = !DILocation(line: 256, column: 75, scope: !1444)
!1451 = !DILocation(line: 256, column: 99, scope: !1444)
!1452 = !DILocation(line: 256, column: 17, scope: !1444)
!1453 = !DILocation(line: 254, column: 50, scope: !1442)
!1454 = !DILocation(line: 254, column: 13, scope: !1442)
!1455 = distinct !{!1455, !1434, !1456, !388}
!1456 = !DILocation(line: 257, column: 13, scope: !1435)
!1457 = !DILocation(line: 252, column: 50, scope: !1437)
!1458 = !DILocation(line: 252, column: 27, scope: !1437)
!1459 = !DILocation(line: 252, column: 9, scope: !1430)
!1460 = !DILocation(line: 256, column: 104, scope: !1444)
!1461 = !DILocation(line: 252, column: 9, scope: !1437)
!1462 = distinct !{!1462, !1459, !1463, !388}
!1463 = !DILocation(line: 258, column: 9, scope: !1430)
!1464 = !DILocation(line: 250, column: 38, scope: !1427)
!1465 = !DILocation(line: 250, column: 5, scope: !1427)
!1466 = distinct !{!1466, !1428, !1467, !388}
!1467 = !DILocation(line: 259, column: 5, scope: !1423)
!1468 = !DILocation(line: 260, column: 1, scope: !1152)
!1469 = distinct !DISubprogram(name: "mat_mul", scope: !577, file: !577, line: 79, type: !1470, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1470 = !DISubroutineType(types: !1471)
!1471 = !{null, !90, !90, !61, !86, !86, !86}
!1472 = !DILocalVariable(name: "a", arg: 1, scope: !1469, file: !577, line: 79, type: !90)
!1473 = !DILocation(line: 0, scope: !1469)
!1474 = !DILocalVariable(name: "b", arg: 2, scope: !1469, file: !577, line: 79, type: !90)
!1475 = !DILocalVariable(name: "c", arg: 3, scope: !1469, file: !577, line: 80, type: !61)
!1476 = !DILocalVariable(name: "colrow_ab", arg: 4, scope: !1469, file: !577, line: 80, type: !86)
!1477 = !DILocalVariable(name: "row_a", arg: 5, scope: !1469, file: !577, line: 80, type: !86)
!1478 = !DILocalVariable(name: "col_b", arg: 6, scope: !1469, file: !577, line: 80, type: !86)
!1479 = !DILocalVariable(name: "i", scope: !1480, file: !577, line: 81, type: !86)
!1480 = distinct !DILexicalBlock(scope: !1469, file: !577, line: 81, column: 5)
!1481 = !DILocation(line: 0, scope: !1480)
!1482 = !DILocation(line: 81, column: 10, scope: !1480)
!1483 = !DILocation(line: 81, scope: !1480)
!1484 = !DILocation(line: 81, column: 23, scope: !1485)
!1485 = distinct !DILexicalBlock(scope: !1480, file: !577, line: 81, column: 5)
!1486 = !DILocation(line: 81, column: 5, scope: !1480)
!1487 = !DILocation(line: 82, scope: !1488)
!1488 = distinct !DILexicalBlock(scope: !1489, file: !577, line: 82, column: 9)
!1489 = distinct !DILexicalBlock(scope: !1485, file: !577, line: 81, column: 53)
!1490 = !DILocalVariable(name: "j", scope: !1488, file: !577, line: 82, type: !86)
!1491 = !DILocation(line: 0, scope: !1488)
!1492 = !DILocation(line: 82, column: 27, scope: !1493)
!1493 = distinct !DILexicalBlock(scope: !1488, file: !577, line: 82, column: 9)
!1494 = !DILocation(line: 82, column: 9, scope: !1488)
!1495 = !DILocation(line: 83, column: 31, scope: !1496)
!1496 = distinct !DILexicalBlock(scope: !1493, file: !577, line: 82, column: 46)
!1497 = !DILocation(line: 83, column: 18, scope: !1496)
!1498 = !DILocation(line: 83, column: 16, scope: !1496)
!1499 = !DILocation(line: 82, column: 36, scope: !1493)
!1500 = !DILocation(line: 82, column: 41, scope: !1493)
!1501 = !DILocation(line: 82, column: 9, scope: !1493)
!1502 = distinct !{!1502, !1494, !1503, !388}
!1503 = !DILocation(line: 84, column: 9, scope: !1488)
!1504 = !DILocation(line: 81, column: 32, scope: !1485)
!1505 = !DILocation(line: 81, column: 39, scope: !1485)
!1506 = !DILocation(line: 81, column: 5, scope: !1485)
!1507 = distinct !{!1507, !1486, !1508, !388}
!1508 = !DILocation(line: 85, column: 5, scope: !1480)
!1509 = !DILocation(line: 86, column: 18, scope: !1469)
!1510 = !DILocation(line: 86, column: 5, scope: !1469)
!1511 = !DILocation(line: 87, column: 1, scope: !1469)
!1512 = distinct !DISubprogram(name: "mat_add", scope: !577, file: !577, line: 89, type: !1513, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1513 = !DISubroutineType(types: !1514)
!1514 = !{null, !90, !90, !61, !86, !86}
!1515 = !DILocalVariable(name: "a", arg: 1, scope: !1512, file: !577, line: 89, type: !90)
!1516 = !DILocation(line: 0, scope: !1512)
!1517 = !DILocalVariable(name: "b", arg: 2, scope: !1512, file: !577, line: 89, type: !90)
!1518 = !DILocalVariable(name: "c", arg: 3, scope: !1512, file: !577, line: 90, type: !61)
!1519 = !DILocalVariable(name: "m", arg: 4, scope: !1512, file: !577, line: 90, type: !86)
!1520 = !DILocalVariable(name: "n", arg: 5, scope: !1512, file: !577, line: 90, type: !86)
!1521 = !DILocalVariable(name: "i", scope: !1522, file: !577, line: 91, type: !86)
!1522 = distinct !DILexicalBlock(scope: !1512, file: !577, line: 91, column: 5)
!1523 = !DILocation(line: 0, scope: !1522)
!1524 = !DILocation(line: 91, column: 10, scope: !1522)
!1525 = !DILocation(line: 91, scope: !1522)
!1526 = !DILocation(line: 91, column: 23, scope: !1527)
!1527 = distinct !DILexicalBlock(scope: !1522, file: !577, line: 91, column: 5)
!1528 = !DILocation(line: 91, column: 5, scope: !1522)
!1529 = !DILocation(line: 92, scope: !1530)
!1530 = distinct !DILexicalBlock(scope: !1531, file: !577, line: 92, column: 9)
!1531 = distinct !DILexicalBlock(scope: !1527, file: !577, line: 91, column: 33)
!1532 = !DILocalVariable(name: "j", scope: !1530, file: !577, line: 92, type: !86)
!1533 = !DILocation(line: 0, scope: !1530)
!1534 = !DILocation(line: 92, column: 27, scope: !1535)
!1535 = distinct !DILexicalBlock(scope: !1530, file: !577, line: 92, column: 9)
!1536 = !DILocation(line: 92, column: 9, scope: !1530)
!1537 = !DILocation(line: 93, column: 46, scope: !1538)
!1538 = distinct !DILexicalBlock(scope: !1535, file: !577, line: 92, column: 37)
!1539 = !DILocation(line: 93, column: 42, scope: !1538)
!1540 = !DILocation(line: 93, column: 50, scope: !1538)
!1541 = !DILocation(line: 93, column: 38, scope: !1538)
!1542 = !DILocation(line: 93, column: 64, scope: !1538)
!1543 = !DILocation(line: 93, column: 60, scope: !1538)
!1544 = !DILocation(line: 93, column: 68, scope: !1538)
!1545 = !DILocation(line: 93, column: 56, scope: !1538)
!1546 = !DILocation(line: 93, column: 32, scope: !1538)
!1547 = !DILocation(line: 93, column: 21, scope: !1538)
!1548 = !DILocation(line: 93, column: 17, scope: !1538)
!1549 = !DILocation(line: 93, column: 25, scope: !1538)
!1550 = !DILocation(line: 93, column: 30, scope: !1538)
!1551 = !DILocation(line: 92, column: 32, scope: !1535)
!1552 = !DILocation(line: 92, column: 9, scope: !1535)
!1553 = distinct !{!1553, !1536, !1554, !388}
!1554 = !DILocation(line: 94, column: 9, scope: !1530)
!1555 = !DILocation(line: 91, column: 28, scope: !1527)
!1556 = !DILocation(line: 91, column: 5, scope: !1527)
!1557 = distinct !{!1557, !1528, !1558, !388}
!1558 = !DILocation(line: 95, column: 5, scope: !1522)
!1559 = !DILocation(line: 96, column: 1, scope: !1512)
!1560 = distinct !DISubprogram(name: "encode", scope: !68, file: !68, line: 32, type: !361, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1561 = !DILocalVariable(name: "m", arg: 1, scope: !1560, file: !68, line: 32, type: !90)
!1562 = !DILocation(line: 0, scope: !1560)
!1563 = !DILocalVariable(name: "menc", arg: 2, scope: !1560, file: !68, line: 32, type: !61)
!1564 = !DILocalVariable(name: "mlen", arg: 3, scope: !1560, file: !68, line: 32, type: !86)
!1565 = !DILocalVariable(name: "i", scope: !1560, file: !68, line: 33, type: !86)
!1566 = !DILocation(line: 34, column: 10, scope: !1567)
!1567 = distinct !DILexicalBlock(scope: !1560, file: !68, line: 34, column: 5)
!1568 = !DILocation(line: 34, scope: !1567)
!1569 = !DILocation(line: 34, column: 26, scope: !1570)
!1570 = distinct !DILexicalBlock(scope: !1567, file: !68, line: 34, column: 5)
!1571 = !DILocation(line: 34, column: 19, scope: !1570)
!1572 = !DILocation(line: 34, column: 5, scope: !1567)
!1573 = !DILocation(line: 35, column: 20, scope: !1574)
!1574 = distinct !DILexicalBlock(scope: !1570, file: !68, line: 34, column: 44)
!1575 = !DILocation(line: 35, column: 31, scope: !1574)
!1576 = !DILocation(line: 35, column: 27, scope: !1574)
!1577 = !DILocation(line: 35, column: 36, scope: !1574)
!1578 = !DILocation(line: 35, column: 24, scope: !1574)
!1579 = !DILocation(line: 35, column: 9, scope: !1574)
!1580 = !DILocation(line: 35, column: 17, scope: !1574)
!1581 = !DILocation(line: 34, column: 31, scope: !1570)
!1582 = !DILocation(line: 34, column: 38, scope: !1570)
!1583 = !DILocation(line: 34, column: 5, scope: !1570)
!1584 = distinct !{!1584, !1572, !1585, !388}
!1585 = !DILocation(line: 36, column: 5, scope: !1567)
!1586 = !DILocation(line: 38, column: 18, scope: !1587)
!1587 = distinct !DILexicalBlock(scope: !1560, file: !68, line: 38, column: 9)
!1588 = !DILocation(line: 39, column: 20, scope: !1589)
!1589 = distinct !DILexicalBlock(scope: !1587, file: !68, line: 38, column: 24)
!1590 = !DILocation(line: 39, column: 9, scope: !1589)
!1591 = !DILocation(line: 39, column: 17, scope: !1589)
!1592 = !DILocation(line: 40, column: 5, scope: !1589)
!1593 = !DILocation(line: 41, column: 1, scope: !1560)
!1594 = distinct !DISubprogram(name: "add_f", scope: !577, file: !577, line: 43, type: !1595, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1595 = !DISubroutineType(types: !1596)
!1596 = !{!51, !51, !51}
!1597 = !DILocalVariable(name: "a", arg: 1, scope: !1594, file: !577, line: 43, type: !51)
!1598 = !DILocation(line: 0, scope: !1594)
!1599 = !DILocalVariable(name: "b", arg: 2, scope: !1594, file: !577, line: 43, type: !51)
!1600 = !DILocation(line: 44, column: 14, scope: !1594)
!1601 = !DILocation(line: 44, column: 5, scope: !1594)
!1602 = distinct !DISubprogram(name: "lincomb", scope: !577, file: !577, line: 70, type: !1603, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1603 = !DISubroutineType(types: !1604)
!1604 = !{!51, !90, !90, !86, !86}
!1605 = !DILocalVariable(name: "a", arg: 1, scope: !1602, file: !577, line: 70, type: !90)
!1606 = !DILocation(line: 0, scope: !1602)
!1607 = !DILocalVariable(name: "b", arg: 2, scope: !1602, file: !577, line: 71, type: !90)
!1608 = !DILocalVariable(name: "n", arg: 3, scope: !1602, file: !577, line: 71, type: !86)
!1609 = !DILocalVariable(name: "m", arg: 4, scope: !1602, file: !577, line: 71, type: !86)
!1610 = !DILocalVariable(name: "ret", scope: !1602, file: !577, line: 72, type: !51)
!1611 = !DILocalVariable(name: "i", scope: !1612, file: !577, line: 73, type: !86)
!1612 = distinct !DILexicalBlock(scope: !1602, file: !577, line: 73, column: 5)
!1613 = !DILocation(line: 0, scope: !1612)
!1614 = !DILocation(line: 73, column: 10, scope: !1612)
!1615 = !DILocation(line: 73, scope: !1612)
!1616 = !DILocation(line: 73, column: 23, scope: !1617)
!1617 = distinct !DILexicalBlock(scope: !1612, file: !577, line: 73, column: 5)
!1618 = !DILocation(line: 73, column: 5, scope: !1612)
!1619 = !DILocation(line: 74, column: 27, scope: !1620)
!1620 = distinct !DILexicalBlock(scope: !1617, file: !577, line: 73, column: 41)
!1621 = !DILocation(line: 74, column: 33, scope: !1620)
!1622 = !DILocation(line: 74, column: 21, scope: !1620)
!1623 = !DILocation(line: 74, column: 15, scope: !1620)
!1624 = !DILocation(line: 73, column: 28, scope: !1617)
!1625 = !DILocation(line: 73, column: 35, scope: !1617)
!1626 = !DILocation(line: 73, column: 5, scope: !1617)
!1627 = distinct !{!1627, !1618, !1628, !388}
!1628 = !DILocation(line: 75, column: 5, scope: !1612)
!1629 = !DILocation(line: 76, column: 5, scope: !1602)
!1630 = distinct !DISubprogram(name: "mul_f", scope: !577, file: !577, line: 9, type: !1595, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1631 = !DILocalVariable(name: "a", arg: 1, scope: !1630, file: !577, line: 9, type: !51)
!1632 = !DILocation(line: 0, scope: !1630)
!1633 = !DILocalVariable(name: "b", arg: 2, scope: !1630, file: !577, line: 9, type: !51)
!1634 = !DILocation(line: 14, column: 10, scope: !1630)
!1635 = !DILocation(line: 14, column: 7, scope: !1630)
!1636 = !DILocation(line: 17, column: 17, scope: !1630)
!1637 = !DILocalVariable(name: "p", scope: !1630, file: !577, line: 11, type: !51)
!1638 = !DILocation(line: 18, column: 13, scope: !1630)
!1639 = !DILocation(line: 18, column: 17, scope: !1630)
!1640 = !DILocation(line: 18, column: 7, scope: !1630)
!1641 = !DILocation(line: 19, column: 13, scope: !1630)
!1642 = !DILocation(line: 19, column: 17, scope: !1630)
!1643 = !DILocation(line: 19, column: 7, scope: !1630)
!1644 = !DILocation(line: 20, column: 13, scope: !1630)
!1645 = !DILocation(line: 20, column: 17, scope: !1630)
!1646 = !DILocation(line: 20, column: 7, scope: !1630)
!1647 = !DILocalVariable(name: "top_p", scope: !1630, file: !577, line: 23, type: !51)
!1648 = !DILocation(line: 24, column: 37, scope: !1630)
!1649 = !DILocation(line: 24, column: 52, scope: !1630)
!1650 = !DILocation(line: 24, column: 43, scope: !1630)
!1651 = !DILocation(line: 24, column: 59, scope: !1630)
!1652 = !DILocalVariable(name: "out", scope: !1630, file: !577, line: 24, type: !51)
!1653 = !DILocation(line: 25, column: 5, scope: !1630)
!1654 = !DILocalVariable(name: "M", arg: 1, scope: !67, file: !68, line: 111, type: !52)
!1655 = !DILocation(line: 0, scope: !67)
!1656 = !DILocalVariable(name: "i", scope: !1657, file: !68, line: 117, type: !58)
!1657 = distinct !DILexicalBlock(scope: !67, file: !68, line: 117, column: 5)
!1658 = !DILocation(line: 0, scope: !1657)
!1659 = !DILocation(line: 119, column: 24, scope: !1660)
!1660 = distinct !DILexicalBlock(scope: !1661, file: !68, line: 118, column: 5)
!1661 = distinct !DILexicalBlock(scope: !1657, file: !68, line: 117, column: 5)
!1662 = !DILocation(line: 119, column: 29, scope: !1660)
!1663 = !DILocation(line: 119, column: 38, scope: !1660)
!1664 = !DILocation(line: 119, column: 36, scope: !1660)
!1665 = !DILocation(line: 119, column: 46, scope: !1660)
!1666 = !DILocalVariable(name: "t", scope: !1660, file: !68, line: 119, type: !53)
!1667 = !DILocation(line: 0, scope: !1660)
!1668 = !DILocation(line: 120, column: 21, scope: !1660)
!1669 = !DILocation(line: 120, column: 16, scope: !1660)
!1670 = !DILocation(line: 121, column: 9, scope: !1660)
!1671 = !DILocation(line: 121, column: 16, scope: !1660)
!1672 = !DILocation(line: 120, column: 9, scope: !1660)
!1673 = !DILocalVariable(name: "i", scope: !1674, file: !68, line: 124, type: !58)
!1674 = distinct !DILexicalBlock(scope: !67, file: !68, line: 124, column: 5)
!1675 = !DILocation(line: 0, scope: !1674)
!1676 = !DILocation(line: 126, column: 25, scope: !1677)
!1677 = distinct !DILexicalBlock(scope: !1678, file: !68, line: 125, column: 5)
!1678 = distinct !DILexicalBlock(scope: !1674, file: !68, line: 124, column: 5)
!1679 = !DILocation(line: 126, column: 32, scope: !1677)
!1680 = !DILocation(line: 126, column: 40, scope: !1677)
!1681 = !DILocation(line: 126, column: 38, scope: !1677)
!1682 = !DILocation(line: 126, column: 48, scope: !1677)
!1683 = !DILocalVariable(name: "t0", scope: !1677, file: !68, line: 126, type: !53)
!1684 = !DILocation(line: 0, scope: !1677)
!1685 = !DILocation(line: 127, column: 25, scope: !1677)
!1686 = !DILocation(line: 127, column: 32, scope: !1677)
!1687 = !DILocation(line: 127, column: 40, scope: !1677)
!1688 = !DILocation(line: 127, column: 38, scope: !1677)
!1689 = !DILocation(line: 127, column: 48, scope: !1677)
!1690 = !DILocalVariable(name: "t1", scope: !1677, file: !68, line: 127, type: !53)
!1691 = !DILocation(line: 128, column: 23, scope: !1677)
!1692 = !DILocation(line: 128, column: 16, scope: !1677)
!1693 = !DILocation(line: 129, column: 23, scope: !1677)
!1694 = !DILocation(line: 129, column: 9, scope: !1677)
!1695 = !DILocation(line: 129, column: 16, scope: !1677)
!1696 = !DILocation(line: 130, column: 9, scope: !1677)
!1697 = !DILocation(line: 130, column: 16, scope: !1677)
!1698 = !DILocation(line: 131, column: 9, scope: !1677)
!1699 = !DILocation(line: 131, column: 16, scope: !1677)
!1700 = !DILocation(line: 128, column: 9, scope: !1677)
!1701 = !DILocalVariable(name: "i", scope: !1702, file: !68, line: 134, type: !58)
!1702 = distinct !DILexicalBlock(scope: !67, file: !68, line: 134, column: 5)
!1703 = !DILocation(line: 0, scope: !1702)
!1704 = !DILocation(line: 136, column: 25, scope: !1705)
!1705 = distinct !DILexicalBlock(scope: !1706, file: !68, line: 135, column: 5)
!1706 = distinct !DILexicalBlock(scope: !1702, file: !68, line: 134, column: 5)
!1707 = !DILocation(line: 136, column: 32, scope: !1705)
!1708 = !DILocation(line: 136, column: 41, scope: !1705)
!1709 = !DILocation(line: 136, column: 39, scope: !1705)
!1710 = !DILocation(line: 136, column: 50, scope: !1705)
!1711 = !DILocalVariable(name: "t0", scope: !1705, file: !68, line: 136, type: !53)
!1712 = !DILocation(line: 0, scope: !1705)
!1713 = !DILocation(line: 137, column: 25, scope: !1705)
!1714 = !DILocation(line: 137, column: 32, scope: !1705)
!1715 = !DILocation(line: 137, column: 41, scope: !1705)
!1716 = !DILocation(line: 137, column: 39, scope: !1705)
!1717 = !DILocation(line: 137, column: 50, scope: !1705)
!1718 = !DILocalVariable(name: "t1", scope: !1705, file: !68, line: 137, type: !53)
!1719 = !DILocation(line: 139, column: 23, scope: !1705)
!1720 = !DILocation(line: 139, column: 17, scope: !1705)
!1721 = !DILocation(line: 140, column: 23, scope: !1705)
!1722 = !DILocation(line: 140, column: 9, scope: !1705)
!1723 = !DILocation(line: 140, column: 17, scope: !1705)
!1724 = !DILocation(line: 141, column: 9, scope: !1705)
!1725 = !DILocation(line: 141, column: 17, scope: !1705)
!1726 = !DILocation(line: 142, column: 9, scope: !1705)
!1727 = !DILocation(line: 142, column: 17, scope: !1705)
!1728 = !DILocation(line: 139, column: 9, scope: !1705)
!1729 = !DILocalVariable(name: "i", scope: !1730, file: !68, line: 145, type: !58)
!1730 = distinct !DILexicalBlock(scope: !67, file: !68, line: 145, column: 5)
!1731 = !DILocation(line: 0, scope: !1730)
!1732 = !DILocation(line: 147, column: 24, scope: !1733)
!1733 = distinct !DILexicalBlock(scope: !1734, file: !68, line: 146, column: 5)
!1734 = distinct !DILexicalBlock(scope: !1730, file: !68, line: 145, column: 5)
!1735 = !DILocation(line: 147, column: 28, scope: !1733)
!1736 = !DILocation(line: 147, column: 36, scope: !1733)
!1737 = !DILocation(line: 147, column: 44, scope: !1733)
!1738 = !DILocalVariable(name: "t", scope: !1733, file: !68, line: 147, type: !53)
!1739 = !DILocation(line: 0, scope: !1733)
!1740 = !DILocation(line: 148, column: 21, scope: !1733)
!1741 = !DILocation(line: 148, column: 16, scope: !1733)
!1742 = !DILocation(line: 149, column: 9, scope: !1733)
!1743 = !DILocation(line: 149, column: 16, scope: !1733)
!1744 = !DILocation(line: 148, column: 9, scope: !1733)
!1745 = !DILocation(line: 151, column: 1, scope: !67)
!1746 = distinct !DISubprogram(name: "mul_add_mat_x_m_mat", scope: !408, file: !408, line: 61, type: !469, scopeLine: 62, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1747 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !1746, file: !408, line: 61, type: !324)
!1748 = !DILocation(line: 0, scope: !1746)
!1749 = !DILocalVariable(name: "mat", arg: 2, scope: !1746, file: !408, line: 61, type: !90)
!1750 = !DILocalVariable(name: "bs_mat", arg: 3, scope: !1746, file: !408, line: 61, type: !411)
!1751 = !DILocalVariable(name: "acc", arg: 4, scope: !1746, file: !408, line: 61, type: !52)
!1752 = !DILocalVariable(name: "mat_rows", arg: 5, scope: !1746, file: !408, line: 62, type: !324)
!1753 = !DILocalVariable(name: "mat_cols", arg: 6, scope: !1746, file: !408, line: 62, type: !324)
!1754 = !DILocalVariable(name: "bs_mat_cols", arg: 7, scope: !1746, file: !408, line: 62, type: !324)
!1755 = !DILocalVariable(name: "r", scope: !1756, file: !408, line: 64, type: !86)
!1756 = distinct !DILexicalBlock(scope: !1746, file: !408, line: 64, column: 5)
!1757 = !DILocation(line: 0, scope: !1756)
!1758 = !DILocation(line: 64, column: 10, scope: !1756)
!1759 = !DILocation(line: 64, scope: !1756)
!1760 = !DILocation(line: 64, column: 23, scope: !1761)
!1761 = distinct !DILexicalBlock(scope: !1756, file: !408, line: 64, column: 5)
!1762 = !DILocation(line: 64, column: 5, scope: !1756)
!1763 = !DILocation(line: 65, scope: !1764)
!1764 = distinct !DILexicalBlock(scope: !1765, file: !408, line: 65, column: 9)
!1765 = distinct !DILexicalBlock(scope: !1761, file: !408, line: 64, column: 40)
!1766 = !DILocalVariable(name: "c", scope: !1764, file: !408, line: 65, type: !86)
!1767 = !DILocation(line: 0, scope: !1764)
!1768 = !DILocation(line: 65, column: 27, scope: !1769)
!1769 = distinct !DILexicalBlock(scope: !1764, file: !408, line: 65, column: 9)
!1770 = !DILocation(line: 65, column: 9, scope: !1764)
!1771 = !DILocation(line: 66, scope: !1772)
!1772 = distinct !DILexicalBlock(scope: !1773, file: !408, line: 66, column: 13)
!1773 = distinct !DILexicalBlock(scope: !1769, file: !408, line: 65, column: 44)
!1774 = !DILocalVariable(name: "k", scope: !1772, file: !408, line: 66, type: !86)
!1775 = !DILocation(line: 0, scope: !1772)
!1776 = !DILocation(line: 66, column: 31, scope: !1777)
!1777 = distinct !DILexicalBlock(scope: !1772, file: !408, line: 66, column: 13)
!1778 = !DILocation(line: 66, column: 13, scope: !1772)
!1779 = !DILocation(line: 67, column: 70, scope: !1780)
!1780 = distinct !DILexicalBlock(scope: !1777, file: !408, line: 66, column: 54)
!1781 = !DILocation(line: 67, column: 84, scope: !1780)
!1782 = !DILocation(line: 67, column: 65, scope: !1780)
!1783 = !DILocation(line: 67, column: 51, scope: !1780)
!1784 = !DILocation(line: 67, column: 96, scope: !1780)
!1785 = !DILocation(line: 67, column: 90, scope: !1780)
!1786 = !DILocation(line: 67, column: 136, scope: !1780)
!1787 = !DILocation(line: 67, column: 150, scope: !1780)
!1788 = !DILocation(line: 67, column: 131, scope: !1780)
!1789 = !DILocation(line: 67, column: 117, scope: !1780)
!1790 = !DILocation(line: 67, column: 17, scope: !1780)
!1791 = !DILocation(line: 66, column: 48, scope: !1777)
!1792 = !DILocation(line: 66, column: 13, scope: !1777)
!1793 = distinct !{!1793, !1778, !1794, !388}
!1794 = !DILocation(line: 68, column: 13, scope: !1772)
!1795 = !DILocation(line: 65, column: 40, scope: !1769)
!1796 = !DILocation(line: 65, column: 9, scope: !1769)
!1797 = distinct !{!1797, !1770, !1798, !388}
!1798 = !DILocation(line: 69, column: 9, scope: !1764)
!1799 = !DILocation(line: 64, column: 36, scope: !1761)
!1800 = !DILocation(line: 64, column: 5, scope: !1761)
!1801 = distinct !{!1801, !1762, !1802, !388}
!1802 = !DILocation(line: 70, column: 5, scope: !1756)
!1803 = !DILocation(line: 71, column: 1, scope: !1746)
!1804 = distinct !DISubprogram(name: "P1_times_Vt", scope: !408, file: !408, line: 82, type: !459, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1805 = !DILocalVariable(name: "p", arg: 1, scope: !1804, file: !408, line: 82, type: !264)
!1806 = !DILocation(line: 0, scope: !1804)
!1807 = !DILocalVariable(name: "P1", arg: 2, scope: !1804, file: !408, line: 82, type: !411)
!1808 = !DILocalVariable(name: "V", arg: 3, scope: !1804, file: !408, line: 82, type: !90)
!1809 = !DILocalVariable(name: "acc", arg: 4, scope: !1804, file: !408, line: 82, type: !52)
!1810 = !DILocation(line: 86, column: 5, scope: !1804)
!1811 = !DILocation(line: 87, column: 1, scope: !1804)
!1812 = distinct !DISubprogram(name: "mul_add_m_upper_triangular_mat_x_mat_trans", scope: !408, file: !408, line: 32, type: !593, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1813 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !1812, file: !408, line: 32, type: !324)
!1814 = !DILocation(line: 0, scope: !1812)
!1815 = !DILocalVariable(name: "bs_mat", arg: 2, scope: !1812, file: !408, line: 32, type: !411)
!1816 = !DILocalVariable(name: "mat", arg: 3, scope: !1812, file: !408, line: 32, type: !90)
!1817 = !DILocalVariable(name: "acc", arg: 4, scope: !1812, file: !408, line: 32, type: !52)
!1818 = !DILocalVariable(name: "bs_mat_rows", arg: 5, scope: !1812, file: !408, line: 33, type: !324)
!1819 = !DILocalVariable(name: "bs_mat_cols", arg: 6, scope: !1812, file: !408, line: 33, type: !324)
!1820 = !DILocalVariable(name: "mat_rows", arg: 7, scope: !1812, file: !408, line: 33, type: !324)
!1821 = !DILocalVariable(name: "triangular", arg: 8, scope: !1812, file: !408, line: 33, type: !324)
!1822 = !DILocalVariable(name: "bs_mat_entries_used", scope: !1812, file: !408, line: 34, type: !86)
!1823 = !DILocalVariable(name: "r", scope: !1824, file: !408, line: 35, type: !86)
!1824 = distinct !DILexicalBlock(scope: !1812, file: !408, line: 35, column: 5)
!1825 = !DILocation(line: 0, scope: !1824)
!1826 = !DILocation(line: 35, column: 10, scope: !1824)
!1827 = !DILocation(line: 34, column: 9, scope: !1812)
!1828 = !DILocation(line: 35, scope: !1824)
!1829 = !DILocation(line: 35, column: 23, scope: !1830)
!1830 = distinct !DILexicalBlock(scope: !1824, file: !408, line: 35, column: 5)
!1831 = !DILocation(line: 35, column: 5, scope: !1824)
!1832 = !DILocation(line: 36, column: 33, scope: !1833)
!1833 = distinct !DILexicalBlock(scope: !1834, file: !408, line: 36, column: 9)
!1834 = distinct !DILexicalBlock(scope: !1830, file: !408, line: 35, column: 43)
!1835 = !DILocalVariable(name: "c", scope: !1833, file: !408, line: 36, type: !86)
!1836 = !DILocation(line: 0, scope: !1833)
!1837 = !DILocation(line: 36, column: 14, scope: !1833)
!1838 = !DILocation(line: 36, scope: !1833)
!1839 = !DILocation(line: 36, column: 40, scope: !1840)
!1840 = distinct !DILexicalBlock(scope: !1833, file: !408, line: 36, column: 9)
!1841 = !DILocation(line: 36, column: 9, scope: !1833)
!1842 = !DILocation(line: 37, scope: !1843)
!1843 = distinct !DILexicalBlock(scope: !1844, file: !408, line: 37, column: 13)
!1844 = distinct !DILexicalBlock(scope: !1840, file: !408, line: 36, column: 60)
!1845 = !DILocalVariable(name: "k", scope: !1843, file: !408, line: 37, type: !86)
!1846 = !DILocation(line: 0, scope: !1843)
!1847 = !DILocation(line: 37, column: 31, scope: !1848)
!1848 = distinct !DILexicalBlock(scope: !1843, file: !408, line: 37, column: 13)
!1849 = !DILocation(line: 37, column: 13, scope: !1843)
!1850 = !DILocation(line: 38, column: 65, scope: !1851)
!1851 = distinct !DILexicalBlock(scope: !1848, file: !408, line: 37, column: 51)
!1852 = !DILocation(line: 38, column: 51, scope: !1851)
!1853 = !DILocation(line: 38, column: 94, scope: !1851)
!1854 = !DILocation(line: 38, column: 88, scope: !1851)
!1855 = !DILocation(line: 38, column: 137, scope: !1851)
!1856 = !DILocation(line: 38, column: 148, scope: !1851)
!1857 = !DILocation(line: 38, column: 132, scope: !1851)
!1858 = !DILocation(line: 38, column: 118, scope: !1851)
!1859 = !DILocation(line: 38, column: 17, scope: !1851)
!1860 = !DILocation(line: 37, column: 45, scope: !1848)
!1861 = !DILocation(line: 37, column: 13, scope: !1848)
!1862 = distinct !{!1862, !1849, !1863, !388}
!1863 = !DILocation(line: 39, column: 13, scope: !1843)
!1864 = !DILocation(line: 40, column: 33, scope: !1844)
!1865 = !DILocation(line: 36, column: 56, scope: !1840)
!1866 = !DILocation(line: 36, column: 9, scope: !1840)
!1867 = distinct !{!1867, !1841, !1868, !388}
!1868 = !DILocation(line: 41, column: 9, scope: !1833)
!1869 = !DILocation(line: 35, column: 39, scope: !1830)
!1870 = !DILocation(line: 35, column: 5, scope: !1830)
!1871 = distinct !{!1871, !1831, !1872, !388}
!1872 = !DILocation(line: 42, column: 5, scope: !1824)
!1873 = !DILocation(line: 43, column: 1, scope: !1812)
!1874 = distinct !DISubprogram(name: "pqmayo_MAYO_3_ref_mayo_sign", scope: !68, file: !68, line: 502, type: !798, scopeLine: 504, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1875 = !DILocalVariable(name: "p", arg: 1, scope: !1874, file: !68, line: 502, type: !264)
!1876 = !DILocation(line: 0, scope: !1874)
!1877 = !DILocalVariable(name: "sm", arg: 2, scope: !1874, file: !68, line: 502, type: !61)
!1878 = !DILocalVariable(name: "smlen", arg: 3, scope: !1874, file: !68, line: 503, type: !800)
!1879 = !DILocalVariable(name: "m", arg: 4, scope: !1874, file: !68, line: 503, type: !90)
!1880 = !DILocalVariable(name: "mlen", arg: 5, scope: !1874, file: !68, line: 504, type: !58)
!1881 = !DILocalVariable(name: "csk", arg: 6, scope: !1874, file: !68, line: 504, type: !90)
!1882 = !DILocalVariable(name: "ret", scope: !1874, file: !68, line: 505, type: !86)
!1883 = !DILocalVariable(name: "param_sig_bytes", scope: !1874, file: !68, line: 506, type: !324)
!1884 = !DILocation(line: 508, column: 16, scope: !1874)
!1885 = !DILocation(line: 508, column: 5, scope: !1874)
!1886 = !DILocation(line: 509, column: 50, scope: !1874)
!1887 = !DILocalVariable(name: "siglen", scope: !1874, file: !68, line: 507, type: !58)
!1888 = !DILocation(line: 509, column: 11, scope: !1874)
!1889 = !DILocation(line: 510, column: 13, scope: !1890)
!1890 = distinct !DILexicalBlock(scope: !1874, file: !68, line: 510, column: 9)
!1891 = !DILocation(line: 510, column: 24, scope: !1890)
!1892 = !DILocation(line: 511, column: 23, scope: !1893)
!1893 = distinct !DILexicalBlock(scope: !1890, file: !68, line: 510, column: 62)
!1894 = !DILocation(line: 511, column: 30, scope: !1893)
!1895 = !DILocation(line: 511, column: 9, scope: !1893)
!1896 = !DILocation(line: 512, column: 9, scope: !1893)
!1897 = !DILocation(line: 515, column: 14, scope: !1874)
!1898 = !DILocation(line: 515, column: 21, scope: !1874)
!1899 = !DILocation(line: 515, column: 12, scope: !1874)
!1900 = !DILocation(line: 515, column: 5, scope: !1874)
!1901 = !DILabel(scope: !1874, name: "err", file: !68, line: 516)
!1902 = !DILocation(line: 516, column: 1, scope: !1874)
!1903 = !DILocation(line: 517, column: 5, scope: !1874)
!1904 = distinct !DISubprogram(name: "pqmayo_MAYO_3_ref_mayo_open", scope: !68, file: !68, line: 520, type: !798, scopeLine: 522, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1905 = !DILocalVariable(name: "p", arg: 1, scope: !1904, file: !68, line: 520, type: !264)
!1906 = !DILocation(line: 0, scope: !1904)
!1907 = !DILocalVariable(name: "m", arg: 2, scope: !1904, file: !68, line: 520, type: !61)
!1908 = !DILocalVariable(name: "mlen", arg: 3, scope: !1904, file: !68, line: 521, type: !800)
!1909 = !DILocalVariable(name: "sm", arg: 4, scope: !1904, file: !68, line: 521, type: !90)
!1910 = !DILocalVariable(name: "smlen", arg: 5, scope: !1904, file: !68, line: 522, type: !58)
!1911 = !DILocalVariable(name: "pk", arg: 6, scope: !1904, file: !68, line: 522, type: !90)
!1912 = !DILocalVariable(name: "param_sig_bytes", scope: !1904, file: !68, line: 523, type: !324)
!1913 = !DILocation(line: 524, column: 15, scope: !1914)
!1914 = distinct !DILexicalBlock(scope: !1904, file: !68, line: 524, column: 9)
!1915 = !DILocation(line: 527, column: 36, scope: !1904)
!1916 = !DILocation(line: 527, column: 61, scope: !1904)
!1917 = !DILocation(line: 527, column: 18, scope: !1904)
!1918 = !DILocalVariable(name: "result", scope: !1904, file: !68, line: 527, type: !86)
!1919 = !DILocation(line: 530, column: 16, scope: !1920)
!1920 = distinct !DILexicalBlock(scope: !1904, file: !68, line: 530, column: 9)
!1921 = !DILocation(line: 531, column: 23, scope: !1922)
!1922 = distinct !DILexicalBlock(scope: !1920, file: !68, line: 530, column: 28)
!1923 = !DILocation(line: 531, column: 15, scope: !1922)
!1924 = !DILocation(line: 532, column: 23, scope: !1922)
!1925 = !DILocation(line: 532, column: 9, scope: !1922)
!1926 = !DILocation(line: 533, column: 5, scope: !1922)
!1927 = !DILocation(line: 536, column: 1, scope: !1904)
!1928 = distinct !DISubprogram(name: "pqmayo_MAYO_3_ref_mayo_verify", scope: !68, file: !68, line: 617, type: !1929, scopeLine: 619, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1929 = !DISubroutineType(types: !1930)
!1930 = !{!86, !264, !90, !58, !90, !90}
!1931 = !DILocalVariable(name: "p", arg: 1, scope: !1928, file: !68, line: 617, type: !264)
!1932 = !DILocation(line: 0, scope: !1928)
!1933 = !DILocalVariable(name: "m", arg: 2, scope: !1928, file: !68, line: 617, type: !90)
!1934 = !DILocalVariable(name: "mlen", arg: 3, scope: !1928, file: !68, line: 618, type: !58)
!1935 = !DILocalVariable(name: "sig", arg: 4, scope: !1928, file: !68, line: 618, type: !90)
!1936 = !DILocalVariable(name: "cpk", arg: 5, scope: !1928, file: !68, line: 619, type: !90)
!1937 = !DILocalVariable(name: "tEnc", scope: !1928, file: !68, line: 620, type: !810)
!1938 = !DILocation(line: 620, column: 19, scope: !1928)
!1939 = !DILocalVariable(name: "t", scope: !1928, file: !68, line: 621, type: !815)
!1940 = !DILocation(line: 621, column: 19, scope: !1928)
!1941 = !DILocalVariable(name: "y", scope: !1928, file: !68, line: 622, type: !1942)
!1942 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 1728, elements: !1943)
!1943 = !{!1944}
!1944 = !DISubrange(count: 216)
!1945 = !DILocation(line: 622, column: 19, scope: !1928)
!1946 = !DILocalVariable(name: "s", scope: !1928, file: !68, line: 623, type: !839)
!1947 = !DILocation(line: 623, column: 19, scope: !1928)
!1948 = !DILocalVariable(name: "pk", scope: !1928, file: !68, line: 624, type: !1949)
!1949 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 3145408, elements: !1950)
!1950 = !{!1951}
!1951 = !DISubrange(count: 49147)
!1952 = !DILocation(line: 624, column: 14, scope: !1928)
!1953 = !DILocalVariable(name: "tmp", scope: !1928, file: !68, line: 625, type: !1954)
!1954 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 640, elements: !1955)
!1955 = !{!1956}
!1956 = !DISubrange(count: 80)
!1957 = !DILocation(line: 625, column: 19, scope: !1928)
!1958 = !DILocalVariable(name: "param_m", scope: !1928, file: !68, line: 627, type: !324)
!1959 = !DILocalVariable(name: "param_n", scope: !1928, file: !68, line: 628, type: !324)
!1960 = !DILocalVariable(name: "param_k", scope: !1928, file: !68, line: 629, type: !324)
!1961 = !DILocalVariable(name: "param_m_bytes", scope: !1928, file: !68, line: 630, type: !324)
!1962 = !DILocalVariable(name: "param_sig_bytes", scope: !1928, file: !68, line: 631, type: !324)
!1963 = !DILocalVariable(name: "param_digest_bytes", scope: !1928, file: !68, line: 632, type: !324)
!1964 = !DILocalVariable(name: "param_salt_bytes", scope: !1928, file: !68, line: 633, type: !324)
!1965 = !DILocation(line: 635, column: 15, scope: !1928)
!1966 = !DILocalVariable(name: "ret", scope: !1928, file: !68, line: 635, type: !86)
!1967 = !DILocation(line: 636, column: 13, scope: !1968)
!1968 = distinct !DILexicalBlock(scope: !1928, file: !68, line: 636, column: 9)
!1969 = !DILocalVariable(name: "P1", scope: !1928, file: !68, line: 640, type: !52)
!1970 = !DILocation(line: 641, column: 23, scope: !1928)
!1971 = !DILocalVariable(name: "P2", scope: !1928, file: !68, line: 641, type: !52)
!1972 = !DILocation(line: 642, column: 23, scope: !1928)
!1973 = !DILocalVariable(name: "P3", scope: !1928, file: !68, line: 642, type: !52)
!1974 = !DILocation(line: 657, column: 5, scope: !1928)
!1975 = !DILocation(line: 660, column: 16, scope: !1928)
!1976 = !DILocation(line: 660, column: 60, scope: !1928)
!1977 = !DILocation(line: 660, column: 5, scope: !1928)
!1978 = !DILocation(line: 662, column: 5, scope: !1928)
!1979 = !DILocation(line: 663, column: 5, scope: !1928)
!1980 = !DILocation(line: 666, column: 5, scope: !1928)
!1981 = !DILocation(line: 668, column: 5, scope: !1928)
!1982 = !DILocation(line: 670, column: 9, scope: !1983)
!1983 = distinct !DILexicalBlock(scope: !1928, file: !68, line: 670, column: 9)
!1984 = !DILocation(line: 670, column: 31, scope: !1983)
!1985 = !DILocation(line: 674, column: 1, scope: !1928)
!1986 = distinct !DISubprogram(name: "pqmayo_MAYO_3_ref_mayo_expand_pk", scope: !68, file: !68, line: 608, type: !1987, scopeLine: 609, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1987 = !DISubroutineType(types: !1988)
!1988 = !{!86, !264, !90, !52}
!1989 = !DILocalVariable(name: "p", arg: 1, scope: !1986, file: !68, line: 608, type: !264)
!1990 = !DILocation(line: 0, scope: !1986)
!1991 = !DILocalVariable(name: "cpk", arg: 2, scope: !1986, file: !68, line: 608, type: !90)
!1992 = !DILocalVariable(name: "pk", arg: 3, scope: !1986, file: !68, line: 609, type: !52)
!1993 = !DILocation(line: 610, column: 5, scope: !1986)
!1994 = !DILocation(line: 612, column: 23, scope: !1986)
!1995 = !DILocation(line: 612, column: 72, scope: !1986)
!1996 = !DILocation(line: 612, column: 5, scope: !1986)
!1997 = !DILocation(line: 614, column: 5, scope: !1986)
!1998 = distinct !DISubprogram(name: "eval_public_map", scope: !68, file: !68, line: 288, type: !1999, scopeLine: 288, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1999 = !DISubroutineType(types: !2000)
!2000 = !{null, !264, !90, !411, !411, !411, !61}
!2001 = !DILocalVariable(name: "p", arg: 1, scope: !1998, file: !68, line: 288, type: !264)
!2002 = !DILocation(line: 0, scope: !1998)
!2003 = !DILocalVariable(name: "s", arg: 2, scope: !1998, file: !68, line: 288, type: !90)
!2004 = !DILocalVariable(name: "P1", arg: 3, scope: !1998, file: !68, line: 288, type: !411)
!2005 = !DILocalVariable(name: "P2", arg: 4, scope: !1998, file: !68, line: 288, type: !411)
!2006 = !DILocalVariable(name: "P3", arg: 5, scope: !1998, file: !68, line: 288, type: !411)
!2007 = !DILocalVariable(name: "eval", arg: 6, scope: !1998, file: !68, line: 288, type: !61)
!2008 = !DILocalVariable(name: "SPS", scope: !1998, file: !68, line: 289, type: !2009)
!2009 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 54208, elements: !2010)
!2010 = !{!2011}
!2011 = !DISubrange(count: 847)
!2012 = !DILocation(line: 289, column: 14, scope: !1998)
!2013 = !DILocation(line: 291, column: 5, scope: !1998)
!2014 = !DILocalVariable(name: "zero", scope: !1998, file: !68, line: 292, type: !815)
!2015 = !DILocation(line: 292, column: 19, scope: !1998)
!2016 = !DILocation(line: 293, column: 5, scope: !1998)
!2017 = !DILocation(line: 294, column: 1, scope: !1998)
!2018 = distinct !DISubprogram(name: "m_calculate_PS_SPS", scope: !408, file: !408, line: 277, type: !2019, scopeLine: 278, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2019 = !DISubroutineType(types: !2020)
!2020 = !{null, !264, !411, !411, !411, !90, !52}
!2021 = !DILocalVariable(name: "p", arg: 1, scope: !2018, file: !408, line: 277, type: !264)
!2022 = !DILocation(line: 0, scope: !2018)
!2023 = !DILocalVariable(name: "P1", arg: 2, scope: !2018, file: !408, line: 277, type: !411)
!2024 = !DILocalVariable(name: "P2", arg: 3, scope: !2018, file: !408, line: 277, type: !411)
!2025 = !DILocalVariable(name: "P3", arg: 4, scope: !2018, file: !408, line: 277, type: !411)
!2026 = !DILocalVariable(name: "s", arg: 5, scope: !2018, file: !408, line: 277, type: !90)
!2027 = !DILocalVariable(name: "SPS", arg: 6, scope: !2018, file: !408, line: 278, type: !52)
!2028 = !DILocalVariable(name: "PS", scope: !2018, file: !408, line: 286, type: !2029)
!2029 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 581504, elements: !2030)
!2030 = !{!2031}
!2031 = !DISubrange(count: 9086)
!2032 = !DILocation(line: 286, column: 14, scope: !2018)
!2033 = !DILocation(line: 287, column: 5, scope: !2018)
!2034 = !DILocation(line: 290, column: 5, scope: !2018)
!2035 = !DILocation(line: 292, column: 1, scope: !2018)
!2036 = distinct !DISubprogram(name: "mayo_generic_m_calculate_PS", scope: !408, file: !408, line: 151, type: !2037, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2037 = !DISubroutineType(types: !2038)
!2038 = !{null, !411, !411, !411, !90, !324, !324, !324, !324, !52}
!2039 = !DILocalVariable(name: "P1", arg: 1, scope: !2036, file: !408, line: 151, type: !411)
!2040 = !DILocation(line: 0, scope: !2036)
!2041 = !DILocalVariable(name: "P2", arg: 2, scope: !2036, file: !408, line: 151, type: !411)
!2042 = !DILocalVariable(name: "P3", arg: 3, scope: !2036, file: !408, line: 151, type: !411)
!2043 = !DILocalVariable(name: "S", arg: 4, scope: !2036, file: !408, line: 151, type: !90)
!2044 = !DILocalVariable(name: "m", arg: 5, scope: !2036, file: !408, line: 152, type: !324)
!2045 = !DILocalVariable(name: "v", arg: 6, scope: !2036, file: !408, line: 152, type: !324)
!2046 = !DILocalVariable(name: "o", arg: 7, scope: !2036, file: !408, line: 152, type: !324)
!2047 = !DILocalVariable(name: "k", arg: 8, scope: !2036, file: !408, line: 152, type: !324)
!2048 = !DILocalVariable(name: "PS", arg: 9, scope: !2036, file: !408, line: 152, type: !52)
!2049 = !DILocation(line: 154, column: 21, scope: !2036)
!2050 = !DILocalVariable(name: "n", scope: !2036, file: !408, line: 154, type: !324)
!2051 = !DILocation(line: 155, column: 32, scope: !2036)
!2052 = !DILocation(line: 155, column: 37, scope: !2036)
!2053 = !DILocalVariable(name: "m_vec_limbs", scope: !2036, file: !408, line: 155, type: !324)
!2054 = !DILocalVariable(name: "accumulator", scope: !2036, file: !408, line: 157, type: !2055)
!2055 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 9304064, elements: !2056)
!2056 = !{!2057}
!2057 = !DISubrange(count: 145376)
!2058 = !DILocation(line: 157, column: 14, scope: !2036)
!2059 = !DILocalVariable(name: "P1_used", scope: !2036, file: !408, line: 158, type: !86)
!2060 = !DILocalVariable(name: "row", scope: !2061, file: !408, line: 159, type: !86)
!2061 = distinct !DILexicalBlock(scope: !2036, file: !408, line: 159, column: 5)
!2062 = !DILocation(line: 0, scope: !2061)
!2063 = !DILocation(line: 159, column: 10, scope: !2061)
!2064 = !DILocation(line: 158, column: 9, scope: !2036)
!2065 = !DILocation(line: 159, scope: !2061)
!2066 = !DILocation(line: 159, column: 27, scope: !2067)
!2067 = distinct !DILexicalBlock(scope: !2061, file: !408, line: 159, column: 5)
!2068 = !DILocation(line: 159, column: 5, scope: !2061)
!2069 = !DILocation(line: 160, column: 9, scope: !2070)
!2070 = distinct !DILexicalBlock(scope: !2071, file: !408, line: 160, column: 9)
!2071 = distinct !DILexicalBlock(scope: !2067, file: !408, line: 159, column: 39)
!2072 = !DILocation(line: 175, column: 5, scope: !2073)
!2073 = distinct !DILexicalBlock(scope: !2036, file: !408, line: 175, column: 5)
!2074 = !DILocation(line: 160, scope: !2070)
!2075 = !DILocalVariable(name: "j", scope: !2070, file: !408, line: 160, type: !86)
!2076 = !DILocation(line: 0, scope: !2070)
!2077 = !DILocation(line: 160, column: 29, scope: !2078)
!2078 = distinct !DILexicalBlock(scope: !2070, file: !408, line: 160, column: 9)
!2079 = !DILocation(line: 161, scope: !2080)
!2080 = distinct !DILexicalBlock(scope: !2081, file: !408, line: 161, column: 13)
!2081 = distinct !DILexicalBlock(scope: !2078, file: !408, line: 160, column: 39)
!2082 = !DILocalVariable(name: "col", scope: !2080, file: !408, line: 161, type: !86)
!2083 = !DILocation(line: 0, scope: !2080)
!2084 = !DILocation(line: 161, column: 35, scope: !2085)
!2085 = distinct !DILexicalBlock(scope: !2080, file: !408, line: 161, column: 13)
!2086 = !DILocation(line: 161, column: 13, scope: !2080)
!2087 = !DILocation(line: 162, column: 54, scope: !2088)
!2088 = distinct !DILexicalBlock(scope: !2085, file: !408, line: 161, column: 47)
!2089 = !DILocation(line: 162, column: 43, scope: !2088)
!2090 = !DILocation(line: 162, column: 91, scope: !2088)
!2091 = !DILocation(line: 162, column: 95, scope: !2088)
!2092 = !DILocation(line: 162, column: 102, scope: !2088)
!2093 = !DILocation(line: 162, column: 115, scope: !2088)
!2094 = !DILocation(line: 162, column: 109, scope: !2088)
!2095 = !DILocation(line: 162, column: 107, scope: !2088)
!2096 = !DILocation(line: 162, column: 125, scope: !2088)
!2097 = !DILocation(line: 162, column: 82, scope: !2088)
!2098 = !DILocation(line: 162, column: 17, scope: !2088)
!2099 = !DILocation(line: 161, column: 43, scope: !2085)
!2100 = !DILocation(line: 161, column: 13, scope: !2085)
!2101 = distinct !{!2101, !2086, !2102, !388}
!2102 = !DILocation(line: 163, column: 13, scope: !2080)
!2103 = !DILocation(line: 164, column: 21, scope: !2081)
!2104 = !DILocation(line: 160, column: 35, scope: !2078)
!2105 = !DILocation(line: 160, column: 9, scope: !2078)
!2106 = distinct !{!2106, !2069, !2107, !388}
!2107 = !DILocation(line: 165, column: 9, scope: !2070)
!2108 = !DILocation(line: 167, scope: !2109)
!2109 = distinct !DILexicalBlock(scope: !2071, file: !408, line: 167, column: 9)
!2110 = !DILocalVariable(name: "j", scope: !2109, file: !408, line: 167, type: !86)
!2111 = !DILocation(line: 0, scope: !2109)
!2112 = !DILocation(line: 167, column: 27, scope: !2113)
!2113 = distinct !DILexicalBlock(scope: !2109, file: !408, line: 167, column: 9)
!2114 = !DILocation(line: 167, column: 9, scope: !2109)
!2115 = !DILocation(line: 168, scope: !2116)
!2116 = distinct !DILexicalBlock(scope: !2117, file: !408, line: 168, column: 13)
!2117 = distinct !DILexicalBlock(scope: !2113, file: !408, line: 167, column: 37)
!2118 = !DILocalVariable(name: "col", scope: !2116, file: !408, line: 168, type: !86)
!2119 = !DILocation(line: 0, scope: !2116)
!2120 = !DILocation(line: 168, column: 35, scope: !2121)
!2121 = distinct !DILexicalBlock(scope: !2116, file: !408, line: 168, column: 13)
!2122 = !DILocation(line: 168, column: 13, scope: !2116)
!2123 = !DILocation(line: 169, column: 50, scope: !2124)
!2124 = distinct !DILexicalBlock(scope: !2121, file: !408, line: 168, column: 47)
!2125 = !DILocation(line: 169, column: 54, scope: !2124)
!2126 = !DILocation(line: 169, column: 58, scope: !2124)
!2127 = !DILocation(line: 169, column: 43, scope: !2124)
!2128 = !DILocation(line: 169, column: 93, scope: !2124)
!2129 = !DILocation(line: 169, column: 97, scope: !2124)
!2130 = !DILocation(line: 169, column: 104, scope: !2124)
!2131 = !DILocation(line: 169, column: 118, scope: !2124)
!2132 = !DILocation(line: 169, column: 111, scope: !2124)
!2133 = !DILocation(line: 169, column: 109, scope: !2124)
!2134 = !DILocation(line: 169, column: 133, scope: !2124)
!2135 = !DILocation(line: 169, column: 84, scope: !2124)
!2136 = !DILocation(line: 169, column: 17, scope: !2124)
!2137 = !DILocation(line: 168, column: 43, scope: !2121)
!2138 = !DILocation(line: 168, column: 13, scope: !2121)
!2139 = distinct !{!2139, !2122, !2140, !388}
!2140 = !DILocation(line: 170, column: 13, scope: !2116)
!2141 = !DILocation(line: 167, column: 33, scope: !2113)
!2142 = !DILocation(line: 167, column: 9, scope: !2113)
!2143 = distinct !{!2143, !2114, !2144, !388}
!2144 = !DILocation(line: 171, column: 9, scope: !2109)
!2145 = !DILocation(line: 159, column: 35, scope: !2067)
!2146 = !DILocation(line: 159, column: 5, scope: !2067)
!2147 = distinct !{!2147, !2068, !2148, !388}
!2148 = !DILocation(line: 172, column: 5, scope: !2061)
!2149 = !DILocation(line: 174, column: 9, scope: !2036)
!2150 = !DILocation(line: 175, scope: !2073)
!2151 = !DILocalVariable(name: "row", scope: !2073, file: !408, line: 175, type: !86)
!2152 = !DILocation(line: 0, scope: !2073)
!2153 = !DILocalVariable(name: "P3_used", scope: !2036, file: !408, line: 174, type: !86)
!2154 = !DILocation(line: 175, column: 27, scope: !2155)
!2155 = distinct !DILexicalBlock(scope: !2073, file: !408, line: 175, column: 5)
!2156 = !DILocation(line: 186, column: 5, scope: !2036)
!2157 = !DILocation(line: 176, scope: !2158)
!2158 = distinct !DILexicalBlock(scope: !2159, file: !408, line: 176, column: 9)
!2159 = distinct !DILexicalBlock(scope: !2155, file: !408, line: 175, column: 39)
!2160 = !DILocalVariable(name: "j", scope: !2158, file: !408, line: 176, type: !86)
!2161 = !DILocation(line: 0, scope: !2158)
!2162 = !DILocation(line: 176, column: 29, scope: !2163)
!2163 = distinct !DILexicalBlock(scope: !2158, file: !408, line: 176, column: 9)
!2164 = !DILocation(line: 176, column: 9, scope: !2158)
!2165 = !DILocation(line: 177, scope: !2166)
!2166 = distinct !DILexicalBlock(scope: !2167, file: !408, line: 177, column: 13)
!2167 = distinct !DILexicalBlock(scope: !2163, file: !408, line: 176, column: 39)
!2168 = !DILocalVariable(name: "col", scope: !2166, file: !408, line: 177, type: !86)
!2169 = !DILocation(line: 0, scope: !2166)
!2170 = !DILocation(line: 177, column: 35, scope: !2171)
!2171 = distinct !DILexicalBlock(scope: !2166, file: !408, line: 177, column: 13)
!2172 = !DILocation(line: 177, column: 13, scope: !2166)
!2173 = !DILocation(line: 178, column: 53, scope: !2174)
!2174 = distinct !DILexicalBlock(scope: !2171, file: !408, line: 177, column: 47)
!2175 = !DILocation(line: 178, column: 43, scope: !2174)
!2176 = !DILocation(line: 178, column: 89, scope: !2174)
!2177 = !DILocation(line: 178, column: 93, scope: !2174)
!2178 = !DILocation(line: 178, column: 100, scope: !2174)
!2179 = !DILocation(line: 178, column: 113, scope: !2174)
!2180 = !DILocation(line: 178, column: 107, scope: !2174)
!2181 = !DILocation(line: 178, column: 105, scope: !2174)
!2182 = !DILocation(line: 178, column: 123, scope: !2174)
!2183 = !DILocation(line: 178, column: 80, scope: !2174)
!2184 = !DILocation(line: 178, column: 17, scope: !2174)
!2185 = !DILocation(line: 177, column: 43, scope: !2171)
!2186 = !DILocation(line: 177, column: 13, scope: !2171)
!2187 = distinct !{!2187, !2172, !2188, !388}
!2188 = !DILocation(line: 179, column: 13, scope: !2166)
!2189 = !DILocation(line: 180, column: 21, scope: !2167)
!2190 = !DILocation(line: 176, column: 35, scope: !2163)
!2191 = !DILocation(line: 176, column: 9, scope: !2163)
!2192 = distinct !{!2192, !2164, !2193, !388}
!2193 = !DILocation(line: 181, column: 9, scope: !2158)
!2194 = !DILocation(line: 175, column: 35, scope: !2155)
!2195 = !DILocation(line: 175, column: 5, scope: !2155)
!2196 = distinct !{!2196, !2072, !2197, !388}
!2197 = !DILocation(line: 182, column: 5, scope: !2073)
!2198 = !DILocalVariable(name: "i", scope: !2036, file: !408, line: 185, type: !86)
!2199 = !DILocation(line: 186, column: 14, scope: !2036)
!2200 = !DILocation(line: 187, column: 58, scope: !2201)
!2201 = distinct !DILexicalBlock(scope: !2036, file: !408, line: 186, column: 23)
!2202 = !DILocation(line: 187, column: 63, scope: !2201)
!2203 = !DILocation(line: 187, column: 54, scope: !2201)
!2204 = !DILocation(line: 187, column: 85, scope: !2201)
!2205 = !DILocation(line: 187, column: 81, scope: !2201)
!2206 = !DILocation(line: 187, column: 9, scope: !2201)
!2207 = !DILocation(line: 188, column: 10, scope: !2201)
!2208 = distinct !{!2208, !2156, !2209, !388}
!2209 = !DILocation(line: 189, column: 5, scope: !2036)
!2210 = !DILocation(line: 191, column: 1, scope: !2036)
!2211 = distinct !DISubprogram(name: "mayo_generic_m_calculate_SPS", scope: !408, file: !408, line: 195, type: !2212, scopeLine: 195, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2212 = !DISubroutineType(types: !2213)
!2213 = !{null, !411, !90, !86, !86, !86, !52}
!2214 = !DILocalVariable(name: "PS", arg: 1, scope: !2211, file: !408, line: 195, type: !411)
!2215 = !DILocation(line: 0, scope: !2211)
!2216 = !DILocalVariable(name: "S", arg: 2, scope: !2211, file: !408, line: 195, type: !90)
!2217 = !DILocalVariable(name: "m", arg: 3, scope: !2211, file: !408, line: 195, type: !86)
!2218 = !DILocalVariable(name: "k", arg: 4, scope: !2211, file: !408, line: 195, type: !86)
!2219 = !DILocalVariable(name: "n", arg: 5, scope: !2211, file: !408, line: 195, type: !86)
!2220 = !DILocalVariable(name: "SPS", arg: 6, scope: !2211, file: !408, line: 195, type: !52)
!2221 = !DILocalVariable(name: "accumulator", scope: !2211, file: !408, line: 196, type: !2222)
!2222 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 867328, elements: !2223)
!2223 = !{!2224}
!2224 = !DISubrange(count: 13552)
!2225 = !DILocation(line: 196, column: 14, scope: !2211)
!2226 = !DILocation(line: 197, column: 32, scope: !2211)
!2227 = !DILocation(line: 197, column: 37, scope: !2211)
!2228 = !DILocalVariable(name: "m_vec_limbs", scope: !2211, file: !408, line: 197, type: !324)
!2229 = !DILocalVariable(name: "row", scope: !2230, file: !408, line: 198, type: !86)
!2230 = distinct !DILexicalBlock(scope: !2211, file: !408, line: 198, column: 5)
!2231 = !DILocation(line: 0, scope: !2230)
!2232 = !DILocation(line: 198, column: 10, scope: !2230)
!2233 = !DILocation(line: 198, scope: !2230)
!2234 = !DILocation(line: 198, column: 27, scope: !2235)
!2235 = distinct !DILexicalBlock(scope: !2230, file: !408, line: 198, column: 5)
!2236 = !DILocation(line: 198, column: 5, scope: !2230)
!2237 = !DILocation(line: 208, column: 5, scope: !2211)
!2238 = !DILocation(line: 199, scope: !2239)
!2239 = distinct !DILexicalBlock(scope: !2240, file: !408, line: 199, column: 9)
!2240 = distinct !DILexicalBlock(scope: !2235, file: !408, line: 198, column: 39)
!2241 = !DILocalVariable(name: "j", scope: !2239, file: !408, line: 199, type: !86)
!2242 = !DILocation(line: 0, scope: !2239)
!2243 = !DILocation(line: 199, column: 27, scope: !2244)
!2244 = distinct !DILexicalBlock(scope: !2239, file: !408, line: 199, column: 9)
!2245 = !DILocation(line: 199, column: 9, scope: !2239)
!2246 = !DILocation(line: 200, scope: !2247)
!2247 = distinct !DILexicalBlock(scope: !2248, file: !408, line: 200, column: 13)
!2248 = distinct !DILexicalBlock(scope: !2244, file: !408, line: 199, column: 37)
!2249 = !DILocalVariable(name: "col", scope: !2247, file: !408, line: 200, type: !86)
!2250 = !DILocation(line: 0, scope: !2247)
!2251 = !DILocation(line: 200, column: 35, scope: !2252)
!2252 = distinct !DILexicalBlock(scope: !2247, file: !408, line: 200, column: 13)
!2253 = !DILocation(line: 200, column: 13, scope: !2247)
!2254 = !DILocation(line: 201, column: 52, scope: !2255)
!2255 = distinct !DILexicalBlock(scope: !2252, file: !408, line: 200, column: 50)
!2256 = !DILocation(line: 201, column: 56, scope: !2255)
!2257 = !DILocation(line: 201, column: 63, scope: !2255)
!2258 = !DILocation(line: 201, column: 47, scope: !2255)
!2259 = !DILocation(line: 201, column: 99, scope: !2255)
!2260 = !DILocation(line: 201, column: 103, scope: !2255)
!2261 = !DILocation(line: 201, column: 110, scope: !2255)
!2262 = !DILocation(line: 201, column: 123, scope: !2255)
!2263 = !DILocation(line: 201, column: 117, scope: !2255)
!2264 = !DILocation(line: 201, column: 115, scope: !2255)
!2265 = !DILocation(line: 201, column: 133, scope: !2255)
!2266 = !DILocation(line: 201, column: 90, scope: !2255)
!2267 = !DILocation(line: 201, column: 21, scope: !2255)
!2268 = !DILocation(line: 200, column: 44, scope: !2252)
!2269 = !DILocation(line: 200, column: 13, scope: !2252)
!2270 = distinct !{!2270, !2253, !2271, !388}
!2271 = !DILocation(line: 202, column: 13, scope: !2247)
!2272 = !DILocation(line: 199, column: 33, scope: !2244)
!2273 = !DILocation(line: 199, column: 9, scope: !2244)
!2274 = distinct !{!2274, !2245, !2275, !388}
!2275 = !DILocation(line: 203, column: 9, scope: !2239)
!2276 = !DILocation(line: 198, column: 35, scope: !2235)
!2277 = !DILocation(line: 198, column: 5, scope: !2235)
!2278 = distinct !{!2278, !2236, !2279, !388}
!2279 = !DILocation(line: 204, column: 5, scope: !2230)
!2280 = !DILocalVariable(name: "i", scope: !2211, file: !408, line: 207, type: !86)
!2281 = !DILocation(line: 208, column: 14, scope: !2211)
!2282 = !DILocation(line: 209, column: 58, scope: !2283)
!2283 = distinct !DILexicalBlock(scope: !2211, file: !408, line: 208, column: 21)
!2284 = !DILocation(line: 209, column: 63, scope: !2283)
!2285 = !DILocation(line: 209, column: 54, scope: !2283)
!2286 = !DILocation(line: 209, column: 86, scope: !2283)
!2287 = !DILocation(line: 209, column: 82, scope: !2283)
!2288 = !DILocation(line: 209, column: 9, scope: !2283)
!2289 = !DILocation(line: 210, column: 10, scope: !2283)
!2290 = distinct !{!2290, !2237, !2291, !388}
!2291 = !DILocation(line: 211, column: 5, scope: !2211)
!2292 = !DILocation(line: 212, column: 1, scope: !2211)
!2293 = distinct !DISubprogram(name: "m_vec_add", scope: !529, file: !529, line: 22, type: !2294, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2294 = !DISubroutineType(types: !2295)
!2295 = !{null, !86, !411, !52}
!2296 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2293, file: !529, line: 22, type: !86)
!2297 = !DILocation(line: 0, scope: !2293)
!2298 = !DILocalVariable(name: "in", arg: 2, scope: !2293, file: !529, line: 22, type: !411)
!2299 = !DILocalVariable(name: "acc", arg: 3, scope: !2293, file: !529, line: 22, type: !52)
!2300 = !DILocalVariable(name: "i", scope: !2301, file: !529, line: 24, type: !58)
!2301 = distinct !DILexicalBlock(scope: !2293, file: !529, line: 24, column: 5)
!2302 = !DILocation(line: 0, scope: !2301)
!2303 = !DILocation(line: 26, column: 19, scope: !2304)
!2304 = distinct !DILexicalBlock(scope: !2305, file: !529, line: 25, column: 5)
!2305 = distinct !DILexicalBlock(scope: !2301, file: !529, line: 24, column: 5)
!2306 = !DILocation(line: 26, column: 16, scope: !2304)
!2307 = !DILocation(line: 26, column: 9, scope: !2304)
!2308 = !DILocation(line: 28, column: 1, scope: !2293)
!2309 = distinct !DISubprogram(name: "m_vec_multiply_bins", scope: !529, file: !529, line: 66, type: !2310, scopeLine: 66, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2310 = !DISubroutineType(types: !2311)
!2311 = !{null, !86, !52, !52}
!2312 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2309, file: !529, line: 66, type: !86)
!2313 = !DILocation(line: 0, scope: !2309)
!2314 = !DILocalVariable(name: "bins", arg: 2, scope: !2309, file: !529, line: 66, type: !52)
!2315 = !DILocalVariable(name: "out", arg: 3, scope: !2309, file: !529, line: 66, type: !52)
!2316 = !DILocation(line: 67, column: 44, scope: !2309)
!2317 = !DILocation(line: 67, column: 73, scope: !2309)
!2318 = !DILocation(line: 67, column: 5, scope: !2309)
!2319 = !DILocation(line: 68, column: 40, scope: !2309)
!2320 = !DILocation(line: 68, column: 69, scope: !2309)
!2321 = !DILocation(line: 68, column: 5, scope: !2309)
!2322 = !DILocation(line: 69, column: 44, scope: !2309)
!2323 = !DILocation(line: 69, column: 74, scope: !2309)
!2324 = !DILocation(line: 69, column: 5, scope: !2309)
!2325 = !DILocation(line: 70, column: 40, scope: !2309)
!2326 = !DILocation(line: 70, column: 69, scope: !2309)
!2327 = !DILocation(line: 70, column: 5, scope: !2309)
!2328 = !DILocation(line: 71, column: 44, scope: !2309)
!2329 = !DILocation(line: 71, column: 73, scope: !2309)
!2330 = !DILocation(line: 71, column: 5, scope: !2309)
!2331 = !DILocation(line: 72, column: 40, scope: !2309)
!2332 = !DILocation(line: 72, column: 69, scope: !2309)
!2333 = !DILocation(line: 72, column: 5, scope: !2309)
!2334 = !DILocation(line: 73, column: 44, scope: !2309)
!2335 = !DILocation(line: 73, column: 74, scope: !2309)
!2336 = !DILocation(line: 73, column: 5, scope: !2309)
!2337 = !DILocation(line: 74, column: 40, scope: !2309)
!2338 = !DILocation(line: 74, column: 69, scope: !2309)
!2339 = !DILocation(line: 74, column: 5, scope: !2309)
!2340 = !DILocation(line: 75, column: 44, scope: !2309)
!2341 = !DILocation(line: 75, column: 74, scope: !2309)
!2342 = !DILocation(line: 75, column: 5, scope: !2309)
!2343 = !DILocation(line: 76, column: 40, scope: !2309)
!2344 = !DILocation(line: 76, column: 69, scope: !2309)
!2345 = !DILocation(line: 76, column: 5, scope: !2309)
!2346 = !DILocation(line: 77, column: 44, scope: !2309)
!2347 = !DILocation(line: 77, column: 74, scope: !2309)
!2348 = !DILocation(line: 77, column: 5, scope: !2309)
!2349 = !DILocation(line: 78, column: 40, scope: !2309)
!2350 = !DILocation(line: 78, column: 69, scope: !2309)
!2351 = !DILocation(line: 78, column: 5, scope: !2309)
!2352 = !DILocation(line: 79, column: 44, scope: !2309)
!2353 = !DILocation(line: 79, column: 74, scope: !2309)
!2354 = !DILocation(line: 79, column: 5, scope: !2309)
!2355 = !DILocation(line: 80, column: 40, scope: !2309)
!2356 = !DILocation(line: 80, column: 69, scope: !2309)
!2357 = !DILocation(line: 80, column: 5, scope: !2309)
!2358 = !DILocation(line: 81, column: 35, scope: !2309)
!2359 = !DILocation(line: 81, column: 5, scope: !2309)
!2360 = !DILocation(line: 82, column: 1, scope: !2309)
!2361 = distinct !DISubprogram(name: "m_vec_mul_add_x_inv", scope: !529, file: !529, line: 56, type: !2294, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2362 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2361, file: !529, line: 56, type: !86)
!2363 = !DILocation(line: 0, scope: !2361)
!2364 = !DILocalVariable(name: "in", arg: 2, scope: !2361, file: !529, line: 56, type: !411)
!2365 = !DILocalVariable(name: "acc", arg: 3, scope: !2361, file: !529, line: 56, type: !52)
!2366 = !DILocalVariable(name: "mask_lsb", scope: !2361, file: !529, line: 58, type: !53)
!2367 = !DILocalVariable(name: "i", scope: !2368, file: !529, line: 59, type: !86)
!2368 = distinct !DILexicalBlock(scope: !2361, file: !529, line: 59, column: 5)
!2369 = !DILocation(line: 0, scope: !2368)
!2370 = !DILocation(line: 60, column: 22, scope: !2371)
!2371 = distinct !DILexicalBlock(scope: !2372, file: !529, line: 59, column: 43)
!2372 = distinct !DILexicalBlock(scope: !2368, file: !529, line: 59, column: 5)
!2373 = !DILocation(line: 60, column: 28, scope: !2371)
!2374 = !DILocalVariable(name: "t", scope: !2371, file: !529, line: 60, type: !53)
!2375 = !DILocation(line: 0, scope: !2371)
!2376 = !DILocation(line: 61, column: 32, scope: !2371)
!2377 = !DILocation(line: 61, column: 43, scope: !2371)
!2378 = !DILocation(line: 61, column: 38, scope: !2371)
!2379 = !DILocation(line: 61, column: 16, scope: !2371)
!2380 = !DILocation(line: 61, column: 9, scope: !2371)
!2381 = !DILocation(line: 63, column: 1, scope: !2361)
!2382 = distinct !DISubprogram(name: "m_vec_mul_add_x", scope: !529, file: !529, line: 46, type: !2294, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2383 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2382, file: !529, line: 46, type: !86)
!2384 = !DILocation(line: 0, scope: !2382)
!2385 = !DILocalVariable(name: "in", arg: 2, scope: !2382, file: !529, line: 46, type: !411)
!2386 = !DILocalVariable(name: "acc", arg: 3, scope: !2382, file: !529, line: 46, type: !52)
!2387 = !DILocalVariable(name: "mask_msb", scope: !2382, file: !529, line: 48, type: !53)
!2388 = !DILocalVariable(name: "i", scope: !2389, file: !529, line: 49, type: !86)
!2389 = distinct !DILexicalBlock(scope: !2382, file: !529, line: 49, column: 5)
!2390 = !DILocation(line: 0, scope: !2389)
!2391 = !DILocation(line: 50, column: 22, scope: !2392)
!2392 = distinct !DILexicalBlock(scope: !2393, file: !529, line: 49, column: 43)
!2393 = distinct !DILexicalBlock(scope: !2389, file: !529, line: 49, column: 5)
!2394 = !DILocalVariable(name: "t", scope: !2392, file: !529, line: 50, type: !53)
!2395 = !DILocation(line: 0, scope: !2392)
!2396 = !DILocation(line: 51, column: 32, scope: !2392)
!2397 = !DILocation(line: 51, column: 44, scope: !2392)
!2398 = !DILocation(line: 51, column: 50, scope: !2392)
!2399 = !DILocation(line: 51, column: 38, scope: !2392)
!2400 = !DILocation(line: 51, column: 16, scope: !2392)
!2401 = !DILocation(line: 51, column: 9, scope: !2392)
!2402 = !DILocation(line: 53, column: 1, scope: !2382)
!2403 = distinct !DISubprogram(name: "m_vec_copy", scope: !529, file: !529, line: 13, type: !2294, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2404 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2403, file: !529, line: 13, type: !86)
!2405 = !DILocation(line: 0, scope: !2403)
!2406 = !DILocalVariable(name: "in", arg: 2, scope: !2403, file: !529, line: 13, type: !411)
!2407 = !DILocalVariable(name: "out", arg: 3, scope: !2403, file: !529, line: 13, type: !52)
!2408 = !DILocalVariable(name: "i", scope: !2409, file: !529, line: 15, type: !58)
!2409 = distinct !DILexicalBlock(scope: !2403, file: !529, line: 15, column: 5)
!2410 = !DILocation(line: 0, scope: !2409)
!2411 = !DILocation(line: 17, column: 18, scope: !2412)
!2412 = distinct !DILexicalBlock(scope: !2413, file: !529, line: 16, column: 5)
!2413 = distinct !DILexicalBlock(scope: !2409, file: !529, line: 15, column: 5)
!2414 = !DILocation(line: 17, column: 16, scope: !2412)
!2415 = !DILocation(line: 17, column: 9, scope: !2412)
!2416 = !DILocation(line: 19, column: 1, scope: !2403)
!2417 = distinct !DISubprogram(name: "pqmayo_MAYO_3_ref_m_upper", scope: !99, file: !99, line: 14, type: !2418, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !71)
!2418 = !DISubroutineType(types: !2419)
!2419 = !{null, !2420, !411, !52, !86}
!2420 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2421, size: 32)
!2421 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2422)
!2422 = !DIDerivedType(tag: DW_TAG_typedef, name: "mayo_params_t", file: !79, line: 289, baseType: !2423)
!2423 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !79, line: 265, size: 736, elements: !2424)
!2424 = !{!2425, !2426, !2427, !2428, !2429, !2430, !2431, !2432, !2433, !2434, !2435, !2436, !2437, !2438, !2439, !2440, !2441, !2442, !2443, !2444, !2445, !2446, !2447}
!2425 = !DIDerivedType(tag: DW_TAG_member, name: "m", scope: !2423, file: !79, line: 266, baseType: !86, size: 32)
!2426 = !DIDerivedType(tag: DW_TAG_member, name: "n", scope: !2423, file: !79, line: 267, baseType: !86, size: 32, offset: 32)
!2427 = !DIDerivedType(tag: DW_TAG_member, name: "o", scope: !2423, file: !79, line: 268, baseType: !86, size: 32, offset: 64)
!2428 = !DIDerivedType(tag: DW_TAG_member, name: "k", scope: !2423, file: !79, line: 269, baseType: !86, size: 32, offset: 96)
!2429 = !DIDerivedType(tag: DW_TAG_member, name: "q", scope: !2423, file: !79, line: 270, baseType: !86, size: 32, offset: 128)
!2430 = !DIDerivedType(tag: DW_TAG_member, name: "f_tail", scope: !2423, file: !79, line: 271, baseType: !90, size: 32, offset: 160)
!2431 = !DIDerivedType(tag: DW_TAG_member, name: "m_bytes", scope: !2423, file: !79, line: 272, baseType: !86, size: 32, offset: 192)
!2432 = !DIDerivedType(tag: DW_TAG_member, name: "O_bytes", scope: !2423, file: !79, line: 273, baseType: !86, size: 32, offset: 224)
!2433 = !DIDerivedType(tag: DW_TAG_member, name: "v_bytes", scope: !2423, file: !79, line: 274, baseType: !86, size: 32, offset: 256)
!2434 = !DIDerivedType(tag: DW_TAG_member, name: "r_bytes", scope: !2423, file: !79, line: 275, baseType: !86, size: 32, offset: 288)
!2435 = !DIDerivedType(tag: DW_TAG_member, name: "R_bytes", scope: !2423, file: !79, line: 276, baseType: !86, size: 32, offset: 320)
!2436 = !DIDerivedType(tag: DW_TAG_member, name: "P1_bytes", scope: !2423, file: !79, line: 277, baseType: !86, size: 32, offset: 352)
!2437 = !DIDerivedType(tag: DW_TAG_member, name: "P2_bytes", scope: !2423, file: !79, line: 278, baseType: !86, size: 32, offset: 384)
!2438 = !DIDerivedType(tag: DW_TAG_member, name: "P3_bytes", scope: !2423, file: !79, line: 279, baseType: !86, size: 32, offset: 416)
!2439 = !DIDerivedType(tag: DW_TAG_member, name: "csk_bytes", scope: !2423, file: !79, line: 280, baseType: !86, size: 32, offset: 448)
!2440 = !DIDerivedType(tag: DW_TAG_member, name: "cpk_bytes", scope: !2423, file: !79, line: 281, baseType: !86, size: 32, offset: 480)
!2441 = !DIDerivedType(tag: DW_TAG_member, name: "sig_bytes", scope: !2423, file: !79, line: 282, baseType: !86, size: 32, offset: 512)
!2442 = !DIDerivedType(tag: DW_TAG_member, name: "salt_bytes", scope: !2423, file: !79, line: 283, baseType: !86, size: 32, offset: 544)
!2443 = !DIDerivedType(tag: DW_TAG_member, name: "sk_seed_bytes", scope: !2423, file: !79, line: 284, baseType: !86, size: 32, offset: 576)
!2444 = !DIDerivedType(tag: DW_TAG_member, name: "digest_bytes", scope: !2423, file: !79, line: 285, baseType: !86, size: 32, offset: 608)
!2445 = !DIDerivedType(tag: DW_TAG_member, name: "pk_seed_bytes", scope: !2423, file: !79, line: 286, baseType: !86, size: 32, offset: 640)
!2446 = !DIDerivedType(tag: DW_TAG_member, name: "m_vec_limbs", scope: !2423, file: !79, line: 287, baseType: !86, size: 32, offset: 672)
!2447 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !2423, file: !79, line: 288, baseType: !149, size: 32, offset: 704)
!2448 = !DILocalVariable(name: "p", arg: 1, scope: !2417, file: !99, line: 14, type: !2420)
!2449 = !DILocation(line: 0, scope: !2417)
!2450 = !DILocalVariable(name: "in", arg: 2, scope: !2417, file: !99, line: 14, type: !411)
!2451 = !DILocalVariable(name: "out", arg: 3, scope: !2417, file: !99, line: 14, type: !52)
!2452 = !DILocalVariable(name: "size", arg: 4, scope: !2417, file: !99, line: 14, type: !86)
!2453 = !DILocalVariable(name: "m_vec_limbs", scope: !2417, file: !99, line: 19, type: !324)
!2454 = !DILocalVariable(name: "m_vecs_stored", scope: !2417, file: !99, line: 20, type: !86)
!2455 = !DILocalVariable(name: "r", scope: !2456, file: !99, line: 21, type: !86)
!2456 = distinct !DILexicalBlock(scope: !2417, file: !99, line: 21, column: 5)
!2457 = !DILocation(line: 0, scope: !2456)
!2458 = !DILocation(line: 21, column: 10, scope: !2456)
!2459 = !DILocation(line: 20, column: 9, scope: !2417)
!2460 = !DILocation(line: 21, scope: !2456)
!2461 = !DILocation(line: 21, column: 23, scope: !2462)
!2462 = distinct !DILexicalBlock(scope: !2456, file: !99, line: 21, column: 5)
!2463 = !DILocation(line: 21, column: 5, scope: !2456)
!2464 = !DILocation(line: 22, column: 9, scope: !2465)
!2465 = distinct !DILexicalBlock(scope: !2466, file: !99, line: 22, column: 9)
!2466 = distinct !DILexicalBlock(scope: !2462, file: !99, line: 21, column: 36)
!2467 = !DILocation(line: 22, scope: !2465)
!2468 = !DILocalVariable(name: "c", scope: !2465, file: !99, line: 22, type: !86)
!2469 = !DILocation(line: 0, scope: !2465)
!2470 = !DILocation(line: 22, column: 27, scope: !2471)
!2471 = distinct !DILexicalBlock(scope: !2465, file: !99, line: 22, column: 9)
!2472 = !DILocation(line: 23, column: 59, scope: !2473)
!2473 = distinct !DILexicalBlock(scope: !2471, file: !99, line: 22, column: 40)
!2474 = !DILocation(line: 23, column: 66, scope: !2473)
!2475 = !DILocation(line: 23, column: 40, scope: !2473)
!2476 = !DILocation(line: 23, column: 76, scope: !2473)
!2477 = !DILocation(line: 23, column: 13, scope: !2473)
!2478 = !DILocation(line: 24, column: 19, scope: !2479)
!2479 = distinct !DILexicalBlock(scope: !2473, file: !99, line: 24, column: 17)
!2480 = !DILocation(line: 25, column: 62, scope: !2481)
!2481 = distinct !DILexicalBlock(scope: !2479, file: !99, line: 24, column: 25)
!2482 = !DILocation(line: 25, column: 69, scope: !2481)
!2483 = !DILocation(line: 25, column: 43, scope: !2481)
!2484 = !DILocation(line: 25, column: 79, scope: !2481)
!2485 = !DILocation(line: 25, column: 17, scope: !2481)
!2486 = !DILocation(line: 26, column: 13, scope: !2481)
!2487 = !DILocation(line: 27, column: 27, scope: !2473)
!2488 = !DILocation(line: 22, column: 36, scope: !2471)
!2489 = !DILocation(line: 22, column: 9, scope: !2471)
!2490 = distinct !{!2490, !2464, !2491, !388}
!2491 = !DILocation(line: 28, column: 9, scope: !2465)
!2492 = !DILocation(line: 21, column: 32, scope: !2462)
!2493 = !DILocation(line: 21, column: 5, scope: !2462)
!2494 = distinct !{!2494, !2463, !2495, !388}
!2495 = !DILocation(line: 29, column: 5, scope: !2456)
!2496 = !DILocation(line: 30, column: 1, scope: !2417)
!2497 = distinct !DISubprogram(name: "m_vec_copy", scope: !529, file: !529, line: 13, type: !2294, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!2498 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2497, file: !529, line: 13, type: !86)
!2499 = !DILocation(line: 0, scope: !2497)
!2500 = !DILocalVariable(name: "in", arg: 2, scope: !2497, file: !529, line: 13, type: !411)
!2501 = !DILocalVariable(name: "out", arg: 3, scope: !2497, file: !529, line: 13, type: !52)
!2502 = !DILocalVariable(name: "i", scope: !2503, file: !529, line: 15, type: !58)
!2503 = distinct !DILexicalBlock(scope: !2497, file: !529, line: 15, column: 5)
!2504 = !DILocation(line: 0, scope: !2503)
!2505 = !DILocation(line: 17, column: 18, scope: !2506)
!2506 = distinct !DILexicalBlock(scope: !2507, file: !529, line: 16, column: 5)
!2507 = distinct !DILexicalBlock(scope: !2503, file: !529, line: 15, column: 5)
!2508 = !DILocation(line: 17, column: 16, scope: !2506)
!2509 = !DILocation(line: 17, column: 9, scope: !2506)
!2510 = !DILocation(line: 19, column: 1, scope: !2497)
!2511 = distinct !DISubprogram(name: "m_vec_add", scope: !529, file: !529, line: 22, type: !2294, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!2512 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2511, file: !529, line: 22, type: !86)
!2513 = !DILocation(line: 0, scope: !2511)
!2514 = !DILocalVariable(name: "in", arg: 2, scope: !2511, file: !529, line: 22, type: !411)
!2515 = !DILocalVariable(name: "acc", arg: 3, scope: !2511, file: !529, line: 22, type: !52)
!2516 = !DILocalVariable(name: "i", scope: !2517, file: !529, line: 24, type: !58)
!2517 = distinct !DILexicalBlock(scope: !2511, file: !529, line: 24, column: 5)
!2518 = !DILocation(line: 0, scope: !2517)
!2519 = !DILocation(line: 26, column: 19, scope: !2520)
!2520 = distinct !DILexicalBlock(scope: !2521, file: !529, line: 25, column: 5)
!2521 = distinct !DILexicalBlock(scope: !2517, file: !529, line: 24, column: 5)
!2522 = !DILocation(line: 26, column: 16, scope: !2520)
!2523 = !DILocation(line: 26, column: 9, scope: !2520)
!2524 = !DILocation(line: 28, column: 1, scope: !2511)
!2525 = distinct !DISubprogram(name: "pqmayo_MAYO_3_ref_sample_solution", scope: !99, file: !99, line: 40, type: !2526, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !71)
!2526 = !DISubroutineType(types: !2527)
!2527 = !{!86, !2420, !61, !90, !90, !61, !86, !86, !86, !86}
!2528 = !DILocalVariable(name: "p", arg: 1, scope: !2525, file: !99, line: 40, type: !2420)
!2529 = !DILocation(line: 0, scope: !2525)
!2530 = !DILocalVariable(name: "A", arg: 2, scope: !2525, file: !99, line: 40, type: !61)
!2531 = !DILocalVariable(name: "y", arg: 3, scope: !2525, file: !99, line: 41, type: !90)
!2532 = !DILocalVariable(name: "r", arg: 4, scope: !2525, file: !99, line: 41, type: !90)
!2533 = !DILocalVariable(name: "x", arg: 5, scope: !2525, file: !99, line: 42, type: !61)
!2534 = !DILocalVariable(name: "k", arg: 6, scope: !2525, file: !99, line: 42, type: !86)
!2535 = !DILocalVariable(name: "o", arg: 7, scope: !2525, file: !99, line: 42, type: !86)
!2536 = !DILocalVariable(name: "m", arg: 8, scope: !2525, file: !99, line: 42, type: !86)
!2537 = !DILocalVariable(name: "A_cols", arg: 9, scope: !2525, file: !99, line: 42, type: !86)
!2538 = !DILocalVariable(name: "i", scope: !2539, file: !99, line: 51, type: !86)
!2539 = distinct !DILexicalBlock(scope: !2525, file: !99, line: 51, column: 5)
!2540 = !DILocation(line: 0, scope: !2539)
!2541 = !DILocation(line: 51, column: 10, scope: !2539)
!2542 = !DILocation(line: 51, scope: !2539)
!2543 = !DILocation(line: 51, column: 23, scope: !2544)
!2544 = distinct !DILexicalBlock(scope: !2539, file: !99, line: 51, column: 5)
!2545 = !DILocation(line: 51, column: 5, scope: !2539)
!2546 = !DILocation(line: 57, column: 5, scope: !2547)
!2547 = distinct !DILexicalBlock(scope: !2525, file: !99, line: 57, column: 5)
!2548 = !DILocation(line: 52, column: 16, scope: !2549)
!2549 = distinct !DILexicalBlock(scope: !2544, file: !99, line: 51, column: 37)
!2550 = !DILocation(line: 52, column: 9, scope: !2549)
!2551 = !DILocation(line: 52, column: 14, scope: !2549)
!2552 = !DILocation(line: 51, column: 33, scope: !2544)
!2553 = !DILocation(line: 51, column: 5, scope: !2544)
!2554 = distinct !{!2554, !2545, !2555, !388}
!2555 = !DILocation(line: 53, column: 5, scope: !2539)
!2556 = !DILocation(line: 57, scope: !2547)
!2557 = !DILocalVariable(name: "i", scope: !2547, file: !99, line: 57, type: !86)
!2558 = !DILocation(line: 0, scope: !2547)
!2559 = !DILocation(line: 57, column: 23, scope: !2560)
!2560 = distinct !DILexicalBlock(scope: !2547, file: !99, line: 57, column: 5)
!2561 = !DILocation(line: 58, column: 13, scope: !2562)
!2562 = distinct !DILexicalBlock(scope: !2560, file: !99, line: 57, column: 33)
!2563 = !DILocation(line: 58, column: 26, scope: !2562)
!2564 = !DILocation(line: 58, column: 30, scope: !2562)
!2565 = !DILocation(line: 58, column: 21, scope: !2562)
!2566 = !DILocation(line: 58, column: 9, scope: !2562)
!2567 = !DILocation(line: 58, column: 36, scope: !2562)
!2568 = !DILocation(line: 57, column: 29, scope: !2560)
!2569 = !DILocation(line: 57, column: 5, scope: !2560)
!2570 = distinct !{!2570, !2546, !2571, !388}
!2571 = !DILocation(line: 59, column: 5, scope: !2547)
!2572 = !DILocation(line: 60, column: 25, scope: !2525)
!2573 = !DILocation(line: 60, column: 29, scope: !2525)
!2574 = !DILocation(line: 60, column: 5, scope: !2525)
!2575 = !DILocalVariable(name: "i", scope: !2576, file: !99, line: 63, type: !86)
!2576 = distinct !DILexicalBlock(scope: !2525, file: !99, line: 63, column: 5)
!2577 = !DILocation(line: 0, scope: !2576)
!2578 = !DILocation(line: 63, column: 10, scope: !2576)
!2579 = !DILocation(line: 63, scope: !2576)
!2580 = !DILocation(line: 63, column: 23, scope: !2581)
!2581 = distinct !DILexicalBlock(scope: !2576, file: !99, line: 63, column: 5)
!2582 = !DILocation(line: 63, column: 5, scope: !2576)
!2583 = !DILocation(line: 64, column: 44, scope: !2584)
!2584 = distinct !DILexicalBlock(scope: !2581, file: !99, line: 63, column: 33)
!2585 = !DILocation(line: 64, column: 50, scope: !2584)
!2586 = !DILocation(line: 64, column: 38, scope: !2584)
!2587 = !DILocation(line: 64, column: 13, scope: !2584)
!2588 = !DILocation(line: 64, column: 26, scope: !2584)
!2589 = !DILocation(line: 64, column: 30, scope: !2584)
!2590 = !DILocation(line: 64, column: 21, scope: !2584)
!2591 = !DILocation(line: 64, column: 9, scope: !2584)
!2592 = !DILocation(line: 64, column: 36, scope: !2584)
!2593 = !DILocation(line: 63, column: 29, scope: !2581)
!2594 = !DILocation(line: 63, column: 5, scope: !2581)
!2595 = distinct !{!2595, !2582, !2596, !388}
!2596 = !DILocation(line: 65, column: 5, scope: !2576)
!2597 = !DILocation(line: 67, column: 16, scope: !2525)
!2598 = !DILocation(line: 67, column: 20, scope: !2525)
!2599 = !DILocation(line: 67, column: 5, scope: !2525)
!2600 = !DILocalVariable(name: "full_rank", scope: !2525, file: !99, line: 70, type: !51)
!2601 = !DILocalVariable(name: "i", scope: !2602, file: !99, line: 71, type: !86)
!2602 = distinct !DILexicalBlock(scope: !2525, file: !99, line: 71, column: 5)
!2603 = !DILocation(line: 0, scope: !2602)
!2604 = !DILocation(line: 71, column: 10, scope: !2602)
!2605 = !DILocation(line: 71, scope: !2602)
!2606 = !DILocation(line: 71, column: 23, scope: !2607)
!2607 = distinct !DILexicalBlock(scope: !2602, file: !99, line: 71, column: 5)
!2608 = !DILocation(line: 71, column: 5, scope: !2602)
!2609 = !DILocation(line: 72, column: 27, scope: !2610)
!2610 = distinct !DILexicalBlock(scope: !2607, file: !99, line: 71, column: 42)
!2611 = !DILocation(line: 72, column: 32, scope: !2610)
!2612 = !DILocation(line: 72, column: 22, scope: !2610)
!2613 = !DILocation(line: 72, column: 19, scope: !2610)
!2614 = !DILocation(line: 71, column: 38, scope: !2607)
!2615 = !DILocation(line: 71, column: 5, scope: !2607)
!2616 = distinct !{!2616, !2608, !2617, !388}
!2617 = !DILocation(line: 73, column: 5, scope: !2602)
!2618 = !DILocation(line: 80, column: 19, scope: !2619)
!2619 = distinct !DILexicalBlock(scope: !2525, file: !99, line: 80, column: 9)
!2620 = !DILocation(line: 88, scope: !2621)
!2621 = distinct !DILexicalBlock(scope: !2525, file: !99, line: 88, column: 5)
!2622 = !DILocalVariable(name: "row", scope: !2621, file: !99, line: 88, type: !86)
!2623 = !DILocation(line: 0, scope: !2621)
!2624 = !DILocation(line: 88, column: 31, scope: !2625)
!2625 = distinct !DILexicalBlock(scope: !2621, file: !99, line: 88, column: 5)
!2626 = !DILocation(line: 88, column: 5, scope: !2621)
!2627 = !DILocalVariable(name: "finished", scope: !2525, file: !99, line: 46, type: !51)
!2628 = !DILocation(line: 90, column: 27, scope: !2629)
!2629 = distinct !DILexicalBlock(scope: !2625, file: !99, line: 88, column: 44)
!2630 = !DILocalVariable(name: "col_upper_bound", scope: !2525, file: !99, line: 47, type: !86)
!2631 = !DILocalVariable(name: "col", scope: !2632, file: !99, line: 93, type: !86)
!2632 = distinct !DILexicalBlock(scope: !2629, file: !99, line: 93, column: 9)
!2633 = !DILocation(line: 0, scope: !2632)
!2634 = !DILocation(line: 93, column: 14, scope: !2632)
!2635 = !DILocation(line: 0, scope: !2629)
!2636 = !DILocation(line: 93, scope: !2632)
!2637 = !DILocation(line: 93, column: 33, scope: !2638)
!2638 = distinct !DILexicalBlock(scope: !2632, file: !99, line: 93, column: 9)
!2639 = !DILocation(line: 93, column: 9, scope: !2632)
!2640 = distinct !{!2640, !2626, !2641, !388}
!2641 = !DILocation(line: 122, column: 5, scope: !2621)
!2642 = !DILocation(line: 97, column: 50, scope: !2643)
!2643 = distinct !DILexicalBlock(scope: !2638, file: !99, line: 93, column: 60)
!2644 = !DILocation(line: 97, column: 44, scope: !2643)
!2645 = !DILocation(line: 97, column: 30, scope: !2643)
!2646 = !DILocation(line: 97, column: 73, scope: !2643)
!2647 = !DILocalVariable(name: "correct_column", scope: !2525, file: !99, line: 48, type: !51)
!2648 = !DILocation(line: 99, column: 63, scope: !2643)
!2649 = !DILocation(line: 99, column: 48, scope: !2643)
!2650 = !DILocation(line: 99, column: 46, scope: !2643)
!2651 = !DILocalVariable(name: "u", scope: !2643, file: !99, line: 99, type: !51)
!2652 = !DILocation(line: 0, scope: !2643)
!2653 = !DILocation(line: 100, column: 13, scope: !2643)
!2654 = !DILocation(line: 100, column: 20, scope: !2643)
!2655 = !DILocalVariable(name: "i", scope: !2656, file: !99, line: 102, type: !86)
!2656 = distinct !DILexicalBlock(scope: !2643, file: !99, line: 102, column: 13)
!2657 = !DILocation(line: 0, scope: !2656)
!2658 = !DILocation(line: 102, column: 18, scope: !2656)
!2659 = !DILocation(line: 102, scope: !2656)
!2660 = !DILocation(line: 102, column: 31, scope: !2661)
!2661 = distinct !DILexicalBlock(scope: !2656, file: !99, line: 102, column: 13)
!2662 = !DILocation(line: 102, column: 13, scope: !2656)
!2663 = !DILocation(line: 103, column: 53, scope: !2664)
!2664 = distinct !DILexicalBlock(scope: !2661, file: !99, line: 102, column: 46)
!2665 = !DILocation(line: 103, column: 45, scope: !2664)
!2666 = !DILocation(line: 103, column: 34, scope: !2664)
!2667 = !DILocation(line: 103, column: 95, scope: !2664)
!2668 = !DILocation(line: 103, column: 99, scope: !2664)
!2669 = !DILocation(line: 103, column: 91, scope: !2664)
!2670 = !DILocation(line: 103, column: 80, scope: !2664)
!2671 = !DILocation(line: 103, column: 115, scope: !2664)
!2672 = !DILocation(line: 103, column: 76, scope: !2664)
!2673 = !DILocation(line: 104, column: 49, scope: !2664)
!2674 = !DILocation(line: 104, column: 53, scope: !2664)
!2675 = !DILocation(line: 104, column: 45, scope: !2664)
!2676 = !DILocation(line: 104, column: 34, scope: !2664)
!2677 = !DILocation(line: 104, column: 69, scope: !2664)
!2678 = !DILocation(line: 104, column: 30, scope: !2664)
!2679 = !DILocation(line: 104, column: 95, scope: !2664)
!2680 = !DILocation(line: 104, column: 99, scope: !2664)
!2681 = !DILocation(line: 104, column: 91, scope: !2664)
!2682 = !DILocation(line: 104, column: 80, scope: !2664)
!2683 = !DILocation(line: 104, column: 115, scope: !2664)
!2684 = !DILocation(line: 104, column: 76, scope: !2664)
!2685 = !DILocation(line: 105, column: 49, scope: !2664)
!2686 = !DILocation(line: 105, column: 53, scope: !2664)
!2687 = !DILocation(line: 105, column: 45, scope: !2664)
!2688 = !DILocation(line: 105, column: 34, scope: !2664)
!2689 = !DILocation(line: 105, column: 69, scope: !2664)
!2690 = !DILocation(line: 105, column: 30, scope: !2664)
!2691 = !DILocation(line: 105, column: 95, scope: !2664)
!2692 = !DILocation(line: 105, column: 99, scope: !2664)
!2693 = !DILocation(line: 105, column: 91, scope: !2664)
!2694 = !DILocation(line: 105, column: 80, scope: !2664)
!2695 = !DILocation(line: 105, column: 115, scope: !2664)
!2696 = !DILocation(line: 105, column: 76, scope: !2664)
!2697 = !DILocation(line: 106, column: 49, scope: !2664)
!2698 = !DILocation(line: 106, column: 53, scope: !2664)
!2699 = !DILocation(line: 106, column: 45, scope: !2664)
!2700 = !DILocation(line: 106, column: 34, scope: !2664)
!2701 = !DILocation(line: 106, column: 69, scope: !2664)
!2702 = !DILocation(line: 106, column: 30, scope: !2664)
!2703 = !DILocation(line: 106, column: 95, scope: !2664)
!2704 = !DILocation(line: 106, column: 99, scope: !2664)
!2705 = !DILocation(line: 106, column: 91, scope: !2664)
!2706 = !DILocation(line: 106, column: 80, scope: !2664)
!2707 = !DILocation(line: 106, column: 115, scope: !2664)
!2708 = !DILocation(line: 106, column: 76, scope: !2664)
!2709 = !DILocalVariable(name: "tmp", scope: !2664, file: !99, line: 103, type: !53)
!2710 = !DILocation(line: 0, scope: !2664)
!2711 = !DILocation(line: 108, column: 23, scope: !2664)
!2712 = !DILocation(line: 110, column: 34, scope: !2664)
!2713 = !DILocation(line: 110, column: 17, scope: !2664)
!2714 = !DILocation(line: 110, column: 48, scope: !2664)
!2715 = !DILocation(line: 111, column: 56, scope: !2664)
!2716 = !DILocation(line: 111, column: 34, scope: !2664)
!2717 = !DILocation(line: 111, column: 17, scope: !2664)
!2718 = !DILocation(line: 111, column: 48, scope: !2664)
!2719 = !DILocation(line: 112, column: 56, scope: !2664)
!2720 = !DILocation(line: 112, column: 34, scope: !2664)
!2721 = !DILocation(line: 112, column: 17, scope: !2664)
!2722 = !DILocation(line: 112, column: 48, scope: !2664)
!2723 = !DILocation(line: 113, column: 56, scope: !2664)
!2724 = !DILocation(line: 113, column: 34, scope: !2664)
!2725 = !DILocation(line: 113, column: 17, scope: !2664)
!2726 = !DILocation(line: 113, column: 48, scope: !2664)
!2727 = !DILocation(line: 114, column: 56, scope: !2664)
!2728 = !DILocation(line: 114, column: 34, scope: !2664)
!2729 = !DILocation(line: 114, column: 17, scope: !2664)
!2730 = !DILocation(line: 114, column: 48, scope: !2664)
!2731 = !DILocation(line: 115, column: 56, scope: !2664)
!2732 = !DILocation(line: 115, column: 34, scope: !2664)
!2733 = !DILocation(line: 115, column: 17, scope: !2664)
!2734 = !DILocation(line: 115, column: 48, scope: !2664)
!2735 = !DILocation(line: 116, column: 56, scope: !2664)
!2736 = !DILocation(line: 116, column: 34, scope: !2664)
!2737 = !DILocation(line: 116, column: 17, scope: !2664)
!2738 = !DILocation(line: 116, column: 48, scope: !2664)
!2739 = !DILocation(line: 117, column: 56, scope: !2664)
!2740 = !DILocation(line: 117, column: 34, scope: !2664)
!2741 = !DILocation(line: 117, column: 17, scope: !2664)
!2742 = !DILocation(line: 117, column: 48, scope: !2664)
!2743 = !DILocation(line: 102, column: 40, scope: !2661)
!2744 = !DILocation(line: 102, column: 13, scope: !2661)
!2745 = distinct !{!2745, !2662, !2746, !388}
!2746 = !DILocation(line: 118, column: 13, scope: !2656)
!2747 = !DILocation(line: 120, column: 33, scope: !2643)
!2748 = !DILocation(line: 93, column: 56, scope: !2638)
!2749 = !DILocation(line: 93, column: 9, scope: !2638)
!2750 = distinct !{!2750, !2639, !2751, !388}
!2751 = !DILocation(line: 121, column: 9, scope: !2632)
!2752 = !DILocation(line: 124, column: 1, scope: !2525)
!2753 = distinct !DISubprogram(name: "mat_mul", scope: !577, file: !577, line: 79, type: !1470, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!2754 = !DILocalVariable(name: "a", arg: 1, scope: !2753, file: !577, line: 79, type: !90)
!2755 = !DILocation(line: 0, scope: !2753)
!2756 = !DILocalVariable(name: "b", arg: 2, scope: !2753, file: !577, line: 79, type: !90)
!2757 = !DILocalVariable(name: "c", arg: 3, scope: !2753, file: !577, line: 80, type: !61)
!2758 = !DILocalVariable(name: "colrow_ab", arg: 4, scope: !2753, file: !577, line: 80, type: !86)
!2759 = !DILocalVariable(name: "row_a", arg: 5, scope: !2753, file: !577, line: 80, type: !86)
!2760 = !DILocalVariable(name: "col_b", arg: 6, scope: !2753, file: !577, line: 80, type: !86)
!2761 = !DILocalVariable(name: "i", scope: !2762, file: !577, line: 81, type: !86)
!2762 = distinct !DILexicalBlock(scope: !2753, file: !577, line: 81, column: 5)
!2763 = !DILocation(line: 0, scope: !2762)
!2764 = !DILocation(line: 81, column: 10, scope: !2762)
!2765 = !DILocation(line: 81, scope: !2762)
!2766 = !DILocation(line: 81, column: 23, scope: !2767)
!2767 = distinct !DILexicalBlock(scope: !2762, file: !577, line: 81, column: 5)
!2768 = !DILocation(line: 81, column: 5, scope: !2762)
!2769 = !DILocation(line: 82, scope: !2770)
!2770 = distinct !DILexicalBlock(scope: !2771, file: !577, line: 82, column: 9)
!2771 = distinct !DILexicalBlock(scope: !2767, file: !577, line: 81, column: 53)
!2772 = !DILocalVariable(name: "j", scope: !2770, file: !577, line: 82, type: !86)
!2773 = !DILocation(line: 0, scope: !2770)
!2774 = !DILocation(line: 82, column: 27, scope: !2775)
!2775 = distinct !DILexicalBlock(scope: !2770, file: !577, line: 82, column: 9)
!2776 = !DILocation(line: 82, column: 9, scope: !2770)
!2777 = !DILocation(line: 83, column: 31, scope: !2778)
!2778 = distinct !DILexicalBlock(scope: !2775, file: !577, line: 82, column: 46)
!2779 = !DILocation(line: 83, column: 18, scope: !2778)
!2780 = !DILocation(line: 83, column: 16, scope: !2778)
!2781 = !DILocation(line: 82, column: 36, scope: !2775)
!2782 = !DILocation(line: 82, column: 41, scope: !2775)
!2783 = !DILocation(line: 82, column: 9, scope: !2775)
!2784 = distinct !{!2784, !2776, !2785, !388}
!2785 = !DILocation(line: 84, column: 9, scope: !2770)
!2786 = !DILocation(line: 81, column: 32, scope: !2767)
!2787 = !DILocation(line: 81, column: 39, scope: !2767)
!2788 = !DILocation(line: 81, column: 5, scope: !2767)
!2789 = distinct !{!2789, !2768, !2790, !388}
!2790 = !DILocation(line: 85, column: 5, scope: !2762)
!2791 = !DILocation(line: 86, column: 18, scope: !2753)
!2792 = !DILocation(line: 86, column: 5, scope: !2753)
!2793 = !DILocation(line: 87, column: 1, scope: !2753)
!2794 = distinct !DISubprogram(name: "sub_f", scope: !577, file: !577, line: 48, type: !1595, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!2795 = !DILocalVariable(name: "a", arg: 1, scope: !2794, file: !577, line: 48, type: !51)
!2796 = !DILocation(line: 0, scope: !2794)
!2797 = !DILocalVariable(name: "b", arg: 2, scope: !2794, file: !577, line: 48, type: !51)
!2798 = !DILocation(line: 49, column: 14, scope: !2794)
!2799 = !DILocation(line: 49, column: 5, scope: !2794)
!2800 = distinct !DISubprogram(name: "EF", scope: !2801, file: !2801, line: 60, type: !2802, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!2801 = !DIFile(filename: "../../../src/generic/echelon_form.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!2802 = !DISubroutineType(types: !2803)
!2803 = !{null, !61, !86, !86}
!2804 = !DILocalVariable(name: "A", arg: 1, scope: !2800, file: !2801, line: 60, type: !61)
!2805 = !DILocation(line: 0, scope: !2800)
!2806 = !DILocalVariable(name: "nrows", arg: 2, scope: !2800, file: !2801, line: 60, type: !86)
!2807 = !DILocalVariable(name: "ncols", arg: 3, scope: !2800, file: !2801, line: 60, type: !86)
!2808 = !DILocalVariable(name: "_pivot_row", scope: !2800, file: !2801, line: 62, type: !669, align: 256)
!2809 = !DILocation(line: 62, column: 27, scope: !2800)
!2810 = !DILocalVariable(name: "_pivot_row2", scope: !2800, file: !2801, line: 63, type: !669, align: 256)
!2811 = !DILocation(line: 63, column: 27, scope: !2800)
!2812 = !DILocalVariable(name: "packed_A", scope: !2800, file: !2801, line: 64, type: !2813, align: 256)
!2813 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 48384, elements: !2814)
!2814 = !{!2815}
!2815 = !DISubrange(count: 756)
!2816 = !DILocation(line: 64, column: 27, scope: !2800)
!2817 = !DILocation(line: 66, column: 26, scope: !2800)
!2818 = !DILocation(line: 66, column: 32, scope: !2800)
!2819 = !DILocalVariable(name: "row_len", scope: !2800, file: !2801, line: 66, type: !86)
!2820 = !DILocalVariable(name: "i", scope: !2821, file: !2801, line: 69, type: !86)
!2821 = distinct !DILexicalBlock(scope: !2800, file: !2801, line: 69, column: 5)
!2822 = !DILocation(line: 0, scope: !2821)
!2823 = !DILocation(line: 69, column: 10, scope: !2821)
!2824 = !DILocation(line: 69, scope: !2821)
!2825 = !DILocation(line: 69, column: 23, scope: !2826)
!2826 = distinct !DILexicalBlock(scope: !2821, file: !2801, line: 69, column: 5)
!2827 = !DILocation(line: 69, column: 5, scope: !2821)
!2828 = !DILocation(line: 77, column: 5, scope: !2829)
!2829 = distinct !DILexicalBlock(scope: !2800, file: !2801, line: 77, column: 5)
!2830 = !DILocation(line: 70, column: 29, scope: !2831)
!2831 = distinct !DILexicalBlock(scope: !2826, file: !2801, line: 69, column: 37)
!2832 = !DILocation(line: 70, column: 25, scope: !2831)
!2833 = !DILocation(line: 70, column: 51, scope: !2831)
!2834 = !DILocation(line: 70, column: 47, scope: !2831)
!2835 = !DILocation(line: 70, column: 9, scope: !2831)
!2836 = !DILocation(line: 69, column: 33, scope: !2826)
!2837 = !DILocation(line: 69, column: 5, scope: !2826)
!2838 = distinct !{!2838, !2827, !2839, !388}
!2839 = !DILocation(line: 71, column: 5, scope: !2821)
!2840 = !DILocation(line: 77, scope: !2829)
!2841 = !DILocalVariable(name: "pivot_row", scope: !2800, file: !2801, line: 76, type: !86)
!2842 = !DILocalVariable(name: "pivot_col", scope: !2829, file: !2801, line: 77, type: !86)
!2843 = !DILocation(line: 0, scope: !2829)
!2844 = !DILocation(line: 77, column: 39, scope: !2845)
!2845 = distinct !DILexicalBlock(scope: !2829, file: !2801, line: 77, column: 5)
!2846 = !DILocation(line: 79, column: 37, scope: !2847)
!2847 = distinct !DILexicalBlock(scope: !2845, file: !2801, line: 77, column: 61)
!2848 = !DILocalVariable(name: "pivot_row_lower_bound", scope: !2847, file: !2801, line: 79, type: !86)
!2849 = !DILocation(line: 0, scope: !2847)
!2850 = !DILocation(line: 80, column: 37, scope: !2847)
!2851 = !DILocalVariable(name: "pivot_row_upper_bound", scope: !2847, file: !2801, line: 80, type: !86)
!2852 = !DILocalVariable(name: "i", scope: !2853, file: !2801, line: 85, type: !86)
!2853 = distinct !DILexicalBlock(scope: !2847, file: !2801, line: 85, column: 9)
!2854 = !DILocation(line: 0, scope: !2853)
!2855 = !DILocation(line: 85, column: 14, scope: !2853)
!2856 = !DILocation(line: 85, scope: !2853)
!2857 = !DILocation(line: 85, column: 27, scope: !2858)
!2858 = distinct !DILexicalBlock(scope: !2853, file: !2801, line: 85, column: 9)
!2859 = !DILocation(line: 85, column: 9, scope: !2853)
!2860 = !DILocation(line: 93, column: 9, scope: !2861)
!2861 = distinct !DILexicalBlock(scope: !2847, file: !2801, line: 93, column: 9)
!2862 = !DILocation(line: 86, column: 13, scope: !2863)
!2863 = distinct !DILexicalBlock(scope: !2858, file: !2801, line: 85, column: 43)
!2864 = !DILocation(line: 86, column: 27, scope: !2863)
!2865 = !DILocation(line: 87, column: 13, scope: !2863)
!2866 = !DILocation(line: 87, column: 28, scope: !2863)
!2867 = !DILocation(line: 85, column: 39, scope: !2858)
!2868 = !DILocation(line: 85, column: 9, scope: !2858)
!2869 = distinct !{!2869, !2859, !2870, !388}
!2870 = !DILocation(line: 88, column: 9, scope: !2853)
!2871 = !DILocation(line: 0, scope: !2861)
!2872 = !DILocalVariable(name: "row", scope: !2861, file: !2801, line: 93, type: !86)
!2873 = !DILocalVariable(name: "pivot", scope: !2847, file: !2801, line: 91, type: !51)
!2874 = !DILocalVariable(name: "pivot_is_zero", scope: !2847, file: !2801, line: 92, type: !53)
!2875 = !DILocation(line: 94, column: 24, scope: !2876)
!2876 = distinct !DILexicalBlock(scope: !2861, file: !2801, line: 93, column: 9)
!2877 = !DILocation(line: 94, column: 21, scope: !2876)
!2878 = !DILocation(line: 96, column: 38, scope: !2879)
!2879 = distinct !DILexicalBlock(scope: !2876, file: !2801, line: 94, column: 80)
!2880 = !DILocation(line: 96, column: 37, scope: !2879)
!2881 = !DILocalVariable(name: "is_pivot_row", scope: !2879, file: !2801, line: 96, type: !53)
!2882 = !DILocation(line: 0, scope: !2879)
!2883 = !DILocation(line: 97, column: 40, scope: !2879)
!2884 = !DILocalVariable(name: "below_pivot_row", scope: !2879, file: !2801, line: 97, type: !53)
!2885 = !DILocalVariable(name: "j", scope: !2886, file: !2801, line: 99, type: !86)
!2886 = distinct !DILexicalBlock(scope: !2879, file: !2801, line: 99, column: 13)
!2887 = !DILocation(line: 0, scope: !2886)
!2888 = !DILocation(line: 99, column: 18, scope: !2886)
!2889 = !DILocation(line: 99, scope: !2886)
!2890 = !DILocation(line: 99, column: 31, scope: !2891)
!2891 = distinct !DILexicalBlock(scope: !2886, file: !2801, line: 99, column: 13)
!2892 = !DILocation(line: 99, column: 13, scope: !2886)
!2893 = !DILocation(line: 100, column: 67, scope: !2894)
!2894 = distinct !DILexicalBlock(scope: !2891, file: !2801, line: 99, column: 47)
!2895 = !DILocation(line: 100, column: 48, scope: !2894)
!2896 = !DILocation(line: 101, column: 47, scope: !2894)
!2897 = !DILocation(line: 101, column: 57, scope: !2894)
!2898 = !DILocation(line: 101, column: 34, scope: !2894)
!2899 = !DILocation(line: 100, column: 85, scope: !2894)
!2900 = !DILocation(line: 100, column: 17, scope: !2894)
!2901 = !DILocation(line: 100, column: 31, scope: !2894)
!2902 = !DILocation(line: 99, column: 43, scope: !2891)
!2903 = !DILocation(line: 99, column: 13, scope: !2891)
!2904 = distinct !{!2904, !2892, !2905, !388}
!2905 = !DILocation(line: 102, column: 13, scope: !2886)
!2906 = !DILocation(line: 103, column: 21, scope: !2879)
!2907 = !DILocation(line: 104, column: 44, scope: !2879)
!2908 = !DILocation(line: 104, column: 30, scope: !2879)
!2909 = !DILocation(line: 104, column: 29, scope: !2879)
!2910 = !DILocation(line: 94, column: 76, scope: !2876)
!2911 = !DILocation(line: 93, column: 9, scope: !2876)
!2912 = distinct !{!2912, !2860, !2913, !388}
!2913 = !DILocation(line: 105, column: 9, scope: !2861)
!2914 = !DILocation(line: 108, column: 19, scope: !2847)
!2915 = !DILocalVariable(name: "inverse", scope: !2800, file: !2801, line: 75, type: !51)
!2916 = !DILocation(line: 109, column: 9, scope: !2847)
!2917 = !DILocalVariable(name: "row", scope: !2918, file: !2801, line: 113, type: !86)
!2918 = distinct !DILexicalBlock(scope: !2847, file: !2801, line: 113, column: 9)
!2919 = !DILocation(line: 0, scope: !2918)
!2920 = !DILocation(line: 113, column: 14, scope: !2918)
!2921 = !DILocation(line: 113, scope: !2918)
!2922 = !DILocation(line: 113, column: 51, scope: !2923)
!2923 = distinct !DILexicalBlock(scope: !2918, file: !2801, line: 113, column: 9)
!2924 = !DILocation(line: 113, column: 9, scope: !2918)
!2925 = !DILocation(line: 114, column: 33, scope: !2926)
!2926 = distinct !DILexicalBlock(scope: !2923, file: !2801, line: 113, column: 84)
!2927 = !DILocation(line: 114, column: 63, scope: !2926)
!2928 = !DILocalVariable(name: "do_copy", scope: !2926, file: !2801, line: 114, type: !53)
!2929 = !DILocation(line: 0, scope: !2926)
!2930 = !DILocalVariable(name: "do_not_copy", scope: !2926, file: !2801, line: 115, type: !53)
!2931 = !DILocalVariable(name: "col", scope: !2932, file: !2801, line: 116, type: !86)
!2932 = distinct !DILexicalBlock(scope: !2926, file: !2801, line: 116, column: 13)
!2933 = !DILocation(line: 0, scope: !2932)
!2934 = !DILocation(line: 116, column: 18, scope: !2932)
!2935 = !DILocation(line: 116, scope: !2932)
!2936 = !DILocation(line: 116, column: 35, scope: !2937)
!2937 = distinct !DILexicalBlock(scope: !2932, file: !2801, line: 116, column: 13)
!2938 = !DILocation(line: 116, column: 13, scope: !2932)
!2939 = !DILocation(line: 118, column: 49, scope: !2940)
!2940 = distinct !DILexicalBlock(scope: !2937, file: !2801, line: 116, column: 53)
!2941 = !DILocation(line: 118, column: 59, scope: !2940)
!2942 = !DILocation(line: 118, column: 36, scope: !2940)
!2943 = !DILocation(line: 118, column: 34, scope: !2940)
!2944 = !DILocation(line: 119, column: 32, scope: !2940)
!2945 = !DILocation(line: 119, column: 30, scope: !2940)
!2946 = !DILocation(line: 118, column: 67, scope: !2940)
!2947 = !DILocation(line: 117, column: 30, scope: !2940)
!2948 = !DILocation(line: 117, column: 40, scope: !2940)
!2949 = !DILocation(line: 117, column: 17, scope: !2940)
!2950 = !DILocation(line: 117, column: 47, scope: !2940)
!2951 = !DILocation(line: 116, column: 49, scope: !2937)
!2952 = !DILocation(line: 116, column: 13, scope: !2937)
!2953 = distinct !{!2953, !2938, !2954, !388}
!2954 = !DILocation(line: 120, column: 13, scope: !2932)
!2955 = !DILocation(line: 113, column: 80, scope: !2923)
!2956 = !DILocation(line: 113, column: 9, scope: !2923)
!2957 = distinct !{!2957, !2924, !2958, !388}
!2958 = !DILocation(line: 121, column: 9, scope: !2918)
!2959 = !DILocation(line: 124, scope: !2960)
!2960 = distinct !DILexicalBlock(scope: !2847, file: !2801, line: 124, column: 9)
!2961 = !DILocalVariable(name: "row", scope: !2960, file: !2801, line: 124, type: !86)
!2962 = !DILocation(line: 0, scope: !2960)
!2963 = !DILocation(line: 124, column: 51, scope: !2964)
!2964 = distinct !DILexicalBlock(scope: !2960, file: !2801, line: 124, column: 9)
!2965 = !DILocation(line: 124, column: 9, scope: !2960)
!2966 = !DILocation(line: 125, column: 46, scope: !2967)
!2967 = distinct !DILexicalBlock(scope: !2964, file: !2801, line: 124, column: 67)
!2968 = !DILocalVariable(name: "below_pivot", scope: !2967, file: !2801, line: 125, type: !51)
!2969 = !DILocation(line: 0, scope: !2967)
!2970 = !DILocation(line: 126, column: 74, scope: !2967)
!2971 = !DILocation(line: 126, column: 68, scope: !2967)
!2972 = !DILocation(line: 126, column: 41, scope: !2967)
!2973 = !DILocalVariable(name: "elt_to_elim", scope: !2967, file: !2801, line: 126, type: !51)
!2974 = !DILocation(line: 128, column: 63, scope: !2967)
!2975 = !DILocation(line: 129, column: 52, scope: !2967)
!2976 = !DILocation(line: 129, column: 46, scope: !2967)
!2977 = !DILocation(line: 128, column: 13, scope: !2967)
!2978 = !DILocation(line: 124, column: 63, scope: !2964)
!2979 = !DILocation(line: 124, column: 9, scope: !2964)
!2980 = distinct !{!2980, !2965, !2981, !388}
!2981 = !DILocation(line: 130, column: 9, scope: !2960)
!2982 = !DILocation(line: 132, column: 19, scope: !2847)
!2983 = !DILocation(line: 77, column: 57, scope: !2845)
!2984 = !DILocation(line: 77, column: 5, scope: !2845)
!2985 = distinct !{!2985, !2828, !2986, !388}
!2986 = !DILocation(line: 133, column: 5, scope: !2829)
!2987 = !DILocation(line: 138, scope: !2988)
!2988 = distinct !DILexicalBlock(scope: !2800, file: !2801, line: 138, column: 5)
!2989 = !DILocalVariable(name: "i", scope: !2988, file: !2801, line: 138, type: !86)
!2990 = !DILocation(line: 0, scope: !2988)
!2991 = !DILocation(line: 138, column: 23, scope: !2992)
!2992 = distinct !DILexicalBlock(scope: !2988, file: !2801, line: 138, column: 5)
!2993 = !DILocation(line: 138, column: 5, scope: !2988)
!2994 = !DILocation(line: 139, column: 47, scope: !2995)
!2995 = distinct !DILexicalBlock(scope: !2992, file: !2801, line: 138, column: 37)
!2996 = !DILocation(line: 139, column: 43, scope: !2995)
!2997 = !DILocation(line: 139, column: 9, scope: !2995)
!2998 = !DILocalVariable(name: "j", scope: !2999, file: !2801, line: 140, type: !86)
!2999 = distinct !DILexicalBlock(scope: !2995, file: !2801, line: 140, column: 9)
!3000 = !DILocation(line: 0, scope: !2999)
!3001 = !DILocation(line: 140, column: 14, scope: !2999)
!3002 = !DILocation(line: 140, scope: !2999)
!3003 = !DILocation(line: 140, column: 27, scope: !3004)
!3004 = distinct !DILexicalBlock(scope: !2999, file: !2801, line: 140, column: 9)
!3005 = !DILocation(line: 140, column: 9, scope: !2999)
!3006 = !DILocation(line: 141, column: 32, scope: !3007)
!3007 = distinct !DILexicalBlock(scope: !3004, file: !2801, line: 140, column: 41)
!3008 = !DILocation(line: 141, column: 17, scope: !3007)
!3009 = !DILocation(line: 141, column: 13, scope: !3007)
!3010 = !DILocation(line: 141, column: 30, scope: !3007)
!3011 = !DILocation(line: 140, column: 37, scope: !3004)
!3012 = !DILocation(line: 140, column: 9, scope: !3004)
!3013 = distinct !{!3013, !3005, !3014, !388}
!3014 = !DILocation(line: 142, column: 9, scope: !2999)
!3015 = !DILocation(line: 138, column: 33, scope: !2992)
!3016 = !DILocation(line: 138, column: 5, scope: !2992)
!3017 = distinct !{!3017, !2993, !3018, !388}
!3018 = !DILocation(line: 143, column: 5, scope: !2988)
!3019 = !DILocation(line: 145, column: 5, scope: !2800)
!3020 = !DILocation(line: 146, column: 5, scope: !2800)
!3021 = !DILocation(line: 147, column: 5, scope: !2800)
!3022 = !DILocation(line: 148, column: 5, scope: !2800)
!3023 = !DILocation(line: 149, column: 1, scope: !2800)
!3024 = distinct !DISubprogram(name: "ct_compare_8", scope: !3025, file: !3025, line: 51, type: !1595, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3025 = !DIFile(filename: "../../../src/arithmetic.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!3026 = !DILocalVariable(name: "a", arg: 1, scope: !3024, file: !3025, line: 51, type: !51)
!3027 = !DILocation(line: 0, scope: !3024)
!3028 = !DILocalVariable(name: "b", arg: 2, scope: !3024, file: !3025, line: 51, type: !51)
!3029 = !DILocation(line: 52, column: 42, scope: !3024)
!3030 = !DILocation(line: 52, column: 13, scope: !3024)
!3031 = !DILocation(line: 52, column: 71, scope: !3024)
!3032 = !DILocation(line: 52, column: 69, scope: !3024)
!3033 = !DILocation(line: 52, column: 5, scope: !3024)
!3034 = distinct !DISubprogram(name: "mul_fx8", scope: !577, file: !577, line: 28, type: !3035, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3035 = !DISubroutineType(types: !3036)
!3036 = !{!53, !51, !53}
!3037 = !DILocalVariable(name: "a", arg: 1, scope: !3034, file: !577, line: 28, type: !51)
!3038 = !DILocation(line: 0, scope: !3034)
!3039 = !DILocalVariable(name: "b", arg: 2, scope: !3034, file: !577, line: 28, type: !53)
!3040 = !DILocation(line: 31, column: 13, scope: !3034)
!3041 = !DILocation(line: 31, column: 10, scope: !3034)
!3042 = !DILocation(line: 31, column: 17, scope: !3034)
!3043 = !DILocalVariable(name: "p", scope: !3034, file: !577, line: 30, type: !53)
!3044 = !DILocation(line: 32, column: 13, scope: !3034)
!3045 = !DILocation(line: 32, column: 10, scope: !3034)
!3046 = !DILocation(line: 32, column: 17, scope: !3034)
!3047 = !DILocation(line: 32, column: 7, scope: !3034)
!3048 = !DILocation(line: 33, column: 13, scope: !3034)
!3049 = !DILocation(line: 33, column: 10, scope: !3034)
!3050 = !DILocation(line: 33, column: 17, scope: !3034)
!3051 = !DILocation(line: 33, column: 7, scope: !3034)
!3052 = !DILocation(line: 34, column: 13, scope: !3034)
!3053 = !DILocation(line: 34, column: 10, scope: !3034)
!3054 = !DILocation(line: 34, column: 17, scope: !3034)
!3055 = !DILocation(line: 34, column: 7, scope: !3034)
!3056 = !DILocalVariable(name: "top_p", scope: !3034, file: !577, line: 37, type: !53)
!3057 = !DILocation(line: 38, column: 32, scope: !3034)
!3058 = !DILocation(line: 38, column: 47, scope: !3034)
!3059 = !DILocation(line: 38, column: 38, scope: !3034)
!3060 = !DILocation(line: 38, column: 54, scope: !3034)
!3061 = !DILocalVariable(name: "out", scope: !3034, file: !577, line: 38, type: !53)
!3062 = !DILocation(line: 39, column: 5, scope: !3034)
!3063 = distinct !DISubprogram(name: "ef_pack_m_vec", scope: !2801, file: !2801, line: 24, type: !3064, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3064 = !DISubroutineType(types: !3065)
!3065 = !{null, !90, !52, !86}
!3066 = !DILocalVariable(name: "in", arg: 1, scope: !3063, file: !2801, line: 24, type: !90)
!3067 = !DILocation(line: 0, scope: !3063)
!3068 = !DILocalVariable(name: "out", arg: 2, scope: !3063, file: !2801, line: 24, type: !52)
!3069 = !DILocalVariable(name: "ncols", arg: 3, scope: !3063, file: !2801, line: 24, type: !86)
!3070 = !DILocalVariable(name: "out8", scope: !3063, file: !2801, line: 26, type: !61)
!3071 = !DILocalVariable(name: "i", scope: !3063, file: !2801, line: 25, type: !86)
!3072 = !DILocation(line: 27, column: 9, scope: !3073)
!3073 = distinct !DILexicalBlock(scope: !3063, file: !2801, line: 27, column: 5)
!3074 = !DILocation(line: 27, scope: !3073)
!3075 = !DILocation(line: 27, column: 17, scope: !3076)
!3076 = distinct !DILexicalBlock(scope: !3073, file: !2801, line: 27, column: 5)
!3077 = !DILocation(line: 27, column: 20, scope: !3076)
!3078 = !DILocation(line: 27, column: 5, scope: !3073)
!3079 = !DILocation(line: 31, column: 23, scope: !3080)
!3080 = distinct !DILexicalBlock(scope: !3076, file: !2801, line: 27, column: 36)
!3081 = !DILocation(line: 31, column: 44, scope: !3080)
!3082 = !DILocation(line: 31, column: 40, scope: !3080)
!3083 = !DILocation(line: 31, column: 48, scope: !3080)
!3084 = !DILocation(line: 31, column: 37, scope: !3080)
!3085 = !DILocation(line: 31, column: 15, scope: !3080)
!3086 = !DILocation(line: 31, column: 9, scope: !3080)
!3087 = !DILocation(line: 31, column: 20, scope: !3080)
!3088 = !DILocation(line: 27, column: 31, scope: !3076)
!3089 = !DILocation(line: 27, column: 5, scope: !3076)
!3090 = distinct !{!3090, !3078, !3091, !388}
!3091 = !DILocation(line: 33, column: 5, scope: !3073)
!3092 = !DILocation(line: 34, column: 19, scope: !3093)
!3093 = distinct !DILexicalBlock(scope: !3063, file: !2801, line: 34, column: 9)
!3094 = !DILocation(line: 38, column: 23, scope: !3095)
!3095 = distinct !DILexicalBlock(scope: !3093, file: !2801, line: 34, column: 24)
!3096 = !DILocation(line: 38, column: 15, scope: !3095)
!3097 = !DILocation(line: 38, column: 9, scope: !3095)
!3098 = !DILocation(line: 38, column: 20, scope: !3095)
!3099 = !DILocation(line: 40, column: 5, scope: !3095)
!3100 = !DILocation(line: 41, column: 1, scope: !3063)
!3101 = distinct !DISubprogram(name: "ct_compare_64", scope: !3025, file: !3025, line: 46, type: !3102, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3102 = !DISubroutineType(types: !3103)
!3103 = !{!53, !86, !86}
!3104 = !DILocalVariable(name: "a", arg: 1, scope: !3101, file: !3025, line: 46, type: !86)
!3105 = !DILocation(line: 0, scope: !3101)
!3106 = !DILocalVariable(name: "b", arg: 2, scope: !3101, file: !3025, line: 46, type: !86)
!3107 = !DILocation(line: 47, column: 38, scope: !3101)
!3108 = !DILocation(line: 47, column: 44, scope: !3101)
!3109 = !DILocation(line: 47, column: 73, scope: !3101)
!3110 = !DILocation(line: 47, column: 71, scope: !3101)
!3111 = !DILocation(line: 47, column: 5, scope: !3101)
!3112 = distinct !DISubprogram(name: "ct_64_is_greater_than", scope: !3025, file: !3025, line: 35, type: !3102, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3113 = !DILocalVariable(name: "a", arg: 1, scope: !3112, file: !3025, line: 35, type: !86)
!3114 = !DILocation(line: 0, scope: !3112)
!3115 = !DILocalVariable(name: "b", arg: 2, scope: !3112, file: !3025, line: 35, type: !86)
!3116 = !DILocalVariable(name: "diff", scope: !3112, file: !3025, line: 36, type: !87)
!3117 = !DILocation(line: 37, column: 30, scope: !3112)
!3118 = !DILocation(line: 37, column: 59, scope: !3112)
!3119 = !DILocation(line: 37, column: 57, scope: !3112)
!3120 = !DILocation(line: 37, column: 5, scope: !3112)
!3121 = distinct !DISubprogram(name: "m_extract_element", scope: !2801, file: !2801, line: 16, type: !3122, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3122 = !DISubroutineType(types: !3123)
!3123 = !{!51, !411, !86}
!3124 = !DILocalVariable(name: "in", arg: 1, scope: !3121, file: !2801, line: 16, type: !411)
!3125 = !DILocation(line: 0, scope: !3121)
!3126 = !DILocalVariable(name: "index", arg: 2, scope: !3121, file: !2801, line: 16, type: !86)
!3127 = !DILocation(line: 17, column: 27, scope: !3121)
!3128 = !DILocalVariable(name: "leg", scope: !3121, file: !2801, line: 17, type: !324)
!3129 = !DILocation(line: 18, column: 30, scope: !3121)
!3130 = !DILocalVariable(name: "offset", scope: !3121, file: !2801, line: 18, type: !324)
!3131 = !DILocation(line: 20, column: 13, scope: !3121)
!3132 = !DILocation(line: 20, column: 31, scope: !3121)
!3133 = !DILocation(line: 20, column: 21, scope: !3121)
!3134 = !DILocation(line: 20, column: 12, scope: !3121)
!3135 = !DILocation(line: 20, column: 5, scope: !3121)
!3136 = distinct !DISubprogram(name: "inverse_f", scope: !577, file: !577, line: 57, type: !3137, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3137 = !DISubroutineType(types: !3138)
!3138 = !{!51, !51}
!3139 = !DILocalVariable(name: "a", arg: 1, scope: !3136, file: !577, line: 57, type: !51)
!3140 = !DILocation(line: 0, scope: !3136)
!3141 = !DILocation(line: 61, column: 24, scope: !3136)
!3142 = !DILocalVariable(name: "a2", scope: !3136, file: !577, line: 61, type: !51)
!3143 = !DILocation(line: 62, column: 24, scope: !3136)
!3144 = !DILocalVariable(name: "a4", scope: !3136, file: !577, line: 62, type: !51)
!3145 = !DILocation(line: 63, column: 24, scope: !3136)
!3146 = !DILocalVariable(name: "a8", scope: !3136, file: !577, line: 63, type: !51)
!3147 = !DILocation(line: 64, column: 24, scope: !3136)
!3148 = !DILocalVariable(name: "a6", scope: !3136, file: !577, line: 64, type: !51)
!3149 = !DILocation(line: 65, column: 25, scope: !3136)
!3150 = !DILocalVariable(name: "a14", scope: !3136, file: !577, line: 65, type: !51)
!3151 = !DILocation(line: 67, column: 5, scope: !3136)
!3152 = distinct !DISubprogram(name: "vec_mul_add_u64", scope: !3025, file: !3025, line: 94, type: !3153, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3153 = !DISubroutineType(types: !3154)
!3154 = !{null, !324, !411, !51, !52}
!3155 = !DILocalVariable(name: "legs", arg: 1, scope: !3152, file: !3025, line: 94, type: !324)
!3156 = !DILocation(line: 0, scope: !3152)
!3157 = !DILocalVariable(name: "in", arg: 2, scope: !3152, file: !3025, line: 94, type: !411)
!3158 = !DILocalVariable(name: "a", arg: 3, scope: !3152, file: !3025, line: 94, type: !51)
!3159 = !DILocalVariable(name: "acc", arg: 4, scope: !3152, file: !3025, line: 94, type: !52)
!3160 = !DILocation(line: 95, column: 20, scope: !3152)
!3161 = !DILocalVariable(name: "tab", scope: !3152, file: !3025, line: 95, type: !62)
!3162 = !DILocalVariable(name: "lsb_ask", scope: !3152, file: !3025, line: 97, type: !53)
!3163 = !DILocalVariable(name: "i", scope: !3164, file: !3025, line: 99, type: !86)
!3164 = distinct !DILexicalBlock(scope: !3152, file: !3025, line: 99, column: 5)
!3165 = !DILocation(line: 0, scope: !3164)
!3166 = !DILocation(line: 99, column: 9, scope: !3164)
!3167 = !DILocation(line: 99, scope: !3164)
!3168 = !DILocation(line: 99, column: 20, scope: !3169)
!3169 = distinct !DILexicalBlock(scope: !3164, file: !3025, line: 99, column: 5)
!3170 = !DILocation(line: 99, column: 5, scope: !3164)
!3171 = !DILocation(line: 100, column: 21, scope: !3172)
!3172 = distinct !DILexicalBlock(scope: !3169, file: !3025, line: 99, column: 32)
!3173 = !DILocation(line: 100, column: 33, scope: !3172)
!3174 = !DILocation(line: 100, column: 51, scope: !3172)
!3175 = !DILocation(line: 100, column: 46, scope: !3172)
!3176 = !DILocation(line: 100, column: 44, scope: !3172)
!3177 = !DILocation(line: 101, column: 27, scope: !3172)
!3178 = !DILocation(line: 101, column: 33, scope: !3172)
!3179 = !DILocation(line: 101, column: 52, scope: !3172)
!3180 = !DILocation(line: 101, column: 59, scope: !3172)
!3181 = !DILocation(line: 101, column: 46, scope: !3172)
!3182 = !DILocation(line: 101, column: 44, scope: !3172)
!3183 = !DILocation(line: 101, column: 17, scope: !3172)
!3184 = !DILocation(line: 102, column: 21, scope: !3172)
!3185 = !DILocation(line: 102, column: 27, scope: !3172)
!3186 = !DILocation(line: 102, column: 33, scope: !3172)
!3187 = !DILocation(line: 102, column: 52, scope: !3172)
!3188 = !DILocation(line: 102, column: 59, scope: !3172)
!3189 = !DILocation(line: 102, column: 46, scope: !3172)
!3190 = !DILocation(line: 102, column: 44, scope: !3172)
!3191 = !DILocation(line: 102, column: 17, scope: !3172)
!3192 = !DILocation(line: 103, column: 21, scope: !3172)
!3193 = !DILocation(line: 103, column: 27, scope: !3172)
!3194 = !DILocation(line: 103, column: 33, scope: !3172)
!3195 = !DILocation(line: 103, column: 52, scope: !3172)
!3196 = !DILocation(line: 103, column: 59, scope: !3172)
!3197 = !DILocation(line: 103, column: 46, scope: !3172)
!3198 = !DILocation(line: 103, column: 44, scope: !3172)
!3199 = !DILocation(line: 103, column: 17, scope: !3172)
!3200 = !DILocation(line: 100, column: 9, scope: !3172)
!3201 = !DILocation(line: 100, column: 16, scope: !3172)
!3202 = !DILocation(line: 99, column: 29, scope: !3169)
!3203 = !DILocation(line: 99, column: 5, scope: !3169)
!3204 = distinct !{!3204, !3170, !3205, !388}
!3205 = !DILocation(line: 104, column: 5, scope: !3164)
!3206 = !DILocation(line: 105, column: 1, scope: !3152)
!3207 = distinct !DISubprogram(name: "ef_unpack_m_vec", scope: !2801, file: !2801, line: 44, type: !3208, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3208 = !DISubroutineType(types: !3209)
!3209 = !{null, !86, !411, !61}
!3210 = !DILocalVariable(name: "legs", arg: 1, scope: !3207, file: !2801, line: 44, type: !86)
!3211 = !DILocation(line: 0, scope: !3207)
!3212 = !DILocalVariable(name: "in", arg: 2, scope: !3207, file: !2801, line: 44, type: !411)
!3213 = !DILocalVariable(name: "out", arg: 3, scope: !3207, file: !2801, line: 44, type: !61)
!3214 = !DILocalVariable(name: "in8", scope: !3207, file: !2801, line: 45, type: !90)
!3215 = !DILocalVariable(name: "i", scope: !3216, file: !2801, line: 46, type: !86)
!3216 = distinct !DILexicalBlock(scope: !3207, file: !2801, line: 46, column: 5)
!3217 = !DILocation(line: 0, scope: !3216)
!3218 = !DILocation(line: 46, column: 9, scope: !3216)
!3219 = !DILocation(line: 46, scope: !3216)
!3220 = !DILocation(line: 46, column: 29, scope: !3221)
!3221 = distinct !DILexicalBlock(scope: !3216, file: !2801, line: 46, column: 5)
!3222 = !DILocation(line: 46, column: 22, scope: !3221)
!3223 = !DILocation(line: 46, column: 5, scope: !3216)
!3224 = !DILocation(line: 51, column: 26, scope: !3225)
!3225 = distinct !DILexicalBlock(scope: !3221, file: !2801, line: 46, column: 42)
!3226 = !DILocation(line: 51, column: 21, scope: !3225)
!3227 = !DILocation(line: 51, column: 31, scope: !3225)
!3228 = !DILocation(line: 51, column: 9, scope: !3225)
!3229 = !DILocation(line: 51, column: 18, scope: !3225)
!3230 = !DILocation(line: 52, column: 26, scope: !3225)
!3231 = !DILocation(line: 52, column: 21, scope: !3225)
!3232 = !DILocation(line: 52, column: 30, scope: !3225)
!3233 = !DILocation(line: 52, column: 14, scope: !3225)
!3234 = !DILocation(line: 52, column: 9, scope: !3225)
!3235 = !DILocation(line: 52, column: 18, scope: !3225)
!3236 = !DILocation(line: 46, column: 37, scope: !3221)
!3237 = !DILocation(line: 46, column: 5, scope: !3221)
!3238 = distinct !{!3238, !3223, !3239, !388}
!3239 = !DILocation(line: 54, column: 5, scope: !3216)
!3240 = !DILocation(line: 55, column: 1, scope: !3207)
!3241 = distinct !DISubprogram(name: "mul_table", scope: !577, file: !577, line: 130, type: !578, scopeLine: 130, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3242 = !DILocalVariable(name: "b", arg: 1, scope: !3241, file: !577, line: 130, type: !175)
!3243 = !DILocation(line: 0, scope: !3241)
!3244 = !DILocation(line: 131, column: 19, scope: !3241)
!3245 = !DILocation(line: 131, column: 33, scope: !3241)
!3246 = !DILocalVariable(name: "x", scope: !3241, file: !577, line: 131, type: !62)
!3247 = !DILocalVariable(name: "high_nibble_mask", scope: !3241, file: !577, line: 133, type: !62)
!3248 = !DILocation(line: 135, column: 28, scope: !3241)
!3249 = !DILocalVariable(name: "high_half", scope: !3241, file: !577, line: 135, type: !62)
!3250 = !DILocation(line: 136, column: 28, scope: !3241)
!3251 = !DILocation(line: 136, column: 47, scope: !3241)
!3252 = !DILocation(line: 136, column: 34, scope: !3241)
!3253 = !DILocation(line: 136, column: 5, scope: !3241)
!3254 = distinct !DISubprogram(name: "mul_f", scope: !577, file: !577, line: 9, type: !1595, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3255 = !DILocalVariable(name: "a", arg: 1, scope: !3254, file: !577, line: 9, type: !51)
!3256 = !DILocation(line: 0, scope: !3254)
!3257 = !DILocalVariable(name: "b", arg: 2, scope: !3254, file: !577, line: 9, type: !51)
!3258 = !DILocation(line: 14, column: 10, scope: !3254)
!3259 = !DILocation(line: 14, column: 7, scope: !3254)
!3260 = !DILocation(line: 17, column: 17, scope: !3254)
!3261 = !DILocalVariable(name: "p", scope: !3254, file: !577, line: 11, type: !51)
!3262 = !DILocation(line: 18, column: 13, scope: !3254)
!3263 = !DILocation(line: 18, column: 17, scope: !3254)
!3264 = !DILocation(line: 18, column: 7, scope: !3254)
!3265 = !DILocation(line: 19, column: 13, scope: !3254)
!3266 = !DILocation(line: 19, column: 17, scope: !3254)
!3267 = !DILocation(line: 19, column: 7, scope: !3254)
!3268 = !DILocation(line: 20, column: 13, scope: !3254)
!3269 = !DILocation(line: 20, column: 17, scope: !3254)
!3270 = !DILocation(line: 20, column: 7, scope: !3254)
!3271 = !DILocalVariable(name: "top_p", scope: !3254, file: !577, line: 23, type: !51)
!3272 = !DILocation(line: 24, column: 37, scope: !3254)
!3273 = !DILocation(line: 24, column: 52, scope: !3254)
!3274 = !DILocation(line: 24, column: 43, scope: !3254)
!3275 = !DILocation(line: 24, column: 59, scope: !3254)
!3276 = !DILocalVariable(name: "out", scope: !3254, file: !577, line: 24, type: !51)
!3277 = !DILocation(line: 25, column: 5, scope: !3254)
!3278 = distinct !DISubprogram(name: "lincomb", scope: !577, file: !577, line: 70, type: !1603, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3279 = !DILocalVariable(name: "a", arg: 1, scope: !3278, file: !577, line: 70, type: !90)
!3280 = !DILocation(line: 0, scope: !3278)
!3281 = !DILocalVariable(name: "b", arg: 2, scope: !3278, file: !577, line: 71, type: !90)
!3282 = !DILocalVariable(name: "n", arg: 3, scope: !3278, file: !577, line: 71, type: !86)
!3283 = !DILocalVariable(name: "m", arg: 4, scope: !3278, file: !577, line: 71, type: !86)
!3284 = !DILocalVariable(name: "ret", scope: !3278, file: !577, line: 72, type: !51)
!3285 = !DILocalVariable(name: "i", scope: !3286, file: !577, line: 73, type: !86)
!3286 = distinct !DILexicalBlock(scope: !3278, file: !577, line: 73, column: 5)
!3287 = !DILocation(line: 0, scope: !3286)
!3288 = !DILocation(line: 73, column: 10, scope: !3286)
!3289 = !DILocation(line: 73, scope: !3286)
!3290 = !DILocation(line: 73, column: 23, scope: !3291)
!3291 = distinct !DILexicalBlock(scope: !3286, file: !577, line: 73, column: 5)
!3292 = !DILocation(line: 73, column: 5, scope: !3286)
!3293 = !DILocation(line: 74, column: 27, scope: !3294)
!3294 = distinct !DILexicalBlock(scope: !3291, file: !577, line: 73, column: 41)
!3295 = !DILocation(line: 74, column: 33, scope: !3294)
!3296 = !DILocation(line: 74, column: 21, scope: !3294)
!3297 = !DILocation(line: 74, column: 15, scope: !3294)
!3298 = !DILocation(line: 73, column: 28, scope: !3291)
!3299 = !DILocation(line: 73, column: 35, scope: !3291)
!3300 = !DILocation(line: 73, column: 5, scope: !3291)
!3301 = distinct !{!3301, !3292, !3302, !388}
!3302 = !DILocation(line: 75, column: 5, scope: !3286)
!3303 = !DILocation(line: 76, column: 5, scope: !3278)
!3304 = distinct !DISubprogram(name: "add_f", scope: !577, file: !577, line: 43, type: !1595, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3305 = !DILocalVariable(name: "a", arg: 1, scope: !3304, file: !577, line: 43, type: !51)
!3306 = !DILocation(line: 0, scope: !3304)
!3307 = !DILocalVariable(name: "b", arg: 2, scope: !3304, file: !577, line: 43, type: !51)
!3308 = !DILocation(line: 44, column: 14, scope: !3304)
!3309 = !DILocation(line: 44, column: 5, scope: !3304)
