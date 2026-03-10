; ModuleID = 'composite'
source_filename = "composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "arm-unknown-none-eabi"

%struct.mayo_params_t = type { i32, i32, i32, i32, i32, ptr, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, ptr }
%struct.sk_t = type { [113103 x i64], [2414 x i8] }

@MAYO_1 = external dso_local constant %struct.mayo_params_t, align 4
@MAYO_2 = external dso_local constant %struct.mayo_params_t, align 4
@MAYO_3 = external dso_local constant %struct.mayo_params_t, align 4
@MAYO_5 = external dso_local constant %struct.mayo_params_t, align 4
@__const.main.params = private unnamed_addr constant [4 x ptr] [ptr @MAYO_1, ptr @MAYO_2, ptr @MAYO_3, ptr @MAYO_5], align 4
@__const.example_mayo.msg = private unnamed_addr constant <{ i8, [31 x i8] }> <{ i8 14, [31 x i8] zeroinitializer }>, align 1
@.str = private unnamed_addr constant [17 x i8] c"Example with %s\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [17 x i8] c"mayo_keypair -> \00", align 1, !dbg !7
@.str.2 = private unnamed_addr constant [6 x i8] c"FAIL\0A\00", align 1, !dbg !9
@.str.3 = private unnamed_addr constant [4 x i8] c"OK\0A\00", align 1, !dbg !14
@.str.4 = private unnamed_addr constant [19 x i8] c"mayo_expand_sk -> \00", align 1, !dbg !19
@.str.5 = private unnamed_addr constant [19 x i8] c"mayo_expand_pk -> \00", align 1, !dbg !24
@.str.6 = private unnamed_addr constant [14 x i8] c"mayo_sign -> \00", align 1, !dbg !26
@.str.7 = private unnamed_addr constant [39 x i8] c"mayo_open (with correct signature) -> \00", align 1, !dbg !31
@.str.8 = private unnamed_addr constant [41 x i8] c"mayo_verify (with correct signature) -> \00", align 1, !dbg !36
@uint32_t_blocker = dso_local global i32 0, align 4, !dbg !41
@uint64_t_blocker = dso_local global i64 0, align 8, !dbg !68
@unsigned_char_blocker = dso_local global i8 0, align 1, !dbg !72

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 !dbg !104 {
entry:
  %retval = alloca i32, align 4
  %params = alloca [4 x ptr], align 4
  %paramslen = alloca i32, align 4
  %i = alloca i32, align 4
    #dbg_declare(ptr %params, !107, !DIExpression(), !140)
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %params, ptr align 4 @__const.main.params, i32 16, i1 false), !dbg !140
    #dbg_declare(ptr %paramslen, !141, !DIExpression(), !142)
  store i32 4, ptr %paramslen, align 4, !dbg !142
    #dbg_declare(ptr %i, !143, !DIExpression(), !145)
  store i32 0, ptr %i, align 4, !dbg !145
  br label %for.cond, !dbg !146

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4, !dbg !147
  %1 = load i32, ptr %paramslen, align 4, !dbg !149
  %cmp = icmp slt i32 %0, %1, !dbg !150
  br i1 %cmp, label %for.body, label %for.end, !dbg !151

for.body:                                         ; preds = %for.cond
  %2 = load i32, ptr %i, align 4, !dbg !152
  %arrayidx = getelementptr inbounds [4 x ptr], ptr %params, i32 0, i32 %2, !dbg !155
  %3 = load ptr, ptr %arrayidx, align 4, !dbg !155
  %call = call i32 @example_mayo(ptr noundef %3) #5, !dbg !156
  %cmp1 = icmp ne i32 %call, 0, !dbg !157
  br i1 %cmp1, label %if.then, label %if.end, !dbg !157

if.then:                                          ; preds = %for.body
  store i32 -1, ptr %retval, align 4, !dbg !158
  br label %for.end, !dbg !158

if.end:                                           ; preds = %for.body
  br label %for.inc, !dbg !160

for.inc:                                          ; preds = %if.end
  %4 = load i32, ptr %i, align 4, !dbg !161
  %inc = add nsw i32 %4, 1, !dbg !161
  store i32 %inc, ptr %i, align 4, !dbg !161
  br label %for.cond, !dbg !162, !llvm.loop !163

for.end:                                          ; preds = %if.then, %for.cond
  %5 = load i32, ptr %retval, align 4, !dbg !166
  ret i32 %5, !dbg !166
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i32(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i32, i1 immarg) #1

; Function Attrs: noinline nounwind optnone
define internal i32 @example_mayo(ptr noundef %p) #0 !dbg !167 {
entry:
  %p.addr = alloca ptr, align 4
  %msglen = alloca i32, align 4
  %smlen = alloca i32, align 4
  %pk = alloca ptr, align 4
  %sk = alloca ptr, align 4
  %epk = alloca ptr, align 4
  %esk = alloca ptr, align 4
  %sig = alloca ptr, align 4
  %msg = alloca [32 x i8], align 1
  %msg2 = alloca [32 x i8], align 1
  %res = alloca i32, align 4
  store ptr %p, ptr %p.addr, align 4
    #dbg_declare(ptr %p.addr, !170, !DIExpression(), !171)
    #dbg_declare(ptr %msglen, !172, !DIExpression(), !173)
  store i32 32, ptr %msglen, align 4, !dbg !173
    #dbg_declare(ptr %smlen, !174, !DIExpression(), !175)
  %0 = load ptr, ptr %p.addr, align 4, !dbg !176
  %sig_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %0, i32 0, i32 16, !dbg !176
  %1 = load i32, ptr %sig_bytes, align 4, !dbg !176
  %2 = load i32, ptr %msglen, align 4, !dbg !177
  %add = add i32 %1, %2, !dbg !178
  store i32 %add, ptr %smlen, align 4, !dbg !175
    #dbg_declare(ptr %pk, !179, !DIExpression(), !180)
  %3 = load ptr, ptr %p.addr, align 4, !dbg !181
  %cpk_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %3, i32 0, i32 15, !dbg !181
  %4 = load i32, ptr %cpk_bytes, align 4, !dbg !181
  %call = call ptr @calloc(i32 noundef %4, i32 noundef 1) #6, !dbg !182
  store ptr %call, ptr %pk, align 4, !dbg !180
    #dbg_declare(ptr %sk, !183, !DIExpression(), !184)
  %5 = load ptr, ptr %p.addr, align 4, !dbg !185
  %csk_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %5, i32 0, i32 14, !dbg !185
  %6 = load i32, ptr %csk_bytes, align 4, !dbg !185
  %call1 = call ptr @calloc(i32 noundef %6, i32 noundef 1) #6, !dbg !186
  store ptr %call1, ptr %sk, align 4, !dbg !184
    #dbg_declare(ptr %epk, !187, !DIExpression(), !188)
  %call2 = call ptr @calloc(i32 noundef 1, i32 noundef 915840) #6, !dbg !189
  store ptr %call2, ptr %epk, align 4, !dbg !188
    #dbg_declare(ptr %esk, !190, !DIExpression(), !205)
  %call3 = call ptr @calloc(i32 noundef 1, i32 noundef 907240) #6, !dbg !206
  store ptr %call3, ptr %esk, align 4, !dbg !205
    #dbg_declare(ptr %sig, !207, !DIExpression(), !208)
  %7 = load ptr, ptr %p.addr, align 4, !dbg !209
  %sig_bytes4 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %7, i32 0, i32 16, !dbg !209
  %8 = load i32, ptr %sig_bytes4, align 4, !dbg !209
  %9 = load i32, ptr %msglen, align 4, !dbg !210
  %add5 = add i32 %8, %9, !dbg !211
  %call6 = call ptr @calloc(i32 noundef %add5, i32 noundef 1) #6, !dbg !212
  store ptr %call6, ptr %sig, align 4, !dbg !208
    #dbg_declare(ptr %msg, !213, !DIExpression(), !217)
  call void @llvm.memcpy.p0.p0.i32(ptr align 1 %msg, ptr align 1 @__const.example_mayo.msg, i32 32, i1 false), !dbg !217
    #dbg_declare(ptr %msg2, !218, !DIExpression(), !219)
  call void @llvm.memset.p0.i32(ptr align 1 %msg2, i8 0, i32 32, i1 false), !dbg !219
  %10 = load ptr, ptr %p.addr, align 4, !dbg !220
  %name = getelementptr inbounds nuw %struct.mayo_params_t, ptr %10, i32 0, i32 22, !dbg !220
  %11 = load ptr, ptr %name, align 4, !dbg !220
  %call7 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %11) #5, !dbg !221
  %call8 = call i32 (ptr, ...) @printf(ptr noundef @.str.1) #5, !dbg !222
    #dbg_declare(ptr %res, !223, !DIExpression(), !224)
  %12 = load ptr, ptr %p.addr, align 4, !dbg !225
  %13 = load ptr, ptr %pk, align 4, !dbg !226
  %14 = load ptr, ptr %sk, align 4, !dbg !227
  %call9 = call i32 @mayo_keypair(ptr noundef %12, ptr noundef %13, ptr noundef %14) #5, !dbg !228
  store i32 %call9, ptr %res, align 4, !dbg !224
  %15 = load i32, ptr %res, align 4, !dbg !229
  %cmp = icmp ne i32 %15, 0, !dbg !231
  br i1 %cmp, label %if.then, label %if.else, !dbg !231

if.then:                                          ; preds = %entry
  %call10 = call i32 (ptr, ...) @printf(ptr noundef @.str.2) #5, !dbg !232
  store i32 -1, ptr %res, align 4, !dbg !234
  br label %err, !dbg !235

if.else:                                          ; preds = %entry
  %call11 = call i32 (ptr, ...) @printf(ptr noundef @.str.3) #5, !dbg !236
  br label %if.end

if.end:                                           ; preds = %if.else
  %call12 = call i32 (ptr, ...) @printf(ptr noundef @.str.4) #5, !dbg !238
  %16 = load ptr, ptr %p.addr, align 4, !dbg !239
  %17 = load ptr, ptr %sk, align 4, !dbg !240
  %18 = load ptr, ptr %esk, align 4, !dbg !241
  %call13 = call i32 @mayo_expand_sk(ptr noundef %16, ptr noundef %17, ptr noundef %18) #5, !dbg !242
  store i32 %call13, ptr %res, align 4, !dbg !243
  %19 = load i32, ptr %res, align 4, !dbg !244
  %cmp14 = icmp ne i32 %19, 0, !dbg !246
  br i1 %cmp14, label %if.then15, label %if.else17, !dbg !246

if.then15:                                        ; preds = %if.end
  %call16 = call i32 (ptr, ...) @printf(ptr noundef @.str.2) #5, !dbg !247
  store i32 -1, ptr %res, align 4, !dbg !249
  br label %err, !dbg !250

if.else17:                                        ; preds = %if.end
  %call18 = call i32 (ptr, ...) @printf(ptr noundef @.str.3) #5, !dbg !251
  br label %if.end19

if.end19:                                         ; preds = %if.else17
  %call20 = call i32 (ptr, ...) @printf(ptr noundef @.str.5) #5, !dbg !253
  %20 = load ptr, ptr %p.addr, align 4, !dbg !254
  %21 = load ptr, ptr %pk, align 4, !dbg !255
  %22 = load ptr, ptr %epk, align 4, !dbg !256
  %call21 = call i32 @mayo_expand_pk(ptr noundef %20, ptr noundef %21, ptr noundef %22) #5, !dbg !257
  store i32 %call21, ptr %res, align 4, !dbg !258
  %23 = load i32, ptr %res, align 4, !dbg !259
  %cmp22 = icmp ne i32 %23, 0, !dbg !261
  br i1 %cmp22, label %if.then23, label %if.else25, !dbg !261

if.then23:                                        ; preds = %if.end19
  %call24 = call i32 (ptr, ...) @printf(ptr noundef @.str.2) #5, !dbg !262
  store i32 -1, ptr %res, align 4, !dbg !264
  br label %err, !dbg !265

if.else25:                                        ; preds = %if.end19
  %call26 = call i32 (ptr, ...) @printf(ptr noundef @.str.3) #5, !dbg !266
  br label %if.end27

if.end27:                                         ; preds = %if.else25
  %call28 = call i32 (ptr, ...) @printf(ptr noundef @.str.6) #5, !dbg !268
  %24 = load ptr, ptr %p.addr, align 4, !dbg !269
  %25 = load ptr, ptr %sig, align 4, !dbg !270
  %arraydecay = getelementptr inbounds [32 x i8], ptr %msg, i32 0, i32 0, !dbg !271
  %26 = load i32, ptr %msglen, align 4, !dbg !272
  %27 = load ptr, ptr %sk, align 4, !dbg !273
  %call29 = call i32 @mayo_sign(ptr noundef %24, ptr noundef %25, ptr noundef %smlen, ptr noundef %arraydecay, i32 noundef %26, ptr noundef %27) #5, !dbg !274
  store i32 %call29, ptr %res, align 4, !dbg !275
  %28 = load i32, ptr %res, align 4, !dbg !276
  %cmp30 = icmp ne i32 %28, 0, !dbg !278
  br i1 %cmp30, label %if.then31, label %if.else33, !dbg !278

if.then31:                                        ; preds = %if.end27
  %call32 = call i32 (ptr, ...) @printf(ptr noundef @.str.2) #5, !dbg !279
  store i32 -1, ptr %res, align 4, !dbg !281
  br label %err, !dbg !282

if.else33:                                        ; preds = %if.end27
  %call34 = call i32 (ptr, ...) @printf(ptr noundef @.str.3) #5, !dbg !283
  br label %if.end35

if.end35:                                         ; preds = %if.else33
  %call36 = call i32 (ptr, ...) @printf(ptr noundef @.str.7) #5, !dbg !285
  %29 = load ptr, ptr %p.addr, align 4, !dbg !286
  %arraydecay37 = getelementptr inbounds [32 x i8], ptr %msg2, i32 0, i32 0, !dbg !287
  %30 = load ptr, ptr %sig, align 4, !dbg !288
  %31 = load i32, ptr %smlen, align 4, !dbg !289
  %32 = load ptr, ptr %pk, align 4, !dbg !290
  %call38 = call i32 @mayo_open(ptr noundef %29, ptr noundef %arraydecay37, ptr noundef %msglen, ptr noundef %30, i32 noundef %31, ptr noundef %32) #5, !dbg !291
  store i32 %call38, ptr %res, align 4, !dbg !292
  %33 = load i32, ptr %res, align 4, !dbg !293
  %cmp39 = icmp ne i32 %33, 0, !dbg !295
  br i1 %cmp39, label %if.then43, label %lor.lhs.false, !dbg !296

lor.lhs.false:                                    ; preds = %if.end35
  %arraydecay40 = getelementptr inbounds [32 x i8], ptr %msg, i32 0, i32 0, !dbg !297
  %arraydecay41 = getelementptr inbounds [32 x i8], ptr %msg2, i32 0, i32 0, !dbg !298
  %34 = load i32, ptr %msglen, align 4, !dbg !299
  %call42 = call i32 @memcmp(ptr noundef %arraydecay40, ptr noundef %arraydecay41, i32 noundef %34) #5, !dbg !300
  %tobool = icmp ne i32 %call42, 0, !dbg !300
  br i1 %tobool, label %if.then43, label %if.else45, !dbg !296

if.then43:                                        ; preds = %lor.lhs.false, %if.end35
  %call44 = call i32 (ptr, ...) @printf(ptr noundef @.str.2) #5, !dbg !301
  store i32 -1, ptr %res, align 4, !dbg !303
  br label %err, !dbg !304

if.else45:                                        ; preds = %lor.lhs.false
  store i32 0, ptr %res, align 4, !dbg !305
  %call46 = call i32 (ptr, ...) @printf(ptr noundef @.str.3) #5, !dbg !307
  br label %if.end47

if.end47:                                         ; preds = %if.else45
  %call48 = call i32 (ptr, ...) @printf(ptr noundef @.str.8) #5, !dbg !308
  %35 = load ptr, ptr %p.addr, align 4, !dbg !309
  %arraydecay49 = getelementptr inbounds [32 x i8], ptr %msg, i32 0, i32 0, !dbg !310
  %36 = load i32, ptr %msglen, align 4, !dbg !311
  %37 = load ptr, ptr %sig, align 4, !dbg !312
  %38 = load ptr, ptr %pk, align 4, !dbg !313
  %call50 = call i32 @mayo_verify(ptr noundef %35, ptr noundef %arraydecay49, i32 noundef %36, ptr noundef %37, ptr noundef %38) #5, !dbg !314
  store i32 %call50, ptr %res, align 4, !dbg !315
  %39 = load i32, ptr %res, align 4, !dbg !316
  %cmp51 = icmp ne i32 %39, 0, !dbg !318
  br i1 %cmp51, label %if.then52, label %if.else54, !dbg !318

if.then52:                                        ; preds = %if.end47
  %call53 = call i32 (ptr, ...) @printf(ptr noundef @.str.2) #5, !dbg !319
  store i32 -1, ptr %res, align 4, !dbg !321
  br label %err, !dbg !322

if.else54:                                        ; preds = %if.end47
  store i32 0, ptr %res, align 4, !dbg !323
  %call55 = call i32 (ptr, ...) @printf(ptr noundef @.str.3) #5, !dbg !325
  br label %if.end56

if.end56:                                         ; preds = %if.else54
  br label %err, !dbg !326

err:                                              ; preds = %if.end56, %if.then52, %if.then43, %if.then31, %if.then23, %if.then15, %if.then
    #dbg_label(!327, !328)
  %40 = load ptr, ptr %pk, align 4, !dbg !329
  call void @free(ptr noundef %40) #5, !dbg !330
  %41 = load ptr, ptr %epk, align 4, !dbg !331
  call void @free(ptr noundef %41) #5, !dbg !332
  %42 = load ptr, ptr %sk, align 4, !dbg !333
  %43 = load ptr, ptr %p.addr, align 4, !dbg !334
  %csk_bytes57 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %43, i32 0, i32 14, !dbg !334
  %44 = load i32, ptr %csk_bytes57, align 4, !dbg !334
  call void @mayo_secure_free(ptr noundef %42, i32 noundef %44) #5, !dbg !335
  %45 = load ptr, ptr %esk, align 4, !dbg !336
  call void @mayo_secure_free(ptr noundef %45, i32 noundef 907240) #5, !dbg !337
  %46 = load ptr, ptr %sig, align 4, !dbg !338
  call void @free(ptr noundef %46) #5, !dbg !339
  %47 = load i32, ptr %res, align 4, !dbg !340
  ret i32 %47, !dbg !341
}

; Function Attrs: allocsize(0,1)
declare dso_local ptr @calloc(i32 noundef, i32 noundef) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i32(ptr nocapture writeonly, i8, i32, i1 immarg) #3

declare dso_local i32 @printf(ptr noundef, ...) #4

declare dso_local i32 @memcmp(ptr noundef, ptr noundef, i32 noundef) #4

declare dso_local void @free(ptr noundef) #4

declare dso_local void @mayo_secure_free(ptr noundef, i32 noundef) #4

; Function Attrs: noinline nounwind optnone
define dso_local i32 @mayo_keypair(ptr noundef %p, ptr noundef %pk, ptr noundef %sk) #0 !dbg !342 {
entry:
  %p.addr = alloca ptr, align 4
  %pk.addr = alloca ptr, align 4
  %sk.addr = alloca ptr, align 4
  %ret = alloca i32, align 4
  store ptr %p, ptr %p.addr, align 4
    #dbg_declare(ptr %p.addr, !373, !DIExpression(), !374)
  store ptr %pk, ptr %pk.addr, align 4
    #dbg_declare(ptr %pk.addr, !375, !DIExpression(), !376)
  store ptr %sk, ptr %sk.addr, align 4
    #dbg_declare(ptr %sk.addr, !377, !DIExpression(), !378)
    #dbg_declare(ptr %ret, !379, !DIExpression(), !380)
  store i32 0, ptr %ret, align 4, !dbg !380
  %0 = load ptr, ptr %p.addr, align 4, !dbg !381
  %1 = load ptr, ptr %pk.addr, align 4, !dbg !382
  %2 = load ptr, ptr %sk.addr, align 4, !dbg !383
  %call = call i32 @mayo_keypair_compact(ptr noundef %0, ptr noundef %1, ptr noundef %2) #5, !dbg !384
  store i32 %call, ptr %ret, align 4, !dbg !385
  %3 = load i32, ptr %ret, align 4, !dbg !386
  %cmp = icmp ne i32 %3, 0, !dbg !388
  br i1 %cmp, label %if.then, label %if.end, !dbg !388

if.then:                                          ; preds = %entry
  br label %err, !dbg !389

if.end:                                           ; preds = %entry
  br label %err, !dbg !391

err:                                              ; preds = %if.end, %if.then
    #dbg_label(!392, !393)
  %4 = load i32, ptr %ret, align 4, !dbg !394
  ret i32 %4, !dbg !395
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @mayo_keypair_compact(ptr noundef %p, ptr noundef %cpk, ptr noundef %csk) #0 !dbg !396 {
entry:
  %p.addr = alloca ptr, align 4
  %cpk.addr = alloca ptr, align 4
  %csk.addr = alloca ptr, align 4
  %ret = alloca i32, align 4
  %seed_sk = alloca ptr, align 4
  %S = alloca [868 x i8], align 1
  %P = alloca [113103 x i64], align 8
  %P3 = alloca [2601 x i64], align 8
  %seed_pk = alloca ptr, align 4
  %O = alloca [2414 x i8], align 1
  %m_vec_limbs = alloca i32, align 4
  %param_m = alloca i32, align 4
  %param_v = alloca i32, align 4
  %param_o = alloca i32, align 4
  %param_O_bytes = alloca i32, align 4
  %param_P1_limbs = alloca i32, align 4
  %param_P3_limbs = alloca i32, align 4
  %param_pk_seed_bytes = alloca i32, align 4
  %param_sk_seed_bytes = alloca i32, align 4
  %P1 = alloca ptr, align 4
  %P2 = alloca ptr, align 4
  %P3_upper = alloca [1377 x i64], align 8
  store ptr %p, ptr %p.addr, align 4
    #dbg_declare(ptr %p.addr, !397, !DIExpression(), !398)
  store ptr %cpk, ptr %cpk.addr, align 4
    #dbg_declare(ptr %cpk.addr, !399, !DIExpression(), !400)
  store ptr %csk, ptr %csk.addr, align 4
    #dbg_declare(ptr %csk.addr, !401, !DIExpression(), !402)
    #dbg_declare(ptr %ret, !403, !DIExpression(), !404)
  store i32 0, ptr %ret, align 4, !dbg !404
    #dbg_declare(ptr %seed_sk, !405, !DIExpression(), !406)
  %0 = load ptr, ptr %csk.addr, align 4, !dbg !407
  store ptr %0, ptr %seed_sk, align 4, !dbg !406
    #dbg_declare(ptr %S, !408, !DIExpression(), !412)
    #dbg_declare(ptr %P, !413, !DIExpression(), !414)
    #dbg_declare(ptr %P3, !415, !DIExpression(), !419)
  call void @llvm.memset.p0.i32(ptr align 8 %P3, i8 0, i32 20808, i1 false), !dbg !419
    #dbg_declare(ptr %seed_pk, !420, !DIExpression(), !421)
    #dbg_declare(ptr %O, !422, !DIExpression(), !424)
    #dbg_declare(ptr %m_vec_limbs, !425, !DIExpression(), !427)
  %1 = load ptr, ptr %p.addr, align 4, !dbg !428
  %m_vec_limbs1 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %1, i32 0, i32 21, !dbg !428
  %2 = load i32, ptr %m_vec_limbs1, align 4, !dbg !428
  store i32 %2, ptr %m_vec_limbs, align 4, !dbg !427
    #dbg_declare(ptr %param_m, !429, !DIExpression(), !430)
  %3 = load ptr, ptr %p.addr, align 4, !dbg !431
  %m = getelementptr inbounds nuw %struct.mayo_params_t, ptr %3, i32 0, i32 0, !dbg !431
  %4 = load i32, ptr %m, align 4, !dbg !431
  store i32 %4, ptr %param_m, align 4, !dbg !430
    #dbg_declare(ptr %param_v, !432, !DIExpression(), !433)
  %5 = load ptr, ptr %p.addr, align 4, !dbg !434
  %n = getelementptr inbounds nuw %struct.mayo_params_t, ptr %5, i32 0, i32 1, !dbg !434
  %6 = load i32, ptr %n, align 4, !dbg !434
  %7 = load ptr, ptr %p.addr, align 4, !dbg !434
  %o = getelementptr inbounds nuw %struct.mayo_params_t, ptr %7, i32 0, i32 2, !dbg !434
  %8 = load i32, ptr %o, align 4, !dbg !434
  %sub = sub nsw i32 %6, %8, !dbg !434
  store i32 %sub, ptr %param_v, align 4, !dbg !433
    #dbg_declare(ptr %param_o, !435, !DIExpression(), !436)
  %9 = load ptr, ptr %p.addr, align 4, !dbg !437
  %o2 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %9, i32 0, i32 2, !dbg !437
  %10 = load i32, ptr %o2, align 4, !dbg !437
  store i32 %10, ptr %param_o, align 4, !dbg !436
    #dbg_declare(ptr %param_O_bytes, !438, !DIExpression(), !439)
  %11 = load ptr, ptr %p.addr, align 4, !dbg !440
  %O_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %11, i32 0, i32 7, !dbg !440
  %12 = load i32, ptr %O_bytes, align 4, !dbg !440
  store i32 %12, ptr %param_O_bytes, align 4, !dbg !439
    #dbg_declare(ptr %param_P1_limbs, !441, !DIExpression(), !442)
  %13 = load ptr, ptr %p.addr, align 4, !dbg !443
  %n3 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %13, i32 0, i32 1, !dbg !443
  %14 = load i32, ptr %n3, align 4, !dbg !443
  %15 = load ptr, ptr %p.addr, align 4, !dbg !443
  %o4 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %15, i32 0, i32 2, !dbg !443
  %16 = load i32, ptr %o4, align 4, !dbg !443
  %sub5 = sub nsw i32 %14, %16, !dbg !443
  %17 = load ptr, ptr %p.addr, align 4, !dbg !443
  %n6 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %17, i32 0, i32 1, !dbg !443
  %18 = load i32, ptr %n6, align 4, !dbg !443
  %19 = load ptr, ptr %p.addr, align 4, !dbg !443
  %o7 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %19, i32 0, i32 2, !dbg !443
  %20 = load i32, ptr %o7, align 4, !dbg !443
  %sub8 = sub nsw i32 %18, %20, !dbg !443
  %add = add nsw i32 %sub8, 1, !dbg !443
  %mul = mul nsw i32 %sub5, %add, !dbg !443
  %div = sdiv i32 %mul, 2, !dbg !443
  %21 = load ptr, ptr %p.addr, align 4, !dbg !443
  %m_vec_limbs9 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %21, i32 0, i32 21, !dbg !443
  %22 = load i32, ptr %m_vec_limbs9, align 4, !dbg !443
  %mul10 = mul nsw i32 %div, %22, !dbg !443
  store i32 %mul10, ptr %param_P1_limbs, align 4, !dbg !442
    #dbg_declare(ptr %param_P3_limbs, !444, !DIExpression(), !445)
  %23 = load ptr, ptr %p.addr, align 4, !dbg !446
  %o11 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %23, i32 0, i32 2, !dbg !446
  %24 = load i32, ptr %o11, align 4, !dbg !446
  %25 = load ptr, ptr %p.addr, align 4, !dbg !446
  %o12 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %25, i32 0, i32 2, !dbg !446
  %26 = load i32, ptr %o12, align 4, !dbg !446
  %add13 = add nsw i32 %26, 1, !dbg !446
  %mul14 = mul nsw i32 %24, %add13, !dbg !446
  %div15 = sdiv i32 %mul14, 2, !dbg !446
  %27 = load ptr, ptr %p.addr, align 4, !dbg !446
  %m_vec_limbs16 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %27, i32 0, i32 21, !dbg !446
  %28 = load i32, ptr %m_vec_limbs16, align 4, !dbg !446
  %mul17 = mul nsw i32 %div15, %28, !dbg !446
  store i32 %mul17, ptr %param_P3_limbs, align 4, !dbg !445
    #dbg_declare(ptr %param_pk_seed_bytes, !447, !DIExpression(), !448)
  %29 = load ptr, ptr %p.addr, align 4, !dbg !449
  %pk_seed_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %29, i32 0, i32 20, !dbg !449
  %30 = load i32, ptr %pk_seed_bytes, align 4, !dbg !449
  store i32 %30, ptr %param_pk_seed_bytes, align 4, !dbg !448
    #dbg_declare(ptr %param_sk_seed_bytes, !450, !DIExpression(), !451)
  %31 = load ptr, ptr %p.addr, align 4, !dbg !452
  %sk_seed_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %31, i32 0, i32 18, !dbg !452
  %32 = load i32, ptr %sk_seed_bytes, align 4, !dbg !452
  store i32 %32, ptr %param_sk_seed_bytes, align 4, !dbg !451
    #dbg_declare(ptr %P1, !453, !DIExpression(), !454)
  %arraydecay = getelementptr inbounds [113103 x i64], ptr %P, i32 0, i32 0, !dbg !455
  store ptr %arraydecay, ptr %P1, align 4, !dbg !454
    #dbg_declare(ptr %P2, !456, !DIExpression(), !457)
  %arraydecay18 = getelementptr inbounds [113103 x i64], ptr %P, i32 0, i32 0, !dbg !458
  %33 = load i32, ptr %param_P1_limbs, align 4, !dbg !459
  %add.ptr = getelementptr inbounds i64, ptr %arraydecay18, i32 %33, !dbg !460
  store ptr %add.ptr, ptr %P2, align 4, !dbg !457
  %34 = load ptr, ptr %seed_sk, align 4, !dbg !461
  %35 = load i32, ptr %param_sk_seed_bytes, align 4, !dbg !463
  %call = call i32 @randombytes(ptr noundef %34, i32 noundef %35) #5, !dbg !464
  %cmp = icmp ne i32 %call, 0, !dbg !465
  br i1 %cmp, label %if.then, label %if.end, !dbg !465

if.then:                                          ; preds = %entry
  store i32 1, ptr %ret, align 4, !dbg !466
  br label %err, !dbg !468

if.end:                                           ; preds = %entry
  %arraydecay19 = getelementptr inbounds [868 x i8], ptr %S, i32 0, i32 0, !dbg !469
  %36 = load i32, ptr %param_pk_seed_bytes, align 4, !dbg !470
  %37 = load i32, ptr %param_O_bytes, align 4, !dbg !471
  %add20 = add nsw i32 %36, %37, !dbg !472
  %38 = load ptr, ptr %seed_sk, align 4, !dbg !473
  %39 = load i32, ptr %param_sk_seed_bytes, align 4, !dbg !474
  %call21 = call i32 @shake256(ptr noundef %arraydecay19, i32 noundef %add20, ptr noundef %38, i32 noundef %39) #5, !dbg !475
  %arraydecay22 = getelementptr inbounds [868 x i8], ptr %S, i32 0, i32 0, !dbg !476
  store ptr %arraydecay22, ptr %seed_pk, align 4, !dbg !477
  %arraydecay23 = getelementptr inbounds [868 x i8], ptr %S, i32 0, i32 0, !dbg !478
  %40 = load i32, ptr %param_pk_seed_bytes, align 4, !dbg !479
  %add.ptr24 = getelementptr inbounds i8, ptr %arraydecay23, i32 %40, !dbg !480
  %arraydecay25 = getelementptr inbounds [2414 x i8], ptr %O, i32 0, i32 0, !dbg !481
  %41 = load i32, ptr %param_v, align 4, !dbg !482
  %42 = load i32, ptr %param_o, align 4, !dbg !483
  %mul26 = mul nsw i32 %41, %42, !dbg !484
  call void @decode(ptr noundef %add.ptr24, ptr noundef %arraydecay25, i32 noundef %mul26) #5, !dbg !485
  %43 = load ptr, ptr %p.addr, align 4, !dbg !486
  %arraydecay27 = getelementptr inbounds [113103 x i64], ptr %P, i32 0, i32 0, !dbg !487
  %44 = load ptr, ptr %seed_pk, align 4, !dbg !488
  call void @expand_P1_P2(ptr noundef %43, ptr noundef %arraydecay27, ptr noundef %44) #5, !dbg !489
  %45 = load ptr, ptr %p.addr, align 4, !dbg !490
  %46 = load ptr, ptr %P1, align 4, !dbg !491
  %47 = load ptr, ptr %P2, align 4, !dbg !492
  %arraydecay28 = getelementptr inbounds [2414 x i8], ptr %O, i32 0, i32 0, !dbg !493
  %arraydecay29 = getelementptr inbounds [2601 x i64], ptr %P3, i32 0, i32 0, !dbg !494
  call void @compute_P3(ptr noundef %45, ptr noundef %46, ptr noundef %47, ptr noundef %arraydecay28, ptr noundef %arraydecay29) #5, !dbg !495
  %48 = load ptr, ptr %cpk.addr, align 4, !dbg !496
  %49 = load ptr, ptr %seed_pk, align 4, !dbg !497
  %50 = load i32, ptr %param_pk_seed_bytes, align 4, !dbg !498
  %call30 = call ptr @memcpy(ptr noundef %48, ptr noundef %49, i32 noundef %50) #5, !dbg !499
    #dbg_declare(ptr %P3_upper, !500, !DIExpression(), !504)
  %51 = load ptr, ptr %p.addr, align 4, !dbg !505
  %arraydecay31 = getelementptr inbounds [2601 x i64], ptr %P3, i32 0, i32 0, !dbg !506
  %arraydecay32 = getelementptr inbounds [1377 x i64], ptr %P3_upper, i32 0, i32 0, !dbg !507
  %52 = load i32, ptr %param_o, align 4, !dbg !508
  call void @m_upper(ptr noundef %51, ptr noundef %arraydecay31, ptr noundef %arraydecay32, i32 noundef %52) #5, !dbg !509
  %arraydecay33 = getelementptr inbounds [1377 x i64], ptr %P3_upper, i32 0, i32 0, !dbg !510
  %53 = load ptr, ptr %cpk.addr, align 4, !dbg !511
  %54 = load i32, ptr %param_pk_seed_bytes, align 4, !dbg !512
  %add.ptr34 = getelementptr inbounds i8, ptr %53, i32 %54, !dbg !513
  %55 = load i32, ptr %param_P3_limbs, align 4, !dbg !514
  %56 = load i32, ptr %m_vec_limbs, align 4, !dbg !515
  %div35 = sdiv i32 %55, %56, !dbg !516
  %57 = load i32, ptr %param_m, align 4, !dbg !517
  call void @pack_m_vecs(ptr noundef %arraydecay33, ptr noundef %add.ptr34, i32 noundef %div35, i32 noundef %57) #5, !dbg !518
  br label %err, !dbg !518

err:                                              ; preds = %if.end, %if.then
    #dbg_label(!519, !520)
  %arraydecay36 = getelementptr inbounds [2414 x i8], ptr %O, i32 0, i32 0, !dbg !521
  call void @mayo_secure_clear(ptr noundef %arraydecay36, i32 noundef 2414) #5, !dbg !522
  %58 = load ptr, ptr %P2, align 4, !dbg !523
  %59 = load ptr, ptr %p.addr, align 4, !dbg !524
  %n37 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %59, i32 0, i32 1, !dbg !524
  %60 = load i32, ptr %n37, align 4, !dbg !524
  %61 = load ptr, ptr %p.addr, align 4, !dbg !524
  %o38 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %61, i32 0, i32 2, !dbg !524
  %62 = load i32, ptr %o38, align 4, !dbg !524
  %sub39 = sub nsw i32 %60, %62, !dbg !524
  %63 = load ptr, ptr %p.addr, align 4, !dbg !524
  %o40 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %63, i32 0, i32 2, !dbg !524
  %64 = load i32, ptr %o40, align 4, !dbg !524
  %mul41 = mul nsw i32 %sub39, %64, !dbg !524
  %65 = load ptr, ptr %p.addr, align 4, !dbg !524
  %m_vec_limbs42 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %65, i32 0, i32 21, !dbg !524
  %66 = load i32, ptr %m_vec_limbs42, align 4, !dbg !524
  %mul43 = mul nsw i32 %mul41, %66, !dbg !524
  %mul44 = mul i32 %mul43, 8, !dbg !525
  call void @mayo_secure_clear(ptr noundef %58, i32 noundef %mul44) #5, !dbg !526
  %arraydecay45 = getelementptr inbounds [2601 x i64], ptr %P3, i32 0, i32 0, !dbg !527
  call void @mayo_secure_clear(ptr noundef %arraydecay45, i32 noundef 20808) #5, !dbg !528
  %67 = load i32, ptr %ret, align 4, !dbg !529
  ret i32 %67, !dbg !530
}

declare dso_local i32 @randombytes(ptr noundef, i32 noundef) #4

declare dso_local i32 @shake256(ptr noundef, i32 noundef, ptr noundef, i32 noundef) #4

; Function Attrs: noinline nounwind optnone
define internal void @decode(ptr noundef %m, ptr noundef %mdec, i32 noundef %mdeclen) #0 !dbg !531 {
entry:
  %m.addr = alloca ptr, align 4
  %mdec.addr = alloca ptr, align 4
  %mdeclen.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store ptr %m, ptr %m.addr, align 4
    #dbg_declare(ptr %m.addr, !534, !DIExpression(), !535)
  store ptr %mdec, ptr %mdec.addr, align 4
    #dbg_declare(ptr %mdec.addr, !536, !DIExpression(), !537)
  store i32 %mdeclen, ptr %mdeclen.addr, align 4
    #dbg_declare(ptr %mdeclen.addr, !538, !DIExpression(), !539)
    #dbg_declare(ptr %i, !540, !DIExpression(), !541)
  store i32 0, ptr %i, align 4, !dbg !542
  br label %for.cond, !dbg !544

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4, !dbg !545
  %1 = load i32, ptr %mdeclen.addr, align 4, !dbg !547
  %div = sdiv i32 %1, 2, !dbg !548
  %cmp = icmp slt i32 %0, %div, !dbg !549
  br i1 %cmp, label %for.body, label %for.end, !dbg !550

for.body:                                         ; preds = %for.cond
  %2 = load ptr, ptr %m.addr, align 4, !dbg !551
  %3 = load i32, ptr %i, align 4, !dbg !553
  %arrayidx = getelementptr inbounds i8, ptr %2, i32 %3, !dbg !551
  %4 = load i8, ptr %arrayidx, align 1, !dbg !551
  %conv = zext i8 %4 to i32, !dbg !551
  %and = and i32 %conv, 15, !dbg !554
  %conv1 = trunc i32 %and to i8, !dbg !551
  %5 = load ptr, ptr %mdec.addr, align 4, !dbg !555
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %5, i32 1, !dbg !555
  store ptr %incdec.ptr, ptr %mdec.addr, align 4, !dbg !555
  store i8 %conv1, ptr %5, align 1, !dbg !556
  %6 = load ptr, ptr %m.addr, align 4, !dbg !557
  %7 = load i32, ptr %i, align 4, !dbg !558
  %arrayidx2 = getelementptr inbounds i8, ptr %6, i32 %7, !dbg !557
  %8 = load i8, ptr %arrayidx2, align 1, !dbg !557
  %conv3 = zext i8 %8 to i32, !dbg !557
  %shr = ashr i32 %conv3, 4, !dbg !559
  %conv4 = trunc i32 %shr to i8, !dbg !557
  %9 = load ptr, ptr %mdec.addr, align 4, !dbg !560
  %incdec.ptr5 = getelementptr inbounds nuw i8, ptr %9, i32 1, !dbg !560
  store ptr %incdec.ptr5, ptr %mdec.addr, align 4, !dbg !560
  store i8 %conv4, ptr %9, align 1, !dbg !561
  br label %for.inc, !dbg !562

for.inc:                                          ; preds = %for.body
  %10 = load i32, ptr %i, align 4, !dbg !563
  %inc = add nsw i32 %10, 1, !dbg !563
  store i32 %inc, ptr %i, align 4, !dbg !563
  br label %for.cond, !dbg !564, !llvm.loop !565

for.end:                                          ; preds = %for.cond
  %11 = load i32, ptr %mdeclen.addr, align 4, !dbg !567
  %rem = srem i32 %11, 2, !dbg !569
  %cmp6 = icmp eq i32 %rem, 1, !dbg !570
  br i1 %cmp6, label %if.then, label %if.end, !dbg !570

if.then:                                          ; preds = %for.end
  %12 = load ptr, ptr %m.addr, align 4, !dbg !571
  %13 = load i32, ptr %i, align 4, !dbg !573
  %arrayidx8 = getelementptr inbounds i8, ptr %12, i32 %13, !dbg !571
  %14 = load i8, ptr %arrayidx8, align 1, !dbg !571
  %conv9 = zext i8 %14 to i32, !dbg !571
  %and10 = and i32 %conv9, 15, !dbg !574
  %conv11 = trunc i32 %and10 to i8, !dbg !571
  %15 = load ptr, ptr %mdec.addr, align 4, !dbg !575
  %incdec.ptr12 = getelementptr inbounds nuw i8, ptr %15, i32 1, !dbg !575
  store ptr %incdec.ptr12, ptr %mdec.addr, align 4, !dbg !575
  store i8 %conv11, ptr %15, align 1, !dbg !576
  br label %if.end, !dbg !577

if.end:                                           ; preds = %if.then, %for.end
  ret void, !dbg !578
}

; Function Attrs: noinline nounwind optnone
define internal void @expand_P1_P2(ptr noundef %p, ptr noundef %P, ptr noundef %seed_pk) #0 !dbg !579 {
entry:
  %p.addr = alloca ptr, align 4
  %P.addr = alloca ptr, align 4
  %seed_pk.addr = alloca ptr, align 4
  store ptr %p, ptr %p.addr, align 4
    #dbg_declare(ptr %p.addr, !582, !DIExpression(), !583)
  store ptr %P, ptr %P.addr, align 4
    #dbg_declare(ptr %P.addr, !584, !DIExpression(), !585)
  store ptr %seed_pk, ptr %seed_pk.addr, align 4
    #dbg_declare(ptr %seed_pk.addr, !586, !DIExpression(), !587)
  %0 = load ptr, ptr %P.addr, align 4, !dbg !588
  %1 = load ptr, ptr %p.addr, align 4, !dbg !589
  %P1_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %1, i32 0, i32 11, !dbg !589
  %2 = load i32, ptr %P1_bytes, align 4, !dbg !589
  %3 = load ptr, ptr %p.addr, align 4, !dbg !590
  %P2_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %3, i32 0, i32 12, !dbg !590
  %4 = load i32, ptr %P2_bytes, align 4, !dbg !590
  %add = add nsw i32 %2, %4, !dbg !591
  %5 = load ptr, ptr %seed_pk.addr, align 4, !dbg !592
  %6 = load ptr, ptr %p.addr, align 4, !dbg !593
  %pk_seed_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %6, i32 0, i32 20, !dbg !593
  %7 = load i32, ptr %pk_seed_bytes, align 4, !dbg !593
  %call = call i32 @AES_128_CTR(ptr noundef %0, i32 noundef %add, ptr noundef %5, i32 noundef %7) #5, !dbg !594
  %8 = load ptr, ptr %P.addr, align 4, !dbg !595
  %9 = load ptr, ptr %P.addr, align 4, !dbg !596
  %10 = load ptr, ptr %p.addr, align 4, !dbg !597
  %n = getelementptr inbounds nuw %struct.mayo_params_t, ptr %10, i32 0, i32 1, !dbg !597
  %11 = load i32, ptr %n, align 4, !dbg !597
  %12 = load ptr, ptr %p.addr, align 4, !dbg !597
  %o = getelementptr inbounds nuw %struct.mayo_params_t, ptr %12, i32 0, i32 2, !dbg !597
  %13 = load i32, ptr %o, align 4, !dbg !597
  %sub = sub nsw i32 %11, %13, !dbg !597
  %14 = load ptr, ptr %p.addr, align 4, !dbg !597
  %n1 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %14, i32 0, i32 1, !dbg !597
  %15 = load i32, ptr %n1, align 4, !dbg !597
  %16 = load ptr, ptr %p.addr, align 4, !dbg !597
  %o2 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %16, i32 0, i32 2, !dbg !597
  %17 = load i32, ptr %o2, align 4, !dbg !597
  %sub3 = sub nsw i32 %15, %17, !dbg !597
  %add4 = add nsw i32 %sub3, 1, !dbg !597
  %mul = mul nsw i32 %sub, %add4, !dbg !597
  %div = sdiv i32 %mul, 2, !dbg !597
  %18 = load ptr, ptr %p.addr, align 4, !dbg !597
  %m_vec_limbs = getelementptr inbounds nuw %struct.mayo_params_t, ptr %18, i32 0, i32 21, !dbg !597
  %19 = load i32, ptr %m_vec_limbs, align 4, !dbg !597
  %mul5 = mul nsw i32 %div, %19, !dbg !597
  %20 = load ptr, ptr %p.addr, align 4, !dbg !598
  %n6 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %20, i32 0, i32 1, !dbg !598
  %21 = load i32, ptr %n6, align 4, !dbg !598
  %22 = load ptr, ptr %p.addr, align 4, !dbg !598
  %o7 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %22, i32 0, i32 2, !dbg !598
  %23 = load i32, ptr %o7, align 4, !dbg !598
  %sub8 = sub nsw i32 %21, %23, !dbg !598
  %24 = load ptr, ptr %p.addr, align 4, !dbg !598
  %o9 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %24, i32 0, i32 2, !dbg !598
  %25 = load i32, ptr %o9, align 4, !dbg !598
  %mul10 = mul nsw i32 %sub8, %25, !dbg !598
  %26 = load ptr, ptr %p.addr, align 4, !dbg !598
  %m_vec_limbs11 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %26, i32 0, i32 21, !dbg !598
  %27 = load i32, ptr %m_vec_limbs11, align 4, !dbg !598
  %mul12 = mul nsw i32 %mul10, %27, !dbg !598
  %add13 = add nsw i32 %mul5, %mul12, !dbg !599
  %28 = load ptr, ptr %p.addr, align 4, !dbg !600
  %m_vec_limbs14 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %28, i32 0, i32 21, !dbg !600
  %29 = load i32, ptr %m_vec_limbs14, align 4, !dbg !600
  %div15 = sdiv i32 %add13, %29, !dbg !601
  %30 = load ptr, ptr %p.addr, align 4, !dbg !602
  %m = getelementptr inbounds nuw %struct.mayo_params_t, ptr %30, i32 0, i32 0, !dbg !602
  %31 = load i32, ptr %m, align 4, !dbg !602
  call void @unpack_m_vecs(ptr noundef %8, ptr noundef %9, i32 noundef %div15, i32 noundef %31) #5, !dbg !603
  ret void, !dbg !604
}

; Function Attrs: noinline nounwind optnone
define internal void @compute_P3(ptr noundef %p, ptr noundef %P1, ptr noundef %P2, ptr noundef %O, ptr noundef %P3) #0 !dbg !605 {
entry:
  %p.addr = alloca ptr, align 4
  %P1.addr = alloca ptr, align 4
  %P2.addr = alloca ptr, align 4
  %O.addr = alloca ptr, align 4
  %P3.addr = alloca ptr, align 4
  %m_vec_limbs = alloca i32, align 4
  %param_v = alloca i32, align 4
  %param_o = alloca i32, align 4
  store ptr %p, ptr %p.addr, align 4
    #dbg_declare(ptr %p.addr, !610, !DIExpression(), !611)
  store ptr %P1, ptr %P1.addr, align 4
    #dbg_declare(ptr %P1.addr, !612, !DIExpression(), !613)
  store ptr %P2, ptr %P2.addr, align 4
    #dbg_declare(ptr %P2.addr, !614, !DIExpression(), !615)
  store ptr %O, ptr %O.addr, align 4
    #dbg_declare(ptr %O.addr, !616, !DIExpression(), !617)
  store ptr %P3, ptr %P3.addr, align 4
    #dbg_declare(ptr %P3.addr, !618, !DIExpression(), !619)
    #dbg_declare(ptr %m_vec_limbs, !620, !DIExpression(), !621)
  %0 = load ptr, ptr %p.addr, align 4, !dbg !622
  %m_vec_limbs1 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %0, i32 0, i32 21, !dbg !622
  %1 = load i32, ptr %m_vec_limbs1, align 4, !dbg !622
  store i32 %1, ptr %m_vec_limbs, align 4, !dbg !621
    #dbg_declare(ptr %param_v, !623, !DIExpression(), !624)
  %2 = load ptr, ptr %p.addr, align 4, !dbg !625
  %n = getelementptr inbounds nuw %struct.mayo_params_t, ptr %2, i32 0, i32 1, !dbg !625
  %3 = load i32, ptr %n, align 4, !dbg !625
  %4 = load ptr, ptr %p.addr, align 4, !dbg !625
  %o = getelementptr inbounds nuw %struct.mayo_params_t, ptr %4, i32 0, i32 2, !dbg !625
  %5 = load i32, ptr %o, align 4, !dbg !625
  %sub = sub nsw i32 %3, %5, !dbg !625
  store i32 %sub, ptr %param_v, align 4, !dbg !624
    #dbg_declare(ptr %param_o, !626, !DIExpression(), !627)
  %6 = load ptr, ptr %p.addr, align 4, !dbg !628
  %o2 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %6, i32 0, i32 2, !dbg !628
  %7 = load i32, ptr %o2, align 4, !dbg !628
  store i32 %7, ptr %param_o, align 4, !dbg !627
  %8 = load ptr, ptr %p.addr, align 4, !dbg !629
  %9 = load ptr, ptr %P1.addr, align 4, !dbg !630
  %10 = load ptr, ptr %O.addr, align 4, !dbg !631
  %11 = load ptr, ptr %P2.addr, align 4, !dbg !632
  call void @P1_times_O(ptr noundef %8, ptr noundef %9, ptr noundef %10, ptr noundef %11) #5, !dbg !633
  %12 = load i32, ptr %m_vec_limbs, align 4, !dbg !634
  %13 = load ptr, ptr %O.addr, align 4, !dbg !635
  %14 = load ptr, ptr %P2.addr, align 4, !dbg !636
  %15 = load ptr, ptr %P3.addr, align 4, !dbg !637
  %16 = load i32, ptr %param_v, align 4, !dbg !638
  %17 = load i32, ptr %param_o, align 4, !dbg !639
  %18 = load i32, ptr %param_o, align 4, !dbg !640
  call void @mul_add_mat_trans_x_m_mat(i32 noundef %12, ptr noundef %13, ptr noundef %14, ptr noundef %15, i32 noundef %16, i32 noundef %17, i32 noundef %18) #5, !dbg !641
  ret void, !dbg !642
}

declare dso_local ptr @memcpy(ptr noundef, ptr noundef, i32 noundef) #4

; Function Attrs: noinline nounwind optnone
define internal void @pack_m_vecs(ptr noundef %in, ptr noundef %out, i32 noundef %vecs, i32 noundef %m) #0 !dbg !643 {
entry:
  %in.addr = alloca ptr, align 4
  %out.addr = alloca ptr, align 4
  %vecs.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %m_vec_limbs = alloca i32, align 4
  %_in = alloca ptr, align 4
  %i = alloca i32, align 4
  store ptr %in, ptr %in.addr, align 4
    #dbg_declare(ptr %in.addr, !646, !DIExpression(), !647)
  store ptr %out, ptr %out.addr, align 4
    #dbg_declare(ptr %out.addr, !648, !DIExpression(), !649)
  store i32 %vecs, ptr %vecs.addr, align 4
    #dbg_declare(ptr %vecs.addr, !650, !DIExpression(), !651)
  store i32 %m, ptr %m.addr, align 4
    #dbg_declare(ptr %m.addr, !652, !DIExpression(), !653)
    #dbg_declare(ptr %m_vec_limbs, !654, !DIExpression(), !655)
  %0 = load i32, ptr %m.addr, align 4, !dbg !656
  %add = add nsw i32 %0, 15, !dbg !657
  %div = sdiv i32 %add, 16, !dbg !658
  store i32 %div, ptr %m_vec_limbs, align 4, !dbg !655
    #dbg_declare(ptr %_in, !659, !DIExpression(), !660)
  %1 = load ptr, ptr %in.addr, align 4, !dbg !661
  store ptr %1, ptr %_in, align 4, !dbg !660
    #dbg_declare(ptr %i, !662, !DIExpression(), !664)
  store i32 0, ptr %i, align 4, !dbg !664
  br label %for.cond, !dbg !665

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, ptr %i, align 4, !dbg !666
  %3 = load i32, ptr %vecs.addr, align 4, !dbg !668
  %cmp = icmp slt i32 %2, %3, !dbg !669
  br i1 %cmp, label %for.body, label %for.end, !dbg !670

for.body:                                         ; preds = %for.cond
  %4 = load ptr, ptr %out.addr, align 4, !dbg !671
  %5 = load i32, ptr %i, align 4, !dbg !673
  %6 = load i32, ptr %m.addr, align 4, !dbg !674
  %mul = mul nsw i32 %5, %6, !dbg !675
  %div1 = sdiv i32 %mul, 2, !dbg !676
  %add.ptr = getelementptr inbounds i8, ptr %4, i32 %div1, !dbg !677
  %7 = load ptr, ptr %_in, align 4, !dbg !678
  %8 = load i32, ptr %i, align 4, !dbg !679
  %9 = load i32, ptr %m_vec_limbs, align 4, !dbg !680
  %mul2 = mul nsw i32 %8, %9, !dbg !681
  %mul3 = mul i32 %mul2, 8, !dbg !682
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %7, i32 %mul3, !dbg !683
  %10 = load i32, ptr %m.addr, align 4, !dbg !684
  %div5 = sdiv i32 %10, 2, !dbg !685
  %call = call ptr @memmove(ptr noundef %add.ptr, ptr noundef %add.ptr4, i32 noundef %div5) #5, !dbg !686
  br label %for.inc, !dbg !687

for.inc:                                          ; preds = %for.body
  %11 = load i32, ptr %i, align 4, !dbg !688
  %inc = add nsw i32 %11, 1, !dbg !688
  store i32 %inc, ptr %i, align 4, !dbg !688
  br label %for.cond, !dbg !689, !llvm.loop !690

for.end:                                          ; preds = %for.cond
  ret void, !dbg !692
}

declare dso_local void @mayo_secure_clear(ptr noundef, i32 noundef) #4

declare dso_local ptr @memmove(ptr noundef, ptr noundef, i32 noundef) #4

; Function Attrs: noinline nounwind optnone
define internal void @P1_times_O(ptr noundef %p, ptr noundef %P1, ptr noundef %O, ptr noundef %acc) #0 !dbg !693 {
entry:
  %p.addr = alloca ptr, align 4
  %P1.addr = alloca ptr, align 4
  %O.addr = alloca ptr, align 4
  %acc.addr = alloca ptr, align 4
  store ptr %p, ptr %p.addr, align 4
    #dbg_declare(ptr %p.addr, !696, !DIExpression(), !697)
  store ptr %P1, ptr %P1.addr, align 4
    #dbg_declare(ptr %P1.addr, !698, !DIExpression(), !699)
  store ptr %O, ptr %O.addr, align 4
    #dbg_declare(ptr %O.addr, !700, !DIExpression(), !701)
  store ptr %acc, ptr %acc.addr, align 4
    #dbg_declare(ptr %acc.addr, !702, !DIExpression(), !703)
  %0 = load ptr, ptr %p.addr, align 4, !dbg !704
  %m_vec_limbs = getelementptr inbounds nuw %struct.mayo_params_t, ptr %0, i32 0, i32 21, !dbg !704
  %1 = load i32, ptr %m_vec_limbs, align 4, !dbg !704
  %2 = load ptr, ptr %P1.addr, align 4, !dbg !705
  %3 = load ptr, ptr %O.addr, align 4, !dbg !706
  %4 = load ptr, ptr %acc.addr, align 4, !dbg !707
  %5 = load ptr, ptr %p.addr, align 4, !dbg !708
  %n = getelementptr inbounds nuw %struct.mayo_params_t, ptr %5, i32 0, i32 1, !dbg !708
  %6 = load i32, ptr %n, align 4, !dbg !708
  %7 = load ptr, ptr %p.addr, align 4, !dbg !708
  %o = getelementptr inbounds nuw %struct.mayo_params_t, ptr %7, i32 0, i32 2, !dbg !708
  %8 = load i32, ptr %o, align 4, !dbg !708
  %sub = sub nsw i32 %6, %8, !dbg !708
  %9 = load ptr, ptr %p.addr, align 4, !dbg !709
  %n1 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %9, i32 0, i32 1, !dbg !709
  %10 = load i32, ptr %n1, align 4, !dbg !709
  %11 = load ptr, ptr %p.addr, align 4, !dbg !709
  %o2 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %11, i32 0, i32 2, !dbg !709
  %12 = load i32, ptr %o2, align 4, !dbg !709
  %sub3 = sub nsw i32 %10, %12, !dbg !709
  %13 = load ptr, ptr %p.addr, align 4, !dbg !710
  %o4 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %13, i32 0, i32 2, !dbg !710
  %14 = load i32, ptr %o4, align 4, !dbg !710
  call void @mul_add_m_upper_triangular_mat_x_mat(i32 noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, i32 noundef %sub, i32 noundef %sub3, i32 noundef %14, i32 noundef 1) #5, !dbg !711
  ret void, !dbg !712
}

; Function Attrs: noinline nounwind optnone
define internal void @mul_add_mat_trans_x_m_mat(i32 noundef %m_vec_limbs, ptr noundef %mat, ptr noundef %bs_mat, ptr noundef %acc, i32 noundef %mat_rows, i32 noundef %mat_cols, i32 noundef %bs_mat_cols) #0 !dbg !713 {
entry:
  %m_vec_limbs.addr = alloca i32, align 4
  %mat.addr = alloca ptr, align 4
  %bs_mat.addr = alloca ptr, align 4
  %acc.addr = alloca ptr, align 4
  %mat_rows.addr = alloca i32, align 4
  %mat_cols.addr = alloca i32, align 4
  %bs_mat_cols.addr = alloca i32, align 4
  %r = alloca i32, align 4
  %c = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %m_vec_limbs, ptr %m_vec_limbs.addr, align 4
    #dbg_declare(ptr %m_vec_limbs.addr, !716, !DIExpression(), !717)
  store ptr %mat, ptr %mat.addr, align 4
    #dbg_declare(ptr %mat.addr, !718, !DIExpression(), !719)
  store ptr %bs_mat, ptr %bs_mat.addr, align 4
    #dbg_declare(ptr %bs_mat.addr, !720, !DIExpression(), !721)
  store ptr %acc, ptr %acc.addr, align 4
    #dbg_declare(ptr %acc.addr, !722, !DIExpression(), !723)
  store i32 %mat_rows, ptr %mat_rows.addr, align 4
    #dbg_declare(ptr %mat_rows.addr, !724, !DIExpression(), !725)
  store i32 %mat_cols, ptr %mat_cols.addr, align 4
    #dbg_declare(ptr %mat_cols.addr, !726, !DIExpression(), !727)
  store i32 %bs_mat_cols, ptr %bs_mat_cols.addr, align 4
    #dbg_declare(ptr %bs_mat_cols.addr, !728, !DIExpression(), !729)
    #dbg_declare(ptr %r, !730, !DIExpression(), !732)
  store i32 0, ptr %r, align 4, !dbg !732
  br label %for.cond, !dbg !733

for.cond:                                         ; preds = %for.inc17, %entry
  %0 = load i32, ptr %r, align 4, !dbg !734
  %1 = load i32, ptr %mat_cols.addr, align 4, !dbg !736
  %cmp = icmp slt i32 %0, %1, !dbg !737
  br i1 %cmp, label %for.body, label %for.end19, !dbg !738

for.body:                                         ; preds = %for.cond
    #dbg_declare(ptr %c, !739, !DIExpression(), !742)
  store i32 0, ptr %c, align 4, !dbg !742
  br label %for.cond1, !dbg !743

for.cond1:                                        ; preds = %for.inc15, %for.body
  %2 = load i32, ptr %c, align 4, !dbg !744
  %3 = load i32, ptr %mat_rows.addr, align 4, !dbg !746
  %cmp2 = icmp slt i32 %2, %3, !dbg !747
  br i1 %cmp2, label %for.body3, label %for.end16, !dbg !748

for.body3:                                        ; preds = %for.cond1
    #dbg_declare(ptr %k, !749, !DIExpression(), !752)
  store i32 0, ptr %k, align 4, !dbg !752
  br label %for.cond4, !dbg !753

for.cond4:                                        ; preds = %for.inc, %for.body3
  %4 = load i32, ptr %k, align 4, !dbg !754
  %5 = load i32, ptr %bs_mat_cols.addr, align 4, !dbg !756
  %cmp5 = icmp slt i32 %4, %5, !dbg !757
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !758

for.body6:                                        ; preds = %for.cond4
  %6 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !759
  %7 = load ptr, ptr %bs_mat.addr, align 4, !dbg !761
  %8 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !762
  %9 = load i32, ptr %c, align 4, !dbg !763
  %10 = load i32, ptr %bs_mat_cols.addr, align 4, !dbg !764
  %mul = mul nsw i32 %9, %10, !dbg !765
  %11 = load i32, ptr %k, align 4, !dbg !766
  %add = add nsw i32 %mul, %11, !dbg !767
  %mul7 = mul nsw i32 %8, %add, !dbg !768
  %add.ptr = getelementptr inbounds i64, ptr %7, i32 %mul7, !dbg !769
  %12 = load ptr, ptr %mat.addr, align 4, !dbg !770
  %13 = load i32, ptr %c, align 4, !dbg !771
  %14 = load i32, ptr %mat_cols.addr, align 4, !dbg !772
  %mul8 = mul nsw i32 %13, %14, !dbg !773
  %15 = load i32, ptr %r, align 4, !dbg !774
  %add9 = add nsw i32 %mul8, %15, !dbg !775
  %arrayidx = getelementptr inbounds i8, ptr %12, i32 %add9, !dbg !770
  %16 = load i8, ptr %arrayidx, align 1, !dbg !770
  %17 = load ptr, ptr %acc.addr, align 4, !dbg !776
  %18 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !777
  %19 = load i32, ptr %r, align 4, !dbg !778
  %20 = load i32, ptr %bs_mat_cols.addr, align 4, !dbg !779
  %mul10 = mul nsw i32 %19, %20, !dbg !780
  %21 = load i32, ptr %k, align 4, !dbg !781
  %add11 = add nsw i32 %mul10, %21, !dbg !782
  %mul12 = mul nsw i32 %18, %add11, !dbg !783
  %add.ptr13 = getelementptr inbounds i64, ptr %17, i32 %mul12, !dbg !784
  call void @m_vec_mul_add(i32 noundef %6, ptr noundef %add.ptr, i8 noundef zeroext %16, ptr noundef %add.ptr13) #5, !dbg !785
  br label %for.inc, !dbg !786

for.inc:                                          ; preds = %for.body6
  %22 = load i32, ptr %k, align 4, !dbg !787
  %add14 = add nsw i32 %22, 1, !dbg !787
  store i32 %add14, ptr %k, align 4, !dbg !787
  br label %for.cond4, !dbg !788, !llvm.loop !789

for.end:                                          ; preds = %for.cond4
  br label %for.inc15, !dbg !791

for.inc15:                                        ; preds = %for.end
  %23 = load i32, ptr %c, align 4, !dbg !792
  %inc = add nsw i32 %23, 1, !dbg !792
  store i32 %inc, ptr %c, align 4, !dbg !792
  br label %for.cond1, !dbg !793, !llvm.loop !794

for.end16:                                        ; preds = %for.cond1
  br label %for.inc17, !dbg !796

for.inc17:                                        ; preds = %for.end16
  %24 = load i32, ptr %r, align 4, !dbg !797
  %inc18 = add nsw i32 %24, 1, !dbg !797
  store i32 %inc18, ptr %r, align 4, !dbg !797
  br label %for.cond, !dbg !798, !llvm.loop !799

for.end19:                                        ; preds = %for.cond
  ret void, !dbg !801
}

; Function Attrs: noinline nounwind optnone
define internal void @m_vec_mul_add(i32 noundef %m_vec_limbs, ptr noundef %in, i8 noundef zeroext %a, ptr noundef %acc) #0 !dbg !802 {
entry:
  %m_vec_limbs.addr = alloca i32, align 4
  %in.addr = alloca ptr, align 4
  %a.addr = alloca i8, align 1
  %acc.addr = alloca ptr, align 4
  %i = alloca i32, align 4
  store i32 %m_vec_limbs, ptr %m_vec_limbs.addr, align 4
    #dbg_declare(ptr %m_vec_limbs.addr, !806, !DIExpression(), !807)
  store ptr %in, ptr %in.addr, align 4
    #dbg_declare(ptr %in.addr, !808, !DIExpression(), !809)
  store i8 %a, ptr %a.addr, align 1
    #dbg_declare(ptr %a.addr, !810, !DIExpression(), !811)
  store ptr %acc, ptr %acc.addr, align 4
    #dbg_declare(ptr %acc.addr, !812, !DIExpression(), !813)
    #dbg_declare(ptr %i, !814, !DIExpression(), !816)
  store i32 0, ptr %i, align 4, !dbg !816
  br label %for.cond, !dbg !817

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4, !dbg !818
  %1 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !820
  %cmp = icmp slt i32 %0, %1, !dbg !821
  br i1 %cmp, label %for.body, label %for.end, !dbg !822

for.body:                                         ; preds = %for.cond
  %2 = load ptr, ptr %in.addr, align 4, !dbg !823
  %3 = load i32, ptr %i, align 4, !dbg !825
  %arrayidx = getelementptr inbounds i64, ptr %2, i32 %3, !dbg !823
  %4 = load i64, ptr %arrayidx, align 8, !dbg !823
  %5 = load i8, ptr %a.addr, align 1, !dbg !826
  %call = call i64 @gf16v_mul_u64(i64 noundef %4, i8 noundef zeroext %5) #5, !dbg !827
  %6 = load ptr, ptr %acc.addr, align 4, !dbg !828
  %7 = load i32, ptr %i, align 4, !dbg !829
  %arrayidx1 = getelementptr inbounds i64, ptr %6, i32 %7, !dbg !828
  %8 = load i64, ptr %arrayidx1, align 8, !dbg !830
  %xor = xor i64 %8, %call, !dbg !830
  store i64 %xor, ptr %arrayidx1, align 8, !dbg !830
  br label %for.inc, !dbg !831

for.inc:                                          ; preds = %for.body
  %9 = load i32, ptr %i, align 4, !dbg !832
  %inc = add nsw i32 %9, 1, !dbg !832
  store i32 %inc, ptr %i, align 4, !dbg !832
  br label %for.cond, !dbg !833, !llvm.loop !834

for.end:                                          ; preds = %for.cond
  ret void, !dbg !836
}

; Function Attrs: noinline nounwind optnone
define internal i64 @gf16v_mul_u64(i64 noundef %a, i8 noundef zeroext %b) #0 !dbg !837 {
entry:
  %a.addr = alloca i64, align 8
  %b.addr = alloca i8, align 1
  %mask_msb = alloca i64, align 8
  %a_msb = alloca i64, align 8
  %a64 = alloca i64, align 8
  %b32 = alloca i64, align 8
  %r64 = alloca i64, align 8
  store i64 %a, ptr %a.addr, align 8
    #dbg_declare(ptr %a.addr, !841, !DIExpression(), !842)
  store i8 %b, ptr %b.addr, align 1
    #dbg_declare(ptr %b.addr, !843, !DIExpression(), !844)
    #dbg_declare(ptr %mask_msb, !845, !DIExpression(), !846)
  store i64 -8608480567731124088, ptr %mask_msb, align 8, !dbg !846
    #dbg_declare(ptr %a_msb, !847, !DIExpression(), !848)
    #dbg_declare(ptr %a64, !849, !DIExpression(), !850)
  %0 = load i64, ptr %a.addr, align 8, !dbg !851
  store i64 %0, ptr %a64, align 8, !dbg !850
    #dbg_declare(ptr %b32, !852, !DIExpression(), !853)
  %1 = load i8, ptr %b.addr, align 1, !dbg !854
  %conv = zext i8 %1 to i32, !dbg !854
  %2 = load volatile i8, ptr @unsigned_char_blocker, align 1, !dbg !855
  %conv1 = zext i8 %2 to i32, !dbg !855
  %xor = xor i32 %conv, %conv1, !dbg !856
  %conv2 = sext i32 %xor to i64, !dbg !854
  store i64 %conv2, ptr %b32, align 8, !dbg !853
    #dbg_declare(ptr %r64, !857, !DIExpression(), !858)
  %3 = load i64, ptr %a64, align 8, !dbg !859
  %4 = load i64, ptr %b32, align 8, !dbg !860
  %and = and i64 %4, 1, !dbg !861
  %mul = mul i64 %3, %and, !dbg !862
  store i64 %mul, ptr %r64, align 8, !dbg !858
  %5 = load i64, ptr %a64, align 8, !dbg !863
  %6 = load i64, ptr %mask_msb, align 8, !dbg !864
  %and3 = and i64 %5, %6, !dbg !865
  store i64 %and3, ptr %a_msb, align 8, !dbg !866
  %7 = load i64, ptr %a_msb, align 8, !dbg !867
  %8 = load i64, ptr %a64, align 8, !dbg !868
  %xor4 = xor i64 %8, %7, !dbg !868
  store i64 %xor4, ptr %a64, align 8, !dbg !868
  %9 = load i64, ptr %a64, align 8, !dbg !869
  %shl = shl i64 %9, 1, !dbg !870
  %10 = load i64, ptr %a_msb, align 8, !dbg !871
  %shr = lshr i64 %10, 3, !dbg !872
  %mul5 = mul i64 %shr, 3, !dbg !873
  %xor6 = xor i64 %shl, %mul5, !dbg !874
  store i64 %xor6, ptr %a64, align 8, !dbg !875
  %11 = load i64, ptr %a64, align 8, !dbg !876
  %12 = load i64, ptr %b32, align 8, !dbg !877
  %shr7 = lshr i64 %12, 1, !dbg !878
  %and8 = and i64 %shr7, 1, !dbg !879
  %mul9 = mul i64 %11, %and8, !dbg !880
  %13 = load i64, ptr %r64, align 8, !dbg !881
  %xor10 = xor i64 %13, %mul9, !dbg !881
  store i64 %xor10, ptr %r64, align 8, !dbg !881
  %14 = load i64, ptr %a64, align 8, !dbg !882
  %15 = load i64, ptr %mask_msb, align 8, !dbg !883
  %and11 = and i64 %14, %15, !dbg !884
  store i64 %and11, ptr %a_msb, align 8, !dbg !885
  %16 = load i64, ptr %a_msb, align 8, !dbg !886
  %17 = load i64, ptr %a64, align 8, !dbg !887
  %xor12 = xor i64 %17, %16, !dbg !887
  store i64 %xor12, ptr %a64, align 8, !dbg !887
  %18 = load i64, ptr %a64, align 8, !dbg !888
  %shl13 = shl i64 %18, 1, !dbg !889
  %19 = load i64, ptr %a_msb, align 8, !dbg !890
  %shr14 = lshr i64 %19, 3, !dbg !891
  %mul15 = mul i64 %shr14, 3, !dbg !892
  %xor16 = xor i64 %shl13, %mul15, !dbg !893
  store i64 %xor16, ptr %a64, align 8, !dbg !894
  %20 = load i64, ptr %a64, align 8, !dbg !895
  %21 = load i64, ptr %b32, align 8, !dbg !896
  %shr17 = lshr i64 %21, 2, !dbg !897
  %and18 = and i64 %shr17, 1, !dbg !898
  %mul19 = mul i64 %20, %and18, !dbg !899
  %22 = load i64, ptr %r64, align 8, !dbg !900
  %xor20 = xor i64 %22, %mul19, !dbg !900
  store i64 %xor20, ptr %r64, align 8, !dbg !900
  %23 = load i64, ptr %a64, align 8, !dbg !901
  %24 = load i64, ptr %mask_msb, align 8, !dbg !902
  %and21 = and i64 %23, %24, !dbg !903
  store i64 %and21, ptr %a_msb, align 8, !dbg !904
  %25 = load i64, ptr %a_msb, align 8, !dbg !905
  %26 = load i64, ptr %a64, align 8, !dbg !906
  %xor22 = xor i64 %26, %25, !dbg !906
  store i64 %xor22, ptr %a64, align 8, !dbg !906
  %27 = load i64, ptr %a64, align 8, !dbg !907
  %shl23 = shl i64 %27, 1, !dbg !908
  %28 = load i64, ptr %a_msb, align 8, !dbg !909
  %shr24 = lshr i64 %28, 3, !dbg !910
  %mul25 = mul i64 %shr24, 3, !dbg !911
  %xor26 = xor i64 %shl23, %mul25, !dbg !912
  store i64 %xor26, ptr %a64, align 8, !dbg !913
  %29 = load i64, ptr %a64, align 8, !dbg !914
  %30 = load i64, ptr %b32, align 8, !dbg !915
  %shr27 = lshr i64 %30, 3, !dbg !916
  %and28 = and i64 %shr27, 1, !dbg !917
  %mul29 = mul i64 %29, %and28, !dbg !918
  %31 = load i64, ptr %r64, align 8, !dbg !919
  %xor30 = xor i64 %31, %mul29, !dbg !919
  store i64 %xor30, ptr %r64, align 8, !dbg !919
  %32 = load i64, ptr %r64, align 8, !dbg !920
  ret i64 %32, !dbg !921
}

; Function Attrs: noinline nounwind optnone
define internal void @mul_add_m_upper_triangular_mat_x_mat(i32 noundef %m_vec_limbs, ptr noundef %bs_mat, ptr noundef %mat, ptr noundef %acc, i32 noundef %bs_mat_rows, i32 noundef %bs_mat_cols, i32 noundef %mat_cols, i32 noundef %triangular) #0 !dbg !922 {
entry:
  %m_vec_limbs.addr = alloca i32, align 4
  %bs_mat.addr = alloca ptr, align 4
  %mat.addr = alloca ptr, align 4
  %acc.addr = alloca ptr, align 4
  %bs_mat_rows.addr = alloca i32, align 4
  %bs_mat_cols.addr = alloca i32, align 4
  %mat_cols.addr = alloca i32, align 4
  %triangular.addr = alloca i32, align 4
  %bs_mat_entries_used = alloca i32, align 4
  %r = alloca i32, align 4
  %c = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %m_vec_limbs, ptr %m_vec_limbs.addr, align 4
    #dbg_declare(ptr %m_vec_limbs.addr, !925, !DIExpression(), !926)
  store ptr %bs_mat, ptr %bs_mat.addr, align 4
    #dbg_declare(ptr %bs_mat.addr, !927, !DIExpression(), !928)
  store ptr %mat, ptr %mat.addr, align 4
    #dbg_declare(ptr %mat.addr, !929, !DIExpression(), !930)
  store ptr %acc, ptr %acc.addr, align 4
    #dbg_declare(ptr %acc.addr, !931, !DIExpression(), !932)
  store i32 %bs_mat_rows, ptr %bs_mat_rows.addr, align 4
    #dbg_declare(ptr %bs_mat_rows.addr, !933, !DIExpression(), !934)
  store i32 %bs_mat_cols, ptr %bs_mat_cols.addr, align 4
    #dbg_declare(ptr %bs_mat_cols.addr, !935, !DIExpression(), !936)
  store i32 %mat_cols, ptr %mat_cols.addr, align 4
    #dbg_declare(ptr %mat_cols.addr, !937, !DIExpression(), !938)
  store i32 %triangular, ptr %triangular.addr, align 4
    #dbg_declare(ptr %triangular.addr, !939, !DIExpression(), !940)
    #dbg_declare(ptr %bs_mat_entries_used, !941, !DIExpression(), !942)
  store i32 0, ptr %bs_mat_entries_used, align 4, !dbg !942
    #dbg_declare(ptr %r, !943, !DIExpression(), !945)
  store i32 0, ptr %r, align 4, !dbg !945
  br label %for.cond, !dbg !946

for.cond:                                         ; preds = %for.inc17, %entry
  %0 = load i32, ptr %r, align 4, !dbg !947
  %1 = load i32, ptr %bs_mat_rows.addr, align 4, !dbg !949
  %cmp = icmp slt i32 %0, %1, !dbg !950
  br i1 %cmp, label %for.body, label %for.end19, !dbg !951

for.body:                                         ; preds = %for.cond
    #dbg_declare(ptr %c, !952, !DIExpression(), !955)
  %2 = load i32, ptr %triangular.addr, align 4, !dbg !956
  %3 = load i32, ptr %r, align 4, !dbg !957
  %mul = mul nsw i32 %2, %3, !dbg !958
  store i32 %mul, ptr %c, align 4, !dbg !955
  br label %for.cond1, !dbg !959

for.cond1:                                        ; preds = %for.inc15, %for.body
  %4 = load i32, ptr %c, align 4, !dbg !960
  %5 = load i32, ptr %bs_mat_cols.addr, align 4, !dbg !962
  %cmp2 = icmp slt i32 %4, %5, !dbg !963
  br i1 %cmp2, label %for.body3, label %for.end16, !dbg !964

for.body3:                                        ; preds = %for.cond1
    #dbg_declare(ptr %k, !965, !DIExpression(), !968)
  store i32 0, ptr %k, align 4, !dbg !968
  br label %for.cond4, !dbg !969

for.cond4:                                        ; preds = %for.inc, %for.body3
  %6 = load i32, ptr %k, align 4, !dbg !970
  %7 = load i32, ptr %mat_cols.addr, align 4, !dbg !972
  %cmp5 = icmp slt i32 %6, %7, !dbg !973
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !974

for.body6:                                        ; preds = %for.cond4
  %8 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !975
  %9 = load ptr, ptr %bs_mat.addr, align 4, !dbg !977
  %10 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !978
  %11 = load i32, ptr %bs_mat_entries_used, align 4, !dbg !979
  %mul7 = mul nsw i32 %10, %11, !dbg !980
  %add.ptr = getelementptr inbounds i64, ptr %9, i32 %mul7, !dbg !981
  %12 = load ptr, ptr %mat.addr, align 4, !dbg !982
  %13 = load i32, ptr %c, align 4, !dbg !983
  %14 = load i32, ptr %mat_cols.addr, align 4, !dbg !984
  %mul8 = mul nsw i32 %13, %14, !dbg !985
  %15 = load i32, ptr %k, align 4, !dbg !986
  %add = add nsw i32 %mul8, %15, !dbg !987
  %arrayidx = getelementptr inbounds i8, ptr %12, i32 %add, !dbg !982
  %16 = load i8, ptr %arrayidx, align 1, !dbg !982
  %17 = load ptr, ptr %acc.addr, align 4, !dbg !988
  %18 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !989
  %19 = load i32, ptr %r, align 4, !dbg !990
  %20 = load i32, ptr %mat_cols.addr, align 4, !dbg !991
  %mul9 = mul nsw i32 %19, %20, !dbg !992
  %21 = load i32, ptr %k, align 4, !dbg !993
  %add10 = add nsw i32 %mul9, %21, !dbg !994
  %mul11 = mul nsw i32 %18, %add10, !dbg !995
  %add.ptr12 = getelementptr inbounds i64, ptr %17, i32 %mul11, !dbg !996
  call void @m_vec_mul_add(i32 noundef %8, ptr noundef %add.ptr, i8 noundef zeroext %16, ptr noundef %add.ptr12) #5, !dbg !997
  br label %for.inc, !dbg !998

for.inc:                                          ; preds = %for.body6
  %22 = load i32, ptr %k, align 4, !dbg !999
  %add13 = add nsw i32 %22, 1, !dbg !999
  store i32 %add13, ptr %k, align 4, !dbg !999
  br label %for.cond4, !dbg !1000, !llvm.loop !1001

for.end:                                          ; preds = %for.cond4
  %23 = load i32, ptr %bs_mat_entries_used, align 4, !dbg !1003
  %add14 = add nsw i32 %23, 1, !dbg !1003
  store i32 %add14, ptr %bs_mat_entries_used, align 4, !dbg !1003
  br label %for.inc15, !dbg !1004

for.inc15:                                        ; preds = %for.end
  %24 = load i32, ptr %c, align 4, !dbg !1005
  %inc = add nsw i32 %24, 1, !dbg !1005
  store i32 %inc, ptr %c, align 4, !dbg !1005
  br label %for.cond1, !dbg !1006, !llvm.loop !1007

for.end16:                                        ; preds = %for.cond1
  br label %for.inc17, !dbg !1009

for.inc17:                                        ; preds = %for.end16
  %25 = load i32, ptr %r, align 4, !dbg !1010
  %inc18 = add nsw i32 %25, 1, !dbg !1010
  store i32 %inc18, ptr %r, align 4, !dbg !1010
  br label %for.cond, !dbg !1011, !llvm.loop !1012

for.end19:                                        ; preds = %for.cond
  ret void, !dbg !1014
}

declare dso_local i32 @AES_128_CTR(ptr noundef, i32 noundef, ptr noundef, i32 noundef) #4

; Function Attrs: noinline nounwind optnone
define internal void @unpack_m_vecs(ptr noundef %in, ptr noundef %out, i32 noundef %vecs, i32 noundef %m) #0 !dbg !1015 {
entry:
  %in.addr = alloca ptr, align 4
  %out.addr = alloca ptr, align 4
  %vecs.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %m_vec_limbs = alloca i32, align 4
  %_out = alloca ptr, align 4
  %tmp = alloca [9 x i64], align 8
  %i = alloca i32, align 4
  store ptr %in, ptr %in.addr, align 4
    #dbg_declare(ptr %in.addr, !1018, !DIExpression(), !1019)
  store ptr %out, ptr %out.addr, align 4
    #dbg_declare(ptr %out.addr, !1020, !DIExpression(), !1021)
  store i32 %vecs, ptr %vecs.addr, align 4
    #dbg_declare(ptr %vecs.addr, !1022, !DIExpression(), !1023)
  store i32 %m, ptr %m.addr, align 4
    #dbg_declare(ptr %m.addr, !1024, !DIExpression(), !1025)
    #dbg_declare(ptr %m_vec_limbs, !1026, !DIExpression(), !1027)
  %0 = load i32, ptr %m.addr, align 4, !dbg !1028
  %add = add nsw i32 %0, 15, !dbg !1029
  %div = sdiv i32 %add, 16, !dbg !1030
  store i32 %div, ptr %m_vec_limbs, align 4, !dbg !1027
    #dbg_declare(ptr %_out, !1031, !DIExpression(), !1032)
  %1 = load ptr, ptr %out.addr, align 4, !dbg !1033
  store ptr %1, ptr %_out, align 4, !dbg !1032
    #dbg_declare(ptr %tmp, !1034, !DIExpression(), !1038)
  call void @llvm.memset.p0.i32(ptr align 8 %tmp, i8 0, i32 72, i1 false), !dbg !1038
    #dbg_declare(ptr %i, !1039, !DIExpression(), !1041)
  %2 = load i32, ptr %vecs.addr, align 4, !dbg !1042
  %sub = sub nsw i32 %2, 1, !dbg !1043
  store i32 %sub, ptr %i, align 4, !dbg !1041
  br label %for.cond, !dbg !1044

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i32, ptr %i, align 4, !dbg !1045
  %cmp = icmp sge i32 %3, 0, !dbg !1047
  br i1 %cmp, label %for.body, label %for.end, !dbg !1048

for.body:                                         ; preds = %for.cond
  %arraydecay = getelementptr inbounds [9 x i64], ptr %tmp, i32 0, i32 0, !dbg !1049
  %4 = load ptr, ptr %in.addr, align 4, !dbg !1051
  %5 = load i32, ptr %i, align 4, !dbg !1052
  %6 = load i32, ptr %m.addr, align 4, !dbg !1053
  %mul = mul nsw i32 %5, %6, !dbg !1054
  %div1 = sdiv i32 %mul, 2, !dbg !1055
  %add.ptr = getelementptr inbounds i8, ptr %4, i32 %div1, !dbg !1056
  %7 = load i32, ptr %m.addr, align 4, !dbg !1057
  %div2 = sdiv i32 %7, 2, !dbg !1058
  %call = call ptr @memcpy(ptr noundef %arraydecay, ptr noundef %add.ptr, i32 noundef %div2) #5, !dbg !1059
  %8 = load ptr, ptr %_out, align 4, !dbg !1060
  %9 = load i32, ptr %i, align 4, !dbg !1061
  %10 = load i32, ptr %m_vec_limbs, align 4, !dbg !1062
  %mul3 = mul nsw i32 %9, %10, !dbg !1063
  %mul4 = mul i32 %mul3, 8, !dbg !1064
  %add.ptr5 = getelementptr inbounds nuw i8, ptr %8, i32 %mul4, !dbg !1065
  %arraydecay6 = getelementptr inbounds [9 x i64], ptr %tmp, i32 0, i32 0, !dbg !1066
  %11 = load i32, ptr %m_vec_limbs, align 4, !dbg !1067
  %mul7 = mul i32 %11, 8, !dbg !1068
  %call8 = call ptr @memcpy(ptr noundef %add.ptr5, ptr noundef %arraydecay6, i32 noundef %mul7) #5, !dbg !1069
  br label %for.inc, !dbg !1070

for.inc:                                          ; preds = %for.body
  %12 = load i32, ptr %i, align 4, !dbg !1071
  %dec = add nsw i32 %12, -1, !dbg !1071
  store i32 %dec, ptr %i, align 4, !dbg !1071
  br label %for.cond, !dbg !1072, !llvm.loop !1073

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1075
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @mayo_expand_sk(ptr noundef %p, ptr noundef %csk, ptr noundef %sk) #0 !dbg !1076 {
entry:
  %p.addr = alloca ptr, align 4
  %csk.addr = alloca ptr, align 4
  %sk.addr = alloca ptr, align 4
  %ret = alloca i32, align 4
  %S = alloca [868 x i8], align 1
  %P = alloca ptr, align 4
  %O = alloca ptr, align 4
  %param_o = alloca i32, align 4
  %param_v = alloca i32, align 4
  %param_O_bytes = alloca i32, align 4
  %param_pk_seed_bytes = alloca i32, align 4
  %param_sk_seed_bytes = alloca i32, align 4
  %seed_sk = alloca ptr, align 4
  %seed_pk = alloca ptr, align 4
  %P2 = alloca ptr, align 4
  %P1 = alloca ptr, align 4
  %L = alloca ptr, align 4
  store ptr %p, ptr %p.addr, align 4
    #dbg_declare(ptr %p.addr, !1085, !DIExpression(), !1086)
  store ptr %csk, ptr %csk.addr, align 4
    #dbg_declare(ptr %csk.addr, !1087, !DIExpression(), !1088)
  store ptr %sk, ptr %sk.addr, align 4
    #dbg_declare(ptr %sk.addr, !1089, !DIExpression(), !1090)
    #dbg_declare(ptr %ret, !1091, !DIExpression(), !1092)
  store i32 0, ptr %ret, align 4, !dbg !1092
    #dbg_declare(ptr %S, !1093, !DIExpression(), !1094)
    #dbg_declare(ptr %P, !1095, !DIExpression(), !1096)
  %0 = load ptr, ptr %sk.addr, align 4, !dbg !1097
  %p1 = getelementptr inbounds nuw %struct.sk_t, ptr %0, i32 0, i32 0, !dbg !1098
  %arraydecay = getelementptr inbounds [113103 x i64], ptr %p1, i32 0, i32 0, !dbg !1097
  store ptr %arraydecay, ptr %P, align 4, !dbg !1096
    #dbg_declare(ptr %O, !1099, !DIExpression(), !1100)
  %1 = load ptr, ptr %sk.addr, align 4, !dbg !1101
  %O2 = getelementptr inbounds nuw %struct.sk_t, ptr %1, i32 0, i32 1, !dbg !1102
  %arraydecay3 = getelementptr inbounds [2414 x i8], ptr %O2, i32 0, i32 0, !dbg !1101
  store ptr %arraydecay3, ptr %O, align 4, !dbg !1100
    #dbg_declare(ptr %param_o, !1103, !DIExpression(), !1104)
  %2 = load ptr, ptr %p.addr, align 4, !dbg !1105
  %o = getelementptr inbounds nuw %struct.mayo_params_t, ptr %2, i32 0, i32 2, !dbg !1105
  %3 = load i32, ptr %o, align 4, !dbg !1105
  store i32 %3, ptr %param_o, align 4, !dbg !1104
    #dbg_declare(ptr %param_v, !1106, !DIExpression(), !1107)
  %4 = load ptr, ptr %p.addr, align 4, !dbg !1108
  %n = getelementptr inbounds nuw %struct.mayo_params_t, ptr %4, i32 0, i32 1, !dbg !1108
  %5 = load i32, ptr %n, align 4, !dbg !1108
  %6 = load ptr, ptr %p.addr, align 4, !dbg !1108
  %o4 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %6, i32 0, i32 2, !dbg !1108
  %7 = load i32, ptr %o4, align 4, !dbg !1108
  %sub = sub nsw i32 %5, %7, !dbg !1108
  store i32 %sub, ptr %param_v, align 4, !dbg !1107
    #dbg_declare(ptr %param_O_bytes, !1109, !DIExpression(), !1110)
  %8 = load ptr, ptr %p.addr, align 4, !dbg !1111
  %O_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %8, i32 0, i32 7, !dbg !1111
  %9 = load i32, ptr %O_bytes, align 4, !dbg !1111
  store i32 %9, ptr %param_O_bytes, align 4, !dbg !1110
    #dbg_declare(ptr %param_pk_seed_bytes, !1112, !DIExpression(), !1113)
  %10 = load ptr, ptr %p.addr, align 4, !dbg !1114
  %pk_seed_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %10, i32 0, i32 20, !dbg !1114
  %11 = load i32, ptr %pk_seed_bytes, align 4, !dbg !1114
  store i32 %11, ptr %param_pk_seed_bytes, align 4, !dbg !1113
    #dbg_declare(ptr %param_sk_seed_bytes, !1115, !DIExpression(), !1116)
  %12 = load ptr, ptr %p.addr, align 4, !dbg !1117
  %sk_seed_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %12, i32 0, i32 18, !dbg !1117
  %13 = load i32, ptr %sk_seed_bytes, align 4, !dbg !1117
  store i32 %13, ptr %param_sk_seed_bytes, align 4, !dbg !1116
    #dbg_declare(ptr %seed_sk, !1118, !DIExpression(), !1119)
  %14 = load ptr, ptr %csk.addr, align 4, !dbg !1120
  store ptr %14, ptr %seed_sk, align 4, !dbg !1119
    #dbg_declare(ptr %seed_pk, !1121, !DIExpression(), !1122)
  %arraydecay5 = getelementptr inbounds [868 x i8], ptr %S, i32 0, i32 0, !dbg !1123
  store ptr %arraydecay5, ptr %seed_pk, align 4, !dbg !1122
  %arraydecay6 = getelementptr inbounds [868 x i8], ptr %S, i32 0, i32 0, !dbg !1124
  %15 = load i32, ptr %param_pk_seed_bytes, align 4, !dbg !1125
  %16 = load i32, ptr %param_O_bytes, align 4, !dbg !1126
  %add = add nsw i32 %15, %16, !dbg !1127
  %17 = load ptr, ptr %seed_sk, align 4, !dbg !1128
  %18 = load i32, ptr %param_sk_seed_bytes, align 4, !dbg !1129
  %call = call i32 @shake256(ptr noundef %arraydecay6, i32 noundef %add, ptr noundef %17, i32 noundef %18) #5, !dbg !1130
  %arraydecay7 = getelementptr inbounds [868 x i8], ptr %S, i32 0, i32 0, !dbg !1131
  %19 = load i32, ptr %param_pk_seed_bytes, align 4, !dbg !1132
  %add.ptr = getelementptr inbounds i8, ptr %arraydecay7, i32 %19, !dbg !1133
  %20 = load ptr, ptr %O, align 4, !dbg !1134
  %21 = load i32, ptr %param_v, align 4, !dbg !1135
  %22 = load i32, ptr %param_o, align 4, !dbg !1136
  %mul = mul nsw i32 %21, %22, !dbg !1137
  call void @decode(ptr noundef %add.ptr, ptr noundef %20, i32 noundef %mul) #5, !dbg !1138
  %23 = load ptr, ptr %p.addr, align 4, !dbg !1139
  %24 = load ptr, ptr %P, align 4, !dbg !1140
  %25 = load ptr, ptr %seed_pk, align 4, !dbg !1141
  call void @expand_P1_P2(ptr noundef %23, ptr noundef %24, ptr noundef %25) #5, !dbg !1142
    #dbg_declare(ptr %P2, !1143, !DIExpression(), !1144)
  %26 = load ptr, ptr %P, align 4, !dbg !1145
  %27 = load ptr, ptr %p.addr, align 4, !dbg !1146
  %n8 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %27, i32 0, i32 1, !dbg !1146
  %28 = load i32, ptr %n8, align 4, !dbg !1146
  %29 = load ptr, ptr %p.addr, align 4, !dbg !1146
  %o9 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %29, i32 0, i32 2, !dbg !1146
  %30 = load i32, ptr %o9, align 4, !dbg !1146
  %sub10 = sub nsw i32 %28, %30, !dbg !1146
  %31 = load ptr, ptr %p.addr, align 4, !dbg !1146
  %n11 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %31, i32 0, i32 1, !dbg !1146
  %32 = load i32, ptr %n11, align 4, !dbg !1146
  %33 = load ptr, ptr %p.addr, align 4, !dbg !1146
  %o12 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %33, i32 0, i32 2, !dbg !1146
  %34 = load i32, ptr %o12, align 4, !dbg !1146
  %sub13 = sub nsw i32 %32, %34, !dbg !1146
  %add14 = add nsw i32 %sub13, 1, !dbg !1146
  %mul15 = mul nsw i32 %sub10, %add14, !dbg !1146
  %div = sdiv i32 %mul15, 2, !dbg !1146
  %35 = load ptr, ptr %p.addr, align 4, !dbg !1146
  %m_vec_limbs = getelementptr inbounds nuw %struct.mayo_params_t, ptr %35, i32 0, i32 21, !dbg !1146
  %36 = load i32, ptr %m_vec_limbs, align 4, !dbg !1146
  %mul16 = mul nsw i32 %div, %36, !dbg !1146
  %add.ptr17 = getelementptr inbounds i64, ptr %26, i32 %mul16, !dbg !1147
  store ptr %add.ptr17, ptr %P2, align 4, !dbg !1144
    #dbg_declare(ptr %P1, !1148, !DIExpression(), !1149)
  %37 = load ptr, ptr %P, align 4, !dbg !1150
  store ptr %37, ptr %P1, align 4, !dbg !1149
    #dbg_declare(ptr %L, !1151, !DIExpression(), !1152)
  %38 = load ptr, ptr %P2, align 4, !dbg !1153
  store ptr %38, ptr %L, align 4, !dbg !1152
  %39 = load ptr, ptr %p.addr, align 4, !dbg !1154
  %40 = load ptr, ptr %P1, align 4, !dbg !1155
  %41 = load ptr, ptr %O, align 4, !dbg !1156
  %42 = load ptr, ptr %L, align 4, !dbg !1157
  call void @P1P1t_times_O(ptr noundef %39, ptr noundef %40, ptr noundef %41, ptr noundef %42) #5, !dbg !1158
  %arraydecay18 = getelementptr inbounds [868 x i8], ptr %S, i32 0, i32 0, !dbg !1159
  call void @mayo_secure_clear(ptr noundef %arraydecay18, i32 noundef 868) #5, !dbg !1160
  %43 = load i32, ptr %ret, align 4, !dbg !1161
  ret i32 %43, !dbg !1162
}

; Function Attrs: noinline nounwind optnone
define internal void @P1P1t_times_O(ptr noundef %p, ptr noundef %P1, ptr noundef %O, ptr noundef %acc) #0 !dbg !1163 {
entry:
  %p.addr = alloca ptr, align 4
  %P1.addr = alloca ptr, align 4
  %O.addr = alloca ptr, align 4
  %acc.addr = alloca ptr, align 4
  %param_o = alloca i32, align 4
  %param_v = alloca i32, align 4
  %m_vec_limbs = alloca i32, align 4
  %bs_mat_entries_used = alloca i32, align 4
  %r = alloca i32, align 4
  %c = alloca i32, align 4
  %k = alloca i32, align 4
  store ptr %p, ptr %p.addr, align 4
    #dbg_declare(ptr %p.addr, !1164, !DIExpression(), !1165)
  store ptr %P1, ptr %P1.addr, align 4
    #dbg_declare(ptr %P1.addr, !1166, !DIExpression(), !1167)
  store ptr %O, ptr %O.addr, align 4
    #dbg_declare(ptr %O.addr, !1168, !DIExpression(), !1169)
  store ptr %acc, ptr %acc.addr, align 4
    #dbg_declare(ptr %acc.addr, !1170, !DIExpression(), !1171)
    #dbg_declare(ptr %param_o, !1172, !DIExpression(), !1173)
  %0 = load ptr, ptr %p.addr, align 4, !dbg !1174
  %o = getelementptr inbounds nuw %struct.mayo_params_t, ptr %0, i32 0, i32 2, !dbg !1174
  %1 = load i32, ptr %o, align 4, !dbg !1174
  store i32 %1, ptr %param_o, align 4, !dbg !1173
    #dbg_declare(ptr %param_v, !1175, !DIExpression(), !1176)
  %2 = load ptr, ptr %p.addr, align 4, !dbg !1177
  %n = getelementptr inbounds nuw %struct.mayo_params_t, ptr %2, i32 0, i32 1, !dbg !1177
  %3 = load i32, ptr %n, align 4, !dbg !1177
  %4 = load ptr, ptr %p.addr, align 4, !dbg !1177
  %o1 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %4, i32 0, i32 2, !dbg !1177
  %5 = load i32, ptr %o1, align 4, !dbg !1177
  %sub = sub nsw i32 %3, %5, !dbg !1177
  store i32 %sub, ptr %param_v, align 4, !dbg !1176
    #dbg_declare(ptr %m_vec_limbs, !1178, !DIExpression(), !1179)
  %6 = load ptr, ptr %p.addr, align 4, !dbg !1180
  %m_vec_limbs2 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %6, i32 0, i32 21, !dbg !1180
  %7 = load i32, ptr %m_vec_limbs2, align 4, !dbg !1180
  store i32 %7, ptr %m_vec_limbs, align 4, !dbg !1179
    #dbg_declare(ptr %bs_mat_entries_used, !1181, !DIExpression(), !1182)
  store i32 0, ptr %bs_mat_entries_used, align 4, !dbg !1182
    #dbg_declare(ptr %r, !1183, !DIExpression(), !1185)
  store i32 0, ptr %r, align 4, !dbg !1185
  br label %for.cond, !dbg !1186

for.cond:                                         ; preds = %for.inc29, %entry
  %8 = load i32, ptr %r, align 4, !dbg !1187
  %9 = load i32, ptr %param_v, align 4, !dbg !1189
  %cmp = icmp slt i32 %8, %9, !dbg !1190
  br i1 %cmp, label %for.body, label %for.end31, !dbg !1191

for.body:                                         ; preds = %for.cond
    #dbg_declare(ptr %c, !1192, !DIExpression(), !1195)
  %10 = load i32, ptr %r, align 4, !dbg !1196
  store i32 %10, ptr %c, align 4, !dbg !1195
  br label %for.cond3, !dbg !1197

for.cond3:                                        ; preds = %for.inc27, %for.body
  %11 = load i32, ptr %c, align 4, !dbg !1198
  %12 = load i32, ptr %param_v, align 4, !dbg !1200
  %cmp4 = icmp slt i32 %11, %12, !dbg !1201
  br i1 %cmp4, label %for.body5, label %for.end28, !dbg !1202

for.body5:                                        ; preds = %for.cond3
  %13 = load i32, ptr %c, align 4, !dbg !1203
  %14 = load i32, ptr %r, align 4, !dbg !1206
  %cmp6 = icmp eq i32 %13, %14, !dbg !1207
  br i1 %cmp6, label %if.then, label %if.end, !dbg !1207

if.then:                                          ; preds = %for.body5
  %15 = load i32, ptr %bs_mat_entries_used, align 4, !dbg !1208
  %add = add nsw i32 %15, 1, !dbg !1208
  store i32 %add, ptr %bs_mat_entries_used, align 4, !dbg !1208
  br label %for.inc27, !dbg !1210

if.end:                                           ; preds = %for.body5
    #dbg_declare(ptr %k, !1211, !DIExpression(), !1213)
  store i32 0, ptr %k, align 4, !dbg !1213
  br label %for.cond7, !dbg !1214

for.cond7:                                        ; preds = %for.inc, %if.end
  %16 = load i32, ptr %k, align 4, !dbg !1215
  %17 = load i32, ptr %param_o, align 4, !dbg !1217
  %cmp8 = icmp slt i32 %16, %17, !dbg !1218
  br i1 %cmp8, label %for.body9, label %for.end, !dbg !1219

for.body9:                                        ; preds = %for.cond7
  %18 = load i32, ptr %m_vec_limbs, align 4, !dbg !1220
  %19 = load ptr, ptr %P1.addr, align 4, !dbg !1222
  %20 = load i32, ptr %m_vec_limbs, align 4, !dbg !1223
  %21 = load i32, ptr %bs_mat_entries_used, align 4, !dbg !1224
  %mul = mul nsw i32 %20, %21, !dbg !1225
  %add.ptr = getelementptr inbounds i64, ptr %19, i32 %mul, !dbg !1226
  %22 = load ptr, ptr %O.addr, align 4, !dbg !1227
  %23 = load i32, ptr %c, align 4, !dbg !1228
  %24 = load i32, ptr %param_o, align 4, !dbg !1229
  %mul10 = mul nsw i32 %23, %24, !dbg !1230
  %25 = load i32, ptr %k, align 4, !dbg !1231
  %add11 = add nsw i32 %mul10, %25, !dbg !1232
  %arrayidx = getelementptr inbounds i8, ptr %22, i32 %add11, !dbg !1227
  %26 = load i8, ptr %arrayidx, align 1, !dbg !1227
  %27 = load ptr, ptr %acc.addr, align 4, !dbg !1233
  %28 = load i32, ptr %m_vec_limbs, align 4, !dbg !1234
  %29 = load i32, ptr %r, align 4, !dbg !1235
  %30 = load i32, ptr %param_o, align 4, !dbg !1236
  %mul12 = mul nsw i32 %29, %30, !dbg !1237
  %31 = load i32, ptr %k, align 4, !dbg !1238
  %add13 = add nsw i32 %mul12, %31, !dbg !1239
  %mul14 = mul nsw i32 %28, %add13, !dbg !1240
  %add.ptr15 = getelementptr inbounds i64, ptr %27, i32 %mul14, !dbg !1241
  call void @m_vec_mul_add(i32 noundef %18, ptr noundef %add.ptr, i8 noundef zeroext %26, ptr noundef %add.ptr15) #5, !dbg !1242
  %32 = load i32, ptr %m_vec_limbs, align 4, !dbg !1243
  %33 = load ptr, ptr %P1.addr, align 4, !dbg !1244
  %34 = load i32, ptr %m_vec_limbs, align 4, !dbg !1245
  %35 = load i32, ptr %bs_mat_entries_used, align 4, !dbg !1246
  %mul16 = mul nsw i32 %34, %35, !dbg !1247
  %add.ptr17 = getelementptr inbounds i64, ptr %33, i32 %mul16, !dbg !1248
  %36 = load ptr, ptr %O.addr, align 4, !dbg !1249
  %37 = load i32, ptr %r, align 4, !dbg !1250
  %38 = load i32, ptr %param_o, align 4, !dbg !1251
  %mul18 = mul nsw i32 %37, %38, !dbg !1252
  %39 = load i32, ptr %k, align 4, !dbg !1253
  %add19 = add nsw i32 %mul18, %39, !dbg !1254
  %arrayidx20 = getelementptr inbounds i8, ptr %36, i32 %add19, !dbg !1249
  %40 = load i8, ptr %arrayidx20, align 1, !dbg !1249
  %41 = load ptr, ptr %acc.addr, align 4, !dbg !1255
  %42 = load i32, ptr %m_vec_limbs, align 4, !dbg !1256
  %43 = load i32, ptr %c, align 4, !dbg !1257
  %44 = load i32, ptr %param_o, align 4, !dbg !1258
  %mul21 = mul nsw i32 %43, %44, !dbg !1259
  %45 = load i32, ptr %k, align 4, !dbg !1260
  %add22 = add nsw i32 %mul21, %45, !dbg !1261
  %mul23 = mul nsw i32 %42, %add22, !dbg !1262
  %add.ptr24 = getelementptr inbounds i64, ptr %41, i32 %mul23, !dbg !1263
  call void @m_vec_mul_add(i32 noundef %32, ptr noundef %add.ptr17, i8 noundef zeroext %40, ptr noundef %add.ptr24) #5, !dbg !1264
  br label %for.inc, !dbg !1265

for.inc:                                          ; preds = %for.body9
  %46 = load i32, ptr %k, align 4, !dbg !1266
  %add25 = add nsw i32 %46, 1, !dbg !1266
  store i32 %add25, ptr %k, align 4, !dbg !1266
  br label %for.cond7, !dbg !1267, !llvm.loop !1268

for.end:                                          ; preds = %for.cond7
  %47 = load i32, ptr %bs_mat_entries_used, align 4, !dbg !1270
  %add26 = add nsw i32 %47, 1, !dbg !1270
  store i32 %add26, ptr %bs_mat_entries_used, align 4, !dbg !1270
  br label %for.inc27, !dbg !1271

for.inc27:                                        ; preds = %for.end, %if.then
  %48 = load i32, ptr %c, align 4, !dbg !1272
  %inc = add nsw i32 %48, 1, !dbg !1272
  store i32 %inc, ptr %c, align 4, !dbg !1272
  br label %for.cond3, !dbg !1273, !llvm.loop !1274

for.end28:                                        ; preds = %for.cond3
  br label %for.inc29, !dbg !1276

for.inc29:                                        ; preds = %for.end28
  %49 = load i32, ptr %r, align 4, !dbg !1277
  %inc30 = add nsw i32 %49, 1, !dbg !1277
  store i32 %inc30, ptr %r, align 4, !dbg !1277
  br label %for.cond, !dbg !1278, !llvm.loop !1279

for.end31:                                        ; preds = %for.cond
  ret void, !dbg !1281
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @mayo_sign_signature(ptr noundef %p, ptr noundef %sig, ptr noundef %siglen, ptr noundef %m, i32 noundef %mlen, ptr noundef %csk) #0 !dbg !1282 {
entry:
  %p.addr = alloca ptr, align 4
  %sig.addr = alloca ptr, align 4
  %siglen.addr = alloca ptr, align 4
  %m.addr = alloca ptr, align 4
  %mlen.addr = alloca i32, align 4
  %csk.addr = alloca ptr, align 4
  %ret = alloca i32, align 4
  %tenc = alloca [71 x i8], align 1
  %t = alloca [142 x i8], align 1
  %y = alloca [142 x i8], align 1
  %salt = alloca [40 x i8], align 1
  %V = alloca [924 x i8], align 1
  %Vdec = alloca [1704 x i8], align 1
  %A = alloca [29520 x i8], align 1
  %x = alloca [1848 x i8], align 1
  %r = alloca [205 x i8], align 1
  %s = alloca [1848 x i8], align 1
  %seed_sk = alloca ptr, align 4
  %sk = alloca %struct.sk_t, align 32
  %Ox = alloca [142 x i8], align 1
  %tmp = alloca [145 x i8], align 1
  %ctrbyte = alloca ptr, align 4
  %vi = alloca ptr, align 4
  %param_m = alloca i32, align 4
  %param_n = alloca i32, align 4
  %param_o = alloca i32, align 4
  %param_k = alloca i32, align 4
  %param_v = alloca i32, align 4
  %param_m_bytes = alloca i32, align 4
  %param_v_bytes = alloca i32, align 4
  %param_r_bytes = alloca i32, align 4
  %param_sig_bytes = alloca i32, align 4
  %param_A_cols = alloca i32, align 4
  %param_digest_bytes = alloca i32, align 4
  %param_sk_seed_bytes = alloca i32, align 4
  %param_salt_bytes = alloca i32, align 4
  %P1 = alloca ptr, align 4
  %L = alloca ptr, align 4
  %Mtmp = alloca [1836 x i64], align 8
  %ctr = alloca i32, align 4
  %i = alloca i32, align 4
  %i75 = alloca i32, align 4
  %i107 = alloca i32, align 4
  store ptr %p, ptr %p.addr, align 4
    #dbg_declare(ptr %p.addr, !1286, !DIExpression(), !1287)
  store ptr %sig, ptr %sig.addr, align 4
    #dbg_declare(ptr %sig.addr, !1288, !DIExpression(), !1289)
  store ptr %siglen, ptr %siglen.addr, align 4
    #dbg_declare(ptr %siglen.addr, !1290, !DIExpression(), !1291)
  store ptr %m, ptr %m.addr, align 4
    #dbg_declare(ptr %m.addr, !1292, !DIExpression(), !1293)
  store i32 %mlen, ptr %mlen.addr, align 4
    #dbg_declare(ptr %mlen.addr, !1294, !DIExpression(), !1295)
  store ptr %csk, ptr %csk.addr, align 4
    #dbg_declare(ptr %csk.addr, !1296, !DIExpression(), !1297)
    #dbg_declare(ptr %ret, !1298, !DIExpression(), !1299)
  store i32 0, ptr %ret, align 4, !dbg !1299
    #dbg_declare(ptr %tenc, !1300, !DIExpression(), !1304)
    #dbg_declare(ptr %t, !1305, !DIExpression(), !1309)
    #dbg_declare(ptr %y, !1310, !DIExpression(), !1311)
    #dbg_declare(ptr %salt, !1312, !DIExpression(), !1316)
    #dbg_declare(ptr %V, !1317, !DIExpression(), !1321)
    #dbg_declare(ptr %Vdec, !1322, !DIExpression(), !1326)
    #dbg_declare(ptr %A, !1327, !DIExpression(), !1331)
  call void @llvm.memset.p0.i32(ptr align 1 %A, i8 0, i32 29520, i1 false), !dbg !1331
    #dbg_declare(ptr %x, !1332, !DIExpression(), !1336)
    #dbg_declare(ptr %r, !1337, !DIExpression(), !1341)
  call void @llvm.memset.p0.i32(ptr align 1 %r, i8 0, i32 205, i1 false), !dbg !1341
    #dbg_declare(ptr %s, !1342, !DIExpression(), !1343)
    #dbg_declare(ptr %seed_sk, !1344, !DIExpression(), !1345)
    #dbg_declare(ptr %sk, !1346, !DIExpression(), !1347)
    #dbg_declare(ptr %Ox, !1348, !DIExpression(), !1349)
    #dbg_declare(ptr %tmp, !1350, !DIExpression(), !1354)
    #dbg_declare(ptr %ctrbyte, !1355, !DIExpression(), !1356)
    #dbg_declare(ptr %vi, !1357, !DIExpression(), !1358)
    #dbg_declare(ptr %param_m, !1359, !DIExpression(), !1360)
  %0 = load ptr, ptr %p.addr, align 4, !dbg !1361
  %m1 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %0, i32 0, i32 0, !dbg !1361
  %1 = load i32, ptr %m1, align 4, !dbg !1361
  store i32 %1, ptr %param_m, align 4, !dbg !1360
    #dbg_declare(ptr %param_n, !1362, !DIExpression(), !1363)
  %2 = load ptr, ptr %p.addr, align 4, !dbg !1364
  %n = getelementptr inbounds nuw %struct.mayo_params_t, ptr %2, i32 0, i32 1, !dbg !1364
  %3 = load i32, ptr %n, align 4, !dbg !1364
  store i32 %3, ptr %param_n, align 4, !dbg !1363
    #dbg_declare(ptr %param_o, !1365, !DIExpression(), !1366)
  %4 = load ptr, ptr %p.addr, align 4, !dbg !1367
  %o = getelementptr inbounds nuw %struct.mayo_params_t, ptr %4, i32 0, i32 2, !dbg !1367
  %5 = load i32, ptr %o, align 4, !dbg !1367
  store i32 %5, ptr %param_o, align 4, !dbg !1366
    #dbg_declare(ptr %param_k, !1368, !DIExpression(), !1369)
  %6 = load ptr, ptr %p.addr, align 4, !dbg !1370
  %k = getelementptr inbounds nuw %struct.mayo_params_t, ptr %6, i32 0, i32 3, !dbg !1370
  %7 = load i32, ptr %k, align 4, !dbg !1370
  store i32 %7, ptr %param_k, align 4, !dbg !1369
    #dbg_declare(ptr %param_v, !1371, !DIExpression(), !1372)
  %8 = load ptr, ptr %p.addr, align 4, !dbg !1373
  %n2 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %8, i32 0, i32 1, !dbg !1373
  %9 = load i32, ptr %n2, align 4, !dbg !1373
  %10 = load ptr, ptr %p.addr, align 4, !dbg !1373
  %o3 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %10, i32 0, i32 2, !dbg !1373
  %11 = load i32, ptr %o3, align 4, !dbg !1373
  %sub = sub nsw i32 %9, %11, !dbg !1373
  store i32 %sub, ptr %param_v, align 4, !dbg !1372
    #dbg_declare(ptr %param_m_bytes, !1374, !DIExpression(), !1375)
  %12 = load ptr, ptr %p.addr, align 4, !dbg !1376
  %m_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %12, i32 0, i32 6, !dbg !1376
  %13 = load i32, ptr %m_bytes, align 4, !dbg !1376
  store i32 %13, ptr %param_m_bytes, align 4, !dbg !1375
    #dbg_declare(ptr %param_v_bytes, !1377, !DIExpression(), !1378)
  %14 = load ptr, ptr %p.addr, align 4, !dbg !1379
  %v_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %14, i32 0, i32 8, !dbg !1379
  %15 = load i32, ptr %v_bytes, align 4, !dbg !1379
  store i32 %15, ptr %param_v_bytes, align 4, !dbg !1378
    #dbg_declare(ptr %param_r_bytes, !1380, !DIExpression(), !1381)
  %16 = load ptr, ptr %p.addr, align 4, !dbg !1382
  %r_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %16, i32 0, i32 9, !dbg !1382
  %17 = load i32, ptr %r_bytes, align 4, !dbg !1382
  store i32 %17, ptr %param_r_bytes, align 4, !dbg !1381
    #dbg_declare(ptr %param_sig_bytes, !1383, !DIExpression(), !1384)
  %18 = load ptr, ptr %p.addr, align 4, !dbg !1385
  %sig_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %18, i32 0, i32 16, !dbg !1385
  %19 = load i32, ptr %sig_bytes, align 4, !dbg !1385
  store i32 %19, ptr %param_sig_bytes, align 4, !dbg !1384
    #dbg_declare(ptr %param_A_cols, !1386, !DIExpression(), !1387)
  %20 = load ptr, ptr %p.addr, align 4, !dbg !1388
  %k4 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %20, i32 0, i32 3, !dbg !1388
  %21 = load i32, ptr %k4, align 4, !dbg !1388
  %22 = load ptr, ptr %p.addr, align 4, !dbg !1388
  %o5 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %22, i32 0, i32 2, !dbg !1388
  %23 = load i32, ptr %o5, align 4, !dbg !1388
  %mul = mul nsw i32 %21, %23, !dbg !1388
  %add = add nsw i32 %mul, 1, !dbg !1388
  store i32 %add, ptr %param_A_cols, align 4, !dbg !1387
    #dbg_declare(ptr %param_digest_bytes, !1389, !DIExpression(), !1390)
  %24 = load ptr, ptr %p.addr, align 4, !dbg !1391
  %digest_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %24, i32 0, i32 19, !dbg !1391
  %25 = load i32, ptr %digest_bytes, align 4, !dbg !1391
  store i32 %25, ptr %param_digest_bytes, align 4, !dbg !1390
    #dbg_declare(ptr %param_sk_seed_bytes, !1392, !DIExpression(), !1393)
  %26 = load ptr, ptr %p.addr, align 4, !dbg !1394
  %sk_seed_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %26, i32 0, i32 18, !dbg !1394
  %27 = load i32, ptr %sk_seed_bytes, align 4, !dbg !1394
  store i32 %27, ptr %param_sk_seed_bytes, align 4, !dbg !1393
    #dbg_declare(ptr %param_salt_bytes, !1395, !DIExpression(), !1396)
  %28 = load ptr, ptr %p.addr, align 4, !dbg !1397
  %salt_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %28, i32 0, i32 17, !dbg !1397
  %29 = load i32, ptr %salt_bytes, align 4, !dbg !1397
  store i32 %29, ptr %param_salt_bytes, align 4, !dbg !1396
  %30 = load ptr, ptr %p.addr, align 4, !dbg !1398
  %31 = load ptr, ptr %csk.addr, align 4, !dbg !1399
  %call = call i32 @mayo_expand_sk(ptr noundef %30, ptr noundef %31, ptr noundef %sk) #5, !dbg !1400
  store i32 %call, ptr %ret, align 4, !dbg !1401
  %32 = load i32, ptr %ret, align 4, !dbg !1402
  %cmp = icmp ne i32 %32, 0, !dbg !1404
  br i1 %cmp, label %if.then, label %if.end, !dbg !1404

if.then:                                          ; preds = %entry
  br label %err, !dbg !1405

if.end:                                           ; preds = %entry
  %33 = load ptr, ptr %csk.addr, align 4, !dbg !1407
  store ptr %33, ptr %seed_sk, align 4, !dbg !1408
  %arraydecay = getelementptr inbounds [145 x i8], ptr %tmp, i32 0, i32 0, !dbg !1409
  %34 = load i32, ptr %param_digest_bytes, align 4, !dbg !1410
  %35 = load ptr, ptr %m.addr, align 4, !dbg !1411
  %36 = load i32, ptr %mlen.addr, align 4, !dbg !1412
  %call6 = call i32 @shake256(ptr noundef %arraydecay, i32 noundef %34, ptr noundef %35, i32 noundef %36) #5, !dbg !1413
    #dbg_declare(ptr %P1, !1414, !DIExpression(), !1415)
  %p7 = getelementptr inbounds nuw %struct.sk_t, ptr %sk, i32 0, i32 0, !dbg !1416
  %arraydecay8 = getelementptr inbounds [113103 x i64], ptr %p7, i32 0, i32 0, !dbg !1417
  store ptr %arraydecay8, ptr %P1, align 4, !dbg !1415
    #dbg_declare(ptr %L, !1418, !DIExpression(), !1419)
  %37 = load ptr, ptr %P1, align 4, !dbg !1420
  %38 = load ptr, ptr %p.addr, align 4, !dbg !1421
  %n9 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %38, i32 0, i32 1, !dbg !1421
  %39 = load i32, ptr %n9, align 4, !dbg !1421
  %40 = load ptr, ptr %p.addr, align 4, !dbg !1421
  %o10 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %40, i32 0, i32 2, !dbg !1421
  %41 = load i32, ptr %o10, align 4, !dbg !1421
  %sub11 = sub nsw i32 %39, %41, !dbg !1421
  %42 = load ptr, ptr %p.addr, align 4, !dbg !1421
  %n12 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %42, i32 0, i32 1, !dbg !1421
  %43 = load i32, ptr %n12, align 4, !dbg !1421
  %44 = load ptr, ptr %p.addr, align 4, !dbg !1421
  %o13 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %44, i32 0, i32 2, !dbg !1421
  %45 = load i32, ptr %o13, align 4, !dbg !1421
  %sub14 = sub nsw i32 %43, %45, !dbg !1421
  %add15 = add nsw i32 %sub14, 1, !dbg !1421
  %mul16 = mul nsw i32 %sub11, %add15, !dbg !1421
  %div = sdiv i32 %mul16, 2, !dbg !1421
  %46 = load ptr, ptr %p.addr, align 4, !dbg !1421
  %m_vec_limbs = getelementptr inbounds nuw %struct.mayo_params_t, ptr %46, i32 0, i32 21, !dbg !1421
  %47 = load i32, ptr %m_vec_limbs, align 4, !dbg !1421
  %mul17 = mul nsw i32 %div, %47, !dbg !1421
  %add.ptr = getelementptr inbounds i64, ptr %37, i32 %mul17, !dbg !1422
  store ptr %add.ptr, ptr %L, align 4, !dbg !1419
    #dbg_declare(ptr %Mtmp, !1423, !DIExpression(), !1427)
  call void @llvm.memset.p0.i32(ptr align 8 %Mtmp, i8 0, i32 14688, i1 false), !dbg !1427
  %arraydecay18 = getelementptr inbounds [145 x i8], ptr %tmp, i32 0, i32 0, !dbg !1428
  %48 = load i32, ptr %param_digest_bytes, align 4, !dbg !1430
  %add.ptr19 = getelementptr inbounds i8, ptr %arraydecay18, i32 %48, !dbg !1431
  %49 = load i32, ptr %param_salt_bytes, align 4, !dbg !1432
  %call20 = call i32 @randombytes(ptr noundef %add.ptr19, i32 noundef %49) #5, !dbg !1433
  %cmp21 = icmp ne i32 %call20, 0, !dbg !1434
  br i1 %cmp21, label %if.then22, label %if.end23, !dbg !1434

if.then22:                                        ; preds = %if.end
  store i32 1, ptr %ret, align 4, !dbg !1435
  br label %err, !dbg !1437

if.end23:                                         ; preds = %if.end
  %arraydecay24 = getelementptr inbounds [145 x i8], ptr %tmp, i32 0, i32 0, !dbg !1438
  %50 = load i32, ptr %param_digest_bytes, align 4, !dbg !1439
  %add.ptr25 = getelementptr inbounds i8, ptr %arraydecay24, i32 %50, !dbg !1440
  %51 = load i32, ptr %param_salt_bytes, align 4, !dbg !1441
  %add.ptr26 = getelementptr inbounds i8, ptr %add.ptr25, i32 %51, !dbg !1442
  %52 = load ptr, ptr %seed_sk, align 4, !dbg !1443
  %53 = load i32, ptr %param_sk_seed_bytes, align 4, !dbg !1444
  %call27 = call ptr @memcpy(ptr noundef %add.ptr26, ptr noundef %52, i32 noundef %53) #5, !dbg !1445
  %arraydecay28 = getelementptr inbounds [40 x i8], ptr %salt, i32 0, i32 0, !dbg !1446
  %54 = load i32, ptr %param_salt_bytes, align 4, !dbg !1447
  %arraydecay29 = getelementptr inbounds [145 x i8], ptr %tmp, i32 0, i32 0, !dbg !1448
  %55 = load i32, ptr %param_digest_bytes, align 4, !dbg !1449
  %56 = load i32, ptr %param_salt_bytes, align 4, !dbg !1450
  %add30 = add nsw i32 %55, %56, !dbg !1451
  %57 = load i32, ptr %param_sk_seed_bytes, align 4, !dbg !1452
  %add31 = add nsw i32 %add30, %57, !dbg !1453
  %call32 = call i32 @shake256(ptr noundef %arraydecay28, i32 noundef %54, ptr noundef %arraydecay29, i32 noundef %add31) #5, !dbg !1454
  %arraydecay33 = getelementptr inbounds [145 x i8], ptr %tmp, i32 0, i32 0, !dbg !1455
  %58 = load i32, ptr %param_digest_bytes, align 4, !dbg !1456
  %add.ptr34 = getelementptr inbounds i8, ptr %arraydecay33, i32 %58, !dbg !1457
  %arraydecay35 = getelementptr inbounds [40 x i8], ptr %salt, i32 0, i32 0, !dbg !1458
  %59 = load i32, ptr %param_salt_bytes, align 4, !dbg !1459
  %call36 = call ptr @memcpy(ptr noundef %add.ptr34, ptr noundef %arraydecay35, i32 noundef %59) #5, !dbg !1460
  %arraydecay37 = getelementptr inbounds [145 x i8], ptr %tmp, i32 0, i32 0, !dbg !1461
  %60 = load i32, ptr %param_digest_bytes, align 4, !dbg !1462
  %add.ptr38 = getelementptr inbounds i8, ptr %arraydecay37, i32 %60, !dbg !1463
  %61 = load i32, ptr %param_salt_bytes, align 4, !dbg !1464
  %add.ptr39 = getelementptr inbounds i8, ptr %add.ptr38, i32 %61, !dbg !1465
  %62 = load i32, ptr %param_sk_seed_bytes, align 4, !dbg !1466
  %add.ptr40 = getelementptr inbounds i8, ptr %add.ptr39, i32 %62, !dbg !1467
  store ptr %add.ptr40, ptr %ctrbyte, align 4, !dbg !1468
  %arraydecay41 = getelementptr inbounds [71 x i8], ptr %tenc, i32 0, i32 0, !dbg !1469
  %63 = load i32, ptr %param_m_bytes, align 4, !dbg !1470
  %arraydecay42 = getelementptr inbounds [145 x i8], ptr %tmp, i32 0, i32 0, !dbg !1471
  %64 = load i32, ptr %param_digest_bytes, align 4, !dbg !1472
  %65 = load i32, ptr %param_salt_bytes, align 4, !dbg !1473
  %add43 = add nsw i32 %64, %65, !dbg !1474
  %call44 = call i32 @shake256(ptr noundef %arraydecay41, i32 noundef %63, ptr noundef %arraydecay42, i32 noundef %add43) #5, !dbg !1475
  %arraydecay45 = getelementptr inbounds [71 x i8], ptr %tenc, i32 0, i32 0, !dbg !1476
  %arraydecay46 = getelementptr inbounds [142 x i8], ptr %t, i32 0, i32 0, !dbg !1477
  %66 = load i32, ptr %param_m, align 4, !dbg !1478
  call void @decode(ptr noundef %arraydecay45, ptr noundef %arraydecay46, i32 noundef %66) #5, !dbg !1479
    #dbg_declare(ptr %ctr, !1480, !DIExpression(), !1482)
  store i32 0, ptr %ctr, align 4, !dbg !1482
  br label %for.cond, !dbg !1483

for.cond:                                         ; preds = %for.inc104, %if.end23
  %67 = load i32, ptr %ctr, align 4, !dbg !1484
  %cmp47 = icmp sle i32 %67, 255, !dbg !1486
  br i1 %cmp47, label %for.body, label %for.end106, !dbg !1487

for.body:                                         ; preds = %for.cond
  %68 = load i32, ptr %ctr, align 4, !dbg !1488
  %conv = trunc i32 %68 to i8, !dbg !1490
  %69 = load ptr, ptr %ctrbyte, align 4, !dbg !1491
  store i8 %conv, ptr %69, align 1, !dbg !1492
  %arraydecay48 = getelementptr inbounds [924 x i8], ptr %V, i32 0, i32 0, !dbg !1493
  %70 = load i32, ptr %param_k, align 4, !dbg !1494
  %71 = load i32, ptr %param_v_bytes, align 4, !dbg !1495
  %mul49 = mul nsw i32 %70, %71, !dbg !1496
  %72 = load i32, ptr %param_r_bytes, align 4, !dbg !1497
  %add50 = add nsw i32 %mul49, %72, !dbg !1498
  %arraydecay51 = getelementptr inbounds [145 x i8], ptr %tmp, i32 0, i32 0, !dbg !1499
  %73 = load i32, ptr %param_digest_bytes, align 4, !dbg !1500
  %74 = load i32, ptr %param_salt_bytes, align 4, !dbg !1501
  %add52 = add nsw i32 %73, %74, !dbg !1502
  %75 = load i32, ptr %param_sk_seed_bytes, align 4, !dbg !1503
  %add53 = add nsw i32 %add52, %75, !dbg !1504
  %add54 = add nsw i32 %add53, 1, !dbg !1505
  %call55 = call i32 @shake256(ptr noundef %arraydecay48, i32 noundef %add50, ptr noundef %arraydecay51, i32 noundef %add54) #5, !dbg !1506
    #dbg_declare(ptr %i, !1507, !DIExpression(), !1509)
  store i32 0, ptr %i, align 4, !dbg !1509
  br label %for.cond56, !dbg !1510

for.cond56:                                       ; preds = %for.inc, %for.body
  %76 = load i32, ptr %i, align 4, !dbg !1511
  %77 = load i32, ptr %param_k, align 4, !dbg !1513
  %sub57 = sub nsw i32 %77, 1, !dbg !1514
  %cmp58 = icmp sle i32 %76, %sub57, !dbg !1515
  br i1 %cmp58, label %for.body60, label %for.end, !dbg !1516

for.body60:                                       ; preds = %for.cond56
  %arraydecay61 = getelementptr inbounds [924 x i8], ptr %V, i32 0, i32 0, !dbg !1517
  %78 = load i32, ptr %i, align 4, !dbg !1519
  %79 = load i32, ptr %param_v_bytes, align 4, !dbg !1520
  %mul62 = mul nsw i32 %78, %79, !dbg !1521
  %add.ptr63 = getelementptr inbounds i8, ptr %arraydecay61, i32 %mul62, !dbg !1522
  %arraydecay64 = getelementptr inbounds [1704 x i8], ptr %Vdec, i32 0, i32 0, !dbg !1523
  %80 = load i32, ptr %i, align 4, !dbg !1524
  %81 = load i32, ptr %param_v, align 4, !dbg !1525
  %mul65 = mul nsw i32 %80, %81, !dbg !1526
  %add.ptr66 = getelementptr inbounds i8, ptr %arraydecay64, i32 %mul65, !dbg !1527
  %82 = load i32, ptr %param_v, align 4, !dbg !1528
  call void @decode(ptr noundef %add.ptr63, ptr noundef %add.ptr66, i32 noundef %82) #5, !dbg !1529
  br label %for.inc, !dbg !1530

for.inc:                                          ; preds = %for.body60
  %83 = load i32, ptr %i, align 4, !dbg !1531
  %inc = add nsw i32 %83, 1, !dbg !1531
  store i32 %inc, ptr %i, align 4, !dbg !1531
  br label %for.cond56, !dbg !1532, !llvm.loop !1533

for.end:                                          ; preds = %for.cond56
  %84 = load ptr, ptr %p.addr, align 4, !dbg !1535
  %arraydecay67 = getelementptr inbounds [1704 x i8], ptr %Vdec, i32 0, i32 0, !dbg !1536
  %85 = load ptr, ptr %L, align 4, !dbg !1537
  %86 = load ptr, ptr %P1, align 4, !dbg !1538
  %arraydecay68 = getelementptr inbounds [1836 x i64], ptr %Mtmp, i32 0, i32 0, !dbg !1539
  %arraydecay69 = getelementptr inbounds [29520 x i8], ptr %A, i32 0, i32 0, !dbg !1540
  call void @compute_M_and_VPV(ptr noundef %84, ptr noundef %arraydecay67, ptr noundef %85, ptr noundef %86, ptr noundef %arraydecay68, ptr noundef %arraydecay69) #5, !dbg !1541
  %87 = load ptr, ptr %p.addr, align 4, !dbg !1542
  %arraydecay70 = getelementptr inbounds [29520 x i8], ptr %A, i32 0, i32 0, !dbg !1543
  %arraydecay71 = getelementptr inbounds [142 x i8], ptr %t, i32 0, i32 0, !dbg !1544
  %arraydecay72 = getelementptr inbounds [142 x i8], ptr %y, i32 0, i32 0, !dbg !1545
  call void @compute_rhs(ptr noundef %87, ptr noundef %arraydecay70, ptr noundef %arraydecay71, ptr noundef %arraydecay72) #5, !dbg !1546
  %88 = load ptr, ptr %p.addr, align 4, !dbg !1547
  %arraydecay73 = getelementptr inbounds [1836 x i64], ptr %Mtmp, i32 0, i32 0, !dbg !1548
  %arraydecay74 = getelementptr inbounds [29520 x i8], ptr %A, i32 0, i32 0, !dbg !1549
  call void @compute_A(ptr noundef %88, ptr noundef %arraydecay73, ptr noundef %arraydecay74) #5, !dbg !1550
    #dbg_declare(ptr %i75, !1551, !DIExpression(), !1553)
  store i32 0, ptr %i75, align 4, !dbg !1553
  br label %for.cond76, !dbg !1554

for.cond76:                                       ; preds = %for.inc85, %for.end
  %89 = load i32, ptr %i75, align 4, !dbg !1555
  %90 = load i32, ptr %param_m, align 4, !dbg !1557
  %cmp77 = icmp slt i32 %89, %90, !dbg !1558
  br i1 %cmp77, label %for.body79, label %for.end87, !dbg !1559

for.body79:                                       ; preds = %for.cond76
  %91 = load i32, ptr %i75, align 4, !dbg !1560
  %add80 = add nsw i32 1, %91, !dbg !1562
  %92 = load i32, ptr %param_k, align 4, !dbg !1563
  %93 = load i32, ptr %param_o, align 4, !dbg !1564
  %mul81 = mul nsw i32 %92, %93, !dbg !1565
  %add82 = add nsw i32 %mul81, 1, !dbg !1566
  %mul83 = mul nsw i32 %add80, %add82, !dbg !1567
  %sub84 = sub nsw i32 %mul83, 1, !dbg !1568
  %arrayidx = getelementptr inbounds [29520 x i8], ptr %A, i32 0, i32 %sub84, !dbg !1569
  store i8 0, ptr %arrayidx, align 1, !dbg !1570
  br label %for.inc85, !dbg !1571

for.inc85:                                        ; preds = %for.body79
  %94 = load i32, ptr %i75, align 4, !dbg !1572
  %inc86 = add nsw i32 %94, 1, !dbg !1572
  store i32 %inc86, ptr %i75, align 4, !dbg !1572
  br label %for.cond76, !dbg !1573, !llvm.loop !1574

for.end87:                                        ; preds = %for.cond76
  %arraydecay88 = getelementptr inbounds [924 x i8], ptr %V, i32 0, i32 0, !dbg !1576
  %95 = load i32, ptr %param_k, align 4, !dbg !1577
  %96 = load i32, ptr %param_v_bytes, align 4, !dbg !1578
  %mul89 = mul nsw i32 %95, %96, !dbg !1579
  %add.ptr90 = getelementptr inbounds i8, ptr %arraydecay88, i32 %mul89, !dbg !1580
  %arraydecay91 = getelementptr inbounds [205 x i8], ptr %r, i32 0, i32 0, !dbg !1581
  %97 = load i32, ptr %param_k, align 4, !dbg !1582
  %98 = load i32, ptr %param_o, align 4, !dbg !1583
  %mul92 = mul nsw i32 %97, %98, !dbg !1584
  call void @decode(ptr noundef %add.ptr90, ptr noundef %arraydecay91, i32 noundef %mul92) #5, !dbg !1585
  %99 = load ptr, ptr %p.addr, align 4, !dbg !1586
  %arraydecay93 = getelementptr inbounds [29520 x i8], ptr %A, i32 0, i32 0, !dbg !1588
  %arraydecay94 = getelementptr inbounds [142 x i8], ptr %y, i32 0, i32 0, !dbg !1589
  %arraydecay95 = getelementptr inbounds [205 x i8], ptr %r, i32 0, i32 0, !dbg !1590
  %arraydecay96 = getelementptr inbounds [1848 x i8], ptr %x, i32 0, i32 0, !dbg !1591
  %100 = load i32, ptr %param_k, align 4, !dbg !1592
  %101 = load i32, ptr %param_o, align 4, !dbg !1593
  %102 = load i32, ptr %param_m, align 4, !dbg !1594
  %103 = load i32, ptr %param_A_cols, align 4, !dbg !1595
  %call97 = call i32 @sample_solution(ptr noundef %99, ptr noundef %arraydecay93, ptr noundef %arraydecay94, ptr noundef %arraydecay95, ptr noundef %arraydecay96, i32 noundef %100, i32 noundef %101, i32 noundef %102, i32 noundef %103) #5, !dbg !1596
  %tobool = icmp ne i32 %call97, 0, !dbg !1596
  br i1 %tobool, label %if.then98, label %if.else, !dbg !1596

if.then98:                                        ; preds = %for.end87
  br label %for.end106, !dbg !1597

if.else:                                          ; preds = %for.end87
  %arraydecay99 = getelementptr inbounds [1836 x i64], ptr %Mtmp, i32 0, i32 0, !dbg !1599
  %call100 = call ptr @memset(ptr noundef %arraydecay99, i32 noundef 0, i32 noundef 14688) #5, !dbg !1601
  %arraydecay101 = getelementptr inbounds [29520 x i8], ptr %A, i32 0, i32 0, !dbg !1602
  %call102 = call ptr @memset(ptr noundef %arraydecay101, i32 noundef 0, i32 noundef 29520) #5, !dbg !1603
  br label %if.end103

if.end103:                                        ; preds = %if.else
  br label %for.inc104, !dbg !1604

for.inc104:                                       ; preds = %if.end103
  %104 = load i32, ptr %ctr, align 4, !dbg !1605
  %inc105 = add nsw i32 %104, 1, !dbg !1605
  store i32 %inc105, ptr %ctr, align 4, !dbg !1605
  br label %for.cond, !dbg !1606, !llvm.loop !1607

for.end106:                                       ; preds = %if.then98, %for.cond
    #dbg_declare(ptr %i107, !1609, !DIExpression(), !1611)
  store i32 0, ptr %i107, align 4, !dbg !1611
  br label %for.cond108, !dbg !1612

for.cond108:                                      ; preds = %for.inc137, %for.end106
  %105 = load i32, ptr %i107, align 4, !dbg !1613
  %106 = load i32, ptr %param_k, align 4, !dbg !1615
  %sub109 = sub nsw i32 %106, 1, !dbg !1616
  %cmp110 = icmp sle i32 %105, %sub109, !dbg !1617
  br i1 %cmp110, label %for.body112, label %for.end139, !dbg !1618

for.body112:                                      ; preds = %for.cond108
  %arraydecay113 = getelementptr inbounds [1704 x i8], ptr %Vdec, i32 0, i32 0, !dbg !1619
  %107 = load i32, ptr %i107, align 4, !dbg !1621
  %108 = load i32, ptr %param_n, align 4, !dbg !1622
  %109 = load i32, ptr %param_o, align 4, !dbg !1623
  %sub114 = sub nsw i32 %108, %109, !dbg !1624
  %mul115 = mul nsw i32 %107, %sub114, !dbg !1625
  %add.ptr116 = getelementptr inbounds i8, ptr %arraydecay113, i32 %mul115, !dbg !1626
  store ptr %add.ptr116, ptr %vi, align 4, !dbg !1627
  %O = getelementptr inbounds nuw %struct.sk_t, ptr %sk, i32 0, i32 1, !dbg !1628
  %arraydecay117 = getelementptr inbounds [2414 x i8], ptr %O, i32 0, i32 0, !dbg !1629
  %arraydecay118 = getelementptr inbounds [1848 x i8], ptr %x, i32 0, i32 0, !dbg !1630
  %110 = load i32, ptr %i107, align 4, !dbg !1631
  %111 = load i32, ptr %param_o, align 4, !dbg !1632
  %mul119 = mul nsw i32 %110, %111, !dbg !1633
  %add.ptr120 = getelementptr inbounds i8, ptr %arraydecay118, i32 %mul119, !dbg !1634
  %arraydecay121 = getelementptr inbounds [142 x i8], ptr %Ox, i32 0, i32 0, !dbg !1635
  %112 = load i32, ptr %param_o, align 4, !dbg !1636
  %113 = load i32, ptr %param_n, align 4, !dbg !1637
  %114 = load i32, ptr %param_o, align 4, !dbg !1638
  %sub122 = sub nsw i32 %113, %114, !dbg !1639
  call void @mat_mul(ptr noundef %arraydecay117, ptr noundef %add.ptr120, ptr noundef %arraydecay121, i32 noundef %112, i32 noundef %sub122, i32 noundef 1) #5, !dbg !1640
  %115 = load ptr, ptr %vi, align 4, !dbg !1641
  %arraydecay123 = getelementptr inbounds [142 x i8], ptr %Ox, i32 0, i32 0, !dbg !1642
  %arraydecay124 = getelementptr inbounds [1848 x i8], ptr %s, i32 0, i32 0, !dbg !1643
  %116 = load i32, ptr %i107, align 4, !dbg !1644
  %117 = load i32, ptr %param_n, align 4, !dbg !1645
  %mul125 = mul nsw i32 %116, %117, !dbg !1646
  %add.ptr126 = getelementptr inbounds i8, ptr %arraydecay124, i32 %mul125, !dbg !1647
  %118 = load i32, ptr %param_n, align 4, !dbg !1648
  %119 = load i32, ptr %param_o, align 4, !dbg !1649
  %sub127 = sub nsw i32 %118, %119, !dbg !1650
  call void @mat_add(ptr noundef %115, ptr noundef %arraydecay123, ptr noundef %add.ptr126, i32 noundef %sub127, i32 noundef 1) #5, !dbg !1651
  %arraydecay128 = getelementptr inbounds [1848 x i8], ptr %s, i32 0, i32 0, !dbg !1652
  %120 = load i32, ptr %i107, align 4, !dbg !1653
  %121 = load i32, ptr %param_n, align 4, !dbg !1654
  %mul129 = mul nsw i32 %120, %121, !dbg !1655
  %add.ptr130 = getelementptr inbounds i8, ptr %arraydecay128, i32 %mul129, !dbg !1656
  %122 = load i32, ptr %param_n, align 4, !dbg !1657
  %123 = load i32, ptr %param_o, align 4, !dbg !1658
  %sub131 = sub nsw i32 %122, %123, !dbg !1659
  %add.ptr132 = getelementptr inbounds i8, ptr %add.ptr130, i32 %sub131, !dbg !1660
  %arraydecay133 = getelementptr inbounds [1848 x i8], ptr %x, i32 0, i32 0, !dbg !1661
  %124 = load i32, ptr %i107, align 4, !dbg !1662
  %125 = load i32, ptr %param_o, align 4, !dbg !1663
  %mul134 = mul nsw i32 %124, %125, !dbg !1664
  %add.ptr135 = getelementptr inbounds i8, ptr %arraydecay133, i32 %mul134, !dbg !1665
  %126 = load i32, ptr %param_o, align 4, !dbg !1666
  %call136 = call ptr @memcpy(ptr noundef %add.ptr132, ptr noundef %add.ptr135, i32 noundef %126) #5, !dbg !1667
  br label %for.inc137, !dbg !1668

for.inc137:                                       ; preds = %for.body112
  %127 = load i32, ptr %i107, align 4, !dbg !1669
  %inc138 = add nsw i32 %127, 1, !dbg !1669
  store i32 %inc138, ptr %i107, align 4, !dbg !1669
  br label %for.cond108, !dbg !1670, !llvm.loop !1671

for.end139:                                       ; preds = %for.cond108
  %arraydecay140 = getelementptr inbounds [1848 x i8], ptr %s, i32 0, i32 0, !dbg !1673
  %128 = load ptr, ptr %sig.addr, align 4, !dbg !1674
  %129 = load i32, ptr %param_n, align 4, !dbg !1675
  %130 = load i32, ptr %param_k, align 4, !dbg !1676
  %mul141 = mul nsw i32 %129, %130, !dbg !1677
  call void @encode(ptr noundef %arraydecay140, ptr noundef %128, i32 noundef %mul141) #5, !dbg !1678
  %131 = load ptr, ptr %sig.addr, align 4, !dbg !1679
  %132 = load i32, ptr %param_sig_bytes, align 4, !dbg !1680
  %add.ptr142 = getelementptr inbounds i8, ptr %131, i32 %132, !dbg !1681
  %133 = load i32, ptr %param_salt_bytes, align 4, !dbg !1682
  %idx.neg = sub i32 0, %133, !dbg !1683
  %add.ptr143 = getelementptr inbounds i8, ptr %add.ptr142, i32 %idx.neg, !dbg !1683
  %arraydecay144 = getelementptr inbounds [40 x i8], ptr %salt, i32 0, i32 0, !dbg !1684
  %134 = load i32, ptr %param_salt_bytes, align 4, !dbg !1685
  %call145 = call ptr @memcpy(ptr noundef %add.ptr143, ptr noundef %arraydecay144, i32 noundef %134) #5, !dbg !1686
  %135 = load i32, ptr %param_sig_bytes, align 4, !dbg !1687
  %136 = load ptr, ptr %siglen.addr, align 4, !dbg !1688
  store i32 %135, ptr %136, align 4, !dbg !1689
  br label %err, !dbg !1690

err:                                              ; preds = %for.end139, %if.then22, %if.then
    #dbg_label(!1691, !1692)
  %arraydecay146 = getelementptr inbounds [924 x i8], ptr %V, i32 0, i32 0, !dbg !1693
  call void @mayo_secure_clear(ptr noundef %arraydecay146, i32 noundef 924) #5, !dbg !1694
  %arraydecay147 = getelementptr inbounds [1704 x i8], ptr %Vdec, i32 0, i32 0, !dbg !1695
  call void @mayo_secure_clear(ptr noundef %arraydecay147, i32 noundef 1704) #5, !dbg !1696
  %arraydecay148 = getelementptr inbounds [29520 x i8], ptr %A, i32 0, i32 0, !dbg !1697
  call void @mayo_secure_clear(ptr noundef %arraydecay148, i32 noundef 29520) #5, !dbg !1698
  %arraydecay149 = getelementptr inbounds [205 x i8], ptr %r, i32 0, i32 0, !dbg !1699
  call void @mayo_secure_clear(ptr noundef %arraydecay149, i32 noundef 205) #5, !dbg !1700
  %O150 = getelementptr inbounds nuw %struct.sk_t, ptr %sk, i32 0, i32 1, !dbg !1701
  %arraydecay151 = getelementptr inbounds [2414 x i8], ptr %O150, i32 0, i32 0, !dbg !1702
  call void @mayo_secure_clear(ptr noundef %arraydecay151, i32 noundef 2414) #5, !dbg !1703
  call void @mayo_secure_clear(ptr noundef %sk, i32 noundef 907240) #5, !dbg !1704
  %arraydecay152 = getelementptr inbounds [142 x i8], ptr %Ox, i32 0, i32 0, !dbg !1705
  call void @mayo_secure_clear(ptr noundef %arraydecay152, i32 noundef 142) #5, !dbg !1706
  %arraydecay153 = getelementptr inbounds [145 x i8], ptr %tmp, i32 0, i32 0, !dbg !1707
  call void @mayo_secure_clear(ptr noundef %arraydecay153, i32 noundef 145) #5, !dbg !1708
  %arraydecay154 = getelementptr inbounds [1836 x i64], ptr %Mtmp, i32 0, i32 0, !dbg !1709
  call void @mayo_secure_clear(ptr noundef %arraydecay154, i32 noundef 14688) #5, !dbg !1710
  %137 = load i32, ptr %ret, align 4, !dbg !1711
  ret i32 %137, !dbg !1712
}

; Function Attrs: noinline nounwind optnone
define internal void @compute_M_and_VPV(ptr noundef %p, ptr noundef %Vdec, ptr noundef %L, ptr noundef %P1, ptr noundef %VL, ptr noundef %VP1V) #0 !dbg !1713 {
entry:
  %p.addr = alloca ptr, align 4
  %Vdec.addr = alloca ptr, align 4
  %L.addr = alloca ptr, align 4
  %P1.addr = alloca ptr, align 4
  %VL.addr = alloca ptr, align 4
  %VP1V.addr = alloca ptr, align 4
  %param_k = alloca i32, align 4
  %param_v = alloca i32, align 4
  %param_o = alloca i32, align 4
  %Pv = alloca [15336 x i64], align 8
  store ptr %p, ptr %p.addr, align 4
    #dbg_declare(ptr %p.addr, !1716, !DIExpression(), !1717)
  store ptr %Vdec, ptr %Vdec.addr, align 4
    #dbg_declare(ptr %Vdec.addr, !1718, !DIExpression(), !1719)
  store ptr %L, ptr %L.addr, align 4
    #dbg_declare(ptr %L.addr, !1720, !DIExpression(), !1721)
  store ptr %P1, ptr %P1.addr, align 4
    #dbg_declare(ptr %P1.addr, !1722, !DIExpression(), !1723)
  store ptr %VL, ptr %VL.addr, align 4
    #dbg_declare(ptr %VL.addr, !1724, !DIExpression(), !1725)
  store ptr %VP1V, ptr %VP1V.addr, align 4
    #dbg_declare(ptr %VP1V.addr, !1726, !DIExpression(), !1727)
    #dbg_declare(ptr %param_k, !1728, !DIExpression(), !1729)
  %0 = load ptr, ptr %p.addr, align 4, !dbg !1730
  %k = getelementptr inbounds nuw %struct.mayo_params_t, ptr %0, i32 0, i32 3, !dbg !1730
  %1 = load i32, ptr %k, align 4, !dbg !1730
  store i32 %1, ptr %param_k, align 4, !dbg !1729
    #dbg_declare(ptr %param_v, !1731, !DIExpression(), !1732)
  %2 = load ptr, ptr %p.addr, align 4, !dbg !1733
  %n = getelementptr inbounds nuw %struct.mayo_params_t, ptr %2, i32 0, i32 1, !dbg !1733
  %3 = load i32, ptr %n, align 4, !dbg !1733
  %4 = load ptr, ptr %p.addr, align 4, !dbg !1733
  %o = getelementptr inbounds nuw %struct.mayo_params_t, ptr %4, i32 0, i32 2, !dbg !1733
  %5 = load i32, ptr %o, align 4, !dbg !1733
  %sub = sub nsw i32 %3, %5, !dbg !1733
  store i32 %sub, ptr %param_v, align 4, !dbg !1732
    #dbg_declare(ptr %param_o, !1734, !DIExpression(), !1735)
  %6 = load ptr, ptr %p.addr, align 4, !dbg !1736
  %o1 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %6, i32 0, i32 2, !dbg !1736
  %7 = load i32, ptr %o1, align 4, !dbg !1736
  store i32 %7, ptr %param_o, align 4, !dbg !1735
  %8 = load ptr, ptr %p.addr, align 4, !dbg !1737
  %m_vec_limbs = getelementptr inbounds nuw %struct.mayo_params_t, ptr %8, i32 0, i32 21, !dbg !1737
  %9 = load i32, ptr %m_vec_limbs, align 4, !dbg !1737
  %10 = load ptr, ptr %Vdec.addr, align 4, !dbg !1738
  %11 = load ptr, ptr %L.addr, align 4, !dbg !1739
  %12 = load ptr, ptr %VL.addr, align 4, !dbg !1740
  %13 = load i32, ptr %param_k, align 4, !dbg !1741
  %14 = load i32, ptr %param_v, align 4, !dbg !1742
  %15 = load i32, ptr %param_o, align 4, !dbg !1743
  call void @mul_add_mat_x_m_mat(i32 noundef %9, ptr noundef %10, ptr noundef %11, ptr noundef %12, i32 noundef %13, i32 noundef %14, i32 noundef %15) #5, !dbg !1744
    #dbg_declare(ptr %Pv, !1745, !DIExpression(), !1749)
  call void @llvm.memset.p0.i32(ptr align 8 %Pv, i8 0, i32 122688, i1 false), !dbg !1749
  %16 = load ptr, ptr %p.addr, align 4, !dbg !1750
  %17 = load ptr, ptr %P1.addr, align 4, !dbg !1751
  %18 = load ptr, ptr %Vdec.addr, align 4, !dbg !1752
  %arraydecay = getelementptr inbounds [15336 x i64], ptr %Pv, i32 0, i32 0, !dbg !1753
  call void @P1_times_Vt(ptr noundef %16, ptr noundef %17, ptr noundef %18, ptr noundef %arraydecay) #5, !dbg !1754
  %19 = load ptr, ptr %p.addr, align 4, !dbg !1755
  %m_vec_limbs2 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %19, i32 0, i32 21, !dbg !1755
  %20 = load i32, ptr %m_vec_limbs2, align 4, !dbg !1755
  %21 = load ptr, ptr %Vdec.addr, align 4, !dbg !1756
  %arraydecay3 = getelementptr inbounds [15336 x i64], ptr %Pv, i32 0, i32 0, !dbg !1757
  %22 = load ptr, ptr %VP1V.addr, align 4, !dbg !1758
  %23 = load i32, ptr %param_k, align 4, !dbg !1759
  %24 = load i32, ptr %param_v, align 4, !dbg !1760
  %25 = load i32, ptr %param_k, align 4, !dbg !1761
  call void @mul_add_mat_x_m_mat(i32 noundef %20, ptr noundef %21, ptr noundef %arraydecay3, ptr noundef %22, i32 noundef %23, i32 noundef %24, i32 noundef %25) #5, !dbg !1762
  ret void, !dbg !1763
}

; Function Attrs: noinline nounwind optnone
define internal void @compute_rhs(ptr noundef %p, ptr noundef %vPv, ptr noundef %t, ptr noundef %y) #0 !dbg !1764 {
entry:
  %p.addr = alloca ptr, align 4
  %vPv.addr = alloca ptr, align 4
  %t.addr = alloca ptr, align 4
  %y.addr = alloca ptr, align 4
  %top_pos = alloca i32, align 4
  %m_vec_limbs = alloca i32, align 4
  %mask = alloca i64, align 8
  %i = alloca i32, align 4
  %temp = alloca [9 x i64], align 8
  %temp_bytes = alloca ptr, align 4
  %i13 = alloca i32, align 4
  %j = alloca i32, align 4
  %top = alloca i8, align 1
  %k30 = alloca i32, align 4
  %jj = alloca i32, align 4
  %k72 = alloca i32, align 4
  %i105 = alloca i32, align 4
  store ptr %p, ptr %p.addr, align 4
    #dbg_declare(ptr %p.addr, !1767, !DIExpression(), !1768)
  store ptr %vPv, ptr %vPv.addr, align 4
    #dbg_declare(ptr %vPv.addr, !1769, !DIExpression(), !1770)
  store ptr %t, ptr %t.addr, align 4
    #dbg_declare(ptr %t.addr, !1771, !DIExpression(), !1772)
  store ptr %y, ptr %y.addr, align 4
    #dbg_declare(ptr %y.addr, !1773, !DIExpression(), !1774)
    #dbg_declare(ptr %top_pos, !1775, !DIExpression(), !1777)
  %0 = load ptr, ptr %p.addr, align 4, !dbg !1778
  %m = getelementptr inbounds nuw %struct.mayo_params_t, ptr %0, i32 0, i32 0, !dbg !1778
  %1 = load i32, ptr %m, align 4, !dbg !1778
  %sub = sub nsw i32 %1, 1, !dbg !1779
  %rem = srem i32 %sub, 16, !dbg !1780
  %mul = mul nsw i32 %rem, 4, !dbg !1781
  store i32 %mul, ptr %top_pos, align 4, !dbg !1777
    #dbg_declare(ptr %m_vec_limbs, !1782, !DIExpression(), !1783)
  %2 = load ptr, ptr %p.addr, align 4, !dbg !1784
  %m_vec_limbs1 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %2, i32 0, i32 21, !dbg !1784
  %3 = load i32, ptr %m_vec_limbs1, align 4, !dbg !1784
  store i32 %3, ptr %m_vec_limbs, align 4, !dbg !1783
  %4 = load ptr, ptr %p.addr, align 4, !dbg !1785
  %m2 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %4, i32 0, i32 0, !dbg !1785
  %5 = load i32, ptr %m2, align 4, !dbg !1785
  %rem3 = srem i32 %5, 16, !dbg !1787
  %cmp = icmp ne i32 %rem3, 0, !dbg !1788
  br i1 %cmp, label %if.then, label %if.end, !dbg !1788

if.then:                                          ; preds = %entry
    #dbg_declare(ptr %mask, !1789, !DIExpression(), !1791)
  store i64 1, ptr %mask, align 8, !dbg !1791
  %6 = load ptr, ptr %p.addr, align 4, !dbg !1792
  %m4 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %6, i32 0, i32 0, !dbg !1792
  %7 = load i32, ptr %m4, align 4, !dbg !1792
  %rem5 = srem i32 %7, 16, !dbg !1793
  %mul6 = mul nsw i32 %rem5, 4, !dbg !1794
  %8 = load i64, ptr %mask, align 8, !dbg !1795
  %sh_prom = zext i32 %mul6 to i64, !dbg !1795
  %shl = shl i64 %8, %sh_prom, !dbg !1795
  store i64 %shl, ptr %mask, align 8, !dbg !1795
  %9 = load i64, ptr %mask, align 8, !dbg !1796
  %sub7 = sub i64 %9, 1, !dbg !1796
  store i64 %sub7, ptr %mask, align 8, !dbg !1796
    #dbg_declare(ptr %i, !1797, !DIExpression(), !1799)
  store i32 0, ptr %i, align 4, !dbg !1799
  br label %for.cond, !dbg !1800

for.cond:                                         ; preds = %for.inc, %if.then
  %10 = load i32, ptr %i, align 4, !dbg !1801
  %11 = load ptr, ptr %p.addr, align 4, !dbg !1803
  %k = getelementptr inbounds nuw %struct.mayo_params_t, ptr %11, i32 0, i32 3, !dbg !1803
  %12 = load i32, ptr %k, align 4, !dbg !1803
  %13 = load ptr, ptr %p.addr, align 4, !dbg !1804
  %k8 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %13, i32 0, i32 3, !dbg !1804
  %14 = load i32, ptr %k8, align 4, !dbg !1804
  %mul9 = mul nsw i32 %12, %14, !dbg !1805
  %cmp10 = icmp slt i32 %10, %mul9, !dbg !1806
  br i1 %cmp10, label %for.body, label %for.end, !dbg !1807

for.body:                                         ; preds = %for.cond
  %15 = load i64, ptr %mask, align 8, !dbg !1808
  %16 = load ptr, ptr %vPv.addr, align 4, !dbg !1810
  %17 = load i32, ptr %i, align 4, !dbg !1811
  %18 = load i32, ptr %m_vec_limbs, align 4, !dbg !1812
  %mul11 = mul i32 %17, %18, !dbg !1813
  %19 = load i32, ptr %m_vec_limbs, align 4, !dbg !1814
  %add = add i32 %mul11, %19, !dbg !1815
  %sub12 = sub i32 %add, 1, !dbg !1816
  %arrayidx = getelementptr inbounds nuw i64, ptr %16, i32 %sub12, !dbg !1810
  %20 = load i64, ptr %arrayidx, align 8, !dbg !1817
  %and = and i64 %20, %15, !dbg !1817
  store i64 %and, ptr %arrayidx, align 8, !dbg !1817
  br label %for.inc, !dbg !1818

for.inc:                                          ; preds = %for.body
  %21 = load i32, ptr %i, align 4, !dbg !1819
  %inc = add nsw i32 %21, 1, !dbg !1819
  store i32 %inc, ptr %i, align 4, !dbg !1819
  br label %for.cond, !dbg !1820, !llvm.loop !1821

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !1823

if.end:                                           ; preds = %for.end, %entry
    #dbg_declare(ptr %temp, !1824, !DIExpression(), !1825)
  call void @llvm.memset.p0.i32(ptr align 8 %temp, i8 0, i32 72, i1 false), !dbg !1825
    #dbg_declare(ptr %temp_bytes, !1826, !DIExpression(), !1827)
  %arraydecay = getelementptr inbounds [9 x i64], ptr %temp, i32 0, i32 0, !dbg !1828
  store ptr %arraydecay, ptr %temp_bytes, align 4, !dbg !1827
    #dbg_declare(ptr %i13, !1829, !DIExpression(), !1831)
  %22 = load ptr, ptr %p.addr, align 4, !dbg !1832
  %k14 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %22, i32 0, i32 3, !dbg !1832
  %23 = load i32, ptr %k14, align 4, !dbg !1832
  %sub15 = sub nsw i32 %23, 1, !dbg !1833
  store i32 %sub15, ptr %i13, align 4, !dbg !1831
  br label %for.cond16, !dbg !1834

for.cond16:                                       ; preds = %for.inc102, %if.end
  %24 = load i32, ptr %i13, align 4, !dbg !1835
  %cmp17 = icmp sge i32 %24, 0, !dbg !1837
  br i1 %cmp17, label %for.body18, label %for.end104, !dbg !1838

for.body18:                                       ; preds = %for.cond16
    #dbg_declare(ptr %j, !1839, !DIExpression(), !1842)
  %25 = load i32, ptr %i13, align 4, !dbg !1843
  store i32 %25, ptr %j, align 4, !dbg !1842
  br label %for.cond19, !dbg !1844

for.cond19:                                       ; preds = %for.inc99, %for.body18
  %26 = load i32, ptr %j, align 4, !dbg !1845
  %27 = load ptr, ptr %p.addr, align 4, !dbg !1847
  %k20 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %27, i32 0, i32 3, !dbg !1847
  %28 = load i32, ptr %k20, align 4, !dbg !1847
  %cmp21 = icmp slt i32 %26, %28, !dbg !1848
  br i1 %cmp21, label %for.body22, label %for.end101, !dbg !1849

for.body22:                                       ; preds = %for.cond19
    #dbg_declare(ptr %top, !1850, !DIExpression(), !1852)
  %29 = load i32, ptr %m_vec_limbs, align 4, !dbg !1853
  %sub23 = sub i32 %29, 1, !dbg !1854
  %arrayidx24 = getelementptr inbounds nuw [9 x i64], ptr %temp, i32 0, i32 %sub23, !dbg !1855
  %30 = load i64, ptr %arrayidx24, align 8, !dbg !1855
  %31 = load i32, ptr %top_pos, align 4, !dbg !1856
  %sh_prom25 = zext i32 %31 to i64, !dbg !1857
  %shr = lshr i64 %30, %sh_prom25, !dbg !1857
  %rem26 = urem i64 %shr, 16, !dbg !1858
  %conv = trunc i64 %rem26 to i8, !dbg !1859
  store i8 %conv, ptr %top, align 1, !dbg !1852
  %32 = load i32, ptr %m_vec_limbs, align 4, !dbg !1860
  %sub27 = sub i32 %32, 1, !dbg !1861
  %arrayidx28 = getelementptr inbounds nuw [9 x i64], ptr %temp, i32 0, i32 %sub27, !dbg !1862
  %33 = load i64, ptr %arrayidx28, align 8, !dbg !1863
  %shl29 = shl i64 %33, 4, !dbg !1863
  store i64 %shl29, ptr %arrayidx28, align 8, !dbg !1863
    #dbg_declare(ptr %k30, !1864, !DIExpression(), !1866)
  %34 = load i32, ptr %m_vec_limbs, align 4, !dbg !1867
  %sub31 = sub i32 %34, 2, !dbg !1868
  store i32 %sub31, ptr %k30, align 4, !dbg !1866
  br label %for.cond32, !dbg !1869

for.cond32:                                       ; preds = %for.inc42, %for.body22
  %35 = load i32, ptr %k30, align 4, !dbg !1870
  %cmp33 = icmp sge i32 %35, 0, !dbg !1872
  br i1 %cmp33, label %for.body35, label %for.end43, !dbg !1873

for.body35:                                       ; preds = %for.cond32
  %36 = load i32, ptr %k30, align 4, !dbg !1874
  %arrayidx36 = getelementptr inbounds [9 x i64], ptr %temp, i32 0, i32 %36, !dbg !1876
  %37 = load i64, ptr %arrayidx36, align 8, !dbg !1876
  %shr37 = lshr i64 %37, 60, !dbg !1877
  %38 = load i32, ptr %k30, align 4, !dbg !1878
  %add38 = add nsw i32 %38, 1, !dbg !1879
  %arrayidx39 = getelementptr inbounds [9 x i64], ptr %temp, i32 0, i32 %add38, !dbg !1880
  %39 = load i64, ptr %arrayidx39, align 8, !dbg !1881
  %xor = xor i64 %39, %shr37, !dbg !1881
  store i64 %xor, ptr %arrayidx39, align 8, !dbg !1881
  %40 = load i32, ptr %k30, align 4, !dbg !1882
  %arrayidx40 = getelementptr inbounds [9 x i64], ptr %temp, i32 0, i32 %40, !dbg !1883
  %41 = load i64, ptr %arrayidx40, align 8, !dbg !1884
  %shl41 = shl i64 %41, 4, !dbg !1884
  store i64 %shl41, ptr %arrayidx40, align 8, !dbg !1884
  br label %for.inc42, !dbg !1885

for.inc42:                                        ; preds = %for.body35
  %42 = load i32, ptr %k30, align 4, !dbg !1886
  %dec = add nsw i32 %42, -1, !dbg !1886
  store i32 %dec, ptr %k30, align 4, !dbg !1886
  br label %for.cond32, !dbg !1887, !llvm.loop !1888

for.end43:                                        ; preds = %for.cond32
    #dbg_declare(ptr %jj, !1890, !DIExpression(), !1892)
  store i32 0, ptr %jj, align 4, !dbg !1892
  br label %for.cond44, !dbg !1893

for.cond44:                                       ; preds = %for.inc69, %for.end43
  %43 = load i32, ptr %jj, align 4, !dbg !1894
  %cmp45 = icmp slt i32 %43, 4, !dbg !1896
  br i1 %cmp45, label %for.body47, label %for.end71, !dbg !1897

for.body47:                                       ; preds = %for.cond44
  %44 = load i32, ptr %jj, align 4, !dbg !1898
  %rem48 = srem i32 %44, 2, !dbg !1901
  %cmp49 = icmp eq i32 %rem48, 0, !dbg !1902
  br i1 %cmp49, label %if.then51, label %if.else, !dbg !1902

if.then51:                                        ; preds = %for.body47
  %45 = load i8, ptr %top, align 1, !dbg !1903
  %46 = load ptr, ptr %p.addr, align 4, !dbg !1905
  %f_tail = getelementptr inbounds nuw %struct.mayo_params_t, ptr %46, i32 0, i32 5, !dbg !1905
  %47 = load ptr, ptr %f_tail, align 4, !dbg !1905
  %48 = load i32, ptr %jj, align 4, !dbg !1906
  %arrayidx52 = getelementptr inbounds i8, ptr %47, i32 %48, !dbg !1905
  %49 = load i8, ptr %arrayidx52, align 1, !dbg !1905
  %call = call zeroext i8 @mul_f(i8 noundef zeroext %45, i8 noundef zeroext %49) #5, !dbg !1907
  %conv53 = zext i8 %call to i32, !dbg !1907
  %50 = load ptr, ptr %temp_bytes, align 4, !dbg !1908
  %51 = load i32, ptr %jj, align 4, !dbg !1909
  %div = sdiv i32 %51, 2, !dbg !1910
  %arrayidx54 = getelementptr inbounds i8, ptr %50, i32 %div, !dbg !1908
  %52 = load i8, ptr %arrayidx54, align 1, !dbg !1911
  %conv55 = zext i8 %52 to i32, !dbg !1911
  %xor56 = xor i32 %conv55, %conv53, !dbg !1911
  %conv57 = trunc i32 %xor56 to i8, !dbg !1911
  store i8 %conv57, ptr %arrayidx54, align 1, !dbg !1911
  br label %if.end68, !dbg !1912

if.else:                                          ; preds = %for.body47
  %53 = load i8, ptr %top, align 1, !dbg !1913
  %54 = load ptr, ptr %p.addr, align 4, !dbg !1915
  %f_tail58 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %54, i32 0, i32 5, !dbg !1915
  %55 = load ptr, ptr %f_tail58, align 4, !dbg !1915
  %56 = load i32, ptr %jj, align 4, !dbg !1916
  %arrayidx59 = getelementptr inbounds i8, ptr %55, i32 %56, !dbg !1915
  %57 = load i8, ptr %arrayidx59, align 1, !dbg !1915
  %call60 = call zeroext i8 @mul_f(i8 noundef zeroext %53, i8 noundef zeroext %57) #5, !dbg !1917
  %conv61 = zext i8 %call60 to i32, !dbg !1917
  %shl62 = shl i32 %conv61, 4, !dbg !1918
  %58 = load ptr, ptr %temp_bytes, align 4, !dbg !1919
  %59 = load i32, ptr %jj, align 4, !dbg !1920
  %div63 = sdiv i32 %59, 2, !dbg !1921
  %arrayidx64 = getelementptr inbounds i8, ptr %58, i32 %div63, !dbg !1919
  %60 = load i8, ptr %arrayidx64, align 1, !dbg !1922
  %conv65 = zext i8 %60 to i32, !dbg !1922
  %xor66 = xor i32 %conv65, %shl62, !dbg !1922
  %conv67 = trunc i32 %xor66 to i8, !dbg !1922
  store i8 %conv67, ptr %arrayidx64, align 1, !dbg !1922
  br label %if.end68

if.end68:                                         ; preds = %if.else, %if.then51
  br label %for.inc69, !dbg !1923

for.inc69:                                        ; preds = %if.end68
  %61 = load i32, ptr %jj, align 4, !dbg !1924
  %inc70 = add nsw i32 %61, 1, !dbg !1924
  store i32 %inc70, ptr %jj, align 4, !dbg !1924
  br label %for.cond44, !dbg !1925, !llvm.loop !1926

for.end71:                                        ; preds = %for.cond44
    #dbg_declare(ptr %k72, !1928, !DIExpression(), !1930)
  store i32 0, ptr %k72, align 4, !dbg !1930
  br label %for.cond73, !dbg !1931

for.cond73:                                       ; preds = %for.inc96, %for.end71
  %62 = load i32, ptr %k72, align 4, !dbg !1932
  %63 = load i32, ptr %m_vec_limbs, align 4, !dbg !1934
  %cmp74 = icmp ult i32 %62, %63, !dbg !1935
  br i1 %cmp74, label %for.body76, label %for.end98, !dbg !1936

for.body76:                                       ; preds = %for.cond73
  %64 = load ptr, ptr %vPv.addr, align 4, !dbg !1937
  %65 = load i32, ptr %i13, align 4, !dbg !1939
  %66 = load ptr, ptr %p.addr, align 4, !dbg !1940
  %k77 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %66, i32 0, i32 3, !dbg !1940
  %67 = load i32, ptr %k77, align 4, !dbg !1940
  %mul78 = mul nsw i32 %65, %67, !dbg !1941
  %68 = load i32, ptr %j, align 4, !dbg !1942
  %add79 = add nsw i32 %mul78, %68, !dbg !1943
  %69 = load i32, ptr %m_vec_limbs, align 4, !dbg !1944
  %mul80 = mul i32 %add79, %69, !dbg !1945
  %70 = load i32, ptr %k72, align 4, !dbg !1946
  %add81 = add i32 %mul80, %70, !dbg !1947
  %arrayidx82 = getelementptr inbounds nuw i64, ptr %64, i32 %add81, !dbg !1937
  %71 = load i64, ptr %arrayidx82, align 8, !dbg !1937
  %72 = load i32, ptr %i13, align 4, !dbg !1948
  %73 = load i32, ptr %j, align 4, !dbg !1949
  %cmp83 = icmp ne i32 %72, %73, !dbg !1950
  %conv84 = zext i1 %cmp83 to i32, !dbg !1950
  %conv85 = sext i32 %conv84 to i64, !dbg !1951
  %74 = load ptr, ptr %vPv.addr, align 4, !dbg !1952
  %75 = load i32, ptr %j, align 4, !dbg !1953
  %76 = load ptr, ptr %p.addr, align 4, !dbg !1954
  %k86 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %76, i32 0, i32 3, !dbg !1954
  %77 = load i32, ptr %k86, align 4, !dbg !1954
  %mul87 = mul nsw i32 %75, %77, !dbg !1955
  %78 = load i32, ptr %i13, align 4, !dbg !1956
  %add88 = add nsw i32 %mul87, %78, !dbg !1957
  %79 = load i32, ptr %m_vec_limbs, align 4, !dbg !1958
  %mul89 = mul i32 %add88, %79, !dbg !1959
  %80 = load i32, ptr %k72, align 4, !dbg !1960
  %add90 = add i32 %mul89, %80, !dbg !1961
  %arrayidx91 = getelementptr inbounds nuw i64, ptr %74, i32 %add90, !dbg !1952
  %81 = load i64, ptr %arrayidx91, align 8, !dbg !1952
  %mul92 = mul i64 %conv85, %81, !dbg !1962
  %xor93 = xor i64 %71, %mul92, !dbg !1963
  %82 = load i32, ptr %k72, align 4, !dbg !1964
  %arrayidx94 = getelementptr inbounds nuw [9 x i64], ptr %temp, i32 0, i32 %82, !dbg !1965
  %83 = load i64, ptr %arrayidx94, align 8, !dbg !1966
  %xor95 = xor i64 %83, %xor93, !dbg !1966
  store i64 %xor95, ptr %arrayidx94, align 8, !dbg !1966
  br label %for.inc96, !dbg !1967

for.inc96:                                        ; preds = %for.body76
  %84 = load i32, ptr %k72, align 4, !dbg !1968
  %inc97 = add i32 %84, 1, !dbg !1968
  store i32 %inc97, ptr %k72, align 4, !dbg !1968
  br label %for.cond73, !dbg !1969, !llvm.loop !1970

for.end98:                                        ; preds = %for.cond73
  br label %for.inc99, !dbg !1972

for.inc99:                                        ; preds = %for.end98
  %85 = load i32, ptr %j, align 4, !dbg !1973
  %inc100 = add nsw i32 %85, 1, !dbg !1973
  store i32 %inc100, ptr %j, align 4, !dbg !1973
  br label %for.cond19, !dbg !1974, !llvm.loop !1975

for.end101:                                       ; preds = %for.cond19
  br label %for.inc102, !dbg !1977

for.inc102:                                       ; preds = %for.end101
  %86 = load i32, ptr %i13, align 4, !dbg !1978
  %dec103 = add nsw i32 %86, -1, !dbg !1978
  store i32 %dec103, ptr %i13, align 4, !dbg !1978
  br label %for.cond16, !dbg !1979, !llvm.loop !1980

for.end104:                                       ; preds = %for.cond16
    #dbg_declare(ptr %i105, !1982, !DIExpression(), !1984)
  store i32 0, ptr %i105, align 4, !dbg !1984
  br label %for.cond106, !dbg !1985

for.cond106:                                      ; preds = %for.inc131, %for.end104
  %87 = load i32, ptr %i105, align 4, !dbg !1986
  %88 = load ptr, ptr %p.addr, align 4, !dbg !1988
  %m107 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %88, i32 0, i32 0, !dbg !1988
  %89 = load i32, ptr %m107, align 4, !dbg !1988
  %cmp108 = icmp slt i32 %87, %89, !dbg !1989
  br i1 %cmp108, label %for.body110, label %for.end133, !dbg !1990

for.body110:                                      ; preds = %for.cond106
  %90 = load ptr, ptr %t.addr, align 4, !dbg !1991
  %91 = load i32, ptr %i105, align 4, !dbg !1993
  %arrayidx111 = getelementptr inbounds i8, ptr %90, i32 %91, !dbg !1991
  %92 = load i8, ptr %arrayidx111, align 1, !dbg !1991
  %conv112 = zext i8 %92 to i32, !dbg !1991
  %93 = load ptr, ptr %temp_bytes, align 4, !dbg !1994
  %94 = load i32, ptr %i105, align 4, !dbg !1995
  %div113 = sdiv i32 %94, 2, !dbg !1996
  %arrayidx114 = getelementptr inbounds i8, ptr %93, i32 %div113, !dbg !1994
  %95 = load i8, ptr %arrayidx114, align 1, !dbg !1994
  %conv115 = zext i8 %95 to i32, !dbg !1994
  %and116 = and i32 %conv115, 15, !dbg !1997
  %xor117 = xor i32 %conv112, %and116, !dbg !1998
  %conv118 = trunc i32 %xor117 to i8, !dbg !1991
  %96 = load ptr, ptr %y.addr, align 4, !dbg !1999
  %97 = load i32, ptr %i105, align 4, !dbg !2000
  %arrayidx119 = getelementptr inbounds i8, ptr %96, i32 %97, !dbg !1999
  store i8 %conv118, ptr %arrayidx119, align 1, !dbg !2001
  %98 = load ptr, ptr %t.addr, align 4, !dbg !2002
  %99 = load i32, ptr %i105, align 4, !dbg !2003
  %add120 = add nsw i32 %99, 1, !dbg !2004
  %arrayidx121 = getelementptr inbounds i8, ptr %98, i32 %add120, !dbg !2002
  %100 = load i8, ptr %arrayidx121, align 1, !dbg !2002
  %conv122 = zext i8 %100 to i32, !dbg !2002
  %101 = load ptr, ptr %temp_bytes, align 4, !dbg !2005
  %102 = load i32, ptr %i105, align 4, !dbg !2006
  %div123 = sdiv i32 %102, 2, !dbg !2007
  %arrayidx124 = getelementptr inbounds i8, ptr %101, i32 %div123, !dbg !2005
  %103 = load i8, ptr %arrayidx124, align 1, !dbg !2005
  %conv125 = zext i8 %103 to i32, !dbg !2005
  %shr126 = ashr i32 %conv125, 4, !dbg !2008
  %xor127 = xor i32 %conv122, %shr126, !dbg !2009
  %conv128 = trunc i32 %xor127 to i8, !dbg !2002
  %104 = load ptr, ptr %y.addr, align 4, !dbg !2010
  %105 = load i32, ptr %i105, align 4, !dbg !2011
  %add129 = add nsw i32 %105, 1, !dbg !2012
  %arrayidx130 = getelementptr inbounds i8, ptr %104, i32 %add129, !dbg !2010
  store i8 %conv128, ptr %arrayidx130, align 1, !dbg !2013
  br label %for.inc131, !dbg !2014

for.inc131:                                       ; preds = %for.body110
  %106 = load i32, ptr %i105, align 4, !dbg !2015
  %add132 = add nsw i32 %106, 2, !dbg !2015
  store i32 %add132, ptr %i105, align 4, !dbg !2015
  br label %for.cond106, !dbg !2016, !llvm.loop !2017

for.end133:                                       ; preds = %for.cond106
  ret void, !dbg !2019
}

; Function Attrs: noinline nounwind optnone
define internal void @compute_A(ptr noundef %p, ptr noundef %VtL, ptr noundef %A_out) #0 !dbg !2020 {
entry:
  %p.addr = alloca ptr, align 4
  %VtL.addr = alloca ptr, align 4
  %A_out.addr = alloca ptr, align 4
  %bits_to_shift = alloca i32, align 4
  %words_to_shift = alloca i32, align 4
  %m_vec_limbs = alloca i32, align 4
  %A = alloca [3744 x i64], align 8
  %A_width = alloca i32, align 4
  %Mi = alloca ptr, align 4
  %Mj = alloca ptr, align 4
  %mask = alloca i64, align 8
  %i = alloca i32, align 4
  %i13 = alloca i32, align 4
  %j = alloca i32, align 4
  %c = alloca i32, align 4
  %k31 = alloca i32, align 4
  %c76 = alloca i32, align 4
  %k81 = alloca i32, align 4
  %c133 = alloca i32, align 4
  %tab = alloca [16 x i8], align 1
  %i151 = alloca i32, align 4
  %low_bit_in_nibble = alloca i64, align 8
  %c179 = alloca i32, align 4
  %r = alloca i32, align 4
  %pos = alloca i32, align 4
  %t0 = alloca i64, align 8
  %t1 = alloca i64, align 8
  %t2 = alloca i64, align 8
  %t3 = alloca i64, align 8
  %t = alloca i32, align 4
  %r257 = alloca i32, align 4
  %c263 = alloca i32, align 4
  %i273 = alloca i32, align 4
  store ptr %p, ptr %p.addr, align 4
    #dbg_declare(ptr %p.addr, !2023, !DIExpression(), !2024)
  store ptr %VtL, ptr %VtL.addr, align 4
    #dbg_declare(ptr %VtL.addr, !2025, !DIExpression(), !2026)
  store ptr %A_out, ptr %A_out.addr, align 4
    #dbg_declare(ptr %A_out.addr, !2027, !DIExpression(), !2028)
    #dbg_declare(ptr %bits_to_shift, !2029, !DIExpression(), !2030)
  store i32 0, ptr %bits_to_shift, align 4, !dbg !2030
    #dbg_declare(ptr %words_to_shift, !2031, !DIExpression(), !2032)
  store i32 0, ptr %words_to_shift, align 4, !dbg !2032
    #dbg_declare(ptr %m_vec_limbs, !2033, !DIExpression(), !2034)
  %0 = load ptr, ptr %p.addr, align 4, !dbg !2035
  %m_vec_limbs1 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %0, i32 0, i32 21, !dbg !2035
  %1 = load i32, ptr %m_vec_limbs1, align 4, !dbg !2035
  store i32 %1, ptr %m_vec_limbs, align 4, !dbg !2034
    #dbg_declare(ptr %A, !2036, !DIExpression(), !2040)
  call void @llvm.memset.p0.i32(ptr align 8 %A, i8 0, i32 29952, i1 false), !dbg !2040
    #dbg_declare(ptr %A_width, !2041, !DIExpression(), !2042)
  %2 = load ptr, ptr %p.addr, align 4, !dbg !2043
  %o = getelementptr inbounds nuw %struct.mayo_params_t, ptr %2, i32 0, i32 2, !dbg !2043
  %3 = load i32, ptr %o, align 4, !dbg !2043
  %4 = load ptr, ptr %p.addr, align 4, !dbg !2044
  %k = getelementptr inbounds nuw %struct.mayo_params_t, ptr %4, i32 0, i32 3, !dbg !2044
  %5 = load i32, ptr %k, align 4, !dbg !2044
  %mul = mul nsw i32 %3, %5, !dbg !2045
  %add = add nsw i32 %mul, 15, !dbg !2046
  %div = sdiv i32 %add, 16, !dbg !2047
  %mul2 = mul nsw i32 %div, 16, !dbg !2048
  store i32 %mul2, ptr %A_width, align 4, !dbg !2042
    #dbg_declare(ptr %Mi, !2049, !DIExpression(), !2050)
    #dbg_declare(ptr %Mj, !2051, !DIExpression(), !2052)
  %6 = load ptr, ptr %p.addr, align 4, !dbg !2053
  %m = getelementptr inbounds nuw %struct.mayo_params_t, ptr %6, i32 0, i32 0, !dbg !2053
  %7 = load i32, ptr %m, align 4, !dbg !2053
  %rem = srem i32 %7, 16, !dbg !2055
  %cmp = icmp ne i32 %rem, 0, !dbg !2056
  br i1 %cmp, label %if.then, label %if.end, !dbg !2056

if.then:                                          ; preds = %entry
    #dbg_declare(ptr %mask, !2057, !DIExpression(), !2059)
  store i64 1, ptr %mask, align 8, !dbg !2059
  %8 = load ptr, ptr %p.addr, align 4, !dbg !2060
  %m3 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %8, i32 0, i32 0, !dbg !2060
  %9 = load i32, ptr %m3, align 4, !dbg !2060
  %rem4 = srem i32 %9, 16, !dbg !2061
  %mul5 = mul nsw i32 %rem4, 4, !dbg !2062
  %10 = load i64, ptr %mask, align 8, !dbg !2063
  %sh_prom = zext i32 %mul5 to i64, !dbg !2063
  %shl = shl i64 %10, %sh_prom, !dbg !2063
  store i64 %shl, ptr %mask, align 8, !dbg !2063
  %11 = load i64, ptr %mask, align 8, !dbg !2064
  %sub = sub i64 %11, 1, !dbg !2064
  store i64 %sub, ptr %mask, align 8, !dbg !2064
    #dbg_declare(ptr %i, !2065, !DIExpression(), !2067)
  store i32 0, ptr %i, align 4, !dbg !2067
  br label %for.cond, !dbg !2068

for.cond:                                         ; preds = %for.inc, %if.then
  %12 = load i32, ptr %i, align 4, !dbg !2069
  %13 = load ptr, ptr %p.addr, align 4, !dbg !2071
  %o6 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %13, i32 0, i32 2, !dbg !2071
  %14 = load i32, ptr %o6, align 4, !dbg !2071
  %15 = load ptr, ptr %p.addr, align 4, !dbg !2072
  %k7 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %15, i32 0, i32 3, !dbg !2072
  %16 = load i32, ptr %k7, align 4, !dbg !2072
  %mul8 = mul nsw i32 %14, %16, !dbg !2073
  %cmp9 = icmp slt i32 %12, %mul8, !dbg !2074
  br i1 %cmp9, label %for.body, label %for.end, !dbg !2075

for.body:                                         ; preds = %for.cond
  %17 = load i64, ptr %mask, align 8, !dbg !2076
  %18 = load ptr, ptr %VtL.addr, align 4, !dbg !2078
  %19 = load i32, ptr %i, align 4, !dbg !2079
  %20 = load i32, ptr %m_vec_limbs, align 4, !dbg !2080
  %mul10 = mul nsw i32 %19, %20, !dbg !2081
  %21 = load i32, ptr %m_vec_limbs, align 4, !dbg !2082
  %add11 = add nsw i32 %mul10, %21, !dbg !2083
  %sub12 = sub nsw i32 %add11, 1, !dbg !2084
  %arrayidx = getelementptr inbounds i64, ptr %18, i32 %sub12, !dbg !2078
  %22 = load i64, ptr %arrayidx, align 8, !dbg !2085
  %and = and i64 %22, %17, !dbg !2085
  store i64 %and, ptr %arrayidx, align 8, !dbg !2085
  br label %for.inc, !dbg !2086

for.inc:                                          ; preds = %for.body
  %23 = load i32, ptr %i, align 4, !dbg !2087
  %inc = add nsw i32 %23, 1, !dbg !2087
  store i32 %inc, ptr %i, align 4, !dbg !2087
  br label %for.cond, !dbg !2088, !llvm.loop !2089

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !2091

if.end:                                           ; preds = %for.end, %entry
    #dbg_declare(ptr %i13, !2092, !DIExpression(), !2094)
  store i32 0, ptr %i13, align 4, !dbg !2094
  br label %for.cond14, !dbg !2095

for.cond14:                                       ; preds = %for.inc130, %if.end
  %24 = load i32, ptr %i13, align 4, !dbg !2096
  %25 = load ptr, ptr %p.addr, align 4, !dbg !2098
  %k15 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %25, i32 0, i32 3, !dbg !2098
  %26 = load i32, ptr %k15, align 4, !dbg !2098
  %sub16 = sub nsw i32 %26, 1, !dbg !2099
  %cmp17 = icmp sle i32 %24, %sub16, !dbg !2100
  br i1 %cmp17, label %for.body18, label %for.end132, !dbg !2101

for.body18:                                       ; preds = %for.cond14
    #dbg_declare(ptr %j, !2102, !DIExpression(), !2105)
  %27 = load ptr, ptr %p.addr, align 4, !dbg !2106
  %k19 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %27, i32 0, i32 3, !dbg !2106
  %28 = load i32, ptr %k19, align 4, !dbg !2106
  %sub20 = sub nsw i32 %28, 1, !dbg !2107
  store i32 %sub20, ptr %j, align 4, !dbg !2105
  br label %for.cond21, !dbg !2108

for.cond21:                                       ; preds = %for.inc128, %for.body18
  %29 = load i32, ptr %j, align 4, !dbg !2109
  %30 = load i32, ptr %i13, align 4, !dbg !2111
  %cmp22 = icmp sge i32 %29, %30, !dbg !2112
  br i1 %cmp22, label %for.body23, label %for.end129, !dbg !2113

for.body23:                                       ; preds = %for.cond21
  %31 = load ptr, ptr %VtL.addr, align 4, !dbg !2114
  %32 = load i32, ptr %j, align 4, !dbg !2116
  %33 = load i32, ptr %m_vec_limbs, align 4, !dbg !2117
  %mul24 = mul nsw i32 %32, %33, !dbg !2118
  %34 = load ptr, ptr %p.addr, align 4, !dbg !2119
  %o25 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %34, i32 0, i32 2, !dbg !2119
  %35 = load i32, ptr %o25, align 4, !dbg !2119
  %mul26 = mul nsw i32 %mul24, %35, !dbg !2120
  %add.ptr = getelementptr inbounds i64, ptr %31, i32 %mul26, !dbg !2121
  store ptr %add.ptr, ptr %Mj, align 4, !dbg !2122
    #dbg_declare(ptr %c, !2123, !DIExpression(), !2125)
  store i32 0, ptr %c, align 4, !dbg !2125
  br label %for.cond27, !dbg !2126

for.cond27:                                       ; preds = %for.inc67, %for.body23
  %36 = load i32, ptr %c, align 4, !dbg !2127
  %37 = load ptr, ptr %p.addr, align 4, !dbg !2129
  %o28 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %37, i32 0, i32 2, !dbg !2129
  %38 = load i32, ptr %o28, align 4, !dbg !2129
  %cmp29 = icmp slt i32 %36, %38, !dbg !2130
  br i1 %cmp29, label %for.body30, label %for.end69, !dbg !2131

for.body30:                                       ; preds = %for.cond27
    #dbg_declare(ptr %k31, !2132, !DIExpression(), !2135)
  store i32 0, ptr %k31, align 4, !dbg !2135
  br label %for.cond32, !dbg !2136

for.cond32:                                       ; preds = %for.inc64, %for.body30
  %39 = load i32, ptr %k31, align 4, !dbg !2137
  %40 = load i32, ptr %m_vec_limbs, align 4, !dbg !2139
  %cmp33 = icmp slt i32 %39, %40, !dbg !2140
  br i1 %cmp33, label %for.body34, label %for.end66, !dbg !2141

for.body34:                                       ; preds = %for.cond32
  %41 = load ptr, ptr %Mj, align 4, !dbg !2142
  %42 = load i32, ptr %k31, align 4, !dbg !2144
  %43 = load i32, ptr %c, align 4, !dbg !2145
  %44 = load i32, ptr %m_vec_limbs, align 4, !dbg !2146
  %mul35 = mul nsw i32 %43, %44, !dbg !2147
  %add36 = add nsw i32 %42, %mul35, !dbg !2148
  %arrayidx37 = getelementptr inbounds i64, ptr %41, i32 %add36, !dbg !2142
  %45 = load i64, ptr %arrayidx37, align 8, !dbg !2142
  %46 = load i32, ptr %bits_to_shift, align 4, !dbg !2149
  %sh_prom38 = zext i32 %46 to i64, !dbg !2150
  %shl39 = shl i64 %45, %sh_prom38, !dbg !2150
  %47 = load ptr, ptr %p.addr, align 4, !dbg !2151
  %o40 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %47, i32 0, i32 2, !dbg !2151
  %48 = load i32, ptr %o40, align 4, !dbg !2151
  %49 = load i32, ptr %i13, align 4, !dbg !2152
  %mul41 = mul nsw i32 %48, %49, !dbg !2153
  %50 = load i32, ptr %c, align 4, !dbg !2154
  %add42 = add nsw i32 %mul41, %50, !dbg !2155
  %51 = load i32, ptr %k31, align 4, !dbg !2156
  %52 = load i32, ptr %words_to_shift, align 4, !dbg !2157
  %add43 = add nsw i32 %51, %52, !dbg !2158
  %53 = load i32, ptr %A_width, align 4, !dbg !2159
  %mul44 = mul i32 %add43, %53, !dbg !2160
  %add45 = add i32 %add42, %mul44, !dbg !2161
  %arrayidx46 = getelementptr inbounds nuw [3744 x i64], ptr %A, i32 0, i32 %add45, !dbg !2162
  %54 = load i64, ptr %arrayidx46, align 8, !dbg !2163
  %xor = xor i64 %54, %shl39, !dbg !2163
  store i64 %xor, ptr %arrayidx46, align 8, !dbg !2163
  %55 = load i32, ptr %bits_to_shift, align 4, !dbg !2164
  %cmp47 = icmp sgt i32 %55, 0, !dbg !2166
  br i1 %cmp47, label %if.then48, label %if.end63, !dbg !2166

if.then48:                                        ; preds = %for.body34
  %56 = load ptr, ptr %Mj, align 4, !dbg !2167
  %57 = load i32, ptr %k31, align 4, !dbg !2169
  %58 = load i32, ptr %c, align 4, !dbg !2170
  %59 = load i32, ptr %m_vec_limbs, align 4, !dbg !2171
  %mul49 = mul nsw i32 %58, %59, !dbg !2172
  %add50 = add nsw i32 %57, %mul49, !dbg !2173
  %arrayidx51 = getelementptr inbounds i64, ptr %56, i32 %add50, !dbg !2167
  %60 = load i64, ptr %arrayidx51, align 8, !dbg !2167
  %61 = load i32, ptr %bits_to_shift, align 4, !dbg !2174
  %sub52 = sub nsw i32 64, %61, !dbg !2175
  %sh_prom53 = zext i32 %sub52 to i64, !dbg !2176
  %shr = lshr i64 %60, %sh_prom53, !dbg !2176
  %62 = load ptr, ptr %p.addr, align 4, !dbg !2177
  %o54 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %62, i32 0, i32 2, !dbg !2177
  %63 = load i32, ptr %o54, align 4, !dbg !2177
  %64 = load i32, ptr %i13, align 4, !dbg !2178
  %mul55 = mul nsw i32 %63, %64, !dbg !2179
  %65 = load i32, ptr %c, align 4, !dbg !2180
  %add56 = add nsw i32 %mul55, %65, !dbg !2181
  %66 = load i32, ptr %k31, align 4, !dbg !2182
  %67 = load i32, ptr %words_to_shift, align 4, !dbg !2183
  %add57 = add nsw i32 %66, %67, !dbg !2184
  %add58 = add nsw i32 %add57, 1, !dbg !2185
  %68 = load i32, ptr %A_width, align 4, !dbg !2186
  %mul59 = mul i32 %add58, %68, !dbg !2187
  %add60 = add i32 %add56, %mul59, !dbg !2188
  %arrayidx61 = getelementptr inbounds nuw [3744 x i64], ptr %A, i32 0, i32 %add60, !dbg !2189
  %69 = load i64, ptr %arrayidx61, align 8, !dbg !2190
  %xor62 = xor i64 %69, %shr, !dbg !2190
  store i64 %xor62, ptr %arrayidx61, align 8, !dbg !2190
  br label %if.end63, !dbg !2191

if.end63:                                         ; preds = %if.then48, %for.body34
  br label %for.inc64, !dbg !2192

for.inc64:                                        ; preds = %if.end63
  %70 = load i32, ptr %k31, align 4, !dbg !2193
  %inc65 = add nsw i32 %70, 1, !dbg !2193
  store i32 %inc65, ptr %k31, align 4, !dbg !2193
  br label %for.cond32, !dbg !2194, !llvm.loop !2195

for.end66:                                        ; preds = %for.cond32
  br label %for.inc67, !dbg !2197

for.inc67:                                        ; preds = %for.end66
  %71 = load i32, ptr %c, align 4, !dbg !2198
  %inc68 = add nsw i32 %71, 1, !dbg !2198
  store i32 %inc68, ptr %c, align 4, !dbg !2198
  br label %for.cond27, !dbg !2199, !llvm.loop !2200

for.end69:                                        ; preds = %for.cond27
  %72 = load i32, ptr %i13, align 4, !dbg !2202
  %73 = load i32, ptr %j, align 4, !dbg !2204
  %cmp70 = icmp ne i32 %72, %73, !dbg !2205
  br i1 %cmp70, label %if.then71, label %if.end122, !dbg !2205

if.then71:                                        ; preds = %for.end69
  %74 = load ptr, ptr %VtL.addr, align 4, !dbg !2206
  %75 = load i32, ptr %i13, align 4, !dbg !2208
  %76 = load i32, ptr %m_vec_limbs, align 4, !dbg !2209
  %mul72 = mul nsw i32 %75, %76, !dbg !2210
  %77 = load ptr, ptr %p.addr, align 4, !dbg !2211
  %o73 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %77, i32 0, i32 2, !dbg !2211
  %78 = load i32, ptr %o73, align 4, !dbg !2211
  %mul74 = mul nsw i32 %mul72, %78, !dbg !2212
  %add.ptr75 = getelementptr inbounds i64, ptr %74, i32 %mul74, !dbg !2213
  store ptr %add.ptr75, ptr %Mi, align 4, !dbg !2214
    #dbg_declare(ptr %c76, !2215, !DIExpression(), !2217)
  store i32 0, ptr %c76, align 4, !dbg !2217
  br label %for.cond77, !dbg !2218

for.cond77:                                       ; preds = %for.inc119, %if.then71
  %79 = load i32, ptr %c76, align 4, !dbg !2219
  %80 = load ptr, ptr %p.addr, align 4, !dbg !2221
  %o78 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %80, i32 0, i32 2, !dbg !2221
  %81 = load i32, ptr %o78, align 4, !dbg !2221
  %cmp79 = icmp slt i32 %79, %81, !dbg !2222
  br i1 %cmp79, label %for.body80, label %for.end121, !dbg !2223

for.body80:                                       ; preds = %for.cond77
    #dbg_declare(ptr %k81, !2224, !DIExpression(), !2227)
  store i32 0, ptr %k81, align 4, !dbg !2227
  br label %for.cond82, !dbg !2228

for.cond82:                                       ; preds = %for.inc116, %for.body80
  %82 = load i32, ptr %k81, align 4, !dbg !2229
  %83 = load i32, ptr %m_vec_limbs, align 4, !dbg !2231
  %cmp83 = icmp slt i32 %82, %83, !dbg !2232
  br i1 %cmp83, label %for.body84, label %for.end118, !dbg !2233

for.body84:                                       ; preds = %for.cond82
  %84 = load ptr, ptr %Mi, align 4, !dbg !2234
  %85 = load i32, ptr %k81, align 4, !dbg !2236
  %86 = load i32, ptr %c76, align 4, !dbg !2237
  %87 = load i32, ptr %m_vec_limbs, align 4, !dbg !2238
  %mul85 = mul nsw i32 %86, %87, !dbg !2239
  %add86 = add nsw i32 %85, %mul85, !dbg !2240
  %arrayidx87 = getelementptr inbounds i64, ptr %84, i32 %add86, !dbg !2234
  %88 = load i64, ptr %arrayidx87, align 8, !dbg !2234
  %89 = load i32, ptr %bits_to_shift, align 4, !dbg !2241
  %sh_prom88 = zext i32 %89 to i64, !dbg !2242
  %shl89 = shl i64 %88, %sh_prom88, !dbg !2242
  %90 = load ptr, ptr %p.addr, align 4, !dbg !2243
  %o90 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %90, i32 0, i32 2, !dbg !2243
  %91 = load i32, ptr %o90, align 4, !dbg !2243
  %92 = load i32, ptr %j, align 4, !dbg !2244
  %mul91 = mul nsw i32 %91, %92, !dbg !2245
  %93 = load i32, ptr %c76, align 4, !dbg !2246
  %add92 = add nsw i32 %mul91, %93, !dbg !2247
  %94 = load i32, ptr %k81, align 4, !dbg !2248
  %95 = load i32, ptr %words_to_shift, align 4, !dbg !2249
  %add93 = add nsw i32 %94, %95, !dbg !2250
  %96 = load i32, ptr %A_width, align 4, !dbg !2251
  %mul94 = mul i32 %add93, %96, !dbg !2252
  %add95 = add i32 %add92, %mul94, !dbg !2253
  %arrayidx96 = getelementptr inbounds nuw [3744 x i64], ptr %A, i32 0, i32 %add95, !dbg !2254
  %97 = load i64, ptr %arrayidx96, align 8, !dbg !2255
  %xor97 = xor i64 %97, %shl89, !dbg !2255
  store i64 %xor97, ptr %arrayidx96, align 8, !dbg !2255
  %98 = load i32, ptr %bits_to_shift, align 4, !dbg !2256
  %cmp98 = icmp sgt i32 %98, 0, !dbg !2258
  br i1 %cmp98, label %if.then99, label %if.end115, !dbg !2258

if.then99:                                        ; preds = %for.body84
  %99 = load ptr, ptr %Mi, align 4, !dbg !2259
  %100 = load i32, ptr %k81, align 4, !dbg !2261
  %101 = load i32, ptr %c76, align 4, !dbg !2262
  %102 = load i32, ptr %m_vec_limbs, align 4, !dbg !2263
  %mul100 = mul nsw i32 %101, %102, !dbg !2264
  %add101 = add nsw i32 %100, %mul100, !dbg !2265
  %arrayidx102 = getelementptr inbounds i64, ptr %99, i32 %add101, !dbg !2259
  %103 = load i64, ptr %arrayidx102, align 8, !dbg !2259
  %104 = load i32, ptr %bits_to_shift, align 4, !dbg !2266
  %sub103 = sub nsw i32 64, %104, !dbg !2267
  %sh_prom104 = zext i32 %sub103 to i64, !dbg !2268
  %shr105 = lshr i64 %103, %sh_prom104, !dbg !2268
  %105 = load ptr, ptr %p.addr, align 4, !dbg !2269
  %o106 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %105, i32 0, i32 2, !dbg !2269
  %106 = load i32, ptr %o106, align 4, !dbg !2269
  %107 = load i32, ptr %j, align 4, !dbg !2270
  %mul107 = mul nsw i32 %106, %107, !dbg !2271
  %108 = load i32, ptr %c76, align 4, !dbg !2272
  %add108 = add nsw i32 %mul107, %108, !dbg !2273
  %109 = load i32, ptr %k81, align 4, !dbg !2274
  %110 = load i32, ptr %words_to_shift, align 4, !dbg !2275
  %add109 = add nsw i32 %109, %110, !dbg !2276
  %add110 = add nsw i32 %add109, 1, !dbg !2277
  %111 = load i32, ptr %A_width, align 4, !dbg !2278
  %mul111 = mul i32 %add110, %111, !dbg !2279
  %add112 = add i32 %add108, %mul111, !dbg !2280
  %arrayidx113 = getelementptr inbounds nuw [3744 x i64], ptr %A, i32 0, i32 %add112, !dbg !2281
  %112 = load i64, ptr %arrayidx113, align 8, !dbg !2282
  %xor114 = xor i64 %112, %shr105, !dbg !2282
  store i64 %xor114, ptr %arrayidx113, align 8, !dbg !2282
  br label %if.end115, !dbg !2283

if.end115:                                        ; preds = %if.then99, %for.body84
  br label %for.inc116, !dbg !2284

for.inc116:                                       ; preds = %if.end115
  %113 = load i32, ptr %k81, align 4, !dbg !2285
  %inc117 = add nsw i32 %113, 1, !dbg !2285
  store i32 %inc117, ptr %k81, align 4, !dbg !2285
  br label %for.cond82, !dbg !2286, !llvm.loop !2287

for.end118:                                       ; preds = %for.cond82
  br label %for.inc119, !dbg !2289

for.inc119:                                       ; preds = %for.end118
  %114 = load i32, ptr %c76, align 4, !dbg !2290
  %inc120 = add nsw i32 %114, 1, !dbg !2290
  store i32 %inc120, ptr %c76, align 4, !dbg !2290
  br label %for.cond77, !dbg !2291, !llvm.loop !2292

for.end121:                                       ; preds = %for.cond77
  br label %if.end122, !dbg !2294

if.end122:                                        ; preds = %for.end121, %for.end69
  %115 = load i32, ptr %bits_to_shift, align 4, !dbg !2295
  %add123 = add nsw i32 %115, 4, !dbg !2295
  store i32 %add123, ptr %bits_to_shift, align 4, !dbg !2295
  %116 = load i32, ptr %bits_to_shift, align 4, !dbg !2296
  %cmp124 = icmp eq i32 %116, 64, !dbg !2298
  br i1 %cmp124, label %if.then125, label %if.end127, !dbg !2298

if.then125:                                       ; preds = %if.end122
  %117 = load i32, ptr %words_to_shift, align 4, !dbg !2299
  %inc126 = add nsw i32 %117, 1, !dbg !2299
  store i32 %inc126, ptr %words_to_shift, align 4, !dbg !2299
  store i32 0, ptr %bits_to_shift, align 4, !dbg !2301
  br label %if.end127, !dbg !2302

if.end127:                                        ; preds = %if.then125, %if.end122
  br label %for.inc128, !dbg !2303

for.inc128:                                       ; preds = %if.end127
  %118 = load i32, ptr %j, align 4, !dbg !2304
  %dec = add nsw i32 %118, -1, !dbg !2304
  store i32 %dec, ptr %j, align 4, !dbg !2304
  br label %for.cond21, !dbg !2305, !llvm.loop !2306

for.end129:                                       ; preds = %for.cond21
  br label %for.inc130, !dbg !2308

for.inc130:                                       ; preds = %for.end129
  %119 = load i32, ptr %i13, align 4, !dbg !2309
  %inc131 = add nsw i32 %119, 1, !dbg !2309
  store i32 %inc131, ptr %i13, align 4, !dbg !2309
  br label %for.cond14, !dbg !2310, !llvm.loop !2311

for.end132:                                       ; preds = %for.cond14
    #dbg_declare(ptr %c133, !2313, !DIExpression(), !2315)
  store i32 0, ptr %c133, align 4, !dbg !2315
  br label %for.cond134, !dbg !2316

for.cond134:                                      ; preds = %for.inc148, %for.end132
  %120 = load i32, ptr %c133, align 4, !dbg !2317
  %121 = load i32, ptr %A_width, align 4, !dbg !2319
  %122 = load ptr, ptr %p.addr, align 4, !dbg !2320
  %m135 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %122, i32 0, i32 0, !dbg !2320
  %123 = load i32, ptr %m135, align 4, !dbg !2320
  %124 = load ptr, ptr %p.addr, align 4, !dbg !2321
  %k136 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %124, i32 0, i32 3, !dbg !2321
  %125 = load i32, ptr %k136, align 4, !dbg !2321
  %add137 = add nsw i32 %125, 1, !dbg !2322
  %126 = load ptr, ptr %p.addr, align 4, !dbg !2323
  %k138 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %126, i32 0, i32 3, !dbg !2323
  %127 = load i32, ptr %k138, align 4, !dbg !2323
  %mul139 = mul nsw i32 %add137, %127, !dbg !2324
  %div140 = sdiv i32 %mul139, 2, !dbg !2325
  %add141 = add nsw i32 %123, %div140, !dbg !2326
  %add142 = add nsw i32 %add141, 15, !dbg !2327
  %div143 = sdiv i32 %add142, 16, !dbg !2328
  %mul144 = mul i32 %121, %div143, !dbg !2329
  %cmp145 = icmp ult i32 %120, %mul144, !dbg !2330
  br i1 %cmp145, label %for.body146, label %for.end150, !dbg !2331

for.body146:                                      ; preds = %for.cond134
  %arraydecay = getelementptr inbounds [3744 x i64], ptr %A, i32 0, i32 0, !dbg !2332
  %128 = load i32, ptr %c133, align 4, !dbg !2334
  %add.ptr147 = getelementptr inbounds nuw i64, ptr %arraydecay, i32 %128, !dbg !2335
  call void @transpose_16x16_nibbles(ptr noundef %add.ptr147) #5, !dbg !2336
  br label %for.inc148, !dbg !2337

for.inc148:                                       ; preds = %for.body146
  %129 = load i32, ptr %c133, align 4, !dbg !2338
  %add149 = add i32 %129, 16, !dbg !2338
  store i32 %add149, ptr %c133, align 4, !dbg !2338
  br label %for.cond134, !dbg !2339, !llvm.loop !2340

for.end150:                                       ; preds = %for.cond134
    #dbg_declare(ptr %tab, !2342, !DIExpression(), !2346)
  call void @llvm.memset.p0.i32(ptr align 1 %tab, i8 0, i32 16, i1 false), !dbg !2346
    #dbg_declare(ptr %i151, !2347, !DIExpression(), !2349)
  store i32 0, ptr %i151, align 4, !dbg !2349
  br label %for.cond152, !dbg !2350

for.cond152:                                      ; preds = %for.inc176, %for.end150
  %130 = load i32, ptr %i151, align 4, !dbg !2351
  %cmp153 = icmp ult i32 %130, 4, !dbg !2353
  br i1 %cmp153, label %for.body154, label %for.end178, !dbg !2354

for.body154:                                      ; preds = %for.cond152
  %131 = load ptr, ptr %p.addr, align 4, !dbg !2355
  %f_tail = getelementptr inbounds nuw %struct.mayo_params_t, ptr %131, i32 0, i32 5, !dbg !2355
  %132 = load ptr, ptr %f_tail, align 4, !dbg !2355
  %133 = load i32, ptr %i151, align 4, !dbg !2357
  %arrayidx155 = getelementptr inbounds nuw i8, ptr %132, i32 %133, !dbg !2355
  %134 = load i8, ptr %arrayidx155, align 1, !dbg !2355
  %call = call zeroext i8 @mul_f(i8 noundef zeroext %134, i8 noundef zeroext 1) #5, !dbg !2358
  %135 = load i32, ptr %i151, align 4, !dbg !2359
  %mul156 = mul i32 4, %135, !dbg !2360
  %arrayidx157 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %mul156, !dbg !2361
  store i8 %call, ptr %arrayidx157, align 1, !dbg !2362
  %136 = load ptr, ptr %p.addr, align 4, !dbg !2363
  %f_tail158 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %136, i32 0, i32 5, !dbg !2363
  %137 = load ptr, ptr %f_tail158, align 4, !dbg !2363
  %138 = load i32, ptr %i151, align 4, !dbg !2364
  %arrayidx159 = getelementptr inbounds nuw i8, ptr %137, i32 %138, !dbg !2363
  %139 = load i8, ptr %arrayidx159, align 1, !dbg !2363
  %call160 = call zeroext i8 @mul_f(i8 noundef zeroext %139, i8 noundef zeroext 2) #5, !dbg !2365
  %140 = load i32, ptr %i151, align 4, !dbg !2366
  %mul161 = mul i32 4, %140, !dbg !2367
  %add162 = add i32 %mul161, 1, !dbg !2368
  %arrayidx163 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add162, !dbg !2369
  store i8 %call160, ptr %arrayidx163, align 1, !dbg !2370
  %141 = load ptr, ptr %p.addr, align 4, !dbg !2371
  %f_tail164 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %141, i32 0, i32 5, !dbg !2371
  %142 = load ptr, ptr %f_tail164, align 4, !dbg !2371
  %143 = load i32, ptr %i151, align 4, !dbg !2372
  %arrayidx165 = getelementptr inbounds nuw i8, ptr %142, i32 %143, !dbg !2371
  %144 = load i8, ptr %arrayidx165, align 1, !dbg !2371
  %call166 = call zeroext i8 @mul_f(i8 noundef zeroext %144, i8 noundef zeroext 4) #5, !dbg !2373
  %145 = load i32, ptr %i151, align 4, !dbg !2374
  %mul167 = mul i32 4, %145, !dbg !2375
  %add168 = add i32 %mul167, 2, !dbg !2376
  %arrayidx169 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add168, !dbg !2377
  store i8 %call166, ptr %arrayidx169, align 1, !dbg !2378
  %146 = load ptr, ptr %p.addr, align 4, !dbg !2379
  %f_tail170 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %146, i32 0, i32 5, !dbg !2379
  %147 = load ptr, ptr %f_tail170, align 4, !dbg !2379
  %148 = load i32, ptr %i151, align 4, !dbg !2380
  %arrayidx171 = getelementptr inbounds nuw i8, ptr %147, i32 %148, !dbg !2379
  %149 = load i8, ptr %arrayidx171, align 1, !dbg !2379
  %call172 = call zeroext i8 @mul_f(i8 noundef zeroext %149, i8 noundef zeroext 8) #5, !dbg !2381
  %150 = load i32, ptr %i151, align 4, !dbg !2382
  %mul173 = mul i32 4, %150, !dbg !2383
  %add174 = add i32 %mul173, 3, !dbg !2384
  %arrayidx175 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add174, !dbg !2385
  store i8 %call172, ptr %arrayidx175, align 1, !dbg !2386
  br label %for.inc176, !dbg !2387

for.inc176:                                       ; preds = %for.body154
  %151 = load i32, ptr %i151, align 4, !dbg !2388
  %inc177 = add i32 %151, 1, !dbg !2388
  store i32 %inc177, ptr %i151, align 4, !dbg !2388
  br label %for.cond152, !dbg !2389, !llvm.loop !2390

for.end178:                                       ; preds = %for.cond152
    #dbg_declare(ptr %low_bit_in_nibble, !2392, !DIExpression(), !2393)
  store i64 1229782938247303441, ptr %low_bit_in_nibble, align 8, !dbg !2393
    #dbg_declare(ptr %c179, !2394, !DIExpression(), !2396)
  store i32 0, ptr %c179, align 4, !dbg !2396
  br label %for.cond180, !dbg !2397

for.cond180:                                      ; preds = %for.inc254, %for.end178
  %152 = load i32, ptr %c179, align 4, !dbg !2398
  %153 = load i32, ptr %A_width, align 4, !dbg !2400
  %cmp181 = icmp ult i32 %152, %153, !dbg !2401
  br i1 %cmp181, label %for.body182, label %for.end256, !dbg !2402

for.body182:                                      ; preds = %for.cond180
    #dbg_declare(ptr %r, !2403, !DIExpression(), !2406)
  %154 = load ptr, ptr %p.addr, align 4, !dbg !2407
  %m183 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %154, i32 0, i32 0, !dbg !2407
  %155 = load i32, ptr %m183, align 4, !dbg !2407
  store i32 %155, ptr %r, align 4, !dbg !2406
  br label %for.cond184, !dbg !2408

for.cond184:                                      ; preds = %for.inc251, %for.body182
  %156 = load i32, ptr %r, align 4, !dbg !2409
  %157 = load ptr, ptr %p.addr, align 4, !dbg !2411
  %m185 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %157, i32 0, i32 0, !dbg !2411
  %158 = load i32, ptr %m185, align 4, !dbg !2411
  %159 = load ptr, ptr %p.addr, align 4, !dbg !2412
  %k186 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %159, i32 0, i32 3, !dbg !2412
  %160 = load i32, ptr %k186, align 4, !dbg !2412
  %add187 = add nsw i32 %160, 1, !dbg !2413
  %161 = load ptr, ptr %p.addr, align 4, !dbg !2414
  %k188 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %161, i32 0, i32 3, !dbg !2414
  %162 = load i32, ptr %k188, align 4, !dbg !2414
  %mul189 = mul nsw i32 %add187, %162, !dbg !2415
  %div190 = sdiv i32 %mul189, 2, !dbg !2416
  %add191 = add nsw i32 %158, %div190, !dbg !2417
  %cmp192 = icmp slt i32 %156, %add191, !dbg !2418
  br i1 %cmp192, label %for.body193, label %for.end253, !dbg !2419

for.body193:                                      ; preds = %for.cond184
    #dbg_declare(ptr %pos, !2420, !DIExpression(), !2422)
  %163 = load i32, ptr %r, align 4, !dbg !2423
  %div194 = sdiv i32 %163, 16, !dbg !2424
  %164 = load i32, ptr %A_width, align 4, !dbg !2425
  %mul195 = mul i32 %div194, %164, !dbg !2426
  %165 = load i32, ptr %c179, align 4, !dbg !2427
  %add196 = add i32 %mul195, %165, !dbg !2428
  %166 = load i32, ptr %r, align 4, !dbg !2429
  %rem197 = srem i32 %166, 16, !dbg !2430
  %add198 = add i32 %add196, %rem197, !dbg !2431
  store i32 %add198, ptr %pos, align 4, !dbg !2422
    #dbg_declare(ptr %t0, !2432, !DIExpression(), !2433)
  %167 = load i32, ptr %pos, align 4, !dbg !2434
  %arrayidx199 = getelementptr inbounds nuw [3744 x i64], ptr %A, i32 0, i32 %167, !dbg !2435
  %168 = load i64, ptr %arrayidx199, align 8, !dbg !2435
  %169 = load i64, ptr %low_bit_in_nibble, align 8, !dbg !2436
  %and200 = and i64 %168, %169, !dbg !2437
  store i64 %and200, ptr %t0, align 8, !dbg !2433
    #dbg_declare(ptr %t1, !2438, !DIExpression(), !2439)
  %170 = load i32, ptr %pos, align 4, !dbg !2440
  %arrayidx201 = getelementptr inbounds nuw [3744 x i64], ptr %A, i32 0, i32 %170, !dbg !2441
  %171 = load i64, ptr %arrayidx201, align 8, !dbg !2441
  %shr202 = lshr i64 %171, 1, !dbg !2442
  %172 = load i64, ptr %low_bit_in_nibble, align 8, !dbg !2443
  %and203 = and i64 %shr202, %172, !dbg !2444
  store i64 %and203, ptr %t1, align 8, !dbg !2439
    #dbg_declare(ptr %t2, !2445, !DIExpression(), !2446)
  %173 = load i32, ptr %pos, align 4, !dbg !2447
  %arrayidx204 = getelementptr inbounds nuw [3744 x i64], ptr %A, i32 0, i32 %173, !dbg !2448
  %174 = load i64, ptr %arrayidx204, align 8, !dbg !2448
  %shr205 = lshr i64 %174, 2, !dbg !2449
  %175 = load i64, ptr %low_bit_in_nibble, align 8, !dbg !2450
  %and206 = and i64 %shr205, %175, !dbg !2451
  store i64 %and206, ptr %t2, align 8, !dbg !2446
    #dbg_declare(ptr %t3, !2452, !DIExpression(), !2453)
  %176 = load i32, ptr %pos, align 4, !dbg !2454
  %arrayidx207 = getelementptr inbounds nuw [3744 x i64], ptr %A, i32 0, i32 %176, !dbg !2455
  %177 = load i64, ptr %arrayidx207, align 8, !dbg !2455
  %shr208 = lshr i64 %177, 3, !dbg !2456
  %178 = load i64, ptr %low_bit_in_nibble, align 8, !dbg !2457
  %and209 = and i64 %shr208, %178, !dbg !2458
  store i64 %and209, ptr %t3, align 8, !dbg !2453
    #dbg_declare(ptr %t, !2459, !DIExpression(), !2461)
  store i32 0, ptr %t, align 4, !dbg !2461
  br label %for.cond210, !dbg !2462

for.cond210:                                      ; preds = %for.inc248, %for.body193
  %179 = load i32, ptr %t, align 4, !dbg !2463
  %cmp211 = icmp ult i32 %179, 4, !dbg !2465
  br i1 %cmp211, label %for.body212, label %for.end250, !dbg !2466

for.body212:                                      ; preds = %for.cond210
  %180 = load i64, ptr %t0, align 8, !dbg !2467
  %181 = load i32, ptr %t, align 4, !dbg !2469
  %mul213 = mul i32 4, %181, !dbg !2470
  %add214 = add i32 %mul213, 0, !dbg !2471
  %arrayidx215 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add214, !dbg !2472
  %182 = load i8, ptr %arrayidx215, align 1, !dbg !2472
  %conv = zext i8 %182 to i64, !dbg !2472
  %mul216 = mul i64 %180, %conv, !dbg !2473
  %183 = load i64, ptr %t1, align 8, !dbg !2474
  %184 = load i32, ptr %t, align 4, !dbg !2475
  %mul217 = mul i32 4, %184, !dbg !2476
  %add218 = add i32 %mul217, 1, !dbg !2477
  %arrayidx219 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add218, !dbg !2478
  %185 = load i8, ptr %arrayidx219, align 1, !dbg !2478
  %conv220 = zext i8 %185 to i64, !dbg !2478
  %mul221 = mul i64 %183, %conv220, !dbg !2479
  %xor222 = xor i64 %mul216, %mul221, !dbg !2480
  %186 = load i64, ptr %t2, align 8, !dbg !2481
  %187 = load i32, ptr %t, align 4, !dbg !2482
  %mul223 = mul i32 4, %187, !dbg !2483
  %add224 = add i32 %mul223, 2, !dbg !2484
  %arrayidx225 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add224, !dbg !2485
  %188 = load i8, ptr %arrayidx225, align 1, !dbg !2485
  %conv226 = zext i8 %188 to i64, !dbg !2485
  %mul227 = mul i64 %186, %conv226, !dbg !2486
  %xor228 = xor i64 %xor222, %mul227, !dbg !2487
  %189 = load i64, ptr %t3, align 8, !dbg !2488
  %190 = load i32, ptr %t, align 4, !dbg !2489
  %mul229 = mul i32 4, %190, !dbg !2490
  %add230 = add i32 %mul229, 3, !dbg !2491
  %arrayidx231 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add230, !dbg !2492
  %191 = load i8, ptr %arrayidx231, align 1, !dbg !2492
  %conv232 = zext i8 %191 to i64, !dbg !2492
  %mul233 = mul i64 %189, %conv232, !dbg !2493
  %xor234 = xor i64 %xor228, %mul233, !dbg !2494
  %192 = load i32, ptr %r, align 4, !dbg !2495
  %193 = load i32, ptr %t, align 4, !dbg !2496
  %add235 = add i32 %192, %193, !dbg !2497
  %194 = load ptr, ptr %p.addr, align 4, !dbg !2498
  %m236 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %194, i32 0, i32 0, !dbg !2498
  %195 = load i32, ptr %m236, align 4, !dbg !2498
  %sub237 = sub i32 %add235, %195, !dbg !2499
  %div238 = udiv i32 %sub237, 16, !dbg !2500
  %196 = load i32, ptr %A_width, align 4, !dbg !2501
  %mul239 = mul i32 %div238, %196, !dbg !2502
  %197 = load i32, ptr %c179, align 4, !dbg !2503
  %add240 = add i32 %mul239, %197, !dbg !2504
  %198 = load i32, ptr %r, align 4, !dbg !2505
  %199 = load i32, ptr %t, align 4, !dbg !2506
  %add241 = add i32 %198, %199, !dbg !2507
  %200 = load ptr, ptr %p.addr, align 4, !dbg !2508
  %m242 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %200, i32 0, i32 0, !dbg !2508
  %201 = load i32, ptr %m242, align 4, !dbg !2508
  %sub243 = sub i32 %add241, %201, !dbg !2509
  %rem244 = urem i32 %sub243, 16, !dbg !2510
  %add245 = add i32 %add240, %rem244, !dbg !2511
  %arrayidx246 = getelementptr inbounds nuw [3744 x i64], ptr %A, i32 0, i32 %add245, !dbg !2512
  %202 = load i64, ptr %arrayidx246, align 8, !dbg !2513
  %xor247 = xor i64 %202, %xor234, !dbg !2513
  store i64 %xor247, ptr %arrayidx246, align 8, !dbg !2513
  br label %for.inc248, !dbg !2514

for.inc248:                                       ; preds = %for.body212
  %203 = load i32, ptr %t, align 4, !dbg !2515
  %inc249 = add i32 %203, 1, !dbg !2515
  store i32 %inc249, ptr %t, align 4, !dbg !2515
  br label %for.cond210, !dbg !2516, !llvm.loop !2517

for.end250:                                       ; preds = %for.cond210
  br label %for.inc251, !dbg !2519

for.inc251:                                       ; preds = %for.end250
  %204 = load i32, ptr %r, align 4, !dbg !2520
  %inc252 = add nsw i32 %204, 1, !dbg !2520
  store i32 %inc252, ptr %r, align 4, !dbg !2520
  br label %for.cond184, !dbg !2521, !llvm.loop !2522

for.end253:                                       ; preds = %for.cond184
  br label %for.inc254, !dbg !2524

for.inc254:                                       ; preds = %for.end253
  %205 = load i32, ptr %c179, align 4, !dbg !2525
  %add255 = add i32 %205, 16, !dbg !2525
  store i32 %add255, ptr %c179, align 4, !dbg !2525
  br label %for.cond180, !dbg !2526, !llvm.loop !2527

for.end256:                                       ; preds = %for.cond180
    #dbg_declare(ptr %r257, !2529, !DIExpression(), !2531)
  store i32 0, ptr %r257, align 4, !dbg !2531
  br label %for.cond258, !dbg !2532

for.cond258:                                      ; preds = %for.inc313, %for.end256
  %206 = load i32, ptr %r257, align 4, !dbg !2533
  %207 = load ptr, ptr %p.addr, align 4, !dbg !2535
  %m259 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %207, i32 0, i32 0, !dbg !2535
  %208 = load i32, ptr %m259, align 4, !dbg !2535
  %cmp260 = icmp slt i32 %206, %208, !dbg !2536
  br i1 %cmp260, label %for.body262, label %for.end315, !dbg !2537

for.body262:                                      ; preds = %for.cond258
    #dbg_declare(ptr %c263, !2538, !DIExpression(), !2541)
  store i32 0, ptr %c263, align 4, !dbg !2541
  br label %for.cond264, !dbg !2542

for.cond264:                                      ; preds = %for.inc310, %for.body262
  %209 = load i32, ptr %c263, align 4, !dbg !2543
  %210 = load ptr, ptr %p.addr, align 4, !dbg !2545
  %k265 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %210, i32 0, i32 3, !dbg !2545
  %211 = load i32, ptr %k265, align 4, !dbg !2545
  %212 = load ptr, ptr %p.addr, align 4, !dbg !2545
  %o266 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %212, i32 0, i32 2, !dbg !2545
  %213 = load i32, ptr %o266, align 4, !dbg !2545
  %mul267 = mul nsw i32 %211, %213, !dbg !2545
  %add268 = add nsw i32 %mul267, 1, !dbg !2545
  %sub269 = sub nsw i32 %add268, 1, !dbg !2546
  %cmp270 = icmp slt i32 %209, %sub269, !dbg !2547
  br i1 %cmp270, label %for.body272, label %for.end312, !dbg !2548

for.body272:                                      ; preds = %for.cond264
    #dbg_declare(ptr %i273, !2549, !DIExpression(), !2552)
  store i32 0, ptr %i273, align 4, !dbg !2552
  br label %for.cond274, !dbg !2553

for.cond274:                                      ; preds = %for.inc307, %for.body272
  %214 = load i32, ptr %i273, align 4, !dbg !2554
  %215 = load i32, ptr %r257, align 4, !dbg !2556
  %add275 = add nsw i32 %214, %215, !dbg !2557
  %216 = load ptr, ptr %p.addr, align 4, !dbg !2558
  %m276 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %216, i32 0, i32 0, !dbg !2558
  %217 = load i32, ptr %m276, align 4, !dbg !2558
  %cmp277 = icmp slt i32 %add275, %217, !dbg !2559
  br i1 %cmp277, label %for.body279, label %for.end309, !dbg !2560

for.body279:                                      ; preds = %for.cond274
  %218 = load i32, ptr %r257, align 4, !dbg !2561
  %219 = load i32, ptr %A_width, align 4, !dbg !2563
  %mul280 = mul i32 %218, %219, !dbg !2564
  %div281 = udiv i32 %mul280, 16, !dbg !2565
  %220 = load i32, ptr %c263, align 4, !dbg !2566
  %add282 = add i32 %div281, %220, !dbg !2567
  %221 = load i32, ptr %i273, align 4, !dbg !2568
  %add283 = add i32 %add282, %221, !dbg !2569
  %arrayidx284 = getelementptr inbounds nuw [3744 x i64], ptr %A, i32 0, i32 %add283, !dbg !2570
  %222 = load ptr, ptr %A_out.addr, align 4, !dbg !2571
  %223 = load ptr, ptr %p.addr, align 4, !dbg !2572
  %k285 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %223, i32 0, i32 3, !dbg !2572
  %224 = load i32, ptr %k285, align 4, !dbg !2572
  %225 = load ptr, ptr %p.addr, align 4, !dbg !2572
  %o286 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %225, i32 0, i32 2, !dbg !2572
  %226 = load i32, ptr %o286, align 4, !dbg !2572
  %mul287 = mul nsw i32 %224, %226, !dbg !2572
  %add288 = add nsw i32 %mul287, 1, !dbg !2572
  %227 = load i32, ptr %r257, align 4, !dbg !2573
  %228 = load i32, ptr %i273, align 4, !dbg !2574
  %add289 = add nsw i32 %227, %228, !dbg !2575
  %mul290 = mul nsw i32 %add288, %add289, !dbg !2576
  %add.ptr291 = getelementptr inbounds i8, ptr %222, i32 %mul290, !dbg !2577
  %229 = load i32, ptr %c263, align 4, !dbg !2578
  %add.ptr292 = getelementptr inbounds i8, ptr %add.ptr291, i32 %229, !dbg !2579
  %230 = load ptr, ptr %p.addr, align 4, !dbg !2580
  %k293 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %230, i32 0, i32 3, !dbg !2580
  %231 = load i32, ptr %k293, align 4, !dbg !2580
  %232 = load ptr, ptr %p.addr, align 4, !dbg !2580
  %o294 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %232, i32 0, i32 2, !dbg !2580
  %233 = load i32, ptr %o294, align 4, !dbg !2580
  %mul295 = mul nsw i32 %231, %233, !dbg !2580
  %add296 = add nsw i32 %mul295, 1, !dbg !2580
  %sub297 = sub nsw i32 %add296, 1, !dbg !2580
  %234 = load i32, ptr %c263, align 4, !dbg !2580
  %sub298 = sub nsw i32 %sub297, %234, !dbg !2580
  %cmp299 = icmp slt i32 16, %sub298, !dbg !2580
  br i1 %cmp299, label %cond.true, label %cond.false, !dbg !2580

cond.true:                                        ; preds = %for.body279
  br label %cond.end, !dbg !2580

cond.false:                                       ; preds = %for.body279
  %235 = load ptr, ptr %p.addr, align 4, !dbg !2580
  %k301 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %235, i32 0, i32 3, !dbg !2580
  %236 = load i32, ptr %k301, align 4, !dbg !2580
  %237 = load ptr, ptr %p.addr, align 4, !dbg !2580
  %o302 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %237, i32 0, i32 2, !dbg !2580
  %238 = load i32, ptr %o302, align 4, !dbg !2580
  %mul303 = mul nsw i32 %236, %238, !dbg !2580
  %add304 = add nsw i32 %mul303, 1, !dbg !2580
  %sub305 = sub nsw i32 %add304, 1, !dbg !2580
  %239 = load i32, ptr %c263, align 4, !dbg !2580
  %sub306 = sub nsw i32 %sub305, %239, !dbg !2580
  br label %cond.end, !dbg !2580

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 16, %cond.true ], [ %sub306, %cond.false ], !dbg !2580
  call void @decode(ptr noundef %arrayidx284, ptr noundef %add.ptr292, i32 noundef %cond) #5, !dbg !2581
  br label %for.inc307, !dbg !2582

for.inc307:                                       ; preds = %cond.end
  %240 = load i32, ptr %i273, align 4, !dbg !2583
  %inc308 = add nsw i32 %240, 1, !dbg !2583
  store i32 %inc308, ptr %i273, align 4, !dbg !2583
  br label %for.cond274, !dbg !2584, !llvm.loop !2585

for.end309:                                       ; preds = %for.cond274
  br label %for.inc310, !dbg !2587

for.inc310:                                       ; preds = %for.end309
  %241 = load i32, ptr %c263, align 4, !dbg !2588
  %add311 = add nsw i32 %241, 16, !dbg !2588
  store i32 %add311, ptr %c263, align 4, !dbg !2588
  br label %for.cond264, !dbg !2589, !llvm.loop !2590

for.end312:                                       ; preds = %for.cond264
  br label %for.inc313, !dbg !2592

for.inc313:                                       ; preds = %for.end312
  %242 = load i32, ptr %r257, align 4, !dbg !2593
  %add314 = add nsw i32 %242, 16, !dbg !2593
  store i32 %add314, ptr %r257, align 4, !dbg !2593
  br label %for.cond258, !dbg !2594, !llvm.loop !2595

for.end315:                                       ; preds = %for.cond258
  ret void, !dbg !2597
}

declare dso_local ptr @memset(ptr noundef, i32 noundef, i32 noundef) #4

; Function Attrs: noinline nounwind optnone
define internal void @mat_mul(ptr noundef %a, ptr noundef %b, ptr noundef %c, i32 noundef %colrow_ab, i32 noundef %row_a, i32 noundef %col_b) #0 !dbg !2598 {
entry:
  %a.addr = alloca ptr, align 4
  %b.addr = alloca ptr, align 4
  %c.addr = alloca ptr, align 4
  %colrow_ab.addr = alloca i32, align 4
  %row_a.addr = alloca i32, align 4
  %col_b.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store ptr %a, ptr %a.addr, align 4
    #dbg_declare(ptr %a.addr, !2601, !DIExpression(), !2602)
  store ptr %b, ptr %b.addr, align 4
    #dbg_declare(ptr %b.addr, !2603, !DIExpression(), !2604)
  store ptr %c, ptr %c.addr, align 4
    #dbg_declare(ptr %c.addr, !2605, !DIExpression(), !2606)
  store i32 %colrow_ab, ptr %colrow_ab.addr, align 4
    #dbg_declare(ptr %colrow_ab.addr, !2607, !DIExpression(), !2608)
  store i32 %row_a, ptr %row_a.addr, align 4
    #dbg_declare(ptr %row_a.addr, !2609, !DIExpression(), !2610)
  store i32 %col_b, ptr %col_b.addr, align 4
    #dbg_declare(ptr %col_b.addr, !2611, !DIExpression(), !2612)
    #dbg_declare(ptr %i, !2613, !DIExpression(), !2615)
  store i32 0, ptr %i, align 4, !dbg !2615
  br label %for.cond, !dbg !2616

for.cond:                                         ; preds = %for.inc4, %entry
  %0 = load i32, ptr %i, align 4, !dbg !2617
  %1 = load i32, ptr %row_a.addr, align 4, !dbg !2619
  %cmp = icmp slt i32 %0, %1, !dbg !2620
  br i1 %cmp, label %for.body, label %for.end7, !dbg !2621

for.body:                                         ; preds = %for.cond
    #dbg_declare(ptr %j, !2622, !DIExpression(), !2625)
  store i32 0, ptr %j, align 4, !dbg !2625
  br label %for.cond1, !dbg !2626

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, ptr %j, align 4, !dbg !2627
  %3 = load i32, ptr %col_b.addr, align 4, !dbg !2629
  %cmp2 = icmp slt i32 %2, %3, !dbg !2630
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !2631

for.body3:                                        ; preds = %for.cond1
  %4 = load ptr, ptr %a.addr, align 4, !dbg !2632
  %5 = load ptr, ptr %b.addr, align 4, !dbg !2634
  %6 = load i32, ptr %j, align 4, !dbg !2635
  %add.ptr = getelementptr inbounds i8, ptr %5, i32 %6, !dbg !2636
  %7 = load i32, ptr %colrow_ab.addr, align 4, !dbg !2637
  %8 = load i32, ptr %col_b.addr, align 4, !dbg !2638
  %call = call zeroext i8 @lincomb(ptr noundef %4, ptr noundef %add.ptr, i32 noundef %7, i32 noundef %8) #5, !dbg !2639
  %9 = load ptr, ptr %c.addr, align 4, !dbg !2640
  store i8 %call, ptr %9, align 1, !dbg !2641
  br label %for.inc, !dbg !2642

for.inc:                                          ; preds = %for.body3
  %10 = load i32, ptr %j, align 4, !dbg !2643
  %inc = add nsw i32 %10, 1, !dbg !2643
  store i32 %inc, ptr %j, align 4, !dbg !2643
  %11 = load ptr, ptr %c.addr, align 4, !dbg !2644
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %11, i32 1, !dbg !2644
  store ptr %incdec.ptr, ptr %c.addr, align 4, !dbg !2644
  br label %for.cond1, !dbg !2645, !llvm.loop !2646

for.end:                                          ; preds = %for.cond1
  br label %for.inc4, !dbg !2648

for.inc4:                                         ; preds = %for.end
  %12 = load i32, ptr %i, align 4, !dbg !2649
  %inc5 = add nsw i32 %12, 1, !dbg !2649
  store i32 %inc5, ptr %i, align 4, !dbg !2649
  %13 = load i32, ptr %colrow_ab.addr, align 4, !dbg !2650
  %14 = load ptr, ptr %a.addr, align 4, !dbg !2651
  %add.ptr6 = getelementptr inbounds i8, ptr %14, i32 %13, !dbg !2651
  store ptr %add.ptr6, ptr %a.addr, align 4, !dbg !2651
  br label %for.cond, !dbg !2652, !llvm.loop !2653

for.end7:                                         ; preds = %for.cond
  ret void, !dbg !2655
}

; Function Attrs: noinline nounwind optnone
define internal void @mat_add(ptr noundef %a, ptr noundef %b, ptr noundef %c, i32 noundef %m, i32 noundef %n) #0 !dbg !2656 {
entry:
  %a.addr = alloca ptr, align 4
  %b.addr = alloca ptr, align 4
  %c.addr = alloca ptr, align 4
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store ptr %a, ptr %a.addr, align 4
    #dbg_declare(ptr %a.addr, !2659, !DIExpression(), !2660)
  store ptr %b, ptr %b.addr, align 4
    #dbg_declare(ptr %b.addr, !2661, !DIExpression(), !2662)
  store ptr %c, ptr %c.addr, align 4
    #dbg_declare(ptr %c.addr, !2663, !DIExpression(), !2664)
  store i32 %m, ptr %m.addr, align 4
    #dbg_declare(ptr %m.addr, !2665, !DIExpression(), !2666)
  store i32 %n, ptr %n.addr, align 4
    #dbg_declare(ptr %n.addr, !2667, !DIExpression(), !2668)
    #dbg_declare(ptr %i, !2669, !DIExpression(), !2671)
  store i32 0, ptr %i, align 4, !dbg !2671
  br label %for.cond, !dbg !2672

for.cond:                                         ; preds = %for.inc11, %entry
  %0 = load i32, ptr %i, align 4, !dbg !2673
  %1 = load i32, ptr %m.addr, align 4, !dbg !2675
  %cmp = icmp slt i32 %0, %1, !dbg !2676
  br i1 %cmp, label %for.body, label %for.end13, !dbg !2677

for.body:                                         ; preds = %for.cond
    #dbg_declare(ptr %j, !2678, !DIExpression(), !2681)
  store i32 0, ptr %j, align 4, !dbg !2681
  br label %for.cond1, !dbg !2682

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, ptr %j, align 4, !dbg !2683
  %3 = load i32, ptr %n.addr, align 4, !dbg !2685
  %cmp2 = icmp slt i32 %2, %3, !dbg !2686
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !2687

for.body3:                                        ; preds = %for.cond1
  %4 = load ptr, ptr %a.addr, align 4, !dbg !2688
  %5 = load i32, ptr %i, align 4, !dbg !2690
  %6 = load i32, ptr %n.addr, align 4, !dbg !2691
  %mul = mul nsw i32 %5, %6, !dbg !2692
  %add.ptr = getelementptr inbounds i8, ptr %4, i32 %mul, !dbg !2693
  %7 = load i32, ptr %j, align 4, !dbg !2694
  %add.ptr4 = getelementptr inbounds i8, ptr %add.ptr, i32 %7, !dbg !2695
  %8 = load i8, ptr %add.ptr4, align 1, !dbg !2696
  %9 = load ptr, ptr %b.addr, align 4, !dbg !2697
  %10 = load i32, ptr %i, align 4, !dbg !2698
  %11 = load i32, ptr %n.addr, align 4, !dbg !2699
  %mul5 = mul nsw i32 %10, %11, !dbg !2700
  %add.ptr6 = getelementptr inbounds i8, ptr %9, i32 %mul5, !dbg !2701
  %12 = load i32, ptr %j, align 4, !dbg !2702
  %add.ptr7 = getelementptr inbounds i8, ptr %add.ptr6, i32 %12, !dbg !2703
  %13 = load i8, ptr %add.ptr7, align 1, !dbg !2704
  %call = call zeroext i8 @add_f(i8 noundef zeroext %8, i8 noundef zeroext %13) #5, !dbg !2705
  %14 = load ptr, ptr %c.addr, align 4, !dbg !2706
  %15 = load i32, ptr %i, align 4, !dbg !2707
  %16 = load i32, ptr %n.addr, align 4, !dbg !2708
  %mul8 = mul nsw i32 %15, %16, !dbg !2709
  %add.ptr9 = getelementptr inbounds i8, ptr %14, i32 %mul8, !dbg !2710
  %17 = load i32, ptr %j, align 4, !dbg !2711
  %add.ptr10 = getelementptr inbounds i8, ptr %add.ptr9, i32 %17, !dbg !2712
  store i8 %call, ptr %add.ptr10, align 1, !dbg !2713
  br label %for.inc, !dbg !2714

for.inc:                                          ; preds = %for.body3
  %18 = load i32, ptr %j, align 4, !dbg !2715
  %inc = add nsw i32 %18, 1, !dbg !2715
  store i32 %inc, ptr %j, align 4, !dbg !2715
  br label %for.cond1, !dbg !2716, !llvm.loop !2717

for.end:                                          ; preds = %for.cond1
  br label %for.inc11, !dbg !2719

for.inc11:                                        ; preds = %for.end
  %19 = load i32, ptr %i, align 4, !dbg !2720
  %inc12 = add nsw i32 %19, 1, !dbg !2720
  store i32 %inc12, ptr %i, align 4, !dbg !2720
  br label %for.cond, !dbg !2721, !llvm.loop !2722

for.end13:                                        ; preds = %for.cond
  ret void, !dbg !2724
}

; Function Attrs: noinline nounwind optnone
define internal void @encode(ptr noundef %m, ptr noundef %menc, i32 noundef %mlen) #0 !dbg !2725 {
entry:
  %m.addr = alloca ptr, align 4
  %menc.addr = alloca ptr, align 4
  %mlen.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store ptr %m, ptr %m.addr, align 4
    #dbg_declare(ptr %m.addr, !2726, !DIExpression(), !2727)
  store ptr %menc, ptr %menc.addr, align 4
    #dbg_declare(ptr %menc.addr, !2728, !DIExpression(), !2729)
  store i32 %mlen, ptr %mlen.addr, align 4
    #dbg_declare(ptr %mlen.addr, !2730, !DIExpression(), !2731)
    #dbg_declare(ptr %i, !2732, !DIExpression(), !2733)
  store i32 0, ptr %i, align 4, !dbg !2734
  br label %for.cond, !dbg !2736

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4, !dbg !2737
  %1 = load i32, ptr %mlen.addr, align 4, !dbg !2739
  %div = sdiv i32 %1, 2, !dbg !2740
  %cmp = icmp slt i32 %0, %div, !dbg !2741
  br i1 %cmp, label %for.body, label %for.end, !dbg !2742

for.body:                                         ; preds = %for.cond
  %2 = load ptr, ptr %m.addr, align 4, !dbg !2743
  %3 = load i8, ptr %2, align 1, !dbg !2745
  %conv = zext i8 %3 to i32, !dbg !2746
  %4 = load ptr, ptr %m.addr, align 4, !dbg !2747
  %add.ptr = getelementptr inbounds i8, ptr %4, i32 1, !dbg !2748
  %5 = load i8, ptr %add.ptr, align 1, !dbg !2749
  %conv1 = zext i8 %5 to i32, !dbg !2749
  %shl = shl i32 %conv1, 4, !dbg !2750
  %or = or i32 %conv, %shl, !dbg !2751
  %conv2 = trunc i32 %or to i8, !dbg !2746
  %6 = load ptr, ptr %menc.addr, align 4, !dbg !2752
  %7 = load i32, ptr %i, align 4, !dbg !2753
  %arrayidx = getelementptr inbounds i8, ptr %6, i32 %7, !dbg !2752
  store i8 %conv2, ptr %arrayidx, align 1, !dbg !2754
  br label %for.inc, !dbg !2755

for.inc:                                          ; preds = %for.body
  %8 = load i32, ptr %i, align 4, !dbg !2756
  %inc = add nsw i32 %8, 1, !dbg !2756
  store i32 %inc, ptr %i, align 4, !dbg !2756
  %9 = load ptr, ptr %m.addr, align 4, !dbg !2757
  %add.ptr3 = getelementptr inbounds i8, ptr %9, i32 2, !dbg !2757
  store ptr %add.ptr3, ptr %m.addr, align 4, !dbg !2757
  br label %for.cond, !dbg !2758, !llvm.loop !2759

for.end:                                          ; preds = %for.cond
  %10 = load i32, ptr %mlen.addr, align 4, !dbg !2761
  %rem = srem i32 %10, 2, !dbg !2763
  %cmp4 = icmp eq i32 %rem, 1, !dbg !2764
  br i1 %cmp4, label %if.then, label %if.end, !dbg !2764

if.then:                                          ; preds = %for.end
  %11 = load ptr, ptr %m.addr, align 4, !dbg !2765
  %12 = load i8, ptr %11, align 1, !dbg !2767
  %13 = load ptr, ptr %menc.addr, align 4, !dbg !2768
  %14 = load i32, ptr %i, align 4, !dbg !2769
  %arrayidx6 = getelementptr inbounds i8, ptr %13, i32 %14, !dbg !2768
  store i8 %12, ptr %arrayidx6, align 1, !dbg !2770
  br label %if.end, !dbg !2771

if.end:                                           ; preds = %if.then, %for.end
  ret void, !dbg !2772
}

; Function Attrs: noinline nounwind optnone
define internal zeroext i8 @add_f(i8 noundef zeroext %a, i8 noundef zeroext %b) #0 !dbg !2773 {
entry:
  %a.addr = alloca i8, align 1
  %b.addr = alloca i8, align 1
  store i8 %a, ptr %a.addr, align 1
    #dbg_declare(ptr %a.addr, !2776, !DIExpression(), !2777)
  store i8 %b, ptr %b.addr, align 1
    #dbg_declare(ptr %b.addr, !2778, !DIExpression(), !2779)
  %0 = load i8, ptr %a.addr, align 1, !dbg !2780
  %conv = zext i8 %0 to i32, !dbg !2780
  %1 = load i8, ptr %b.addr, align 1, !dbg !2781
  %conv1 = zext i8 %1 to i32, !dbg !2781
  %xor = xor i32 %conv, %conv1, !dbg !2782
  %conv2 = trunc i32 %xor to i8, !dbg !2780
  ret i8 %conv2, !dbg !2783
}

; Function Attrs: noinline nounwind optnone
define internal zeroext i8 @lincomb(ptr noundef %a, ptr noundef %b, i32 noundef %n, i32 noundef %m) #0 !dbg !2784 {
entry:
  %a.addr = alloca ptr, align 4
  %b.addr = alloca ptr, align 4
  %n.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %ret = alloca i8, align 1
  %i = alloca i32, align 4
  store ptr %a, ptr %a.addr, align 4
    #dbg_declare(ptr %a.addr, !2787, !DIExpression(), !2788)
  store ptr %b, ptr %b.addr, align 4
    #dbg_declare(ptr %b.addr, !2789, !DIExpression(), !2790)
  store i32 %n, ptr %n.addr, align 4
    #dbg_declare(ptr %n.addr, !2791, !DIExpression(), !2792)
  store i32 %m, ptr %m.addr, align 4
    #dbg_declare(ptr %m.addr, !2793, !DIExpression(), !2794)
    #dbg_declare(ptr %ret, !2795, !DIExpression(), !2796)
  store i8 0, ptr %ret, align 1, !dbg !2796
    #dbg_declare(ptr %i, !2797, !DIExpression(), !2799)
  store i32 0, ptr %i, align 4, !dbg !2799
  br label %for.cond, !dbg !2800

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4, !dbg !2801
  %1 = load i32, ptr %n.addr, align 4, !dbg !2803
  %cmp = icmp slt i32 %0, %1, !dbg !2804
  br i1 %cmp, label %for.body, label %for.end, !dbg !2805

for.body:                                         ; preds = %for.cond
  %2 = load ptr, ptr %a.addr, align 4, !dbg !2806
  %3 = load i32, ptr %i, align 4, !dbg !2808
  %arrayidx = getelementptr inbounds i8, ptr %2, i32 %3, !dbg !2806
  %4 = load i8, ptr %arrayidx, align 1, !dbg !2806
  %5 = load ptr, ptr %b.addr, align 4, !dbg !2809
  %6 = load i8, ptr %5, align 1, !dbg !2810
  %call = call zeroext i8 @mul_f(i8 noundef zeroext %4, i8 noundef zeroext %6) #5, !dbg !2811
  %7 = load i8, ptr %ret, align 1, !dbg !2812
  %call1 = call zeroext i8 @add_f(i8 noundef zeroext %call, i8 noundef zeroext %7) #5, !dbg !2813
  store i8 %call1, ptr %ret, align 1, !dbg !2814
  br label %for.inc, !dbg !2815

for.inc:                                          ; preds = %for.body
  %8 = load i32, ptr %i, align 4, !dbg !2816
  %inc = add nsw i32 %8, 1, !dbg !2816
  store i32 %inc, ptr %i, align 4, !dbg !2816
  %9 = load i32, ptr %m.addr, align 4, !dbg !2817
  %10 = load ptr, ptr %b.addr, align 4, !dbg !2818
  %add.ptr = getelementptr inbounds i8, ptr %10, i32 %9, !dbg !2818
  store ptr %add.ptr, ptr %b.addr, align 4, !dbg !2818
  br label %for.cond, !dbg !2819, !llvm.loop !2820

for.end:                                          ; preds = %for.cond
  %11 = load i8, ptr %ret, align 1, !dbg !2822
  ret i8 %11, !dbg !2823
}

; Function Attrs: noinline nounwind optnone
define internal zeroext i8 @mul_f(i8 noundef zeroext %a, i8 noundef zeroext %b) #0 !dbg !2824 {
entry:
  %a.addr = alloca i8, align 1
  %b.addr = alloca i8, align 1
  %p = alloca i8, align 1
  %top_p = alloca i8, align 1
  %out = alloca i8, align 1
  store i8 %a, ptr %a.addr, align 1
    #dbg_declare(ptr %a.addr, !2825, !DIExpression(), !2826)
  store i8 %b, ptr %b.addr, align 1
    #dbg_declare(ptr %b.addr, !2827, !DIExpression(), !2828)
    #dbg_declare(ptr %p, !2829, !DIExpression(), !2830)
  %0 = load volatile i8, ptr @unsigned_char_blocker, align 1, !dbg !2831
  %conv = zext i8 %0 to i32, !dbg !2831
  %1 = load i8, ptr %a.addr, align 1, !dbg !2832
  %conv1 = zext i8 %1 to i32, !dbg !2832
  %xor = xor i32 %conv1, %conv, !dbg !2832
  %conv2 = trunc i32 %xor to i8, !dbg !2832
  store i8 %conv2, ptr %a.addr, align 1, !dbg !2832
  %2 = load i8, ptr %a.addr, align 1, !dbg !2833
  %conv3 = zext i8 %2 to i32, !dbg !2833
  %and = and i32 %conv3, 1, !dbg !2834
  %3 = load i8, ptr %b.addr, align 1, !dbg !2835
  %conv4 = zext i8 %3 to i32, !dbg !2835
  %mul = mul nsw i32 %and, %conv4, !dbg !2836
  %conv5 = trunc i32 %mul to i8, !dbg !2837
  store i8 %conv5, ptr %p, align 1, !dbg !2838
  %4 = load i8, ptr %a.addr, align 1, !dbg !2839
  %conv6 = zext i8 %4 to i32, !dbg !2839
  %and7 = and i32 %conv6, 2, !dbg !2840
  %5 = load i8, ptr %b.addr, align 1, !dbg !2841
  %conv8 = zext i8 %5 to i32, !dbg !2841
  %mul9 = mul nsw i32 %and7, %conv8, !dbg !2842
  %6 = load i8, ptr %p, align 1, !dbg !2843
  %conv10 = zext i8 %6 to i32, !dbg !2843
  %xor11 = xor i32 %conv10, %mul9, !dbg !2843
  %conv12 = trunc i32 %xor11 to i8, !dbg !2843
  store i8 %conv12, ptr %p, align 1, !dbg !2843
  %7 = load i8, ptr %a.addr, align 1, !dbg !2844
  %conv13 = zext i8 %7 to i32, !dbg !2844
  %and14 = and i32 %conv13, 4, !dbg !2845
  %8 = load i8, ptr %b.addr, align 1, !dbg !2846
  %conv15 = zext i8 %8 to i32, !dbg !2846
  %mul16 = mul nsw i32 %and14, %conv15, !dbg !2847
  %9 = load i8, ptr %p, align 1, !dbg !2848
  %conv17 = zext i8 %9 to i32, !dbg !2848
  %xor18 = xor i32 %conv17, %mul16, !dbg !2848
  %conv19 = trunc i32 %xor18 to i8, !dbg !2848
  store i8 %conv19, ptr %p, align 1, !dbg !2848
  %10 = load i8, ptr %a.addr, align 1, !dbg !2849
  %conv20 = zext i8 %10 to i32, !dbg !2849
  %and21 = and i32 %conv20, 8, !dbg !2850
  %11 = load i8, ptr %b.addr, align 1, !dbg !2851
  %conv22 = zext i8 %11 to i32, !dbg !2851
  %mul23 = mul nsw i32 %and21, %conv22, !dbg !2852
  %12 = load i8, ptr %p, align 1, !dbg !2853
  %conv24 = zext i8 %12 to i32, !dbg !2853
  %xor25 = xor i32 %conv24, %mul23, !dbg !2853
  %conv26 = trunc i32 %xor25 to i8, !dbg !2853
  store i8 %conv26, ptr %p, align 1, !dbg !2853
    #dbg_declare(ptr %top_p, !2854, !DIExpression(), !2855)
  %13 = load i8, ptr %p, align 1, !dbg !2856
  %conv27 = zext i8 %13 to i32, !dbg !2856
  %and28 = and i32 %conv27, 240, !dbg !2857
  %conv29 = trunc i32 %and28 to i8, !dbg !2856
  store i8 %conv29, ptr %top_p, align 1, !dbg !2855
    #dbg_declare(ptr %out, !2858, !DIExpression(), !2859)
  %14 = load i8, ptr %p, align 1, !dbg !2860
  %conv30 = zext i8 %14 to i32, !dbg !2860
  %15 = load i8, ptr %top_p, align 1, !dbg !2861
  %conv31 = zext i8 %15 to i32, !dbg !2861
  %shr = ashr i32 %conv31, 4, !dbg !2862
  %xor32 = xor i32 %conv30, %shr, !dbg !2863
  %16 = load i8, ptr %top_p, align 1, !dbg !2864
  %conv33 = zext i8 %16 to i32, !dbg !2864
  %shr34 = ashr i32 %conv33, 3, !dbg !2865
  %xor35 = xor i32 %xor32, %shr34, !dbg !2866
  %and36 = and i32 %xor35, 15, !dbg !2867
  %conv37 = trunc i32 %and36 to i8, !dbg !2868
  store i8 %conv37, ptr %out, align 1, !dbg !2859
  %17 = load i8, ptr %out, align 1, !dbg !2869
  ret i8 %17, !dbg !2870
}

; Function Attrs: noinline nounwind optnone
define internal void @transpose_16x16_nibbles(ptr noundef %M) #0 !dbg !87 {
entry:
  %M.addr = alloca ptr, align 4
  %i = alloca i32, align 4
  %t = alloca i64, align 8
  %i8 = alloca i32, align 4
  %t0 = alloca i64, align 8
  %t1 = alloca i64, align 8
  %i41 = alloca i32, align 4
  %t045 = alloca i64, align 8
  %t152 = alloca i64, align 8
  %i75 = alloca i32, align 4
  %t79 = alloca i64, align 8
  store ptr %M, ptr %M.addr, align 4
    #dbg_declare(ptr %M.addr, !2871, !DIExpression(), !2872)
    #dbg_declare(ptr %i, !2873, !DIExpression(), !2875)
  store i32 0, ptr %i, align 4, !dbg !2875
  br label %for.cond, !dbg !2876

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4, !dbg !2877
  %cmp = icmp ult i32 %0, 16, !dbg !2879
  br i1 %cmp, label %for.body, label %for.end, !dbg !2880

for.body:                                         ; preds = %for.cond
    #dbg_declare(ptr %t, !2881, !DIExpression(), !2883)
  %1 = load ptr, ptr %M.addr, align 4, !dbg !2884
  %2 = load i32, ptr %i, align 4, !dbg !2885
  %arrayidx = getelementptr inbounds nuw i64, ptr %1, i32 %2, !dbg !2884
  %3 = load i64, ptr %arrayidx, align 8, !dbg !2884
  %shr = lshr i64 %3, 4, !dbg !2886
  %4 = load ptr, ptr %M.addr, align 4, !dbg !2887
  %5 = load i32, ptr %i, align 4, !dbg !2888
  %add = add i32 %5, 1, !dbg !2889
  %arrayidx1 = getelementptr inbounds nuw i64, ptr %4, i32 %add, !dbg !2887
  %6 = load i64, ptr %arrayidx1, align 8, !dbg !2887
  %xor = xor i64 %shr, %6, !dbg !2890
  %and = and i64 %xor, 1085102592571150095, !dbg !2891
  store i64 %and, ptr %t, align 8, !dbg !2883
  %7 = load i64, ptr %t, align 8, !dbg !2892
  %shl = shl i64 %7, 4, !dbg !2893
  %8 = load ptr, ptr %M.addr, align 4, !dbg !2894
  %9 = load i32, ptr %i, align 4, !dbg !2895
  %arrayidx2 = getelementptr inbounds nuw i64, ptr %8, i32 %9, !dbg !2894
  %10 = load i64, ptr %arrayidx2, align 8, !dbg !2896
  %xor3 = xor i64 %10, %shl, !dbg !2896
  store i64 %xor3, ptr %arrayidx2, align 8, !dbg !2896
  %11 = load i64, ptr %t, align 8, !dbg !2897
  %12 = load ptr, ptr %M.addr, align 4, !dbg !2898
  %13 = load i32, ptr %i, align 4, !dbg !2899
  %add4 = add i32 %13, 1, !dbg !2900
  %arrayidx5 = getelementptr inbounds nuw i64, ptr %12, i32 %add4, !dbg !2898
  %14 = load i64, ptr %arrayidx5, align 8, !dbg !2901
  %xor6 = xor i64 %14, %11, !dbg !2901
  store i64 %xor6, ptr %arrayidx5, align 8, !dbg !2901
  br label %for.inc, !dbg !2902

for.inc:                                          ; preds = %for.body
  %15 = load i32, ptr %i, align 4, !dbg !2903
  %add7 = add i32 %15, 2, !dbg !2903
  store i32 %add7, ptr %i, align 4, !dbg !2903
  br label %for.cond, !dbg !2904, !llvm.loop !2905

for.end:                                          ; preds = %for.cond
    #dbg_declare(ptr %i8, !2907, !DIExpression(), !2909)
  store i32 0, ptr %i8, align 4, !dbg !2909
  br label %for.cond9, !dbg !2910

for.cond9:                                        ; preds = %for.inc38, %for.end
  %16 = load i32, ptr %i8, align 4, !dbg !2911
  %cmp10 = icmp ult i32 %16, 16, !dbg !2913
  br i1 %cmp10, label %for.body11, label %for.end40, !dbg !2914

for.body11:                                       ; preds = %for.cond9
    #dbg_declare(ptr %t0, !2915, !DIExpression(), !2917)
  %17 = load ptr, ptr %M.addr, align 4, !dbg !2918
  %18 = load i32, ptr %i8, align 4, !dbg !2919
  %arrayidx12 = getelementptr inbounds nuw i64, ptr %17, i32 %18, !dbg !2918
  %19 = load i64, ptr %arrayidx12, align 8, !dbg !2918
  %shr13 = lshr i64 %19, 8, !dbg !2920
  %20 = load ptr, ptr %M.addr, align 4, !dbg !2921
  %21 = load i32, ptr %i8, align 4, !dbg !2922
  %add14 = add i32 %21, 2, !dbg !2923
  %arrayidx15 = getelementptr inbounds nuw i64, ptr %20, i32 %add14, !dbg !2921
  %22 = load i64, ptr %arrayidx15, align 8, !dbg !2921
  %xor16 = xor i64 %shr13, %22, !dbg !2924
  %and17 = and i64 %xor16, 71777214294589695, !dbg !2925
  store i64 %and17, ptr %t0, align 8, !dbg !2917
    #dbg_declare(ptr %t1, !2926, !DIExpression(), !2927)
  %23 = load ptr, ptr %M.addr, align 4, !dbg !2928
  %24 = load i32, ptr %i8, align 4, !dbg !2929
  %add18 = add i32 %24, 1, !dbg !2930
  %arrayidx19 = getelementptr inbounds nuw i64, ptr %23, i32 %add18, !dbg !2928
  %25 = load i64, ptr %arrayidx19, align 8, !dbg !2928
  %shr20 = lshr i64 %25, 8, !dbg !2931
  %26 = load ptr, ptr %M.addr, align 4, !dbg !2932
  %27 = load i32, ptr %i8, align 4, !dbg !2933
  %add21 = add i32 %27, 3, !dbg !2934
  %arrayidx22 = getelementptr inbounds nuw i64, ptr %26, i32 %add21, !dbg !2932
  %28 = load i64, ptr %arrayidx22, align 8, !dbg !2932
  %xor23 = xor i64 %shr20, %28, !dbg !2935
  %and24 = and i64 %xor23, 71777214294589695, !dbg !2936
  store i64 %and24, ptr %t1, align 8, !dbg !2927
  %29 = load i64, ptr %t0, align 8, !dbg !2937
  %shl25 = shl i64 %29, 8, !dbg !2938
  %30 = load ptr, ptr %M.addr, align 4, !dbg !2939
  %31 = load i32, ptr %i8, align 4, !dbg !2940
  %arrayidx26 = getelementptr inbounds nuw i64, ptr %30, i32 %31, !dbg !2939
  %32 = load i64, ptr %arrayidx26, align 8, !dbg !2941
  %xor27 = xor i64 %32, %shl25, !dbg !2941
  store i64 %xor27, ptr %arrayidx26, align 8, !dbg !2941
  %33 = load i64, ptr %t1, align 8, !dbg !2942
  %shl28 = shl i64 %33, 8, !dbg !2943
  %34 = load ptr, ptr %M.addr, align 4, !dbg !2944
  %35 = load i32, ptr %i8, align 4, !dbg !2945
  %add29 = add i32 %35, 1, !dbg !2946
  %arrayidx30 = getelementptr inbounds nuw i64, ptr %34, i32 %add29, !dbg !2944
  %36 = load i64, ptr %arrayidx30, align 8, !dbg !2947
  %xor31 = xor i64 %36, %shl28, !dbg !2947
  store i64 %xor31, ptr %arrayidx30, align 8, !dbg !2947
  %37 = load i64, ptr %t0, align 8, !dbg !2948
  %38 = load ptr, ptr %M.addr, align 4, !dbg !2949
  %39 = load i32, ptr %i8, align 4, !dbg !2950
  %add32 = add i32 %39, 2, !dbg !2951
  %arrayidx33 = getelementptr inbounds nuw i64, ptr %38, i32 %add32, !dbg !2949
  %40 = load i64, ptr %arrayidx33, align 8, !dbg !2952
  %xor34 = xor i64 %40, %37, !dbg !2952
  store i64 %xor34, ptr %arrayidx33, align 8, !dbg !2952
  %41 = load i64, ptr %t1, align 8, !dbg !2953
  %42 = load ptr, ptr %M.addr, align 4, !dbg !2954
  %43 = load i32, ptr %i8, align 4, !dbg !2955
  %add35 = add i32 %43, 3, !dbg !2956
  %arrayidx36 = getelementptr inbounds nuw i64, ptr %42, i32 %add35, !dbg !2954
  %44 = load i64, ptr %arrayidx36, align 8, !dbg !2957
  %xor37 = xor i64 %44, %41, !dbg !2957
  store i64 %xor37, ptr %arrayidx36, align 8, !dbg !2957
  br label %for.inc38, !dbg !2958

for.inc38:                                        ; preds = %for.body11
  %45 = load i32, ptr %i8, align 4, !dbg !2959
  %add39 = add i32 %45, 4, !dbg !2959
  store i32 %add39, ptr %i8, align 4, !dbg !2959
  br label %for.cond9, !dbg !2960, !llvm.loop !2961

for.end40:                                        ; preds = %for.cond9
    #dbg_declare(ptr %i41, !2963, !DIExpression(), !2965)
  store i32 0, ptr %i41, align 4, !dbg !2965
  br label %for.cond42, !dbg !2966

for.cond42:                                       ; preds = %for.inc73, %for.end40
  %46 = load i32, ptr %i41, align 4, !dbg !2967
  %cmp43 = icmp ult i32 %46, 4, !dbg !2969
  br i1 %cmp43, label %for.body44, label %for.end74, !dbg !2970

for.body44:                                       ; preds = %for.cond42
    #dbg_declare(ptr %t045, !2971, !DIExpression(), !2973)
  %47 = load ptr, ptr %M.addr, align 4, !dbg !2974
  %48 = load i32, ptr %i41, align 4, !dbg !2975
  %arrayidx46 = getelementptr inbounds nuw i64, ptr %47, i32 %48, !dbg !2974
  %49 = load i64, ptr %arrayidx46, align 8, !dbg !2974
  %shr47 = lshr i64 %49, 16, !dbg !2976
  %50 = load ptr, ptr %M.addr, align 4, !dbg !2977
  %51 = load i32, ptr %i41, align 4, !dbg !2978
  %add48 = add i32 %51, 4, !dbg !2979
  %arrayidx49 = getelementptr inbounds nuw i64, ptr %50, i32 %add48, !dbg !2977
  %52 = load i64, ptr %arrayidx49, align 8, !dbg !2977
  %xor50 = xor i64 %shr47, %52, !dbg !2980
  %and51 = and i64 %xor50, 281470681808895, !dbg !2981
  store i64 %and51, ptr %t045, align 8, !dbg !2973
    #dbg_declare(ptr %t152, !2982, !DIExpression(), !2983)
  %53 = load ptr, ptr %M.addr, align 4, !dbg !2984
  %54 = load i32, ptr %i41, align 4, !dbg !2985
  %add53 = add i32 %54, 8, !dbg !2986
  %arrayidx54 = getelementptr inbounds nuw i64, ptr %53, i32 %add53, !dbg !2984
  %55 = load i64, ptr %arrayidx54, align 8, !dbg !2984
  %shr55 = lshr i64 %55, 16, !dbg !2987
  %56 = load ptr, ptr %M.addr, align 4, !dbg !2988
  %57 = load i32, ptr %i41, align 4, !dbg !2989
  %add56 = add i32 %57, 12, !dbg !2990
  %arrayidx57 = getelementptr inbounds nuw i64, ptr %56, i32 %add56, !dbg !2988
  %58 = load i64, ptr %arrayidx57, align 8, !dbg !2988
  %xor58 = xor i64 %shr55, %58, !dbg !2991
  %and59 = and i64 %xor58, 281470681808895, !dbg !2992
  store i64 %and59, ptr %t152, align 8, !dbg !2983
  %59 = load i64, ptr %t045, align 8, !dbg !2993
  %shl60 = shl i64 %59, 16, !dbg !2994
  %60 = load ptr, ptr %M.addr, align 4, !dbg !2995
  %61 = load i32, ptr %i41, align 4, !dbg !2996
  %arrayidx61 = getelementptr inbounds nuw i64, ptr %60, i32 %61, !dbg !2995
  %62 = load i64, ptr %arrayidx61, align 8, !dbg !2997
  %xor62 = xor i64 %62, %shl60, !dbg !2997
  store i64 %xor62, ptr %arrayidx61, align 8, !dbg !2997
  %63 = load i64, ptr %t152, align 8, !dbg !2998
  %shl63 = shl i64 %63, 16, !dbg !2999
  %64 = load ptr, ptr %M.addr, align 4, !dbg !3000
  %65 = load i32, ptr %i41, align 4, !dbg !3001
  %add64 = add i32 %65, 8, !dbg !3002
  %arrayidx65 = getelementptr inbounds nuw i64, ptr %64, i32 %add64, !dbg !3000
  %66 = load i64, ptr %arrayidx65, align 8, !dbg !3003
  %xor66 = xor i64 %66, %shl63, !dbg !3003
  store i64 %xor66, ptr %arrayidx65, align 8, !dbg !3003
  %67 = load i64, ptr %t045, align 8, !dbg !3004
  %68 = load ptr, ptr %M.addr, align 4, !dbg !3005
  %69 = load i32, ptr %i41, align 4, !dbg !3006
  %add67 = add i32 %69, 4, !dbg !3007
  %arrayidx68 = getelementptr inbounds nuw i64, ptr %68, i32 %add67, !dbg !3005
  %70 = load i64, ptr %arrayidx68, align 8, !dbg !3008
  %xor69 = xor i64 %70, %67, !dbg !3008
  store i64 %xor69, ptr %arrayidx68, align 8, !dbg !3008
  %71 = load i64, ptr %t152, align 8, !dbg !3009
  %72 = load ptr, ptr %M.addr, align 4, !dbg !3010
  %73 = load i32, ptr %i41, align 4, !dbg !3011
  %add70 = add i32 %73, 12, !dbg !3012
  %arrayidx71 = getelementptr inbounds nuw i64, ptr %72, i32 %add70, !dbg !3010
  %74 = load i64, ptr %arrayidx71, align 8, !dbg !3013
  %xor72 = xor i64 %74, %71, !dbg !3013
  store i64 %xor72, ptr %arrayidx71, align 8, !dbg !3013
  br label %for.inc73, !dbg !3014

for.inc73:                                        ; preds = %for.body44
  %75 = load i32, ptr %i41, align 4, !dbg !3015
  %inc = add i32 %75, 1, !dbg !3015
  store i32 %inc, ptr %i41, align 4, !dbg !3015
  br label %for.cond42, !dbg !3016, !llvm.loop !3017

for.end74:                                        ; preds = %for.cond42
    #dbg_declare(ptr %i75, !3019, !DIExpression(), !3021)
  store i32 0, ptr %i75, align 4, !dbg !3021
  br label %for.cond76, !dbg !3022

for.cond76:                                       ; preds = %for.inc92, %for.end74
  %76 = load i32, ptr %i75, align 4, !dbg !3023
  %cmp77 = icmp ult i32 %76, 8, !dbg !3025
  br i1 %cmp77, label %for.body78, label %for.end94, !dbg !3026

for.body78:                                       ; preds = %for.cond76
    #dbg_declare(ptr %t79, !3027, !DIExpression(), !3029)
  %77 = load ptr, ptr %M.addr, align 4, !dbg !3030
  %78 = load i32, ptr %i75, align 4, !dbg !3031
  %arrayidx80 = getelementptr inbounds nuw i64, ptr %77, i32 %78, !dbg !3030
  %79 = load i64, ptr %arrayidx80, align 8, !dbg !3030
  %shr81 = lshr i64 %79, 32, !dbg !3032
  %80 = load ptr, ptr %M.addr, align 4, !dbg !3033
  %81 = load i32, ptr %i75, align 4, !dbg !3034
  %add82 = add i32 %81, 8, !dbg !3035
  %arrayidx83 = getelementptr inbounds nuw i64, ptr %80, i32 %add82, !dbg !3033
  %82 = load i64, ptr %arrayidx83, align 8, !dbg !3033
  %xor84 = xor i64 %shr81, %82, !dbg !3036
  %and85 = and i64 %xor84, 4294967295, !dbg !3037
  store i64 %and85, ptr %t79, align 8, !dbg !3029
  %83 = load i64, ptr %t79, align 8, !dbg !3038
  %shl86 = shl i64 %83, 32, !dbg !3039
  %84 = load ptr, ptr %M.addr, align 4, !dbg !3040
  %85 = load i32, ptr %i75, align 4, !dbg !3041
  %arrayidx87 = getelementptr inbounds nuw i64, ptr %84, i32 %85, !dbg !3040
  %86 = load i64, ptr %arrayidx87, align 8, !dbg !3042
  %xor88 = xor i64 %86, %shl86, !dbg !3042
  store i64 %xor88, ptr %arrayidx87, align 8, !dbg !3042
  %87 = load i64, ptr %t79, align 8, !dbg !3043
  %88 = load ptr, ptr %M.addr, align 4, !dbg !3044
  %89 = load i32, ptr %i75, align 4, !dbg !3045
  %add89 = add i32 %89, 8, !dbg !3046
  %arrayidx90 = getelementptr inbounds nuw i64, ptr %88, i32 %add89, !dbg !3044
  %90 = load i64, ptr %arrayidx90, align 8, !dbg !3047
  %xor91 = xor i64 %90, %87, !dbg !3047
  store i64 %xor91, ptr %arrayidx90, align 8, !dbg !3047
  br label %for.inc92, !dbg !3048

for.inc92:                                        ; preds = %for.body78
  %91 = load i32, ptr %i75, align 4, !dbg !3049
  %inc93 = add i32 %91, 1, !dbg !3049
  store i32 %inc93, ptr %i75, align 4, !dbg !3049
  br label %for.cond76, !dbg !3050, !llvm.loop !3051

for.end94:                                        ; preds = %for.cond76
  ret void, !dbg !3053
}

; Function Attrs: noinline nounwind optnone
define internal void @mul_add_mat_x_m_mat(i32 noundef %m_vec_limbs, ptr noundef %mat, ptr noundef %bs_mat, ptr noundef %acc, i32 noundef %mat_rows, i32 noundef %mat_cols, i32 noundef %bs_mat_cols) #0 !dbg !3054 {
entry:
  %m_vec_limbs.addr = alloca i32, align 4
  %mat.addr = alloca ptr, align 4
  %bs_mat.addr = alloca ptr, align 4
  %acc.addr = alloca ptr, align 4
  %mat_rows.addr = alloca i32, align 4
  %mat_cols.addr = alloca i32, align 4
  %bs_mat_cols.addr = alloca i32, align 4
  %r = alloca i32, align 4
  %c = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %m_vec_limbs, ptr %m_vec_limbs.addr, align 4
    #dbg_declare(ptr %m_vec_limbs.addr, !3055, !DIExpression(), !3056)
  store ptr %mat, ptr %mat.addr, align 4
    #dbg_declare(ptr %mat.addr, !3057, !DIExpression(), !3058)
  store ptr %bs_mat, ptr %bs_mat.addr, align 4
    #dbg_declare(ptr %bs_mat.addr, !3059, !DIExpression(), !3060)
  store ptr %acc, ptr %acc.addr, align 4
    #dbg_declare(ptr %acc.addr, !3061, !DIExpression(), !3062)
  store i32 %mat_rows, ptr %mat_rows.addr, align 4
    #dbg_declare(ptr %mat_rows.addr, !3063, !DIExpression(), !3064)
  store i32 %mat_cols, ptr %mat_cols.addr, align 4
    #dbg_declare(ptr %mat_cols.addr, !3065, !DIExpression(), !3066)
  store i32 %bs_mat_cols, ptr %bs_mat_cols.addr, align 4
    #dbg_declare(ptr %bs_mat_cols.addr, !3067, !DIExpression(), !3068)
    #dbg_declare(ptr %r, !3069, !DIExpression(), !3071)
  store i32 0, ptr %r, align 4, !dbg !3071
  br label %for.cond, !dbg !3072

for.cond:                                         ; preds = %for.inc17, %entry
  %0 = load i32, ptr %r, align 4, !dbg !3073
  %1 = load i32, ptr %mat_rows.addr, align 4, !dbg !3075
  %cmp = icmp slt i32 %0, %1, !dbg !3076
  br i1 %cmp, label %for.body, label %for.end19, !dbg !3077

for.body:                                         ; preds = %for.cond
    #dbg_declare(ptr %c, !3078, !DIExpression(), !3081)
  store i32 0, ptr %c, align 4, !dbg !3081
  br label %for.cond1, !dbg !3082

for.cond1:                                        ; preds = %for.inc15, %for.body
  %2 = load i32, ptr %c, align 4, !dbg !3083
  %3 = load i32, ptr %mat_cols.addr, align 4, !dbg !3085
  %cmp2 = icmp slt i32 %2, %3, !dbg !3086
  br i1 %cmp2, label %for.body3, label %for.end16, !dbg !3087

for.body3:                                        ; preds = %for.cond1
    #dbg_declare(ptr %k, !3088, !DIExpression(), !3091)
  store i32 0, ptr %k, align 4, !dbg !3091
  br label %for.cond4, !dbg !3092

for.cond4:                                        ; preds = %for.inc, %for.body3
  %4 = load i32, ptr %k, align 4, !dbg !3093
  %5 = load i32, ptr %bs_mat_cols.addr, align 4, !dbg !3095
  %cmp5 = icmp slt i32 %4, %5, !dbg !3096
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !3097

for.body6:                                        ; preds = %for.cond4
  %6 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !3098
  %7 = load ptr, ptr %bs_mat.addr, align 4, !dbg !3100
  %8 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !3101
  %9 = load i32, ptr %c, align 4, !dbg !3102
  %10 = load i32, ptr %bs_mat_cols.addr, align 4, !dbg !3103
  %mul = mul nsw i32 %9, %10, !dbg !3104
  %11 = load i32, ptr %k, align 4, !dbg !3105
  %add = add nsw i32 %mul, %11, !dbg !3106
  %mul7 = mul nsw i32 %8, %add, !dbg !3107
  %add.ptr = getelementptr inbounds i64, ptr %7, i32 %mul7, !dbg !3108
  %12 = load ptr, ptr %mat.addr, align 4, !dbg !3109
  %13 = load i32, ptr %r, align 4, !dbg !3110
  %14 = load i32, ptr %mat_cols.addr, align 4, !dbg !3111
  %mul8 = mul nsw i32 %13, %14, !dbg !3112
  %15 = load i32, ptr %c, align 4, !dbg !3113
  %add9 = add nsw i32 %mul8, %15, !dbg !3114
  %arrayidx = getelementptr inbounds i8, ptr %12, i32 %add9, !dbg !3109
  %16 = load i8, ptr %arrayidx, align 1, !dbg !3109
  %17 = load ptr, ptr %acc.addr, align 4, !dbg !3115
  %18 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !3116
  %19 = load i32, ptr %r, align 4, !dbg !3117
  %20 = load i32, ptr %bs_mat_cols.addr, align 4, !dbg !3118
  %mul10 = mul nsw i32 %19, %20, !dbg !3119
  %21 = load i32, ptr %k, align 4, !dbg !3120
  %add11 = add nsw i32 %mul10, %21, !dbg !3121
  %mul12 = mul nsw i32 %18, %add11, !dbg !3122
  %add.ptr13 = getelementptr inbounds i64, ptr %17, i32 %mul12, !dbg !3123
  call void @m_vec_mul_add(i32 noundef %6, ptr noundef %add.ptr, i8 noundef zeroext %16, ptr noundef %add.ptr13) #5, !dbg !3124
  br label %for.inc, !dbg !3125

for.inc:                                          ; preds = %for.body6
  %22 = load i32, ptr %k, align 4, !dbg !3126
  %add14 = add nsw i32 %22, 1, !dbg !3126
  store i32 %add14, ptr %k, align 4, !dbg !3126
  br label %for.cond4, !dbg !3127, !llvm.loop !3128

for.end:                                          ; preds = %for.cond4
  br label %for.inc15, !dbg !3130

for.inc15:                                        ; preds = %for.end
  %23 = load i32, ptr %c, align 4, !dbg !3131
  %inc = add nsw i32 %23, 1, !dbg !3131
  store i32 %inc, ptr %c, align 4, !dbg !3131
  br label %for.cond1, !dbg !3132, !llvm.loop !3133

for.end16:                                        ; preds = %for.cond1
  br label %for.inc17, !dbg !3135

for.inc17:                                        ; preds = %for.end16
  %24 = load i32, ptr %r, align 4, !dbg !3136
  %inc18 = add nsw i32 %24, 1, !dbg !3136
  store i32 %inc18, ptr %r, align 4, !dbg !3136
  br label %for.cond, !dbg !3137, !llvm.loop !3138

for.end19:                                        ; preds = %for.cond
  ret void, !dbg !3140
}

; Function Attrs: noinline nounwind optnone
define internal void @P1_times_Vt(ptr noundef %p, ptr noundef %P1, ptr noundef %V, ptr noundef %acc) #0 !dbg !3141 {
entry:
  %p.addr = alloca ptr, align 4
  %P1.addr = alloca ptr, align 4
  %V.addr = alloca ptr, align 4
  %acc.addr = alloca ptr, align 4
  store ptr %p, ptr %p.addr, align 4
    #dbg_declare(ptr %p.addr, !3142, !DIExpression(), !3143)
  store ptr %P1, ptr %P1.addr, align 4
    #dbg_declare(ptr %P1.addr, !3144, !DIExpression(), !3145)
  store ptr %V, ptr %V.addr, align 4
    #dbg_declare(ptr %V.addr, !3146, !DIExpression(), !3147)
  store ptr %acc, ptr %acc.addr, align 4
    #dbg_declare(ptr %acc.addr, !3148, !DIExpression(), !3149)
  %0 = load ptr, ptr %p.addr, align 4, !dbg !3150
  %m_vec_limbs = getelementptr inbounds nuw %struct.mayo_params_t, ptr %0, i32 0, i32 21, !dbg !3150
  %1 = load i32, ptr %m_vec_limbs, align 4, !dbg !3150
  %2 = load ptr, ptr %P1.addr, align 4, !dbg !3151
  %3 = load ptr, ptr %V.addr, align 4, !dbg !3152
  %4 = load ptr, ptr %acc.addr, align 4, !dbg !3153
  %5 = load ptr, ptr %p.addr, align 4, !dbg !3154
  %n = getelementptr inbounds nuw %struct.mayo_params_t, ptr %5, i32 0, i32 1, !dbg !3154
  %6 = load i32, ptr %n, align 4, !dbg !3154
  %7 = load ptr, ptr %p.addr, align 4, !dbg !3154
  %o = getelementptr inbounds nuw %struct.mayo_params_t, ptr %7, i32 0, i32 2, !dbg !3154
  %8 = load i32, ptr %o, align 4, !dbg !3154
  %sub = sub nsw i32 %6, %8, !dbg !3154
  %9 = load ptr, ptr %p.addr, align 4, !dbg !3155
  %n1 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %9, i32 0, i32 1, !dbg !3155
  %10 = load i32, ptr %n1, align 4, !dbg !3155
  %11 = load ptr, ptr %p.addr, align 4, !dbg !3155
  %o2 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %11, i32 0, i32 2, !dbg !3155
  %12 = load i32, ptr %o2, align 4, !dbg !3155
  %sub3 = sub nsw i32 %10, %12, !dbg !3155
  %13 = load ptr, ptr %p.addr, align 4, !dbg !3156
  %k = getelementptr inbounds nuw %struct.mayo_params_t, ptr %13, i32 0, i32 3, !dbg !3156
  %14 = load i32, ptr %k, align 4, !dbg !3156
  call void @mul_add_m_upper_triangular_mat_x_mat_trans(i32 noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, i32 noundef %sub, i32 noundef %sub3, i32 noundef %14, i32 noundef 1) #5, !dbg !3157
  ret void, !dbg !3158
}

; Function Attrs: noinline nounwind optnone
define internal void @mul_add_m_upper_triangular_mat_x_mat_trans(i32 noundef %m_vec_limbs, ptr noundef %bs_mat, ptr noundef %mat, ptr noundef %acc, i32 noundef %bs_mat_rows, i32 noundef %bs_mat_cols, i32 noundef %mat_rows, i32 noundef %triangular) #0 !dbg !3159 {
entry:
  %m_vec_limbs.addr = alloca i32, align 4
  %bs_mat.addr = alloca ptr, align 4
  %mat.addr = alloca ptr, align 4
  %acc.addr = alloca ptr, align 4
  %bs_mat_rows.addr = alloca i32, align 4
  %bs_mat_cols.addr = alloca i32, align 4
  %mat_rows.addr = alloca i32, align 4
  %triangular.addr = alloca i32, align 4
  %bs_mat_entries_used = alloca i32, align 4
  %r = alloca i32, align 4
  %c = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %m_vec_limbs, ptr %m_vec_limbs.addr, align 4
    #dbg_declare(ptr %m_vec_limbs.addr, !3160, !DIExpression(), !3161)
  store ptr %bs_mat, ptr %bs_mat.addr, align 4
    #dbg_declare(ptr %bs_mat.addr, !3162, !DIExpression(), !3163)
  store ptr %mat, ptr %mat.addr, align 4
    #dbg_declare(ptr %mat.addr, !3164, !DIExpression(), !3165)
  store ptr %acc, ptr %acc.addr, align 4
    #dbg_declare(ptr %acc.addr, !3166, !DIExpression(), !3167)
  store i32 %bs_mat_rows, ptr %bs_mat_rows.addr, align 4
    #dbg_declare(ptr %bs_mat_rows.addr, !3168, !DIExpression(), !3169)
  store i32 %bs_mat_cols, ptr %bs_mat_cols.addr, align 4
    #dbg_declare(ptr %bs_mat_cols.addr, !3170, !DIExpression(), !3171)
  store i32 %mat_rows, ptr %mat_rows.addr, align 4
    #dbg_declare(ptr %mat_rows.addr, !3172, !DIExpression(), !3173)
  store i32 %triangular, ptr %triangular.addr, align 4
    #dbg_declare(ptr %triangular.addr, !3174, !DIExpression(), !3175)
    #dbg_declare(ptr %bs_mat_entries_used, !3176, !DIExpression(), !3177)
  store i32 0, ptr %bs_mat_entries_used, align 4, !dbg !3177
    #dbg_declare(ptr %r, !3178, !DIExpression(), !3180)
  store i32 0, ptr %r, align 4, !dbg !3180
  br label %for.cond, !dbg !3181

for.cond:                                         ; preds = %for.inc17, %entry
  %0 = load i32, ptr %r, align 4, !dbg !3182
  %1 = load i32, ptr %bs_mat_rows.addr, align 4, !dbg !3184
  %cmp = icmp slt i32 %0, %1, !dbg !3185
  br i1 %cmp, label %for.body, label %for.end19, !dbg !3186

for.body:                                         ; preds = %for.cond
    #dbg_declare(ptr %c, !3187, !DIExpression(), !3190)
  %2 = load i32, ptr %triangular.addr, align 4, !dbg !3191
  %3 = load i32, ptr %r, align 4, !dbg !3192
  %mul = mul nsw i32 %2, %3, !dbg !3193
  store i32 %mul, ptr %c, align 4, !dbg !3190
  br label %for.cond1, !dbg !3194

for.cond1:                                        ; preds = %for.inc15, %for.body
  %4 = load i32, ptr %c, align 4, !dbg !3195
  %5 = load i32, ptr %bs_mat_cols.addr, align 4, !dbg !3197
  %cmp2 = icmp slt i32 %4, %5, !dbg !3198
  br i1 %cmp2, label %for.body3, label %for.end16, !dbg !3199

for.body3:                                        ; preds = %for.cond1
    #dbg_declare(ptr %k, !3200, !DIExpression(), !3203)
  store i32 0, ptr %k, align 4, !dbg !3203
  br label %for.cond4, !dbg !3204

for.cond4:                                        ; preds = %for.inc, %for.body3
  %6 = load i32, ptr %k, align 4, !dbg !3205
  %7 = load i32, ptr %mat_rows.addr, align 4, !dbg !3207
  %cmp5 = icmp slt i32 %6, %7, !dbg !3208
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !3209

for.body6:                                        ; preds = %for.cond4
  %8 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !3210
  %9 = load ptr, ptr %bs_mat.addr, align 4, !dbg !3212
  %10 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !3213
  %11 = load i32, ptr %bs_mat_entries_used, align 4, !dbg !3214
  %mul7 = mul nsw i32 %10, %11, !dbg !3215
  %add.ptr = getelementptr inbounds i64, ptr %9, i32 %mul7, !dbg !3216
  %12 = load ptr, ptr %mat.addr, align 4, !dbg !3217
  %13 = load i32, ptr %k, align 4, !dbg !3218
  %14 = load i32, ptr %bs_mat_cols.addr, align 4, !dbg !3219
  %mul8 = mul nsw i32 %13, %14, !dbg !3220
  %15 = load i32, ptr %c, align 4, !dbg !3221
  %add = add nsw i32 %mul8, %15, !dbg !3222
  %arrayidx = getelementptr inbounds i8, ptr %12, i32 %add, !dbg !3217
  %16 = load i8, ptr %arrayidx, align 1, !dbg !3217
  %17 = load ptr, ptr %acc.addr, align 4, !dbg !3223
  %18 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !3224
  %19 = load i32, ptr %r, align 4, !dbg !3225
  %20 = load i32, ptr %mat_rows.addr, align 4, !dbg !3226
  %mul9 = mul nsw i32 %19, %20, !dbg !3227
  %21 = load i32, ptr %k, align 4, !dbg !3228
  %add10 = add nsw i32 %mul9, %21, !dbg !3229
  %mul11 = mul nsw i32 %18, %add10, !dbg !3230
  %add.ptr12 = getelementptr inbounds i64, ptr %17, i32 %mul11, !dbg !3231
  call void @m_vec_mul_add(i32 noundef %8, ptr noundef %add.ptr, i8 noundef zeroext %16, ptr noundef %add.ptr12) #5, !dbg !3232
  br label %for.inc, !dbg !3233

for.inc:                                          ; preds = %for.body6
  %22 = load i32, ptr %k, align 4, !dbg !3234
  %add13 = add nsw i32 %22, 1, !dbg !3234
  store i32 %add13, ptr %k, align 4, !dbg !3234
  br label %for.cond4, !dbg !3235, !llvm.loop !3236

for.end:                                          ; preds = %for.cond4
  %23 = load i32, ptr %bs_mat_entries_used, align 4, !dbg !3238
  %add14 = add nsw i32 %23, 1, !dbg !3238
  store i32 %add14, ptr %bs_mat_entries_used, align 4, !dbg !3238
  br label %for.inc15, !dbg !3239

for.inc15:                                        ; preds = %for.end
  %24 = load i32, ptr %c, align 4, !dbg !3240
  %inc = add nsw i32 %24, 1, !dbg !3240
  store i32 %inc, ptr %c, align 4, !dbg !3240
  br label %for.cond1, !dbg !3241, !llvm.loop !3242

for.end16:                                        ; preds = %for.cond1
  br label %for.inc17, !dbg !3244

for.inc17:                                        ; preds = %for.end16
  %25 = load i32, ptr %r, align 4, !dbg !3245
  %inc18 = add nsw i32 %25, 1, !dbg !3245
  store i32 %inc18, ptr %r, align 4, !dbg !3245
  br label %for.cond, !dbg !3246, !llvm.loop !3247

for.end19:                                        ; preds = %for.cond
  ret void, !dbg !3249
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @mayo_sign(ptr noundef %p, ptr noundef %sm, ptr noundef %smlen, ptr noundef %m, i32 noundef %mlen, ptr noundef %csk) #0 !dbg !3250 {
entry:
  %p.addr = alloca ptr, align 4
  %sm.addr = alloca ptr, align 4
  %smlen.addr = alloca ptr, align 4
  %m.addr = alloca ptr, align 4
  %mlen.addr = alloca i32, align 4
  %csk.addr = alloca ptr, align 4
  %ret = alloca i32, align 4
  %param_sig_bytes = alloca i32, align 4
  %siglen = alloca i32, align 4
  store ptr %p, ptr %p.addr, align 4
    #dbg_declare(ptr %p.addr, !3251, !DIExpression(), !3252)
  store ptr %sm, ptr %sm.addr, align 4
    #dbg_declare(ptr %sm.addr, !3253, !DIExpression(), !3254)
  store ptr %smlen, ptr %smlen.addr, align 4
    #dbg_declare(ptr %smlen.addr, !3255, !DIExpression(), !3256)
  store ptr %m, ptr %m.addr, align 4
    #dbg_declare(ptr %m.addr, !3257, !DIExpression(), !3258)
  store i32 %mlen, ptr %mlen.addr, align 4
    #dbg_declare(ptr %mlen.addr, !3259, !DIExpression(), !3260)
  store ptr %csk, ptr %csk.addr, align 4
    #dbg_declare(ptr %csk.addr, !3261, !DIExpression(), !3262)
    #dbg_declare(ptr %ret, !3263, !DIExpression(), !3264)
  store i32 0, ptr %ret, align 4, !dbg !3264
    #dbg_declare(ptr %param_sig_bytes, !3265, !DIExpression(), !3266)
  %0 = load ptr, ptr %p.addr, align 4, !dbg !3267
  %sig_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %0, i32 0, i32 16, !dbg !3267
  %1 = load i32, ptr %sig_bytes, align 4, !dbg !3267
  store i32 %1, ptr %param_sig_bytes, align 4, !dbg !3266
    #dbg_declare(ptr %siglen, !3268, !DIExpression(), !3269)
  %2 = load ptr, ptr %sm.addr, align 4, !dbg !3270
  %3 = load i32, ptr %param_sig_bytes, align 4, !dbg !3271
  %add.ptr = getelementptr inbounds i8, ptr %2, i32 %3, !dbg !3272
  %4 = load ptr, ptr %m.addr, align 4, !dbg !3273
  %5 = load i32, ptr %mlen.addr, align 4, !dbg !3274
  %call = call ptr @memmove(ptr noundef %add.ptr, ptr noundef %4, i32 noundef %5) #5, !dbg !3275
  %6 = load ptr, ptr %p.addr, align 4, !dbg !3276
  %7 = load ptr, ptr %sm.addr, align 4, !dbg !3277
  %8 = load ptr, ptr %sm.addr, align 4, !dbg !3278
  %9 = load i32, ptr %param_sig_bytes, align 4, !dbg !3279
  %add.ptr1 = getelementptr inbounds i8, ptr %8, i32 %9, !dbg !3280
  %10 = load i32, ptr %mlen.addr, align 4, !dbg !3281
  %11 = load ptr, ptr %csk.addr, align 4, !dbg !3282
  %call2 = call i32 @mayo_sign_signature(ptr noundef %6, ptr noundef %7, ptr noundef %siglen, ptr noundef %add.ptr1, i32 noundef %10, ptr noundef %11) #5, !dbg !3283
  store i32 %call2, ptr %ret, align 4, !dbg !3284
  %12 = load i32, ptr %ret, align 4, !dbg !3285
  %cmp = icmp ne i32 %12, 0, !dbg !3287
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !3288

lor.lhs.false:                                    ; preds = %entry
  %13 = load i32, ptr %siglen, align 4, !dbg !3289
  %14 = load i32, ptr %param_sig_bytes, align 4, !dbg !3290
  %cmp3 = icmp ne i32 %13, %14, !dbg !3291
  br i1 %cmp3, label %if.then, label %if.end, !dbg !3288

if.then:                                          ; preds = %lor.lhs.false, %entry
  %15 = load ptr, ptr %sm.addr, align 4, !dbg !3292
  %16 = load i32, ptr %siglen, align 4, !dbg !3294
  %17 = load i32, ptr %mlen.addr, align 4, !dbg !3295
  %add = add i32 %16, %17, !dbg !3296
  %call4 = call ptr @memset(ptr noundef %15, i32 noundef 0, i32 noundef %add) #5, !dbg !3297
  br label %err, !dbg !3298

if.end:                                           ; preds = %lor.lhs.false
  %18 = load i32, ptr %siglen, align 4, !dbg !3299
  %19 = load i32, ptr %mlen.addr, align 4, !dbg !3300
  %add5 = add i32 %18, %19, !dbg !3301
  %20 = load ptr, ptr %smlen.addr, align 4, !dbg !3302
  store i32 %add5, ptr %20, align 4, !dbg !3303
  br label %err, !dbg !3304

err:                                              ; preds = %if.end, %if.then
    #dbg_label(!3305, !3306)
  %21 = load i32, ptr %ret, align 4, !dbg !3307
  ret i32 %21, !dbg !3308
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @mayo_open(ptr noundef %p, ptr noundef %m, ptr noundef %mlen, ptr noundef %sm, i32 noundef %smlen, ptr noundef %pk) #0 !dbg !3309 {
entry:
  %retval = alloca i32, align 4
  %p.addr = alloca ptr, align 4
  %m.addr = alloca ptr, align 4
  %mlen.addr = alloca ptr, align 4
  %sm.addr = alloca ptr, align 4
  %smlen.addr = alloca i32, align 4
  %pk.addr = alloca ptr, align 4
  %param_sig_bytes = alloca i32, align 4
  %result = alloca i32, align 4
  store ptr %p, ptr %p.addr, align 4
    #dbg_declare(ptr %p.addr, !3310, !DIExpression(), !3311)
  store ptr %m, ptr %m.addr, align 4
    #dbg_declare(ptr %m.addr, !3312, !DIExpression(), !3313)
  store ptr %mlen, ptr %mlen.addr, align 4
    #dbg_declare(ptr %mlen.addr, !3314, !DIExpression(), !3315)
  store ptr %sm, ptr %sm.addr, align 4
    #dbg_declare(ptr %sm.addr, !3316, !DIExpression(), !3317)
  store i32 %smlen, ptr %smlen.addr, align 4
    #dbg_declare(ptr %smlen.addr, !3318, !DIExpression(), !3319)
  store ptr %pk, ptr %pk.addr, align 4
    #dbg_declare(ptr %pk.addr, !3320, !DIExpression(), !3321)
    #dbg_declare(ptr %param_sig_bytes, !3322, !DIExpression(), !3323)
  %0 = load ptr, ptr %p.addr, align 4, !dbg !3324
  %sig_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %0, i32 0, i32 16, !dbg !3324
  %1 = load i32, ptr %sig_bytes, align 4, !dbg !3324
  store i32 %1, ptr %param_sig_bytes, align 4, !dbg !3323
  %2 = load i32, ptr %smlen.addr, align 4, !dbg !3325
  %3 = load i32, ptr %param_sig_bytes, align 4, !dbg !3327
  %cmp = icmp ult i32 %2, %3, !dbg !3328
  br i1 %cmp, label %if.then, label %if.end, !dbg !3328

if.then:                                          ; preds = %entry
  store i32 1, ptr %retval, align 4, !dbg !3329
  br label %return, !dbg !3329

if.end:                                           ; preds = %entry
    #dbg_declare(ptr %result, !3331, !DIExpression(), !3332)
  %4 = load ptr, ptr %p.addr, align 4, !dbg !3333
  %5 = load ptr, ptr %sm.addr, align 4, !dbg !3334
  %6 = load i32, ptr %param_sig_bytes, align 4, !dbg !3335
  %add.ptr = getelementptr inbounds i8, ptr %5, i32 %6, !dbg !3336
  %7 = load i32, ptr %smlen.addr, align 4, !dbg !3337
  %8 = load i32, ptr %param_sig_bytes, align 4, !dbg !3338
  %sub = sub i32 %7, %8, !dbg !3339
  %9 = load ptr, ptr %sm.addr, align 4, !dbg !3340
  %10 = load ptr, ptr %pk.addr, align 4, !dbg !3341
  %call = call i32 @mayo_verify(ptr noundef %4, ptr noundef %add.ptr, i32 noundef %sub, ptr noundef %9, ptr noundef %10) #5, !dbg !3342
  store i32 %call, ptr %result, align 4, !dbg !3332
  %11 = load i32, ptr %result, align 4, !dbg !3343
  %cmp1 = icmp eq i32 %11, 0, !dbg !3345
  br i1 %cmp1, label %if.then2, label %if.end6, !dbg !3345

if.then2:                                         ; preds = %if.end
  %12 = load i32, ptr %smlen.addr, align 4, !dbg !3346
  %13 = load i32, ptr %param_sig_bytes, align 4, !dbg !3348
  %sub3 = sub i32 %12, %13, !dbg !3349
  %14 = load ptr, ptr %mlen.addr, align 4, !dbg !3350
  store i32 %sub3, ptr %14, align 4, !dbg !3351
  %15 = load ptr, ptr %m.addr, align 4, !dbg !3352
  %16 = load ptr, ptr %sm.addr, align 4, !dbg !3353
  %17 = load i32, ptr %param_sig_bytes, align 4, !dbg !3354
  %add.ptr4 = getelementptr inbounds i8, ptr %16, i32 %17, !dbg !3355
  %18 = load ptr, ptr %mlen.addr, align 4, !dbg !3356
  %19 = load i32, ptr %18, align 4, !dbg !3357
  %call5 = call ptr @memmove(ptr noundef %15, ptr noundef %add.ptr4, i32 noundef %19) #5, !dbg !3358
  br label %if.end6, !dbg !3359

if.end6:                                          ; preds = %if.then2, %if.end
  %20 = load i32, ptr %result, align 4, !dbg !3360
  store i32 %20, ptr %retval, align 4, !dbg !3361
  br label %return, !dbg !3361

return:                                           ; preds = %if.end6, %if.then
  %21 = load i32, ptr %retval, align 4, !dbg !3362
  ret i32 %21, !dbg !3362
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @mayo_verify(ptr noundef %p, ptr noundef %m, i32 noundef %mlen, ptr noundef %sig, ptr noundef %cpk) #0 !dbg !3363 {
entry:
  %retval = alloca i32, align 4
  %p.addr = alloca ptr, align 4
  %m.addr = alloca ptr, align 4
  %mlen.addr = alloca i32, align 4
  %sig.addr = alloca ptr, align 4
  %cpk.addr = alloca ptr, align 4
  %tEnc = alloca [71 x i8], align 1
  %t = alloca [142 x i8], align 1
  %y = alloca [284 x i8], align 1
  %s = alloca [1848 x i8], align 1
  %pk = alloca [114480 x i64], align 8
  %tmp = alloca [104 x i8], align 1
  %param_m = alloca i32, align 4
  %param_n = alloca i32, align 4
  %param_k = alloca i32, align 4
  %param_m_bytes = alloca i32, align 4
  %param_sig_bytes = alloca i32, align 4
  %param_digest_bytes = alloca i32, align 4
  %param_salt_bytes = alloca i32, align 4
  %ret = alloca i32, align 4
  %P1 = alloca ptr, align 4
  %P2 = alloca ptr, align 4
  %P3 = alloca ptr, align 4
  store ptr %p, ptr %p.addr, align 4
    #dbg_declare(ptr %p.addr, !3366, !DIExpression(), !3367)
  store ptr %m, ptr %m.addr, align 4
    #dbg_declare(ptr %m.addr, !3368, !DIExpression(), !3369)
  store i32 %mlen, ptr %mlen.addr, align 4
    #dbg_declare(ptr %mlen.addr, !3370, !DIExpression(), !3371)
  store ptr %sig, ptr %sig.addr, align 4
    #dbg_declare(ptr %sig.addr, !3372, !DIExpression(), !3373)
  store ptr %cpk, ptr %cpk.addr, align 4
    #dbg_declare(ptr %cpk.addr, !3374, !DIExpression(), !3375)
    #dbg_declare(ptr %tEnc, !3376, !DIExpression(), !3377)
    #dbg_declare(ptr %t, !3378, !DIExpression(), !3379)
    #dbg_declare(ptr %y, !3380, !DIExpression(), !3384)
  call void @llvm.memset.p0.i32(ptr align 1 %y, i8 0, i32 284, i1 false), !dbg !3384
    #dbg_declare(ptr %s, !3385, !DIExpression(), !3386)
    #dbg_declare(ptr %pk, !3387, !DIExpression(), !3391)
  call void @llvm.memset.p0.i32(ptr align 8 %pk, i8 0, i32 915840, i1 false), !dbg !3391
    #dbg_declare(ptr %tmp, !3392, !DIExpression(), !3396)
    #dbg_declare(ptr %param_m, !3397, !DIExpression(), !3398)
  %0 = load ptr, ptr %p.addr, align 4, !dbg !3399
  %m1 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %0, i32 0, i32 0, !dbg !3399
  %1 = load i32, ptr %m1, align 4, !dbg !3399
  store i32 %1, ptr %param_m, align 4, !dbg !3398
    #dbg_declare(ptr %param_n, !3400, !DIExpression(), !3401)
  %2 = load ptr, ptr %p.addr, align 4, !dbg !3402
  %n = getelementptr inbounds nuw %struct.mayo_params_t, ptr %2, i32 0, i32 1, !dbg !3402
  %3 = load i32, ptr %n, align 4, !dbg !3402
  store i32 %3, ptr %param_n, align 4, !dbg !3401
    #dbg_declare(ptr %param_k, !3403, !DIExpression(), !3404)
  %4 = load ptr, ptr %p.addr, align 4, !dbg !3405
  %k = getelementptr inbounds nuw %struct.mayo_params_t, ptr %4, i32 0, i32 3, !dbg !3405
  %5 = load i32, ptr %k, align 4, !dbg !3405
  store i32 %5, ptr %param_k, align 4, !dbg !3404
    #dbg_declare(ptr %param_m_bytes, !3406, !DIExpression(), !3407)
  %6 = load ptr, ptr %p.addr, align 4, !dbg !3408
  %m_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %6, i32 0, i32 6, !dbg !3408
  %7 = load i32, ptr %m_bytes, align 4, !dbg !3408
  store i32 %7, ptr %param_m_bytes, align 4, !dbg !3407
    #dbg_declare(ptr %param_sig_bytes, !3409, !DIExpression(), !3410)
  %8 = load ptr, ptr %p.addr, align 4, !dbg !3411
  %sig_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %8, i32 0, i32 16, !dbg !3411
  %9 = load i32, ptr %sig_bytes, align 4, !dbg !3411
  store i32 %9, ptr %param_sig_bytes, align 4, !dbg !3410
    #dbg_declare(ptr %param_digest_bytes, !3412, !DIExpression(), !3413)
  %10 = load ptr, ptr %p.addr, align 4, !dbg !3414
  %digest_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %10, i32 0, i32 19, !dbg !3414
  %11 = load i32, ptr %digest_bytes, align 4, !dbg !3414
  store i32 %11, ptr %param_digest_bytes, align 4, !dbg !3413
    #dbg_declare(ptr %param_salt_bytes, !3415, !DIExpression(), !3416)
  %12 = load ptr, ptr %p.addr, align 4, !dbg !3417
  %salt_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %12, i32 0, i32 17, !dbg !3417
  %13 = load i32, ptr %salt_bytes, align 4, !dbg !3417
  store i32 %13, ptr %param_salt_bytes, align 4, !dbg !3416
    #dbg_declare(ptr %ret, !3418, !DIExpression(), !3419)
  %14 = load ptr, ptr %p.addr, align 4, !dbg !3420
  %15 = load ptr, ptr %cpk.addr, align 4, !dbg !3421
  %arraydecay = getelementptr inbounds [114480 x i64], ptr %pk, i32 0, i32 0, !dbg !3422
  %call = call i32 @mayo_expand_pk(ptr noundef %14, ptr noundef %15, ptr noundef %arraydecay) #5, !dbg !3423
  store i32 %call, ptr %ret, align 4, !dbg !3419
  %16 = load i32, ptr %ret, align 4, !dbg !3424
  %cmp = icmp ne i32 %16, 0, !dbg !3426
  br i1 %cmp, label %if.then, label %if.end, !dbg !3426

if.then:                                          ; preds = %entry
  store i32 1, ptr %retval, align 4, !dbg !3427
  br label %return, !dbg !3427

if.end:                                           ; preds = %entry
    #dbg_declare(ptr %P1, !3429, !DIExpression(), !3430)
  %arraydecay2 = getelementptr inbounds [114480 x i64], ptr %pk, i32 0, i32 0, !dbg !3431
  store ptr %arraydecay2, ptr %P1, align 4, !dbg !3430
    #dbg_declare(ptr %P2, !3432, !DIExpression(), !3433)
  %17 = load ptr, ptr %P1, align 4, !dbg !3434
  %18 = load ptr, ptr %p.addr, align 4, !dbg !3435
  %n3 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %18, i32 0, i32 1, !dbg !3435
  %19 = load i32, ptr %n3, align 4, !dbg !3435
  %20 = load ptr, ptr %p.addr, align 4, !dbg !3435
  %o = getelementptr inbounds nuw %struct.mayo_params_t, ptr %20, i32 0, i32 2, !dbg !3435
  %21 = load i32, ptr %o, align 4, !dbg !3435
  %sub = sub nsw i32 %19, %21, !dbg !3435
  %22 = load ptr, ptr %p.addr, align 4, !dbg !3435
  %n4 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %22, i32 0, i32 1, !dbg !3435
  %23 = load i32, ptr %n4, align 4, !dbg !3435
  %24 = load ptr, ptr %p.addr, align 4, !dbg !3435
  %o5 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %24, i32 0, i32 2, !dbg !3435
  %25 = load i32, ptr %o5, align 4, !dbg !3435
  %sub6 = sub nsw i32 %23, %25, !dbg !3435
  %add = add nsw i32 %sub6, 1, !dbg !3435
  %mul = mul nsw i32 %sub, %add, !dbg !3435
  %div = sdiv i32 %mul, 2, !dbg !3435
  %26 = load ptr, ptr %p.addr, align 4, !dbg !3435
  %m_vec_limbs = getelementptr inbounds nuw %struct.mayo_params_t, ptr %26, i32 0, i32 21, !dbg !3435
  %27 = load i32, ptr %m_vec_limbs, align 4, !dbg !3435
  %mul7 = mul nsw i32 %div, %27, !dbg !3435
  %add.ptr = getelementptr inbounds i64, ptr %17, i32 %mul7, !dbg !3436
  store ptr %add.ptr, ptr %P2, align 4, !dbg !3433
    #dbg_declare(ptr %P3, !3437, !DIExpression(), !3438)
  %28 = load ptr, ptr %P2, align 4, !dbg !3439
  %29 = load ptr, ptr %p.addr, align 4, !dbg !3440
  %n8 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %29, i32 0, i32 1, !dbg !3440
  %30 = load i32, ptr %n8, align 4, !dbg !3440
  %31 = load ptr, ptr %p.addr, align 4, !dbg !3440
  %o9 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %31, i32 0, i32 2, !dbg !3440
  %32 = load i32, ptr %o9, align 4, !dbg !3440
  %sub10 = sub nsw i32 %30, %32, !dbg !3440
  %33 = load ptr, ptr %p.addr, align 4, !dbg !3440
  %o11 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %33, i32 0, i32 2, !dbg !3440
  %34 = load i32, ptr %o11, align 4, !dbg !3440
  %mul12 = mul nsw i32 %sub10, %34, !dbg !3440
  %35 = load ptr, ptr %p.addr, align 4, !dbg !3440
  %m_vec_limbs13 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %35, i32 0, i32 21, !dbg !3440
  %36 = load i32, ptr %m_vec_limbs13, align 4, !dbg !3440
  %mul14 = mul nsw i32 %mul12, %36, !dbg !3440
  %add.ptr15 = getelementptr inbounds i64, ptr %28, i32 %mul14, !dbg !3441
  store ptr %add.ptr15, ptr %P3, align 4, !dbg !3438
  %arraydecay16 = getelementptr inbounds [104 x i8], ptr %tmp, i32 0, i32 0, !dbg !3442
  %37 = load i32, ptr %param_digest_bytes, align 4, !dbg !3443
  %38 = load ptr, ptr %m.addr, align 4, !dbg !3444
  %39 = load i32, ptr %mlen.addr, align 4, !dbg !3445
  %call17 = call i32 @shake256(ptr noundef %arraydecay16, i32 noundef %37, ptr noundef %38, i32 noundef %39) #5, !dbg !3446
  %arraydecay18 = getelementptr inbounds [104 x i8], ptr %tmp, i32 0, i32 0, !dbg !3447
  %40 = load i32, ptr %param_digest_bytes, align 4, !dbg !3448
  %add.ptr19 = getelementptr inbounds i8, ptr %arraydecay18, i32 %40, !dbg !3449
  %41 = load ptr, ptr %sig.addr, align 4, !dbg !3450
  %42 = load i32, ptr %param_sig_bytes, align 4, !dbg !3451
  %add.ptr20 = getelementptr inbounds i8, ptr %41, i32 %42, !dbg !3452
  %43 = load i32, ptr %param_salt_bytes, align 4, !dbg !3453
  %idx.neg = sub i32 0, %43, !dbg !3454
  %add.ptr21 = getelementptr inbounds i8, ptr %add.ptr20, i32 %idx.neg, !dbg !3454
  %44 = load i32, ptr %param_salt_bytes, align 4, !dbg !3455
  %call22 = call ptr @memcpy(ptr noundef %add.ptr19, ptr noundef %add.ptr21, i32 noundef %44) #5, !dbg !3456
  %arraydecay23 = getelementptr inbounds [71 x i8], ptr %tEnc, i32 0, i32 0, !dbg !3457
  %45 = load i32, ptr %param_m_bytes, align 4, !dbg !3458
  %arraydecay24 = getelementptr inbounds [104 x i8], ptr %tmp, i32 0, i32 0, !dbg !3459
  %46 = load i32, ptr %param_digest_bytes, align 4, !dbg !3460
  %47 = load i32, ptr %param_salt_bytes, align 4, !dbg !3461
  %add25 = add nsw i32 %46, %47, !dbg !3462
  %call26 = call i32 @shake256(ptr noundef %arraydecay23, i32 noundef %45, ptr noundef %arraydecay24, i32 noundef %add25) #5, !dbg !3463
  %arraydecay27 = getelementptr inbounds [71 x i8], ptr %tEnc, i32 0, i32 0, !dbg !3464
  %arraydecay28 = getelementptr inbounds [142 x i8], ptr %t, i32 0, i32 0, !dbg !3465
  %48 = load i32, ptr %param_m, align 4, !dbg !3466
  call void @decode(ptr noundef %arraydecay27, ptr noundef %arraydecay28, i32 noundef %48) #5, !dbg !3467
  %49 = load ptr, ptr %sig.addr, align 4, !dbg !3468
  %arraydecay29 = getelementptr inbounds [1848 x i8], ptr %s, i32 0, i32 0, !dbg !3469
  %50 = load i32, ptr %param_k, align 4, !dbg !3470
  %51 = load i32, ptr %param_n, align 4, !dbg !3471
  %mul30 = mul nsw i32 %50, %51, !dbg !3472
  call void @decode(ptr noundef %49, ptr noundef %arraydecay29, i32 noundef %mul30) #5, !dbg !3473
  %52 = load ptr, ptr %p.addr, align 4, !dbg !3474
  %arraydecay31 = getelementptr inbounds [1848 x i8], ptr %s, i32 0, i32 0, !dbg !3475
  %53 = load ptr, ptr %P1, align 4, !dbg !3476
  %54 = load ptr, ptr %P2, align 4, !dbg !3477
  %55 = load ptr, ptr %P3, align 4, !dbg !3478
  %arraydecay32 = getelementptr inbounds [284 x i8], ptr %y, i32 0, i32 0, !dbg !3479
  call void @eval_public_map(ptr noundef %52, ptr noundef %arraydecay31, ptr noundef %53, ptr noundef %54, ptr noundef %55, ptr noundef %arraydecay32) #5, !dbg !3480
  %arraydecay33 = getelementptr inbounds [284 x i8], ptr %y, i32 0, i32 0, !dbg !3481
  %arraydecay34 = getelementptr inbounds [142 x i8], ptr %t, i32 0, i32 0, !dbg !3483
  %56 = load i32, ptr %param_m, align 4, !dbg !3484
  %call35 = call i32 @memcmp(ptr noundef %arraydecay33, ptr noundef %arraydecay34, i32 noundef %56) #5, !dbg !3485
  %cmp36 = icmp eq i32 %call35, 0, !dbg !3486
  br i1 %cmp36, label %if.then37, label %if.end38, !dbg !3486

if.then37:                                        ; preds = %if.end
  store i32 0, ptr %retval, align 4, !dbg !3487
  br label %return, !dbg !3487

if.end38:                                         ; preds = %if.end
  store i32 1, ptr %retval, align 4, !dbg !3489
  br label %return, !dbg !3489

return:                                           ; preds = %if.end38, %if.then37, %if.then
  %57 = load i32, ptr %retval, align 4, !dbg !3490
  ret i32 %57, !dbg !3490
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @mayo_expand_pk(ptr noundef %p, ptr noundef %cpk, ptr noundef %pk) #0 !dbg !3491 {
entry:
  %p.addr = alloca ptr, align 4
  %cpk.addr = alloca ptr, align 4
  %pk.addr = alloca ptr, align 4
  store ptr %p, ptr %p.addr, align 4
    #dbg_declare(ptr %p.addr, !3494, !DIExpression(), !3495)
  store ptr %cpk, ptr %cpk.addr, align 4
    #dbg_declare(ptr %cpk.addr, !3496, !DIExpression(), !3497)
  store ptr %pk, ptr %pk.addr, align 4
    #dbg_declare(ptr %pk.addr, !3498, !DIExpression(), !3499)
  %0 = load ptr, ptr %p.addr, align 4, !dbg !3500
  %1 = load ptr, ptr %pk.addr, align 4, !dbg !3501
  %2 = load ptr, ptr %cpk.addr, align 4, !dbg !3502
  call void @expand_P1_P2(ptr noundef %0, ptr noundef %1, ptr noundef %2) #5, !dbg !3503
  %3 = load ptr, ptr %cpk.addr, align 4, !dbg !3504
  %4 = load ptr, ptr %p.addr, align 4, !dbg !3505
  %pk_seed_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %4, i32 0, i32 20, !dbg !3505
  %5 = load i32, ptr %pk_seed_bytes, align 4, !dbg !3505
  %add.ptr = getelementptr inbounds i8, ptr %3, i32 %5, !dbg !3506
  %6 = load ptr, ptr %pk.addr, align 4, !dbg !3507
  %7 = load ptr, ptr %p.addr, align 4, !dbg !3508
  %n = getelementptr inbounds nuw %struct.mayo_params_t, ptr %7, i32 0, i32 1, !dbg !3508
  %8 = load i32, ptr %n, align 4, !dbg !3508
  %9 = load ptr, ptr %p.addr, align 4, !dbg !3508
  %o = getelementptr inbounds nuw %struct.mayo_params_t, ptr %9, i32 0, i32 2, !dbg !3508
  %10 = load i32, ptr %o, align 4, !dbg !3508
  %sub = sub nsw i32 %8, %10, !dbg !3508
  %11 = load ptr, ptr %p.addr, align 4, !dbg !3508
  %n1 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %11, i32 0, i32 1, !dbg !3508
  %12 = load i32, ptr %n1, align 4, !dbg !3508
  %13 = load ptr, ptr %p.addr, align 4, !dbg !3508
  %o2 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %13, i32 0, i32 2, !dbg !3508
  %14 = load i32, ptr %o2, align 4, !dbg !3508
  %sub3 = sub nsw i32 %12, %14, !dbg !3508
  %add = add nsw i32 %sub3, 1, !dbg !3508
  %mul = mul nsw i32 %sub, %add, !dbg !3508
  %div = sdiv i32 %mul, 2, !dbg !3508
  %15 = load ptr, ptr %p.addr, align 4, !dbg !3508
  %m_vec_limbs = getelementptr inbounds nuw %struct.mayo_params_t, ptr %15, i32 0, i32 21, !dbg !3508
  %16 = load i32, ptr %m_vec_limbs, align 4, !dbg !3508
  %mul4 = mul nsw i32 %div, %16, !dbg !3508
  %add.ptr5 = getelementptr inbounds i64, ptr %6, i32 %mul4, !dbg !3509
  %17 = load ptr, ptr %p.addr, align 4, !dbg !3510
  %n6 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %17, i32 0, i32 1, !dbg !3510
  %18 = load i32, ptr %n6, align 4, !dbg !3510
  %19 = load ptr, ptr %p.addr, align 4, !dbg !3510
  %o7 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %19, i32 0, i32 2, !dbg !3510
  %20 = load i32, ptr %o7, align 4, !dbg !3510
  %sub8 = sub nsw i32 %18, %20, !dbg !3510
  %21 = load ptr, ptr %p.addr, align 4, !dbg !3510
  %o9 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %21, i32 0, i32 2, !dbg !3510
  %22 = load i32, ptr %o9, align 4, !dbg !3510
  %mul10 = mul nsw i32 %sub8, %22, !dbg !3510
  %23 = load ptr, ptr %p.addr, align 4, !dbg !3510
  %m_vec_limbs11 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %23, i32 0, i32 21, !dbg !3510
  %24 = load i32, ptr %m_vec_limbs11, align 4, !dbg !3510
  %mul12 = mul nsw i32 %mul10, %24, !dbg !3510
  %add.ptr13 = getelementptr inbounds i64, ptr %add.ptr5, i32 %mul12, !dbg !3511
  %25 = load ptr, ptr %p.addr, align 4, !dbg !3512
  %o14 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %25, i32 0, i32 2, !dbg !3512
  %26 = load i32, ptr %o14, align 4, !dbg !3512
  %27 = load ptr, ptr %p.addr, align 4, !dbg !3512
  %o15 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %27, i32 0, i32 2, !dbg !3512
  %28 = load i32, ptr %o15, align 4, !dbg !3512
  %add16 = add nsw i32 %28, 1, !dbg !3512
  %mul17 = mul nsw i32 %26, %add16, !dbg !3512
  %div18 = sdiv i32 %mul17, 2, !dbg !3512
  %29 = load ptr, ptr %p.addr, align 4, !dbg !3512
  %m_vec_limbs19 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %29, i32 0, i32 21, !dbg !3512
  %30 = load i32, ptr %m_vec_limbs19, align 4, !dbg !3512
  %mul20 = mul nsw i32 %div18, %30, !dbg !3512
  %31 = load ptr, ptr %p.addr, align 4, !dbg !3513
  %m_vec_limbs21 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %31, i32 0, i32 21, !dbg !3513
  %32 = load i32, ptr %m_vec_limbs21, align 4, !dbg !3513
  %div22 = sdiv i32 %mul20, %32, !dbg !3514
  %33 = load ptr, ptr %p.addr, align 4, !dbg !3515
  %m = getelementptr inbounds nuw %struct.mayo_params_t, ptr %33, i32 0, i32 0, !dbg !3515
  %34 = load i32, ptr %m, align 4, !dbg !3515
  call void @unpack_m_vecs(ptr noundef %add.ptr, ptr noundef %add.ptr13, i32 noundef %div22, i32 noundef %34) #5, !dbg !3516
  ret i32 0, !dbg !3517
}

; Function Attrs: noinline nounwind optnone
define internal void @eval_public_map(ptr noundef %p, ptr noundef %s, ptr noundef %P1, ptr noundef %P2, ptr noundef %P3, ptr noundef %eval) #0 !dbg !3518 {
entry:
  %p.addr = alloca ptr, align 4
  %s.addr = alloca ptr, align 4
  %P1.addr = alloca ptr, align 4
  %P2.addr = alloca ptr, align 4
  %P3.addr = alloca ptr, align 4
  %eval.addr = alloca ptr, align 4
  %SPS = alloca [1296 x i64], align 8
  %zero = alloca [142 x i8], align 1
  store ptr %p, ptr %p.addr, align 4
    #dbg_declare(ptr %p.addr, !3521, !DIExpression(), !3522)
  store ptr %s, ptr %s.addr, align 4
    #dbg_declare(ptr %s.addr, !3523, !DIExpression(), !3524)
  store ptr %P1, ptr %P1.addr, align 4
    #dbg_declare(ptr %P1.addr, !3525, !DIExpression(), !3526)
  store ptr %P2, ptr %P2.addr, align 4
    #dbg_declare(ptr %P2.addr, !3527, !DIExpression(), !3528)
  store ptr %P3, ptr %P3.addr, align 4
    #dbg_declare(ptr %P3.addr, !3529, !DIExpression(), !3530)
  store ptr %eval, ptr %eval.addr, align 4
    #dbg_declare(ptr %eval.addr, !3531, !DIExpression(), !3532)
    #dbg_declare(ptr %SPS, !3533, !DIExpression(), !3537)
  call void @llvm.memset.p0.i32(ptr align 8 %SPS, i8 0, i32 10368, i1 false), !dbg !3537
  %0 = load ptr, ptr %p.addr, align 4, !dbg !3538
  %1 = load ptr, ptr %P1.addr, align 4, !dbg !3539
  %2 = load ptr, ptr %P2.addr, align 4, !dbg !3540
  %3 = load ptr, ptr %P3.addr, align 4, !dbg !3541
  %4 = load ptr, ptr %s.addr, align 4, !dbg !3542
  %arraydecay = getelementptr inbounds [1296 x i64], ptr %SPS, i32 0, i32 0, !dbg !3543
  call void @m_calculate_PS_SPS(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %arraydecay) #5, !dbg !3544
    #dbg_declare(ptr %zero, !3545, !DIExpression(), !3546)
  call void @llvm.memset.p0.i32(ptr align 1 %zero, i8 0, i32 142, i1 false), !dbg !3546
  %5 = load ptr, ptr %p.addr, align 4, !dbg !3547
  %arraydecay1 = getelementptr inbounds [1296 x i64], ptr %SPS, i32 0, i32 0, !dbg !3548
  %arraydecay2 = getelementptr inbounds [142 x i8], ptr %zero, i32 0, i32 0, !dbg !3549
  %6 = load ptr, ptr %eval.addr, align 4, !dbg !3550
  call void @compute_rhs(ptr noundef %5, ptr noundef %arraydecay1, ptr noundef %arraydecay2, ptr noundef %6) #5, !dbg !3551
  ret void, !dbg !3552
}

; Function Attrs: noinline nounwind optnone
define internal void @m_calculate_PS_SPS(ptr noundef %p, ptr noundef %P1, ptr noundef %P2, ptr noundef %P3, ptr noundef %s, ptr noundef %SPS) #0 !dbg !3553 {
entry:
  %p.addr = alloca ptr, align 4
  %P1.addr = alloca ptr, align 4
  %P2.addr = alloca ptr, align 4
  %P3.addr = alloca ptr, align 4
  %s.addr = alloca ptr, align 4
  %SPS.addr = alloca ptr, align 4
  %PS = alloca [16632 x i64], align 8
  store ptr %p, ptr %p.addr, align 4
    #dbg_declare(ptr %p.addr, !3556, !DIExpression(), !3557)
  store ptr %P1, ptr %P1.addr, align 4
    #dbg_declare(ptr %P1.addr, !3558, !DIExpression(), !3559)
  store ptr %P2, ptr %P2.addr, align 4
    #dbg_declare(ptr %P2.addr, !3560, !DIExpression(), !3561)
  store ptr %P3, ptr %P3.addr, align 4
    #dbg_declare(ptr %P3.addr, !3562, !DIExpression(), !3563)
  store ptr %s, ptr %s.addr, align 4
    #dbg_declare(ptr %s.addr, !3564, !DIExpression(), !3565)
  store ptr %SPS, ptr %SPS.addr, align 4
    #dbg_declare(ptr %SPS.addr, !3566, !DIExpression(), !3567)
    #dbg_declare(ptr %PS, !3568, !DIExpression(), !3572)
  call void @llvm.memset.p0.i32(ptr align 8 %PS, i8 0, i32 133056, i1 false), !dbg !3572
  %0 = load ptr, ptr %P1.addr, align 4, !dbg !3573
  %1 = load ptr, ptr %P2.addr, align 4, !dbg !3574
  %2 = load ptr, ptr %P3.addr, align 4, !dbg !3575
  %3 = load ptr, ptr %s.addr, align 4, !dbg !3576
  %4 = load ptr, ptr %p.addr, align 4, !dbg !3577
  %m = getelementptr inbounds nuw %struct.mayo_params_t, ptr %4, i32 0, i32 0, !dbg !3577
  %5 = load i32, ptr %m, align 4, !dbg !3577
  %6 = load ptr, ptr %p.addr, align 4, !dbg !3578
  %n = getelementptr inbounds nuw %struct.mayo_params_t, ptr %6, i32 0, i32 1, !dbg !3578
  %7 = load i32, ptr %n, align 4, !dbg !3578
  %8 = load ptr, ptr %p.addr, align 4, !dbg !3578
  %o = getelementptr inbounds nuw %struct.mayo_params_t, ptr %8, i32 0, i32 2, !dbg !3578
  %9 = load i32, ptr %o, align 4, !dbg !3578
  %sub = sub nsw i32 %7, %9, !dbg !3578
  %10 = load ptr, ptr %p.addr, align 4, !dbg !3579
  %o1 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %10, i32 0, i32 2, !dbg !3579
  %11 = load i32, ptr %o1, align 4, !dbg !3579
  %12 = load ptr, ptr %p.addr, align 4, !dbg !3580
  %k = getelementptr inbounds nuw %struct.mayo_params_t, ptr %12, i32 0, i32 3, !dbg !3580
  %13 = load i32, ptr %k, align 4, !dbg !3580
  %arraydecay = getelementptr inbounds [16632 x i64], ptr %PS, i32 0, i32 0, !dbg !3581
  call void @mayo_generic_m_calculate_PS(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, i32 noundef %5, i32 noundef %sub, i32 noundef %11, i32 noundef %13, ptr noundef %arraydecay) #5, !dbg !3582
  %arraydecay2 = getelementptr inbounds [16632 x i64], ptr %PS, i32 0, i32 0, !dbg !3583
  %14 = load ptr, ptr %s.addr, align 4, !dbg !3584
  %15 = load ptr, ptr %p.addr, align 4, !dbg !3585
  %m3 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %15, i32 0, i32 0, !dbg !3585
  %16 = load i32, ptr %m3, align 4, !dbg !3585
  %17 = load ptr, ptr %p.addr, align 4, !dbg !3586
  %k4 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %17, i32 0, i32 3, !dbg !3586
  %18 = load i32, ptr %k4, align 4, !dbg !3586
  %19 = load ptr, ptr %p.addr, align 4, !dbg !3587
  %n5 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %19, i32 0, i32 1, !dbg !3587
  %20 = load i32, ptr %n5, align 4, !dbg !3587
  %21 = load ptr, ptr %SPS.addr, align 4, !dbg !3588
  call void @mayo_generic_m_calculate_SPS(ptr noundef %arraydecay2, ptr noundef %14, i32 noundef %16, i32 noundef %18, i32 noundef %20, ptr noundef %21) #5, !dbg !3589
  ret void, !dbg !3590
}

; Function Attrs: noinline nounwind optnone
define internal void @mayo_generic_m_calculate_PS(ptr noundef %P1, ptr noundef %P2, ptr noundef %P3, ptr noundef %S, i32 noundef %m, i32 noundef %v, i32 noundef %o, i32 noundef %k, ptr noundef %PS) #0 !dbg !3591 {
entry:
  %P1.addr = alloca ptr, align 4
  %P2.addr = alloca ptr, align 4
  %P3.addr = alloca ptr, align 4
  %S.addr = alloca ptr, align 4
  %m.addr = alloca i32, align 4
  %v.addr = alloca i32, align 4
  %o.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  %PS.addr = alloca ptr, align 4
  %n = alloca i32, align 4
  %m_vec_limbs = alloca i32, align 4
  %accumulator = alloca [266112 x i64], align 8
  %P1_used = alloca i32, align 4
  %row = alloca i32, align 4
  %j = alloca i32, align 4
  %col = alloca i32, align 4
  %j20 = alloca i32, align 4
  %col25 = alloca i32, align 4
  %P3_used = alloca i32, align 4
  %row55 = alloca i32, align 4
  %j60 = alloca i32, align 4
  %col65 = alloca i32, align 4
  %i = alloca i32, align 4
  store ptr %P1, ptr %P1.addr, align 4
    #dbg_declare(ptr %P1.addr, !3594, !DIExpression(), !3595)
  store ptr %P2, ptr %P2.addr, align 4
    #dbg_declare(ptr %P2.addr, !3596, !DIExpression(), !3597)
  store ptr %P3, ptr %P3.addr, align 4
    #dbg_declare(ptr %P3.addr, !3598, !DIExpression(), !3599)
  store ptr %S, ptr %S.addr, align 4
    #dbg_declare(ptr %S.addr, !3600, !DIExpression(), !3601)
  store i32 %m, ptr %m.addr, align 4
    #dbg_declare(ptr %m.addr, !3602, !DIExpression(), !3603)
  store i32 %v, ptr %v.addr, align 4
    #dbg_declare(ptr %v.addr, !3604, !DIExpression(), !3605)
  store i32 %o, ptr %o.addr, align 4
    #dbg_declare(ptr %o.addr, !3606, !DIExpression(), !3607)
  store i32 %k, ptr %k.addr, align 4
    #dbg_declare(ptr %k.addr, !3608, !DIExpression(), !3609)
  store ptr %PS, ptr %PS.addr, align 4
    #dbg_declare(ptr %PS.addr, !3610, !DIExpression(), !3611)
    #dbg_declare(ptr %n, !3612, !DIExpression(), !3613)
  %0 = load i32, ptr %o.addr, align 4, !dbg !3614
  %1 = load i32, ptr %v.addr, align 4, !dbg !3615
  %add = add nsw i32 %0, %1, !dbg !3616
  store i32 %add, ptr %n, align 4, !dbg !3613
    #dbg_declare(ptr %m_vec_limbs, !3617, !DIExpression(), !3618)
  %2 = load i32, ptr %m.addr, align 4, !dbg !3619
  %add1 = add nsw i32 %2, 15, !dbg !3620
  %div = sdiv i32 %add1, 16, !dbg !3621
  store i32 %div, ptr %m_vec_limbs, align 4, !dbg !3618
    #dbg_declare(ptr %accumulator, !3622, !DIExpression(), !3626)
  call void @llvm.memset.p0.i32(ptr align 8 %accumulator, i8 0, i32 2128896, i1 false), !dbg !3626
    #dbg_declare(ptr %P1_used, !3627, !DIExpression(), !3628)
  store i32 0, ptr %P1_used, align 4, !dbg !3628
    #dbg_declare(ptr %row, !3629, !DIExpression(), !3631)
  store i32 0, ptr %row, align 4, !dbg !3631
  br label %for.cond, !dbg !3632

for.cond:                                         ; preds = %for.inc52, %entry
  %3 = load i32, ptr %row, align 4, !dbg !3633
  %4 = load i32, ptr %v.addr, align 4, !dbg !3635
  %cmp = icmp slt i32 %3, %4, !dbg !3636
  br i1 %cmp, label %for.body, label %for.end54, !dbg !3637

for.body:                                         ; preds = %for.cond
    #dbg_declare(ptr %j, !3638, !DIExpression(), !3641)
  %5 = load i32, ptr %row, align 4, !dbg !3642
  store i32 %5, ptr %j, align 4, !dbg !3641
  br label %for.cond2, !dbg !3643

for.cond2:                                        ; preds = %for.inc17, %for.body
  %6 = load i32, ptr %j, align 4, !dbg !3644
  %7 = load i32, ptr %v.addr, align 4, !dbg !3646
  %cmp3 = icmp slt i32 %6, %7, !dbg !3647
  br i1 %cmp3, label %for.body4, label %for.end19, !dbg !3648

for.body4:                                        ; preds = %for.cond2
    #dbg_declare(ptr %col, !3649, !DIExpression(), !3652)
  store i32 0, ptr %col, align 4, !dbg !3652
  br label %for.cond5, !dbg !3653

for.cond5:                                        ; preds = %for.inc, %for.body4
  %8 = load i32, ptr %col, align 4, !dbg !3654
  %9 = load i32, ptr %k.addr, align 4, !dbg !3656
  %cmp6 = icmp slt i32 %8, %9, !dbg !3657
  br i1 %cmp6, label %for.body7, label %for.end, !dbg !3658

for.body7:                                        ; preds = %for.cond5
  %10 = load i32, ptr %m_vec_limbs, align 4, !dbg !3659
  %11 = load ptr, ptr %P1.addr, align 4, !dbg !3661
  %12 = load i32, ptr %P1_used, align 4, !dbg !3662
  %13 = load i32, ptr %m_vec_limbs, align 4, !dbg !3663
  %mul = mul nsw i32 %12, %13, !dbg !3664
  %add.ptr = getelementptr inbounds i64, ptr %11, i32 %mul, !dbg !3665
  %arraydecay = getelementptr inbounds [266112 x i64], ptr %accumulator, i32 0, i32 0, !dbg !3666
  %14 = load i32, ptr %row, align 4, !dbg !3667
  %15 = load i32, ptr %k.addr, align 4, !dbg !3668
  %mul8 = mul nsw i32 %14, %15, !dbg !3669
  %16 = load i32, ptr %col, align 4, !dbg !3670
  %add9 = add nsw i32 %mul8, %16, !dbg !3671
  %mul10 = mul nsw i32 %add9, 16, !dbg !3672
  %17 = load ptr, ptr %S.addr, align 4, !dbg !3673
  %18 = load i32, ptr %col, align 4, !dbg !3674
  %19 = load i32, ptr %n, align 4, !dbg !3675
  %mul11 = mul nsw i32 %18, %19, !dbg !3676
  %20 = load i32, ptr %j, align 4, !dbg !3677
  %add12 = add nsw i32 %mul11, %20, !dbg !3678
  %arrayidx = getelementptr inbounds i8, ptr %17, i32 %add12, !dbg !3673
  %21 = load i8, ptr %arrayidx, align 1, !dbg !3673
  %conv = zext i8 %21 to i32, !dbg !3673
  %add13 = add nsw i32 %mul10, %conv, !dbg !3679
  %22 = load i32, ptr %m_vec_limbs, align 4, !dbg !3680
  %mul14 = mul nsw i32 %add13, %22, !dbg !3681
  %add.ptr15 = getelementptr inbounds i64, ptr %arraydecay, i32 %mul14, !dbg !3682
  call void @m_vec_add(i32 noundef %10, ptr noundef %add.ptr, ptr noundef %add.ptr15) #5, !dbg !3683
  br label %for.inc, !dbg !3684

for.inc:                                          ; preds = %for.body7
  %23 = load i32, ptr %col, align 4, !dbg !3685
  %inc = add nsw i32 %23, 1, !dbg !3685
  store i32 %inc, ptr %col, align 4, !dbg !3685
  br label %for.cond5, !dbg !3686, !llvm.loop !3687

for.end:                                          ; preds = %for.cond5
  %24 = load i32, ptr %P1_used, align 4, !dbg !3689
  %inc16 = add nsw i32 %24, 1, !dbg !3689
  store i32 %inc16, ptr %P1_used, align 4, !dbg !3689
  br label %for.inc17, !dbg !3690

for.inc17:                                        ; preds = %for.end
  %25 = load i32, ptr %j, align 4, !dbg !3691
  %inc18 = add nsw i32 %25, 1, !dbg !3691
  store i32 %inc18, ptr %j, align 4, !dbg !3691
  br label %for.cond2, !dbg !3692, !llvm.loop !3693

for.end19:                                        ; preds = %for.cond2
    #dbg_declare(ptr %j20, !3695, !DIExpression(), !3697)
  store i32 0, ptr %j20, align 4, !dbg !3697
  br label %for.cond21, !dbg !3698

for.cond21:                                       ; preds = %for.inc49, %for.end19
  %26 = load i32, ptr %j20, align 4, !dbg !3699
  %27 = load i32, ptr %o.addr, align 4, !dbg !3701
  %cmp22 = icmp slt i32 %26, %27, !dbg !3702
  br i1 %cmp22, label %for.body24, label %for.end51, !dbg !3703

for.body24:                                       ; preds = %for.cond21
    #dbg_declare(ptr %col25, !3704, !DIExpression(), !3707)
  store i32 0, ptr %col25, align 4, !dbg !3707
  br label %for.cond26, !dbg !3708

for.cond26:                                       ; preds = %for.inc46, %for.body24
  %28 = load i32, ptr %col25, align 4, !dbg !3709
  %29 = load i32, ptr %k.addr, align 4, !dbg !3711
  %cmp27 = icmp slt i32 %28, %29, !dbg !3712
  br i1 %cmp27, label %for.body29, label %for.end48, !dbg !3713

for.body29:                                       ; preds = %for.cond26
  %30 = load i32, ptr %m_vec_limbs, align 4, !dbg !3714
  %31 = load ptr, ptr %P2.addr, align 4, !dbg !3716
  %32 = load i32, ptr %row, align 4, !dbg !3717
  %33 = load i32, ptr %o.addr, align 4, !dbg !3718
  %mul30 = mul nsw i32 %32, %33, !dbg !3719
  %34 = load i32, ptr %j20, align 4, !dbg !3720
  %add31 = add nsw i32 %mul30, %34, !dbg !3721
  %35 = load i32, ptr %m_vec_limbs, align 4, !dbg !3722
  %mul32 = mul nsw i32 %add31, %35, !dbg !3723
  %add.ptr33 = getelementptr inbounds i64, ptr %31, i32 %mul32, !dbg !3724
  %arraydecay34 = getelementptr inbounds [266112 x i64], ptr %accumulator, i32 0, i32 0, !dbg !3725
  %36 = load i32, ptr %row, align 4, !dbg !3726
  %37 = load i32, ptr %k.addr, align 4, !dbg !3727
  %mul35 = mul nsw i32 %36, %37, !dbg !3728
  %38 = load i32, ptr %col25, align 4, !dbg !3729
  %add36 = add nsw i32 %mul35, %38, !dbg !3730
  %mul37 = mul nsw i32 %add36, 16, !dbg !3731
  %39 = load ptr, ptr %S.addr, align 4, !dbg !3732
  %40 = load i32, ptr %col25, align 4, !dbg !3733
  %41 = load i32, ptr %n, align 4, !dbg !3734
  %mul38 = mul nsw i32 %40, %41, !dbg !3735
  %42 = load i32, ptr %j20, align 4, !dbg !3736
  %add39 = add nsw i32 %mul38, %42, !dbg !3737
  %43 = load i32, ptr %v.addr, align 4, !dbg !3738
  %add40 = add nsw i32 %add39, %43, !dbg !3739
  %arrayidx41 = getelementptr inbounds i8, ptr %39, i32 %add40, !dbg !3732
  %44 = load i8, ptr %arrayidx41, align 1, !dbg !3732
  %conv42 = zext i8 %44 to i32, !dbg !3732
  %add43 = add nsw i32 %mul37, %conv42, !dbg !3740
  %45 = load i32, ptr %m_vec_limbs, align 4, !dbg !3741
  %mul44 = mul nsw i32 %add43, %45, !dbg !3742
  %add.ptr45 = getelementptr inbounds i64, ptr %arraydecay34, i32 %mul44, !dbg !3743
  call void @m_vec_add(i32 noundef %30, ptr noundef %add.ptr33, ptr noundef %add.ptr45) #5, !dbg !3744
  br label %for.inc46, !dbg !3745

for.inc46:                                        ; preds = %for.body29
  %46 = load i32, ptr %col25, align 4, !dbg !3746
  %inc47 = add nsw i32 %46, 1, !dbg !3746
  store i32 %inc47, ptr %col25, align 4, !dbg !3746
  br label %for.cond26, !dbg !3747, !llvm.loop !3748

for.end48:                                        ; preds = %for.cond26
  br label %for.inc49, !dbg !3750

for.inc49:                                        ; preds = %for.end48
  %47 = load i32, ptr %j20, align 4, !dbg !3751
  %inc50 = add nsw i32 %47, 1, !dbg !3751
  store i32 %inc50, ptr %j20, align 4, !dbg !3751
  br label %for.cond21, !dbg !3752, !llvm.loop !3753

for.end51:                                        ; preds = %for.cond21
  br label %for.inc52, !dbg !3755

for.inc52:                                        ; preds = %for.end51
  %48 = load i32, ptr %row, align 4, !dbg !3756
  %inc53 = add nsw i32 %48, 1, !dbg !3756
  store i32 %inc53, ptr %row, align 4, !dbg !3756
  br label %for.cond, !dbg !3757, !llvm.loop !3758

for.end54:                                        ; preds = %for.cond
    #dbg_declare(ptr %P3_used, !3760, !DIExpression(), !3761)
  store i32 0, ptr %P3_used, align 4, !dbg !3761
    #dbg_declare(ptr %row55, !3762, !DIExpression(), !3764)
  %49 = load i32, ptr %v.addr, align 4, !dbg !3765
  store i32 %49, ptr %row55, align 4, !dbg !3764
  br label %for.cond56, !dbg !3766

for.cond56:                                       ; preds = %for.inc90, %for.end54
  %50 = load i32, ptr %row55, align 4, !dbg !3767
  %51 = load i32, ptr %n, align 4, !dbg !3769
  %cmp57 = icmp slt i32 %50, %51, !dbg !3770
  br i1 %cmp57, label %for.body59, label %for.end92, !dbg !3771

for.body59:                                       ; preds = %for.cond56
    #dbg_declare(ptr %j60, !3772, !DIExpression(), !3775)
  %52 = load i32, ptr %row55, align 4, !dbg !3776
  store i32 %52, ptr %j60, align 4, !dbg !3775
  br label %for.cond61, !dbg !3777

for.cond61:                                       ; preds = %for.inc87, %for.body59
  %53 = load i32, ptr %j60, align 4, !dbg !3778
  %54 = load i32, ptr %n, align 4, !dbg !3780
  %cmp62 = icmp slt i32 %53, %54, !dbg !3781
  br i1 %cmp62, label %for.body64, label %for.end89, !dbg !3782

for.body64:                                       ; preds = %for.cond61
    #dbg_declare(ptr %col65, !3783, !DIExpression(), !3786)
  store i32 0, ptr %col65, align 4, !dbg !3786
  br label %for.cond66, !dbg !3787

for.cond66:                                       ; preds = %for.inc83, %for.body64
  %55 = load i32, ptr %col65, align 4, !dbg !3788
  %56 = load i32, ptr %k.addr, align 4, !dbg !3790
  %cmp67 = icmp slt i32 %55, %56, !dbg !3791
  br i1 %cmp67, label %for.body69, label %for.end85, !dbg !3792

for.body69:                                       ; preds = %for.cond66
  %57 = load i32, ptr %m_vec_limbs, align 4, !dbg !3793
  %58 = load ptr, ptr %P3.addr, align 4, !dbg !3795
  %59 = load i32, ptr %P3_used, align 4, !dbg !3796
  %60 = load i32, ptr %m_vec_limbs, align 4, !dbg !3797
  %mul70 = mul nsw i32 %59, %60, !dbg !3798
  %add.ptr71 = getelementptr inbounds i64, ptr %58, i32 %mul70, !dbg !3799
  %arraydecay72 = getelementptr inbounds [266112 x i64], ptr %accumulator, i32 0, i32 0, !dbg !3800
  %61 = load i32, ptr %row55, align 4, !dbg !3801
  %62 = load i32, ptr %k.addr, align 4, !dbg !3802
  %mul73 = mul nsw i32 %61, %62, !dbg !3803
  %63 = load i32, ptr %col65, align 4, !dbg !3804
  %add74 = add nsw i32 %mul73, %63, !dbg !3805
  %mul75 = mul nsw i32 %add74, 16, !dbg !3806
  %64 = load ptr, ptr %S.addr, align 4, !dbg !3807
  %65 = load i32, ptr %col65, align 4, !dbg !3808
  %66 = load i32, ptr %n, align 4, !dbg !3809
  %mul76 = mul nsw i32 %65, %66, !dbg !3810
  %67 = load i32, ptr %j60, align 4, !dbg !3811
  %add77 = add nsw i32 %mul76, %67, !dbg !3812
  %arrayidx78 = getelementptr inbounds i8, ptr %64, i32 %add77, !dbg !3807
  %68 = load i8, ptr %arrayidx78, align 1, !dbg !3807
  %conv79 = zext i8 %68 to i32, !dbg !3807
  %add80 = add nsw i32 %mul75, %conv79, !dbg !3813
  %69 = load i32, ptr %m_vec_limbs, align 4, !dbg !3814
  %mul81 = mul nsw i32 %add80, %69, !dbg !3815
  %add.ptr82 = getelementptr inbounds i64, ptr %arraydecay72, i32 %mul81, !dbg !3816
  call void @m_vec_add(i32 noundef %57, ptr noundef %add.ptr71, ptr noundef %add.ptr82) #5, !dbg !3817
  br label %for.inc83, !dbg !3818

for.inc83:                                        ; preds = %for.body69
  %70 = load i32, ptr %col65, align 4, !dbg !3819
  %inc84 = add nsw i32 %70, 1, !dbg !3819
  store i32 %inc84, ptr %col65, align 4, !dbg !3819
  br label %for.cond66, !dbg !3820, !llvm.loop !3821

for.end85:                                        ; preds = %for.cond66
  %71 = load i32, ptr %P3_used, align 4, !dbg !3823
  %inc86 = add nsw i32 %71, 1, !dbg !3823
  store i32 %inc86, ptr %P3_used, align 4, !dbg !3823
  br label %for.inc87, !dbg !3824

for.inc87:                                        ; preds = %for.end85
  %72 = load i32, ptr %j60, align 4, !dbg !3825
  %inc88 = add nsw i32 %72, 1, !dbg !3825
  store i32 %inc88, ptr %j60, align 4, !dbg !3825
  br label %for.cond61, !dbg !3826, !llvm.loop !3827

for.end89:                                        ; preds = %for.cond61
  br label %for.inc90, !dbg !3829

for.inc90:                                        ; preds = %for.end89
  %73 = load i32, ptr %row55, align 4, !dbg !3830
  %inc91 = add nsw i32 %73, 1, !dbg !3830
  store i32 %inc91, ptr %row55, align 4, !dbg !3830
  br label %for.cond56, !dbg !3831, !llvm.loop !3832

for.end92:                                        ; preds = %for.cond56
    #dbg_declare(ptr %i, !3834, !DIExpression(), !3835)
  store i32 0, ptr %i, align 4, !dbg !3835
  br label %while.cond, !dbg !3836

while.cond:                                       ; preds = %while.body, %for.end92
  %74 = load i32, ptr %i, align 4, !dbg !3837
  %75 = load i32, ptr %n, align 4, !dbg !3838
  %76 = load i32, ptr %k.addr, align 4, !dbg !3839
  %mul93 = mul nsw i32 %75, %76, !dbg !3840
  %cmp94 = icmp slt i32 %74, %mul93, !dbg !3841
  br i1 %cmp94, label %while.body, label %while.end, !dbg !3836

while.body:                                       ; preds = %while.cond
  %77 = load i32, ptr %m_vec_limbs, align 4, !dbg !3842
  %arraydecay96 = getelementptr inbounds [266112 x i64], ptr %accumulator, i32 0, i32 0, !dbg !3844
  %78 = load i32, ptr %i, align 4, !dbg !3845
  %mul97 = mul nsw i32 %78, 16, !dbg !3846
  %79 = load i32, ptr %m_vec_limbs, align 4, !dbg !3847
  %mul98 = mul nsw i32 %mul97, %79, !dbg !3848
  %add.ptr99 = getelementptr inbounds i64, ptr %arraydecay96, i32 %mul98, !dbg !3849
  %80 = load ptr, ptr %PS.addr, align 4, !dbg !3850
  %81 = load i32, ptr %i, align 4, !dbg !3851
  %82 = load i32, ptr %m_vec_limbs, align 4, !dbg !3852
  %mul100 = mul nsw i32 %81, %82, !dbg !3853
  %add.ptr101 = getelementptr inbounds i64, ptr %80, i32 %mul100, !dbg !3854
  call void @m_vec_multiply_bins(i32 noundef %77, ptr noundef %add.ptr99, ptr noundef %add.ptr101) #5, !dbg !3855
  %83 = load i32, ptr %i, align 4, !dbg !3856
  %inc102 = add nsw i32 %83, 1, !dbg !3856
  store i32 %inc102, ptr %i, align 4, !dbg !3856
  br label %while.cond, !dbg !3836, !llvm.loop !3857

while.end:                                        ; preds = %while.cond
  ret void, !dbg !3859
}

; Function Attrs: noinline nounwind optnone
define internal void @mayo_generic_m_calculate_SPS(ptr noundef %PS, ptr noundef %S, i32 noundef %m, i32 noundef %k, i32 noundef %n, ptr noundef %SPS) #0 !dbg !3860 {
entry:
  %PS.addr = alloca ptr, align 4
  %S.addr = alloca ptr, align 4
  %m.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %SPS.addr = alloca ptr, align 4
  %accumulator = alloca [20736 x i64], align 8
  %m_vec_limbs = alloca i32, align 4
  %row = alloca i32, align 4
  %j = alloca i32, align 4
  %col = alloca i32, align 4
  %i = alloca i32, align 4
  store ptr %PS, ptr %PS.addr, align 4
    #dbg_declare(ptr %PS.addr, !3863, !DIExpression(), !3864)
  store ptr %S, ptr %S.addr, align 4
    #dbg_declare(ptr %S.addr, !3865, !DIExpression(), !3866)
  store i32 %m, ptr %m.addr, align 4
    #dbg_declare(ptr %m.addr, !3867, !DIExpression(), !3868)
  store i32 %k, ptr %k.addr, align 4
    #dbg_declare(ptr %k.addr, !3869, !DIExpression(), !3870)
  store i32 %n, ptr %n.addr, align 4
    #dbg_declare(ptr %n.addr, !3871, !DIExpression(), !3872)
  store ptr %SPS, ptr %SPS.addr, align 4
    #dbg_declare(ptr %SPS.addr, !3873, !DIExpression(), !3874)
    #dbg_declare(ptr %accumulator, !3875, !DIExpression(), !3879)
  call void @llvm.memset.p0.i32(ptr align 8 %accumulator, i8 0, i32 165888, i1 false), !dbg !3879
    #dbg_declare(ptr %m_vec_limbs, !3880, !DIExpression(), !3881)
  %0 = load i32, ptr %m.addr, align 4, !dbg !3882
  %add = add nsw i32 %0, 15, !dbg !3883
  %div = sdiv i32 %add, 16, !dbg !3884
  store i32 %div, ptr %m_vec_limbs, align 4, !dbg !3881
    #dbg_declare(ptr %row, !3885, !DIExpression(), !3887)
  store i32 0, ptr %row, align 4, !dbg !3887
  br label %for.cond, !dbg !3888

for.cond:                                         ; preds = %for.inc20, %entry
  %1 = load i32, ptr %row, align 4, !dbg !3889
  %2 = load i32, ptr %k.addr, align 4, !dbg !3891
  %cmp = icmp slt i32 %1, %2, !dbg !3892
  br i1 %cmp, label %for.body, label %for.end22, !dbg !3893

for.body:                                         ; preds = %for.cond
    #dbg_declare(ptr %j, !3894, !DIExpression(), !3897)
  store i32 0, ptr %j, align 4, !dbg !3897
  br label %for.cond1, !dbg !3898

for.cond1:                                        ; preds = %for.inc18, %for.body
  %3 = load i32, ptr %j, align 4, !dbg !3899
  %4 = load i32, ptr %n.addr, align 4, !dbg !3901
  %cmp2 = icmp slt i32 %3, %4, !dbg !3902
  br i1 %cmp2, label %for.body3, label %for.end19, !dbg !3903

for.body3:                                        ; preds = %for.cond1
    #dbg_declare(ptr %col, !3904, !DIExpression(), !3907)
  store i32 0, ptr %col, align 4, !dbg !3907
  br label %for.cond4, !dbg !3908

for.cond4:                                        ; preds = %for.inc, %for.body3
  %5 = load i32, ptr %col, align 4, !dbg !3909
  %6 = load i32, ptr %k.addr, align 4, !dbg !3911
  %cmp5 = icmp slt i32 %5, %6, !dbg !3912
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !3913

for.body6:                                        ; preds = %for.cond4
  %7 = load i32, ptr %m_vec_limbs, align 4, !dbg !3914
  %8 = load ptr, ptr %PS.addr, align 4, !dbg !3916
  %9 = load i32, ptr %j, align 4, !dbg !3917
  %10 = load i32, ptr %k.addr, align 4, !dbg !3918
  %mul = mul nsw i32 %9, %10, !dbg !3919
  %11 = load i32, ptr %col, align 4, !dbg !3920
  %add7 = add nsw i32 %mul, %11, !dbg !3921
  %12 = load i32, ptr %m_vec_limbs, align 4, !dbg !3922
  %mul8 = mul nsw i32 %add7, %12, !dbg !3923
  %add.ptr = getelementptr inbounds i64, ptr %8, i32 %mul8, !dbg !3924
  %arraydecay = getelementptr inbounds [20736 x i64], ptr %accumulator, i32 0, i32 0, !dbg !3925
  %13 = load i32, ptr %row, align 4, !dbg !3926
  %14 = load i32, ptr %k.addr, align 4, !dbg !3927
  %mul9 = mul nsw i32 %13, %14, !dbg !3928
  %15 = load i32, ptr %col, align 4, !dbg !3929
  %add10 = add nsw i32 %mul9, %15, !dbg !3930
  %mul11 = mul nsw i32 %add10, 16, !dbg !3931
  %16 = load ptr, ptr %S.addr, align 4, !dbg !3932
  %17 = load i32, ptr %row, align 4, !dbg !3933
  %18 = load i32, ptr %n.addr, align 4, !dbg !3934
  %mul12 = mul nsw i32 %17, %18, !dbg !3935
  %19 = load i32, ptr %j, align 4, !dbg !3936
  %add13 = add nsw i32 %mul12, %19, !dbg !3937
  %arrayidx = getelementptr inbounds i8, ptr %16, i32 %add13, !dbg !3932
  %20 = load i8, ptr %arrayidx, align 1, !dbg !3932
  %conv = zext i8 %20 to i32, !dbg !3932
  %add14 = add nsw i32 %mul11, %conv, !dbg !3938
  %21 = load i32, ptr %m_vec_limbs, align 4, !dbg !3939
  %mul15 = mul nsw i32 %add14, %21, !dbg !3940
  %add.ptr16 = getelementptr inbounds i64, ptr %arraydecay, i32 %mul15, !dbg !3941
  call void @m_vec_add(i32 noundef %7, ptr noundef %add.ptr, ptr noundef %add.ptr16) #5, !dbg !3942
  br label %for.inc, !dbg !3943

for.inc:                                          ; preds = %for.body6
  %22 = load i32, ptr %col, align 4, !dbg !3944
  %add17 = add nsw i32 %22, 1, !dbg !3944
  store i32 %add17, ptr %col, align 4, !dbg !3944
  br label %for.cond4, !dbg !3945, !llvm.loop !3946

for.end:                                          ; preds = %for.cond4
  br label %for.inc18, !dbg !3948

for.inc18:                                        ; preds = %for.end
  %23 = load i32, ptr %j, align 4, !dbg !3949
  %inc = add nsw i32 %23, 1, !dbg !3949
  store i32 %inc, ptr %j, align 4, !dbg !3949
  br label %for.cond1, !dbg !3950, !llvm.loop !3951

for.end19:                                        ; preds = %for.cond1
  br label %for.inc20, !dbg !3953

for.inc20:                                        ; preds = %for.end19
  %24 = load i32, ptr %row, align 4, !dbg !3954
  %inc21 = add nsw i32 %24, 1, !dbg !3954
  store i32 %inc21, ptr %row, align 4, !dbg !3954
  br label %for.cond, !dbg !3955, !llvm.loop !3956

for.end22:                                        ; preds = %for.cond
    #dbg_declare(ptr %i, !3958, !DIExpression(), !3959)
  store i32 0, ptr %i, align 4, !dbg !3959
  br label %while.cond, !dbg !3960

while.cond:                                       ; preds = %while.body, %for.end22
  %25 = load i32, ptr %i, align 4, !dbg !3961
  %26 = load i32, ptr %k.addr, align 4, !dbg !3962
  %27 = load i32, ptr %k.addr, align 4, !dbg !3963
  %mul23 = mul nsw i32 %26, %27, !dbg !3964
  %cmp24 = icmp slt i32 %25, %mul23, !dbg !3965
  br i1 %cmp24, label %while.body, label %while.end, !dbg !3960

while.body:                                       ; preds = %while.cond
  %28 = load i32, ptr %m_vec_limbs, align 4, !dbg !3966
  %arraydecay26 = getelementptr inbounds [20736 x i64], ptr %accumulator, i32 0, i32 0, !dbg !3968
  %29 = load i32, ptr %i, align 4, !dbg !3969
  %mul27 = mul nsw i32 %29, 16, !dbg !3970
  %30 = load i32, ptr %m_vec_limbs, align 4, !dbg !3971
  %mul28 = mul nsw i32 %mul27, %30, !dbg !3972
  %add.ptr29 = getelementptr inbounds i64, ptr %arraydecay26, i32 %mul28, !dbg !3973
  %31 = load ptr, ptr %SPS.addr, align 4, !dbg !3974
  %32 = load i32, ptr %i, align 4, !dbg !3975
  %33 = load i32, ptr %m_vec_limbs, align 4, !dbg !3976
  %mul30 = mul nsw i32 %32, %33, !dbg !3977
  %add.ptr31 = getelementptr inbounds i64, ptr %31, i32 %mul30, !dbg !3978
  call void @m_vec_multiply_bins(i32 noundef %28, ptr noundef %add.ptr29, ptr noundef %add.ptr31) #5, !dbg !3979
  %34 = load i32, ptr %i, align 4, !dbg !3980
  %inc32 = add nsw i32 %34, 1, !dbg !3980
  store i32 %inc32, ptr %i, align 4, !dbg !3980
  br label %while.cond, !dbg !3960, !llvm.loop !3981

while.end:                                        ; preds = %while.cond
  ret void, !dbg !3983
}

; Function Attrs: noinline nounwind optnone
define internal void @m_vec_add(i32 noundef %m_vec_limbs, ptr noundef %in, ptr noundef %acc) #0 !dbg !3984 {
entry:
  %m_vec_limbs.addr = alloca i32, align 4
  %in.addr = alloca ptr, align 4
  %acc.addr = alloca ptr, align 4
  %i = alloca i32, align 4
  store i32 %m_vec_limbs, ptr %m_vec_limbs.addr, align 4
    #dbg_declare(ptr %m_vec_limbs.addr, !3987, !DIExpression(), !3988)
  store ptr %in, ptr %in.addr, align 4
    #dbg_declare(ptr %in.addr, !3989, !DIExpression(), !3990)
  store ptr %acc, ptr %acc.addr, align 4
    #dbg_declare(ptr %acc.addr, !3991, !DIExpression(), !3992)
    #dbg_declare(ptr %i, !3993, !DIExpression(), !3995)
  store i32 0, ptr %i, align 4, !dbg !3995
  br label %for.cond, !dbg !3996

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4, !dbg !3997
  %1 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !3999
  %cmp = icmp slt i32 %0, %1, !dbg !4000
  br i1 %cmp, label %for.body, label %for.end, !dbg !4001

for.body:                                         ; preds = %for.cond
  %2 = load ptr, ptr %in.addr, align 4, !dbg !4002
  %3 = load i32, ptr %i, align 4, !dbg !4004
  %arrayidx = getelementptr inbounds i64, ptr %2, i32 %3, !dbg !4002
  %4 = load i64, ptr %arrayidx, align 8, !dbg !4002
  %5 = load ptr, ptr %acc.addr, align 4, !dbg !4005
  %6 = load i32, ptr %i, align 4, !dbg !4006
  %arrayidx1 = getelementptr inbounds i64, ptr %5, i32 %6, !dbg !4005
  %7 = load i64, ptr %arrayidx1, align 8, !dbg !4007
  %xor = xor i64 %7, %4, !dbg !4007
  store i64 %xor, ptr %arrayidx1, align 8, !dbg !4007
  br label %for.inc, !dbg !4008

for.inc:                                          ; preds = %for.body
  %8 = load i32, ptr %i, align 4, !dbg !4009
  %inc = add nsw i32 %8, 1, !dbg !4009
  store i32 %inc, ptr %i, align 4, !dbg !4009
  br label %for.cond, !dbg !4010, !llvm.loop !4011

for.end:                                          ; preds = %for.cond
  ret void, !dbg !4013
}

; Function Attrs: noinline nounwind optnone
define internal void @m_vec_multiply_bins(i32 noundef %m_vec_limbs, ptr noundef %bins, ptr noundef %out) #0 !dbg !4014 {
entry:
  %m_vec_limbs.addr = alloca i32, align 4
  %bins.addr = alloca ptr, align 4
  %out.addr = alloca ptr, align 4
  store i32 %m_vec_limbs, ptr %m_vec_limbs.addr, align 4
    #dbg_declare(ptr %m_vec_limbs.addr, !4017, !DIExpression(), !4018)
  store ptr %bins, ptr %bins.addr, align 4
    #dbg_declare(ptr %bins.addr, !4019, !DIExpression(), !4020)
  store ptr %out, ptr %out.addr, align 4
    #dbg_declare(ptr %out.addr, !4021, !DIExpression(), !4022)
  %0 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4023
  %1 = load ptr, ptr %bins.addr, align 4, !dbg !4024
  %2 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4025
  %mul = mul nsw i32 5, %2, !dbg !4026
  %add.ptr = getelementptr inbounds i64, ptr %1, i32 %mul, !dbg !4027
  %3 = load ptr, ptr %bins.addr, align 4, !dbg !4028
  %4 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4029
  %mul1 = mul nsw i32 10, %4, !dbg !4030
  %add.ptr2 = getelementptr inbounds i64, ptr %3, i32 %mul1, !dbg !4031
  call void @m_vec_mul_add_x_inv(i32 noundef %0, ptr noundef %add.ptr, ptr noundef %add.ptr2) #5, !dbg !4032
  %5 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4033
  %6 = load ptr, ptr %bins.addr, align 4, !dbg !4034
  %7 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4035
  %mul3 = mul nsw i32 11, %7, !dbg !4036
  %add.ptr4 = getelementptr inbounds i64, ptr %6, i32 %mul3, !dbg !4037
  %8 = load ptr, ptr %bins.addr, align 4, !dbg !4038
  %9 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4039
  %mul5 = mul nsw i32 12, %9, !dbg !4040
  %add.ptr6 = getelementptr inbounds i64, ptr %8, i32 %mul5, !dbg !4041
  call void @m_vec_mul_add_x(i32 noundef %5, ptr noundef %add.ptr4, ptr noundef %add.ptr6) #5, !dbg !4042
  %10 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4043
  %11 = load ptr, ptr %bins.addr, align 4, !dbg !4044
  %12 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4045
  %mul7 = mul nsw i32 10, %12, !dbg !4046
  %add.ptr8 = getelementptr inbounds i64, ptr %11, i32 %mul7, !dbg !4047
  %13 = load ptr, ptr %bins.addr, align 4, !dbg !4048
  %14 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4049
  %mul9 = mul nsw i32 7, %14, !dbg !4050
  %add.ptr10 = getelementptr inbounds i64, ptr %13, i32 %mul9, !dbg !4051
  call void @m_vec_mul_add_x_inv(i32 noundef %10, ptr noundef %add.ptr8, ptr noundef %add.ptr10) #5, !dbg !4052
  %15 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4053
  %16 = load ptr, ptr %bins.addr, align 4, !dbg !4054
  %17 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4055
  %mul11 = mul nsw i32 12, %17, !dbg !4056
  %add.ptr12 = getelementptr inbounds i64, ptr %16, i32 %mul11, !dbg !4057
  %18 = load ptr, ptr %bins.addr, align 4, !dbg !4058
  %19 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4059
  %mul13 = mul nsw i32 6, %19, !dbg !4060
  %add.ptr14 = getelementptr inbounds i64, ptr %18, i32 %mul13, !dbg !4061
  call void @m_vec_mul_add_x(i32 noundef %15, ptr noundef %add.ptr12, ptr noundef %add.ptr14) #5, !dbg !4062
  %20 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4063
  %21 = load ptr, ptr %bins.addr, align 4, !dbg !4064
  %22 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4065
  %mul15 = mul nsw i32 7, %22, !dbg !4066
  %add.ptr16 = getelementptr inbounds i64, ptr %21, i32 %mul15, !dbg !4067
  %23 = load ptr, ptr %bins.addr, align 4, !dbg !4068
  %24 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4069
  %mul17 = mul nsw i32 14, %24, !dbg !4070
  %add.ptr18 = getelementptr inbounds i64, ptr %23, i32 %mul17, !dbg !4071
  call void @m_vec_mul_add_x_inv(i32 noundef %20, ptr noundef %add.ptr16, ptr noundef %add.ptr18) #5, !dbg !4072
  %25 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4073
  %26 = load ptr, ptr %bins.addr, align 4, !dbg !4074
  %27 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4075
  %mul19 = mul nsw i32 6, %27, !dbg !4076
  %add.ptr20 = getelementptr inbounds i64, ptr %26, i32 %mul19, !dbg !4077
  %28 = load ptr, ptr %bins.addr, align 4, !dbg !4078
  %29 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4079
  %mul21 = mul nsw i32 3, %29, !dbg !4080
  %add.ptr22 = getelementptr inbounds i64, ptr %28, i32 %mul21, !dbg !4081
  call void @m_vec_mul_add_x(i32 noundef %25, ptr noundef %add.ptr20, ptr noundef %add.ptr22) #5, !dbg !4082
  %30 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4083
  %31 = load ptr, ptr %bins.addr, align 4, !dbg !4084
  %32 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4085
  %mul23 = mul nsw i32 14, %32, !dbg !4086
  %add.ptr24 = getelementptr inbounds i64, ptr %31, i32 %mul23, !dbg !4087
  %33 = load ptr, ptr %bins.addr, align 4, !dbg !4088
  %34 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4089
  %mul25 = mul nsw i32 15, %34, !dbg !4090
  %add.ptr26 = getelementptr inbounds i64, ptr %33, i32 %mul25, !dbg !4091
  call void @m_vec_mul_add_x_inv(i32 noundef %30, ptr noundef %add.ptr24, ptr noundef %add.ptr26) #5, !dbg !4092
  %35 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4093
  %36 = load ptr, ptr %bins.addr, align 4, !dbg !4094
  %37 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4095
  %mul27 = mul nsw i32 3, %37, !dbg !4096
  %add.ptr28 = getelementptr inbounds i64, ptr %36, i32 %mul27, !dbg !4097
  %38 = load ptr, ptr %bins.addr, align 4, !dbg !4098
  %39 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4099
  %mul29 = mul nsw i32 8, %39, !dbg !4100
  %add.ptr30 = getelementptr inbounds i64, ptr %38, i32 %mul29, !dbg !4101
  call void @m_vec_mul_add_x(i32 noundef %35, ptr noundef %add.ptr28, ptr noundef %add.ptr30) #5, !dbg !4102
  %40 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4103
  %41 = load ptr, ptr %bins.addr, align 4, !dbg !4104
  %42 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4105
  %mul31 = mul nsw i32 15, %42, !dbg !4106
  %add.ptr32 = getelementptr inbounds i64, ptr %41, i32 %mul31, !dbg !4107
  %43 = load ptr, ptr %bins.addr, align 4, !dbg !4108
  %44 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4109
  %mul33 = mul nsw i32 13, %44, !dbg !4110
  %add.ptr34 = getelementptr inbounds i64, ptr %43, i32 %mul33, !dbg !4111
  call void @m_vec_mul_add_x_inv(i32 noundef %40, ptr noundef %add.ptr32, ptr noundef %add.ptr34) #5, !dbg !4112
  %45 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4113
  %46 = load ptr, ptr %bins.addr, align 4, !dbg !4114
  %47 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4115
  %mul35 = mul nsw i32 8, %47, !dbg !4116
  %add.ptr36 = getelementptr inbounds i64, ptr %46, i32 %mul35, !dbg !4117
  %48 = load ptr, ptr %bins.addr, align 4, !dbg !4118
  %49 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4119
  %mul37 = mul nsw i32 4, %49, !dbg !4120
  %add.ptr38 = getelementptr inbounds i64, ptr %48, i32 %mul37, !dbg !4121
  call void @m_vec_mul_add_x(i32 noundef %45, ptr noundef %add.ptr36, ptr noundef %add.ptr38) #5, !dbg !4122
  %50 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4123
  %51 = load ptr, ptr %bins.addr, align 4, !dbg !4124
  %52 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4125
  %mul39 = mul nsw i32 13, %52, !dbg !4126
  %add.ptr40 = getelementptr inbounds i64, ptr %51, i32 %mul39, !dbg !4127
  %53 = load ptr, ptr %bins.addr, align 4, !dbg !4128
  %54 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4129
  %mul41 = mul nsw i32 9, %54, !dbg !4130
  %add.ptr42 = getelementptr inbounds i64, ptr %53, i32 %mul41, !dbg !4131
  call void @m_vec_mul_add_x_inv(i32 noundef %50, ptr noundef %add.ptr40, ptr noundef %add.ptr42) #5, !dbg !4132
  %55 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4133
  %56 = load ptr, ptr %bins.addr, align 4, !dbg !4134
  %57 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4135
  %mul43 = mul nsw i32 4, %57, !dbg !4136
  %add.ptr44 = getelementptr inbounds i64, ptr %56, i32 %mul43, !dbg !4137
  %58 = load ptr, ptr %bins.addr, align 4, !dbg !4138
  %59 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4139
  %mul45 = mul nsw i32 2, %59, !dbg !4140
  %add.ptr46 = getelementptr inbounds i64, ptr %58, i32 %mul45, !dbg !4141
  call void @m_vec_mul_add_x(i32 noundef %55, ptr noundef %add.ptr44, ptr noundef %add.ptr46) #5, !dbg !4142
  %60 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4143
  %61 = load ptr, ptr %bins.addr, align 4, !dbg !4144
  %62 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4145
  %mul47 = mul nsw i32 9, %62, !dbg !4146
  %add.ptr48 = getelementptr inbounds i64, ptr %61, i32 %mul47, !dbg !4147
  %63 = load ptr, ptr %bins.addr, align 4, !dbg !4148
  %64 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4149
  %mul49 = mul nsw i32 1, %64, !dbg !4150
  %add.ptr50 = getelementptr inbounds i64, ptr %63, i32 %mul49, !dbg !4151
  call void @m_vec_mul_add_x_inv(i32 noundef %60, ptr noundef %add.ptr48, ptr noundef %add.ptr50) #5, !dbg !4152
  %65 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4153
  %66 = load ptr, ptr %bins.addr, align 4, !dbg !4154
  %67 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4155
  %mul51 = mul nsw i32 2, %67, !dbg !4156
  %add.ptr52 = getelementptr inbounds i64, ptr %66, i32 %mul51, !dbg !4157
  %68 = load ptr, ptr %bins.addr, align 4, !dbg !4158
  %69 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4159
  %mul53 = mul nsw i32 1, %69, !dbg !4160
  %add.ptr54 = getelementptr inbounds i64, ptr %68, i32 %mul53, !dbg !4161
  call void @m_vec_mul_add_x(i32 noundef %65, ptr noundef %add.ptr52, ptr noundef %add.ptr54) #5, !dbg !4162
  %70 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4163
  %71 = load ptr, ptr %bins.addr, align 4, !dbg !4164
  %72 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4165
  %add.ptr55 = getelementptr inbounds i64, ptr %71, i32 %72, !dbg !4166
  %73 = load ptr, ptr %out.addr, align 4, !dbg !4167
  call void @m_vec_copy(i32 noundef %70, ptr noundef %add.ptr55, ptr noundef %73) #5, !dbg !4168
  ret void, !dbg !4169
}

; Function Attrs: noinline nounwind optnone
define internal void @m_vec_mul_add_x_inv(i32 noundef %m_vec_limbs, ptr noundef %in, ptr noundef %acc) #0 !dbg !4170 {
entry:
  %m_vec_limbs.addr = alloca i32, align 4
  %in.addr = alloca ptr, align 4
  %acc.addr = alloca ptr, align 4
  %mask_lsb = alloca i64, align 8
  %i = alloca i32, align 4
  %t = alloca i64, align 8
  store i32 %m_vec_limbs, ptr %m_vec_limbs.addr, align 4
    #dbg_declare(ptr %m_vec_limbs.addr, !4171, !DIExpression(), !4172)
  store ptr %in, ptr %in.addr, align 4
    #dbg_declare(ptr %in.addr, !4173, !DIExpression(), !4174)
  store ptr %acc, ptr %acc.addr, align 4
    #dbg_declare(ptr %acc.addr, !4175, !DIExpression(), !4176)
    #dbg_declare(ptr %mask_lsb, !4177, !DIExpression(), !4178)
  store i64 1229782938247303441, ptr %mask_lsb, align 8, !dbg !4178
    #dbg_declare(ptr %i, !4179, !DIExpression(), !4181)
  store i32 0, ptr %i, align 4, !dbg !4181
  br label %for.cond, !dbg !4182

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4, !dbg !4183
  %1 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4185
  %cmp = icmp slt i32 %0, %1, !dbg !4186
  br i1 %cmp, label %for.body, label %for.end, !dbg !4187

for.body:                                         ; preds = %for.cond
    #dbg_declare(ptr %t, !4188, !DIExpression(), !4190)
  %2 = load ptr, ptr %in.addr, align 4, !dbg !4191
  %3 = load i32, ptr %i, align 4, !dbg !4192
  %arrayidx = getelementptr inbounds i64, ptr %2, i32 %3, !dbg !4191
  %4 = load i64, ptr %arrayidx, align 8, !dbg !4191
  %5 = load i64, ptr %mask_lsb, align 8, !dbg !4193
  %and = and i64 %4, %5, !dbg !4194
  store i64 %and, ptr %t, align 8, !dbg !4190
  %6 = load ptr, ptr %in.addr, align 4, !dbg !4195
  %7 = load i32, ptr %i, align 4, !dbg !4196
  %arrayidx1 = getelementptr inbounds i64, ptr %6, i32 %7, !dbg !4195
  %8 = load i64, ptr %arrayidx1, align 8, !dbg !4195
  %9 = load i64, ptr %t, align 8, !dbg !4197
  %xor = xor i64 %8, %9, !dbg !4198
  %shr = lshr i64 %xor, 1, !dbg !4199
  %10 = load i64, ptr %t, align 8, !dbg !4200
  %mul = mul i64 %10, 9, !dbg !4201
  %xor2 = xor i64 %shr, %mul, !dbg !4202
  %11 = load ptr, ptr %acc.addr, align 4, !dbg !4203
  %12 = load i32, ptr %i, align 4, !dbg !4204
  %arrayidx3 = getelementptr inbounds i64, ptr %11, i32 %12, !dbg !4203
  %13 = load i64, ptr %arrayidx3, align 8, !dbg !4205
  %xor4 = xor i64 %13, %xor2, !dbg !4205
  store i64 %xor4, ptr %arrayidx3, align 8, !dbg !4205
  br label %for.inc, !dbg !4206

for.inc:                                          ; preds = %for.body
  %14 = load i32, ptr %i, align 4, !dbg !4207
  %inc = add nsw i32 %14, 1, !dbg !4207
  store i32 %inc, ptr %i, align 4, !dbg !4207
  br label %for.cond, !dbg !4208, !llvm.loop !4209

for.end:                                          ; preds = %for.cond
  ret void, !dbg !4211
}

; Function Attrs: noinline nounwind optnone
define internal void @m_vec_mul_add_x(i32 noundef %m_vec_limbs, ptr noundef %in, ptr noundef %acc) #0 !dbg !4212 {
entry:
  %m_vec_limbs.addr = alloca i32, align 4
  %in.addr = alloca ptr, align 4
  %acc.addr = alloca ptr, align 4
  %mask_msb = alloca i64, align 8
  %i = alloca i32, align 4
  %t = alloca i64, align 8
  store i32 %m_vec_limbs, ptr %m_vec_limbs.addr, align 4
    #dbg_declare(ptr %m_vec_limbs.addr, !4213, !DIExpression(), !4214)
  store ptr %in, ptr %in.addr, align 4
    #dbg_declare(ptr %in.addr, !4215, !DIExpression(), !4216)
  store ptr %acc, ptr %acc.addr, align 4
    #dbg_declare(ptr %acc.addr, !4217, !DIExpression(), !4218)
    #dbg_declare(ptr %mask_msb, !4219, !DIExpression(), !4220)
  store i64 -8608480567731124088, ptr %mask_msb, align 8, !dbg !4220
    #dbg_declare(ptr %i, !4221, !DIExpression(), !4223)
  store i32 0, ptr %i, align 4, !dbg !4223
  br label %for.cond, !dbg !4224

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4, !dbg !4225
  %1 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4227
  %cmp = icmp slt i32 %0, %1, !dbg !4228
  br i1 %cmp, label %for.body, label %for.end, !dbg !4229

for.body:                                         ; preds = %for.cond
    #dbg_declare(ptr %t, !4230, !DIExpression(), !4232)
  %2 = load ptr, ptr %in.addr, align 4, !dbg !4233
  %3 = load i32, ptr %i, align 4, !dbg !4234
  %arrayidx = getelementptr inbounds i64, ptr %2, i32 %3, !dbg !4233
  %4 = load i64, ptr %arrayidx, align 8, !dbg !4233
  %5 = load i64, ptr %mask_msb, align 8, !dbg !4235
  %and = and i64 %4, %5, !dbg !4236
  store i64 %and, ptr %t, align 8, !dbg !4232
  %6 = load ptr, ptr %in.addr, align 4, !dbg !4237
  %7 = load i32, ptr %i, align 4, !dbg !4238
  %arrayidx1 = getelementptr inbounds i64, ptr %6, i32 %7, !dbg !4237
  %8 = load i64, ptr %arrayidx1, align 8, !dbg !4237
  %9 = load i64, ptr %t, align 8, !dbg !4239
  %xor = xor i64 %8, %9, !dbg !4240
  %shl = shl i64 %xor, 1, !dbg !4241
  %10 = load i64, ptr %t, align 8, !dbg !4242
  %shr = lshr i64 %10, 3, !dbg !4243
  %mul = mul i64 %shr, 3, !dbg !4244
  %xor2 = xor i64 %shl, %mul, !dbg !4245
  %11 = load ptr, ptr %acc.addr, align 4, !dbg !4246
  %12 = load i32, ptr %i, align 4, !dbg !4247
  %arrayidx3 = getelementptr inbounds i64, ptr %11, i32 %12, !dbg !4246
  %13 = load i64, ptr %arrayidx3, align 8, !dbg !4248
  %xor4 = xor i64 %13, %xor2, !dbg !4248
  store i64 %xor4, ptr %arrayidx3, align 8, !dbg !4248
  br label %for.inc, !dbg !4249

for.inc:                                          ; preds = %for.body
  %14 = load i32, ptr %i, align 4, !dbg !4250
  %inc = add nsw i32 %14, 1, !dbg !4250
  store i32 %inc, ptr %i, align 4, !dbg !4250
  br label %for.cond, !dbg !4251, !llvm.loop !4252

for.end:                                          ; preds = %for.cond
  ret void, !dbg !4254
}

; Function Attrs: noinline nounwind optnone
define internal void @m_vec_copy(i32 noundef %m_vec_limbs, ptr noundef %in, ptr noundef %out) #0 !dbg !4255 {
entry:
  %m_vec_limbs.addr = alloca i32, align 4
  %in.addr = alloca ptr, align 4
  %out.addr = alloca ptr, align 4
  %i = alloca i32, align 4
  store i32 %m_vec_limbs, ptr %m_vec_limbs.addr, align 4
    #dbg_declare(ptr %m_vec_limbs.addr, !4256, !DIExpression(), !4257)
  store ptr %in, ptr %in.addr, align 4
    #dbg_declare(ptr %in.addr, !4258, !DIExpression(), !4259)
  store ptr %out, ptr %out.addr, align 4
    #dbg_declare(ptr %out.addr, !4260, !DIExpression(), !4261)
    #dbg_declare(ptr %i, !4262, !DIExpression(), !4264)
  store i32 0, ptr %i, align 4, !dbg !4264
  br label %for.cond, !dbg !4265

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4, !dbg !4266
  %1 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4268
  %cmp = icmp slt i32 %0, %1, !dbg !4269
  br i1 %cmp, label %for.body, label %for.end, !dbg !4270

for.body:                                         ; preds = %for.cond
  %2 = load ptr, ptr %in.addr, align 4, !dbg !4271
  %3 = load i32, ptr %i, align 4, !dbg !4273
  %arrayidx = getelementptr inbounds i64, ptr %2, i32 %3, !dbg !4271
  %4 = load i64, ptr %arrayidx, align 8, !dbg !4271
  %5 = load ptr, ptr %out.addr, align 4, !dbg !4274
  %6 = load i32, ptr %i, align 4, !dbg !4275
  %arrayidx1 = getelementptr inbounds i64, ptr %5, i32 %6, !dbg !4274
  store i64 %4, ptr %arrayidx1, align 8, !dbg !4276
  br label %for.inc, !dbg !4277

for.inc:                                          ; preds = %for.body
  %7 = load i32, ptr %i, align 4, !dbg !4278
  %inc = add nsw i32 %7, 1, !dbg !4278
  store i32 %inc, ptr %i, align 4, !dbg !4278
  br label %for.cond, !dbg !4279, !llvm.loop !4280

for.end:                                          ; preds = %for.cond
  ret void, !dbg !4282
}

; Function Attrs: noinline nounwind optnone
define dso_local void @m_upper(ptr noundef %p, ptr noundef %in, ptr noundef %out, i32 noundef %size) #0 !dbg !4283 {
entry:
  %p.addr = alloca ptr, align 4
  %in.addr = alloca ptr, align 4
  %out.addr = alloca ptr, align 4
  %size.addr = alloca i32, align 4
  %m_vec_limbs = alloca i32, align 4
  %m_vecs_stored = alloca i32, align 4
  %r = alloca i32, align 4
  %c = alloca i32, align 4
  store ptr %p, ptr %p.addr, align 4
    #dbg_declare(ptr %p.addr, !4314, !DIExpression(), !4315)
  store ptr %in, ptr %in.addr, align 4
    #dbg_declare(ptr %in.addr, !4316, !DIExpression(), !4317)
  store ptr %out, ptr %out.addr, align 4
    #dbg_declare(ptr %out.addr, !4318, !DIExpression(), !4319)
  store i32 %size, ptr %size.addr, align 4
    #dbg_declare(ptr %size.addr, !4320, !DIExpression(), !4321)
    #dbg_declare(ptr %m_vec_limbs, !4322, !DIExpression(), !4323)
  %0 = load ptr, ptr %p.addr, align 4, !dbg !4324
  %m_vec_limbs1 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %0, i32 0, i32 21, !dbg !4324
  %1 = load i32, ptr %m_vec_limbs1, align 4, !dbg !4324
  store i32 %1, ptr %m_vec_limbs, align 4, !dbg !4323
    #dbg_declare(ptr %m_vecs_stored, !4325, !DIExpression(), !4326)
  store i32 0, ptr %m_vecs_stored, align 4, !dbg !4326
    #dbg_declare(ptr %r, !4327, !DIExpression(), !4329)
  store i32 0, ptr %r, align 4, !dbg !4329
  br label %for.cond, !dbg !4330

for.cond:                                         ; preds = %for.inc16, %entry
  %2 = load i32, ptr %r, align 4, !dbg !4331
  %3 = load i32, ptr %size.addr, align 4, !dbg !4333
  %cmp = icmp slt i32 %2, %3, !dbg !4334
  br i1 %cmp, label %for.body, label %for.end18, !dbg !4335

for.body:                                         ; preds = %for.cond
    #dbg_declare(ptr %c, !4336, !DIExpression(), !4339)
  %4 = load i32, ptr %r, align 4, !dbg !4340
  store i32 %4, ptr %c, align 4, !dbg !4339
  br label %for.cond2, !dbg !4341

for.cond2:                                        ; preds = %for.inc, %for.body
  %5 = load i32, ptr %c, align 4, !dbg !4342
  %6 = load i32, ptr %size.addr, align 4, !dbg !4344
  %cmp3 = icmp slt i32 %5, %6, !dbg !4345
  br i1 %cmp3, label %for.body4, label %for.end, !dbg !4346

for.body4:                                        ; preds = %for.cond2
  %7 = load i32, ptr %m_vec_limbs, align 4, !dbg !4347
  %8 = load ptr, ptr %in.addr, align 4, !dbg !4349
  %9 = load i32, ptr %m_vec_limbs, align 4, !dbg !4350
  %10 = load i32, ptr %r, align 4, !dbg !4351
  %11 = load i32, ptr %size.addr, align 4, !dbg !4352
  %mul = mul nsw i32 %10, %11, !dbg !4353
  %12 = load i32, ptr %c, align 4, !dbg !4354
  %add = add nsw i32 %mul, %12, !dbg !4355
  %mul5 = mul nsw i32 %9, %add, !dbg !4356
  %add.ptr = getelementptr inbounds i64, ptr %8, i32 %mul5, !dbg !4357
  %13 = load ptr, ptr %out.addr, align 4, !dbg !4358
  %14 = load i32, ptr %m_vec_limbs, align 4, !dbg !4359
  %15 = load i32, ptr %m_vecs_stored, align 4, !dbg !4360
  %mul6 = mul nsw i32 %14, %15, !dbg !4361
  %add.ptr7 = getelementptr inbounds i64, ptr %13, i32 %mul6, !dbg !4362
  call void @m_vec_copy.17(i32 noundef %7, ptr noundef %add.ptr, ptr noundef %add.ptr7) #5, !dbg !4363
  %16 = load i32, ptr %r, align 4, !dbg !4364
  %17 = load i32, ptr %c, align 4, !dbg !4366
  %cmp8 = icmp ne i32 %16, %17, !dbg !4367
  br i1 %cmp8, label %if.then, label %if.end, !dbg !4367

if.then:                                          ; preds = %for.body4
  %18 = load i32, ptr %m_vec_limbs, align 4, !dbg !4368
  %19 = load ptr, ptr %in.addr, align 4, !dbg !4370
  %20 = load i32, ptr %m_vec_limbs, align 4, !dbg !4371
  %21 = load i32, ptr %c, align 4, !dbg !4372
  %22 = load i32, ptr %size.addr, align 4, !dbg !4373
  %mul9 = mul nsw i32 %21, %22, !dbg !4374
  %23 = load i32, ptr %r, align 4, !dbg !4375
  %add10 = add nsw i32 %mul9, %23, !dbg !4376
  %mul11 = mul nsw i32 %20, %add10, !dbg !4377
  %add.ptr12 = getelementptr inbounds i64, ptr %19, i32 %mul11, !dbg !4378
  %24 = load ptr, ptr %out.addr, align 4, !dbg !4379
  %25 = load i32, ptr %m_vec_limbs, align 4, !dbg !4380
  %26 = load i32, ptr %m_vecs_stored, align 4, !dbg !4381
  %mul13 = mul nsw i32 %25, %26, !dbg !4382
  %add.ptr14 = getelementptr inbounds i64, ptr %24, i32 %mul13, !dbg !4383
  call void @m_vec_add.18(i32 noundef %18, ptr noundef %add.ptr12, ptr noundef %add.ptr14) #5, !dbg !4384
  br label %if.end, !dbg !4385

if.end:                                           ; preds = %if.then, %for.body4
  %27 = load i32, ptr %m_vecs_stored, align 4, !dbg !4386
  %inc = add nsw i32 %27, 1, !dbg !4386
  store i32 %inc, ptr %m_vecs_stored, align 4, !dbg !4386
  br label %for.inc, !dbg !4387

for.inc:                                          ; preds = %if.end
  %28 = load i32, ptr %c, align 4, !dbg !4388
  %inc15 = add nsw i32 %28, 1, !dbg !4388
  store i32 %inc15, ptr %c, align 4, !dbg !4388
  br label %for.cond2, !dbg !4389, !llvm.loop !4390

for.end:                                          ; preds = %for.cond2
  br label %for.inc16, !dbg !4392

for.inc16:                                        ; preds = %for.end
  %29 = load i32, ptr %r, align 4, !dbg !4393
  %inc17 = add nsw i32 %29, 1, !dbg !4393
  store i32 %inc17, ptr %r, align 4, !dbg !4393
  br label %for.cond, !dbg !4394, !llvm.loop !4395

for.end18:                                        ; preds = %for.cond
  ret void, !dbg !4397
}

; Function Attrs: noinline nounwind optnone
define internal void @m_vec_copy.17(i32 noundef %m_vec_limbs, ptr noundef %in, ptr noundef %out) #0 !dbg !4398 {
entry:
  %m_vec_limbs.addr = alloca i32, align 4
  %in.addr = alloca ptr, align 4
  %out.addr = alloca ptr, align 4
  %i = alloca i32, align 4
  store i32 %m_vec_limbs, ptr %m_vec_limbs.addr, align 4
    #dbg_declare(ptr %m_vec_limbs.addr, !4399, !DIExpression(), !4400)
  store ptr %in, ptr %in.addr, align 4
    #dbg_declare(ptr %in.addr, !4401, !DIExpression(), !4402)
  store ptr %out, ptr %out.addr, align 4
    #dbg_declare(ptr %out.addr, !4403, !DIExpression(), !4404)
    #dbg_declare(ptr %i, !4405, !DIExpression(), !4407)
  store i32 0, ptr %i, align 4, !dbg !4407
  br label %for.cond, !dbg !4408

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4, !dbg !4409
  %1 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4411
  %cmp = icmp slt i32 %0, %1, !dbg !4412
  br i1 %cmp, label %for.body, label %for.end, !dbg !4413

for.body:                                         ; preds = %for.cond
  %2 = load ptr, ptr %in.addr, align 4, !dbg !4414
  %3 = load i32, ptr %i, align 4, !dbg !4416
  %arrayidx = getelementptr inbounds i64, ptr %2, i32 %3, !dbg !4414
  %4 = load i64, ptr %arrayidx, align 8, !dbg !4414
  %5 = load ptr, ptr %out.addr, align 4, !dbg !4417
  %6 = load i32, ptr %i, align 4, !dbg !4418
  %arrayidx1 = getelementptr inbounds i64, ptr %5, i32 %6, !dbg !4417
  store i64 %4, ptr %arrayidx1, align 8, !dbg !4419
  br label %for.inc, !dbg !4420

for.inc:                                          ; preds = %for.body
  %7 = load i32, ptr %i, align 4, !dbg !4421
  %inc = add nsw i32 %7, 1, !dbg !4421
  store i32 %inc, ptr %i, align 4, !dbg !4421
  br label %for.cond, !dbg !4422, !llvm.loop !4423

for.end:                                          ; preds = %for.cond
  ret void, !dbg !4425
}

; Function Attrs: noinline nounwind optnone
define internal void @m_vec_add.18(i32 noundef %m_vec_limbs, ptr noundef %in, ptr noundef %acc) #0 !dbg !4426 {
entry:
  %m_vec_limbs.addr = alloca i32, align 4
  %in.addr = alloca ptr, align 4
  %acc.addr = alloca ptr, align 4
  %i = alloca i32, align 4
  store i32 %m_vec_limbs, ptr %m_vec_limbs.addr, align 4
    #dbg_declare(ptr %m_vec_limbs.addr, !4427, !DIExpression(), !4428)
  store ptr %in, ptr %in.addr, align 4
    #dbg_declare(ptr %in.addr, !4429, !DIExpression(), !4430)
  store ptr %acc, ptr %acc.addr, align 4
    #dbg_declare(ptr %acc.addr, !4431, !DIExpression(), !4432)
    #dbg_declare(ptr %i, !4433, !DIExpression(), !4435)
  store i32 0, ptr %i, align 4, !dbg !4435
  br label %for.cond, !dbg !4436

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4, !dbg !4437
  %1 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4439
  %cmp = icmp slt i32 %0, %1, !dbg !4440
  br i1 %cmp, label %for.body, label %for.end, !dbg !4441

for.body:                                         ; preds = %for.cond
  %2 = load ptr, ptr %in.addr, align 4, !dbg !4442
  %3 = load i32, ptr %i, align 4, !dbg !4444
  %arrayidx = getelementptr inbounds i64, ptr %2, i32 %3, !dbg !4442
  %4 = load i64, ptr %arrayidx, align 8, !dbg !4442
  %5 = load ptr, ptr %acc.addr, align 4, !dbg !4445
  %6 = load i32, ptr %i, align 4, !dbg !4446
  %arrayidx1 = getelementptr inbounds i64, ptr %5, i32 %6, !dbg !4445
  %7 = load i64, ptr %arrayidx1, align 8, !dbg !4447
  %xor = xor i64 %7, %4, !dbg !4447
  store i64 %xor, ptr %arrayidx1, align 8, !dbg !4447
  br label %for.inc, !dbg !4448

for.inc:                                          ; preds = %for.body
  %8 = load i32, ptr %i, align 4, !dbg !4449
  %inc = add nsw i32 %8, 1, !dbg !4449
  store i32 %inc, ptr %i, align 4, !dbg !4449
  br label %for.cond, !dbg !4450, !llvm.loop !4451

for.end:                                          ; preds = %for.cond
  ret void, !dbg !4453
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @sample_solution(ptr noundef %p, ptr noundef %A, ptr noundef %y, ptr noundef %r, ptr noundef %x, i32 noundef %k, i32 noundef %o, i32 noundef %m, i32 noundef %A_cols) #0 !dbg !4454 {
entry:
  %retval = alloca i32, align 4
  %p.addr = alloca ptr, align 4
  %A.addr = alloca ptr, align 4
  %y.addr = alloca ptr, align 4
  %r.addr = alloca ptr, align 4
  %x.addr = alloca ptr, align 4
  %k.addr = alloca i32, align 4
  %o.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %A_cols.addr = alloca i32, align 4
  %finished = alloca i8, align 1
  %col_upper_bound = alloca i32, align 4
  %correct_column = alloca i8, align 1
  %i = alloca i32, align 4
  %Ar = alloca [142 x i8], align 1
  %i2 = alloca i32, align 4
  %i16 = alloca i32, align 4
  %full_rank = alloca i8, align 1
  %i33 = alloca i32, align 4
  %row = alloca i32, align 4
  %col = alloca i32, align 4
  %u = alloca i8, align 1
  %i86 = alloca i32, align 4
  %tmp = alloca i64, align 8
  store ptr %p, ptr %p.addr, align 4
    #dbg_declare(ptr %p.addr, !4457, !DIExpression(), !4458)
  store ptr %A, ptr %A.addr, align 4
    #dbg_declare(ptr %A.addr, !4459, !DIExpression(), !4460)
  store ptr %y, ptr %y.addr, align 4
    #dbg_declare(ptr %y.addr, !4461, !DIExpression(), !4462)
  store ptr %r, ptr %r.addr, align 4
    #dbg_declare(ptr %r.addr, !4463, !DIExpression(), !4464)
  store ptr %x, ptr %x.addr, align 4
    #dbg_declare(ptr %x.addr, !4465, !DIExpression(), !4466)
  store i32 %k, ptr %k.addr, align 4
    #dbg_declare(ptr %k.addr, !4467, !DIExpression(), !4468)
  store i32 %o, ptr %o.addr, align 4
    #dbg_declare(ptr %o.addr, !4469, !DIExpression(), !4470)
  store i32 %m, ptr %m.addr, align 4
    #dbg_declare(ptr %m.addr, !4471, !DIExpression(), !4472)
  store i32 %A_cols, ptr %A_cols.addr, align 4
    #dbg_declare(ptr %A_cols.addr, !4473, !DIExpression(), !4474)
    #dbg_declare(ptr %finished, !4475, !DIExpression(), !4476)
    #dbg_declare(ptr %col_upper_bound, !4477, !DIExpression(), !4478)
    #dbg_declare(ptr %correct_column, !4479, !DIExpression(), !4480)
    #dbg_declare(ptr %i, !4481, !DIExpression(), !4483)
  store i32 0, ptr %i, align 4, !dbg !4483
  br label %for.cond, !dbg !4484

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4, !dbg !4485
  %1 = load i32, ptr %k.addr, align 4, !dbg !4487
  %2 = load i32, ptr %o.addr, align 4, !dbg !4488
  %mul = mul nsw i32 %1, %2, !dbg !4489
  %cmp = icmp slt i32 %0, %mul, !dbg !4490
  br i1 %cmp, label %for.body, label %for.end, !dbg !4491

for.body:                                         ; preds = %for.cond
  %3 = load ptr, ptr %r.addr, align 4, !dbg !4492
  %4 = load i32, ptr %i, align 4, !dbg !4494
  %arrayidx = getelementptr inbounds i8, ptr %3, i32 %4, !dbg !4492
  %5 = load i8, ptr %arrayidx, align 1, !dbg !4492
  %6 = load ptr, ptr %x.addr, align 4, !dbg !4495
  %7 = load i32, ptr %i, align 4, !dbg !4496
  %arrayidx1 = getelementptr inbounds i8, ptr %6, i32 %7, !dbg !4495
  store i8 %5, ptr %arrayidx1, align 1, !dbg !4497
  br label %for.inc, !dbg !4498

for.inc:                                          ; preds = %for.body
  %8 = load i32, ptr %i, align 4, !dbg !4499
  %inc = add nsw i32 %8, 1, !dbg !4499
  store i32 %inc, ptr %i, align 4, !dbg !4499
  br label %for.cond, !dbg !4500, !llvm.loop !4501

for.end:                                          ; preds = %for.cond
    #dbg_declare(ptr %Ar, !4503, !DIExpression(), !4504)
    #dbg_declare(ptr %i2, !4505, !DIExpression(), !4507)
  store i32 0, ptr %i2, align 4, !dbg !4507
  br label %for.cond3, !dbg !4508

for.cond3:                                        ; preds = %for.inc11, %for.end
  %9 = load i32, ptr %i2, align 4, !dbg !4509
  %10 = load i32, ptr %m.addr, align 4, !dbg !4511
  %cmp4 = icmp slt i32 %9, %10, !dbg !4512
  br i1 %cmp4, label %for.body5, label %for.end13, !dbg !4513

for.body5:                                        ; preds = %for.cond3
  %11 = load ptr, ptr %A.addr, align 4, !dbg !4514
  %12 = load i32, ptr %k.addr, align 4, !dbg !4516
  %13 = load i32, ptr %o.addr, align 4, !dbg !4517
  %mul6 = mul nsw i32 %12, %13, !dbg !4518
  %14 = load i32, ptr %i2, align 4, !dbg !4519
  %15 = load i32, ptr %k.addr, align 4, !dbg !4520
  %16 = load i32, ptr %o.addr, align 4, !dbg !4521
  %mul7 = mul nsw i32 %15, %16, !dbg !4522
  %add = add nsw i32 %mul7, 1, !dbg !4523
  %mul8 = mul nsw i32 %14, %add, !dbg !4524
  %add9 = add nsw i32 %mul6, %mul8, !dbg !4525
  %arrayidx10 = getelementptr inbounds i8, ptr %11, i32 %add9, !dbg !4514
  store i8 0, ptr %arrayidx10, align 1, !dbg !4526
  br label %for.inc11, !dbg !4527

for.inc11:                                        ; preds = %for.body5
  %17 = load i32, ptr %i2, align 4, !dbg !4528
  %inc12 = add nsw i32 %17, 1, !dbg !4528
  store i32 %inc12, ptr %i2, align 4, !dbg !4528
  br label %for.cond3, !dbg !4529, !llvm.loop !4530

for.end13:                                        ; preds = %for.cond3
  %18 = load ptr, ptr %A.addr, align 4, !dbg !4532
  %19 = load ptr, ptr %r.addr, align 4, !dbg !4533
  %arraydecay = getelementptr inbounds [142 x i8], ptr %Ar, i32 0, i32 0, !dbg !4534
  %20 = load i32, ptr %k.addr, align 4, !dbg !4535
  %21 = load i32, ptr %o.addr, align 4, !dbg !4536
  %mul14 = mul nsw i32 %20, %21, !dbg !4537
  %add15 = add nsw i32 %mul14, 1, !dbg !4538
  %22 = load i32, ptr %m.addr, align 4, !dbg !4539
  call void @mat_mul.21(ptr noundef %18, ptr noundef %19, ptr noundef %arraydecay, i32 noundef %add15, i32 noundef %22, i32 noundef 1) #5, !dbg !4540
    #dbg_declare(ptr %i16, !4541, !DIExpression(), !4543)
  store i32 0, ptr %i16, align 4, !dbg !4543
  br label %for.cond17, !dbg !4544

for.cond17:                                       ; preds = %for.inc28, %for.end13
  %23 = load i32, ptr %i16, align 4, !dbg !4545
  %24 = load i32, ptr %m.addr, align 4, !dbg !4547
  %cmp18 = icmp slt i32 %23, %24, !dbg !4548
  br i1 %cmp18, label %for.body19, label %for.end30, !dbg !4549

for.body19:                                       ; preds = %for.cond17
  %25 = load ptr, ptr %y.addr, align 4, !dbg !4550
  %26 = load i32, ptr %i16, align 4, !dbg !4552
  %arrayidx20 = getelementptr inbounds i8, ptr %25, i32 %26, !dbg !4550
  %27 = load i8, ptr %arrayidx20, align 1, !dbg !4550
  %28 = load i32, ptr %i16, align 4, !dbg !4553
  %arrayidx21 = getelementptr inbounds [142 x i8], ptr %Ar, i32 0, i32 %28, !dbg !4554
  %29 = load i8, ptr %arrayidx21, align 1, !dbg !4554
  %call = call zeroext i8 @sub_f(i8 noundef zeroext %27, i8 noundef zeroext %29) #5, !dbg !4555
  %30 = load ptr, ptr %A.addr, align 4, !dbg !4556
  %31 = load i32, ptr %k.addr, align 4, !dbg !4557
  %32 = load i32, ptr %o.addr, align 4, !dbg !4558
  %mul22 = mul nsw i32 %31, %32, !dbg !4559
  %33 = load i32, ptr %i16, align 4, !dbg !4560
  %34 = load i32, ptr %k.addr, align 4, !dbg !4561
  %35 = load i32, ptr %o.addr, align 4, !dbg !4562
  %mul23 = mul nsw i32 %34, %35, !dbg !4563
  %add24 = add nsw i32 %mul23, 1, !dbg !4564
  %mul25 = mul nsw i32 %33, %add24, !dbg !4565
  %add26 = add nsw i32 %mul22, %mul25, !dbg !4566
  %arrayidx27 = getelementptr inbounds i8, ptr %30, i32 %add26, !dbg !4556
  store i8 %call, ptr %arrayidx27, align 1, !dbg !4567
  br label %for.inc28, !dbg !4568

for.inc28:                                        ; preds = %for.body19
  %36 = load i32, ptr %i16, align 4, !dbg !4569
  %inc29 = add nsw i32 %36, 1, !dbg !4569
  store i32 %inc29, ptr %i16, align 4, !dbg !4569
  br label %for.cond17, !dbg !4570, !llvm.loop !4571

for.end30:                                        ; preds = %for.cond17
  %37 = load ptr, ptr %A.addr, align 4, !dbg !4573
  %38 = load i32, ptr %m.addr, align 4, !dbg !4574
  %39 = load i32, ptr %k.addr, align 4, !dbg !4575
  %40 = load i32, ptr %o.addr, align 4, !dbg !4576
  %mul31 = mul nsw i32 %39, %40, !dbg !4577
  %add32 = add nsw i32 %mul31, 1, !dbg !4578
  call void @EF(ptr noundef %37, i32 noundef %38, i32 noundef %add32) #5, !dbg !4579
    #dbg_declare(ptr %full_rank, !4580, !DIExpression(), !4581)
  store i8 0, ptr %full_rank, align 1, !dbg !4581
    #dbg_declare(ptr %i33, !4582, !DIExpression(), !4584)
  store i32 0, ptr %i33, align 4, !dbg !4584
  br label %for.cond34, !dbg !4585

for.cond34:                                       ; preds = %for.inc43, %for.end30
  %41 = load i32, ptr %i33, align 4, !dbg !4586
  %42 = load i32, ptr %A_cols.addr, align 4, !dbg !4588
  %sub = sub nsw i32 %42, 1, !dbg !4589
  %cmp35 = icmp slt i32 %41, %sub, !dbg !4590
  br i1 %cmp35, label %for.body36, label %for.end45, !dbg !4591

for.body36:                                       ; preds = %for.cond34
  %43 = load ptr, ptr %A.addr, align 4, !dbg !4592
  %44 = load i32, ptr %m.addr, align 4, !dbg !4594
  %sub37 = sub nsw i32 %44, 1, !dbg !4595
  %45 = load i32, ptr %A_cols.addr, align 4, !dbg !4596
  %mul38 = mul nsw i32 %sub37, %45, !dbg !4597
  %46 = load i32, ptr %i33, align 4, !dbg !4598
  %add39 = add nsw i32 %mul38, %46, !dbg !4599
  %arrayidx40 = getelementptr inbounds i8, ptr %43, i32 %add39, !dbg !4592
  %47 = load i8, ptr %arrayidx40, align 1, !dbg !4592
  %conv = zext i8 %47 to i32, !dbg !4592
  %48 = load i8, ptr %full_rank, align 1, !dbg !4600
  %conv41 = zext i8 %48 to i32, !dbg !4600
  %or = or i32 %conv41, %conv, !dbg !4600
  %conv42 = trunc i32 %or to i8, !dbg !4600
  store i8 %conv42, ptr %full_rank, align 1, !dbg !4600
  br label %for.inc43, !dbg !4601

for.inc43:                                        ; preds = %for.body36
  %49 = load i32, ptr %i33, align 4, !dbg !4602
  %inc44 = add nsw i32 %49, 1, !dbg !4602
  store i32 %inc44, ptr %i33, align 4, !dbg !4602
  br label %for.cond34, !dbg !4603, !llvm.loop !4604

for.end45:                                        ; preds = %for.cond34
  %50 = load i8, ptr %full_rank, align 1, !dbg !4606
  %conv46 = zext i8 %50 to i32, !dbg !4606
  %cmp47 = icmp eq i32 %conv46, 0, !dbg !4608
  br i1 %cmp47, label %if.then, label %if.end, !dbg !4608

if.then:                                          ; preds = %for.end45
  store i32 0, ptr %retval, align 4, !dbg !4609
  br label %return, !dbg !4609

if.end:                                           ; preds = %for.end45
    #dbg_declare(ptr %row, !4611, !DIExpression(), !4613)
  %51 = load i32, ptr %m.addr, align 4, !dbg !4614
  %sub49 = sub nsw i32 %51, 1, !dbg !4615
  store i32 %sub49, ptr %row, align 4, !dbg !4613
  br label %for.cond50, !dbg !4616

for.cond50:                                       ; preds = %for.inc232, %if.end
  %52 = load i32, ptr %row, align 4, !dbg !4617
  %cmp51 = icmp sge i32 %52, 0, !dbg !4619
  br i1 %cmp51, label %for.body53, label %for.end233, !dbg !4620

for.body53:                                       ; preds = %for.cond50
  store i8 0, ptr %finished, align 1, !dbg !4621
  %53 = load i32, ptr %row, align 4, !dbg !4623
  %54 = load i32, ptr %m.addr, align 4, !dbg !4623
  %55 = load i32, ptr %row, align 4, !dbg !4623
  %sub54 = sub nsw i32 %54, %55, !dbg !4623
  %div = sdiv i32 32, %sub54, !dbg !4623
  %add55 = add nsw i32 %53, %div, !dbg !4623
  %56 = load i32, ptr %k.addr, align 4, !dbg !4623
  %57 = load i32, ptr %o.addr, align 4, !dbg !4623
  %mul56 = mul nsw i32 %56, %57, !dbg !4623
  %cmp57 = icmp slt i32 %add55, %mul56, !dbg !4623
  br i1 %cmp57, label %cond.true, label %cond.false, !dbg !4623

cond.true:                                        ; preds = %for.body53
  %58 = load i32, ptr %row, align 4, !dbg !4623
  %59 = load i32, ptr %m.addr, align 4, !dbg !4623
  %60 = load i32, ptr %row, align 4, !dbg !4623
  %sub59 = sub nsw i32 %59, %60, !dbg !4623
  %div60 = sdiv i32 32, %sub59, !dbg !4623
  %add61 = add nsw i32 %58, %div60, !dbg !4623
  br label %cond.end, !dbg !4623

cond.false:                                       ; preds = %for.body53
  %61 = load i32, ptr %k.addr, align 4, !dbg !4623
  %62 = load i32, ptr %o.addr, align 4, !dbg !4623
  %mul62 = mul nsw i32 %61, %62, !dbg !4623
  br label %cond.end, !dbg !4623

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %add61, %cond.true ], [ %mul62, %cond.false ], !dbg !4623
  store i32 %cond, ptr %col_upper_bound, align 4, !dbg !4624
    #dbg_declare(ptr %col, !4625, !DIExpression(), !4627)
  %63 = load i32, ptr %row, align 4, !dbg !4628
  store i32 %63, ptr %col, align 4, !dbg !4627
  br label %for.cond63, !dbg !4629

for.cond63:                                       ; preds = %for.inc229, %cond.end
  %64 = load i32, ptr %col, align 4, !dbg !4630
  %65 = load i32, ptr %col_upper_bound, align 4, !dbg !4632
  %cmp64 = icmp sle i32 %64, %65, !dbg !4633
  br i1 %cmp64, label %for.body66, label %for.end231, !dbg !4634

for.body66:                                       ; preds = %for.cond63
  %66 = load ptr, ptr %A.addr, align 4, !dbg !4635
  %67 = load i32, ptr %row, align 4, !dbg !4637
  %68 = load i32, ptr %A_cols.addr, align 4, !dbg !4638
  %mul67 = mul nsw i32 %67, %68, !dbg !4639
  %69 = load i32, ptr %col, align 4, !dbg !4640
  %add68 = add nsw i32 %mul67, %69, !dbg !4641
  %arrayidx69 = getelementptr inbounds i8, ptr %66, i32 %add68, !dbg !4635
  %70 = load i8, ptr %arrayidx69, align 1, !dbg !4635
  %call70 = call zeroext i8 @ct_compare_8(i8 noundef zeroext %70, i8 noundef zeroext 0) #5, !dbg !4642
  %conv71 = zext i8 %call70 to i32, !dbg !4642
  %71 = load i8, ptr %finished, align 1, !dbg !4643
  %conv72 = zext i8 %71 to i32, !dbg !4643
  %not = xor i32 %conv72, -1, !dbg !4644
  %and = and i32 %conv71, %not, !dbg !4645
  %conv73 = trunc i32 %and to i8, !dbg !4642
  store i8 %conv73, ptr %correct_column, align 1, !dbg !4646
    #dbg_declare(ptr %u, !4647, !DIExpression(), !4648)
  %72 = load i8, ptr %correct_column, align 1, !dbg !4649
  %conv74 = zext i8 %72 to i32, !dbg !4649
  %73 = load ptr, ptr %A.addr, align 4, !dbg !4650
  %74 = load i32, ptr %row, align 4, !dbg !4651
  %75 = load i32, ptr %A_cols.addr, align 4, !dbg !4652
  %mul75 = mul nsw i32 %74, %75, !dbg !4653
  %76 = load i32, ptr %A_cols.addr, align 4, !dbg !4654
  %add76 = add nsw i32 %mul75, %76, !dbg !4655
  %sub77 = sub nsw i32 %add76, 1, !dbg !4656
  %arrayidx78 = getelementptr inbounds i8, ptr %73, i32 %sub77, !dbg !4650
  %77 = load i8, ptr %arrayidx78, align 1, !dbg !4650
  %conv79 = zext i8 %77 to i32, !dbg !4650
  %and80 = and i32 %conv74, %conv79, !dbg !4657
  %conv81 = trunc i32 %and80 to i8, !dbg !4649
  store i8 %conv81, ptr %u, align 1, !dbg !4648
  %78 = load i8, ptr %u, align 1, !dbg !4658
  %conv82 = zext i8 %78 to i32, !dbg !4658
  %79 = load ptr, ptr %x.addr, align 4, !dbg !4659
  %80 = load i32, ptr %col, align 4, !dbg !4660
  %arrayidx83 = getelementptr inbounds i8, ptr %79, i32 %80, !dbg !4659
  %81 = load i8, ptr %arrayidx83, align 1, !dbg !4661
  %conv84 = zext i8 %81 to i32, !dbg !4661
  %xor = xor i32 %conv84, %conv82, !dbg !4661
  %conv85 = trunc i32 %xor to i8, !dbg !4661
  store i8 %conv85, ptr %arrayidx83, align 1, !dbg !4661
    #dbg_declare(ptr %i86, !4662, !DIExpression(), !4664)
  store i32 0, ptr %i86, align 4, !dbg !4664
  br label %for.cond87, !dbg !4665

for.cond87:                                       ; preds = %for.inc222, %for.body66
  %82 = load i32, ptr %i86, align 4, !dbg !4666
  %83 = load i32, ptr %row, align 4, !dbg !4668
  %cmp88 = icmp slt i32 %82, %83, !dbg !4669
  br i1 %cmp88, label %for.body90, label %for.end224, !dbg !4670

for.body90:                                       ; preds = %for.cond87
    #dbg_declare(ptr %tmp, !4671, !DIExpression(), !4673)
  %84 = load ptr, ptr %A.addr, align 4, !dbg !4674
  %85 = load i32, ptr %i86, align 4, !dbg !4675
  %86 = load i32, ptr %A_cols.addr, align 4, !dbg !4676
  %mul91 = mul nsw i32 %85, %86, !dbg !4677
  %87 = load i32, ptr %col, align 4, !dbg !4678
  %add92 = add nsw i32 %mul91, %87, !dbg !4679
  %arrayidx93 = getelementptr inbounds i8, ptr %84, i32 %add92, !dbg !4674
  %88 = load i8, ptr %arrayidx93, align 1, !dbg !4674
  %conv94 = zext i8 %88 to i64, !dbg !4680
  %shl = shl i64 %conv94, 0, !dbg !4681
  %89 = load ptr, ptr %A.addr, align 4, !dbg !4682
  %90 = load i32, ptr %i86, align 4, !dbg !4683
  %add95 = add nsw i32 %90, 1, !dbg !4684
  %91 = load i32, ptr %A_cols.addr, align 4, !dbg !4685
  %mul96 = mul nsw i32 %add95, %91, !dbg !4686
  %92 = load i32, ptr %col, align 4, !dbg !4687
  %add97 = add nsw i32 %mul96, %92, !dbg !4688
  %arrayidx98 = getelementptr inbounds i8, ptr %89, i32 %add97, !dbg !4682
  %93 = load i8, ptr %arrayidx98, align 1, !dbg !4682
  %conv99 = zext i8 %93 to i64, !dbg !4689
  %shl100 = shl i64 %conv99, 8, !dbg !4690
  %xor101 = xor i64 %shl, %shl100, !dbg !4691
  %94 = load ptr, ptr %A.addr, align 4, !dbg !4692
  %95 = load i32, ptr %i86, align 4, !dbg !4693
  %add102 = add nsw i32 %95, 2, !dbg !4694
  %96 = load i32, ptr %A_cols.addr, align 4, !dbg !4695
  %mul103 = mul nsw i32 %add102, %96, !dbg !4696
  %97 = load i32, ptr %col, align 4, !dbg !4697
  %add104 = add nsw i32 %mul103, %97, !dbg !4698
  %arrayidx105 = getelementptr inbounds i8, ptr %94, i32 %add104, !dbg !4692
  %98 = load i8, ptr %arrayidx105, align 1, !dbg !4692
  %conv106 = zext i8 %98 to i64, !dbg !4699
  %shl107 = shl i64 %conv106, 16, !dbg !4700
  %xor108 = xor i64 %xor101, %shl107, !dbg !4701
  %99 = load ptr, ptr %A.addr, align 4, !dbg !4702
  %100 = load i32, ptr %i86, align 4, !dbg !4703
  %add109 = add nsw i32 %100, 3, !dbg !4704
  %101 = load i32, ptr %A_cols.addr, align 4, !dbg !4705
  %mul110 = mul nsw i32 %add109, %101, !dbg !4706
  %102 = load i32, ptr %col, align 4, !dbg !4707
  %add111 = add nsw i32 %mul110, %102, !dbg !4708
  %arrayidx112 = getelementptr inbounds i8, ptr %99, i32 %add111, !dbg !4702
  %103 = load i8, ptr %arrayidx112, align 1, !dbg !4702
  %conv113 = zext i8 %103 to i64, !dbg !4709
  %shl114 = shl i64 %conv113, 24, !dbg !4710
  %xor115 = xor i64 %xor108, %shl114, !dbg !4711
  %104 = load ptr, ptr %A.addr, align 4, !dbg !4712
  %105 = load i32, ptr %i86, align 4, !dbg !4713
  %add116 = add nsw i32 %105, 4, !dbg !4714
  %106 = load i32, ptr %A_cols.addr, align 4, !dbg !4715
  %mul117 = mul nsw i32 %add116, %106, !dbg !4716
  %107 = load i32, ptr %col, align 4, !dbg !4717
  %add118 = add nsw i32 %mul117, %107, !dbg !4718
  %arrayidx119 = getelementptr inbounds i8, ptr %104, i32 %add118, !dbg !4712
  %108 = load i8, ptr %arrayidx119, align 1, !dbg !4712
  %conv120 = zext i8 %108 to i64, !dbg !4719
  %shl121 = shl i64 %conv120, 32, !dbg !4720
  %xor122 = xor i64 %xor115, %shl121, !dbg !4721
  %109 = load ptr, ptr %A.addr, align 4, !dbg !4722
  %110 = load i32, ptr %i86, align 4, !dbg !4723
  %add123 = add nsw i32 %110, 5, !dbg !4724
  %111 = load i32, ptr %A_cols.addr, align 4, !dbg !4725
  %mul124 = mul nsw i32 %add123, %111, !dbg !4726
  %112 = load i32, ptr %col, align 4, !dbg !4727
  %add125 = add nsw i32 %mul124, %112, !dbg !4728
  %arrayidx126 = getelementptr inbounds i8, ptr %109, i32 %add125, !dbg !4722
  %113 = load i8, ptr %arrayidx126, align 1, !dbg !4722
  %conv127 = zext i8 %113 to i64, !dbg !4729
  %shl128 = shl i64 %conv127, 40, !dbg !4730
  %xor129 = xor i64 %xor122, %shl128, !dbg !4731
  %114 = load ptr, ptr %A.addr, align 4, !dbg !4732
  %115 = load i32, ptr %i86, align 4, !dbg !4733
  %add130 = add nsw i32 %115, 6, !dbg !4734
  %116 = load i32, ptr %A_cols.addr, align 4, !dbg !4735
  %mul131 = mul nsw i32 %add130, %116, !dbg !4736
  %117 = load i32, ptr %col, align 4, !dbg !4737
  %add132 = add nsw i32 %mul131, %117, !dbg !4738
  %arrayidx133 = getelementptr inbounds i8, ptr %114, i32 %add132, !dbg !4732
  %118 = load i8, ptr %arrayidx133, align 1, !dbg !4732
  %conv134 = zext i8 %118 to i64, !dbg !4739
  %shl135 = shl i64 %conv134, 48, !dbg !4740
  %xor136 = xor i64 %xor129, %shl135, !dbg !4741
  %119 = load ptr, ptr %A.addr, align 4, !dbg !4742
  %120 = load i32, ptr %i86, align 4, !dbg !4743
  %add137 = add nsw i32 %120, 7, !dbg !4744
  %121 = load i32, ptr %A_cols.addr, align 4, !dbg !4745
  %mul138 = mul nsw i32 %add137, %121, !dbg !4746
  %122 = load i32, ptr %col, align 4, !dbg !4747
  %add139 = add nsw i32 %mul138, %122, !dbg !4748
  %arrayidx140 = getelementptr inbounds i8, ptr %119, i32 %add139, !dbg !4742
  %123 = load i8, ptr %arrayidx140, align 1, !dbg !4742
  %conv141 = zext i8 %123 to i64, !dbg !4749
  %shl142 = shl i64 %conv141, 56, !dbg !4750
  %xor143 = xor i64 %xor136, %shl142, !dbg !4751
  store i64 %xor143, ptr %tmp, align 8, !dbg !4673
  %124 = load i8, ptr %u, align 1, !dbg !4752
  %125 = load i64, ptr %tmp, align 8, !dbg !4753
  %call144 = call i64 @mul_fx8(i8 noundef zeroext %124, i64 noundef %125) #5, !dbg !4754
  store i64 %call144, ptr %tmp, align 8, !dbg !4755
  %126 = load i64, ptr %tmp, align 8, !dbg !4756
  %and145 = and i64 %126, 15, !dbg !4757
  %127 = load ptr, ptr %A.addr, align 4, !dbg !4758
  %128 = load i32, ptr %i86, align 4, !dbg !4759
  %129 = load i32, ptr %A_cols.addr, align 4, !dbg !4760
  %mul146 = mul nsw i32 %128, %129, !dbg !4761
  %130 = load i32, ptr %A_cols.addr, align 4, !dbg !4762
  %add147 = add nsw i32 %mul146, %130, !dbg !4763
  %sub148 = sub nsw i32 %add147, 1, !dbg !4764
  %arrayidx149 = getelementptr inbounds i8, ptr %127, i32 %sub148, !dbg !4758
  %131 = load i8, ptr %arrayidx149, align 1, !dbg !4765
  %conv150 = zext i8 %131 to i64, !dbg !4765
  %xor151 = xor i64 %conv150, %and145, !dbg !4765
  %conv152 = trunc i64 %xor151 to i8, !dbg !4765
  store i8 %conv152, ptr %arrayidx149, align 1, !dbg !4765
  %132 = load i64, ptr %tmp, align 8, !dbg !4766
  %shr = lshr i64 %132, 8, !dbg !4767
  %and153 = and i64 %shr, 15, !dbg !4768
  %133 = load ptr, ptr %A.addr, align 4, !dbg !4769
  %134 = load i32, ptr %i86, align 4, !dbg !4770
  %add154 = add nsw i32 %134, 1, !dbg !4771
  %135 = load i32, ptr %A_cols.addr, align 4, !dbg !4772
  %mul155 = mul nsw i32 %add154, %135, !dbg !4773
  %136 = load i32, ptr %A_cols.addr, align 4, !dbg !4774
  %add156 = add nsw i32 %mul155, %136, !dbg !4775
  %sub157 = sub nsw i32 %add156, 1, !dbg !4776
  %arrayidx158 = getelementptr inbounds i8, ptr %133, i32 %sub157, !dbg !4769
  %137 = load i8, ptr %arrayidx158, align 1, !dbg !4777
  %conv159 = zext i8 %137 to i64, !dbg !4777
  %xor160 = xor i64 %conv159, %and153, !dbg !4777
  %conv161 = trunc i64 %xor160 to i8, !dbg !4777
  store i8 %conv161, ptr %arrayidx158, align 1, !dbg !4777
  %138 = load i64, ptr %tmp, align 8, !dbg !4778
  %shr162 = lshr i64 %138, 16, !dbg !4779
  %and163 = and i64 %shr162, 15, !dbg !4780
  %139 = load ptr, ptr %A.addr, align 4, !dbg !4781
  %140 = load i32, ptr %i86, align 4, !dbg !4782
  %add164 = add nsw i32 %140, 2, !dbg !4783
  %141 = load i32, ptr %A_cols.addr, align 4, !dbg !4784
  %mul165 = mul nsw i32 %add164, %141, !dbg !4785
  %142 = load i32, ptr %A_cols.addr, align 4, !dbg !4786
  %add166 = add nsw i32 %mul165, %142, !dbg !4787
  %sub167 = sub nsw i32 %add166, 1, !dbg !4788
  %arrayidx168 = getelementptr inbounds i8, ptr %139, i32 %sub167, !dbg !4781
  %143 = load i8, ptr %arrayidx168, align 1, !dbg !4789
  %conv169 = zext i8 %143 to i64, !dbg !4789
  %xor170 = xor i64 %conv169, %and163, !dbg !4789
  %conv171 = trunc i64 %xor170 to i8, !dbg !4789
  store i8 %conv171, ptr %arrayidx168, align 1, !dbg !4789
  %144 = load i64, ptr %tmp, align 8, !dbg !4790
  %shr172 = lshr i64 %144, 24, !dbg !4791
  %and173 = and i64 %shr172, 15, !dbg !4792
  %145 = load ptr, ptr %A.addr, align 4, !dbg !4793
  %146 = load i32, ptr %i86, align 4, !dbg !4794
  %add174 = add nsw i32 %146, 3, !dbg !4795
  %147 = load i32, ptr %A_cols.addr, align 4, !dbg !4796
  %mul175 = mul nsw i32 %add174, %147, !dbg !4797
  %148 = load i32, ptr %A_cols.addr, align 4, !dbg !4798
  %add176 = add nsw i32 %mul175, %148, !dbg !4799
  %sub177 = sub nsw i32 %add176, 1, !dbg !4800
  %arrayidx178 = getelementptr inbounds i8, ptr %145, i32 %sub177, !dbg !4793
  %149 = load i8, ptr %arrayidx178, align 1, !dbg !4801
  %conv179 = zext i8 %149 to i64, !dbg !4801
  %xor180 = xor i64 %conv179, %and173, !dbg !4801
  %conv181 = trunc i64 %xor180 to i8, !dbg !4801
  store i8 %conv181, ptr %arrayidx178, align 1, !dbg !4801
  %150 = load i64, ptr %tmp, align 8, !dbg !4802
  %shr182 = lshr i64 %150, 32, !dbg !4803
  %and183 = and i64 %shr182, 15, !dbg !4804
  %151 = load ptr, ptr %A.addr, align 4, !dbg !4805
  %152 = load i32, ptr %i86, align 4, !dbg !4806
  %add184 = add nsw i32 %152, 4, !dbg !4807
  %153 = load i32, ptr %A_cols.addr, align 4, !dbg !4808
  %mul185 = mul nsw i32 %add184, %153, !dbg !4809
  %154 = load i32, ptr %A_cols.addr, align 4, !dbg !4810
  %add186 = add nsw i32 %mul185, %154, !dbg !4811
  %sub187 = sub nsw i32 %add186, 1, !dbg !4812
  %arrayidx188 = getelementptr inbounds i8, ptr %151, i32 %sub187, !dbg !4805
  %155 = load i8, ptr %arrayidx188, align 1, !dbg !4813
  %conv189 = zext i8 %155 to i64, !dbg !4813
  %xor190 = xor i64 %conv189, %and183, !dbg !4813
  %conv191 = trunc i64 %xor190 to i8, !dbg !4813
  store i8 %conv191, ptr %arrayidx188, align 1, !dbg !4813
  %156 = load i64, ptr %tmp, align 8, !dbg !4814
  %shr192 = lshr i64 %156, 40, !dbg !4815
  %and193 = and i64 %shr192, 15, !dbg !4816
  %157 = load ptr, ptr %A.addr, align 4, !dbg !4817
  %158 = load i32, ptr %i86, align 4, !dbg !4818
  %add194 = add nsw i32 %158, 5, !dbg !4819
  %159 = load i32, ptr %A_cols.addr, align 4, !dbg !4820
  %mul195 = mul nsw i32 %add194, %159, !dbg !4821
  %160 = load i32, ptr %A_cols.addr, align 4, !dbg !4822
  %add196 = add nsw i32 %mul195, %160, !dbg !4823
  %sub197 = sub nsw i32 %add196, 1, !dbg !4824
  %arrayidx198 = getelementptr inbounds i8, ptr %157, i32 %sub197, !dbg !4817
  %161 = load i8, ptr %arrayidx198, align 1, !dbg !4825
  %conv199 = zext i8 %161 to i64, !dbg !4825
  %xor200 = xor i64 %conv199, %and193, !dbg !4825
  %conv201 = trunc i64 %xor200 to i8, !dbg !4825
  store i8 %conv201, ptr %arrayidx198, align 1, !dbg !4825
  %162 = load i64, ptr %tmp, align 8, !dbg !4826
  %shr202 = lshr i64 %162, 48, !dbg !4827
  %and203 = and i64 %shr202, 15, !dbg !4828
  %163 = load ptr, ptr %A.addr, align 4, !dbg !4829
  %164 = load i32, ptr %i86, align 4, !dbg !4830
  %add204 = add nsw i32 %164, 6, !dbg !4831
  %165 = load i32, ptr %A_cols.addr, align 4, !dbg !4832
  %mul205 = mul nsw i32 %add204, %165, !dbg !4833
  %166 = load i32, ptr %A_cols.addr, align 4, !dbg !4834
  %add206 = add nsw i32 %mul205, %166, !dbg !4835
  %sub207 = sub nsw i32 %add206, 1, !dbg !4836
  %arrayidx208 = getelementptr inbounds i8, ptr %163, i32 %sub207, !dbg !4829
  %167 = load i8, ptr %arrayidx208, align 1, !dbg !4837
  %conv209 = zext i8 %167 to i64, !dbg !4837
  %xor210 = xor i64 %conv209, %and203, !dbg !4837
  %conv211 = trunc i64 %xor210 to i8, !dbg !4837
  store i8 %conv211, ptr %arrayidx208, align 1, !dbg !4837
  %168 = load i64, ptr %tmp, align 8, !dbg !4838
  %shr212 = lshr i64 %168, 56, !dbg !4839
  %and213 = and i64 %shr212, 15, !dbg !4840
  %169 = load ptr, ptr %A.addr, align 4, !dbg !4841
  %170 = load i32, ptr %i86, align 4, !dbg !4842
  %add214 = add nsw i32 %170, 7, !dbg !4843
  %171 = load i32, ptr %A_cols.addr, align 4, !dbg !4844
  %mul215 = mul nsw i32 %add214, %171, !dbg !4845
  %172 = load i32, ptr %A_cols.addr, align 4, !dbg !4846
  %add216 = add nsw i32 %mul215, %172, !dbg !4847
  %sub217 = sub nsw i32 %add216, 1, !dbg !4848
  %arrayidx218 = getelementptr inbounds i8, ptr %169, i32 %sub217, !dbg !4841
  %173 = load i8, ptr %arrayidx218, align 1, !dbg !4849
  %conv219 = zext i8 %173 to i64, !dbg !4849
  %xor220 = xor i64 %conv219, %and213, !dbg !4849
  %conv221 = trunc i64 %xor220 to i8, !dbg !4849
  store i8 %conv221, ptr %arrayidx218, align 1, !dbg !4849
  br label %for.inc222, !dbg !4850

for.inc222:                                       ; preds = %for.body90
  %174 = load i32, ptr %i86, align 4, !dbg !4851
  %add223 = add nsw i32 %174, 8, !dbg !4851
  store i32 %add223, ptr %i86, align 4, !dbg !4851
  br label %for.cond87, !dbg !4852, !llvm.loop !4853

for.end224:                                       ; preds = %for.cond87
  %175 = load i8, ptr %finished, align 1, !dbg !4855
  %conv225 = zext i8 %175 to i32, !dbg !4855
  %176 = load i8, ptr %correct_column, align 1, !dbg !4856
  %conv226 = zext i8 %176 to i32, !dbg !4856
  %or227 = or i32 %conv225, %conv226, !dbg !4857
  %conv228 = trunc i32 %or227 to i8, !dbg !4855
  store i8 %conv228, ptr %finished, align 1, !dbg !4858
  br label %for.inc229, !dbg !4859

for.inc229:                                       ; preds = %for.end224
  %177 = load i32, ptr %col, align 4, !dbg !4860
  %inc230 = add nsw i32 %177, 1, !dbg !4860
  store i32 %inc230, ptr %col, align 4, !dbg !4860
  br label %for.cond63, !dbg !4861, !llvm.loop !4862

for.end231:                                       ; preds = %for.cond63
  br label %for.inc232, !dbg !4864

for.inc232:                                       ; preds = %for.end231
  %178 = load i32, ptr %row, align 4, !dbg !4865
  %dec = add nsw i32 %178, -1, !dbg !4865
  store i32 %dec, ptr %row, align 4, !dbg !4865
  br label %for.cond50, !dbg !4866, !llvm.loop !4867

for.end233:                                       ; preds = %for.cond50
  store i32 1, ptr %retval, align 4, !dbg !4869
  br label %return, !dbg !4869

return:                                           ; preds = %for.end233, %if.then
  %179 = load i32, ptr %retval, align 4, !dbg !4870
  ret i32 %179, !dbg !4870
}

; Function Attrs: noinline nounwind optnone
define internal void @mat_mul.21(ptr noundef %a, ptr noundef %b, ptr noundef %c, i32 noundef %colrow_ab, i32 noundef %row_a, i32 noundef %col_b) #0 !dbg !4871 {
entry:
  %a.addr = alloca ptr, align 4
  %b.addr = alloca ptr, align 4
  %c.addr = alloca ptr, align 4
  %colrow_ab.addr = alloca i32, align 4
  %row_a.addr = alloca i32, align 4
  %col_b.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store ptr %a, ptr %a.addr, align 4
    #dbg_declare(ptr %a.addr, !4872, !DIExpression(), !4873)
  store ptr %b, ptr %b.addr, align 4
    #dbg_declare(ptr %b.addr, !4874, !DIExpression(), !4875)
  store ptr %c, ptr %c.addr, align 4
    #dbg_declare(ptr %c.addr, !4876, !DIExpression(), !4877)
  store i32 %colrow_ab, ptr %colrow_ab.addr, align 4
    #dbg_declare(ptr %colrow_ab.addr, !4878, !DIExpression(), !4879)
  store i32 %row_a, ptr %row_a.addr, align 4
    #dbg_declare(ptr %row_a.addr, !4880, !DIExpression(), !4881)
  store i32 %col_b, ptr %col_b.addr, align 4
    #dbg_declare(ptr %col_b.addr, !4882, !DIExpression(), !4883)
    #dbg_declare(ptr %i, !4884, !DIExpression(), !4886)
  store i32 0, ptr %i, align 4, !dbg !4886
  br label %for.cond, !dbg !4887

for.cond:                                         ; preds = %for.inc4, %entry
  %0 = load i32, ptr %i, align 4, !dbg !4888
  %1 = load i32, ptr %row_a.addr, align 4, !dbg !4890
  %cmp = icmp slt i32 %0, %1, !dbg !4891
  br i1 %cmp, label %for.body, label %for.end7, !dbg !4892

for.body:                                         ; preds = %for.cond
    #dbg_declare(ptr %j, !4893, !DIExpression(), !4896)
  store i32 0, ptr %j, align 4, !dbg !4896
  br label %for.cond1, !dbg !4897

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, ptr %j, align 4, !dbg !4898
  %3 = load i32, ptr %col_b.addr, align 4, !dbg !4900
  %cmp2 = icmp slt i32 %2, %3, !dbg !4901
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !4902

for.body3:                                        ; preds = %for.cond1
  %4 = load ptr, ptr %a.addr, align 4, !dbg !4903
  %5 = load ptr, ptr %b.addr, align 4, !dbg !4905
  %6 = load i32, ptr %j, align 4, !dbg !4906
  %add.ptr = getelementptr inbounds i8, ptr %5, i32 %6, !dbg !4907
  %7 = load i32, ptr %colrow_ab.addr, align 4, !dbg !4908
  %8 = load i32, ptr %col_b.addr, align 4, !dbg !4909
  %call = call zeroext i8 @lincomb.23(ptr noundef %4, ptr noundef %add.ptr, i32 noundef %7, i32 noundef %8) #5, !dbg !4910
  %9 = load ptr, ptr %c.addr, align 4, !dbg !4911
  store i8 %call, ptr %9, align 1, !dbg !4912
  br label %for.inc, !dbg !4913

for.inc:                                          ; preds = %for.body3
  %10 = load i32, ptr %j, align 4, !dbg !4914
  %inc = add nsw i32 %10, 1, !dbg !4914
  store i32 %inc, ptr %j, align 4, !dbg !4914
  %11 = load ptr, ptr %c.addr, align 4, !dbg !4915
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %11, i32 1, !dbg !4915
  store ptr %incdec.ptr, ptr %c.addr, align 4, !dbg !4915
  br label %for.cond1, !dbg !4916, !llvm.loop !4917

for.end:                                          ; preds = %for.cond1
  br label %for.inc4, !dbg !4919

for.inc4:                                         ; preds = %for.end
  %12 = load i32, ptr %i, align 4, !dbg !4920
  %inc5 = add nsw i32 %12, 1, !dbg !4920
  store i32 %inc5, ptr %i, align 4, !dbg !4920
  %13 = load i32, ptr %colrow_ab.addr, align 4, !dbg !4921
  %14 = load ptr, ptr %a.addr, align 4, !dbg !4922
  %add.ptr6 = getelementptr inbounds i8, ptr %14, i32 %13, !dbg !4922
  store ptr %add.ptr6, ptr %a.addr, align 4, !dbg !4922
  br label %for.cond, !dbg !4923, !llvm.loop !4924

for.end7:                                         ; preds = %for.cond
  ret void, !dbg !4926
}

; Function Attrs: noinline nounwind optnone
define internal zeroext i8 @sub_f(i8 noundef zeroext %a, i8 noundef zeroext %b) #0 !dbg !4927 {
entry:
  %a.addr = alloca i8, align 1
  %b.addr = alloca i8, align 1
  store i8 %a, ptr %a.addr, align 1
    #dbg_declare(ptr %a.addr, !4928, !DIExpression(), !4929)
  store i8 %b, ptr %b.addr, align 1
    #dbg_declare(ptr %b.addr, !4930, !DIExpression(), !4931)
  %0 = load i8, ptr %a.addr, align 1, !dbg !4932
  %conv = zext i8 %0 to i32, !dbg !4932
  %1 = load i8, ptr %b.addr, align 1, !dbg !4933
  %conv1 = zext i8 %1 to i32, !dbg !4933
  %xor = xor i32 %conv, %conv1, !dbg !4934
  %conv2 = trunc i32 %xor to i8, !dbg !4932
  ret i8 %conv2, !dbg !4935
}

; Function Attrs: noinline nounwind optnone
define internal void @EF(ptr noundef %A, i32 noundef %nrows, i32 noundef %ncols) #0 !dbg !4936 {
entry:
  %A.addr = alloca ptr, align 4
  %nrows.addr = alloca i32, align 4
  %ncols.addr = alloca i32, align 4
  %_pivot_row = alloca [13 x i64], align 32
  %_pivot_row2 = alloca [13 x i64], align 32
  %packed_A = alloca [1846 x i64], align 32
  %row_len = alloca i32, align 4
  %i = alloca i32, align 4
  %inverse = alloca i8, align 1
  %pivot_row = alloca i32, align 4
  %pivot_col = alloca i32, align 4
  %pivot_row_lower_bound = alloca i32, align 4
  %pivot_row_upper_bound = alloca i32, align 4
  %i17 = alloca i32, align 4
  %pivot = alloca i8, align 1
  %pivot_is_zero = alloca i64, align 8
  %row = alloca i32, align 4
  %is_pivot_row = alloca i64, align 8
  %below_pivot_row = alloca i64, align 8
  %j = alloca i32, align 4
  %row59 = alloca i32, align 4
  %do_copy = alloca i64, align 8
  %do_not_copy = alloca i64, align 8
  %col = alloca i32, align 4
  %row89 = alloca i32, align 4
  %below_pivot = alloca i8, align 1
  %elt_to_elim = alloca i8, align 1
  %temp = alloca [220 x i8], align 1
  %i120 = alloca i32, align 4
  %j129 = alloca i32, align 4
  store ptr %A, ptr %A.addr, align 4
    #dbg_declare(ptr %A.addr, !4940, !DIExpression(), !4941)
  store i32 %nrows, ptr %nrows.addr, align 4
    #dbg_declare(ptr %nrows.addr, !4942, !DIExpression(), !4943)
  store i32 %ncols, ptr %ncols.addr, align 4
    #dbg_declare(ptr %ncols.addr, !4944, !DIExpression(), !4945)
    #dbg_declare(ptr %_pivot_row, !4946, !DIExpression(), !4950)
    #dbg_declare(ptr %_pivot_row2, !4951, !DIExpression(), !4952)
    #dbg_declare(ptr %packed_A, !4953, !DIExpression(), !4957)
  call void @llvm.memset.p0.i32(ptr align 32 %packed_A, i8 0, i32 14768, i1 false), !dbg !4957
    #dbg_declare(ptr %row_len, !4958, !DIExpression(), !4959)
  %0 = load i32, ptr %ncols.addr, align 4, !dbg !4960
  %add = add nsw i32 %0, 15, !dbg !4961
  %div = sdiv i32 %add, 16, !dbg !4962
  store i32 %div, ptr %row_len, align 4, !dbg !4959
    #dbg_declare(ptr %i, !4963, !DIExpression(), !4965)
  store i32 0, ptr %i, align 4, !dbg !4965
  br label %for.cond, !dbg !4966

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, ptr %i, align 4, !dbg !4967
  %2 = load i32, ptr %nrows.addr, align 4, !dbg !4969
  %cmp = icmp slt i32 %1, %2, !dbg !4970
  br i1 %cmp, label %for.body, label %for.end, !dbg !4971

for.body:                                         ; preds = %for.cond
  %3 = load ptr, ptr %A.addr, align 4, !dbg !4972
  %4 = load i32, ptr %i, align 4, !dbg !4974
  %5 = load i32, ptr %ncols.addr, align 4, !dbg !4975
  %mul = mul nsw i32 %4, %5, !dbg !4976
  %add.ptr = getelementptr inbounds i8, ptr %3, i32 %mul, !dbg !4977
  %arraydecay = getelementptr inbounds [1846 x i64], ptr %packed_A, i32 0, i32 0, !dbg !4978
  %6 = load i32, ptr %i, align 4, !dbg !4979
  %7 = load i32, ptr %row_len, align 4, !dbg !4980
  %mul1 = mul nsw i32 %6, %7, !dbg !4981
  %add.ptr2 = getelementptr inbounds i64, ptr %arraydecay, i32 %mul1, !dbg !4982
  %8 = load i32, ptr %ncols.addr, align 4, !dbg !4983
  call void @ef_pack_m_vec(ptr noundef %add.ptr, ptr noundef %add.ptr2, i32 noundef %8) #5, !dbg !4984
  br label %for.inc, !dbg !4985

for.inc:                                          ; preds = %for.body
  %9 = load i32, ptr %i, align 4, !dbg !4986
  %inc = add nsw i32 %9, 1, !dbg !4986
  store i32 %inc, ptr %i, align 4, !dbg !4986
  br label %for.cond, !dbg !4987, !llvm.loop !4988

for.end:                                          ; preds = %for.cond
    #dbg_declare(ptr %inverse, !4990, !DIExpression(), !4991)
    #dbg_declare(ptr %pivot_row, !4992, !DIExpression(), !4993)
  store i32 0, ptr %pivot_row, align 4, !dbg !4993
    #dbg_declare(ptr %pivot_col, !4994, !DIExpression(), !4996)
  store i32 0, ptr %pivot_col, align 4, !dbg !4996
  br label %for.cond3, !dbg !4997

for.cond3:                                        ; preds = %for.inc117, %for.end
  %10 = load i32, ptr %pivot_col, align 4, !dbg !4998
  %11 = load i32, ptr %ncols.addr, align 4, !dbg !5000
  %cmp4 = icmp slt i32 %10, %11, !dbg !5001
  br i1 %cmp4, label %for.body5, label %for.end119, !dbg !5002

for.body5:                                        ; preds = %for.cond3
    #dbg_declare(ptr %pivot_row_lower_bound, !5003, !DIExpression(), !5005)
  %12 = load i32, ptr %pivot_col, align 4, !dbg !5006
  %13 = load i32, ptr %nrows.addr, align 4, !dbg !5006
  %add6 = add nsw i32 %12, %13, !dbg !5006
  %14 = load i32, ptr %ncols.addr, align 4, !dbg !5006
  %sub = sub nsw i32 %add6, %14, !dbg !5006
  %cmp7 = icmp sgt i32 0, %sub, !dbg !5006
  br i1 %cmp7, label %cond.true, label %cond.false, !dbg !5006

cond.true:                                        ; preds = %for.body5
  br label %cond.end, !dbg !5006

cond.false:                                       ; preds = %for.body5
  %15 = load i32, ptr %pivot_col, align 4, !dbg !5006
  %16 = load i32, ptr %nrows.addr, align 4, !dbg !5006
  %add8 = add nsw i32 %15, %16, !dbg !5006
  %17 = load i32, ptr %ncols.addr, align 4, !dbg !5006
  %sub9 = sub nsw i32 %add8, %17, !dbg !5006
  br label %cond.end, !dbg !5006

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 0, %cond.true ], [ %sub9, %cond.false ], !dbg !5006
  store i32 %cond, ptr %pivot_row_lower_bound, align 4, !dbg !5005
    #dbg_declare(ptr %pivot_row_upper_bound, !5007, !DIExpression(), !5008)
  %18 = load i32, ptr %nrows.addr, align 4, !dbg !5009
  %sub10 = sub nsw i32 %18, 1, !dbg !5009
  %19 = load i32, ptr %pivot_col, align 4, !dbg !5009
  %cmp11 = icmp slt i32 %sub10, %19, !dbg !5009
  br i1 %cmp11, label %cond.true12, label %cond.false14, !dbg !5009

cond.true12:                                      ; preds = %cond.end
  %20 = load i32, ptr %nrows.addr, align 4, !dbg !5009
  %sub13 = sub nsw i32 %20, 1, !dbg !5009
  br label %cond.end15, !dbg !5009

cond.false14:                                     ; preds = %cond.end
  %21 = load i32, ptr %pivot_col, align 4, !dbg !5009
  br label %cond.end15, !dbg !5009

cond.end15:                                       ; preds = %cond.false14, %cond.true12
  %cond16 = phi i32 [ %sub13, %cond.true12 ], [ %21, %cond.false14 ], !dbg !5009
  store i32 %cond16, ptr %pivot_row_upper_bound, align 4, !dbg !5008
    #dbg_declare(ptr %i17, !5010, !DIExpression(), !5012)
  store i32 0, ptr %i17, align 4, !dbg !5012
  br label %for.cond18, !dbg !5013

for.cond18:                                       ; preds = %for.inc22, %cond.end15
  %22 = load i32, ptr %i17, align 4, !dbg !5014
  %23 = load i32, ptr %row_len, align 4, !dbg !5016
  %cmp19 = icmp slt i32 %22, %23, !dbg !5017
  br i1 %cmp19, label %for.body20, label %for.end24, !dbg !5018

for.body20:                                       ; preds = %for.cond18
  %24 = load i32, ptr %i17, align 4, !dbg !5019
  %arrayidx = getelementptr inbounds [13 x i64], ptr %_pivot_row, i32 0, i32 %24, !dbg !5021
  store i64 0, ptr %arrayidx, align 8, !dbg !5022
  %25 = load i32, ptr %i17, align 4, !dbg !5023
  %arrayidx21 = getelementptr inbounds [13 x i64], ptr %_pivot_row2, i32 0, i32 %25, !dbg !5024
  store i64 0, ptr %arrayidx21, align 8, !dbg !5025
  br label %for.inc22, !dbg !5026

for.inc22:                                        ; preds = %for.body20
  %26 = load i32, ptr %i17, align 4, !dbg !5027
  %inc23 = add nsw i32 %26, 1, !dbg !5027
  store i32 %inc23, ptr %i17, align 4, !dbg !5027
  br label %for.cond18, !dbg !5028, !llvm.loop !5029

for.end24:                                        ; preds = %for.cond18
    #dbg_declare(ptr %pivot, !5031, !DIExpression(), !5032)
  store i8 0, ptr %pivot, align 1, !dbg !5032
    #dbg_declare(ptr %pivot_is_zero, !5033, !DIExpression(), !5034)
  store i64 -1, ptr %pivot_is_zero, align 8, !dbg !5034
    #dbg_declare(ptr %row, !5035, !DIExpression(), !5037)
  %27 = load i32, ptr %pivot_row_lower_bound, align 4, !dbg !5038
  store i32 %27, ptr %row, align 4, !dbg !5037
  br label %for.cond25, !dbg !5039

for.cond25:                                       ; preds = %for.inc53, %for.end24
  %28 = load i32, ptr %row, align 4, !dbg !5040
  %29 = load i32, ptr %nrows.addr, align 4, !dbg !5042
  %sub26 = sub nsw i32 %29, 1, !dbg !5042
  %30 = load i32, ptr %pivot_row_upper_bound, align 4, !dbg !5042
  %add27 = add nsw i32 %30, 32, !dbg !5042
  %cmp28 = icmp slt i32 %sub26, %add27, !dbg !5042
  br i1 %cmp28, label %cond.true29, label %cond.false31, !dbg !5042

cond.true29:                                      ; preds = %for.cond25
  %31 = load i32, ptr %nrows.addr, align 4, !dbg !5042
  %sub30 = sub nsw i32 %31, 1, !dbg !5042
  br label %cond.end33, !dbg !5042

cond.false31:                                     ; preds = %for.cond25
  %32 = load i32, ptr %pivot_row_upper_bound, align 4, !dbg !5042
  %add32 = add nsw i32 %32, 32, !dbg !5042
  br label %cond.end33, !dbg !5042

cond.end33:                                       ; preds = %cond.false31, %cond.true29
  %cond34 = phi i32 [ %sub30, %cond.true29 ], [ %add32, %cond.false31 ], !dbg !5042
  %cmp35 = icmp sle i32 %28, %cond34, !dbg !5043
  br i1 %cmp35, label %for.body36, label %for.end55, !dbg !5044

for.body36:                                       ; preds = %cond.end33
    #dbg_declare(ptr %is_pivot_row, !5045, !DIExpression(), !5047)
  %33 = load i32, ptr %row, align 4, !dbg !5048
  %34 = load i32, ptr %pivot_row, align 4, !dbg !5049
  %call = call i64 @ct_compare_64(i32 noundef %33, i32 noundef %34) #5, !dbg !5050
  %not = xor i64 %call, -1, !dbg !5051
  store i64 %not, ptr %is_pivot_row, align 8, !dbg !5047
    #dbg_declare(ptr %below_pivot_row, !5052, !DIExpression(), !5053)
  %35 = load i32, ptr %row, align 4, !dbg !5054
  %36 = load i32, ptr %pivot_row, align 4, !dbg !5055
  %call37 = call i64 @ct_64_is_greater_than(i32 noundef %35, i32 noundef %36) #5, !dbg !5056
  store i64 %call37, ptr %below_pivot_row, align 8, !dbg !5053
    #dbg_declare(ptr %j, !5057, !DIExpression(), !5059)
  store i32 0, ptr %j, align 4, !dbg !5059
  br label %for.cond38, !dbg !5060

for.cond38:                                       ; preds = %for.inc46, %for.body36
  %37 = load i32, ptr %j, align 4, !dbg !5061
  %38 = load i32, ptr %row_len, align 4, !dbg !5063
  %cmp39 = icmp slt i32 %37, %38, !dbg !5064
  br i1 %cmp39, label %for.body40, label %for.end48, !dbg !5065

for.body40:                                       ; preds = %for.cond38
  %39 = load i64, ptr %is_pivot_row, align 8, !dbg !5066
  %40 = load i64, ptr %below_pivot_row, align 8, !dbg !5068
  %41 = load i64, ptr %pivot_is_zero, align 8, !dbg !5069
  %and = and i64 %40, %41, !dbg !5070
  %or = or i64 %39, %and, !dbg !5071
  %42 = load i32, ptr %row, align 4, !dbg !5072
  %43 = load i32, ptr %row_len, align 4, !dbg !5073
  %mul41 = mul nsw i32 %42, %43, !dbg !5074
  %44 = load i32, ptr %j, align 4, !dbg !5075
  %add42 = add nsw i32 %mul41, %44, !dbg !5076
  %arrayidx43 = getelementptr inbounds [1846 x i64], ptr %packed_A, i32 0, i32 %add42, !dbg !5077
  %45 = load i64, ptr %arrayidx43, align 8, !dbg !5077
  %and44 = and i64 %or, %45, !dbg !5078
  %46 = load i32, ptr %j, align 4, !dbg !5079
  %arrayidx45 = getelementptr inbounds [13 x i64], ptr %_pivot_row, i32 0, i32 %46, !dbg !5080
  %47 = load i64, ptr %arrayidx45, align 8, !dbg !5081
  %xor = xor i64 %47, %and44, !dbg !5081
  store i64 %xor, ptr %arrayidx45, align 8, !dbg !5081
  br label %for.inc46, !dbg !5082

for.inc46:                                        ; preds = %for.body40
  %48 = load i32, ptr %j, align 4, !dbg !5083
  %inc47 = add nsw i32 %48, 1, !dbg !5083
  store i32 %inc47, ptr %j, align 4, !dbg !5083
  br label %for.cond38, !dbg !5084, !llvm.loop !5085

for.end48:                                        ; preds = %for.cond38
  %arraydecay49 = getelementptr inbounds [13 x i64], ptr %_pivot_row, i32 0, i32 0, !dbg !5087
  %49 = load i32, ptr %pivot_col, align 4, !dbg !5088
  %call50 = call zeroext i8 @m_extract_element(ptr noundef %arraydecay49, i32 noundef %49) #5, !dbg !5089
  store i8 %call50, ptr %pivot, align 1, !dbg !5090
  %50 = load i8, ptr %pivot, align 1, !dbg !5091
  %conv = zext i8 %50 to i32, !dbg !5092
  %call51 = call i64 @ct_compare_64(i32 noundef %conv, i32 noundef 0) #5, !dbg !5093
  %not52 = xor i64 %call51, -1, !dbg !5094
  store i64 %not52, ptr %pivot_is_zero, align 8, !dbg !5095
  br label %for.inc53, !dbg !5096

for.inc53:                                        ; preds = %for.end48
  %51 = load i32, ptr %row, align 4, !dbg !5097
  %inc54 = add nsw i32 %51, 1, !dbg !5097
  store i32 %inc54, ptr %row, align 4, !dbg !5097
  br label %for.cond25, !dbg !5098, !llvm.loop !5099

for.end55:                                        ; preds = %cond.end33
  %52 = load i8, ptr %pivot, align 1, !dbg !5101
  %call56 = call zeroext i8 @inverse_f(i8 noundef zeroext %52) #5, !dbg !5102
  store i8 %call56, ptr %inverse, align 1, !dbg !5103
  %53 = load i32, ptr %row_len, align 4, !dbg !5104
  %arraydecay57 = getelementptr inbounds [13 x i64], ptr %_pivot_row, i32 0, i32 0, !dbg !5105
  %54 = load i8, ptr %inverse, align 1, !dbg !5106
  %arraydecay58 = getelementptr inbounds [13 x i64], ptr %_pivot_row2, i32 0, i32 0, !dbg !5107
  call void @vec_mul_add_u64(i32 noundef %53, ptr noundef %arraydecay57, i8 noundef zeroext %54, ptr noundef %arraydecay58) #5, !dbg !5108
    #dbg_declare(ptr %row59, !5109, !DIExpression(), !5111)
  %55 = load i32, ptr %pivot_row_lower_bound, align 4, !dbg !5112
  store i32 %55, ptr %row59, align 4, !dbg !5111
  br label %for.cond60, !dbg !5113

for.cond60:                                       ; preds = %for.inc86, %for.end55
  %56 = load i32, ptr %row59, align 4, !dbg !5114
  %57 = load i32, ptr %pivot_row_upper_bound, align 4, !dbg !5116
  %cmp61 = icmp sle i32 %56, %57, !dbg !5117
  br i1 %cmp61, label %for.body63, label %for.end88, !dbg !5118

for.body63:                                       ; preds = %for.cond60
    #dbg_declare(ptr %do_copy, !5119, !DIExpression(), !5121)
  %58 = load i32, ptr %row59, align 4, !dbg !5122
  %59 = load i32, ptr %pivot_row, align 4, !dbg !5123
  %call64 = call i64 @ct_compare_64(i32 noundef %58, i32 noundef %59) #5, !dbg !5124
  %not65 = xor i64 %call64, -1, !dbg !5125
  %60 = load i64, ptr %pivot_is_zero, align 8, !dbg !5126
  %not66 = xor i64 %60, -1, !dbg !5127
  %and67 = and i64 %not65, %not66, !dbg !5128
  store i64 %and67, ptr %do_copy, align 8, !dbg !5121
    #dbg_declare(ptr %do_not_copy, !5129, !DIExpression(), !5130)
  %61 = load i64, ptr %do_copy, align 8, !dbg !5131
  %not68 = xor i64 %61, -1, !dbg !5132
  store i64 %not68, ptr %do_not_copy, align 8, !dbg !5130
    #dbg_declare(ptr %col, !5133, !DIExpression(), !5135)
  store i32 0, ptr %col, align 4, !dbg !5135
  br label %for.cond69, !dbg !5136

for.cond69:                                       ; preds = %for.inc83, %for.body63
  %62 = load i32, ptr %col, align 4, !dbg !5137
  %63 = load i32, ptr %row_len, align 4, !dbg !5139
  %cmp70 = icmp slt i32 %62, %63, !dbg !5140
  br i1 %cmp70, label %for.body72, label %for.end85, !dbg !5141

for.body72:                                       ; preds = %for.cond69
  %64 = load i64, ptr %do_not_copy, align 8, !dbg !5142
  %65 = load i32, ptr %row59, align 4, !dbg !5144
  %66 = load i32, ptr %row_len, align 4, !dbg !5145
  %mul73 = mul nsw i32 %65, %66, !dbg !5146
  %67 = load i32, ptr %col, align 4, !dbg !5147
  %add74 = add nsw i32 %mul73, %67, !dbg !5148
  %arrayidx75 = getelementptr inbounds [1846 x i64], ptr %packed_A, i32 0, i32 %add74, !dbg !5149
  %68 = load i64, ptr %arrayidx75, align 8, !dbg !5149
  %and76 = and i64 %64, %68, !dbg !5150
  %69 = load i64, ptr %do_copy, align 8, !dbg !5151
  %70 = load i32, ptr %col, align 4, !dbg !5152
  %arrayidx77 = getelementptr inbounds [13 x i64], ptr %_pivot_row2, i32 0, i32 %70, !dbg !5153
  %71 = load i64, ptr %arrayidx77, align 8, !dbg !5153
  %and78 = and i64 %69, %71, !dbg !5154
  %add79 = add i64 %and76, %and78, !dbg !5155
  %72 = load i32, ptr %row59, align 4, !dbg !5156
  %73 = load i32, ptr %row_len, align 4, !dbg !5157
  %mul80 = mul nsw i32 %72, %73, !dbg !5158
  %74 = load i32, ptr %col, align 4, !dbg !5159
  %add81 = add nsw i32 %mul80, %74, !dbg !5160
  %arrayidx82 = getelementptr inbounds [1846 x i64], ptr %packed_A, i32 0, i32 %add81, !dbg !5161
  store i64 %add79, ptr %arrayidx82, align 8, !dbg !5162
  br label %for.inc83, !dbg !5163

for.inc83:                                        ; preds = %for.body72
  %75 = load i32, ptr %col, align 4, !dbg !5164
  %inc84 = add nsw i32 %75, 1, !dbg !5164
  store i32 %inc84, ptr %col, align 4, !dbg !5164
  br label %for.cond69, !dbg !5165, !llvm.loop !5166

for.end85:                                        ; preds = %for.cond69
  br label %for.inc86, !dbg !5168

for.inc86:                                        ; preds = %for.end85
  %76 = load i32, ptr %row59, align 4, !dbg !5169
  %inc87 = add nsw i32 %76, 1, !dbg !5169
  store i32 %inc87, ptr %row59, align 4, !dbg !5169
  br label %for.cond60, !dbg !5170, !llvm.loop !5171

for.end88:                                        ; preds = %for.cond60
    #dbg_declare(ptr %row89, !5173, !DIExpression(), !5175)
  %77 = load i32, ptr %pivot_row_lower_bound, align 4, !dbg !5176
  store i32 %77, ptr %row89, align 4, !dbg !5175
  br label %for.cond90, !dbg !5177

for.cond90:                                       ; preds = %for.inc109, %for.end88
  %78 = load i32, ptr %row89, align 4, !dbg !5178
  %79 = load i32, ptr %nrows.addr, align 4, !dbg !5180
  %cmp91 = icmp slt i32 %78, %79, !dbg !5181
  br i1 %cmp91, label %for.body93, label %for.end111, !dbg !5182

for.body93:                                       ; preds = %for.cond90
    #dbg_declare(ptr %below_pivot, !5183, !DIExpression(), !5185)
  %80 = load i32, ptr %row89, align 4, !dbg !5186
  %81 = load i32, ptr %pivot_row, align 4, !dbg !5187
  %cmp94 = icmp sgt i32 %80, %81, !dbg !5188
  %conv95 = zext i1 %cmp94 to i32, !dbg !5188
  %conv96 = trunc i32 %conv95 to i8, !dbg !5189
  store i8 %conv96, ptr %below_pivot, align 1, !dbg !5185
    #dbg_declare(ptr %elt_to_elim, !5190, !DIExpression(), !5191)
  %arraydecay97 = getelementptr inbounds [1846 x i64], ptr %packed_A, i32 0, i32 0, !dbg !5192
  %82 = load i32, ptr %row89, align 4, !dbg !5193
  %83 = load i32, ptr %row_len, align 4, !dbg !5194
  %mul98 = mul nsw i32 %82, %83, !dbg !5195
  %add.ptr99 = getelementptr inbounds i64, ptr %arraydecay97, i32 %mul98, !dbg !5196
  %84 = load i32, ptr %pivot_col, align 4, !dbg !5197
  %call100 = call zeroext i8 @m_extract_element(ptr noundef %add.ptr99, i32 noundef %84) #5, !dbg !5198
  store i8 %call100, ptr %elt_to_elim, align 1, !dbg !5191
  %85 = load i32, ptr %row_len, align 4, !dbg !5199
  %arraydecay101 = getelementptr inbounds [13 x i64], ptr %_pivot_row2, i32 0, i32 0, !dbg !5200
  %86 = load i8, ptr %below_pivot, align 1, !dbg !5201
  %conv102 = zext i8 %86 to i32, !dbg !5201
  %87 = load i8, ptr %elt_to_elim, align 1, !dbg !5202
  %conv103 = zext i8 %87 to i32, !dbg !5202
  %mul104 = mul nsw i32 %conv102, %conv103, !dbg !5203
  %conv105 = trunc i32 %mul104 to i8, !dbg !5201
  %arraydecay106 = getelementptr inbounds [1846 x i64], ptr %packed_A, i32 0, i32 0, !dbg !5204
  %88 = load i32, ptr %row89, align 4, !dbg !5205
  %89 = load i32, ptr %row_len, align 4, !dbg !5206
  %mul107 = mul nsw i32 %88, %89, !dbg !5207
  %add.ptr108 = getelementptr inbounds i64, ptr %arraydecay106, i32 %mul107, !dbg !5208
  call void @vec_mul_add_u64(i32 noundef %85, ptr noundef %arraydecay101, i8 noundef zeroext %conv105, ptr noundef %add.ptr108) #5, !dbg !5209
  br label %for.inc109, !dbg !5210

for.inc109:                                       ; preds = %for.body93
  %90 = load i32, ptr %row89, align 4, !dbg !5211
  %inc110 = add nsw i32 %90, 1, !dbg !5211
  store i32 %inc110, ptr %row89, align 4, !dbg !5211
  br label %for.cond90, !dbg !5212, !llvm.loop !5213

for.end111:                                       ; preds = %for.cond90
  %91 = load i64, ptr %pivot_is_zero, align 8, !dbg !5215
  %not112 = xor i64 %91, -1, !dbg !5216
  %sub113 = sub nsw i64 0, %not112, !dbg !5217
  %92 = load i32, ptr %pivot_row, align 4, !dbg !5218
  %conv114 = sext i32 %92 to i64, !dbg !5218
  %add115 = add nsw i64 %conv114, %sub113, !dbg !5218
  %conv116 = trunc i64 %add115 to i32, !dbg !5218
  store i32 %conv116, ptr %pivot_row, align 4, !dbg !5218
  br label %for.inc117, !dbg !5219

for.inc117:                                       ; preds = %for.end111
  %93 = load i32, ptr %pivot_col, align 4, !dbg !5220
  %inc118 = add nsw i32 %93, 1, !dbg !5220
  store i32 %inc118, ptr %pivot_col, align 4, !dbg !5220
  br label %for.cond3, !dbg !5221, !llvm.loop !5222

for.end119:                                       ; preds = %for.cond3
    #dbg_declare(ptr %temp, !5224, !DIExpression(), !5228)
    #dbg_declare(ptr %i120, !5229, !DIExpression(), !5231)
  store i32 0, ptr %i120, align 4, !dbg !5231
  br label %for.cond121, !dbg !5232

for.cond121:                                      ; preds = %for.inc141, %for.end119
  %94 = load i32, ptr %i120, align 4, !dbg !5233
  %95 = load i32, ptr %nrows.addr, align 4, !dbg !5235
  %cmp122 = icmp slt i32 %94, %95, !dbg !5236
  br i1 %cmp122, label %for.body124, label %for.end143, !dbg !5237

for.body124:                                      ; preds = %for.cond121
  %96 = load i32, ptr %row_len, align 4, !dbg !5238
  %arraydecay125 = getelementptr inbounds [1846 x i64], ptr %packed_A, i32 0, i32 0, !dbg !5240
  %97 = load i32, ptr %i120, align 4, !dbg !5241
  %98 = load i32, ptr %row_len, align 4, !dbg !5242
  %mul126 = mul nsw i32 %97, %98, !dbg !5243
  %add.ptr127 = getelementptr inbounds i64, ptr %arraydecay125, i32 %mul126, !dbg !5244
  %arraydecay128 = getelementptr inbounds [220 x i8], ptr %temp, i32 0, i32 0, !dbg !5245
  call void @ef_unpack_m_vec(i32 noundef %96, ptr noundef %add.ptr127, ptr noundef %arraydecay128) #5, !dbg !5246
    #dbg_declare(ptr %j129, !5247, !DIExpression(), !5249)
  store i32 0, ptr %j129, align 4, !dbg !5249
  br label %for.cond130, !dbg !5250

for.cond130:                                      ; preds = %for.inc138, %for.body124
  %99 = load i32, ptr %j129, align 4, !dbg !5251
  %100 = load i32, ptr %ncols.addr, align 4, !dbg !5253
  %cmp131 = icmp slt i32 %99, %100, !dbg !5254
  br i1 %cmp131, label %for.body133, label %for.end140, !dbg !5255

for.body133:                                      ; preds = %for.cond130
  %101 = load i32, ptr %j129, align 4, !dbg !5256
  %arrayidx134 = getelementptr inbounds [220 x i8], ptr %temp, i32 0, i32 %101, !dbg !5258
  %102 = load i8, ptr %arrayidx134, align 1, !dbg !5258
  %103 = load ptr, ptr %A.addr, align 4, !dbg !5259
  %104 = load i32, ptr %i120, align 4, !dbg !5260
  %105 = load i32, ptr %ncols.addr, align 4, !dbg !5261
  %mul135 = mul nsw i32 %104, %105, !dbg !5262
  %106 = load i32, ptr %j129, align 4, !dbg !5263
  %add136 = add nsw i32 %mul135, %106, !dbg !5264
  %arrayidx137 = getelementptr inbounds i8, ptr %103, i32 %add136, !dbg !5259
  store i8 %102, ptr %arrayidx137, align 1, !dbg !5265
  br label %for.inc138, !dbg !5266

for.inc138:                                       ; preds = %for.body133
  %107 = load i32, ptr %j129, align 4, !dbg !5267
  %inc139 = add nsw i32 %107, 1, !dbg !5267
  store i32 %inc139, ptr %j129, align 4, !dbg !5267
  br label %for.cond130, !dbg !5268, !llvm.loop !5269

for.end140:                                       ; preds = %for.cond130
  br label %for.inc141, !dbg !5271

for.inc141:                                       ; preds = %for.end140
  %108 = load i32, ptr %i120, align 4, !dbg !5272
  %inc142 = add nsw i32 %108, 1, !dbg !5272
  store i32 %inc142, ptr %i120, align 4, !dbg !5272
  br label %for.cond121, !dbg !5273, !llvm.loop !5274

for.end143:                                       ; preds = %for.cond121
  %arraydecay144 = getelementptr inbounds [220 x i8], ptr %temp, i32 0, i32 0, !dbg !5276
  call void @mayo_secure_clear(ptr noundef %arraydecay144, i32 noundef 220) #5, !dbg !5277
  %arraydecay145 = getelementptr inbounds [13 x i64], ptr %_pivot_row, i32 0, i32 0, !dbg !5278
  call void @mayo_secure_clear(ptr noundef %arraydecay145, i32 noundef 104) #5, !dbg !5279
  %arraydecay146 = getelementptr inbounds [13 x i64], ptr %_pivot_row2, i32 0, i32 0, !dbg !5280
  call void @mayo_secure_clear(ptr noundef %arraydecay146, i32 noundef 104) #5, !dbg !5281
  %arraydecay147 = getelementptr inbounds [1846 x i64], ptr %packed_A, i32 0, i32 0, !dbg !5282
  call void @mayo_secure_clear(ptr noundef %arraydecay147, i32 noundef 14768) #5, !dbg !5283
  ret void, !dbg !5284
}

; Function Attrs: noinline nounwind optnone
define internal zeroext i8 @ct_compare_8(i8 noundef zeroext %a, i8 noundef zeroext %b) #0 !dbg !5285 {
entry:
  %a.addr = alloca i8, align 1
  %b.addr = alloca i8, align 1
  store i8 %a, ptr %a.addr, align 1
    #dbg_declare(ptr %a.addr, !5287, !DIExpression(), !5288)
  store i8 %b, ptr %b.addr, align 1
    #dbg_declare(ptr %b.addr, !5289, !DIExpression(), !5290)
  %0 = load i8, ptr %a.addr, align 1, !dbg !5291
  %conv = zext i8 %0 to i32, !dbg !5291
  %1 = load i8, ptr %b.addr, align 1, !dbg !5292
  %conv1 = zext i8 %1 to i32, !dbg !5292
  %xor = xor i32 %conv, %conv1, !dbg !5293
  %sub = sub nsw i32 0, %xor, !dbg !5294
  %shr = ashr i32 %sub, 31, !dbg !5295
  %conv2 = trunc i32 %shr to i8, !dbg !5296
  %conv3 = sext i8 %conv2 to i32, !dbg !5296
  %2 = load volatile i8, ptr @unsigned_char_blocker, align 1, !dbg !5297
  %conv4 = zext i8 %2 to i32, !dbg !5297
  %xor5 = xor i32 %conv3, %conv4, !dbg !5298
  %conv6 = trunc i32 %xor5 to i8, !dbg !5299
  ret i8 %conv6, !dbg !5300
}

; Function Attrs: noinline nounwind optnone
define internal i64 @mul_fx8(i8 noundef zeroext %a, i64 noundef %b) #0 !dbg !5301 {
entry:
  %a.addr = alloca i8, align 1
  %b.addr = alloca i64, align 8
  %p = alloca i64, align 8
  %top_p = alloca i64, align 8
  %out = alloca i64, align 8
  store i8 %a, ptr %a.addr, align 1
    #dbg_declare(ptr %a.addr, !5304, !DIExpression(), !5305)
  store i64 %b, ptr %b.addr, align 8
    #dbg_declare(ptr %b.addr, !5306, !DIExpression(), !5307)
    #dbg_declare(ptr %p, !5308, !DIExpression(), !5309)
  %0 = load i8, ptr %a.addr, align 1, !dbg !5310
  %conv = zext i8 %0 to i32, !dbg !5310
  %and = and i32 %conv, 1, !dbg !5311
  %conv1 = sext i32 %and to i64, !dbg !5312
  %1 = load i64, ptr %b.addr, align 8, !dbg !5313
  %mul = mul i64 %conv1, %1, !dbg !5314
  store i64 %mul, ptr %p, align 8, !dbg !5315
  %2 = load i8, ptr %a.addr, align 1, !dbg !5316
  %conv2 = zext i8 %2 to i32, !dbg !5316
  %and3 = and i32 %conv2, 2, !dbg !5317
  %conv4 = sext i32 %and3 to i64, !dbg !5318
  %3 = load i64, ptr %b.addr, align 8, !dbg !5319
  %mul5 = mul i64 %conv4, %3, !dbg !5320
  %4 = load i64, ptr %p, align 8, !dbg !5321
  %xor = xor i64 %4, %mul5, !dbg !5321
  store i64 %xor, ptr %p, align 8, !dbg !5321
  %5 = load i8, ptr %a.addr, align 1, !dbg !5322
  %conv6 = zext i8 %5 to i32, !dbg !5322
  %and7 = and i32 %conv6, 4, !dbg !5323
  %conv8 = sext i32 %and7 to i64, !dbg !5324
  %6 = load i64, ptr %b.addr, align 8, !dbg !5325
  %mul9 = mul i64 %conv8, %6, !dbg !5326
  %7 = load i64, ptr %p, align 8, !dbg !5327
  %xor10 = xor i64 %7, %mul9, !dbg !5327
  store i64 %xor10, ptr %p, align 8, !dbg !5327
  %8 = load i8, ptr %a.addr, align 1, !dbg !5328
  %conv11 = zext i8 %8 to i32, !dbg !5328
  %and12 = and i32 %conv11, 8, !dbg !5329
  %conv13 = sext i32 %and12 to i64, !dbg !5330
  %9 = load i64, ptr %b.addr, align 8, !dbg !5331
  %mul14 = mul i64 %conv13, %9, !dbg !5332
  %10 = load i64, ptr %p, align 8, !dbg !5333
  %xor15 = xor i64 %10, %mul14, !dbg !5333
  store i64 %xor15, ptr %p, align 8, !dbg !5333
    #dbg_declare(ptr %top_p, !5334, !DIExpression(), !5335)
  %11 = load i64, ptr %p, align 8, !dbg !5336
  %and16 = and i64 %11, -1085102592571150096, !dbg !5337
  store i64 %and16, ptr %top_p, align 8, !dbg !5335
    #dbg_declare(ptr %out, !5338, !DIExpression(), !5339)
  %12 = load i64, ptr %p, align 8, !dbg !5340
  %13 = load i64, ptr %top_p, align 8, !dbg !5341
  %shr = lshr i64 %13, 4, !dbg !5342
  %xor17 = xor i64 %12, %shr, !dbg !5343
  %14 = load i64, ptr %top_p, align 8, !dbg !5344
  %shr18 = lshr i64 %14, 3, !dbg !5345
  %xor19 = xor i64 %xor17, %shr18, !dbg !5346
  %and20 = and i64 %xor19, 1085102592571150095, !dbg !5347
  store i64 %and20, ptr %out, align 8, !dbg !5339
  %15 = load i64, ptr %out, align 8, !dbg !5348
  ret i64 %15, !dbg !5349
}

; Function Attrs: noinline nounwind optnone
define internal void @ef_pack_m_vec(ptr noundef %in, ptr noundef %out, i32 noundef %ncols) #0 !dbg !5350 {
entry:
  %in.addr = alloca ptr, align 4
  %out.addr = alloca ptr, align 4
  %ncols.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %out8 = alloca ptr, align 4
  store ptr %in, ptr %in.addr, align 4
    #dbg_declare(ptr %in.addr, !5353, !DIExpression(), !5354)
  store ptr %out, ptr %out.addr, align 4
    #dbg_declare(ptr %out.addr, !5355, !DIExpression(), !5356)
  store i32 %ncols, ptr %ncols.addr, align 4
    #dbg_declare(ptr %ncols.addr, !5357, !DIExpression(), !5358)
    #dbg_declare(ptr %i, !5359, !DIExpression(), !5360)
    #dbg_declare(ptr %out8, !5361, !DIExpression(), !5362)
  %0 = load ptr, ptr %out.addr, align 4, !dbg !5363
  store ptr %0, ptr %out8, align 4, !dbg !5362
  store i32 0, ptr %i, align 4, !dbg !5364
  br label %for.cond, !dbg !5366

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, ptr %i, align 4, !dbg !5367
  %add = add nsw i32 %1, 1, !dbg !5369
  %2 = load i32, ptr %ncols.addr, align 4, !dbg !5370
  %cmp = icmp slt i32 %add, %2, !dbg !5371
  br i1 %cmp, label %for.body, label %for.end, !dbg !5372

for.body:                                         ; preds = %for.cond
  %3 = load ptr, ptr %in.addr, align 4, !dbg !5373
  %4 = load i32, ptr %i, align 4, !dbg !5375
  %add1 = add nsw i32 %4, 0, !dbg !5376
  %arrayidx = getelementptr inbounds i8, ptr %3, i32 %add1, !dbg !5373
  %5 = load i8, ptr %arrayidx, align 1, !dbg !5373
  %conv = zext i8 %5 to i32, !dbg !5373
  %shl = shl i32 %conv, 0, !dbg !5377
  %6 = load ptr, ptr %in.addr, align 4, !dbg !5378
  %7 = load i32, ptr %i, align 4, !dbg !5379
  %add2 = add nsw i32 %7, 1, !dbg !5380
  %arrayidx3 = getelementptr inbounds i8, ptr %6, i32 %add2, !dbg !5378
  %8 = load i8, ptr %arrayidx3, align 1, !dbg !5378
  %conv4 = zext i8 %8 to i32, !dbg !5378
  %shl5 = shl i32 %conv4, 4, !dbg !5381
  %or = or i32 %shl, %shl5, !dbg !5382
  %conv6 = trunc i32 %or to i8, !dbg !5383
  %9 = load ptr, ptr %out8, align 4, !dbg !5384
  %10 = load i32, ptr %i, align 4, !dbg !5385
  %div = sdiv i32 %10, 2, !dbg !5386
  %arrayidx7 = getelementptr inbounds i8, ptr %9, i32 %div, !dbg !5384
  store i8 %conv6, ptr %arrayidx7, align 1, !dbg !5387
  br label %for.inc, !dbg !5388

for.inc:                                          ; preds = %for.body
  %11 = load i32, ptr %i, align 4, !dbg !5389
  %add8 = add nsw i32 %11, 2, !dbg !5389
  store i32 %add8, ptr %i, align 4, !dbg !5389
  br label %for.cond, !dbg !5390, !llvm.loop !5391

for.end:                                          ; preds = %for.cond
  %12 = load i32, ptr %ncols.addr, align 4, !dbg !5393
  %rem = srem i32 %12, 2, !dbg !5395
  %cmp9 = icmp eq i32 %rem, 1, !dbg !5396
  br i1 %cmp9, label %if.then, label %if.end, !dbg !5396

if.then:                                          ; preds = %for.end
  %13 = load ptr, ptr %in.addr, align 4, !dbg !5397
  %14 = load i32, ptr %i, align 4, !dbg !5399
  %add11 = add nsw i32 %14, 0, !dbg !5400
  %arrayidx12 = getelementptr inbounds i8, ptr %13, i32 %add11, !dbg !5397
  %15 = load i8, ptr %arrayidx12, align 1, !dbg !5397
  %conv13 = zext i8 %15 to i32, !dbg !5397
  %shl14 = shl i32 %conv13, 0, !dbg !5401
  %conv15 = trunc i32 %shl14 to i8, !dbg !5402
  %16 = load ptr, ptr %out8, align 4, !dbg !5403
  %17 = load i32, ptr %i, align 4, !dbg !5404
  %div16 = sdiv i32 %17, 2, !dbg !5405
  %arrayidx17 = getelementptr inbounds i8, ptr %16, i32 %div16, !dbg !5403
  store i8 %conv15, ptr %arrayidx17, align 1, !dbg !5406
  br label %if.end, !dbg !5407

if.end:                                           ; preds = %if.then, %for.end
  ret void, !dbg !5408
}

; Function Attrs: noinline nounwind optnone
define internal i64 @ct_compare_64(i32 noundef %a, i32 noundef %b) #0 !dbg !5409 {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  store i32 %a, ptr %a.addr, align 4
    #dbg_declare(ptr %a.addr, !5412, !DIExpression(), !5413)
  store i32 %b, ptr %b.addr, align 4
    #dbg_declare(ptr %b.addr, !5414, !DIExpression(), !5415)
  %0 = load i32, ptr %a.addr, align 4, !dbg !5416
  %1 = load i32, ptr %b.addr, align 4, !dbg !5417
  %xor = xor i32 %0, %1, !dbg !5418
  %conv = sext i32 %xor to i64, !dbg !5419
  %sub = sub nsw i64 0, %conv, !dbg !5420
  %shr = ashr i64 %sub, 63, !dbg !5421
  %2 = load volatile i64, ptr @uint64_t_blocker, align 8, !dbg !5422
  %xor1 = xor i64 %shr, %2, !dbg !5423
  ret i64 %xor1, !dbg !5424
}

; Function Attrs: noinline nounwind optnone
define internal i64 @ct_64_is_greater_than(i32 noundef %a, i32 noundef %b) #0 !dbg !5425 {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %diff = alloca i64, align 8
  store i32 %a, ptr %a.addr, align 4
    #dbg_declare(ptr %a.addr, !5426, !DIExpression(), !5427)
  store i32 %b, ptr %b.addr, align 4
    #dbg_declare(ptr %b.addr, !5428, !DIExpression(), !5429)
    #dbg_declare(ptr %diff, !5430, !DIExpression(), !5431)
  %0 = load i32, ptr %b.addr, align 4, !dbg !5432
  %conv = sext i32 %0 to i64, !dbg !5433
  %1 = load i32, ptr %a.addr, align 4, !dbg !5434
  %conv1 = sext i32 %1 to i64, !dbg !5435
  %sub = sub nsw i64 %conv, %conv1, !dbg !5436
  store i64 %sub, ptr %diff, align 8, !dbg !5431
  %2 = load i64, ptr %diff, align 8, !dbg !5437
  %shr = ashr i64 %2, 63, !dbg !5438
  %3 = load volatile i64, ptr @uint64_t_blocker, align 8, !dbg !5439
  %xor = xor i64 %shr, %3, !dbg !5440
  ret i64 %xor, !dbg !5441
}

; Function Attrs: noinline nounwind optnone
define internal zeroext i8 @m_extract_element(ptr noundef %in, i32 noundef %index) #0 !dbg !5442 {
entry:
  %in.addr = alloca ptr, align 4
  %index.addr = alloca i32, align 4
  %leg = alloca i32, align 4
  %offset = alloca i32, align 4
  store ptr %in, ptr %in.addr, align 4
    #dbg_declare(ptr %in.addr, !5445, !DIExpression(), !5446)
  store i32 %index, ptr %index.addr, align 4
    #dbg_declare(ptr %index.addr, !5447, !DIExpression(), !5448)
    #dbg_declare(ptr %leg, !5449, !DIExpression(), !5450)
  %0 = load i32, ptr %index.addr, align 4, !dbg !5451
  %div = sdiv i32 %0, 16, !dbg !5452
  store i32 %div, ptr %leg, align 4, !dbg !5450
    #dbg_declare(ptr %offset, !5453, !DIExpression(), !5454)
  %1 = load i32, ptr %index.addr, align 4, !dbg !5455
  %rem = srem i32 %1, 16, !dbg !5456
  store i32 %rem, ptr %offset, align 4, !dbg !5454
  %2 = load ptr, ptr %in.addr, align 4, !dbg !5457
  %3 = load i32, ptr %leg, align 4, !dbg !5458
  %arrayidx = getelementptr inbounds i64, ptr %2, i32 %3, !dbg !5457
  %4 = load i64, ptr %arrayidx, align 8, !dbg !5457
  %5 = load i32, ptr %offset, align 4, !dbg !5459
  %mul = mul nsw i32 %5, 4, !dbg !5460
  %sh_prom = zext i32 %mul to i64, !dbg !5461
  %shr = lshr i64 %4, %sh_prom, !dbg !5461
  %and = and i64 %shr, 15, !dbg !5462
  %conv = trunc i64 %and to i8, !dbg !5463
  ret i8 %conv, !dbg !5464
}

; Function Attrs: noinline nounwind optnone
define internal zeroext i8 @inverse_f(i8 noundef zeroext %a) #0 !dbg !5465 {
entry:
  %a.addr = alloca i8, align 1
  %a2 = alloca i8, align 1
  %a4 = alloca i8, align 1
  %a8 = alloca i8, align 1
  %a6 = alloca i8, align 1
  %a14 = alloca i8, align 1
  store i8 %a, ptr %a.addr, align 1
    #dbg_declare(ptr %a.addr, !5468, !DIExpression(), !5469)
    #dbg_declare(ptr %a2, !5470, !DIExpression(), !5471)
  %0 = load i8, ptr %a.addr, align 1, !dbg !5472
  %1 = load i8, ptr %a.addr, align 1, !dbg !5473
  %call = call zeroext i8 @mul_f.22(i8 noundef zeroext %0, i8 noundef zeroext %1) #5, !dbg !5474
  store i8 %call, ptr %a2, align 1, !dbg !5471
    #dbg_declare(ptr %a4, !5475, !DIExpression(), !5476)
  %2 = load i8, ptr %a2, align 1, !dbg !5477
  %3 = load i8, ptr %a2, align 1, !dbg !5478
  %call1 = call zeroext i8 @mul_f.22(i8 noundef zeroext %2, i8 noundef zeroext %3) #5, !dbg !5479
  store i8 %call1, ptr %a4, align 1, !dbg !5476
    #dbg_declare(ptr %a8, !5480, !DIExpression(), !5481)
  %4 = load i8, ptr %a4, align 1, !dbg !5482
  %5 = load i8, ptr %a4, align 1, !dbg !5483
  %call2 = call zeroext i8 @mul_f.22(i8 noundef zeroext %4, i8 noundef zeroext %5) #5, !dbg !5484
  store i8 %call2, ptr %a8, align 1, !dbg !5481
    #dbg_declare(ptr %a6, !5485, !DIExpression(), !5486)
  %6 = load i8, ptr %a2, align 1, !dbg !5487
  %7 = load i8, ptr %a4, align 1, !dbg !5488
  %call3 = call zeroext i8 @mul_f.22(i8 noundef zeroext %6, i8 noundef zeroext %7) #5, !dbg !5489
  store i8 %call3, ptr %a6, align 1, !dbg !5486
    #dbg_declare(ptr %a14, !5490, !DIExpression(), !5491)
  %8 = load i8, ptr %a8, align 1, !dbg !5492
  %9 = load i8, ptr %a6, align 1, !dbg !5493
  %call4 = call zeroext i8 @mul_f.22(i8 noundef zeroext %8, i8 noundef zeroext %9) #5, !dbg !5494
  store i8 %call4, ptr %a14, align 1, !dbg !5491
  %10 = load i8, ptr %a14, align 1, !dbg !5495
  ret i8 %10, !dbg !5496
}

; Function Attrs: noinline nounwind optnone
define internal void @vec_mul_add_u64(i32 noundef %legs, ptr noundef %in, i8 noundef zeroext %a, ptr noundef %acc) #0 !dbg !5497 {
entry:
  %legs.addr = alloca i32, align 4
  %in.addr = alloca ptr, align 4
  %a.addr = alloca i8, align 1
  %acc.addr = alloca ptr, align 4
  %tab = alloca i32, align 4
  %lsb_ask = alloca i64, align 8
  %i = alloca i32, align 4
  store i32 %legs, ptr %legs.addr, align 4
    #dbg_declare(ptr %legs.addr, !5500, !DIExpression(), !5501)
  store ptr %in, ptr %in.addr, align 4
    #dbg_declare(ptr %in.addr, !5502, !DIExpression(), !5503)
  store i8 %a, ptr %a.addr, align 1
    #dbg_declare(ptr %a.addr, !5504, !DIExpression(), !5505)
  store ptr %acc, ptr %acc.addr, align 4
    #dbg_declare(ptr %acc.addr, !5506, !DIExpression(), !5507)
    #dbg_declare(ptr %tab, !5508, !DIExpression(), !5509)
  %0 = load i8, ptr %a.addr, align 1, !dbg !5510
  %call = call i32 @mul_table(i8 noundef zeroext %0) #5, !dbg !5511
  store i32 %call, ptr %tab, align 4, !dbg !5509
    #dbg_declare(ptr %lsb_ask, !5512, !DIExpression(), !5513)
  store i64 1229782938247303441, ptr %lsb_ask, align 8, !dbg !5513
    #dbg_declare(ptr %i, !5514, !DIExpression(), !5516)
  store i32 0, ptr %i, align 4, !dbg !5516
  br label %for.cond, !dbg !5517

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, ptr %i, align 4, !dbg !5518
  %2 = load i32, ptr %legs.addr, align 4, !dbg !5520
  %cmp = icmp slt i32 %1, %2, !dbg !5521
  br i1 %cmp, label %for.body, label %for.end, !dbg !5522

for.body:                                         ; preds = %for.cond
  %3 = load ptr, ptr %in.addr, align 4, !dbg !5523
  %4 = load i32, ptr %i, align 4, !dbg !5525
  %arrayidx = getelementptr inbounds i64, ptr %3, i32 %4, !dbg !5523
  %5 = load i64, ptr %arrayidx, align 8, !dbg !5523
  %6 = load i64, ptr %lsb_ask, align 8, !dbg !5526
  %and = and i64 %5, %6, !dbg !5527
  %7 = load i32, ptr %tab, align 4, !dbg !5528
  %and1 = and i32 %7, 255, !dbg !5529
  %conv = zext i32 %and1 to i64, !dbg !5530
  %mul = mul i64 %and, %conv, !dbg !5531
  %8 = load ptr, ptr %in.addr, align 4, !dbg !5532
  %9 = load i32, ptr %i, align 4, !dbg !5533
  %arrayidx2 = getelementptr inbounds i64, ptr %8, i32 %9, !dbg !5532
  %10 = load i64, ptr %arrayidx2, align 8, !dbg !5532
  %shr = lshr i64 %10, 1, !dbg !5534
  %11 = load i64, ptr %lsb_ask, align 8, !dbg !5535
  %and3 = and i64 %shr, %11, !dbg !5536
  %12 = load i32, ptr %tab, align 4, !dbg !5537
  %shr4 = lshr i32 %12, 8, !dbg !5538
  %and5 = and i32 %shr4, 15, !dbg !5539
  %conv6 = zext i32 %and5 to i64, !dbg !5540
  %mul7 = mul i64 %and3, %conv6, !dbg !5541
  %xor = xor i64 %mul, %mul7, !dbg !5542
  %13 = load ptr, ptr %in.addr, align 4, !dbg !5543
  %14 = load i32, ptr %i, align 4, !dbg !5544
  %arrayidx8 = getelementptr inbounds i64, ptr %13, i32 %14, !dbg !5543
  %15 = load i64, ptr %arrayidx8, align 8, !dbg !5543
  %shr9 = lshr i64 %15, 2, !dbg !5545
  %16 = load i64, ptr %lsb_ask, align 8, !dbg !5546
  %and10 = and i64 %shr9, %16, !dbg !5547
  %17 = load i32, ptr %tab, align 4, !dbg !5548
  %shr11 = lshr i32 %17, 16, !dbg !5549
  %and12 = and i32 %shr11, 15, !dbg !5550
  %conv13 = zext i32 %and12 to i64, !dbg !5551
  %mul14 = mul i64 %and10, %conv13, !dbg !5552
  %xor15 = xor i64 %xor, %mul14, !dbg !5553
  %18 = load ptr, ptr %in.addr, align 4, !dbg !5554
  %19 = load i32, ptr %i, align 4, !dbg !5555
  %arrayidx16 = getelementptr inbounds i64, ptr %18, i32 %19, !dbg !5554
  %20 = load i64, ptr %arrayidx16, align 8, !dbg !5554
  %shr17 = lshr i64 %20, 3, !dbg !5556
  %21 = load i64, ptr %lsb_ask, align 8, !dbg !5557
  %and18 = and i64 %shr17, %21, !dbg !5558
  %22 = load i32, ptr %tab, align 4, !dbg !5559
  %shr19 = lshr i32 %22, 24, !dbg !5560
  %and20 = and i32 %shr19, 15, !dbg !5561
  %conv21 = zext i32 %and20 to i64, !dbg !5562
  %mul22 = mul i64 %and18, %conv21, !dbg !5563
  %xor23 = xor i64 %xor15, %mul22, !dbg !5564
  %23 = load ptr, ptr %acc.addr, align 4, !dbg !5565
  %24 = load i32, ptr %i, align 4, !dbg !5566
  %arrayidx24 = getelementptr inbounds i64, ptr %23, i32 %24, !dbg !5565
  %25 = load i64, ptr %arrayidx24, align 8, !dbg !5567
  %xor25 = xor i64 %25, %xor23, !dbg !5567
  store i64 %xor25, ptr %arrayidx24, align 8, !dbg !5567
  br label %for.inc, !dbg !5568

for.inc:                                          ; preds = %for.body
  %26 = load i32, ptr %i, align 4, !dbg !5569
  %inc = add nsw i32 %26, 1, !dbg !5569
  store i32 %inc, ptr %i, align 4, !dbg !5569
  br label %for.cond, !dbg !5570, !llvm.loop !5571

for.end:                                          ; preds = %for.cond
  ret void, !dbg !5573
}

; Function Attrs: noinline nounwind optnone
define internal void @ef_unpack_m_vec(i32 noundef %legs, ptr noundef %in, ptr noundef %out) #0 !dbg !5574 {
entry:
  %legs.addr = alloca i32, align 4
  %in.addr = alloca ptr, align 4
  %out.addr = alloca ptr, align 4
  %in8 = alloca ptr, align 4
  %i = alloca i32, align 4
  store i32 %legs, ptr %legs.addr, align 4
    #dbg_declare(ptr %legs.addr, !5577, !DIExpression(), !5578)
  store ptr %in, ptr %in.addr, align 4
    #dbg_declare(ptr %in.addr, !5579, !DIExpression(), !5580)
  store ptr %out, ptr %out.addr, align 4
    #dbg_declare(ptr %out.addr, !5581, !DIExpression(), !5582)
    #dbg_declare(ptr %in8, !5583, !DIExpression(), !5584)
  %0 = load ptr, ptr %in.addr, align 4, !dbg !5585
  store ptr %0, ptr %in8, align 4, !dbg !5584
    #dbg_declare(ptr %i, !5586, !DIExpression(), !5588)
  store i32 0, ptr %i, align 4, !dbg !5588
  br label %for.cond, !dbg !5589

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, ptr %i, align 4, !dbg !5590
  %2 = load i32, ptr %legs.addr, align 4, !dbg !5592
  %mul = mul nsw i32 %2, 16, !dbg !5593
  %cmp = icmp slt i32 %1, %mul, !dbg !5594
  br i1 %cmp, label %for.body, label %for.end, !dbg !5595

for.body:                                         ; preds = %for.cond
  %3 = load ptr, ptr %in8, align 4, !dbg !5596
  %4 = load i32, ptr %i, align 4, !dbg !5598
  %div = sdiv i32 %4, 2, !dbg !5599
  %arrayidx = getelementptr inbounds i8, ptr %3, i32 %div, !dbg !5596
  %5 = load i8, ptr %arrayidx, align 1, !dbg !5596
  %conv = zext i8 %5 to i32, !dbg !5600
  %and = and i32 %conv, 15, !dbg !5601
  %conv1 = trunc i32 %and to i8, !dbg !5600
  %6 = load ptr, ptr %out.addr, align 4, !dbg !5602
  %7 = load i32, ptr %i, align 4, !dbg !5603
  %arrayidx2 = getelementptr inbounds i8, ptr %6, i32 %7, !dbg !5602
  store i8 %conv1, ptr %arrayidx2, align 1, !dbg !5604
  %8 = load ptr, ptr %in8, align 4, !dbg !5605
  %9 = load i32, ptr %i, align 4, !dbg !5606
  %div3 = sdiv i32 %9, 2, !dbg !5607
  %arrayidx4 = getelementptr inbounds i8, ptr %8, i32 %div3, !dbg !5605
  %10 = load i8, ptr %arrayidx4, align 1, !dbg !5605
  %conv5 = zext i8 %10 to i32, !dbg !5605
  %shr = ashr i32 %conv5, 4, !dbg !5608
  %conv6 = trunc i32 %shr to i8, !dbg !5609
  %11 = load ptr, ptr %out.addr, align 4, !dbg !5610
  %12 = load i32, ptr %i, align 4, !dbg !5611
  %add = add nsw i32 %12, 1, !dbg !5612
  %arrayidx7 = getelementptr inbounds i8, ptr %11, i32 %add, !dbg !5610
  store i8 %conv6, ptr %arrayidx7, align 1, !dbg !5613
  br label %for.inc, !dbg !5614

for.inc:                                          ; preds = %for.body
  %13 = load i32, ptr %i, align 4, !dbg !5615
  %add8 = add nsw i32 %13, 2, !dbg !5615
  store i32 %add8, ptr %i, align 4, !dbg !5615
  br label %for.cond, !dbg !5616, !llvm.loop !5617

for.end:                                          ; preds = %for.cond
  ret void, !dbg !5619
}

; Function Attrs: noinline nounwind optnone
define internal i32 @mul_table(i8 noundef zeroext %b) #0 !dbg !5620 {
entry:
  %b.addr = alloca i8, align 1
  %x = alloca i32, align 4
  %high_nibble_mask = alloca i32, align 4
  %high_half = alloca i32, align 4
  store i8 %b, ptr %b.addr, align 1
    #dbg_declare(ptr %b.addr, !5623, !DIExpression(), !5624)
    #dbg_declare(ptr %x, !5625, !DIExpression(), !5626)
  %0 = load i8, ptr %b.addr, align 1, !dbg !5627
  %conv = zext i8 %0 to i32, !dbg !5628
  %mul = mul i32 %conv, 134480385, !dbg !5629
  store i32 %mul, ptr %x, align 4, !dbg !5626
    #dbg_declare(ptr %high_nibble_mask, !5630, !DIExpression(), !5631)
  store i32 -252645136, ptr %high_nibble_mask, align 4, !dbg !5631
    #dbg_declare(ptr %high_half, !5632, !DIExpression(), !5633)
  %1 = load i32, ptr %x, align 4, !dbg !5634
  %2 = load i32, ptr %high_nibble_mask, align 4, !dbg !5635
  %and = and i32 %1, %2, !dbg !5636
  store i32 %and, ptr %high_half, align 4, !dbg !5633
  %3 = load i32, ptr %x, align 4, !dbg !5637
  %4 = load i32, ptr %high_half, align 4, !dbg !5638
  %shr = lshr i32 %4, 4, !dbg !5639
  %xor = xor i32 %3, %shr, !dbg !5640
  %5 = load i32, ptr %high_half, align 4, !dbg !5641
  %shr1 = lshr i32 %5, 3, !dbg !5642
  %xor2 = xor i32 %xor, %shr1, !dbg !5643
  ret i32 %xor2, !dbg !5644
}

; Function Attrs: noinline nounwind optnone
define internal zeroext i8 @mul_f.22(i8 noundef zeroext %a, i8 noundef zeroext %b) #0 !dbg !5645 {
entry:
  %a.addr = alloca i8, align 1
  %b.addr = alloca i8, align 1
  %p = alloca i8, align 1
  %top_p = alloca i8, align 1
  %out = alloca i8, align 1
  store i8 %a, ptr %a.addr, align 1
    #dbg_declare(ptr %a.addr, !5646, !DIExpression(), !5647)
  store i8 %b, ptr %b.addr, align 1
    #dbg_declare(ptr %b.addr, !5648, !DIExpression(), !5649)
    #dbg_declare(ptr %p, !5650, !DIExpression(), !5651)
  %0 = load volatile i8, ptr @unsigned_char_blocker, align 1, !dbg !5652
  %conv = zext i8 %0 to i32, !dbg !5652
  %1 = load i8, ptr %a.addr, align 1, !dbg !5653
  %conv1 = zext i8 %1 to i32, !dbg !5653
  %xor = xor i32 %conv1, %conv, !dbg !5653
  %conv2 = trunc i32 %xor to i8, !dbg !5653
  store i8 %conv2, ptr %a.addr, align 1, !dbg !5653
  %2 = load i8, ptr %a.addr, align 1, !dbg !5654
  %conv3 = zext i8 %2 to i32, !dbg !5654
  %and = and i32 %conv3, 1, !dbg !5655
  %3 = load i8, ptr %b.addr, align 1, !dbg !5656
  %conv4 = zext i8 %3 to i32, !dbg !5656
  %mul = mul nsw i32 %and, %conv4, !dbg !5657
  %conv5 = trunc i32 %mul to i8, !dbg !5658
  store i8 %conv5, ptr %p, align 1, !dbg !5659
  %4 = load i8, ptr %a.addr, align 1, !dbg !5660
  %conv6 = zext i8 %4 to i32, !dbg !5660
  %and7 = and i32 %conv6, 2, !dbg !5661
  %5 = load i8, ptr %b.addr, align 1, !dbg !5662
  %conv8 = zext i8 %5 to i32, !dbg !5662
  %mul9 = mul nsw i32 %and7, %conv8, !dbg !5663
  %6 = load i8, ptr %p, align 1, !dbg !5664
  %conv10 = zext i8 %6 to i32, !dbg !5664
  %xor11 = xor i32 %conv10, %mul9, !dbg !5664
  %conv12 = trunc i32 %xor11 to i8, !dbg !5664
  store i8 %conv12, ptr %p, align 1, !dbg !5664
  %7 = load i8, ptr %a.addr, align 1, !dbg !5665
  %conv13 = zext i8 %7 to i32, !dbg !5665
  %and14 = and i32 %conv13, 4, !dbg !5666
  %8 = load i8, ptr %b.addr, align 1, !dbg !5667
  %conv15 = zext i8 %8 to i32, !dbg !5667
  %mul16 = mul nsw i32 %and14, %conv15, !dbg !5668
  %9 = load i8, ptr %p, align 1, !dbg !5669
  %conv17 = zext i8 %9 to i32, !dbg !5669
  %xor18 = xor i32 %conv17, %mul16, !dbg !5669
  %conv19 = trunc i32 %xor18 to i8, !dbg !5669
  store i8 %conv19, ptr %p, align 1, !dbg !5669
  %10 = load i8, ptr %a.addr, align 1, !dbg !5670
  %conv20 = zext i8 %10 to i32, !dbg !5670
  %and21 = and i32 %conv20, 8, !dbg !5671
  %11 = load i8, ptr %b.addr, align 1, !dbg !5672
  %conv22 = zext i8 %11 to i32, !dbg !5672
  %mul23 = mul nsw i32 %and21, %conv22, !dbg !5673
  %12 = load i8, ptr %p, align 1, !dbg !5674
  %conv24 = zext i8 %12 to i32, !dbg !5674
  %xor25 = xor i32 %conv24, %mul23, !dbg !5674
  %conv26 = trunc i32 %xor25 to i8, !dbg !5674
  store i8 %conv26, ptr %p, align 1, !dbg !5674
    #dbg_declare(ptr %top_p, !5675, !DIExpression(), !5676)
  %13 = load i8, ptr %p, align 1, !dbg !5677
  %conv27 = zext i8 %13 to i32, !dbg !5677
  %and28 = and i32 %conv27, 240, !dbg !5678
  %conv29 = trunc i32 %and28 to i8, !dbg !5677
  store i8 %conv29, ptr %top_p, align 1, !dbg !5676
    #dbg_declare(ptr %out, !5679, !DIExpression(), !5680)
  %14 = load i8, ptr %p, align 1, !dbg !5681
  %conv30 = zext i8 %14 to i32, !dbg !5681
  %15 = load i8, ptr %top_p, align 1, !dbg !5682
  %conv31 = zext i8 %15 to i32, !dbg !5682
  %shr = ashr i32 %conv31, 4, !dbg !5683
  %xor32 = xor i32 %conv30, %shr, !dbg !5684
  %16 = load i8, ptr %top_p, align 1, !dbg !5685
  %conv33 = zext i8 %16 to i32, !dbg !5685
  %shr34 = ashr i32 %conv33, 3, !dbg !5686
  %xor35 = xor i32 %xor32, %shr34, !dbg !5687
  %and36 = and i32 %xor35, 15, !dbg !5688
  %conv37 = trunc i32 %and36 to i8, !dbg !5689
  store i8 %conv37, ptr %out, align 1, !dbg !5680
  %17 = load i8, ptr %out, align 1, !dbg !5690
  ret i8 %17, !dbg !5691
}

; Function Attrs: noinline nounwind optnone
define internal zeroext i8 @lincomb.23(ptr noundef %a, ptr noundef %b, i32 noundef %n, i32 noundef %m) #0 !dbg !5692 {
entry:
  %a.addr = alloca ptr, align 4
  %b.addr = alloca ptr, align 4
  %n.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %ret = alloca i8, align 1
  %i = alloca i32, align 4
  store ptr %a, ptr %a.addr, align 4
    #dbg_declare(ptr %a.addr, !5693, !DIExpression(), !5694)
  store ptr %b, ptr %b.addr, align 4
    #dbg_declare(ptr %b.addr, !5695, !DIExpression(), !5696)
  store i32 %n, ptr %n.addr, align 4
    #dbg_declare(ptr %n.addr, !5697, !DIExpression(), !5698)
  store i32 %m, ptr %m.addr, align 4
    #dbg_declare(ptr %m.addr, !5699, !DIExpression(), !5700)
    #dbg_declare(ptr %ret, !5701, !DIExpression(), !5702)
  store i8 0, ptr %ret, align 1, !dbg !5702
    #dbg_declare(ptr %i, !5703, !DIExpression(), !5705)
  store i32 0, ptr %i, align 4, !dbg !5705
  br label %for.cond, !dbg !5706

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4, !dbg !5707
  %1 = load i32, ptr %n.addr, align 4, !dbg !5709
  %cmp = icmp slt i32 %0, %1, !dbg !5710
  br i1 %cmp, label %for.body, label %for.end, !dbg !5711

for.body:                                         ; preds = %for.cond
  %2 = load ptr, ptr %a.addr, align 4, !dbg !5712
  %3 = load i32, ptr %i, align 4, !dbg !5714
  %arrayidx = getelementptr inbounds i8, ptr %2, i32 %3, !dbg !5712
  %4 = load i8, ptr %arrayidx, align 1, !dbg !5712
  %5 = load ptr, ptr %b.addr, align 4, !dbg !5715
  %6 = load i8, ptr %5, align 1, !dbg !5716
  %call = call zeroext i8 @mul_f.22(i8 noundef zeroext %4, i8 noundef zeroext %6) #5, !dbg !5717
  %7 = load i8, ptr %ret, align 1, !dbg !5718
  %call1 = call zeroext i8 @add_f.24(i8 noundef zeroext %call, i8 noundef zeroext %7) #5, !dbg !5719
  store i8 %call1, ptr %ret, align 1, !dbg !5720
  br label %for.inc, !dbg !5721

for.inc:                                          ; preds = %for.body
  %8 = load i32, ptr %i, align 4, !dbg !5722
  %inc = add nsw i32 %8, 1, !dbg !5722
  store i32 %inc, ptr %i, align 4, !dbg !5722
  %9 = load i32, ptr %m.addr, align 4, !dbg !5723
  %10 = load ptr, ptr %b.addr, align 4, !dbg !5724
  %add.ptr = getelementptr inbounds i8, ptr %10, i32 %9, !dbg !5724
  store ptr %add.ptr, ptr %b.addr, align 4, !dbg !5724
  br label %for.cond, !dbg !5725, !llvm.loop !5726

for.end:                                          ; preds = %for.cond
  %11 = load i8, ptr %ret, align 1, !dbg !5728
  ret i8 %11, !dbg !5729
}

; Function Attrs: noinline nounwind optnone
define internal zeroext i8 @add_f.24(i8 noundef zeroext %a, i8 noundef zeroext %b) #0 !dbg !5730 {
entry:
  %a.addr = alloca i8, align 1
  %b.addr = alloca i8, align 1
  store i8 %a, ptr %a.addr, align 1
    #dbg_declare(ptr %a.addr, !5731, !DIExpression(), !5732)
  store i8 %b, ptr %b.addr, align 1
    #dbg_declare(ptr %b.addr, !5733, !DIExpression(), !5734)
  %0 = load i8, ptr %a.addr, align 1, !dbg !5735
  %conv = zext i8 %0 to i32, !dbg !5735
  %1 = load i8, ptr %b.addr, align 1, !dbg !5736
  %conv1 = zext i8 %1 to i32, !dbg !5736
  %xor = xor i32 %conv, %conv1, !dbg !5737
  %conv2 = trunc i32 %xor to i8, !dbg !5735
  ret i8 %conv2, !dbg !5738
}

attributes #0 = { noinline nounwind optnone "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+vfp2sp,+vfp3d16sp,+vfp4d16sp,-thumb-mode" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { allocsize(0,1) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+vfp2sp,+vfp3d16sp,+vfp4d16sp,-thumb-mode" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #4 = { "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+vfp2sp,+vfp3d16sp,+vfp4d16sp,-thumb-mode" }
attributes #5 = { nobuiltin "no-builtins" }
attributes #6 = { nobuiltin allocsize(0,1) "no-builtins" }

!llvm.dbg.cu = !{!76, !79, !43}
!llvm.ident = !{!99, !99, !99}
!llvm.module.flags = !{!100, !101, !102, !103}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 41, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "../example.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 136, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 17)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 43, type: !3, isLocal: true, isDefinition: true)
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(scope: null, file: !2, line: 46, type: !11, isLocal: true, isDefinition: true)
!11 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 48, elements: !12)
!12 = !{!13}
!13 = !DISubrange(count: 6)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(scope: null, file: !2, line: 50, type: !16, isLocal: true, isDefinition: true)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 32, elements: !17)
!17 = !{!18}
!18 = !DISubrange(count: 4)
!19 = !DIGlobalVariableExpression(var: !20, expr: !DIExpression())
!20 = distinct !DIGlobalVariable(scope: null, file: !2, line: 53, type: !21, isLocal: true, isDefinition: true)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 152, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 19)
!24 = !DIGlobalVariableExpression(var: !25, expr: !DIExpression())
!25 = distinct !DIGlobalVariable(scope: null, file: !2, line: 63, type: !21, isLocal: true, isDefinition: true)
!26 = !DIGlobalVariableExpression(var: !27, expr: !DIExpression())
!27 = distinct !DIGlobalVariable(scope: null, file: !2, line: 73, type: !28, isLocal: true, isDefinition: true)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 112, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 14)
!31 = !DIGlobalVariableExpression(var: !32, expr: !DIExpression())
!32 = distinct !DIGlobalVariable(scope: null, file: !2, line: 83, type: !33, isLocal: true, isDefinition: true)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 312, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 39)
!36 = !DIGlobalVariableExpression(var: !37, expr: !DIExpression())
!37 = distinct !DIGlobalVariable(scope: null, file: !2, line: 94, type: !38, isLocal: true, isDefinition: true)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 328, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 41)
!41 = !DIGlobalVariableExpression(var: !42, expr: !DIExpression())
!42 = distinct !DIGlobalVariable(name: "uint32_t_blocker", scope: !43, file: !70, line: 126, type: !75, isLocal: false, isDefinition: true)
!43 = distinct !DICompileUnit(language: DW_LANG_C11, file: !44, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !45, globals: !67, splitDebugInlining: false, nameTableKind: None)
!44 = !DIFile(filename: "../../../src/<stdin>", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!45 = !{!46, !51, !52, !55, !57, !60, !62, !65}
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !47, line: 60, baseType: !48)
!47 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/sys/_stdint.h", directory: "")
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !49, line: 105, baseType: !50)
!49 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/machine/_default_types.h", directory: "")
!50 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!51 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !47, line: 56, baseType: !53)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !49, line: 103, baseType: !54)
!54 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!55 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !56, size: 32)
!56 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!57 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !47, line: 48, baseType: !58)
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !49, line: 79, baseType: !59)
!59 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 32)
!61 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !56)
!62 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !47, line: 20, baseType: !63)
!63 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !49, line: 41, baseType: !64)
!64 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!65 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !47, line: 44, baseType: !66)
!66 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !49, line: 77, baseType: !51)
!67 = !{!41, !68, !72}
!68 = !DIGlobalVariableExpression(var: !69, expr: !DIExpression())
!69 = distinct !DIGlobalVariable(name: "uint64_t_blocker", scope: !43, file: !70, line: 127, type: !71, isLocal: false, isDefinition: true)
!70 = !DIFile(filename: "../../../src/arithmetic.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!71 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !46)
!72 = !DIGlobalVariableExpression(var: !73, expr: !DIExpression())
!73 = distinct !DIGlobalVariable(name: "unsigned_char_blocker", scope: !43, file: !70, line: 128, type: !74, isLocal: false, isDefinition: true)
!74 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !56)
!75 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !57)
!76 = distinct !DICompileUnit(language: DW_LANG_C11, file: !77, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !78, splitDebugInlining: false, nameTableKind: None)
!77 = !DIFile(filename: "../<stdin>", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!78 = !{!0, !7, !9, !14, !19, !24, !26, !31, !36}
!79 = distinct !DICompileUnit(language: DW_LANG_C11, file: !44, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !80, globals: !84, splitDebugInlining: false, nameTableKind: None)
!80 = !{!56, !81, !82, !55}
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !46, size: 32)
!82 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !83, line: 214, baseType: !59)
!83 = !DIFile(filename: "/usr/lib/gcc/arm-none-eabi/13.2.1/include/stddef.h", directory: "")
!84 = !{!85, !93, !95, !97}
!85 = !DIGlobalVariableExpression(var: !86, expr: !DIExpression())
!86 = distinct !DIGlobalVariable(name: "even_nibbles", scope: !87, file: !88, line: 112, type: !92, isLocal: true, isDefinition: true)
!87 = distinct !DISubprogram(name: "transpose_16x16_nibbles", scope: !88, file: !88, line: 111, type: !89, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !91)
!88 = !DIFile(filename: "../../../src/mayo.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!89 = !DISubroutineType(types: !90)
!90 = !{null, !81}
!91 = !{}
!92 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !46)
!93 = !DIGlobalVariableExpression(var: !94, expr: !DIExpression())
!94 = distinct !DIGlobalVariable(name: "even_bytes", scope: !87, file: !88, line: 113, type: !92, isLocal: true, isDefinition: true)
!95 = !DIGlobalVariableExpression(var: !96, expr: !DIExpression())
!96 = distinct !DIGlobalVariable(name: "even_2bytes", scope: !87, file: !88, line: 114, type: !92, isLocal: true, isDefinition: true)
!97 = !DIGlobalVariableExpression(var: !98, expr: !DIExpression())
!98 = distinct !DIGlobalVariable(name: "even_half", scope: !87, file: !88, line: 115, type: !92, isLocal: true, isDefinition: true)
!99 = !{!"Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)"}
!100 = !{i32 2, !"Debug Info Version", i32 3}
!101 = !{i32 1, !"wchar_size", i32 4}
!102 = !{i32 1, !"min_enum_size", i32 4}
!103 = !{i32 1, !"Code Model", i32 1}
!104 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 138, type: !105, scopeLine: 138, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !76, retainedNodes: !91)
!105 = !DISubroutineType(types: !106)
!106 = !{!51}
!107 = !DILocalVariable(name: "params", scope: !104, file: !2, line: 140, type: !108)
!108 = !DICompositeType(tag: DW_TAG_array_type, baseType: !109, size: 128, elements: !17)
!109 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !110, size: 32)
!110 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !111)
!111 = !DIDerivedType(tag: DW_TAG_typedef, name: "mayo_params_t", file: !112, line: 289, baseType: !113)
!112 = !DIFile(filename: "../../../include/mayo.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!113 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !112, line: 265, size: 736, elements: !114)
!114 = !{!115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !125, !126, !127, !128, !129, !130, !131, !132, !133, !134, !135, !136, !137}
!115 = !DIDerivedType(tag: DW_TAG_member, name: "m", scope: !113, file: !112, line: 266, baseType: !51, size: 32)
!116 = !DIDerivedType(tag: DW_TAG_member, name: "n", scope: !113, file: !112, line: 267, baseType: !51, size: 32, offset: 32)
!117 = !DIDerivedType(tag: DW_TAG_member, name: "o", scope: !113, file: !112, line: 268, baseType: !51, size: 32, offset: 64)
!118 = !DIDerivedType(tag: DW_TAG_member, name: "k", scope: !113, file: !112, line: 269, baseType: !51, size: 32, offset: 96)
!119 = !DIDerivedType(tag: DW_TAG_member, name: "q", scope: !113, file: !112, line: 270, baseType: !51, size: 32, offset: 128)
!120 = !DIDerivedType(tag: DW_TAG_member, name: "f_tail", scope: !113, file: !112, line: 271, baseType: !60, size: 32, offset: 160)
!121 = !DIDerivedType(tag: DW_TAG_member, name: "m_bytes", scope: !113, file: !112, line: 272, baseType: !51, size: 32, offset: 192)
!122 = !DIDerivedType(tag: DW_TAG_member, name: "O_bytes", scope: !113, file: !112, line: 273, baseType: !51, size: 32, offset: 224)
!123 = !DIDerivedType(tag: DW_TAG_member, name: "v_bytes", scope: !113, file: !112, line: 274, baseType: !51, size: 32, offset: 256)
!124 = !DIDerivedType(tag: DW_TAG_member, name: "r_bytes", scope: !113, file: !112, line: 275, baseType: !51, size: 32, offset: 288)
!125 = !DIDerivedType(tag: DW_TAG_member, name: "R_bytes", scope: !113, file: !112, line: 276, baseType: !51, size: 32, offset: 320)
!126 = !DIDerivedType(tag: DW_TAG_member, name: "P1_bytes", scope: !113, file: !112, line: 277, baseType: !51, size: 32, offset: 352)
!127 = !DIDerivedType(tag: DW_TAG_member, name: "P2_bytes", scope: !113, file: !112, line: 278, baseType: !51, size: 32, offset: 384)
!128 = !DIDerivedType(tag: DW_TAG_member, name: "P3_bytes", scope: !113, file: !112, line: 279, baseType: !51, size: 32, offset: 416)
!129 = !DIDerivedType(tag: DW_TAG_member, name: "csk_bytes", scope: !113, file: !112, line: 280, baseType: !51, size: 32, offset: 448)
!130 = !DIDerivedType(tag: DW_TAG_member, name: "cpk_bytes", scope: !113, file: !112, line: 281, baseType: !51, size: 32, offset: 480)
!131 = !DIDerivedType(tag: DW_TAG_member, name: "sig_bytes", scope: !113, file: !112, line: 282, baseType: !51, size: 32, offset: 512)
!132 = !DIDerivedType(tag: DW_TAG_member, name: "salt_bytes", scope: !113, file: !112, line: 283, baseType: !51, size: 32, offset: 544)
!133 = !DIDerivedType(tag: DW_TAG_member, name: "sk_seed_bytes", scope: !113, file: !112, line: 284, baseType: !51, size: 32, offset: 576)
!134 = !DIDerivedType(tag: DW_TAG_member, name: "digest_bytes", scope: !113, file: !112, line: 285, baseType: !51, size: 32, offset: 608)
!135 = !DIDerivedType(tag: DW_TAG_member, name: "pk_seed_bytes", scope: !113, file: !112, line: 286, baseType: !51, size: 32, offset: 640)
!136 = !DIDerivedType(tag: DW_TAG_member, name: "m_vec_limbs", scope: !113, file: !112, line: 287, baseType: !51, size: 32, offset: 672)
!137 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !113, file: !112, line: 288, baseType: !138, size: 32, offset: 704)
!138 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !139, size: 32)
!139 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!140 = !DILocation(line: 140, column: 26, scope: !104)
!141 = !DILocalVariable(name: "paramslen", scope: !104, file: !2, line: 141, type: !51)
!142 = !DILocation(line: 141, column: 9, scope: !104)
!143 = !DILocalVariable(name: "i", scope: !144, file: !2, line: 142, type: !51)
!144 = distinct !DILexicalBlock(scope: !104, file: !2, line: 142, column: 5)
!145 = !DILocation(line: 142, column: 14, scope: !144)
!146 = !DILocation(line: 142, column: 10, scope: !144)
!147 = !DILocation(line: 142, column: 21, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !2, line: 142, column: 5)
!149 = !DILocation(line: 142, column: 25, scope: !148)
!150 = !DILocation(line: 142, column: 23, scope: !148)
!151 = !DILocation(line: 142, column: 5, scope: !144)
!152 = !DILocation(line: 143, column: 33, scope: !153)
!153 = distinct !DILexicalBlock(scope: !154, file: !2, line: 143, column: 13)
!154 = distinct !DILexicalBlock(scope: !148, file: !2, line: 142, column: 41)
!155 = !DILocation(line: 143, column: 26, scope: !153)
!156 = !DILocation(line: 143, column: 13, scope: !153)
!157 = !DILocation(line: 143, column: 37, scope: !153)
!158 = !DILocation(line: 144, column: 13, scope: !159)
!159 = distinct !DILexicalBlock(scope: !153, file: !2, line: 143, column: 49)
!160 = !DILocation(line: 146, column: 5, scope: !154)
!161 = !DILocation(line: 142, column: 36, scope: !148)
!162 = !DILocation(line: 142, column: 5, scope: !148)
!163 = distinct !{!163, !151, !164, !165}
!164 = !DILocation(line: 146, column: 5, scope: !144)
!165 = !{!"llvm.loop.mustprogress"}
!166 = !DILocation(line: 150, column: 1, scope: !104)
!167 = distinct !DISubprogram(name: "example_mayo", scope: !2, file: !2, line: 25, type: !168, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !76, retainedNodes: !91)
!168 = !DISubroutineType(types: !169)
!169 = !{!51, !109}
!170 = !DILocalVariable(name: "p", arg: 1, scope: !167, file: !2, line: 25, type: !109)
!171 = !DILocation(line: 25, column: 46, scope: !167)
!172 = !DILocalVariable(name: "msglen", scope: !167, file: !2, line: 27, type: !82)
!173 = !DILocation(line: 27, column: 12, scope: !167)
!174 = !DILocalVariable(name: "smlen", scope: !167, file: !2, line: 28, type: !82)
!175 = !DILocation(line: 28, column: 12, scope: !167)
!176 = !DILocation(line: 28, column: 20, scope: !167)
!177 = !DILocation(line: 28, column: 41, scope: !167)
!178 = !DILocation(line: 28, column: 39, scope: !167)
!179 = !DILocalVariable(name: "pk", scope: !167, file: !2, line: 30, type: !55)
!180 = !DILocation(line: 30, column: 20, scope: !167)
!181 = !DILocation(line: 30, column: 33, scope: !167)
!182 = !DILocation(line: 30, column: 26, scope: !167)
!183 = !DILocalVariable(name: "sk", scope: !167, file: !2, line: 31, type: !55)
!184 = !DILocation(line: 31, column: 20, scope: !167)
!185 = !DILocation(line: 31, column: 33, scope: !167)
!186 = !DILocation(line: 31, column: 26, scope: !167)
!187 = !DILocalVariable(name: "epk", scope: !167, file: !2, line: 33, type: !81)
!188 = !DILocation(line: 33, column: 15, scope: !167)
!189 = !DILocation(line: 33, column: 21, scope: !167)
!190 = !DILocalVariable(name: "esk", scope: !167, file: !2, line: 34, type: !191)
!191 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !192, size: 32)
!192 = !DIDerivedType(tag: DW_TAG_typedef, name: "sk_t", file: !112, line: 294, baseType: !193)
!193 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sk_t", file: !112, line: 291, size: 7257920, elements: !194)
!194 = !{!195, !199}
!195 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !193, file: !112, line: 292, baseType: !196, size: 7238592)
!196 = !DICompositeType(tag: DW_TAG_array_type, baseType: !46, size: 7238592, elements: !197)
!197 = !{!198}
!198 = !DISubrange(count: 113103)
!199 = !DIDerivedType(tag: DW_TAG_member, name: "O", scope: !193, file: !112, line: 293, baseType: !200, size: 19312, offset: 7238592)
!200 = !DICompositeType(tag: DW_TAG_array_type, baseType: !201, size: 19312, elements: !203)
!201 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !47, line: 24, baseType: !202)
!202 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !49, line: 43, baseType: !56)
!203 = !{!204}
!204 = !DISubrange(count: 2414)
!205 = !DILocation(line: 34, column: 11, scope: !167)
!206 = !DILocation(line: 34, column: 17, scope: !167)
!207 = !DILocalVariable(name: "sig", scope: !167, file: !2, line: 36, type: !55)
!208 = !DILocation(line: 36, column: 20, scope: !167)
!209 = !DILocation(line: 36, column: 33, scope: !167)
!210 = !DILocation(line: 36, column: 54, scope: !167)
!211 = !DILocation(line: 36, column: 52, scope: !167)
!212 = !DILocation(line: 36, column: 26, scope: !167)
!213 = !DILocalVariable(name: "msg", scope: !167, file: !2, line: 38, type: !214)
!214 = !DICompositeType(tag: DW_TAG_array_type, baseType: !56, size: 256, elements: !215)
!215 = !{!216}
!216 = !DISubrange(count: 32)
!217 = !DILocation(line: 38, column: 19, scope: !167)
!218 = !DILocalVariable(name: "msg2", scope: !167, file: !2, line: 39, type: !214)
!219 = !DILocation(line: 39, column: 19, scope: !167)
!220 = !DILocation(line: 41, column: 33, scope: !167)
!221 = !DILocation(line: 41, column: 5, scope: !167)
!222 = !DILocation(line: 43, column: 5, scope: !167)
!223 = !DILocalVariable(name: "res", scope: !167, file: !2, line: 44, type: !51)
!224 = !DILocation(line: 44, column: 9, scope: !167)
!225 = !DILocation(line: 44, column: 28, scope: !167)
!226 = !DILocation(line: 44, column: 31, scope: !167)
!227 = !DILocation(line: 44, column: 35, scope: !167)
!228 = !DILocation(line: 44, column: 15, scope: !167)
!229 = !DILocation(line: 45, column: 9, scope: !230)
!230 = distinct !DILexicalBlock(scope: !167, file: !2, line: 45, column: 9)
!231 = !DILocation(line: 45, column: 13, scope: !230)
!232 = !DILocation(line: 46, column: 9, scope: !233)
!233 = distinct !DILexicalBlock(scope: !230, file: !2, line: 45, column: 25)
!234 = !DILocation(line: 47, column: 13, scope: !233)
!235 = !DILocation(line: 48, column: 9, scope: !233)
!236 = !DILocation(line: 50, column: 9, scope: !237)
!237 = distinct !DILexicalBlock(scope: !230, file: !2, line: 49, column: 12)
!238 = !DILocation(line: 53, column: 5, scope: !167)
!239 = !DILocation(line: 54, column: 26, scope: !167)
!240 = !DILocation(line: 54, column: 29, scope: !167)
!241 = !DILocation(line: 54, column: 33, scope: !167)
!242 = !DILocation(line: 54, column: 11, scope: !167)
!243 = !DILocation(line: 54, column: 9, scope: !167)
!244 = !DILocation(line: 55, column: 9, scope: !245)
!245 = distinct !DILexicalBlock(scope: !167, file: !2, line: 55, column: 9)
!246 = !DILocation(line: 55, column: 13, scope: !245)
!247 = !DILocation(line: 56, column: 9, scope: !248)
!248 = distinct !DILexicalBlock(scope: !245, file: !2, line: 55, column: 25)
!249 = !DILocation(line: 57, column: 13, scope: !248)
!250 = !DILocation(line: 58, column: 9, scope: !248)
!251 = !DILocation(line: 60, column: 9, scope: !252)
!252 = distinct !DILexicalBlock(scope: !245, file: !2, line: 59, column: 12)
!253 = !DILocation(line: 63, column: 5, scope: !167)
!254 = !DILocation(line: 64, column: 26, scope: !167)
!255 = !DILocation(line: 64, column: 29, scope: !167)
!256 = !DILocation(line: 64, column: 33, scope: !167)
!257 = !DILocation(line: 64, column: 11, scope: !167)
!258 = !DILocation(line: 64, column: 9, scope: !167)
!259 = !DILocation(line: 65, column: 9, scope: !260)
!260 = distinct !DILexicalBlock(scope: !167, file: !2, line: 65, column: 9)
!261 = !DILocation(line: 65, column: 13, scope: !260)
!262 = !DILocation(line: 66, column: 9, scope: !263)
!263 = distinct !DILexicalBlock(scope: !260, file: !2, line: 65, column: 25)
!264 = !DILocation(line: 67, column: 13, scope: !263)
!265 = !DILocation(line: 68, column: 9, scope: !263)
!266 = !DILocation(line: 70, column: 9, scope: !267)
!267 = distinct !DILexicalBlock(scope: !260, file: !2, line: 69, column: 12)
!268 = !DILocation(line: 73, column: 5, scope: !167)
!269 = !DILocation(line: 74, column: 21, scope: !167)
!270 = !DILocation(line: 74, column: 24, scope: !167)
!271 = !DILocation(line: 74, column: 37, scope: !167)
!272 = !DILocation(line: 74, column: 42, scope: !167)
!273 = !DILocation(line: 74, column: 50, scope: !167)
!274 = !DILocation(line: 74, column: 11, scope: !167)
!275 = !DILocation(line: 74, column: 9, scope: !167)
!276 = !DILocation(line: 75, column: 9, scope: !277)
!277 = distinct !DILexicalBlock(scope: !167, file: !2, line: 75, column: 9)
!278 = !DILocation(line: 75, column: 13, scope: !277)
!279 = !DILocation(line: 76, column: 9, scope: !280)
!280 = distinct !DILexicalBlock(scope: !277, file: !2, line: 75, column: 25)
!281 = !DILocation(line: 77, column: 13, scope: !280)
!282 = !DILocation(line: 78, column: 9, scope: !280)
!283 = !DILocation(line: 80, column: 9, scope: !284)
!284 = distinct !DILexicalBlock(scope: !277, file: !2, line: 79, column: 12)
!285 = !DILocation(line: 83, column: 5, scope: !167)
!286 = !DILocation(line: 84, column: 21, scope: !167)
!287 = !DILocation(line: 84, column: 24, scope: !167)
!288 = !DILocation(line: 84, column: 39, scope: !167)
!289 = !DILocation(line: 84, column: 44, scope: !167)
!290 = !DILocation(line: 84, column: 51, scope: !167)
!291 = !DILocation(line: 84, column: 11, scope: !167)
!292 = !DILocation(line: 84, column: 9, scope: !167)
!293 = !DILocation(line: 85, column: 9, scope: !294)
!294 = distinct !DILexicalBlock(scope: !167, file: !2, line: 85, column: 9)
!295 = !DILocation(line: 85, column: 13, scope: !294)
!296 = !DILocation(line: 85, column: 24, scope: !294)
!297 = !DILocation(line: 85, column: 34, scope: !294)
!298 = !DILocation(line: 85, column: 39, scope: !294)
!299 = !DILocation(line: 85, column: 45, scope: !294)
!300 = !DILocation(line: 85, column: 27, scope: !294)
!301 = !DILocation(line: 86, column: 9, scope: !302)
!302 = distinct !DILexicalBlock(scope: !294, file: !2, line: 85, column: 54)
!303 = !DILocation(line: 87, column: 13, scope: !302)
!304 = !DILocation(line: 88, column: 9, scope: !302)
!305 = !DILocation(line: 90, column: 13, scope: !306)
!306 = distinct !DILexicalBlock(scope: !294, file: !2, line: 89, column: 12)
!307 = !DILocation(line: 91, column: 9, scope: !306)
!308 = !DILocation(line: 94, column: 5, scope: !167)
!309 = !DILocation(line: 95, column: 23, scope: !167)
!310 = !DILocation(line: 95, column: 26, scope: !167)
!311 = !DILocation(line: 95, column: 31, scope: !167)
!312 = !DILocation(line: 95, column: 39, scope: !167)
!313 = !DILocation(line: 95, column: 44, scope: !167)
!314 = !DILocation(line: 95, column: 11, scope: !167)
!315 = !DILocation(line: 95, column: 9, scope: !167)
!316 = !DILocation(line: 96, column: 9, scope: !317)
!317 = distinct !DILexicalBlock(scope: !167, file: !2, line: 96, column: 9)
!318 = !DILocation(line: 96, column: 13, scope: !317)
!319 = !DILocation(line: 97, column: 9, scope: !320)
!320 = distinct !DILexicalBlock(scope: !317, file: !2, line: 96, column: 25)
!321 = !DILocation(line: 98, column: 13, scope: !320)
!322 = !DILocation(line: 99, column: 9, scope: !320)
!323 = !DILocation(line: 101, column: 13, scope: !324)
!324 = distinct !DILexicalBlock(scope: !317, file: !2, line: 100, column: 12)
!325 = !DILocation(line: 102, column: 9, scope: !324)
!326 = !DILocation(line: 96, column: 16, scope: !317)
!327 = !DILabel(scope: !167, name: "err", file: !2, line: 129)
!328 = !DILocation(line: 129, column: 1, scope: !167)
!329 = !DILocation(line: 130, column: 10, scope: !167)
!330 = !DILocation(line: 130, column: 5, scope: !167)
!331 = !DILocation(line: 131, column: 10, scope: !167)
!332 = !DILocation(line: 131, column: 5, scope: !167)
!333 = !DILocation(line: 132, column: 22, scope: !167)
!334 = !DILocation(line: 132, column: 26, scope: !167)
!335 = !DILocation(line: 132, column: 5, scope: !167)
!336 = !DILocation(line: 133, column: 22, scope: !167)
!337 = !DILocation(line: 133, column: 5, scope: !167)
!338 = !DILocation(line: 134, column: 10, scope: !167)
!339 = !DILocation(line: 134, column: 5, scope: !167)
!340 = !DILocation(line: 135, column: 12, scope: !167)
!341 = !DILocation(line: 135, column: 5, scope: !167)
!342 = distinct !DISubprogram(name: "mayo_keypair", scope: !88, file: !88, line: 298, type: !343, scopeLine: 298, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !79, retainedNodes: !91)
!343 = !DISubroutineType(types: !344)
!344 = !{!51, !345, !55, !55}
!345 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !346, size: 32)
!346 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !347)
!347 = !DIDerivedType(tag: DW_TAG_typedef, name: "mayo_params_t", file: !112, line: 289, baseType: !348)
!348 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !112, line: 265, size: 736, elements: !349)
!349 = !{!350, !351, !352, !353, !354, !355, !356, !357, !358, !359, !360, !361, !362, !363, !364, !365, !366, !367, !368, !369, !370, !371, !372}
!350 = !DIDerivedType(tag: DW_TAG_member, name: "m", scope: !348, file: !112, line: 266, baseType: !51, size: 32)
!351 = !DIDerivedType(tag: DW_TAG_member, name: "n", scope: !348, file: !112, line: 267, baseType: !51, size: 32, offset: 32)
!352 = !DIDerivedType(tag: DW_TAG_member, name: "o", scope: !348, file: !112, line: 268, baseType: !51, size: 32, offset: 64)
!353 = !DIDerivedType(tag: DW_TAG_member, name: "k", scope: !348, file: !112, line: 269, baseType: !51, size: 32, offset: 96)
!354 = !DIDerivedType(tag: DW_TAG_member, name: "q", scope: !348, file: !112, line: 270, baseType: !51, size: 32, offset: 128)
!355 = !DIDerivedType(tag: DW_TAG_member, name: "f_tail", scope: !348, file: !112, line: 271, baseType: !60, size: 32, offset: 160)
!356 = !DIDerivedType(tag: DW_TAG_member, name: "m_bytes", scope: !348, file: !112, line: 272, baseType: !51, size: 32, offset: 192)
!357 = !DIDerivedType(tag: DW_TAG_member, name: "O_bytes", scope: !348, file: !112, line: 273, baseType: !51, size: 32, offset: 224)
!358 = !DIDerivedType(tag: DW_TAG_member, name: "v_bytes", scope: !348, file: !112, line: 274, baseType: !51, size: 32, offset: 256)
!359 = !DIDerivedType(tag: DW_TAG_member, name: "r_bytes", scope: !348, file: !112, line: 275, baseType: !51, size: 32, offset: 288)
!360 = !DIDerivedType(tag: DW_TAG_member, name: "R_bytes", scope: !348, file: !112, line: 276, baseType: !51, size: 32, offset: 320)
!361 = !DIDerivedType(tag: DW_TAG_member, name: "P1_bytes", scope: !348, file: !112, line: 277, baseType: !51, size: 32, offset: 352)
!362 = !DIDerivedType(tag: DW_TAG_member, name: "P2_bytes", scope: !348, file: !112, line: 278, baseType: !51, size: 32, offset: 384)
!363 = !DIDerivedType(tag: DW_TAG_member, name: "P3_bytes", scope: !348, file: !112, line: 279, baseType: !51, size: 32, offset: 416)
!364 = !DIDerivedType(tag: DW_TAG_member, name: "csk_bytes", scope: !348, file: !112, line: 280, baseType: !51, size: 32, offset: 448)
!365 = !DIDerivedType(tag: DW_TAG_member, name: "cpk_bytes", scope: !348, file: !112, line: 281, baseType: !51, size: 32, offset: 480)
!366 = !DIDerivedType(tag: DW_TAG_member, name: "sig_bytes", scope: !348, file: !112, line: 282, baseType: !51, size: 32, offset: 512)
!367 = !DIDerivedType(tag: DW_TAG_member, name: "salt_bytes", scope: !348, file: !112, line: 283, baseType: !51, size: 32, offset: 544)
!368 = !DIDerivedType(tag: DW_TAG_member, name: "sk_seed_bytes", scope: !348, file: !112, line: 284, baseType: !51, size: 32, offset: 576)
!369 = !DIDerivedType(tag: DW_TAG_member, name: "digest_bytes", scope: !348, file: !112, line: 285, baseType: !51, size: 32, offset: 608)
!370 = !DIDerivedType(tag: DW_TAG_member, name: "pk_seed_bytes", scope: !348, file: !112, line: 286, baseType: !51, size: 32, offset: 640)
!371 = !DIDerivedType(tag: DW_TAG_member, name: "m_vec_limbs", scope: !348, file: !112, line: 287, baseType: !51, size: 32, offset: 672)
!372 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !348, file: !112, line: 288, baseType: !138, size: 32, offset: 704)
!373 = !DILocalVariable(name: "p", arg: 1, scope: !342, file: !88, line: 298, type: !345)
!374 = !DILocation(line: 298, column: 39, scope: !342)
!375 = !DILocalVariable(name: "pk", arg: 2, scope: !342, file: !88, line: 298, type: !55)
!376 = !DILocation(line: 298, column: 57, scope: !342)
!377 = !DILocalVariable(name: "sk", arg: 3, scope: !342, file: !88, line: 298, type: !55)
!378 = !DILocation(line: 298, column: 76, scope: !342)
!379 = !DILocalVariable(name: "ret", scope: !342, file: !88, line: 299, type: !51)
!380 = !DILocation(line: 299, column: 9, scope: !342)
!381 = !DILocation(line: 301, column: 32, scope: !342)
!382 = !DILocation(line: 301, column: 35, scope: !342)
!383 = !DILocation(line: 301, column: 39, scope: !342)
!384 = !DILocation(line: 301, column: 11, scope: !342)
!385 = !DILocation(line: 301, column: 9, scope: !342)
!386 = !DILocation(line: 302, column: 9, scope: !387)
!387 = distinct !DILexicalBlock(scope: !342, file: !88, line: 302, column: 9)
!388 = !DILocation(line: 302, column: 13, scope: !387)
!389 = !DILocation(line: 303, column: 9, scope: !390)
!390 = distinct !DILexicalBlock(scope: !387, file: !88, line: 302, column: 25)
!391 = !DILocation(line: 302, column: 16, scope: !387)
!392 = !DILabel(scope: !342, name: "err", file: !88, line: 306)
!393 = !DILocation(line: 306, column: 1, scope: !342)
!394 = !DILocation(line: 307, column: 12, scope: !342)
!395 = !DILocation(line: 307, column: 5, scope: !342)
!396 = distinct !DISubprogram(name: "mayo_keypair_compact", scope: !88, file: !88, line: 538, type: !343, scopeLine: 539, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !79, retainedNodes: !91)
!397 = !DILocalVariable(name: "p", arg: 1, scope: !396, file: !88, line: 538, type: !345)
!398 = !DILocation(line: 538, column: 47, scope: !396)
!399 = !DILocalVariable(name: "cpk", arg: 2, scope: !396, file: !88, line: 538, type: !55)
!400 = !DILocation(line: 538, column: 65, scope: !396)
!401 = !DILocalVariable(name: "csk", arg: 3, scope: !396, file: !88, line: 539, type: !55)
!402 = !DILocation(line: 539, column: 41, scope: !396)
!403 = !DILocalVariable(name: "ret", scope: !396, file: !88, line: 540, type: !51)
!404 = !DILocation(line: 540, column: 9, scope: !396)
!405 = !DILocalVariable(name: "seed_sk", scope: !396, file: !88, line: 541, type: !55)
!406 = !DILocation(line: 541, column: 20, scope: !396)
!407 = !DILocation(line: 541, column: 30, scope: !396)
!408 = !DILocalVariable(name: "S", scope: !396, file: !88, line: 542, type: !409)
!409 = !DICompositeType(tag: DW_TAG_array_type, baseType: !56, size: 6944, elements: !410)
!410 = !{!411}
!411 = !DISubrange(count: 868)
!412 = !DILocation(line: 542, column: 19, scope: !396)
!413 = !DILocalVariable(name: "P", scope: !396, file: !88, line: 543, type: !196)
!414 = !DILocation(line: 543, column: 14, scope: !396)
!415 = !DILocalVariable(name: "P3", scope: !396, file: !88, line: 544, type: !416)
!416 = !DICompositeType(tag: DW_TAG_array_type, baseType: !46, size: 166464, elements: !417)
!417 = !{!418}
!418 = !DISubrange(count: 2601)
!419 = !DILocation(line: 544, column: 14, scope: !396)
!420 = !DILocalVariable(name: "seed_pk", scope: !396, file: !88, line: 546, type: !55)
!421 = !DILocation(line: 546, column: 20, scope: !396)
!422 = !DILocalVariable(name: "O", scope: !396, file: !88, line: 547, type: !423)
!423 = !DICompositeType(tag: DW_TAG_array_type, baseType: !56, size: 19312, elements: !203)
!424 = !DILocation(line: 547, column: 19, scope: !396)
!425 = !DILocalVariable(name: "m_vec_limbs", scope: !396, file: !88, line: 549, type: !426)
!426 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !51)
!427 = !DILocation(line: 549, column: 15, scope: !396)
!428 = !DILocation(line: 549, column: 29, scope: !396)
!429 = !DILocalVariable(name: "param_m", scope: !396, file: !88, line: 550, type: !426)
!430 = !DILocation(line: 550, column: 15, scope: !396)
!431 = !DILocation(line: 550, column: 25, scope: !396)
!432 = !DILocalVariable(name: "param_v", scope: !396, file: !88, line: 551, type: !426)
!433 = !DILocation(line: 551, column: 15, scope: !396)
!434 = !DILocation(line: 551, column: 25, scope: !396)
!435 = !DILocalVariable(name: "param_o", scope: !396, file: !88, line: 552, type: !426)
!436 = !DILocation(line: 552, column: 15, scope: !396)
!437 = !DILocation(line: 552, column: 25, scope: !396)
!438 = !DILocalVariable(name: "param_O_bytes", scope: !396, file: !88, line: 553, type: !426)
!439 = !DILocation(line: 553, column: 15, scope: !396)
!440 = !DILocation(line: 553, column: 31, scope: !396)
!441 = !DILocalVariable(name: "param_P1_limbs", scope: !396, file: !88, line: 554, type: !426)
!442 = !DILocation(line: 554, column: 15, scope: !396)
!443 = !DILocation(line: 554, column: 32, scope: !396)
!444 = !DILocalVariable(name: "param_P3_limbs", scope: !396, file: !88, line: 555, type: !426)
!445 = !DILocation(line: 555, column: 15, scope: !396)
!446 = !DILocation(line: 555, column: 32, scope: !396)
!447 = !DILocalVariable(name: "param_pk_seed_bytes", scope: !396, file: !88, line: 556, type: !426)
!448 = !DILocation(line: 556, column: 15, scope: !396)
!449 = !DILocation(line: 556, column: 37, scope: !396)
!450 = !DILocalVariable(name: "param_sk_seed_bytes", scope: !396, file: !88, line: 557, type: !426)
!451 = !DILocation(line: 557, column: 15, scope: !396)
!452 = !DILocation(line: 557, column: 37, scope: !396)
!453 = !DILocalVariable(name: "P1", scope: !396, file: !88, line: 559, type: !81)
!454 = !DILocation(line: 559, column: 15, scope: !396)
!455 = !DILocation(line: 559, column: 20, scope: !396)
!456 = !DILocalVariable(name: "P2", scope: !396, file: !88, line: 560, type: !81)
!457 = !DILocation(line: 560, column: 15, scope: !396)
!458 = !DILocation(line: 560, column: 20, scope: !396)
!459 = !DILocation(line: 560, column: 24, scope: !396)
!460 = !DILocation(line: 560, column: 22, scope: !396)
!461 = !DILocation(line: 566, column: 21, scope: !462)
!462 = distinct !DILexicalBlock(scope: !396, file: !88, line: 566, column: 9)
!463 = !DILocation(line: 566, column: 30, scope: !462)
!464 = !DILocation(line: 566, column: 9, scope: !462)
!465 = !DILocation(line: 566, column: 51, scope: !462)
!466 = !DILocation(line: 567, column: 13, scope: !467)
!467 = distinct !DILexicalBlock(scope: !462, file: !88, line: 566, column: 63)
!468 = !DILocation(line: 568, column: 9, scope: !467)
!469 = !DILocation(line: 573, column: 14, scope: !396)
!470 = !DILocation(line: 573, column: 17, scope: !396)
!471 = !DILocation(line: 573, column: 39, scope: !396)
!472 = !DILocation(line: 573, column: 37, scope: !396)
!473 = !DILocation(line: 573, column: 54, scope: !396)
!474 = !DILocation(line: 574, column: 14, scope: !396)
!475 = !DILocation(line: 573, column: 5, scope: !396)
!476 = !DILocation(line: 576, column: 15, scope: !396)
!477 = !DILocation(line: 576, column: 13, scope: !396)
!478 = !DILocation(line: 579, column: 12, scope: !396)
!479 = !DILocation(line: 579, column: 16, scope: !396)
!480 = !DILocation(line: 579, column: 14, scope: !396)
!481 = !DILocation(line: 579, column: 37, scope: !396)
!482 = !DILocation(line: 579, column: 40, scope: !396)
!483 = !DILocation(line: 579, column: 50, scope: !396)
!484 = !DILocation(line: 579, column: 48, scope: !396)
!485 = !DILocation(line: 579, column: 5, scope: !396)
!486 = !DILocation(line: 585, column: 18, scope: !396)
!487 = !DILocation(line: 585, column: 21, scope: !396)
!488 = !DILocation(line: 585, column: 24, scope: !396)
!489 = !DILocation(line: 585, column: 5, scope: !396)
!490 = !DILocation(line: 588, column: 16, scope: !396)
!491 = !DILocation(line: 588, column: 19, scope: !396)
!492 = !DILocation(line: 588, column: 23, scope: !396)
!493 = !DILocation(line: 588, column: 27, scope: !396)
!494 = !DILocation(line: 588, column: 30, scope: !396)
!495 = !DILocation(line: 588, column: 5, scope: !396)
!496 = !DILocation(line: 591, column: 12, scope: !396)
!497 = !DILocation(line: 591, column: 17, scope: !396)
!498 = !DILocation(line: 591, column: 26, scope: !396)
!499 = !DILocation(line: 591, column: 5, scope: !396)
!500 = !DILocalVariable(name: "P3_upper", scope: !396, file: !88, line: 593, type: !501)
!501 = !DICompositeType(tag: DW_TAG_array_type, baseType: !46, size: 88128, elements: !502)
!502 = !{!503}
!503 = !DISubrange(count: 1377)
!504 = !DILocation(line: 593, column: 14, scope: !396)
!505 = !DILocation(line: 596, column: 13, scope: !396)
!506 = !DILocation(line: 596, column: 16, scope: !396)
!507 = !DILocation(line: 596, column: 20, scope: !396)
!508 = !DILocation(line: 596, column: 30, scope: !396)
!509 = !DILocation(line: 596, column: 5, scope: !396)
!510 = !DILocation(line: 597, column: 17, scope: !396)
!511 = !DILocation(line: 597, column: 27, scope: !396)
!512 = !DILocation(line: 597, column: 33, scope: !396)
!513 = !DILocation(line: 597, column: 31, scope: !396)
!514 = !DILocation(line: 597, column: 54, scope: !396)
!515 = !DILocation(line: 597, column: 69, scope: !396)
!516 = !DILocation(line: 597, column: 68, scope: !396)
!517 = !DILocation(line: 597, column: 82, scope: !396)
!518 = !DILocation(line: 597, column: 5, scope: !396)
!519 = !DILabel(scope: !396, name: "err", file: !88, line: 600)
!520 = !DILocation(line: 600, column: 5, scope: !396)
!521 = !DILocation(line: 602, column: 23, scope: !396)
!522 = !DILocation(line: 602, column: 5, scope: !396)
!523 = !DILocation(line: 603, column: 23, scope: !396)
!524 = !DILocation(line: 603, column: 27, scope: !396)
!525 = !DILocation(line: 603, column: 44, scope: !396)
!526 = !DILocation(line: 603, column: 5, scope: !396)
!527 = !DILocation(line: 604, column: 23, scope: !396)
!528 = !DILocation(line: 604, column: 5, scope: !396)
!529 = !DILocation(line: 605, column: 12, scope: !396)
!530 = !DILocation(line: 605, column: 5, scope: !396)
!531 = distinct !DISubprogram(name: "decode", scope: !88, file: !88, line: 20, type: !532, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !91)
!532 = !DISubroutineType(types: !533)
!533 = !{null, !60, !55, !51}
!534 = !DILocalVariable(name: "m", arg: 1, scope: !531, file: !88, line: 20, type: !60)
!535 = !DILocation(line: 20, column: 41, scope: !531)
!536 = !DILocalVariable(name: "mdec", arg: 2, scope: !531, file: !88, line: 20, type: !55)
!537 = !DILocation(line: 20, column: 59, scope: !531)
!538 = !DILocalVariable(name: "mdeclen", arg: 3, scope: !531, file: !88, line: 20, type: !51)
!539 = !DILocation(line: 20, column: 69, scope: !531)
!540 = !DILocalVariable(name: "i", scope: !531, file: !88, line: 21, type: !51)
!541 = !DILocation(line: 21, column: 9, scope: !531)
!542 = !DILocation(line: 22, column: 12, scope: !543)
!543 = distinct !DILexicalBlock(scope: !531, file: !88, line: 22, column: 5)
!544 = !DILocation(line: 22, column: 10, scope: !543)
!545 = !DILocation(line: 22, column: 17, scope: !546)
!546 = distinct !DILexicalBlock(scope: !543, file: !88, line: 22, column: 5)
!547 = !DILocation(line: 22, column: 21, scope: !546)
!548 = !DILocation(line: 22, column: 29, scope: !546)
!549 = !DILocation(line: 22, column: 19, scope: !546)
!550 = !DILocation(line: 22, column: 5, scope: !543)
!551 = !DILocation(line: 23, column: 19, scope: !552)
!552 = distinct !DILexicalBlock(scope: !546, file: !88, line: 22, column: 39)
!553 = !DILocation(line: 23, column: 21, scope: !552)
!554 = !DILocation(line: 23, column: 24, scope: !552)
!555 = !DILocation(line: 23, column: 14, scope: !552)
!556 = !DILocation(line: 23, column: 17, scope: !552)
!557 = !DILocation(line: 24, column: 19, scope: !552)
!558 = !DILocation(line: 24, column: 21, scope: !552)
!559 = !DILocation(line: 24, column: 24, scope: !552)
!560 = !DILocation(line: 24, column: 14, scope: !552)
!561 = !DILocation(line: 24, column: 17, scope: !552)
!562 = !DILocation(line: 25, column: 5, scope: !552)
!563 = !DILocation(line: 22, column: 34, scope: !546)
!564 = !DILocation(line: 22, column: 5, scope: !546)
!565 = distinct !{!565, !550, !566, !165}
!566 = !DILocation(line: 25, column: 5, scope: !543)
!567 = !DILocation(line: 27, column: 9, scope: !568)
!568 = distinct !DILexicalBlock(scope: !531, file: !88, line: 27, column: 9)
!569 = !DILocation(line: 27, column: 17, scope: !568)
!570 = !DILocation(line: 27, column: 21, scope: !568)
!571 = !DILocation(line: 28, column: 19, scope: !572)
!572 = distinct !DILexicalBlock(scope: !568, file: !88, line: 27, column: 27)
!573 = !DILocation(line: 28, column: 21, scope: !572)
!574 = !DILocation(line: 28, column: 24, scope: !572)
!575 = !DILocation(line: 28, column: 14, scope: !572)
!576 = !DILocation(line: 28, column: 17, scope: !572)
!577 = !DILocation(line: 29, column: 5, scope: !572)
!578 = !DILocation(line: 30, column: 1, scope: !531)
!579 = distinct !DISubprogram(name: "expand_P1_P2", scope: !88, file: !88, line: 280, type: !580, scopeLine: 280, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !91)
!580 = !DISubroutineType(types: !581)
!581 = !{null, !345, !81, !60}
!582 = !DILocalVariable(name: "p", arg: 1, scope: !579, file: !88, line: 280, type: !345)
!583 = !DILocation(line: 280, column: 47, scope: !579)
!584 = !DILocalVariable(name: "P", arg: 2, scope: !579, file: !88, line: 280, type: !81)
!585 = !DILocation(line: 280, column: 60, scope: !579)
!586 = !DILocalVariable(name: "seed_pk", arg: 3, scope: !579, file: !88, line: 280, type: !60)
!587 = !DILocation(line: 280, column: 84, scope: !579)
!588 = !DILocation(line: 284, column: 29, scope: !579)
!589 = !DILocation(line: 284, column: 32, scope: !579)
!590 = !DILocation(line: 284, column: 52, scope: !579)
!591 = !DILocation(line: 284, column: 50, scope: !579)
!592 = !DILocation(line: 284, column: 71, scope: !579)
!593 = !DILocation(line: 284, column: 80, scope: !579)
!594 = !DILocation(line: 284, column: 5, scope: !579)
!595 = !DILocation(line: 285, column: 36, scope: !579)
!596 = !DILocation(line: 285, column: 39, scope: !579)
!597 = !DILocation(line: 285, column: 43, scope: !579)
!598 = !DILocation(line: 285, column: 63, scope: !579)
!599 = !DILocation(line: 285, column: 61, scope: !579)
!600 = !DILocation(line: 285, column: 82, scope: !579)
!601 = !DILocation(line: 285, column: 81, scope: !579)
!602 = !DILocation(line: 285, column: 104, scope: !579)
!603 = !DILocation(line: 285, column: 5, scope: !579)
!604 = !DILocation(line: 286, column: 1, scope: !579)
!605 = distinct !DISubprogram(name: "compute_P3", scope: !606, file: !606, line: 260, type: !607, scopeLine: 260, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !91)
!606 = !DIFile(filename: "../../../src/generic/generic_arithmetic.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!607 = !DISubroutineType(types: !608)
!608 = !{null, !345, !609, !81, !60, !81}
!609 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !92, size: 32)
!610 = !DILocalVariable(name: "p", arg: 1, scope: !605, file: !606, line: 260, type: !345)
!611 = !DILocation(line: 260, column: 38, scope: !605)
!612 = !DILocalVariable(name: "P1", arg: 2, scope: !605, file: !606, line: 260, type: !609)
!613 = !DILocation(line: 260, column: 57, scope: !605)
!614 = !DILocalVariable(name: "P2", arg: 3, scope: !605, file: !606, line: 260, type: !81)
!615 = !DILocation(line: 260, column: 71, scope: !605)
!616 = !DILocalVariable(name: "O", arg: 4, scope: !605, file: !606, line: 260, type: !60)
!617 = !DILocation(line: 260, column: 96, scope: !605)
!618 = !DILocalVariable(name: "P3", arg: 5, scope: !605, file: !606, line: 260, type: !81)
!619 = !DILocation(line: 260, column: 109, scope: !605)
!620 = !DILocalVariable(name: "m_vec_limbs", scope: !605, file: !606, line: 262, type: !426)
!621 = !DILocation(line: 262, column: 15, scope: !605)
!622 = !DILocation(line: 262, column: 29, scope: !605)
!623 = !DILocalVariable(name: "param_v", scope: !605, file: !606, line: 263, type: !426)
!624 = !DILocation(line: 263, column: 15, scope: !605)
!625 = !DILocation(line: 263, column: 25, scope: !605)
!626 = !DILocalVariable(name: "param_o", scope: !605, file: !606, line: 264, type: !426)
!627 = !DILocation(line: 264, column: 15, scope: !605)
!628 = !DILocation(line: 264, column: 25, scope: !605)
!629 = !DILocation(line: 267, column: 16, scope: !605)
!630 = !DILocation(line: 267, column: 19, scope: !605)
!631 = !DILocation(line: 267, column: 23, scope: !605)
!632 = !DILocation(line: 267, column: 26, scope: !605)
!633 = !DILocation(line: 267, column: 5, scope: !605)
!634 = !DILocation(line: 270, column: 31, scope: !605)
!635 = !DILocation(line: 270, column: 44, scope: !605)
!636 = !DILocation(line: 270, column: 47, scope: !605)
!637 = !DILocation(line: 270, column: 51, scope: !605)
!638 = !DILocation(line: 270, column: 55, scope: !605)
!639 = !DILocation(line: 270, column: 64, scope: !605)
!640 = !DILocation(line: 270, column: 73, scope: !605)
!641 = !DILocation(line: 270, column: 5, scope: !605)
!642 = !DILocation(line: 271, column: 1, scope: !605)
!643 = distinct !DISubprogram(name: "pack_m_vecs", scope: !88, file: !88, line: 272, type: !644, scopeLine: 272, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !91)
!644 = !DISubroutineType(types: !645)
!645 = !{null, !609, !55, !51, !51}
!646 = !DILocalVariable(name: "in", arg: 1, scope: !643, file: !88, line: 272, type: !609)
!647 = !DILocation(line: 272, column: 41, scope: !643)
!648 = !DILocalVariable(name: "out", arg: 2, scope: !643, file: !88, line: 272, type: !55)
!649 = !DILocation(line: 272, column: 60, scope: !643)
!650 = !DILocalVariable(name: "vecs", arg: 3, scope: !643, file: !88, line: 272, type: !51)
!651 = !DILocation(line: 272, column: 69, scope: !643)
!652 = !DILocalVariable(name: "m", arg: 4, scope: !643, file: !88, line: 272, type: !51)
!653 = !DILocation(line: 272, column: 79, scope: !643)
!654 = !DILocalVariable(name: "m_vec_limbs", scope: !643, file: !88, line: 273, type: !426)
!655 = !DILocation(line: 273, column: 15, scope: !643)
!656 = !DILocation(line: 273, column: 30, scope: !643)
!657 = !DILocation(line: 273, column: 32, scope: !643)
!658 = !DILocation(line: 273, column: 38, scope: !643)
!659 = !DILocalVariable(name: "_in", scope: !643, file: !88, line: 274, type: !55)
!660 = !DILocation(line: 274, column: 20, scope: !643)
!661 = !DILocation(line: 274, column: 44, scope: !643)
!662 = !DILocalVariable(name: "i", scope: !663, file: !88, line: 275, type: !51)
!663 = distinct !DILexicalBlock(scope: !643, file: !88, line: 275, column: 5)
!664 = !DILocation(line: 275, column: 14, scope: !663)
!665 = !DILocation(line: 275, column: 10, scope: !663)
!666 = !DILocation(line: 275, column: 21, scope: !667)
!667 = distinct !DILexicalBlock(scope: !663, file: !88, line: 275, column: 5)
!668 = !DILocation(line: 275, column: 25, scope: !667)
!669 = !DILocation(line: 275, column: 23, scope: !667)
!670 = !DILocation(line: 275, column: 5, scope: !663)
!671 = !DILocation(line: 277, column: 17, scope: !672)
!672 = distinct !DILexicalBlock(scope: !667, file: !88, line: 276, column: 5)
!673 = !DILocation(line: 277, column: 24, scope: !672)
!674 = !DILocation(line: 277, column: 26, scope: !672)
!675 = !DILocation(line: 277, column: 25, scope: !672)
!676 = !DILocation(line: 277, column: 27, scope: !672)
!677 = !DILocation(line: 277, column: 21, scope: !672)
!678 = !DILocation(line: 277, column: 32, scope: !672)
!679 = !DILocation(line: 277, column: 38, scope: !672)
!680 = !DILocation(line: 277, column: 40, scope: !672)
!681 = !DILocation(line: 277, column: 39, scope: !672)
!682 = !DILocation(line: 277, column: 51, scope: !672)
!683 = !DILocation(line: 277, column: 36, scope: !672)
!684 = !DILocation(line: 277, column: 70, scope: !672)
!685 = !DILocation(line: 277, column: 71, scope: !672)
!686 = !DILocation(line: 277, column: 9, scope: !672)
!687 = !DILocation(line: 278, column: 5, scope: !672)
!688 = !DILocation(line: 275, column: 32, scope: !667)
!689 = !DILocation(line: 275, column: 5, scope: !667)
!690 = distinct !{!690, !670, !691, !165}
!691 = !DILocation(line: 278, column: 5, scope: !663)
!692 = !DILocation(line: 279, column: 1, scope: !643)
!693 = distinct !DISubprogram(name: "P1_times_O", scope: !606, file: !606, line: 74, type: !694, scopeLine: 74, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !91)
!694 = !DISubroutineType(types: !695)
!695 = !{null, !345, !609, !60, !81}
!696 = !DILocalVariable(name: "p", arg: 1, scope: !693, file: !606, line: 74, type: !345)
!697 = !DILocation(line: 74, column: 38, scope: !693)
!698 = !DILocalVariable(name: "P1", arg: 2, scope: !693, file: !606, line: 74, type: !609)
!699 = !DILocation(line: 74, column: 57, scope: !693)
!700 = !DILocalVariable(name: "O", arg: 3, scope: !693, file: !606, line: 74, type: !60)
!701 = !DILocation(line: 74, column: 82, scope: !693)
!702 = !DILocalVariable(name: "acc", arg: 4, scope: !693, file: !606, line: 74, type: !81)
!703 = !DILocation(line: 74, column: 95, scope: !693)
!704 = !DILocation(line: 78, column: 42, scope: !693)
!705 = !DILocation(line: 78, column: 64, scope: !693)
!706 = !DILocation(line: 78, column: 68, scope: !693)
!707 = !DILocation(line: 78, column: 71, scope: !693)
!708 = !DILocation(line: 78, column: 76, scope: !693)
!709 = !DILocation(line: 78, column: 88, scope: !693)
!710 = !DILocation(line: 78, column: 100, scope: !693)
!711 = !DILocation(line: 78, column: 5, scope: !693)
!712 = !DILocation(line: 79, column: 1, scope: !693)
!713 = distinct !DISubprogram(name: "mul_add_mat_trans_x_m_mat", scope: !606, file: !606, line: 47, type: !714, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !91)
!714 = !DISubroutineType(types: !715)
!715 = !{null, !426, !60, !609, !81, !426, !426, !426}
!716 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !713, file: !606, line: 47, type: !426)
!717 = !DILocation(line: 47, column: 42, scope: !713)
!718 = !DILocalVariable(name: "mat", arg: 2, scope: !713, file: !606, line: 47, type: !60)
!719 = !DILocation(line: 47, column: 76, scope: !713)
!720 = !DILocalVariable(name: "bs_mat", arg: 3, scope: !713, file: !606, line: 47, type: !609)
!721 = !DILocation(line: 47, column: 97, scope: !713)
!722 = !DILocalVariable(name: "acc", arg: 4, scope: !713, file: !606, line: 47, type: !81)
!723 = !DILocation(line: 47, column: 115, scope: !713)
!724 = !DILocalVariable(name: "mat_rows", arg: 5, scope: !713, file: !606, line: 48, type: !426)
!725 = !DILocation(line: 48, column: 42, scope: !713)
!726 = !DILocalVariable(name: "mat_cols", arg: 6, scope: !713, file: !606, line: 48, type: !426)
!727 = !DILocation(line: 48, column: 62, scope: !713)
!728 = !DILocalVariable(name: "bs_mat_cols", arg: 7, scope: !713, file: !606, line: 48, type: !426)
!729 = !DILocation(line: 48, column: 82, scope: !713)
!730 = !DILocalVariable(name: "r", scope: !731, file: !606, line: 50, type: !51)
!731 = distinct !DILexicalBlock(scope: !713, file: !606, line: 50, column: 5)
!732 = !DILocation(line: 50, column: 14, scope: !731)
!733 = !DILocation(line: 50, column: 10, scope: !731)
!734 = !DILocation(line: 50, column: 21, scope: !735)
!735 = distinct !DILexicalBlock(scope: !731, file: !606, line: 50, column: 5)
!736 = !DILocation(line: 50, column: 25, scope: !735)
!737 = !DILocation(line: 50, column: 23, scope: !735)
!738 = !DILocation(line: 50, column: 5, scope: !731)
!739 = !DILocalVariable(name: "c", scope: !740, file: !606, line: 51, type: !51)
!740 = distinct !DILexicalBlock(scope: !741, file: !606, line: 51, column: 9)
!741 = distinct !DILexicalBlock(scope: !735, file: !606, line: 50, column: 40)
!742 = !DILocation(line: 51, column: 18, scope: !740)
!743 = !DILocation(line: 51, column: 14, scope: !740)
!744 = !DILocation(line: 51, column: 25, scope: !745)
!745 = distinct !DILexicalBlock(scope: !740, file: !606, line: 51, column: 9)
!746 = !DILocation(line: 51, column: 29, scope: !745)
!747 = !DILocation(line: 51, column: 27, scope: !745)
!748 = !DILocation(line: 51, column: 9, scope: !740)
!749 = !DILocalVariable(name: "k", scope: !750, file: !606, line: 52, type: !51)
!750 = distinct !DILexicalBlock(scope: !751, file: !606, line: 52, column: 13)
!751 = distinct !DILexicalBlock(scope: !745, file: !606, line: 51, column: 44)
!752 = !DILocation(line: 52, column: 22, scope: !750)
!753 = !DILocation(line: 52, column: 18, scope: !750)
!754 = !DILocation(line: 52, column: 29, scope: !755)
!755 = distinct !DILexicalBlock(scope: !750, file: !606, line: 52, column: 13)
!756 = !DILocation(line: 52, column: 33, scope: !755)
!757 = !DILocation(line: 52, column: 31, scope: !755)
!758 = !DILocation(line: 52, column: 13, scope: !750)
!759 = !DILocation(line: 53, column: 31, scope: !760)
!760 = distinct !DILexicalBlock(scope: !755, file: !606, line: 52, column: 54)
!761 = !DILocation(line: 53, column: 44, scope: !760)
!762 = !DILocation(line: 53, column: 53, scope: !760)
!763 = !DILocation(line: 53, column: 68, scope: !760)
!764 = !DILocation(line: 53, column: 72, scope: !760)
!765 = !DILocation(line: 53, column: 70, scope: !760)
!766 = !DILocation(line: 53, column: 86, scope: !760)
!767 = !DILocation(line: 53, column: 84, scope: !760)
!768 = !DILocation(line: 53, column: 65, scope: !760)
!769 = !DILocation(line: 53, column: 51, scope: !760)
!770 = !DILocation(line: 53, column: 90, scope: !760)
!771 = !DILocation(line: 53, column: 94, scope: !760)
!772 = !DILocation(line: 53, column: 98, scope: !760)
!773 = !DILocation(line: 53, column: 96, scope: !760)
!774 = !DILocation(line: 53, column: 109, scope: !760)
!775 = !DILocation(line: 53, column: 107, scope: !760)
!776 = !DILocation(line: 53, column: 113, scope: !760)
!777 = !DILocation(line: 53, column: 119, scope: !760)
!778 = !DILocation(line: 53, column: 134, scope: !760)
!779 = !DILocation(line: 53, column: 138, scope: !760)
!780 = !DILocation(line: 53, column: 136, scope: !760)
!781 = !DILocation(line: 53, column: 152, scope: !760)
!782 = !DILocation(line: 53, column: 150, scope: !760)
!783 = !DILocation(line: 53, column: 131, scope: !760)
!784 = !DILocation(line: 53, column: 117, scope: !760)
!785 = !DILocation(line: 53, column: 17, scope: !760)
!786 = !DILocation(line: 54, column: 13, scope: !760)
!787 = !DILocation(line: 52, column: 48, scope: !755)
!788 = !DILocation(line: 52, column: 13, scope: !755)
!789 = distinct !{!789, !758, !790, !165}
!790 = !DILocation(line: 54, column: 13, scope: !750)
!791 = !DILocation(line: 55, column: 9, scope: !751)
!792 = !DILocation(line: 51, column: 40, scope: !745)
!793 = !DILocation(line: 51, column: 9, scope: !745)
!794 = distinct !{!794, !748, !795, !165}
!795 = !DILocation(line: 55, column: 9, scope: !740)
!796 = !DILocation(line: 56, column: 5, scope: !741)
!797 = !DILocation(line: 50, column: 36, scope: !735)
!798 = !DILocation(line: 50, column: 5, scope: !735)
!799 = distinct !{!799, !738, !800, !165}
!800 = !DILocation(line: 56, column: 5, scope: !731)
!801 = !DILocation(line: 57, column: 1, scope: !713)
!802 = distinct !DISubprogram(name: "m_vec_mul_add", scope: !803, file: !803, line: 24, type: !804, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !91)
!803 = !DIFile(filename: "../../../src/generic/arithmetic_dynamic.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!804 = !DISubroutineType(types: !805)
!805 = !{null, !51, !609, !56, !81}
!806 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !802, file: !803, line: 24, type: !51)
!807 = !DILocation(line: 24, column: 24, scope: !802)
!808 = !DILocalVariable(name: "in", arg: 2, scope: !802, file: !803, line: 24, type: !609)
!809 = !DILocation(line: 24, column: 53, scope: !802)
!810 = !DILocalVariable(name: "a", arg: 3, scope: !802, file: !803, line: 24, type: !56)
!811 = !DILocation(line: 24, column: 71, scope: !802)
!812 = !DILocalVariable(name: "acc", arg: 4, scope: !802, file: !803, line: 24, type: !81)
!813 = !DILocation(line: 24, column: 84, scope: !802)
!814 = !DILocalVariable(name: "i", scope: !815, file: !803, line: 25, type: !51)
!815 = distinct !DILexicalBlock(scope: !802, file: !803, line: 25, column: 5)
!816 = !DILocation(line: 25, column: 13, scope: !815)
!817 = !DILocation(line: 25, column: 9, scope: !815)
!818 = !DILocation(line: 25, column: 18, scope: !819)
!819 = distinct !DILexicalBlock(scope: !815, file: !803, line: 25, column: 5)
!820 = !DILocation(line: 25, column: 22, scope: !819)
!821 = !DILocation(line: 25, column: 20, scope: !819)
!822 = !DILocation(line: 25, column: 5, scope: !815)
!823 = !DILocation(line: 26, column: 33, scope: !824)
!824 = distinct !DILexicalBlock(scope: !819, file: !803, line: 25, column: 39)
!825 = !DILocation(line: 26, column: 36, scope: !824)
!826 = !DILocation(line: 26, column: 40, scope: !824)
!827 = !DILocation(line: 26, column: 19, scope: !824)
!828 = !DILocation(line: 26, column: 9, scope: !824)
!829 = !DILocation(line: 26, column: 13, scope: !824)
!830 = !DILocation(line: 26, column: 16, scope: !824)
!831 = !DILocation(line: 27, column: 5, scope: !824)
!832 = !DILocation(line: 25, column: 36, scope: !819)
!833 = !DILocation(line: 25, column: 5, scope: !819)
!834 = distinct !{!834, !822, !835, !165}
!835 = !DILocation(line: 27, column: 5, scope: !815)
!836 = !DILocation(line: 28, column: 1, scope: !802)
!837 = distinct !DISubprogram(name: "gf16v_mul_u64", scope: !838, file: !838, line: 96, type: !839, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !91)
!838 = !DIFile(filename: "../../../src/simple_arithmetic.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!839 = !DISubroutineType(types: !840)
!840 = !{!46, !46, !201}
!841 = !DILocalVariable(name: "a", arg: 1, scope: !837, file: !838, line: 96, type: !46)
!842 = !DILocation(line: 96, column: 48, scope: !837)
!843 = !DILocalVariable(name: "b", arg: 2, scope: !837, file: !838, line: 96, type: !201)
!844 = !DILocation(line: 96, column: 59, scope: !837)
!845 = !DILocalVariable(name: "mask_msb", scope: !837, file: !838, line: 97, type: !46)
!846 = !DILocation(line: 97, column: 14, scope: !837)
!847 = !DILocalVariable(name: "a_msb", scope: !837, file: !838, line: 98, type: !46)
!848 = !DILocation(line: 98, column: 14, scope: !837)
!849 = !DILocalVariable(name: "a64", scope: !837, file: !838, line: 99, type: !46)
!850 = !DILocation(line: 99, column: 14, scope: !837)
!851 = !DILocation(line: 99, column: 20, scope: !837)
!852 = !DILocalVariable(name: "b32", scope: !837, file: !838, line: 101, type: !46)
!853 = !DILocation(line: 101, column: 14, scope: !837)
!854 = !DILocation(line: 101, column: 20, scope: !837)
!855 = !DILocation(line: 101, column: 24, scope: !837)
!856 = !DILocation(line: 101, column: 22, scope: !837)
!857 = !DILocalVariable(name: "r64", scope: !837, file: !838, line: 105, type: !46)
!858 = !DILocation(line: 105, column: 14, scope: !837)
!859 = !DILocation(line: 105, column: 20, scope: !837)
!860 = !DILocation(line: 105, column: 27, scope: !837)
!861 = !DILocation(line: 105, column: 31, scope: !837)
!862 = !DILocation(line: 105, column: 24, scope: !837)
!863 = !DILocation(line: 107, column: 13, scope: !837)
!864 = !DILocation(line: 107, column: 19, scope: !837)
!865 = !DILocation(line: 107, column: 17, scope: !837)
!866 = !DILocation(line: 107, column: 11, scope: !837)
!867 = !DILocation(line: 108, column: 12, scope: !837)
!868 = !DILocation(line: 108, column: 9, scope: !837)
!869 = !DILocation(line: 109, column: 12, scope: !837)
!870 = !DILocation(line: 109, column: 16, scope: !837)
!871 = !DILocation(line: 109, column: 26, scope: !837)
!872 = !DILocation(line: 109, column: 32, scope: !837)
!873 = !DILocation(line: 109, column: 38, scope: !837)
!874 = !DILocation(line: 109, column: 22, scope: !837)
!875 = !DILocation(line: 109, column: 9, scope: !837)
!876 = !DILocation(line: 110, column: 13, scope: !837)
!877 = !DILocation(line: 110, column: 22, scope: !837)
!878 = !DILocation(line: 110, column: 26, scope: !837)
!879 = !DILocation(line: 110, column: 32, scope: !837)
!880 = !DILocation(line: 110, column: 18, scope: !837)
!881 = !DILocation(line: 110, column: 9, scope: !837)
!882 = !DILocation(line: 112, column: 13, scope: !837)
!883 = !DILocation(line: 112, column: 19, scope: !837)
!884 = !DILocation(line: 112, column: 17, scope: !837)
!885 = !DILocation(line: 112, column: 11, scope: !837)
!886 = !DILocation(line: 113, column: 12, scope: !837)
!887 = !DILocation(line: 113, column: 9, scope: !837)
!888 = !DILocation(line: 114, column: 12, scope: !837)
!889 = !DILocation(line: 114, column: 16, scope: !837)
!890 = !DILocation(line: 114, column: 26, scope: !837)
!891 = !DILocation(line: 114, column: 32, scope: !837)
!892 = !DILocation(line: 114, column: 38, scope: !837)
!893 = !DILocation(line: 114, column: 22, scope: !837)
!894 = !DILocation(line: 114, column: 9, scope: !837)
!895 = !DILocation(line: 115, column: 13, scope: !837)
!896 = !DILocation(line: 115, column: 22, scope: !837)
!897 = !DILocation(line: 115, column: 26, scope: !837)
!898 = !DILocation(line: 115, column: 32, scope: !837)
!899 = !DILocation(line: 115, column: 18, scope: !837)
!900 = !DILocation(line: 115, column: 9, scope: !837)
!901 = !DILocation(line: 117, column: 13, scope: !837)
!902 = !DILocation(line: 117, column: 19, scope: !837)
!903 = !DILocation(line: 117, column: 17, scope: !837)
!904 = !DILocation(line: 117, column: 11, scope: !837)
!905 = !DILocation(line: 118, column: 12, scope: !837)
!906 = !DILocation(line: 118, column: 9, scope: !837)
!907 = !DILocation(line: 119, column: 12, scope: !837)
!908 = !DILocation(line: 119, column: 16, scope: !837)
!909 = !DILocation(line: 119, column: 26, scope: !837)
!910 = !DILocation(line: 119, column: 32, scope: !837)
!911 = !DILocation(line: 119, column: 38, scope: !837)
!912 = !DILocation(line: 119, column: 22, scope: !837)
!913 = !DILocation(line: 119, column: 9, scope: !837)
!914 = !DILocation(line: 120, column: 13, scope: !837)
!915 = !DILocation(line: 120, column: 22, scope: !837)
!916 = !DILocation(line: 120, column: 26, scope: !837)
!917 = !DILocation(line: 120, column: 32, scope: !837)
!918 = !DILocation(line: 120, column: 18, scope: !837)
!919 = !DILocation(line: 120, column: 9, scope: !837)
!920 = !DILocation(line: 122, column: 12, scope: !837)
!921 = !DILocation(line: 122, column: 5, scope: !837)
!922 = distinct !DISubprogram(name: "mul_add_m_upper_triangular_mat_x_mat", scope: !606, file: !606, line: 16, type: !923, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !91)
!923 = !DISubroutineType(types: !924)
!924 = !{null, !426, !609, !60, !81, !426, !426, !426, !426}
!925 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !922, file: !606, line: 16, type: !426)
!926 = !DILocation(line: 16, column: 53, scope: !922)
!927 = !DILocalVariable(name: "bs_mat", arg: 2, scope: !922, file: !606, line: 16, type: !609)
!928 = !DILocation(line: 16, column: 82, scope: !922)
!929 = !DILocalVariable(name: "mat", arg: 3, scope: !922, file: !606, line: 16, type: !60)
!930 = !DILocation(line: 16, column: 111, scope: !922)
!931 = !DILocalVariable(name: "acc", arg: 4, scope: !922, file: !606, line: 16, type: !81)
!932 = !DILocation(line: 16, column: 126, scope: !922)
!933 = !DILocalVariable(name: "bs_mat_rows", arg: 5, scope: !922, file: !606, line: 17, type: !426)
!934 = !DILocation(line: 17, column: 53, scope: !922)
!935 = !DILocalVariable(name: "bs_mat_cols", arg: 6, scope: !922, file: !606, line: 17, type: !426)
!936 = !DILocation(line: 17, column: 76, scope: !922)
!937 = !DILocalVariable(name: "mat_cols", arg: 7, scope: !922, file: !606, line: 17, type: !426)
!938 = !DILocation(line: 17, column: 99, scope: !922)
!939 = !DILocalVariable(name: "triangular", arg: 8, scope: !922, file: !606, line: 17, type: !426)
!940 = !DILocation(line: 17, column: 119, scope: !922)
!941 = !DILocalVariable(name: "bs_mat_entries_used", scope: !922, file: !606, line: 19, type: !51)
!942 = !DILocation(line: 19, column: 9, scope: !922)
!943 = !DILocalVariable(name: "r", scope: !944, file: !606, line: 20, type: !51)
!944 = distinct !DILexicalBlock(scope: !922, file: !606, line: 20, column: 5)
!945 = !DILocation(line: 20, column: 14, scope: !944)
!946 = !DILocation(line: 20, column: 10, scope: !944)
!947 = !DILocation(line: 20, column: 21, scope: !948)
!948 = distinct !DILexicalBlock(scope: !944, file: !606, line: 20, column: 5)
!949 = !DILocation(line: 20, column: 25, scope: !948)
!950 = !DILocation(line: 20, column: 23, scope: !948)
!951 = !DILocation(line: 20, column: 5, scope: !944)
!952 = !DILocalVariable(name: "c", scope: !953, file: !606, line: 21, type: !51)
!953 = distinct !DILexicalBlock(scope: !954, file: !606, line: 21, column: 9)
!954 = distinct !DILexicalBlock(scope: !948, file: !606, line: 20, column: 43)
!955 = !DILocation(line: 21, column: 18, scope: !953)
!956 = !DILocation(line: 21, column: 22, scope: !953)
!957 = !DILocation(line: 21, column: 35, scope: !953)
!958 = !DILocation(line: 21, column: 33, scope: !953)
!959 = !DILocation(line: 21, column: 14, scope: !953)
!960 = !DILocation(line: 21, column: 38, scope: !961)
!961 = distinct !DILexicalBlock(scope: !953, file: !606, line: 21, column: 9)
!962 = !DILocation(line: 21, column: 42, scope: !961)
!963 = !DILocation(line: 21, column: 40, scope: !961)
!964 = !DILocation(line: 21, column: 9, scope: !953)
!965 = !DILocalVariable(name: "k", scope: !966, file: !606, line: 22, type: !51)
!966 = distinct !DILexicalBlock(scope: !967, file: !606, line: 22, column: 13)
!967 = distinct !DILexicalBlock(scope: !961, file: !606, line: 21, column: 60)
!968 = !DILocation(line: 22, column: 22, scope: !966)
!969 = !DILocation(line: 22, column: 18, scope: !966)
!970 = !DILocation(line: 22, column: 29, scope: !971)
!971 = distinct !DILexicalBlock(scope: !966, file: !606, line: 22, column: 13)
!972 = !DILocation(line: 22, column: 33, scope: !971)
!973 = !DILocation(line: 22, column: 31, scope: !971)
!974 = !DILocation(line: 22, column: 13, scope: !966)
!975 = !DILocation(line: 23, column: 31, scope: !976)
!976 = distinct !DILexicalBlock(scope: !971, file: !606, line: 22, column: 51)
!977 = !DILocation(line: 23, column: 44, scope: !976)
!978 = !DILocation(line: 23, column: 53, scope: !976)
!979 = !DILocation(line: 23, column: 67, scope: !976)
!980 = !DILocation(line: 23, column: 65, scope: !976)
!981 = !DILocation(line: 23, column: 51, scope: !976)
!982 = !DILocation(line: 23, column: 88, scope: !976)
!983 = !DILocation(line: 23, column: 92, scope: !976)
!984 = !DILocation(line: 23, column: 96, scope: !976)
!985 = !DILocation(line: 23, column: 94, scope: !976)
!986 = !DILocation(line: 23, column: 107, scope: !976)
!987 = !DILocation(line: 23, column: 105, scope: !976)
!988 = !DILocation(line: 23, column: 111, scope: !976)
!989 = !DILocation(line: 23, column: 117, scope: !976)
!990 = !DILocation(line: 23, column: 132, scope: !976)
!991 = !DILocation(line: 23, column: 136, scope: !976)
!992 = !DILocation(line: 23, column: 134, scope: !976)
!993 = !DILocation(line: 23, column: 147, scope: !976)
!994 = !DILocation(line: 23, column: 145, scope: !976)
!995 = !DILocation(line: 23, column: 129, scope: !976)
!996 = !DILocation(line: 23, column: 115, scope: !976)
!997 = !DILocation(line: 23, column: 17, scope: !976)
!998 = !DILocation(line: 24, column: 13, scope: !976)
!999 = !DILocation(line: 22, column: 45, scope: !971)
!1000 = !DILocation(line: 22, column: 13, scope: !971)
!1001 = distinct !{!1001, !974, !1002, !165}
!1002 = !DILocation(line: 24, column: 13, scope: !966)
!1003 = !DILocation(line: 25, column: 33, scope: !967)
!1004 = !DILocation(line: 26, column: 9, scope: !967)
!1005 = !DILocation(line: 21, column: 56, scope: !961)
!1006 = !DILocation(line: 21, column: 9, scope: !961)
!1007 = distinct !{!1007, !964, !1008, !165}
!1008 = !DILocation(line: 26, column: 9, scope: !953)
!1009 = !DILocation(line: 27, column: 5, scope: !954)
!1010 = !DILocation(line: 20, column: 39, scope: !948)
!1011 = !DILocation(line: 20, column: 5, scope: !948)
!1012 = distinct !{!1012, !951, !1013, !165}
!1013 = !DILocation(line: 27, column: 5, scope: !944)
!1014 = !DILocation(line: 28, column: 1, scope: !922)
!1015 = distinct !DISubprogram(name: "unpack_m_vecs", scope: !88, file: !88, line: 262, type: !1016, scopeLine: 262, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !91)
!1016 = !DISubroutineType(types: !1017)
!1017 = !{null, !60, !81, !51, !51}
!1018 = !DILocalVariable(name: "in", arg: 1, scope: !1015, file: !88, line: 262, type: !60)
!1019 = !DILocation(line: 262, column: 48, scope: !1015)
!1020 = !DILocalVariable(name: "out", arg: 2, scope: !1015, file: !88, line: 262, type: !81)
!1021 = !DILocation(line: 262, column: 62, scope: !1015)
!1022 = !DILocalVariable(name: "vecs", arg: 3, scope: !1015, file: !88, line: 262, type: !51)
!1023 = !DILocation(line: 262, column: 71, scope: !1015)
!1024 = !DILocalVariable(name: "m", arg: 4, scope: !1015, file: !88, line: 262, type: !51)
!1025 = !DILocation(line: 262, column: 81, scope: !1015)
!1026 = !DILocalVariable(name: "m_vec_limbs", scope: !1015, file: !88, line: 263, type: !426)
!1027 = !DILocation(line: 263, column: 15, scope: !1015)
!1028 = !DILocation(line: 263, column: 30, scope: !1015)
!1029 = !DILocation(line: 263, column: 32, scope: !1015)
!1030 = !DILocation(line: 263, column: 38, scope: !1015)
!1031 = !DILocalVariable(name: "_out", scope: !1015, file: !88, line: 264, type: !55)
!1032 = !DILocation(line: 264, column: 20, scope: !1015)
!1033 = !DILocation(line: 264, column: 45, scope: !1015)
!1034 = !DILocalVariable(name: "tmp", scope: !1015, file: !88, line: 265, type: !1035)
!1035 = !DICompositeType(tag: DW_TAG_array_type, baseType: !46, size: 576, elements: !1036)
!1036 = !{!1037}
!1037 = !DISubrange(count: 9)
!1038 = !DILocation(line: 265, column: 14, scope: !1015)
!1039 = !DILocalVariable(name: "i", scope: !1040, file: !88, line: 266, type: !51)
!1040 = distinct !DILexicalBlock(scope: !1015, file: !88, line: 266, column: 5)
!1041 = !DILocation(line: 266, column: 14, scope: !1040)
!1042 = !DILocation(line: 266, column: 18, scope: !1040)
!1043 = !DILocation(line: 266, column: 22, scope: !1040)
!1044 = !DILocation(line: 266, column: 10, scope: !1040)
!1045 = !DILocation(line: 266, column: 26, scope: !1046)
!1046 = distinct !DILexicalBlock(scope: !1040, file: !88, line: 266, column: 5)
!1047 = !DILocation(line: 266, column: 28, scope: !1046)
!1048 = !DILocation(line: 266, column: 5, scope: !1040)
!1049 = !DILocation(line: 268, column: 16, scope: !1050)
!1050 = distinct !DILexicalBlock(scope: !1046, file: !88, line: 267, column: 5)
!1051 = !DILocation(line: 268, column: 21, scope: !1050)
!1052 = !DILocation(line: 268, column: 26, scope: !1050)
!1053 = !DILocation(line: 268, column: 28, scope: !1050)
!1054 = !DILocation(line: 268, column: 27, scope: !1050)
!1055 = !DILocation(line: 268, column: 29, scope: !1050)
!1056 = !DILocation(line: 268, column: 24, scope: !1050)
!1057 = !DILocation(line: 268, column: 33, scope: !1050)
!1058 = !DILocation(line: 268, column: 34, scope: !1050)
!1059 = !DILocation(line: 268, column: 9, scope: !1050)
!1060 = !DILocation(line: 269, column: 16, scope: !1050)
!1061 = !DILocation(line: 269, column: 23, scope: !1050)
!1062 = !DILocation(line: 269, column: 25, scope: !1050)
!1063 = !DILocation(line: 269, column: 24, scope: !1050)
!1064 = !DILocation(line: 269, column: 36, scope: !1050)
!1065 = !DILocation(line: 269, column: 21, scope: !1050)
!1066 = !DILocation(line: 269, column: 55, scope: !1050)
!1067 = !DILocation(line: 269, column: 60, scope: !1050)
!1068 = !DILocation(line: 269, column: 71, scope: !1050)
!1069 = !DILocation(line: 269, column: 9, scope: !1050)
!1070 = !DILocation(line: 270, column: 5, scope: !1050)
!1071 = !DILocation(line: 266, column: 35, scope: !1046)
!1072 = !DILocation(line: 266, column: 5, scope: !1046)
!1073 = distinct !{!1073, !1048, !1074, !165}
!1074 = !DILocation(line: 270, column: 5, scope: !1040)
!1075 = !DILocation(line: 271, column: 1, scope: !1015)
!1076 = distinct !DISubprogram(name: "mayo_expand_sk", scope: !88, file: !88, line: 310, type: !1077, scopeLine: 311, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !79, retainedNodes: !91)
!1077 = !DISubroutineType(types: !1078)
!1078 = !{!51, !345, !60, !1079}
!1079 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1080, size: 32)
!1080 = !DIDerivedType(tag: DW_TAG_typedef, name: "sk_t", file: !112, line: 294, baseType: !1081)
!1081 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sk_t", file: !112, line: 291, size: 7257920, elements: !1082)
!1082 = !{!1083, !1084}
!1083 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !1081, file: !112, line: 292, baseType: !196, size: 7238592)
!1084 = !DIDerivedType(tag: DW_TAG_member, name: "O", scope: !1081, file: !112, line: 293, baseType: !200, size: 19312, offset: 7238592)
!1085 = !DILocalVariable(name: "p", arg: 1, scope: !1076, file: !88, line: 310, type: !345)
!1086 = !DILocation(line: 310, column: 41, scope: !1076)
!1087 = !DILocalVariable(name: "csk", arg: 2, scope: !1076, file: !88, line: 310, type: !60)
!1088 = !DILocation(line: 310, column: 65, scope: !1076)
!1089 = !DILocalVariable(name: "sk", arg: 3, scope: !1076, file: !88, line: 311, type: !1079)
!1090 = !DILocation(line: 311, column: 26, scope: !1076)
!1091 = !DILocalVariable(name: "ret", scope: !1076, file: !88, line: 312, type: !51)
!1092 = !DILocation(line: 312, column: 9, scope: !1076)
!1093 = !DILocalVariable(name: "S", scope: !1076, file: !88, line: 313, type: !409)
!1094 = !DILocation(line: 313, column: 19, scope: !1076)
!1095 = !DILocalVariable(name: "P", scope: !1076, file: !88, line: 314, type: !81)
!1096 = !DILocation(line: 314, column: 15, scope: !1076)
!1097 = !DILocation(line: 314, column: 19, scope: !1076)
!1098 = !DILocation(line: 314, column: 23, scope: !1076)
!1099 = !DILocalVariable(name: "O", scope: !1076, file: !88, line: 315, type: !55)
!1100 = !DILocation(line: 315, column: 20, scope: !1076)
!1101 = !DILocation(line: 315, column: 24, scope: !1076)
!1102 = !DILocation(line: 315, column: 28, scope: !1076)
!1103 = !DILocalVariable(name: "param_o", scope: !1076, file: !88, line: 317, type: !426)
!1104 = !DILocation(line: 317, column: 15, scope: !1076)
!1105 = !DILocation(line: 317, column: 25, scope: !1076)
!1106 = !DILocalVariable(name: "param_v", scope: !1076, file: !88, line: 318, type: !426)
!1107 = !DILocation(line: 318, column: 15, scope: !1076)
!1108 = !DILocation(line: 318, column: 25, scope: !1076)
!1109 = !DILocalVariable(name: "param_O_bytes", scope: !1076, file: !88, line: 319, type: !426)
!1110 = !DILocation(line: 319, column: 15, scope: !1076)
!1111 = !DILocation(line: 319, column: 31, scope: !1076)
!1112 = !DILocalVariable(name: "param_pk_seed_bytes", scope: !1076, file: !88, line: 320, type: !426)
!1113 = !DILocation(line: 320, column: 15, scope: !1076)
!1114 = !DILocation(line: 320, column: 37, scope: !1076)
!1115 = !DILocalVariable(name: "param_sk_seed_bytes", scope: !1076, file: !88, line: 321, type: !426)
!1116 = !DILocation(line: 321, column: 15, scope: !1076)
!1117 = !DILocation(line: 321, column: 37, scope: !1076)
!1118 = !DILocalVariable(name: "seed_sk", scope: !1076, file: !88, line: 323, type: !60)
!1119 = !DILocation(line: 323, column: 26, scope: !1076)
!1120 = !DILocation(line: 323, column: 36, scope: !1076)
!1121 = !DILocalVariable(name: "seed_pk", scope: !1076, file: !88, line: 324, type: !55)
!1122 = !DILocation(line: 324, column: 20, scope: !1076)
!1123 = !DILocation(line: 324, column: 30, scope: !1076)
!1124 = !DILocation(line: 326, column: 14, scope: !1076)
!1125 = !DILocation(line: 326, column: 17, scope: !1076)
!1126 = !DILocation(line: 326, column: 39, scope: !1076)
!1127 = !DILocation(line: 326, column: 37, scope: !1076)
!1128 = !DILocation(line: 326, column: 54, scope: !1076)
!1129 = !DILocation(line: 327, column: 14, scope: !1076)
!1130 = !DILocation(line: 326, column: 5, scope: !1076)
!1131 = !DILocation(line: 328, column: 12, scope: !1076)
!1132 = !DILocation(line: 328, column: 16, scope: !1076)
!1133 = !DILocation(line: 328, column: 14, scope: !1076)
!1134 = !DILocation(line: 328, column: 37, scope: !1076)
!1135 = !DILocation(line: 328, column: 40, scope: !1076)
!1136 = !DILocation(line: 328, column: 50, scope: !1076)
!1137 = !DILocation(line: 328, column: 48, scope: !1076)
!1138 = !DILocation(line: 328, column: 5, scope: !1076)
!1139 = !DILocation(line: 334, column: 18, scope: !1076)
!1140 = !DILocation(line: 334, column: 21, scope: !1076)
!1141 = !DILocation(line: 334, column: 24, scope: !1076)
!1142 = !DILocation(line: 334, column: 5, scope: !1076)
!1143 = !DILocalVariable(name: "P2", scope: !1076, file: !88, line: 341, type: !81)
!1144 = !DILocation(line: 341, column: 15, scope: !1076)
!1145 = !DILocation(line: 341, column: 20, scope: !1076)
!1146 = !DILocation(line: 341, column: 24, scope: !1076)
!1147 = !DILocation(line: 341, column: 22, scope: !1076)
!1148 = !DILocalVariable(name: "P1", scope: !1076, file: !88, line: 343, type: !81)
!1149 = !DILocation(line: 343, column: 15, scope: !1076)
!1150 = !DILocation(line: 343, column: 20, scope: !1076)
!1151 = !DILocalVariable(name: "L", scope: !1076, file: !88, line: 346, type: !81)
!1152 = !DILocation(line: 346, column: 15, scope: !1076)
!1153 = !DILocation(line: 346, column: 19, scope: !1076)
!1154 = !DILocation(line: 347, column: 19, scope: !1076)
!1155 = !DILocation(line: 347, column: 22, scope: !1076)
!1156 = !DILocation(line: 347, column: 26, scope: !1076)
!1157 = !DILocation(line: 347, column: 29, scope: !1076)
!1158 = !DILocation(line: 347, column: 5, scope: !1076)
!1159 = !DILocation(line: 355, column: 23, scope: !1076)
!1160 = !DILocation(line: 355, column: 5, scope: !1076)
!1161 = !DILocation(line: 356, column: 12, scope: !1076)
!1162 = !DILocation(line: 356, column: 5, scope: !1076)
!1163 = distinct !DISubprogram(name: "P1P1t_times_O", scope: !606, file: !606, line: 218, type: !694, scopeLine: 218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !91)
!1164 = !DILocalVariable(name: "p", arg: 1, scope: !1163, file: !606, line: 218, type: !345)
!1165 = !DILocation(line: 218, column: 41, scope: !1163)
!1166 = !DILocalVariable(name: "P1", arg: 2, scope: !1163, file: !606, line: 218, type: !609)
!1167 = !DILocation(line: 218, column: 60, scope: !1163)
!1168 = !DILocalVariable(name: "O", arg: 3, scope: !1163, file: !606, line: 218, type: !60)
!1169 = !DILocation(line: 218, column: 85, scope: !1163)
!1170 = !DILocalVariable(name: "acc", arg: 4, scope: !1163, file: !606, line: 218, type: !81)
!1171 = !DILocation(line: 218, column: 98, scope: !1163)
!1172 = !DILocalVariable(name: "param_o", scope: !1163, file: !606, line: 222, type: !426)
!1173 = !DILocation(line: 222, column: 15, scope: !1163)
!1174 = !DILocation(line: 222, column: 25, scope: !1163)
!1175 = !DILocalVariable(name: "param_v", scope: !1163, file: !606, line: 223, type: !426)
!1176 = !DILocation(line: 223, column: 15, scope: !1163)
!1177 = !DILocation(line: 223, column: 25, scope: !1163)
!1178 = !DILocalVariable(name: "m_vec_limbs", scope: !1163, file: !606, line: 224, type: !426)
!1179 = !DILocation(line: 224, column: 15, scope: !1163)
!1180 = !DILocation(line: 224, column: 29, scope: !1163)
!1181 = !DILocalVariable(name: "bs_mat_entries_used", scope: !1163, file: !606, line: 226, type: !51)
!1182 = !DILocation(line: 226, column: 9, scope: !1163)
!1183 = !DILocalVariable(name: "r", scope: !1184, file: !606, line: 227, type: !51)
!1184 = distinct !DILexicalBlock(scope: !1163, file: !606, line: 227, column: 5)
!1185 = !DILocation(line: 227, column: 14, scope: !1184)
!1186 = !DILocation(line: 227, column: 10, scope: !1184)
!1187 = !DILocation(line: 227, column: 21, scope: !1188)
!1188 = distinct !DILexicalBlock(scope: !1184, file: !606, line: 227, column: 5)
!1189 = !DILocation(line: 227, column: 25, scope: !1188)
!1190 = !DILocation(line: 227, column: 23, scope: !1188)
!1191 = !DILocation(line: 227, column: 5, scope: !1184)
!1192 = !DILocalVariable(name: "c", scope: !1193, file: !606, line: 228, type: !51)
!1193 = distinct !DILexicalBlock(scope: !1194, file: !606, line: 228, column: 9)
!1194 = distinct !DILexicalBlock(scope: !1188, file: !606, line: 227, column: 39)
!1195 = !DILocation(line: 228, column: 18, scope: !1193)
!1196 = !DILocation(line: 228, column: 22, scope: !1193)
!1197 = !DILocation(line: 228, column: 14, scope: !1193)
!1198 = !DILocation(line: 228, column: 25, scope: !1199)
!1199 = distinct !DILexicalBlock(scope: !1193, file: !606, line: 228, column: 9)
!1200 = !DILocation(line: 228, column: 29, scope: !1199)
!1201 = !DILocation(line: 228, column: 27, scope: !1199)
!1202 = !DILocation(line: 228, column: 9, scope: !1193)
!1203 = !DILocation(line: 229, column: 16, scope: !1204)
!1204 = distinct !DILexicalBlock(scope: !1205, file: !606, line: 229, column: 16)
!1205 = distinct !DILexicalBlock(scope: !1199, file: !606, line: 228, column: 43)
!1206 = !DILocation(line: 229, column: 19, scope: !1204)
!1207 = !DILocation(line: 229, column: 17, scope: !1204)
!1208 = !DILocation(line: 230, column: 37, scope: !1209)
!1209 = distinct !DILexicalBlock(scope: !1204, file: !606, line: 229, column: 22)
!1210 = !DILocation(line: 231, column: 17, scope: !1209)
!1211 = !DILocalVariable(name: "k", scope: !1212, file: !606, line: 233, type: !51)
!1212 = distinct !DILexicalBlock(scope: !1205, file: !606, line: 233, column: 13)
!1213 = !DILocation(line: 233, column: 22, scope: !1212)
!1214 = !DILocation(line: 233, column: 18, scope: !1212)
!1215 = !DILocation(line: 233, column: 29, scope: !1216)
!1216 = distinct !DILexicalBlock(scope: !1212, file: !606, line: 233, column: 13)
!1217 = !DILocation(line: 233, column: 33, scope: !1216)
!1218 = !DILocation(line: 233, column: 31, scope: !1216)
!1219 = !DILocation(line: 233, column: 13, scope: !1212)
!1220 = !DILocation(line: 234, column: 31, scope: !1221)
!1221 = distinct !DILexicalBlock(scope: !1216, file: !606, line: 233, column: 50)
!1222 = !DILocation(line: 234, column: 44, scope: !1221)
!1223 = !DILocation(line: 234, column: 49, scope: !1221)
!1224 = !DILocation(line: 234, column: 63, scope: !1221)
!1225 = !DILocation(line: 234, column: 61, scope: !1221)
!1226 = !DILocation(line: 234, column: 47, scope: !1221)
!1227 = !DILocation(line: 234, column: 84, scope: !1221)
!1228 = !DILocation(line: 234, column: 86, scope: !1221)
!1229 = !DILocation(line: 234, column: 90, scope: !1221)
!1230 = !DILocation(line: 234, column: 88, scope: !1221)
!1231 = !DILocation(line: 234, column: 100, scope: !1221)
!1232 = !DILocation(line: 234, column: 98, scope: !1221)
!1233 = !DILocation(line: 234, column: 104, scope: !1221)
!1234 = !DILocation(line: 234, column: 110, scope: !1221)
!1235 = !DILocation(line: 234, column: 125, scope: !1221)
!1236 = !DILocation(line: 234, column: 129, scope: !1221)
!1237 = !DILocation(line: 234, column: 127, scope: !1221)
!1238 = !DILocation(line: 234, column: 139, scope: !1221)
!1239 = !DILocation(line: 234, column: 137, scope: !1221)
!1240 = !DILocation(line: 234, column: 122, scope: !1221)
!1241 = !DILocation(line: 234, column: 108, scope: !1221)
!1242 = !DILocation(line: 234, column: 17, scope: !1221)
!1243 = !DILocation(line: 235, column: 31, scope: !1221)
!1244 = !DILocation(line: 235, column: 44, scope: !1221)
!1245 = !DILocation(line: 235, column: 49, scope: !1221)
!1246 = !DILocation(line: 235, column: 63, scope: !1221)
!1247 = !DILocation(line: 235, column: 61, scope: !1221)
!1248 = !DILocation(line: 235, column: 47, scope: !1221)
!1249 = !DILocation(line: 235, column: 84, scope: !1221)
!1250 = !DILocation(line: 235, column: 86, scope: !1221)
!1251 = !DILocation(line: 235, column: 90, scope: !1221)
!1252 = !DILocation(line: 235, column: 88, scope: !1221)
!1253 = !DILocation(line: 235, column: 100, scope: !1221)
!1254 = !DILocation(line: 235, column: 98, scope: !1221)
!1255 = !DILocation(line: 235, column: 104, scope: !1221)
!1256 = !DILocation(line: 235, column: 110, scope: !1221)
!1257 = !DILocation(line: 235, column: 125, scope: !1221)
!1258 = !DILocation(line: 235, column: 129, scope: !1221)
!1259 = !DILocation(line: 235, column: 127, scope: !1221)
!1260 = !DILocation(line: 235, column: 139, scope: !1221)
!1261 = !DILocation(line: 235, column: 137, scope: !1221)
!1262 = !DILocation(line: 235, column: 122, scope: !1221)
!1263 = !DILocation(line: 235, column: 108, scope: !1221)
!1264 = !DILocation(line: 235, column: 17, scope: !1221)
!1265 = !DILocation(line: 236, column: 13, scope: !1221)
!1266 = !DILocation(line: 233, column: 44, scope: !1216)
!1267 = !DILocation(line: 233, column: 13, scope: !1216)
!1268 = distinct !{!1268, !1219, !1269, !165}
!1269 = !DILocation(line: 236, column: 13, scope: !1212)
!1270 = !DILocation(line: 237, column: 33, scope: !1205)
!1271 = !DILocation(line: 238, column: 9, scope: !1205)
!1272 = !DILocation(line: 228, column: 39, scope: !1199)
!1273 = !DILocation(line: 228, column: 9, scope: !1199)
!1274 = distinct !{!1274, !1202, !1275, !165}
!1275 = !DILocation(line: 238, column: 9, scope: !1193)
!1276 = !DILocation(line: 239, column: 5, scope: !1194)
!1277 = !DILocation(line: 227, column: 35, scope: !1188)
!1278 = !DILocation(line: 227, column: 5, scope: !1188)
!1279 = distinct !{!1279, !1191, !1280, !165}
!1280 = !DILocation(line: 239, column: 5, scope: !1184)
!1281 = !DILocation(line: 240, column: 1, scope: !1163)
!1282 = distinct !DISubprogram(name: "mayo_sign_signature", scope: !88, file: !88, line: 359, type: !1283, scopeLine: 361, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !79, retainedNodes: !91)
!1283 = !DISubroutineType(types: !1284)
!1284 = !{!51, !345, !55, !1285, !60, !82, !60}
!1285 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 32)
!1286 = !DILocalVariable(name: "p", arg: 1, scope: !1282, file: !88, line: 359, type: !345)
!1287 = !DILocation(line: 359, column: 46, scope: !1282)
!1288 = !DILocalVariable(name: "sig", arg: 2, scope: !1282, file: !88, line: 359, type: !55)
!1289 = !DILocation(line: 359, column: 64, scope: !1282)
!1290 = !DILocalVariable(name: "siglen", arg: 3, scope: !1282, file: !88, line: 360, type: !1285)
!1291 = !DILocation(line: 360, column: 23, scope: !1282)
!1292 = !DILocalVariable(name: "m", arg: 4, scope: !1282, file: !88, line: 360, type: !60)
!1293 = !DILocation(line: 360, column: 52, scope: !1282)
!1294 = !DILocalVariable(name: "mlen", arg: 5, scope: !1282, file: !88, line: 361, type: !82)
!1295 = !DILocation(line: 361, column: 22, scope: !1282)
!1296 = !DILocalVariable(name: "csk", arg: 6, scope: !1282, file: !88, line: 361, type: !60)
!1297 = !DILocation(line: 361, column: 49, scope: !1282)
!1298 = !DILocalVariable(name: "ret", scope: !1282, file: !88, line: 362, type: !51)
!1299 = !DILocation(line: 362, column: 9, scope: !1282)
!1300 = !DILocalVariable(name: "tenc", scope: !1282, file: !88, line: 363, type: !1301)
!1301 = !DICompositeType(tag: DW_TAG_array_type, baseType: !56, size: 568, elements: !1302)
!1302 = !{!1303}
!1303 = !DISubrange(count: 71)
!1304 = !DILocation(line: 363, column: 19, scope: !1282)
!1305 = !DILocalVariable(name: "t", scope: !1282, file: !88, line: 363, type: !1306)
!1306 = !DICompositeType(tag: DW_TAG_array_type, baseType: !56, size: 1136, elements: !1307)
!1307 = !{!1308}
!1308 = !DISubrange(count: 142)
!1309 = !DILocation(line: 363, column: 38, scope: !1282)
!1310 = !DILocalVariable(name: "y", scope: !1282, file: !88, line: 364, type: !1306)
!1311 = !DILocation(line: 364, column: 19, scope: !1282)
!1312 = !DILocalVariable(name: "salt", scope: !1282, file: !88, line: 365, type: !1313)
!1313 = !DICompositeType(tag: DW_TAG_array_type, baseType: !56, size: 320, elements: !1314)
!1314 = !{!1315}
!1315 = !DISubrange(count: 40)
!1316 = !DILocation(line: 365, column: 19, scope: !1282)
!1317 = !DILocalVariable(name: "V", scope: !1282, file: !88, line: 366, type: !1318)
!1318 = !DICompositeType(tag: DW_TAG_array_type, baseType: !56, size: 7392, elements: !1319)
!1319 = !{!1320}
!1320 = !DISubrange(count: 924)
!1321 = !DILocation(line: 366, column: 19, scope: !1282)
!1322 = !DILocalVariable(name: "Vdec", scope: !1282, file: !88, line: 366, type: !1323)
!1323 = !DICompositeType(tag: DW_TAG_array_type, baseType: !56, size: 13632, elements: !1324)
!1324 = !{!1325}
!1325 = !DISubrange(count: 1704)
!1326 = !DILocation(line: 366, column: 57, scope: !1282)
!1327 = !DILocalVariable(name: "A", scope: !1282, file: !88, line: 367, type: !1328)
!1328 = !DICompositeType(tag: DW_TAG_array_type, baseType: !56, size: 236160, elements: !1329)
!1329 = !{!1330}
!1330 = !DISubrange(count: 29520)
!1331 = !DILocation(line: 367, column: 19, scope: !1282)
!1332 = !DILocalVariable(name: "x", scope: !1282, file: !88, line: 368, type: !1333)
!1333 = !DICompositeType(tag: DW_TAG_array_type, baseType: !56, size: 14784, elements: !1334)
!1334 = !{!1335}
!1335 = !DISubrange(count: 1848)
!1336 = !DILocation(line: 368, column: 19, scope: !1282)
!1337 = !DILocalVariable(name: "r", scope: !1282, file: !88, line: 369, type: !1338)
!1338 = !DICompositeType(tag: DW_TAG_array_type, baseType: !56, size: 1640, elements: !1339)
!1339 = !{!1340}
!1340 = !DISubrange(count: 205)
!1341 = !DILocation(line: 369, column: 19, scope: !1282)
!1342 = !DILocalVariable(name: "s", scope: !1282, file: !88, line: 370, type: !1333)
!1343 = !DILocation(line: 370, column: 19, scope: !1282)
!1344 = !DILocalVariable(name: "seed_sk", scope: !1282, file: !88, line: 371, type: !60)
!1345 = !DILocation(line: 371, column: 26, scope: !1282)
!1346 = !DILocalVariable(name: "sk", scope: !1282, file: !88, line: 372, type: !1080, align: 256)
!1347 = !DILocation(line: 372, column: 22, scope: !1282)
!1348 = !DILocalVariable(name: "Ox", scope: !1282, file: !88, line: 373, type: !1306)
!1349 = !DILocation(line: 373, column: 19, scope: !1282)
!1350 = !DILocalVariable(name: "tmp", scope: !1282, file: !88, line: 374, type: !1351)
!1351 = !DICompositeType(tag: DW_TAG_array_type, baseType: !56, size: 1160, elements: !1352)
!1352 = !{!1353}
!1353 = !DISubrange(count: 145)
!1354 = !DILocation(line: 374, column: 19, scope: !1282)
!1355 = !DILocalVariable(name: "ctrbyte", scope: !1282, file: !88, line: 375, type: !55)
!1356 = !DILocation(line: 375, column: 20, scope: !1282)
!1357 = !DILocalVariable(name: "vi", scope: !1282, file: !88, line: 376, type: !55)
!1358 = !DILocation(line: 376, column: 20, scope: !1282)
!1359 = !DILocalVariable(name: "param_m", scope: !1282, file: !88, line: 378, type: !426)
!1360 = !DILocation(line: 378, column: 15, scope: !1282)
!1361 = !DILocation(line: 378, column: 25, scope: !1282)
!1362 = !DILocalVariable(name: "param_n", scope: !1282, file: !88, line: 379, type: !426)
!1363 = !DILocation(line: 379, column: 15, scope: !1282)
!1364 = !DILocation(line: 379, column: 25, scope: !1282)
!1365 = !DILocalVariable(name: "param_o", scope: !1282, file: !88, line: 380, type: !426)
!1366 = !DILocation(line: 380, column: 15, scope: !1282)
!1367 = !DILocation(line: 380, column: 25, scope: !1282)
!1368 = !DILocalVariable(name: "param_k", scope: !1282, file: !88, line: 381, type: !426)
!1369 = !DILocation(line: 381, column: 15, scope: !1282)
!1370 = !DILocation(line: 381, column: 25, scope: !1282)
!1371 = !DILocalVariable(name: "param_v", scope: !1282, file: !88, line: 382, type: !426)
!1372 = !DILocation(line: 382, column: 15, scope: !1282)
!1373 = !DILocation(line: 382, column: 25, scope: !1282)
!1374 = !DILocalVariable(name: "param_m_bytes", scope: !1282, file: !88, line: 383, type: !426)
!1375 = !DILocation(line: 383, column: 15, scope: !1282)
!1376 = !DILocation(line: 383, column: 31, scope: !1282)
!1377 = !DILocalVariable(name: "param_v_bytes", scope: !1282, file: !88, line: 384, type: !426)
!1378 = !DILocation(line: 384, column: 15, scope: !1282)
!1379 = !DILocation(line: 384, column: 31, scope: !1282)
!1380 = !DILocalVariable(name: "param_r_bytes", scope: !1282, file: !88, line: 385, type: !426)
!1381 = !DILocation(line: 385, column: 15, scope: !1282)
!1382 = !DILocation(line: 385, column: 31, scope: !1282)
!1383 = !DILocalVariable(name: "param_sig_bytes", scope: !1282, file: !88, line: 386, type: !426)
!1384 = !DILocation(line: 386, column: 15, scope: !1282)
!1385 = !DILocation(line: 386, column: 33, scope: !1282)
!1386 = !DILocalVariable(name: "param_A_cols", scope: !1282, file: !88, line: 387, type: !426)
!1387 = !DILocation(line: 387, column: 15, scope: !1282)
!1388 = !DILocation(line: 387, column: 30, scope: !1282)
!1389 = !DILocalVariable(name: "param_digest_bytes", scope: !1282, file: !88, line: 388, type: !426)
!1390 = !DILocation(line: 388, column: 15, scope: !1282)
!1391 = !DILocation(line: 388, column: 36, scope: !1282)
!1392 = !DILocalVariable(name: "param_sk_seed_bytes", scope: !1282, file: !88, line: 389, type: !426)
!1393 = !DILocation(line: 389, column: 15, scope: !1282)
!1394 = !DILocation(line: 389, column: 37, scope: !1282)
!1395 = !DILocalVariable(name: "param_salt_bytes", scope: !1282, file: !88, line: 390, type: !426)
!1396 = !DILocation(line: 390, column: 15, scope: !1282)
!1397 = !DILocation(line: 390, column: 34, scope: !1282)
!1398 = !DILocation(line: 392, column: 26, scope: !1282)
!1399 = !DILocation(line: 392, column: 29, scope: !1282)
!1400 = !DILocation(line: 392, column: 11, scope: !1282)
!1401 = !DILocation(line: 392, column: 9, scope: !1282)
!1402 = !DILocation(line: 393, column: 9, scope: !1403)
!1403 = distinct !DILexicalBlock(scope: !1282, file: !88, line: 393, column: 9)
!1404 = !DILocation(line: 393, column: 13, scope: !1403)
!1405 = !DILocation(line: 394, column: 9, scope: !1406)
!1406 = distinct !DILexicalBlock(scope: !1403, file: !88, line: 393, column: 25)
!1407 = !DILocation(line: 397, column: 15, scope: !1282)
!1408 = !DILocation(line: 397, column: 13, scope: !1282)
!1409 = !DILocation(line: 401, column: 14, scope: !1282)
!1410 = !DILocation(line: 401, column: 19, scope: !1282)
!1411 = !DILocation(line: 401, column: 39, scope: !1282)
!1412 = !DILocation(line: 401, column: 42, scope: !1282)
!1413 = !DILocation(line: 401, column: 5, scope: !1282)
!1414 = !DILocalVariable(name: "P1", scope: !1282, file: !88, line: 403, type: !81)
!1415 = !DILocation(line: 403, column: 15, scope: !1282)
!1416 = !DILocation(line: 403, column: 23, scope: !1282)
!1417 = !DILocation(line: 403, column: 20, scope: !1282)
!1418 = !DILocalVariable(name: "L", scope: !1282, file: !88, line: 404, type: !81)
!1419 = !DILocation(line: 404, column: 15, scope: !1282)
!1420 = !DILocation(line: 404, column: 20, scope: !1282)
!1421 = !DILocation(line: 404, column: 25, scope: !1282)
!1422 = !DILocation(line: 404, column: 23, scope: !1282)
!1423 = !DILocalVariable(name: "Mtmp", scope: !1282, file: !88, line: 405, type: !1424)
!1424 = !DICompositeType(tag: DW_TAG_array_type, baseType: !46, size: 117504, elements: !1425)
!1425 = !{!1426}
!1426 = !DISubrange(count: 1836)
!1427 = !DILocation(line: 405, column: 14, scope: !1282)
!1428 = !DILocation(line: 420, column: 21, scope: !1429)
!1429 = distinct !DILexicalBlock(scope: !1282, file: !88, line: 420, column: 9)
!1430 = !DILocation(line: 420, column: 27, scope: !1429)
!1431 = !DILocation(line: 420, column: 25, scope: !1429)
!1432 = !DILocation(line: 420, column: 47, scope: !1429)
!1433 = !DILocation(line: 420, column: 9, scope: !1429)
!1434 = !DILocation(line: 420, column: 65, scope: !1429)
!1435 = !DILocation(line: 421, column: 13, scope: !1436)
!1436 = distinct !DILexicalBlock(scope: !1429, file: !88, line: 420, column: 77)
!1437 = !DILocation(line: 422, column: 9, scope: !1436)
!1438 = !DILocation(line: 427, column: 12, scope: !1282)
!1439 = !DILocation(line: 427, column: 18, scope: !1282)
!1440 = !DILocation(line: 427, column: 16, scope: !1282)
!1441 = !DILocation(line: 427, column: 39, scope: !1282)
!1442 = !DILocation(line: 427, column: 37, scope: !1282)
!1443 = !DILocation(line: 427, column: 57, scope: !1282)
!1444 = !DILocation(line: 428, column: 12, scope: !1282)
!1445 = !DILocation(line: 427, column: 5, scope: !1282)
!1446 = !DILocation(line: 429, column: 14, scope: !1282)
!1447 = !DILocation(line: 429, column: 20, scope: !1282)
!1448 = !DILocation(line: 429, column: 38, scope: !1282)
!1449 = !DILocation(line: 430, column: 14, scope: !1282)
!1450 = !DILocation(line: 430, column: 35, scope: !1282)
!1451 = !DILocation(line: 430, column: 33, scope: !1282)
!1452 = !DILocation(line: 430, column: 54, scope: !1282)
!1453 = !DILocation(line: 430, column: 52, scope: !1282)
!1454 = !DILocation(line: 429, column: 5, scope: !1282)
!1455 = !DILocation(line: 437, column: 12, scope: !1282)
!1456 = !DILocation(line: 437, column: 18, scope: !1282)
!1457 = !DILocation(line: 437, column: 16, scope: !1282)
!1458 = !DILocation(line: 437, column: 38, scope: !1282)
!1459 = !DILocation(line: 437, column: 44, scope: !1282)
!1460 = !DILocation(line: 437, column: 5, scope: !1282)
!1461 = !DILocation(line: 438, column: 15, scope: !1282)
!1462 = !DILocation(line: 438, column: 21, scope: !1282)
!1463 = !DILocation(line: 438, column: 19, scope: !1282)
!1464 = !DILocation(line: 438, column: 42, scope: !1282)
!1465 = !DILocation(line: 438, column: 40, scope: !1282)
!1466 = !DILocation(line: 438, column: 61, scope: !1282)
!1467 = !DILocation(line: 438, column: 59, scope: !1282)
!1468 = !DILocation(line: 438, column: 13, scope: !1282)
!1469 = !DILocation(line: 440, column: 14, scope: !1282)
!1470 = !DILocation(line: 440, column: 20, scope: !1282)
!1471 = !DILocation(line: 440, column: 35, scope: !1282)
!1472 = !DILocation(line: 440, column: 40, scope: !1282)
!1473 = !DILocation(line: 440, column: 61, scope: !1282)
!1474 = !DILocation(line: 440, column: 59, scope: !1282)
!1475 = !DILocation(line: 440, column: 5, scope: !1282)
!1476 = !DILocation(line: 442, column: 12, scope: !1282)
!1477 = !DILocation(line: 442, column: 18, scope: !1282)
!1478 = !DILocation(line: 442, column: 21, scope: !1282)
!1479 = !DILocation(line: 442, column: 5, scope: !1282)
!1480 = !DILocalVariable(name: "ctr", scope: !1481, file: !88, line: 444, type: !51)
!1481 = distinct !DILexicalBlock(scope: !1282, file: !88, line: 444, column: 5)
!1482 = !DILocation(line: 444, column: 14, scope: !1481)
!1483 = !DILocation(line: 444, column: 10, scope: !1481)
!1484 = !DILocation(line: 444, column: 23, scope: !1485)
!1485 = distinct !DILexicalBlock(scope: !1481, file: !88, line: 444, column: 5)
!1486 = !DILocation(line: 444, column: 27, scope: !1485)
!1487 = !DILocation(line: 444, column: 5, scope: !1481)
!1488 = !DILocation(line: 445, column: 35, scope: !1489)
!1489 = distinct !DILexicalBlock(scope: !1485, file: !88, line: 444, column: 42)
!1490 = !DILocation(line: 445, column: 20, scope: !1489)
!1491 = !DILocation(line: 445, column: 10, scope: !1489)
!1492 = !DILocation(line: 445, column: 18, scope: !1489)
!1493 = !DILocation(line: 447, column: 18, scope: !1489)
!1494 = !DILocation(line: 447, column: 21, scope: !1489)
!1495 = !DILocation(line: 447, column: 31, scope: !1489)
!1496 = !DILocation(line: 447, column: 29, scope: !1489)
!1497 = !DILocation(line: 447, column: 47, scope: !1489)
!1498 = !DILocation(line: 447, column: 45, scope: !1489)
!1499 = !DILocation(line: 447, column: 62, scope: !1489)
!1500 = !DILocation(line: 448, column: 18, scope: !1489)
!1501 = !DILocation(line: 448, column: 39, scope: !1489)
!1502 = !DILocation(line: 448, column: 37, scope: !1489)
!1503 = !DILocation(line: 448, column: 58, scope: !1489)
!1504 = !DILocation(line: 448, column: 56, scope: !1489)
!1505 = !DILocation(line: 448, column: 78, scope: !1489)
!1506 = !DILocation(line: 447, column: 9, scope: !1489)
!1507 = !DILocalVariable(name: "i", scope: !1508, file: !88, line: 451, type: !51)
!1508 = distinct !DILexicalBlock(scope: !1489, file: !88, line: 451, column: 9)
!1509 = !DILocation(line: 451, column: 18, scope: !1508)
!1510 = !DILocation(line: 451, column: 14, scope: !1508)
!1511 = !DILocation(line: 451, column: 25, scope: !1512)
!1512 = distinct !DILexicalBlock(scope: !1508, file: !88, line: 451, column: 9)
!1513 = !DILocation(line: 451, column: 30, scope: !1512)
!1514 = !DILocation(line: 451, column: 38, scope: !1512)
!1515 = !DILocation(line: 451, column: 27, scope: !1512)
!1516 = !DILocation(line: 451, column: 9, scope: !1508)
!1517 = !DILocation(line: 452, column: 20, scope: !1518)
!1518 = distinct !DILexicalBlock(scope: !1512, file: !88, line: 451, column: 48)
!1519 = !DILocation(line: 452, column: 24, scope: !1518)
!1520 = !DILocation(line: 452, column: 28, scope: !1518)
!1521 = !DILocation(line: 452, column: 26, scope: !1518)
!1522 = !DILocation(line: 452, column: 22, scope: !1518)
!1523 = !DILocation(line: 452, column: 43, scope: !1518)
!1524 = !DILocation(line: 452, column: 50, scope: !1518)
!1525 = !DILocation(line: 452, column: 54, scope: !1518)
!1526 = !DILocation(line: 452, column: 52, scope: !1518)
!1527 = !DILocation(line: 452, column: 48, scope: !1518)
!1528 = !DILocation(line: 452, column: 63, scope: !1518)
!1529 = !DILocation(line: 452, column: 13, scope: !1518)
!1530 = !DILocation(line: 453, column: 9, scope: !1518)
!1531 = !DILocation(line: 451, column: 43, scope: !1512)
!1532 = !DILocation(line: 451, column: 9, scope: !1512)
!1533 = distinct !{!1533, !1516, !1534, !165}
!1534 = !DILocation(line: 453, column: 9, scope: !1508)
!1535 = !DILocation(line: 456, column: 27, scope: !1489)
!1536 = !DILocation(line: 456, column: 30, scope: !1489)
!1537 = !DILocation(line: 456, column: 36, scope: !1489)
!1538 = !DILocation(line: 456, column: 39, scope: !1489)
!1539 = !DILocation(line: 456, column: 43, scope: !1489)
!1540 = !DILocation(line: 456, column: 61, scope: !1489)
!1541 = !DILocation(line: 456, column: 9, scope: !1489)
!1542 = !DILocation(line: 458, column: 21, scope: !1489)
!1543 = !DILocation(line: 458, column: 36, scope: !1489)
!1544 = !DILocation(line: 458, column: 39, scope: !1489)
!1545 = !DILocation(line: 458, column: 42, scope: !1489)
!1546 = !DILocation(line: 458, column: 9, scope: !1489)
!1547 = !DILocation(line: 459, column: 19, scope: !1489)
!1548 = !DILocation(line: 459, column: 22, scope: !1489)
!1549 = !DILocation(line: 459, column: 28, scope: !1489)
!1550 = !DILocation(line: 459, column: 9, scope: !1489)
!1551 = !DILocalVariable(name: "i", scope: !1552, file: !88, line: 461, type: !51)
!1552 = distinct !DILexicalBlock(scope: !1489, file: !88, line: 461, column: 9)
!1553 = !DILocation(line: 461, column: 18, scope: !1552)
!1554 = !DILocation(line: 461, column: 14, scope: !1552)
!1555 = !DILocation(line: 461, column: 25, scope: !1556)
!1556 = distinct !DILexicalBlock(scope: !1552, file: !88, line: 461, column: 9)
!1557 = !DILocation(line: 461, column: 29, scope: !1556)
!1558 = !DILocation(line: 461, column: 27, scope: !1556)
!1559 = !DILocation(line: 461, column: 9, scope: !1552)
!1560 = !DILocation(line: 463, column: 18, scope: !1561)
!1561 = distinct !DILexicalBlock(scope: !1556, file: !88, line: 462, column: 9)
!1562 = !DILocation(line: 463, column: 17, scope: !1561)
!1563 = !DILocation(line: 463, column: 22, scope: !1561)
!1564 = !DILocation(line: 463, column: 30, scope: !1561)
!1565 = !DILocation(line: 463, column: 29, scope: !1561)
!1566 = !DILocation(line: 463, column: 38, scope: !1561)
!1567 = !DILocation(line: 463, column: 20, scope: !1561)
!1568 = !DILocation(line: 463, column: 43, scope: !1561)
!1569 = !DILocation(line: 463, column: 13, scope: !1561)
!1570 = !DILocation(line: 463, column: 48, scope: !1561)
!1571 = !DILocation(line: 464, column: 9, scope: !1561)
!1572 = !DILocation(line: 461, column: 39, scope: !1556)
!1573 = !DILocation(line: 461, column: 9, scope: !1556)
!1574 = distinct !{!1574, !1559, !1575, !165}
!1575 = !DILocation(line: 464, column: 9, scope: !1552)
!1576 = !DILocation(line: 466, column: 16, scope: !1489)
!1577 = !DILocation(line: 466, column: 20, scope: !1489)
!1578 = !DILocation(line: 466, column: 30, scope: !1489)
!1579 = !DILocation(line: 466, column: 28, scope: !1489)
!1580 = !DILocation(line: 466, column: 18, scope: !1489)
!1581 = !DILocation(line: 466, column: 45, scope: !1489)
!1582 = !DILocation(line: 467, column: 16, scope: !1489)
!1583 = !DILocation(line: 468, column: 16, scope: !1489)
!1584 = !DILocation(line: 467, column: 24, scope: !1489)
!1585 = !DILocation(line: 466, column: 9, scope: !1489)
!1586 = !DILocation(line: 470, column: 29, scope: !1587)
!1587 = distinct !DILexicalBlock(scope: !1489, file: !88, line: 470, column: 13)
!1588 = !DILocation(line: 470, column: 32, scope: !1587)
!1589 = !DILocation(line: 470, column: 35, scope: !1587)
!1590 = !DILocation(line: 470, column: 38, scope: !1587)
!1591 = !DILocation(line: 470, column: 41, scope: !1587)
!1592 = !DILocation(line: 470, column: 44, scope: !1587)
!1593 = !DILocation(line: 470, column: 53, scope: !1587)
!1594 = !DILocation(line: 470, column: 62, scope: !1587)
!1595 = !DILocation(line: 470, column: 71, scope: !1587)
!1596 = !DILocation(line: 470, column: 13, scope: !1587)
!1597 = !DILocation(line: 471, column: 13, scope: !1598)
!1598 = distinct !DILexicalBlock(scope: !1587, file: !88, line: 470, column: 86)
!1599 = !DILocation(line: 473, column: 20, scope: !1600)
!1600 = distinct !DILexicalBlock(scope: !1587, file: !88, line: 472, column: 16)
!1601 = !DILocation(line: 473, column: 13, scope: !1600)
!1602 = !DILocation(line: 474, column: 20, scope: !1600)
!1603 = !DILocation(line: 474, column: 13, scope: !1600)
!1604 = !DILocation(line: 476, column: 5, scope: !1489)
!1605 = !DILocation(line: 444, column: 35, scope: !1485)
!1606 = !DILocation(line: 444, column: 5, scope: !1485)
!1607 = distinct !{!1607, !1487, !1608, !165}
!1608 = !DILocation(line: 476, column: 5, scope: !1481)
!1609 = !DILocalVariable(name: "i", scope: !1610, file: !88, line: 478, type: !51)
!1610 = distinct !DILexicalBlock(scope: !1282, file: !88, line: 478, column: 5)
!1611 = !DILocation(line: 478, column: 14, scope: !1610)
!1612 = !DILocation(line: 478, column: 10, scope: !1610)
!1613 = !DILocation(line: 478, column: 21, scope: !1614)
!1614 = distinct !DILexicalBlock(scope: !1610, file: !88, line: 478, column: 5)
!1615 = !DILocation(line: 478, column: 26, scope: !1614)
!1616 = !DILocation(line: 478, column: 34, scope: !1614)
!1617 = !DILocation(line: 478, column: 23, scope: !1614)
!1618 = !DILocation(line: 478, column: 5, scope: !1610)
!1619 = !DILocation(line: 479, column: 14, scope: !1620)
!1620 = distinct !DILexicalBlock(scope: !1614, file: !88, line: 478, column: 44)
!1621 = !DILocation(line: 479, column: 21, scope: !1620)
!1622 = !DILocation(line: 479, column: 26, scope: !1620)
!1623 = !DILocation(line: 479, column: 36, scope: !1620)
!1624 = !DILocation(line: 479, column: 34, scope: !1620)
!1625 = !DILocation(line: 479, column: 23, scope: !1620)
!1626 = !DILocation(line: 479, column: 19, scope: !1620)
!1627 = !DILocation(line: 479, column: 12, scope: !1620)
!1628 = !DILocation(line: 480, column: 20, scope: !1620)
!1629 = !DILocation(line: 480, column: 17, scope: !1620)
!1630 = !DILocation(line: 480, column: 23, scope: !1620)
!1631 = !DILocation(line: 480, column: 27, scope: !1620)
!1632 = !DILocation(line: 480, column: 31, scope: !1620)
!1633 = !DILocation(line: 480, column: 29, scope: !1620)
!1634 = !DILocation(line: 480, column: 25, scope: !1620)
!1635 = !DILocation(line: 480, column: 40, scope: !1620)
!1636 = !DILocation(line: 480, column: 44, scope: !1620)
!1637 = !DILocation(line: 480, column: 53, scope: !1620)
!1638 = !DILocation(line: 480, column: 63, scope: !1620)
!1639 = !DILocation(line: 480, column: 61, scope: !1620)
!1640 = !DILocation(line: 480, column: 9, scope: !1620)
!1641 = !DILocation(line: 481, column: 17, scope: !1620)
!1642 = !DILocation(line: 481, column: 21, scope: !1620)
!1643 = !DILocation(line: 481, column: 25, scope: !1620)
!1644 = !DILocation(line: 481, column: 29, scope: !1620)
!1645 = !DILocation(line: 481, column: 33, scope: !1620)
!1646 = !DILocation(line: 481, column: 31, scope: !1620)
!1647 = !DILocation(line: 481, column: 27, scope: !1620)
!1648 = !DILocation(line: 481, column: 42, scope: !1620)
!1649 = !DILocation(line: 481, column: 52, scope: !1620)
!1650 = !DILocation(line: 481, column: 50, scope: !1620)
!1651 = !DILocation(line: 481, column: 9, scope: !1620)
!1652 = !DILocation(line: 482, column: 16, scope: !1620)
!1653 = !DILocation(line: 482, column: 20, scope: !1620)
!1654 = !DILocation(line: 482, column: 24, scope: !1620)
!1655 = !DILocation(line: 482, column: 22, scope: !1620)
!1656 = !DILocation(line: 482, column: 18, scope: !1620)
!1657 = !DILocation(line: 482, column: 35, scope: !1620)
!1658 = !DILocation(line: 482, column: 45, scope: !1620)
!1659 = !DILocation(line: 482, column: 43, scope: !1620)
!1660 = !DILocation(line: 482, column: 32, scope: !1620)
!1661 = !DILocation(line: 482, column: 55, scope: !1620)
!1662 = !DILocation(line: 482, column: 59, scope: !1620)
!1663 = !DILocation(line: 482, column: 63, scope: !1620)
!1664 = !DILocation(line: 482, column: 61, scope: !1620)
!1665 = !DILocation(line: 482, column: 57, scope: !1620)
!1666 = !DILocation(line: 482, column: 72, scope: !1620)
!1667 = !DILocation(line: 482, column: 9, scope: !1620)
!1668 = !DILocation(line: 483, column: 5, scope: !1620)
!1669 = !DILocation(line: 478, column: 39, scope: !1614)
!1670 = !DILocation(line: 478, column: 5, scope: !1614)
!1671 = distinct !{!1671, !1618, !1672, !165}
!1672 = !DILocation(line: 483, column: 5, scope: !1610)
!1673 = !DILocation(line: 484, column: 12, scope: !1282)
!1674 = !DILocation(line: 484, column: 15, scope: !1282)
!1675 = !DILocation(line: 484, column: 20, scope: !1282)
!1676 = !DILocation(line: 484, column: 30, scope: !1282)
!1677 = !DILocation(line: 484, column: 28, scope: !1282)
!1678 = !DILocation(line: 484, column: 5, scope: !1282)
!1679 = !DILocation(line: 486, column: 12, scope: !1282)
!1680 = !DILocation(line: 486, column: 18, scope: !1282)
!1681 = !DILocation(line: 486, column: 16, scope: !1282)
!1682 = !DILocation(line: 486, column: 36, scope: !1282)
!1683 = !DILocation(line: 486, column: 34, scope: !1282)
!1684 = !DILocation(line: 486, column: 54, scope: !1282)
!1685 = !DILocation(line: 486, column: 60, scope: !1282)
!1686 = !DILocation(line: 486, column: 5, scope: !1282)
!1687 = !DILocation(line: 487, column: 15, scope: !1282)
!1688 = !DILocation(line: 487, column: 6, scope: !1282)
!1689 = !DILocation(line: 487, column: 13, scope: !1282)
!1690 = !DILocation(line: 487, column: 5, scope: !1282)
!1691 = !DILabel(scope: !1282, name: "err", file: !88, line: 489)
!1692 = !DILocation(line: 489, column: 1, scope: !1282)
!1693 = !DILocation(line: 490, column: 23, scope: !1282)
!1694 = !DILocation(line: 490, column: 5, scope: !1282)
!1695 = !DILocation(line: 491, column: 23, scope: !1282)
!1696 = !DILocation(line: 491, column: 5, scope: !1282)
!1697 = !DILocation(line: 492, column: 23, scope: !1282)
!1698 = !DILocation(line: 492, column: 5, scope: !1282)
!1699 = !DILocation(line: 493, column: 23, scope: !1282)
!1700 = !DILocation(line: 493, column: 5, scope: !1282)
!1701 = !DILocation(line: 494, column: 26, scope: !1282)
!1702 = !DILocation(line: 494, column: 23, scope: !1282)
!1703 = !DILocation(line: 494, column: 5, scope: !1282)
!1704 = !DILocation(line: 495, column: 5, scope: !1282)
!1705 = !DILocation(line: 496, column: 23, scope: !1282)
!1706 = !DILocation(line: 496, column: 5, scope: !1282)
!1707 = !DILocation(line: 497, column: 23, scope: !1282)
!1708 = !DILocation(line: 497, column: 5, scope: !1282)
!1709 = !DILocation(line: 498, column: 23, scope: !1282)
!1710 = !DILocation(line: 498, column: 5, scope: !1282)
!1711 = !DILocation(line: 499, column: 12, scope: !1282)
!1712 = !DILocation(line: 499, column: 5, scope: !1282)
!1713 = distinct !DISubprogram(name: "compute_M_and_VPV", scope: !606, file: !606, line: 244, type: !1714, scopeLine: 244, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !91)
!1714 = !DISubroutineType(types: !1715)
!1715 = !{null, !345, !60, !609, !609, !81, !81}
!1716 = !DILocalVariable(name: "p", arg: 1, scope: !1713, file: !606, line: 244, type: !345)
!1717 = !DILocation(line: 244, column: 45, scope: !1713)
!1718 = !DILocalVariable(name: "Vdec", arg: 2, scope: !1713, file: !606, line: 244, type: !60)
!1719 = !DILocation(line: 244, column: 69, scope: !1713)
!1720 = !DILocalVariable(name: "L", arg: 3, scope: !1713, file: !606, line: 244, type: !609)
!1721 = !DILocation(line: 244, column: 91, scope: !1713)
!1722 = !DILocalVariable(name: "P1", arg: 4, scope: !1713, file: !606, line: 244, type: !609)
!1723 = !DILocation(line: 244, column: 110, scope: !1713)
!1724 = !DILocalVariable(name: "VL", arg: 5, scope: !1713, file: !606, line: 244, type: !81)
!1725 = !DILocation(line: 244, column: 124, scope: !1713)
!1726 = !DILocalVariable(name: "VP1V", arg: 6, scope: !1713, file: !606, line: 244, type: !81)
!1727 = !DILocation(line: 244, column: 138, scope: !1713)
!1728 = !DILocalVariable(name: "param_k", scope: !1713, file: !606, line: 246, type: !426)
!1729 = !DILocation(line: 246, column: 15, scope: !1713)
!1730 = !DILocation(line: 246, column: 25, scope: !1713)
!1731 = !DILocalVariable(name: "param_v", scope: !1713, file: !606, line: 247, type: !426)
!1732 = !DILocation(line: 247, column: 15, scope: !1713)
!1733 = !DILocation(line: 247, column: 25, scope: !1713)
!1734 = !DILocalVariable(name: "param_o", scope: !1713, file: !606, line: 248, type: !426)
!1735 = !DILocation(line: 248, column: 15, scope: !1713)
!1736 = !DILocation(line: 248, column: 25, scope: !1713)
!1737 = !DILocation(line: 251, column: 25, scope: !1713)
!1738 = !DILocation(line: 251, column: 47, scope: !1713)
!1739 = !DILocation(line: 251, column: 53, scope: !1713)
!1740 = !DILocation(line: 251, column: 56, scope: !1713)
!1741 = !DILocation(line: 251, column: 60, scope: !1713)
!1742 = !DILocation(line: 251, column: 69, scope: !1713)
!1743 = !DILocation(line: 251, column: 78, scope: !1713)
!1744 = !DILocation(line: 251, column: 5, scope: !1713)
!1745 = !DILocalVariable(name: "Pv", scope: !1713, file: !606, line: 254, type: !1746)
!1746 = !DICompositeType(tag: DW_TAG_array_type, baseType: !46, size: 981504, elements: !1747)
!1747 = !{!1748}
!1748 = !DISubrange(count: 15336)
!1749 = !DILocation(line: 254, column: 14, scope: !1713)
!1750 = !DILocation(line: 255, column: 17, scope: !1713)
!1751 = !DILocation(line: 255, column: 20, scope: !1713)
!1752 = !DILocation(line: 255, column: 24, scope: !1713)
!1753 = !DILocation(line: 255, column: 30, scope: !1713)
!1754 = !DILocation(line: 255, column: 5, scope: !1713)
!1755 = !DILocation(line: 256, column: 25, scope: !1713)
!1756 = !DILocation(line: 256, column: 47, scope: !1713)
!1757 = !DILocation(line: 256, column: 53, scope: !1713)
!1758 = !DILocation(line: 256, column: 57, scope: !1713)
!1759 = !DILocation(line: 256, column: 63, scope: !1713)
!1760 = !DILocation(line: 256, column: 72, scope: !1713)
!1761 = !DILocation(line: 256, column: 81, scope: !1713)
!1762 = !DILocation(line: 256, column: 5, scope: !1713)
!1763 = !DILocation(line: 257, column: 1, scope: !1713)
!1764 = distinct !DISubprogram(name: "compute_rhs", scope: !88, file: !88, line: 43, type: !1765, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !91)
!1765 = !DISubroutineType(types: !1766)
!1766 = !{null, !345, !81, !60, !55}
!1767 = !DILocalVariable(name: "p", arg: 1, scope: !1764, file: !88, line: 43, type: !345)
!1768 = !DILocation(line: 43, column: 46, scope: !1764)
!1769 = !DILocalVariable(name: "vPv", arg: 2, scope: !1764, file: !88, line: 43, type: !81)
!1770 = !DILocation(line: 43, column: 59, scope: !1764)
!1771 = !DILocalVariable(name: "t", arg: 3, scope: !1764, file: !88, line: 43, type: !60)
!1772 = !DILocation(line: 43, column: 85, scope: !1764)
!1773 = !DILocalVariable(name: "y", arg: 4, scope: !1764, file: !88, line: 43, type: !55)
!1774 = !DILocation(line: 43, column: 103, scope: !1764)
!1775 = !DILocalVariable(name: "top_pos", scope: !1764, file: !88, line: 48, type: !1776)
!1776 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !82)
!1777 = !DILocation(line: 48, column: 18, scope: !1764)
!1778 = !DILocation(line: 48, column: 30, scope: !1764)
!1779 = !DILocation(line: 48, column: 41, scope: !1764)
!1780 = !DILocation(line: 48, column: 46, scope: !1764)
!1781 = !DILocation(line: 48, column: 52, scope: !1764)
!1782 = !DILocalVariable(name: "m_vec_limbs", scope: !1764, file: !88, line: 49, type: !1776)
!1783 = !DILocation(line: 49, column: 18, scope: !1764)
!1784 = !DILocation(line: 49, column: 32, scope: !1764)
!1785 = !DILocation(line: 52, column: 8, scope: !1786)
!1786 = distinct !DILexicalBlock(scope: !1764, file: !88, line: 52, column: 8)
!1787 = !DILocation(line: 52, column: 19, scope: !1786)
!1788 = !DILocation(line: 52, column: 24, scope: !1786)
!1789 = !DILocalVariable(name: "mask", scope: !1790, file: !88, line: 53, type: !46)
!1790 = distinct !DILexicalBlock(scope: !1786, file: !88, line: 52, column: 29)
!1791 = !DILocation(line: 53, column: 18, scope: !1790)
!1792 = !DILocation(line: 54, column: 20, scope: !1790)
!1793 = !DILocation(line: 54, column: 31, scope: !1790)
!1794 = !DILocation(line: 54, column: 36, scope: !1790)
!1795 = !DILocation(line: 54, column: 14, scope: !1790)
!1796 = !DILocation(line: 55, column: 14, scope: !1790)
!1797 = !DILocalVariable(name: "i", scope: !1798, file: !88, line: 56, type: !51)
!1798 = distinct !DILexicalBlock(scope: !1790, file: !88, line: 56, column: 9)
!1799 = !DILocation(line: 56, column: 18, scope: !1798)
!1800 = !DILocation(line: 56, column: 14, scope: !1798)
!1801 = !DILocation(line: 56, column: 25, scope: !1802)
!1802 = distinct !DILexicalBlock(scope: !1798, file: !88, line: 56, column: 9)
!1803 = !DILocation(line: 56, column: 29, scope: !1802)
!1804 = !DILocation(line: 56, column: 40, scope: !1802)
!1805 = !DILocation(line: 56, column: 39, scope: !1802)
!1806 = !DILocation(line: 56, column: 27, scope: !1802)
!1807 = !DILocation(line: 56, column: 9, scope: !1798)
!1808 = !DILocation(line: 58, column: 53, scope: !1809)
!1809 = distinct !DILexicalBlock(scope: !1802, file: !88, line: 57, column: 9)
!1810 = !DILocation(line: 58, column: 13, scope: !1809)
!1811 = !DILocation(line: 58, column: 17, scope: !1809)
!1812 = !DILocation(line: 58, column: 19, scope: !1809)
!1813 = !DILocation(line: 58, column: 18, scope: !1809)
!1814 = !DILocation(line: 58, column: 33, scope: !1809)
!1815 = !DILocation(line: 58, column: 31, scope: !1809)
!1816 = !DILocation(line: 58, column: 45, scope: !1809)
!1817 = !DILocation(line: 58, column: 50, scope: !1809)
!1818 = !DILocation(line: 59, column: 9, scope: !1809)
!1819 = !DILocation(line: 56, column: 53, scope: !1802)
!1820 = !DILocation(line: 56, column: 9, scope: !1802)
!1821 = distinct !{!1821, !1807, !1822, !165}
!1822 = !DILocation(line: 59, column: 9, scope: !1798)
!1823 = !DILocation(line: 60, column: 5, scope: !1790)
!1824 = !DILocalVariable(name: "temp", scope: !1764, file: !88, line: 62, type: !1035)
!1825 = !DILocation(line: 62, column: 14, scope: !1764)
!1826 = !DILocalVariable(name: "temp_bytes", scope: !1764, file: !88, line: 63, type: !55)
!1827 = !DILocation(line: 63, column: 20, scope: !1764)
!1828 = !DILocation(line: 63, column: 51, scope: !1764)
!1829 = !DILocalVariable(name: "i", scope: !1830, file: !88, line: 64, type: !51)
!1830 = distinct !DILexicalBlock(scope: !1764, file: !88, line: 64, column: 5)
!1831 = !DILocation(line: 64, column: 14, scope: !1830)
!1832 = !DILocation(line: 64, column: 18, scope: !1830)
!1833 = !DILocation(line: 64, column: 29, scope: !1830)
!1834 = !DILocation(line: 64, column: 10, scope: !1830)
!1835 = !DILocation(line: 64, column: 34, scope: !1836)
!1836 = distinct !DILexicalBlock(scope: !1830, file: !88, line: 64, column: 5)
!1837 = !DILocation(line: 64, column: 36, scope: !1836)
!1838 = !DILocation(line: 64, column: 5, scope: !1830)
!1839 = !DILocalVariable(name: "j", scope: !1840, file: !88, line: 65, type: !51)
!1840 = distinct !DILexicalBlock(scope: !1841, file: !88, line: 65, column: 9)
!1841 = distinct !DILexicalBlock(scope: !1836, file: !88, line: 64, column: 48)
!1842 = !DILocation(line: 65, column: 18, scope: !1840)
!1843 = !DILocation(line: 65, column: 22, scope: !1840)
!1844 = !DILocation(line: 65, column: 14, scope: !1840)
!1845 = !DILocation(line: 65, column: 25, scope: !1846)
!1846 = distinct !DILexicalBlock(scope: !1840, file: !88, line: 65, column: 9)
!1847 = !DILocation(line: 65, column: 29, scope: !1846)
!1848 = !DILocation(line: 65, column: 27, scope: !1846)
!1849 = !DILocation(line: 65, column: 9, scope: !1840)
!1850 = !DILocalVariable(name: "top", scope: !1851, file: !88, line: 67, type: !56)
!1851 = distinct !DILexicalBlock(scope: !1846, file: !88, line: 65, column: 46)
!1852 = !DILocation(line: 67, column: 27, scope: !1851)
!1853 = !DILocation(line: 67, column: 39, scope: !1851)
!1854 = !DILocation(line: 67, column: 50, scope: !1851)
!1855 = !DILocation(line: 67, column: 34, scope: !1851)
!1856 = !DILocation(line: 67, column: 57, scope: !1851)
!1857 = !DILocation(line: 67, column: 54, scope: !1851)
!1858 = !DILocation(line: 67, column: 66, scope: !1851)
!1859 = !DILocation(line: 67, column: 33, scope: !1851)
!1860 = !DILocation(line: 68, column: 18, scope: !1851)
!1861 = !DILocation(line: 68, column: 29, scope: !1851)
!1862 = !DILocation(line: 68, column: 13, scope: !1851)
!1863 = !DILocation(line: 68, column: 33, scope: !1851)
!1864 = !DILocalVariable(name: "k", scope: !1865, file: !88, line: 69, type: !51)
!1865 = distinct !DILexicalBlock(scope: !1851, file: !88, line: 69, column: 13)
!1866 = !DILocation(line: 69, column: 21, scope: !1865)
!1867 = !DILocation(line: 69, column: 25, scope: !1865)
!1868 = !DILocation(line: 69, column: 37, scope: !1865)
!1869 = !DILocation(line: 69, column: 17, scope: !1865)
!1870 = !DILocation(line: 69, column: 42, scope: !1871)
!1871 = distinct !DILexicalBlock(scope: !1865, file: !88, line: 69, column: 13)
!1872 = !DILocation(line: 69, column: 43, scope: !1871)
!1873 = !DILocation(line: 69, column: 13, scope: !1865)
!1874 = !DILocation(line: 70, column: 35, scope: !1875)
!1875 = distinct !DILexicalBlock(scope: !1871, file: !88, line: 69, column: 52)
!1876 = !DILocation(line: 70, column: 30, scope: !1875)
!1877 = !DILocation(line: 70, column: 38, scope: !1875)
!1878 = !DILocation(line: 70, column: 22, scope: !1875)
!1879 = !DILocation(line: 70, column: 23, scope: !1875)
!1880 = !DILocation(line: 70, column: 17, scope: !1875)
!1881 = !DILocation(line: 70, column: 27, scope: !1875)
!1882 = !DILocation(line: 71, column: 22, scope: !1875)
!1883 = !DILocation(line: 71, column: 17, scope: !1875)
!1884 = !DILocation(line: 71, column: 25, scope: !1875)
!1885 = !DILocation(line: 72, column: 13, scope: !1875)
!1886 = !DILocation(line: 69, column: 49, scope: !1871)
!1887 = !DILocation(line: 69, column: 13, scope: !1871)
!1888 = distinct !{!1888, !1873, !1889, !165}
!1889 = !DILocation(line: 72, column: 13, scope: !1865)
!1890 = !DILocalVariable(name: "jj", scope: !1891, file: !88, line: 74, type: !51)
!1891 = distinct !DILexicalBlock(scope: !1851, file: !88, line: 74, column: 13)
!1892 = !DILocation(line: 74, column: 22, scope: !1891)
!1893 = !DILocation(line: 74, column: 18, scope: !1891)
!1894 = !DILocation(line: 74, column: 30, scope: !1895)
!1895 = distinct !DILexicalBlock(scope: !1891, file: !88, line: 74, column: 13)
!1896 = !DILocation(line: 74, column: 33, scope: !1895)
!1897 = !DILocation(line: 74, column: 13, scope: !1891)
!1898 = !DILocation(line: 75, column: 20, scope: !1899)
!1899 = distinct !DILexicalBlock(scope: !1900, file: !88, line: 75, column: 20)
!1900 = distinct !DILexicalBlock(scope: !1895, file: !88, line: 74, column: 53)
!1901 = !DILocation(line: 75, column: 22, scope: !1899)
!1902 = !DILocation(line: 75, column: 25, scope: !1899)
!1903 = !DILocation(line: 79, column: 47, scope: !1904)
!1904 = distinct !DILexicalBlock(scope: !1899, file: !88, line: 75, column: 30)
!1905 = !DILocation(line: 79, column: 52, scope: !1904)
!1906 = !DILocation(line: 79, column: 68, scope: !1904)
!1907 = !DILocation(line: 79, column: 41, scope: !1904)
!1908 = !DILocation(line: 79, column: 21, scope: !1904)
!1909 = !DILocation(line: 79, column: 32, scope: !1904)
!1910 = !DILocation(line: 79, column: 34, scope: !1904)
!1911 = !DILocation(line: 79, column: 38, scope: !1904)
!1912 = !DILocation(line: 81, column: 17, scope: !1904)
!1913 = !DILocation(line: 86, column: 47, scope: !1914)
!1914 = distinct !DILexicalBlock(scope: !1899, file: !88, line: 82, column: 22)
!1915 = !DILocation(line: 86, column: 52, scope: !1914)
!1916 = !DILocation(line: 86, column: 68, scope: !1914)
!1917 = !DILocation(line: 86, column: 41, scope: !1914)
!1918 = !DILocation(line: 86, column: 73, scope: !1914)
!1919 = !DILocation(line: 86, column: 21, scope: !1914)
!1920 = !DILocation(line: 86, column: 32, scope: !1914)
!1921 = !DILocation(line: 86, column: 34, scope: !1914)
!1922 = !DILocation(line: 86, column: 38, scope: !1914)
!1923 = !DILocation(line: 89, column: 13, scope: !1900)
!1924 = !DILocation(line: 74, column: 49, scope: !1895)
!1925 = !DILocation(line: 74, column: 13, scope: !1895)
!1926 = distinct !{!1926, !1897, !1927, !165}
!1927 = !DILocation(line: 89, column: 13, scope: !1891)
!1928 = !DILocalVariable(name: "k", scope: !1929, file: !88, line: 92, type: !82)
!1929 = distinct !DILexicalBlock(scope: !1851, file: !88, line: 92, column: 13)
!1930 = !DILocation(line: 92, column: 24, scope: !1929)
!1931 = !DILocation(line: 92, column: 17, scope: !1929)
!1932 = !DILocation(line: 92, column: 29, scope: !1933)
!1933 = distinct !DILexicalBlock(scope: !1929, file: !88, line: 92, column: 13)
!1934 = !DILocation(line: 92, column: 33, scope: !1933)
!1935 = !DILocation(line: 92, column: 31, scope: !1933)
!1936 = !DILocation(line: 92, column: 13, scope: !1929)
!1937 = !DILocation(line: 93, column: 28, scope: !1938)
!1938 = distinct !DILexicalBlock(scope: !1933, file: !88, line: 92, column: 51)
!1939 = !DILocation(line: 93, column: 34, scope: !1938)
!1940 = !DILocation(line: 93, column: 38, scope: !1938)
!1941 = !DILocation(line: 93, column: 36, scope: !1938)
!1942 = !DILocation(line: 93, column: 51, scope: !1938)
!1943 = !DILocation(line: 93, column: 49, scope: !1938)
!1944 = !DILocation(line: 93, column: 56, scope: !1938)
!1945 = !DILocation(line: 93, column: 54, scope: !1938)
!1946 = !DILocation(line: 93, column: 70, scope: !1938)
!1947 = !DILocation(line: 93, column: 68, scope: !1938)
!1948 = !DILocation(line: 93, column: 77, scope: !1938)
!1949 = !DILocation(line: 93, column: 80, scope: !1938)
!1950 = !DILocation(line: 93, column: 78, scope: !1938)
!1951 = !DILocation(line: 93, column: 76, scope: !1938)
!1952 = !DILocation(line: 93, column: 83, scope: !1938)
!1953 = !DILocation(line: 93, column: 89, scope: !1938)
!1954 = !DILocation(line: 93, column: 93, scope: !1938)
!1955 = !DILocation(line: 93, column: 91, scope: !1938)
!1956 = !DILocation(line: 93, column: 106, scope: !1938)
!1957 = !DILocation(line: 93, column: 104, scope: !1938)
!1958 = !DILocation(line: 93, column: 111, scope: !1938)
!1959 = !DILocation(line: 93, column: 109, scope: !1938)
!1960 = !DILocation(line: 93, column: 125, scope: !1938)
!1961 = !DILocation(line: 93, column: 123, scope: !1938)
!1962 = !DILocation(line: 93, column: 82, scope: !1938)
!1963 = !DILocation(line: 93, column: 73, scope: !1938)
!1964 = !DILocation(line: 93, column: 22, scope: !1938)
!1965 = !DILocation(line: 93, column: 17, scope: !1938)
!1966 = !DILocation(line: 93, column: 25, scope: !1938)
!1967 = !DILocation(line: 94, column: 13, scope: !1938)
!1968 = !DILocation(line: 92, column: 48, scope: !1933)
!1969 = !DILocation(line: 92, column: 13, scope: !1933)
!1970 = distinct !{!1970, !1936, !1971, !165}
!1971 = !DILocation(line: 94, column: 13, scope: !1929)
!1972 = !DILocation(line: 95, column: 9, scope: !1851)
!1973 = !DILocation(line: 65, column: 42, scope: !1846)
!1974 = !DILocation(line: 65, column: 9, scope: !1846)
!1975 = distinct !{!1975, !1849, !1976, !165}
!1976 = !DILocation(line: 95, column: 9, scope: !1840)
!1977 = !DILocation(line: 96, column: 5, scope: !1841)
!1978 = !DILocation(line: 64, column: 44, scope: !1836)
!1979 = !DILocation(line: 64, column: 5, scope: !1836)
!1980 = distinct !{!1980, !1838, !1981, !165}
!1981 = !DILocation(line: 96, column: 5, scope: !1830)
!1982 = !DILocalVariable(name: "i", scope: !1983, file: !88, line: 99, type: !51)
!1983 = distinct !DILexicalBlock(scope: !1764, file: !88, line: 99, column: 5)
!1984 = !DILocation(line: 99, column: 14, scope: !1983)
!1985 = !DILocation(line: 99, column: 10, scope: !1983)
!1986 = !DILocation(line: 99, column: 21, scope: !1987)
!1987 = distinct !DILexicalBlock(scope: !1983, file: !88, line: 99, column: 5)
!1988 = !DILocation(line: 99, column: 25, scope: !1987)
!1989 = !DILocation(line: 99, column: 23, scope: !1987)
!1990 = !DILocation(line: 99, column: 5, scope: !1983)
!1991 = !DILocation(line: 105, column: 18, scope: !1992)
!1992 = distinct !DILexicalBlock(scope: !1987, file: !88, line: 100, column: 5)
!1993 = !DILocation(line: 105, column: 20, scope: !1992)
!1994 = !DILocation(line: 105, column: 28, scope: !1992)
!1995 = !DILocation(line: 105, column: 39, scope: !1992)
!1996 = !DILocation(line: 105, column: 40, scope: !1992)
!1997 = !DILocation(line: 105, column: 44, scope: !1992)
!1998 = !DILocation(line: 105, column: 25, scope: !1992)
!1999 = !DILocation(line: 105, column: 9, scope: !1992)
!2000 = !DILocation(line: 105, column: 11, scope: !1992)
!2001 = !DILocation(line: 105, column: 16, scope: !1992)
!2002 = !DILocation(line: 106, column: 18, scope: !1992)
!2003 = !DILocation(line: 106, column: 20, scope: !1992)
!2004 = !DILocation(line: 106, column: 21, scope: !1992)
!2005 = !DILocation(line: 106, column: 28, scope: !1992)
!2006 = !DILocation(line: 106, column: 39, scope: !1992)
!2007 = !DILocation(line: 106, column: 40, scope: !1992)
!2008 = !DILocation(line: 106, column: 44, scope: !1992)
!2009 = !DILocation(line: 106, column: 25, scope: !1992)
!2010 = !DILocation(line: 106, column: 9, scope: !1992)
!2011 = !DILocation(line: 106, column: 11, scope: !1992)
!2012 = !DILocation(line: 106, column: 12, scope: !1992)
!2013 = !DILocation(line: 106, column: 16, scope: !1992)
!2014 = !DILocation(line: 108, column: 5, scope: !1992)
!2015 = !DILocation(line: 99, column: 38, scope: !1987)
!2016 = !DILocation(line: 99, column: 5, scope: !1987)
!2017 = distinct !{!2017, !1990, !2018, !165}
!2018 = !DILocation(line: 108, column: 5, scope: !1983)
!2019 = !DILocation(line: 109, column: 1, scope: !1764)
!2020 = distinct !DISubprogram(name: "compute_A", scope: !88, file: !88, line: 154, type: !2021, scopeLine: 154, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !91)
!2021 = !DISubroutineType(types: !2022)
!2022 = !{null, !345, !81, !55}
!2023 = !DILocalVariable(name: "p", arg: 1, scope: !2020, file: !88, line: 154, type: !345)
!2024 = !DILocation(line: 154, column: 44, scope: !2020)
!2025 = !DILocalVariable(name: "VtL", arg: 2, scope: !2020, file: !88, line: 154, type: !81)
!2026 = !DILocation(line: 154, column: 57, scope: !2020)
!2027 = !DILocalVariable(name: "A_out", arg: 3, scope: !2020, file: !88, line: 154, type: !55)
!2028 = !DILocation(line: 154, column: 77, scope: !2020)
!2029 = !DILocalVariable(name: "bits_to_shift", scope: !2020, file: !88, line: 159, type: !51)
!2030 = !DILocation(line: 159, column: 9, scope: !2020)
!2031 = !DILocalVariable(name: "words_to_shift", scope: !2020, file: !88, line: 160, type: !51)
!2032 = !DILocation(line: 160, column: 9, scope: !2020)
!2033 = !DILocalVariable(name: "m_vec_limbs", scope: !2020, file: !88, line: 161, type: !426)
!2034 = !DILocation(line: 161, column: 15, scope: !2020)
!2035 = !DILocation(line: 161, column: 29, scope: !2020)
!2036 = !DILocalVariable(name: "A", scope: !2020, file: !88, line: 162, type: !2037)
!2037 = !DICompositeType(tag: DW_TAG_array_type, baseType: !46, size: 239616, elements: !2038)
!2038 = !{!2039}
!2039 = !DISubrange(count: 3744)
!2040 = !DILocation(line: 162, column: 14, scope: !2020)
!2041 = !DILocalVariable(name: "A_width", scope: !2020, file: !88, line: 163, type: !82)
!2042 = !DILocation(line: 163, column: 12, scope: !2020)
!2043 = !DILocation(line: 163, column: 24, scope: !2020)
!2044 = !DILocation(line: 163, column: 35, scope: !2020)
!2045 = !DILocation(line: 163, column: 34, scope: !2020)
!2046 = !DILocation(line: 163, column: 46, scope: !2020)
!2047 = !DILocation(line: 163, column: 51, scope: !2020)
!2048 = !DILocation(line: 163, column: 55, scope: !2020)
!2049 = !DILocalVariable(name: "Mi", scope: !2020, file: !88, line: 164, type: !609)
!2050 = !DILocation(line: 164, column: 21, scope: !2020)
!2051 = !DILocalVariable(name: "Mj", scope: !2020, file: !88, line: 164, type: !609)
!2052 = !DILocation(line: 164, column: 26, scope: !2020)
!2053 = !DILocation(line: 167, column: 8, scope: !2054)
!2054 = distinct !DILexicalBlock(scope: !2020, file: !88, line: 167, column: 8)
!2055 = !DILocation(line: 167, column: 19, scope: !2054)
!2056 = !DILocation(line: 167, column: 24, scope: !2054)
!2057 = !DILocalVariable(name: "mask", scope: !2058, file: !88, line: 168, type: !46)
!2058 = distinct !DILexicalBlock(scope: !2054, file: !88, line: 167, column: 29)
!2059 = !DILocation(line: 168, column: 18, scope: !2058)
!2060 = !DILocation(line: 169, column: 19, scope: !2058)
!2061 = !DILocation(line: 169, column: 30, scope: !2058)
!2062 = !DILocation(line: 169, column: 35, scope: !2058)
!2063 = !DILocation(line: 169, column: 14, scope: !2058)
!2064 = !DILocation(line: 170, column: 14, scope: !2058)
!2065 = !DILocalVariable(name: "i", scope: !2066, file: !88, line: 171, type: !51)
!2066 = distinct !DILexicalBlock(scope: !2058, file: !88, line: 171, column: 9)
!2067 = !DILocation(line: 171, column: 18, scope: !2066)
!2068 = !DILocation(line: 171, column: 14, scope: !2066)
!2069 = !DILocation(line: 171, column: 25, scope: !2070)
!2070 = distinct !DILexicalBlock(scope: !2066, file: !88, line: 171, column: 9)
!2071 = !DILocation(line: 171, column: 29, scope: !2070)
!2072 = !DILocation(line: 171, column: 40, scope: !2070)
!2073 = !DILocation(line: 171, column: 39, scope: !2070)
!2074 = !DILocation(line: 171, column: 27, scope: !2070)
!2075 = !DILocation(line: 171, column: 9, scope: !2066)
!2076 = !DILocation(line: 173, column: 53, scope: !2077)
!2077 = distinct !DILexicalBlock(scope: !2070, file: !88, line: 172, column: 9)
!2078 = !DILocation(line: 173, column: 13, scope: !2077)
!2079 = !DILocation(line: 173, column: 17, scope: !2077)
!2080 = !DILocation(line: 173, column: 19, scope: !2077)
!2081 = !DILocation(line: 173, column: 18, scope: !2077)
!2082 = !DILocation(line: 173, column: 33, scope: !2077)
!2083 = !DILocation(line: 173, column: 31, scope: !2077)
!2084 = !DILocation(line: 173, column: 45, scope: !2077)
!2085 = !DILocation(line: 173, column: 50, scope: !2077)
!2086 = !DILocation(line: 174, column: 9, scope: !2077)
!2087 = !DILocation(line: 171, column: 53, scope: !2070)
!2088 = !DILocation(line: 171, column: 9, scope: !2070)
!2089 = distinct !{!2089, !2075, !2090, !165}
!2090 = !DILocation(line: 174, column: 9, scope: !2066)
!2091 = !DILocation(line: 175, column: 5, scope: !2058)
!2092 = !DILocalVariable(name: "i", scope: !2093, file: !88, line: 177, type: !51)
!2093 = distinct !DILexicalBlock(scope: !2020, file: !88, line: 177, column: 5)
!2094 = !DILocation(line: 177, column: 14, scope: !2093)
!2095 = !DILocation(line: 177, column: 10, scope: !2093)
!2096 = !DILocation(line: 177, column: 21, scope: !2097)
!2097 = distinct !DILexicalBlock(scope: !2093, file: !88, line: 177, column: 5)
!2098 = !DILocation(line: 177, column: 26, scope: !2097)
!2099 = !DILocation(line: 177, column: 37, scope: !2097)
!2100 = !DILocation(line: 177, column: 23, scope: !2097)
!2101 = !DILocation(line: 177, column: 5, scope: !2093)
!2102 = !DILocalVariable(name: "j", scope: !2103, file: !88, line: 178, type: !51)
!2103 = distinct !DILexicalBlock(scope: !2104, file: !88, line: 178, column: 9)
!2104 = distinct !DILexicalBlock(scope: !2097, file: !88, line: 177, column: 47)
!2105 = !DILocation(line: 178, column: 18, scope: !2103)
!2106 = !DILocation(line: 178, column: 22, scope: !2103)
!2107 = !DILocation(line: 178, column: 33, scope: !2103)
!2108 = !DILocation(line: 178, column: 14, scope: !2103)
!2109 = !DILocation(line: 178, column: 38, scope: !2110)
!2110 = distinct !DILexicalBlock(scope: !2103, file: !88, line: 178, column: 9)
!2111 = !DILocation(line: 178, column: 43, scope: !2110)
!2112 = !DILocation(line: 178, column: 40, scope: !2110)
!2113 = !DILocation(line: 178, column: 9, scope: !2103)
!2114 = !DILocation(line: 180, column: 18, scope: !2115)
!2115 = distinct !DILexicalBlock(scope: !2110, file: !88, line: 178, column: 51)
!2116 = !DILocation(line: 180, column: 24, scope: !2115)
!2117 = !DILocation(line: 180, column: 28, scope: !2115)
!2118 = !DILocation(line: 180, column: 26, scope: !2115)
!2119 = !DILocation(line: 180, column: 42, scope: !2115)
!2120 = !DILocation(line: 180, column: 40, scope: !2115)
!2121 = !DILocation(line: 180, column: 22, scope: !2115)
!2122 = !DILocation(line: 180, column: 16, scope: !2115)
!2123 = !DILocalVariable(name: "c", scope: !2124, file: !88, line: 181, type: !51)
!2124 = distinct !DILexicalBlock(scope: !2115, file: !88, line: 181, column: 13)
!2125 = !DILocation(line: 181, column: 22, scope: !2124)
!2126 = !DILocation(line: 181, column: 18, scope: !2124)
!2127 = !DILocation(line: 181, column: 29, scope: !2128)
!2128 = distinct !DILexicalBlock(scope: !2124, file: !88, line: 181, column: 13)
!2129 = !DILocation(line: 181, column: 33, scope: !2128)
!2130 = !DILocation(line: 181, column: 31, scope: !2128)
!2131 = !DILocation(line: 181, column: 13, scope: !2124)
!2132 = !DILocalVariable(name: "k", scope: !2133, file: !88, line: 182, type: !51)
!2133 = distinct !DILexicalBlock(scope: !2134, file: !88, line: 182, column: 17)
!2134 = distinct !DILexicalBlock(scope: !2128, file: !88, line: 181, column: 50)
!2135 = !DILocation(line: 182, column: 26, scope: !2133)
!2136 = !DILocation(line: 182, column: 22, scope: !2133)
!2137 = !DILocation(line: 182, column: 33, scope: !2138)
!2138 = distinct !DILexicalBlock(scope: !2133, file: !88, line: 182, column: 17)
!2139 = !DILocation(line: 182, column: 37, scope: !2138)
!2140 = !DILocation(line: 182, column: 35, scope: !2138)
!2141 = !DILocation(line: 182, column: 17, scope: !2133)
!2142 = !DILocation(line: 184, column: 78, scope: !2143)
!2143 = distinct !DILexicalBlock(scope: !2138, file: !88, line: 183, column: 17)
!2144 = !DILocation(line: 184, column: 81, scope: !2143)
!2145 = !DILocation(line: 184, column: 85, scope: !2143)
!2146 = !DILocation(line: 184, column: 87, scope: !2143)
!2147 = !DILocation(line: 184, column: 86, scope: !2143)
!2148 = !DILocation(line: 184, column: 83, scope: !2143)
!2149 = !DILocation(line: 184, column: 103, scope: !2143)
!2150 = !DILocation(line: 184, column: 100, scope: !2143)
!2151 = !DILocation(line: 184, column: 24, scope: !2143)
!2152 = !DILocation(line: 184, column: 37, scope: !2143)
!2153 = !DILocation(line: 184, column: 35, scope: !2143)
!2154 = !DILocation(line: 184, column: 41, scope: !2143)
!2155 = !DILocation(line: 184, column: 39, scope: !2143)
!2156 = !DILocation(line: 184, column: 46, scope: !2143)
!2157 = !DILocation(line: 184, column: 50, scope: !2143)
!2158 = !DILocation(line: 184, column: 48, scope: !2143)
!2159 = !DILocation(line: 184, column: 66, scope: !2143)
!2160 = !DILocation(line: 184, column: 65, scope: !2143)
!2161 = !DILocation(line: 184, column: 43, scope: !2143)
!2162 = !DILocation(line: 184, column: 21, scope: !2143)
!2163 = !DILocation(line: 184, column: 75, scope: !2143)
!2164 = !DILocation(line: 185, column: 24, scope: !2165)
!2165 = distinct !DILexicalBlock(scope: !2143, file: !88, line: 185, column: 24)
!2166 = !DILocation(line: 185, column: 38, scope: !2165)
!2167 = !DILocation(line: 186, column: 86, scope: !2168)
!2168 = distinct !DILexicalBlock(scope: !2165, file: !88, line: 185, column: 42)
!2169 = !DILocation(line: 186, column: 89, scope: !2168)
!2170 = !DILocation(line: 186, column: 93, scope: !2168)
!2171 = !DILocation(line: 186, column: 95, scope: !2168)
!2172 = !DILocation(line: 186, column: 94, scope: !2168)
!2173 = !DILocation(line: 186, column: 91, scope: !2168)
!2174 = !DILocation(line: 186, column: 115, scope: !2168)
!2175 = !DILocation(line: 186, column: 114, scope: !2168)
!2176 = !DILocation(line: 186, column: 108, scope: !2168)
!2177 = !DILocation(line: 186, column: 28, scope: !2168)
!2178 = !DILocation(line: 186, column: 41, scope: !2168)
!2179 = !DILocation(line: 186, column: 39, scope: !2168)
!2180 = !DILocation(line: 186, column: 45, scope: !2168)
!2181 = !DILocation(line: 186, column: 43, scope: !2168)
!2182 = !DILocation(line: 186, column: 50, scope: !2168)
!2183 = !DILocation(line: 186, column: 54, scope: !2168)
!2184 = !DILocation(line: 186, column: 52, scope: !2168)
!2185 = !DILocation(line: 186, column: 69, scope: !2168)
!2186 = !DILocation(line: 186, column: 74, scope: !2168)
!2187 = !DILocation(line: 186, column: 73, scope: !2168)
!2188 = !DILocation(line: 186, column: 47, scope: !2168)
!2189 = !DILocation(line: 186, column: 25, scope: !2168)
!2190 = !DILocation(line: 186, column: 83, scope: !2168)
!2191 = !DILocation(line: 187, column: 21, scope: !2168)
!2192 = !DILocation(line: 188, column: 17, scope: !2143)
!2193 = !DILocation(line: 182, column: 51, scope: !2138)
!2194 = !DILocation(line: 182, column: 17, scope: !2138)
!2195 = distinct !{!2195, !2141, !2196, !165}
!2196 = !DILocation(line: 188, column: 17, scope: !2133)
!2197 = !DILocation(line: 189, column: 13, scope: !2134)
!2198 = !DILocation(line: 181, column: 46, scope: !2128)
!2199 = !DILocation(line: 181, column: 13, scope: !2128)
!2200 = distinct !{!2200, !2131, !2201, !165}
!2201 = !DILocation(line: 189, column: 13, scope: !2124)
!2202 = !DILocation(line: 191, column: 17, scope: !2203)
!2203 = distinct !DILexicalBlock(scope: !2115, file: !88, line: 191, column: 17)
!2204 = !DILocation(line: 191, column: 22, scope: !2203)
!2205 = !DILocation(line: 191, column: 19, scope: !2203)
!2206 = !DILocation(line: 192, column: 22, scope: !2207)
!2207 = distinct !DILexicalBlock(scope: !2203, file: !88, line: 191, column: 25)
!2208 = !DILocation(line: 192, column: 28, scope: !2207)
!2209 = !DILocation(line: 192, column: 32, scope: !2207)
!2210 = !DILocation(line: 192, column: 30, scope: !2207)
!2211 = !DILocation(line: 192, column: 46, scope: !2207)
!2212 = !DILocation(line: 192, column: 44, scope: !2207)
!2213 = !DILocation(line: 192, column: 26, scope: !2207)
!2214 = !DILocation(line: 192, column: 20, scope: !2207)
!2215 = !DILocalVariable(name: "c", scope: !2216, file: !88, line: 193, type: !51)
!2216 = distinct !DILexicalBlock(scope: !2207, file: !88, line: 193, column: 17)
!2217 = !DILocation(line: 193, column: 26, scope: !2216)
!2218 = !DILocation(line: 193, column: 22, scope: !2216)
!2219 = !DILocation(line: 193, column: 33, scope: !2220)
!2220 = distinct !DILexicalBlock(scope: !2216, file: !88, line: 193, column: 17)
!2221 = !DILocation(line: 193, column: 37, scope: !2220)
!2222 = !DILocation(line: 193, column: 35, scope: !2220)
!2223 = !DILocation(line: 193, column: 17, scope: !2216)
!2224 = !DILocalVariable(name: "k", scope: !2225, file: !88, line: 194, type: !51)
!2225 = distinct !DILexicalBlock(scope: !2226, file: !88, line: 194, column: 21)
!2226 = distinct !DILexicalBlock(scope: !2220, file: !88, line: 193, column: 54)
!2227 = !DILocation(line: 194, column: 30, scope: !2225)
!2228 = !DILocation(line: 194, column: 26, scope: !2225)
!2229 = !DILocation(line: 194, column: 37, scope: !2230)
!2230 = distinct !DILexicalBlock(scope: !2225, file: !88, line: 194, column: 21)
!2231 = !DILocation(line: 194, column: 41, scope: !2230)
!2232 = !DILocation(line: 194, column: 39, scope: !2230)
!2233 = !DILocation(line: 194, column: 21, scope: !2225)
!2234 = !DILocation(line: 196, column: 81, scope: !2235)
!2235 = distinct !DILexicalBlock(scope: !2230, file: !88, line: 195, column: 21)
!2236 = !DILocation(line: 196, column: 84, scope: !2235)
!2237 = !DILocation(line: 196, column: 88, scope: !2235)
!2238 = !DILocation(line: 196, column: 90, scope: !2235)
!2239 = !DILocation(line: 196, column: 89, scope: !2235)
!2240 = !DILocation(line: 196, column: 86, scope: !2235)
!2241 = !DILocation(line: 196, column: 106, scope: !2235)
!2242 = !DILocation(line: 196, column: 103, scope: !2235)
!2243 = !DILocation(line: 196, column: 27, scope: !2235)
!2244 = !DILocation(line: 196, column: 40, scope: !2235)
!2245 = !DILocation(line: 196, column: 38, scope: !2235)
!2246 = !DILocation(line: 196, column: 44, scope: !2235)
!2247 = !DILocation(line: 196, column: 42, scope: !2235)
!2248 = !DILocation(line: 196, column: 49, scope: !2235)
!2249 = !DILocation(line: 196, column: 53, scope: !2235)
!2250 = !DILocation(line: 196, column: 51, scope: !2235)
!2251 = !DILocation(line: 196, column: 69, scope: !2235)
!2252 = !DILocation(line: 196, column: 68, scope: !2235)
!2253 = !DILocation(line: 196, column: 46, scope: !2235)
!2254 = !DILocation(line: 196, column: 25, scope: !2235)
!2255 = !DILocation(line: 196, column: 78, scope: !2235)
!2256 = !DILocation(line: 197, column: 28, scope: !2257)
!2257 = distinct !DILexicalBlock(scope: !2235, file: !88, line: 197, column: 28)
!2258 = !DILocation(line: 197, column: 42, scope: !2257)
!2259 = !DILocation(line: 198, column: 89, scope: !2260)
!2260 = distinct !DILexicalBlock(scope: !2257, file: !88, line: 197, column: 46)
!2261 = !DILocation(line: 198, column: 92, scope: !2260)
!2262 = !DILocation(line: 198, column: 96, scope: !2260)
!2263 = !DILocation(line: 198, column: 98, scope: !2260)
!2264 = !DILocation(line: 198, column: 97, scope: !2260)
!2265 = !DILocation(line: 198, column: 94, scope: !2260)
!2266 = !DILocation(line: 198, column: 118, scope: !2260)
!2267 = !DILocation(line: 198, column: 117, scope: !2260)
!2268 = !DILocation(line: 198, column: 111, scope: !2260)
!2269 = !DILocation(line: 198, column: 31, scope: !2260)
!2270 = !DILocation(line: 198, column: 44, scope: !2260)
!2271 = !DILocation(line: 198, column: 42, scope: !2260)
!2272 = !DILocation(line: 198, column: 48, scope: !2260)
!2273 = !DILocation(line: 198, column: 46, scope: !2260)
!2274 = !DILocation(line: 198, column: 53, scope: !2260)
!2275 = !DILocation(line: 198, column: 57, scope: !2260)
!2276 = !DILocation(line: 198, column: 55, scope: !2260)
!2277 = !DILocation(line: 198, column: 72, scope: !2260)
!2278 = !DILocation(line: 198, column: 77, scope: !2260)
!2279 = !DILocation(line: 198, column: 76, scope: !2260)
!2280 = !DILocation(line: 198, column: 50, scope: !2260)
!2281 = !DILocation(line: 198, column: 29, scope: !2260)
!2282 = !DILocation(line: 198, column: 86, scope: !2260)
!2283 = !DILocation(line: 199, column: 25, scope: !2260)
!2284 = !DILocation(line: 200, column: 21, scope: !2235)
!2285 = !DILocation(line: 194, column: 55, scope: !2230)
!2286 = !DILocation(line: 194, column: 21, scope: !2230)
!2287 = distinct !{!2287, !2233, !2288, !165}
!2288 = !DILocation(line: 200, column: 21, scope: !2225)
!2289 = !DILocation(line: 201, column: 17, scope: !2226)
!2290 = !DILocation(line: 193, column: 50, scope: !2220)
!2291 = !DILocation(line: 193, column: 17, scope: !2220)
!2292 = distinct !{!2292, !2223, !2293, !165}
!2293 = !DILocation(line: 201, column: 17, scope: !2216)
!2294 = !DILocation(line: 202, column: 13, scope: !2207)
!2295 = !DILocation(line: 204, column: 27, scope: !2115)
!2296 = !DILocation(line: 205, column: 16, scope: !2297)
!2297 = distinct !DILexicalBlock(scope: !2115, file: !88, line: 205, column: 16)
!2298 = !DILocation(line: 205, column: 30, scope: !2297)
!2299 = !DILocation(line: 206, column: 32, scope: !2300)
!2300 = distinct !DILexicalBlock(scope: !2297, file: !88, line: 205, column: 36)
!2301 = !DILocation(line: 207, column: 31, scope: !2300)
!2302 = !DILocation(line: 208, column: 13, scope: !2300)
!2303 = !DILocation(line: 209, column: 9, scope: !2115)
!2304 = !DILocation(line: 178, column: 46, scope: !2110)
!2305 = !DILocation(line: 178, column: 9, scope: !2110)
!2306 = distinct !{!2306, !2113, !2307, !165}
!2307 = !DILocation(line: 209, column: 9, scope: !2103)
!2308 = !DILocation(line: 210, column: 5, scope: !2104)
!2309 = !DILocation(line: 177, column: 42, scope: !2097)
!2310 = !DILocation(line: 177, column: 5, scope: !2097)
!2311 = distinct !{!2311, !2101, !2312, !165}
!2312 = !DILocation(line: 210, column: 5, scope: !2093)
!2313 = !DILocalVariable(name: "c", scope: !2314, file: !88, line: 212, type: !82)
!2314 = distinct !DILexicalBlock(scope: !2020, file: !88, line: 212, column: 5)
!2315 = !DILocation(line: 212, column: 17, scope: !2314)
!2316 = !DILocation(line: 212, column: 10, scope: !2314)
!2317 = !DILocation(line: 212, column: 24, scope: !2318)
!2318 = distinct !DILexicalBlock(scope: !2314, file: !88, line: 212, column: 5)
!2319 = !DILocation(line: 212, column: 28, scope: !2318)
!2320 = !DILocation(line: 212, column: 38, scope: !2318)
!2321 = !DILocation(line: 212, column: 52, scope: !2318)
!2322 = !DILocation(line: 212, column: 62, scope: !2318)
!2323 = !DILocation(line: 212, column: 66, scope: !2318)
!2324 = !DILocation(line: 212, column: 65, scope: !2318)
!2325 = !DILocation(line: 212, column: 76, scope: !2318)
!2326 = !DILocation(line: 212, column: 49, scope: !2318)
!2327 = !DILocation(line: 212, column: 79, scope: !2318)
!2328 = !DILocation(line: 212, column: 83, scope: !2318)
!2329 = !DILocation(line: 212, column: 35, scope: !2318)
!2330 = !DILocation(line: 212, column: 26, scope: !2318)
!2331 = !DILocation(line: 212, column: 5, scope: !2314)
!2332 = !DILocation(line: 214, column: 33, scope: !2333)
!2333 = distinct !DILexicalBlock(scope: !2318, file: !88, line: 213, column: 5)
!2334 = !DILocation(line: 214, column: 37, scope: !2333)
!2335 = !DILocation(line: 214, column: 35, scope: !2333)
!2336 = !DILocation(line: 214, column: 9, scope: !2333)
!2337 = !DILocation(line: 215, column: 5, scope: !2333)
!2338 = !DILocation(line: 212, column: 91, scope: !2318)
!2339 = !DILocation(line: 212, column: 5, scope: !2318)
!2340 = distinct !{!2340, !2331, !2341, !165}
!2341 = !DILocation(line: 215, column: 5, scope: !2314)
!2342 = !DILocalVariable(name: "tab", scope: !2020, file: !88, line: 217, type: !2343)
!2343 = !DICompositeType(tag: DW_TAG_array_type, baseType: !56, size: 128, elements: !2344)
!2344 = !{!2345}
!2345 = !DISubrange(count: 16)
!2346 = !DILocation(line: 217, column: 19, scope: !2020)
!2347 = !DILocalVariable(name: "i", scope: !2348, file: !88, line: 218, type: !82)
!2348 = distinct !DILexicalBlock(scope: !2020, file: !88, line: 218, column: 5)
!2349 = !DILocation(line: 218, column: 17, scope: !2348)
!2350 = !DILocation(line: 218, column: 10, scope: !2348)
!2351 = !DILocation(line: 218, column: 24, scope: !2352)
!2352 = distinct !DILexicalBlock(scope: !2348, file: !88, line: 218, column: 5)
!2353 = !DILocation(line: 218, column: 26, scope: !2352)
!2354 = !DILocation(line: 218, column: 5, scope: !2348)
!2355 = !DILocation(line: 220, column: 28, scope: !2356)
!2356 = distinct !DILexicalBlock(scope: !2352, file: !88, line: 219, column: 5)
!2357 = !DILocation(line: 220, column: 44, scope: !2356)
!2358 = !DILocation(line: 220, column: 22, scope: !2356)
!2359 = !DILocation(line: 220, column: 15, scope: !2356)
!2360 = !DILocation(line: 220, column: 14, scope: !2356)
!2361 = !DILocation(line: 220, column: 9, scope: !2356)
!2362 = !DILocation(line: 220, column: 20, scope: !2356)
!2363 = !DILocation(line: 221, column: 28, scope: !2356)
!2364 = !DILocation(line: 221, column: 44, scope: !2356)
!2365 = !DILocation(line: 221, column: 22, scope: !2356)
!2366 = !DILocation(line: 221, column: 15, scope: !2356)
!2367 = !DILocation(line: 221, column: 14, scope: !2356)
!2368 = !DILocation(line: 221, column: 16, scope: !2356)
!2369 = !DILocation(line: 221, column: 9, scope: !2356)
!2370 = !DILocation(line: 221, column: 20, scope: !2356)
!2371 = !DILocation(line: 222, column: 28, scope: !2356)
!2372 = !DILocation(line: 222, column: 44, scope: !2356)
!2373 = !DILocation(line: 222, column: 22, scope: !2356)
!2374 = !DILocation(line: 222, column: 15, scope: !2356)
!2375 = !DILocation(line: 222, column: 14, scope: !2356)
!2376 = !DILocation(line: 222, column: 16, scope: !2356)
!2377 = !DILocation(line: 222, column: 9, scope: !2356)
!2378 = !DILocation(line: 222, column: 20, scope: !2356)
!2379 = !DILocation(line: 223, column: 28, scope: !2356)
!2380 = !DILocation(line: 223, column: 44, scope: !2356)
!2381 = !DILocation(line: 223, column: 22, scope: !2356)
!2382 = !DILocation(line: 223, column: 15, scope: !2356)
!2383 = !DILocation(line: 223, column: 14, scope: !2356)
!2384 = !DILocation(line: 223, column: 16, scope: !2356)
!2385 = !DILocation(line: 223, column: 9, scope: !2356)
!2386 = !DILocation(line: 223, column: 20, scope: !2356)
!2387 = !DILocation(line: 224, column: 5, scope: !2356)
!2388 = !DILocation(line: 218, column: 41, scope: !2352)
!2389 = !DILocation(line: 218, column: 5, scope: !2352)
!2390 = distinct !{!2390, !2354, !2391, !165}
!2391 = !DILocation(line: 224, column: 5, scope: !2348)
!2392 = !DILocalVariable(name: "low_bit_in_nibble", scope: !2020, file: !88, line: 226, type: !46)
!2393 = !DILocation(line: 226, column: 14, scope: !2020)
!2394 = !DILocalVariable(name: "c", scope: !2395, file: !88, line: 228, type: !82)
!2395 = distinct !DILexicalBlock(scope: !2020, file: !88, line: 228, column: 5)
!2396 = !DILocation(line: 228, column: 17, scope: !2395)
!2397 = !DILocation(line: 228, column: 10, scope: !2395)
!2398 = !DILocation(line: 228, column: 24, scope: !2399)
!2399 = distinct !DILexicalBlock(scope: !2395, file: !88, line: 228, column: 5)
!2400 = !DILocation(line: 228, column: 28, scope: !2399)
!2401 = !DILocation(line: 228, column: 26, scope: !2399)
!2402 = !DILocation(line: 228, column: 5, scope: !2395)
!2403 = !DILocalVariable(name: "r", scope: !2404, file: !88, line: 230, type: !51)
!2404 = distinct !DILexicalBlock(scope: !2405, file: !88, line: 230, column: 9)
!2405 = distinct !DILexicalBlock(scope: !2399, file: !88, line: 229, column: 5)
!2406 = !DILocation(line: 230, column: 18, scope: !2404)
!2407 = !DILocation(line: 230, column: 22, scope: !2404)
!2408 = !DILocation(line: 230, column: 14, scope: !2404)
!2409 = !DILocation(line: 230, column: 34, scope: !2410)
!2410 = distinct !DILexicalBlock(scope: !2404, file: !88, line: 230, column: 9)
!2411 = !DILocation(line: 230, column: 38, scope: !2410)
!2412 = !DILocation(line: 230, column: 52, scope: !2410)
!2413 = !DILocation(line: 230, column: 62, scope: !2410)
!2414 = !DILocation(line: 230, column: 66, scope: !2410)
!2415 = !DILocation(line: 230, column: 65, scope: !2410)
!2416 = !DILocation(line: 230, column: 76, scope: !2410)
!2417 = !DILocation(line: 230, column: 49, scope: !2410)
!2418 = !DILocation(line: 230, column: 36, scope: !2410)
!2419 = !DILocation(line: 230, column: 9, scope: !2404)
!2420 = !DILocalVariable(name: "pos", scope: !2421, file: !88, line: 232, type: !82)
!2421 = distinct !DILexicalBlock(scope: !2410, file: !88, line: 231, column: 9)
!2422 = !DILocation(line: 232, column: 20, scope: !2421)
!2423 = !DILocation(line: 232, column: 27, scope: !2421)
!2424 = !DILocation(line: 232, column: 28, scope: !2421)
!2425 = !DILocation(line: 232, column: 33, scope: !2421)
!2426 = !DILocation(line: 232, column: 32, scope: !2421)
!2427 = !DILocation(line: 232, column: 43, scope: !2421)
!2428 = !DILocation(line: 232, column: 41, scope: !2421)
!2429 = !DILocation(line: 232, column: 48, scope: !2421)
!2430 = !DILocation(line: 232, column: 49, scope: !2421)
!2431 = !DILocation(line: 232, column: 45, scope: !2421)
!2432 = !DILocalVariable(name: "t0", scope: !2421, file: !88, line: 233, type: !46)
!2433 = !DILocation(line: 233, column: 22, scope: !2421)
!2434 = !DILocation(line: 233, column: 30, scope: !2421)
!2435 = !DILocation(line: 233, column: 28, scope: !2421)
!2436 = !DILocation(line: 233, column: 43, scope: !2421)
!2437 = !DILocation(line: 233, column: 41, scope: !2421)
!2438 = !DILocalVariable(name: "t1", scope: !2421, file: !88, line: 234, type: !46)
!2439 = !DILocation(line: 234, column: 22, scope: !2421)
!2440 = !DILocation(line: 234, column: 30, scope: !2421)
!2441 = !DILocation(line: 234, column: 28, scope: !2421)
!2442 = !DILocation(line: 234, column: 35, scope: !2421)
!2443 = !DILocation(line: 234, column: 43, scope: !2421)
!2444 = !DILocation(line: 234, column: 41, scope: !2421)
!2445 = !DILocalVariable(name: "t2", scope: !2421, file: !88, line: 235, type: !46)
!2446 = !DILocation(line: 235, column: 22, scope: !2421)
!2447 = !DILocation(line: 235, column: 30, scope: !2421)
!2448 = !DILocation(line: 235, column: 28, scope: !2421)
!2449 = !DILocation(line: 235, column: 35, scope: !2421)
!2450 = !DILocation(line: 235, column: 43, scope: !2421)
!2451 = !DILocation(line: 235, column: 41, scope: !2421)
!2452 = !DILocalVariable(name: "t3", scope: !2421, file: !88, line: 236, type: !46)
!2453 = !DILocation(line: 236, column: 22, scope: !2421)
!2454 = !DILocation(line: 236, column: 30, scope: !2421)
!2455 = !DILocation(line: 236, column: 28, scope: !2421)
!2456 = !DILocation(line: 236, column: 35, scope: !2421)
!2457 = !DILocation(line: 236, column: 43, scope: !2421)
!2458 = !DILocation(line: 236, column: 41, scope: !2421)
!2459 = !DILocalVariable(name: "t", scope: !2460, file: !88, line: 237, type: !82)
!2460 = distinct !DILexicalBlock(scope: !2421, file: !88, line: 237, column: 13)
!2461 = !DILocation(line: 237, column: 25, scope: !2460)
!2462 = !DILocation(line: 237, column: 18, scope: !2460)
!2463 = !DILocation(line: 237, column: 32, scope: !2464)
!2464 = distinct !DILexicalBlock(scope: !2460, file: !88, line: 237, column: 13)
!2465 = !DILocation(line: 237, column: 34, scope: !2464)
!2466 = !DILocation(line: 237, column: 13, scope: !2460)
!2467 = !DILocation(line: 239, column: 81, scope: !2468)
!2468 = distinct !DILexicalBlock(scope: !2464, file: !88, line: 238, column: 13)
!2469 = !DILocation(line: 239, column: 90, scope: !2468)
!2470 = !DILocation(line: 239, column: 89, scope: !2468)
!2471 = !DILocation(line: 239, column: 91, scope: !2468)
!2472 = !DILocation(line: 239, column: 84, scope: !2468)
!2473 = !DILocation(line: 239, column: 83, scope: !2468)
!2474 = !DILocation(line: 239, column: 97, scope: !2468)
!2475 = !DILocation(line: 239, column: 106, scope: !2468)
!2476 = !DILocation(line: 239, column: 105, scope: !2468)
!2477 = !DILocation(line: 239, column: 107, scope: !2468)
!2478 = !DILocation(line: 239, column: 100, scope: !2468)
!2479 = !DILocation(line: 239, column: 99, scope: !2468)
!2480 = !DILocation(line: 239, column: 95, scope: !2468)
!2481 = !DILocation(line: 239, column: 113, scope: !2468)
!2482 = !DILocation(line: 239, column: 122, scope: !2468)
!2483 = !DILocation(line: 239, column: 121, scope: !2468)
!2484 = !DILocation(line: 239, column: 123, scope: !2468)
!2485 = !DILocation(line: 239, column: 116, scope: !2468)
!2486 = !DILocation(line: 239, column: 115, scope: !2468)
!2487 = !DILocation(line: 239, column: 111, scope: !2468)
!2488 = !DILocation(line: 239, column: 129, scope: !2468)
!2489 = !DILocation(line: 239, column: 138, scope: !2468)
!2490 = !DILocation(line: 239, column: 137, scope: !2468)
!2491 = !DILocation(line: 239, column: 139, scope: !2468)
!2492 = !DILocation(line: 239, column: 132, scope: !2468)
!2493 = !DILocation(line: 239, column: 131, scope: !2468)
!2494 = !DILocation(line: 239, column: 127, scope: !2468)
!2495 = !DILocation(line: 239, column: 21, scope: !2468)
!2496 = !DILocation(line: 239, column: 23, scope: !2468)
!2497 = !DILocation(line: 239, column: 22, scope: !2468)
!2498 = !DILocation(line: 239, column: 25, scope: !2468)
!2499 = !DILocation(line: 239, column: 24, scope: !2468)
!2500 = !DILocation(line: 239, column: 36, scope: !2468)
!2501 = !DILocation(line: 239, column: 41, scope: !2468)
!2502 = !DILocation(line: 239, column: 40, scope: !2468)
!2503 = !DILocation(line: 239, column: 51, scope: !2468)
!2504 = !DILocation(line: 239, column: 49, scope: !2468)
!2505 = !DILocation(line: 239, column: 57, scope: !2468)
!2506 = !DILocation(line: 239, column: 59, scope: !2468)
!2507 = !DILocation(line: 239, column: 58, scope: !2468)
!2508 = !DILocation(line: 239, column: 61, scope: !2468)
!2509 = !DILocation(line: 239, column: 60, scope: !2468)
!2510 = !DILocation(line: 239, column: 72, scope: !2468)
!2511 = !DILocation(line: 239, column: 53, scope: !2468)
!2512 = !DILocation(line: 239, column: 17, scope: !2468)
!2513 = !DILocation(line: 239, column: 78, scope: !2468)
!2514 = !DILocation(line: 240, column: 13, scope: !2468)
!2515 = !DILocation(line: 237, column: 49, scope: !2464)
!2516 = !DILocation(line: 237, column: 13, scope: !2464)
!2517 = distinct !{!2517, !2466, !2518, !165}
!2518 = !DILocation(line: 240, column: 13, scope: !2460)
!2519 = !DILocation(line: 241, column: 9, scope: !2421)
!2520 = !DILocation(line: 230, column: 82, scope: !2410)
!2521 = !DILocation(line: 230, column: 9, scope: !2410)
!2522 = distinct !{!2522, !2419, !2523, !165}
!2523 = !DILocation(line: 241, column: 9, scope: !2404)
!2524 = !DILocation(line: 242, column: 5, scope: !2405)
!2525 = !DILocation(line: 228, column: 38, scope: !2399)
!2526 = !DILocation(line: 228, column: 5, scope: !2399)
!2527 = distinct !{!2527, !2402, !2528, !165}
!2528 = !DILocation(line: 242, column: 5, scope: !2395)
!2529 = !DILocalVariable(name: "r", scope: !2530, file: !88, line: 250, type: !51)
!2530 = distinct !DILexicalBlock(scope: !2020, file: !88, line: 250, column: 5)
!2531 = !DILocation(line: 250, column: 14, scope: !2530)
!2532 = !DILocation(line: 250, column: 10, scope: !2530)
!2533 = !DILocation(line: 250, column: 21, scope: !2534)
!2534 = distinct !DILexicalBlock(scope: !2530, file: !88, line: 250, column: 5)
!2535 = !DILocation(line: 250, column: 25, scope: !2534)
!2536 = !DILocation(line: 250, column: 23, scope: !2534)
!2537 = !DILocation(line: 250, column: 5, scope: !2530)
!2538 = !DILocalVariable(name: "c", scope: !2539, file: !88, line: 252, type: !51)
!2539 = distinct !DILexicalBlock(scope: !2540, file: !88, line: 252, column: 9)
!2540 = distinct !DILexicalBlock(scope: !2534, file: !88, line: 251, column: 5)
!2541 = !DILocation(line: 252, column: 18, scope: !2539)
!2542 = !DILocation(line: 252, column: 14, scope: !2539)
!2543 = !DILocation(line: 252, column: 25, scope: !2544)
!2544 = distinct !DILexicalBlock(scope: !2539, file: !88, line: 252, column: 9)
!2545 = !DILocation(line: 252, column: 29, scope: !2544)
!2546 = !DILocation(line: 252, column: 44, scope: !2544)
!2547 = !DILocation(line: 252, column: 27, scope: !2544)
!2548 = !DILocation(line: 252, column: 9, scope: !2539)
!2549 = !DILocalVariable(name: "i", scope: !2550, file: !88, line: 254, type: !51)
!2550 = distinct !DILexicalBlock(scope: !2551, file: !88, line: 254, column: 13)
!2551 = distinct !DILexicalBlock(scope: !2544, file: !88, line: 253, column: 9)
!2552 = !DILocation(line: 254, column: 22, scope: !2550)
!2553 = !DILocation(line: 254, column: 18, scope: !2550)
!2554 = !DILocation(line: 254, column: 29, scope: !2555)
!2555 = distinct !DILexicalBlock(scope: !2550, file: !88, line: 254, column: 13)
!2556 = !DILocation(line: 254, column: 33, scope: !2555)
!2557 = !DILocation(line: 254, column: 31, scope: !2555)
!2558 = !DILocation(line: 254, column: 37, scope: !2555)
!2559 = !DILocation(line: 254, column: 35, scope: !2555)
!2560 = !DILocation(line: 254, column: 13, scope: !2550)
!2561 = !DILocation(line: 256, column: 46, scope: !2562)
!2562 = distinct !DILexicalBlock(scope: !2555, file: !88, line: 255, column: 13)
!2563 = !DILocation(line: 256, column: 48, scope: !2562)
!2564 = !DILocation(line: 256, column: 47, scope: !2562)
!2565 = !DILocation(line: 256, column: 55, scope: !2562)
!2566 = !DILocation(line: 256, column: 61, scope: !2562)
!2567 = !DILocation(line: 256, column: 59, scope: !2562)
!2568 = !DILocation(line: 256, column: 65, scope: !2562)
!2569 = !DILocation(line: 256, column: 63, scope: !2562)
!2570 = !DILocation(line: 256, column: 44, scope: !2562)
!2571 = !DILocation(line: 256, column: 69, scope: !2562)
!2572 = !DILocation(line: 256, column: 77, scope: !2562)
!2573 = !DILocation(line: 256, column: 94, scope: !2562)
!2574 = !DILocation(line: 256, column: 96, scope: !2562)
!2575 = !DILocation(line: 256, column: 95, scope: !2562)
!2576 = !DILocation(line: 256, column: 92, scope: !2562)
!2577 = !DILocation(line: 256, column: 75, scope: !2562)
!2578 = !DILocation(line: 256, column: 101, scope: !2562)
!2579 = !DILocation(line: 256, column: 99, scope: !2562)
!2580 = !DILocation(line: 256, column: 104, scope: !2562)
!2581 = !DILocation(line: 256, column: 17, scope: !2562)
!2582 = !DILocation(line: 257, column: 13, scope: !2562)
!2583 = !DILocation(line: 254, column: 50, scope: !2555)
!2584 = !DILocation(line: 254, column: 13, scope: !2555)
!2585 = distinct !{!2585, !2560, !2586, !165}
!2586 = !DILocation(line: 257, column: 13, scope: !2550)
!2587 = !DILocation(line: 258, column: 9, scope: !2551)
!2588 = !DILocation(line: 252, column: 50, scope: !2544)
!2589 = !DILocation(line: 252, column: 9, scope: !2544)
!2590 = distinct !{!2590, !2548, !2591, !165}
!2591 = !DILocation(line: 258, column: 9, scope: !2539)
!2592 = !DILocation(line: 259, column: 5, scope: !2540)
!2593 = !DILocation(line: 250, column: 38, scope: !2534)
!2594 = !DILocation(line: 250, column: 5, scope: !2534)
!2595 = distinct !{!2595, !2537, !2596, !165}
!2596 = !DILocation(line: 259, column: 5, scope: !2530)
!2597 = !DILocation(line: 260, column: 1, scope: !2020)
!2598 = distinct !DISubprogram(name: "mat_mul", scope: !838, file: !838, line: 78, type: !2599, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !91)
!2599 = !DISubroutineType(types: !2600)
!2600 = !{null, !60, !60, !55, !51, !51, !51}
!2601 = !DILocalVariable(name: "a", arg: 1, scope: !2598, file: !838, line: 78, type: !60)
!2602 = !DILocation(line: 78, column: 49, scope: !2598)
!2603 = !DILocalVariable(name: "b", arg: 2, scope: !2598, file: !838, line: 78, type: !60)
!2604 = !DILocation(line: 78, column: 73, scope: !2598)
!2605 = !DILocalVariable(name: "c", arg: 3, scope: !2598, file: !838, line: 79, type: !55)
!2606 = !DILocation(line: 79, column: 36, scope: !2598)
!2607 = !DILocalVariable(name: "colrow_ab", arg: 4, scope: !2598, file: !838, line: 79, type: !51)
!2608 = !DILocation(line: 79, column: 43, scope: !2598)
!2609 = !DILocalVariable(name: "row_a", arg: 5, scope: !2598, file: !838, line: 79, type: !51)
!2610 = !DILocation(line: 79, column: 58, scope: !2598)
!2611 = !DILocalVariable(name: "col_b", arg: 6, scope: !2598, file: !838, line: 79, type: !51)
!2612 = !DILocation(line: 79, column: 69, scope: !2598)
!2613 = !DILocalVariable(name: "i", scope: !2614, file: !838, line: 80, type: !51)
!2614 = distinct !DILexicalBlock(scope: !2598, file: !838, line: 80, column: 5)
!2615 = !DILocation(line: 80, column: 14, scope: !2614)
!2616 = !DILocation(line: 80, column: 10, scope: !2614)
!2617 = !DILocation(line: 80, column: 21, scope: !2618)
!2618 = distinct !DILexicalBlock(scope: !2614, file: !838, line: 80, column: 5)
!2619 = !DILocation(line: 80, column: 25, scope: !2618)
!2620 = !DILocation(line: 80, column: 23, scope: !2618)
!2621 = !DILocation(line: 80, column: 5, scope: !2614)
!2622 = !DILocalVariable(name: "j", scope: !2623, file: !838, line: 81, type: !51)
!2623 = distinct !DILexicalBlock(scope: !2624, file: !838, line: 81, column: 9)
!2624 = distinct !DILexicalBlock(scope: !2618, file: !838, line: 80, column: 53)
!2625 = !DILocation(line: 81, column: 18, scope: !2623)
!2626 = !DILocation(line: 81, column: 14, scope: !2623)
!2627 = !DILocation(line: 81, column: 25, scope: !2628)
!2628 = distinct !DILexicalBlock(scope: !2623, file: !838, line: 81, column: 9)
!2629 = !DILocation(line: 81, column: 29, scope: !2628)
!2630 = !DILocation(line: 81, column: 27, scope: !2628)
!2631 = !DILocation(line: 81, column: 9, scope: !2623)
!2632 = !DILocation(line: 82, column: 26, scope: !2633)
!2633 = distinct !DILexicalBlock(scope: !2628, file: !838, line: 81, column: 46)
!2634 = !DILocation(line: 82, column: 29, scope: !2633)
!2635 = !DILocation(line: 82, column: 33, scope: !2633)
!2636 = !DILocation(line: 82, column: 31, scope: !2633)
!2637 = !DILocation(line: 82, column: 36, scope: !2633)
!2638 = !DILocation(line: 82, column: 47, scope: !2633)
!2639 = !DILocation(line: 82, column: 18, scope: !2633)
!2640 = !DILocation(line: 82, column: 14, scope: !2633)
!2641 = !DILocation(line: 82, column: 16, scope: !2633)
!2642 = !DILocation(line: 83, column: 9, scope: !2633)
!2643 = !DILocation(line: 81, column: 36, scope: !2628)
!2644 = !DILocation(line: 81, column: 41, scope: !2628)
!2645 = !DILocation(line: 81, column: 9, scope: !2628)
!2646 = distinct !{!2646, !2631, !2647, !165}
!2647 = !DILocation(line: 83, column: 9, scope: !2623)
!2648 = !DILocation(line: 84, column: 5, scope: !2624)
!2649 = !DILocation(line: 80, column: 32, scope: !2618)
!2650 = !DILocation(line: 80, column: 42, scope: !2618)
!2651 = !DILocation(line: 80, column: 39, scope: !2618)
!2652 = !DILocation(line: 80, column: 5, scope: !2618)
!2653 = distinct !{!2653, !2621, !2654, !165}
!2654 = !DILocation(line: 84, column: 5, scope: !2614)
!2655 = !DILocation(line: 85, column: 1, scope: !2598)
!2656 = distinct !DISubprogram(name: "mat_add", scope: !838, file: !838, line: 87, type: !2657, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !91)
!2657 = !DISubroutineType(types: !2658)
!2658 = !{null, !60, !60, !55, !51, !51}
!2659 = !DILocalVariable(name: "a", arg: 1, scope: !2656, file: !838, line: 87, type: !60)
!2660 = !DILocation(line: 87, column: 49, scope: !2656)
!2661 = !DILocalVariable(name: "b", arg: 2, scope: !2656, file: !838, line: 87, type: !60)
!2662 = !DILocation(line: 87, column: 73, scope: !2656)
!2663 = !DILocalVariable(name: "c", arg: 3, scope: !2656, file: !838, line: 88, type: !55)
!2664 = !DILocation(line: 88, column: 36, scope: !2656)
!2665 = !DILocalVariable(name: "m", arg: 4, scope: !2656, file: !838, line: 88, type: !51)
!2666 = !DILocation(line: 88, column: 43, scope: !2656)
!2667 = !DILocalVariable(name: "n", arg: 5, scope: !2656, file: !838, line: 88, type: !51)
!2668 = !DILocation(line: 88, column: 50, scope: !2656)
!2669 = !DILocalVariable(name: "i", scope: !2670, file: !838, line: 89, type: !51)
!2670 = distinct !DILexicalBlock(scope: !2656, file: !838, line: 89, column: 5)
!2671 = !DILocation(line: 89, column: 14, scope: !2670)
!2672 = !DILocation(line: 89, column: 10, scope: !2670)
!2673 = !DILocation(line: 89, column: 21, scope: !2674)
!2674 = distinct !DILexicalBlock(scope: !2670, file: !838, line: 89, column: 5)
!2675 = !DILocation(line: 89, column: 25, scope: !2674)
!2676 = !DILocation(line: 89, column: 23, scope: !2674)
!2677 = !DILocation(line: 89, column: 5, scope: !2670)
!2678 = !DILocalVariable(name: "j", scope: !2679, file: !838, line: 90, type: !51)
!2679 = distinct !DILexicalBlock(scope: !2680, file: !838, line: 90, column: 9)
!2680 = distinct !DILexicalBlock(scope: !2674, file: !838, line: 89, column: 33)
!2681 = !DILocation(line: 90, column: 18, scope: !2679)
!2682 = !DILocation(line: 90, column: 14, scope: !2679)
!2683 = !DILocation(line: 90, column: 25, scope: !2684)
!2684 = distinct !DILexicalBlock(scope: !2679, file: !838, line: 90, column: 9)
!2685 = !DILocation(line: 90, column: 29, scope: !2684)
!2686 = !DILocation(line: 90, column: 27, scope: !2684)
!2687 = !DILocation(line: 90, column: 9, scope: !2679)
!2688 = !DILocation(line: 91, column: 40, scope: !2689)
!2689 = distinct !DILexicalBlock(scope: !2684, file: !838, line: 90, column: 37)
!2690 = !DILocation(line: 91, column: 44, scope: !2689)
!2691 = !DILocation(line: 91, column: 48, scope: !2689)
!2692 = !DILocation(line: 91, column: 46, scope: !2689)
!2693 = !DILocation(line: 91, column: 42, scope: !2689)
!2694 = !DILocation(line: 91, column: 52, scope: !2689)
!2695 = !DILocation(line: 91, column: 50, scope: !2689)
!2696 = !DILocation(line: 91, column: 38, scope: !2689)
!2697 = !DILocation(line: 91, column: 58, scope: !2689)
!2698 = !DILocation(line: 91, column: 62, scope: !2689)
!2699 = !DILocation(line: 91, column: 66, scope: !2689)
!2700 = !DILocation(line: 91, column: 64, scope: !2689)
!2701 = !DILocation(line: 91, column: 60, scope: !2689)
!2702 = !DILocation(line: 91, column: 70, scope: !2689)
!2703 = !DILocation(line: 91, column: 68, scope: !2689)
!2704 = !DILocation(line: 91, column: 56, scope: !2689)
!2705 = !DILocation(line: 91, column: 32, scope: !2689)
!2706 = !DILocation(line: 91, column: 15, scope: !2689)
!2707 = !DILocation(line: 91, column: 19, scope: !2689)
!2708 = !DILocation(line: 91, column: 23, scope: !2689)
!2709 = !DILocation(line: 91, column: 21, scope: !2689)
!2710 = !DILocation(line: 91, column: 17, scope: !2689)
!2711 = !DILocation(line: 91, column: 27, scope: !2689)
!2712 = !DILocation(line: 91, column: 25, scope: !2689)
!2713 = !DILocation(line: 91, column: 30, scope: !2689)
!2714 = !DILocation(line: 92, column: 9, scope: !2689)
!2715 = !DILocation(line: 90, column: 32, scope: !2684)
!2716 = !DILocation(line: 90, column: 9, scope: !2684)
!2717 = distinct !{!2717, !2687, !2718, !165}
!2718 = !DILocation(line: 92, column: 9, scope: !2679)
!2719 = !DILocation(line: 93, column: 5, scope: !2680)
!2720 = !DILocation(line: 89, column: 28, scope: !2674)
!2721 = !DILocation(line: 89, column: 5, scope: !2674)
!2722 = distinct !{!2722, !2677, !2723, !165}
!2723 = !DILocation(line: 93, column: 5, scope: !2670)
!2724 = !DILocation(line: 94, column: 1, scope: !2656)
!2725 = distinct !DISubprogram(name: "encode", scope: !88, file: !88, line: 32, type: !532, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !91)
!2726 = !DILocalVariable(name: "m", arg: 1, scope: !2725, file: !88, line: 32, type: !60)
!2727 = !DILocation(line: 32, column: 41, scope: !2725)
!2728 = !DILocalVariable(name: "menc", arg: 2, scope: !2725, file: !88, line: 32, type: !55)
!2729 = !DILocation(line: 32, column: 59, scope: !2725)
!2730 = !DILocalVariable(name: "mlen", arg: 3, scope: !2725, file: !88, line: 32, type: !51)
!2731 = !DILocation(line: 32, column: 69, scope: !2725)
!2732 = !DILocalVariable(name: "i", scope: !2725, file: !88, line: 33, type: !51)
!2733 = !DILocation(line: 33, column: 9, scope: !2725)
!2734 = !DILocation(line: 34, column: 12, scope: !2735)
!2735 = distinct !DILexicalBlock(scope: !2725, file: !88, line: 34, column: 5)
!2736 = !DILocation(line: 34, column: 10, scope: !2735)
!2737 = !DILocation(line: 34, column: 17, scope: !2738)
!2738 = distinct !DILexicalBlock(scope: !2735, file: !88, line: 34, column: 5)
!2739 = !DILocation(line: 34, column: 21, scope: !2738)
!2740 = !DILocation(line: 34, column: 26, scope: !2738)
!2741 = !DILocation(line: 34, column: 19, scope: !2738)
!2742 = !DILocation(line: 34, column: 5, scope: !2735)
!2743 = !DILocation(line: 35, column: 21, scope: !2744)
!2744 = distinct !DILexicalBlock(scope: !2738, file: !88, line: 34, column: 44)
!2745 = !DILocation(line: 35, column: 20, scope: !2744)
!2746 = !DILocation(line: 35, column: 19, scope: !2744)
!2747 = !DILocation(line: 35, column: 29, scope: !2744)
!2748 = !DILocation(line: 35, column: 31, scope: !2744)
!2749 = !DILocation(line: 35, column: 27, scope: !2744)
!2750 = !DILocation(line: 35, column: 36, scope: !2744)
!2751 = !DILocation(line: 35, column: 24, scope: !2744)
!2752 = !DILocation(line: 35, column: 9, scope: !2744)
!2753 = !DILocation(line: 35, column: 14, scope: !2744)
!2754 = !DILocation(line: 35, column: 17, scope: !2744)
!2755 = !DILocation(line: 36, column: 5, scope: !2744)
!2756 = !DILocation(line: 34, column: 31, scope: !2738)
!2757 = !DILocation(line: 34, column: 38, scope: !2738)
!2758 = !DILocation(line: 34, column: 5, scope: !2738)
!2759 = distinct !{!2759, !2742, !2760, !165}
!2760 = !DILocation(line: 36, column: 5, scope: !2735)
!2761 = !DILocation(line: 38, column: 9, scope: !2762)
!2762 = distinct !DILexicalBlock(scope: !2725, file: !88, line: 38, column: 9)
!2763 = !DILocation(line: 38, column: 14, scope: !2762)
!2764 = !DILocation(line: 38, column: 18, scope: !2762)
!2765 = !DILocation(line: 39, column: 21, scope: !2766)
!2766 = distinct !DILexicalBlock(scope: !2762, file: !88, line: 38, column: 24)
!2767 = !DILocation(line: 39, column: 20, scope: !2766)
!2768 = !DILocation(line: 39, column: 9, scope: !2766)
!2769 = !DILocation(line: 39, column: 14, scope: !2766)
!2770 = !DILocation(line: 39, column: 17, scope: !2766)
!2771 = !DILocation(line: 40, column: 5, scope: !2766)
!2772 = !DILocation(line: 41, column: 1, scope: !2725)
!2773 = distinct !DISubprogram(name: "add_f", scope: !838, file: !838, line: 42, type: !2774, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !91)
!2774 = !DISubroutineType(types: !2775)
!2775 = !{!56, !56, !56}
!2776 = !DILocalVariable(name: "a", arg: 1, scope: !2773, file: !838, line: 42, type: !56)
!2777 = !DILocation(line: 42, column: 49, scope: !2773)
!2778 = !DILocalVariable(name: "b", arg: 2, scope: !2773, file: !838, line: 42, type: !56)
!2779 = !DILocation(line: 42, column: 66, scope: !2773)
!2780 = !DILocation(line: 43, column: 12, scope: !2773)
!2781 = !DILocation(line: 43, column: 16, scope: !2773)
!2782 = !DILocation(line: 43, column: 14, scope: !2773)
!2783 = !DILocation(line: 43, column: 5, scope: !2773)
!2784 = distinct !DISubprogram(name: "lincomb", scope: !838, file: !838, line: 69, type: !2785, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !91)
!2785 = !DISubroutineType(types: !2786)
!2786 = !{!56, !60, !60, !51, !51}
!2787 = !DILocalVariable(name: "a", arg: 1, scope: !2784, file: !838, line: 69, type: !60)
!2788 = !DILocation(line: 69, column: 58, scope: !2784)
!2789 = !DILocalVariable(name: "b", arg: 2, scope: !2784, file: !838, line: 70, type: !60)
!2790 = !DILocation(line: 70, column: 58, scope: !2784)
!2791 = !DILocalVariable(name: "n", arg: 3, scope: !2784, file: !838, line: 70, type: !51)
!2792 = !DILocation(line: 70, column: 65, scope: !2784)
!2793 = !DILocalVariable(name: "m", arg: 4, scope: !2784, file: !838, line: 70, type: !51)
!2794 = !DILocation(line: 70, column: 72, scope: !2784)
!2795 = !DILocalVariable(name: "ret", scope: !2784, file: !838, line: 71, type: !56)
!2796 = !DILocation(line: 71, column: 19, scope: !2784)
!2797 = !DILocalVariable(name: "i", scope: !2798, file: !838, line: 72, type: !51)
!2798 = distinct !DILexicalBlock(scope: !2784, file: !838, line: 72, column: 5)
!2799 = !DILocation(line: 72, column: 14, scope: !2798)
!2800 = !DILocation(line: 72, column: 10, scope: !2798)
!2801 = !DILocation(line: 72, column: 21, scope: !2802)
!2802 = distinct !DILexicalBlock(scope: !2798, file: !838, line: 72, column: 5)
!2803 = !DILocation(line: 72, column: 25, scope: !2802)
!2804 = !DILocation(line: 72, column: 23, scope: !2802)
!2805 = !DILocation(line: 72, column: 5, scope: !2798)
!2806 = !DILocation(line: 73, column: 27, scope: !2807)
!2807 = distinct !DILexicalBlock(scope: !2802, file: !838, line: 72, column: 41)
!2808 = !DILocation(line: 73, column: 29, scope: !2807)
!2809 = !DILocation(line: 73, column: 34, scope: !2807)
!2810 = !DILocation(line: 73, column: 33, scope: !2807)
!2811 = !DILocation(line: 73, column: 21, scope: !2807)
!2812 = !DILocation(line: 73, column: 38, scope: !2807)
!2813 = !DILocation(line: 73, column: 15, scope: !2807)
!2814 = !DILocation(line: 73, column: 13, scope: !2807)
!2815 = !DILocation(line: 74, column: 5, scope: !2807)
!2816 = !DILocation(line: 72, column: 28, scope: !2802)
!2817 = !DILocation(line: 72, column: 38, scope: !2802)
!2818 = !DILocation(line: 72, column: 35, scope: !2802)
!2819 = !DILocation(line: 72, column: 5, scope: !2802)
!2820 = distinct !{!2820, !2805, !2821, !165}
!2821 = !DILocation(line: 74, column: 5, scope: !2798)
!2822 = !DILocation(line: 75, column: 12, scope: !2784)
!2823 = !DILocation(line: 75, column: 5, scope: !2784)
!2824 = distinct !DISubprogram(name: "mul_f", scope: !838, file: !838, line: 8, type: !2774, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !91)
!2825 = !DILocalVariable(name: "a", arg: 1, scope: !2824, file: !838, line: 8, type: !56)
!2826 = !DILocation(line: 8, column: 49, scope: !2824)
!2827 = !DILocalVariable(name: "b", arg: 2, scope: !2824, file: !838, line: 8, type: !56)
!2828 = !DILocation(line: 8, column: 66, scope: !2824)
!2829 = !DILocalVariable(name: "p", scope: !2824, file: !838, line: 10, type: !56)
!2830 = !DILocation(line: 10, column: 19, scope: !2824)
!2831 = !DILocation(line: 13, column: 10, scope: !2824)
!2832 = !DILocation(line: 13, column: 7, scope: !2824)
!2833 = !DILocation(line: 16, column: 11, scope: !2824)
!2834 = !DILocation(line: 16, column: 13, scope: !2824)
!2835 = !DILocation(line: 16, column: 18, scope: !2824)
!2836 = !DILocation(line: 16, column: 17, scope: !2824)
!2837 = !DILocation(line: 16, column: 10, scope: !2824)
!2838 = !DILocation(line: 16, column: 8, scope: !2824)
!2839 = !DILocation(line: 17, column: 11, scope: !2824)
!2840 = !DILocation(line: 17, column: 13, scope: !2824)
!2841 = !DILocation(line: 17, column: 18, scope: !2824)
!2842 = !DILocation(line: 17, column: 17, scope: !2824)
!2843 = !DILocation(line: 17, column: 7, scope: !2824)
!2844 = !DILocation(line: 18, column: 11, scope: !2824)
!2845 = !DILocation(line: 18, column: 13, scope: !2824)
!2846 = !DILocation(line: 18, column: 18, scope: !2824)
!2847 = !DILocation(line: 18, column: 17, scope: !2824)
!2848 = !DILocation(line: 18, column: 7, scope: !2824)
!2849 = !DILocation(line: 19, column: 11, scope: !2824)
!2850 = !DILocation(line: 19, column: 13, scope: !2824)
!2851 = !DILocation(line: 19, column: 18, scope: !2824)
!2852 = !DILocation(line: 19, column: 17, scope: !2824)
!2853 = !DILocation(line: 19, column: 7, scope: !2824)
!2854 = !DILocalVariable(name: "top_p", scope: !2824, file: !838, line: 22, type: !56)
!2855 = !DILocation(line: 22, column: 19, scope: !2824)
!2856 = !DILocation(line: 22, column: 27, scope: !2824)
!2857 = !DILocation(line: 22, column: 29, scope: !2824)
!2858 = !DILocalVariable(name: "out", scope: !2824, file: !838, line: 23, type: !56)
!2859 = !DILocation(line: 23, column: 19, scope: !2824)
!2860 = !DILocation(line: 23, column: 26, scope: !2824)
!2861 = !DILocation(line: 23, column: 31, scope: !2824)
!2862 = !DILocation(line: 23, column: 37, scope: !2824)
!2863 = !DILocation(line: 23, column: 28, scope: !2824)
!2864 = !DILocation(line: 23, column: 46, scope: !2824)
!2865 = !DILocation(line: 23, column: 52, scope: !2824)
!2866 = !DILocation(line: 23, column: 43, scope: !2824)
!2867 = !DILocation(line: 23, column: 59, scope: !2824)
!2868 = !DILocation(line: 23, column: 25, scope: !2824)
!2869 = !DILocation(line: 24, column: 12, scope: !2824)
!2870 = !DILocation(line: 24, column: 5, scope: !2824)
!2871 = !DILocalVariable(name: "M", arg: 1, scope: !87, file: !88, line: 111, type: !81)
!2872 = !DILocation(line: 111, column: 47, scope: !87)
!2873 = !DILocalVariable(name: "i", scope: !2874, file: !88, line: 117, type: !82)
!2874 = distinct !DILexicalBlock(scope: !87, file: !88, line: 117, column: 5)
!2875 = !DILocation(line: 117, column: 17, scope: !2874)
!2876 = !DILocation(line: 117, column: 10, scope: !2874)
!2877 = !DILocation(line: 117, column: 24, scope: !2878)
!2878 = distinct !DILexicalBlock(scope: !2874, file: !88, line: 117, column: 5)
!2879 = !DILocation(line: 117, column: 26, scope: !2878)
!2880 = !DILocation(line: 117, column: 5, scope: !2874)
!2881 = !DILocalVariable(name: "t", scope: !2882, file: !88, line: 119, type: !46)
!2882 = distinct !DILexicalBlock(scope: !2878, file: !88, line: 118, column: 5)
!2883 = !DILocation(line: 119, column: 18, scope: !2882)
!2884 = !DILocation(line: 119, column: 24, scope: !2882)
!2885 = !DILocation(line: 119, column: 26, scope: !2882)
!2886 = !DILocation(line: 119, column: 29, scope: !2882)
!2887 = !DILocation(line: 119, column: 38, scope: !2882)
!2888 = !DILocation(line: 119, column: 40, scope: !2882)
!2889 = !DILocation(line: 119, column: 41, scope: !2882)
!2890 = !DILocation(line: 119, column: 36, scope: !2882)
!2891 = !DILocation(line: 119, column: 46, scope: !2882)
!2892 = !DILocation(line: 120, column: 19, scope: !2882)
!2893 = !DILocation(line: 120, column: 21, scope: !2882)
!2894 = !DILocation(line: 120, column: 9, scope: !2882)
!2895 = !DILocation(line: 120, column: 11, scope: !2882)
!2896 = !DILocation(line: 120, column: 16, scope: !2882)
!2897 = !DILocation(line: 121, column: 19, scope: !2882)
!2898 = !DILocation(line: 121, column: 9, scope: !2882)
!2899 = !DILocation(line: 121, column: 11, scope: !2882)
!2900 = !DILocation(line: 121, column: 12, scope: !2882)
!2901 = !DILocation(line: 121, column: 16, scope: !2882)
!2902 = !DILocation(line: 122, column: 5, scope: !2882)
!2903 = !DILocation(line: 117, column: 33, scope: !2878)
!2904 = !DILocation(line: 117, column: 5, scope: !2878)
!2905 = distinct !{!2905, !2880, !2906, !165}
!2906 = !DILocation(line: 122, column: 5, scope: !2874)
!2907 = !DILocalVariable(name: "i", scope: !2908, file: !88, line: 124, type: !82)
!2908 = distinct !DILexicalBlock(scope: !87, file: !88, line: 124, column: 5)
!2909 = !DILocation(line: 124, column: 17, scope: !2908)
!2910 = !DILocation(line: 124, column: 10, scope: !2908)
!2911 = !DILocation(line: 124, column: 24, scope: !2912)
!2912 = distinct !DILexicalBlock(scope: !2908, file: !88, line: 124, column: 5)
!2913 = !DILocation(line: 124, column: 26, scope: !2912)
!2914 = !DILocation(line: 124, column: 5, scope: !2908)
!2915 = !DILocalVariable(name: "t0", scope: !2916, file: !88, line: 126, type: !46)
!2916 = distinct !DILexicalBlock(scope: !2912, file: !88, line: 125, column: 5)
!2917 = !DILocation(line: 126, column: 18, scope: !2916)
!2918 = !DILocation(line: 126, column: 25, scope: !2916)
!2919 = !DILocation(line: 126, column: 27, scope: !2916)
!2920 = !DILocation(line: 126, column: 32, scope: !2916)
!2921 = !DILocation(line: 126, column: 40, scope: !2916)
!2922 = !DILocation(line: 126, column: 42, scope: !2916)
!2923 = !DILocation(line: 126, column: 43, scope: !2916)
!2924 = !DILocation(line: 126, column: 38, scope: !2916)
!2925 = !DILocation(line: 126, column: 48, scope: !2916)
!2926 = !DILocalVariable(name: "t1", scope: !2916, file: !88, line: 127, type: !46)
!2927 = !DILocation(line: 127, column: 18, scope: !2916)
!2928 = !DILocation(line: 127, column: 25, scope: !2916)
!2929 = !DILocation(line: 127, column: 27, scope: !2916)
!2930 = !DILocation(line: 127, column: 28, scope: !2916)
!2931 = !DILocation(line: 127, column: 32, scope: !2916)
!2932 = !DILocation(line: 127, column: 40, scope: !2916)
!2933 = !DILocation(line: 127, column: 42, scope: !2916)
!2934 = !DILocation(line: 127, column: 43, scope: !2916)
!2935 = !DILocation(line: 127, column: 38, scope: !2916)
!2936 = !DILocation(line: 127, column: 48, scope: !2916)
!2937 = !DILocation(line: 128, column: 20, scope: !2916)
!2938 = !DILocation(line: 128, column: 23, scope: !2916)
!2939 = !DILocation(line: 128, column: 9, scope: !2916)
!2940 = !DILocation(line: 128, column: 11, scope: !2916)
!2941 = !DILocation(line: 128, column: 16, scope: !2916)
!2942 = !DILocation(line: 129, column: 20, scope: !2916)
!2943 = !DILocation(line: 129, column: 23, scope: !2916)
!2944 = !DILocation(line: 129, column: 9, scope: !2916)
!2945 = !DILocation(line: 129, column: 11, scope: !2916)
!2946 = !DILocation(line: 129, column: 12, scope: !2916)
!2947 = !DILocation(line: 129, column: 16, scope: !2916)
!2948 = !DILocation(line: 130, column: 19, scope: !2916)
!2949 = !DILocation(line: 130, column: 9, scope: !2916)
!2950 = !DILocation(line: 130, column: 11, scope: !2916)
!2951 = !DILocation(line: 130, column: 12, scope: !2916)
!2952 = !DILocation(line: 130, column: 16, scope: !2916)
!2953 = !DILocation(line: 131, column: 19, scope: !2916)
!2954 = !DILocation(line: 131, column: 9, scope: !2916)
!2955 = !DILocation(line: 131, column: 11, scope: !2916)
!2956 = !DILocation(line: 131, column: 12, scope: !2916)
!2957 = !DILocation(line: 131, column: 16, scope: !2916)
!2958 = !DILocation(line: 132, column: 5, scope: !2916)
!2959 = !DILocation(line: 124, column: 33, scope: !2912)
!2960 = !DILocation(line: 124, column: 5, scope: !2912)
!2961 = distinct !{!2961, !2914, !2962, !165}
!2962 = !DILocation(line: 132, column: 5, scope: !2908)
!2963 = !DILocalVariable(name: "i", scope: !2964, file: !88, line: 134, type: !82)
!2964 = distinct !DILexicalBlock(scope: !87, file: !88, line: 134, column: 5)
!2965 = !DILocation(line: 134, column: 17, scope: !2964)
!2966 = !DILocation(line: 134, column: 10, scope: !2964)
!2967 = !DILocation(line: 134, column: 24, scope: !2968)
!2968 = distinct !DILexicalBlock(scope: !2964, file: !88, line: 134, column: 5)
!2969 = !DILocation(line: 134, column: 26, scope: !2968)
!2970 = !DILocation(line: 134, column: 5, scope: !2964)
!2971 = !DILocalVariable(name: "t0", scope: !2972, file: !88, line: 136, type: !46)
!2972 = distinct !DILexicalBlock(scope: !2968, file: !88, line: 135, column: 5)
!2973 = !DILocation(line: 136, column: 18, scope: !2972)
!2974 = !DILocation(line: 136, column: 25, scope: !2972)
!2975 = !DILocation(line: 136, column: 27, scope: !2972)
!2976 = !DILocation(line: 136, column: 32, scope: !2972)
!2977 = !DILocation(line: 136, column: 41, scope: !2972)
!2978 = !DILocation(line: 136, column: 43, scope: !2972)
!2979 = !DILocation(line: 136, column: 44, scope: !2972)
!2980 = !DILocation(line: 136, column: 39, scope: !2972)
!2981 = !DILocation(line: 136, column: 50, scope: !2972)
!2982 = !DILocalVariable(name: "t1", scope: !2972, file: !88, line: 137, type: !46)
!2983 = !DILocation(line: 137, column: 18, scope: !2972)
!2984 = !DILocation(line: 137, column: 25, scope: !2972)
!2985 = !DILocation(line: 137, column: 27, scope: !2972)
!2986 = !DILocation(line: 137, column: 28, scope: !2972)
!2987 = !DILocation(line: 137, column: 32, scope: !2972)
!2988 = !DILocation(line: 137, column: 41, scope: !2972)
!2989 = !DILocation(line: 137, column: 43, scope: !2972)
!2990 = !DILocation(line: 137, column: 44, scope: !2972)
!2991 = !DILocation(line: 137, column: 39, scope: !2972)
!2992 = !DILocation(line: 137, column: 50, scope: !2972)
!2993 = !DILocation(line: 139, column: 20, scope: !2972)
!2994 = !DILocation(line: 139, column: 23, scope: !2972)
!2995 = !DILocation(line: 139, column: 9, scope: !2972)
!2996 = !DILocation(line: 139, column: 11, scope: !2972)
!2997 = !DILocation(line: 139, column: 17, scope: !2972)
!2998 = !DILocation(line: 140, column: 20, scope: !2972)
!2999 = !DILocation(line: 140, column: 23, scope: !2972)
!3000 = !DILocation(line: 140, column: 9, scope: !2972)
!3001 = !DILocation(line: 140, column: 11, scope: !2972)
!3002 = !DILocation(line: 140, column: 12, scope: !2972)
!3003 = !DILocation(line: 140, column: 17, scope: !2972)
!3004 = !DILocation(line: 141, column: 20, scope: !2972)
!3005 = !DILocation(line: 141, column: 9, scope: !2972)
!3006 = !DILocation(line: 141, column: 11, scope: !2972)
!3007 = !DILocation(line: 141, column: 12, scope: !2972)
!3008 = !DILocation(line: 141, column: 17, scope: !2972)
!3009 = !DILocation(line: 142, column: 20, scope: !2972)
!3010 = !DILocation(line: 142, column: 9, scope: !2972)
!3011 = !DILocation(line: 142, column: 11, scope: !2972)
!3012 = !DILocation(line: 142, column: 12, scope: !2972)
!3013 = !DILocation(line: 142, column: 17, scope: !2972)
!3014 = !DILocation(line: 143, column: 5, scope: !2972)
!3015 = !DILocation(line: 134, column: 32, scope: !2968)
!3016 = !DILocation(line: 134, column: 5, scope: !2968)
!3017 = distinct !{!3017, !2970, !3018, !165}
!3018 = !DILocation(line: 143, column: 5, scope: !2964)
!3019 = !DILocalVariable(name: "i", scope: !3020, file: !88, line: 145, type: !82)
!3020 = distinct !DILexicalBlock(scope: !87, file: !88, line: 145, column: 5)
!3021 = !DILocation(line: 145, column: 17, scope: !3020)
!3022 = !DILocation(line: 145, column: 10, scope: !3020)
!3023 = !DILocation(line: 145, column: 24, scope: !3024)
!3024 = distinct !DILexicalBlock(scope: !3020, file: !88, line: 145, column: 5)
!3025 = !DILocation(line: 145, column: 26, scope: !3024)
!3026 = !DILocation(line: 145, column: 5, scope: !3020)
!3027 = !DILocalVariable(name: "t", scope: !3028, file: !88, line: 147, type: !46)
!3028 = distinct !DILexicalBlock(scope: !3024, file: !88, line: 146, column: 5)
!3029 = !DILocation(line: 147, column: 18, scope: !3028)
!3030 = !DILocation(line: 147, column: 24, scope: !3028)
!3031 = !DILocation(line: 147, column: 26, scope: !3028)
!3032 = !DILocation(line: 147, column: 28, scope: !3028)
!3033 = !DILocation(line: 147, column: 36, scope: !3028)
!3034 = !DILocation(line: 147, column: 38, scope: !3028)
!3035 = !DILocation(line: 147, column: 39, scope: !3028)
!3036 = !DILocation(line: 147, column: 34, scope: !3028)
!3037 = !DILocation(line: 147, column: 44, scope: !3028)
!3038 = !DILocation(line: 148, column: 19, scope: !3028)
!3039 = !DILocation(line: 148, column: 21, scope: !3028)
!3040 = !DILocation(line: 148, column: 9, scope: !3028)
!3041 = !DILocation(line: 148, column: 11, scope: !3028)
!3042 = !DILocation(line: 148, column: 16, scope: !3028)
!3043 = !DILocation(line: 149, column: 19, scope: !3028)
!3044 = !DILocation(line: 149, column: 9, scope: !3028)
!3045 = !DILocation(line: 149, column: 11, scope: !3028)
!3046 = !DILocation(line: 149, column: 12, scope: !3028)
!3047 = !DILocation(line: 149, column: 16, scope: !3028)
!3048 = !DILocation(line: 150, column: 5, scope: !3028)
!3049 = !DILocation(line: 145, column: 32, scope: !3024)
!3050 = !DILocation(line: 145, column: 5, scope: !3024)
!3051 = distinct !{!3051, !3026, !3052, !165}
!3052 = !DILocation(line: 150, column: 5, scope: !3020)
!3053 = !DILocation(line: 151, column: 1, scope: !87)
!3054 = distinct !DISubprogram(name: "mul_add_mat_x_m_mat", scope: !606, file: !606, line: 61, type: !714, scopeLine: 62, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !91)
!3055 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !3054, file: !606, line: 61, type: !426)
!3056 = !DILocation(line: 61, column: 36, scope: !3054)
!3057 = !DILocalVariable(name: "mat", arg: 2, scope: !3054, file: !606, line: 61, type: !60)
!3058 = !DILocation(line: 61, column: 70, scope: !3054)
!3059 = !DILocalVariable(name: "bs_mat", arg: 3, scope: !3054, file: !606, line: 61, type: !609)
!3060 = !DILocation(line: 61, column: 91, scope: !3054)
!3061 = !DILocalVariable(name: "acc", arg: 4, scope: !3054, file: !606, line: 61, type: !81)
!3062 = !DILocation(line: 61, column: 109, scope: !3054)
!3063 = !DILocalVariable(name: "mat_rows", arg: 5, scope: !3054, file: !606, line: 62, type: !426)
!3064 = !DILocation(line: 62, column: 36, scope: !3054)
!3065 = !DILocalVariable(name: "mat_cols", arg: 6, scope: !3054, file: !606, line: 62, type: !426)
!3066 = !DILocation(line: 62, column: 56, scope: !3054)
!3067 = !DILocalVariable(name: "bs_mat_cols", arg: 7, scope: !3054, file: !606, line: 62, type: !426)
!3068 = !DILocation(line: 62, column: 76, scope: !3054)
!3069 = !DILocalVariable(name: "r", scope: !3070, file: !606, line: 64, type: !51)
!3070 = distinct !DILexicalBlock(scope: !3054, file: !606, line: 64, column: 5)
!3071 = !DILocation(line: 64, column: 14, scope: !3070)
!3072 = !DILocation(line: 64, column: 10, scope: !3070)
!3073 = !DILocation(line: 64, column: 21, scope: !3074)
!3074 = distinct !DILexicalBlock(scope: !3070, file: !606, line: 64, column: 5)
!3075 = !DILocation(line: 64, column: 25, scope: !3074)
!3076 = !DILocation(line: 64, column: 23, scope: !3074)
!3077 = !DILocation(line: 64, column: 5, scope: !3070)
!3078 = !DILocalVariable(name: "c", scope: !3079, file: !606, line: 65, type: !51)
!3079 = distinct !DILexicalBlock(scope: !3080, file: !606, line: 65, column: 9)
!3080 = distinct !DILexicalBlock(scope: !3074, file: !606, line: 64, column: 40)
!3081 = !DILocation(line: 65, column: 18, scope: !3079)
!3082 = !DILocation(line: 65, column: 14, scope: !3079)
!3083 = !DILocation(line: 65, column: 25, scope: !3084)
!3084 = distinct !DILexicalBlock(scope: !3079, file: !606, line: 65, column: 9)
!3085 = !DILocation(line: 65, column: 29, scope: !3084)
!3086 = !DILocation(line: 65, column: 27, scope: !3084)
!3087 = !DILocation(line: 65, column: 9, scope: !3079)
!3088 = !DILocalVariable(name: "k", scope: !3089, file: !606, line: 66, type: !51)
!3089 = distinct !DILexicalBlock(scope: !3090, file: !606, line: 66, column: 13)
!3090 = distinct !DILexicalBlock(scope: !3084, file: !606, line: 65, column: 44)
!3091 = !DILocation(line: 66, column: 22, scope: !3089)
!3092 = !DILocation(line: 66, column: 18, scope: !3089)
!3093 = !DILocation(line: 66, column: 29, scope: !3094)
!3094 = distinct !DILexicalBlock(scope: !3089, file: !606, line: 66, column: 13)
!3095 = !DILocation(line: 66, column: 33, scope: !3094)
!3096 = !DILocation(line: 66, column: 31, scope: !3094)
!3097 = !DILocation(line: 66, column: 13, scope: !3089)
!3098 = !DILocation(line: 67, column: 31, scope: !3099)
!3099 = distinct !DILexicalBlock(scope: !3094, file: !606, line: 66, column: 54)
!3100 = !DILocation(line: 67, column: 44, scope: !3099)
!3101 = !DILocation(line: 67, column: 53, scope: !3099)
!3102 = !DILocation(line: 67, column: 68, scope: !3099)
!3103 = !DILocation(line: 67, column: 72, scope: !3099)
!3104 = !DILocation(line: 67, column: 70, scope: !3099)
!3105 = !DILocation(line: 67, column: 86, scope: !3099)
!3106 = !DILocation(line: 67, column: 84, scope: !3099)
!3107 = !DILocation(line: 67, column: 65, scope: !3099)
!3108 = !DILocation(line: 67, column: 51, scope: !3099)
!3109 = !DILocation(line: 67, column: 90, scope: !3099)
!3110 = !DILocation(line: 67, column: 94, scope: !3099)
!3111 = !DILocation(line: 67, column: 98, scope: !3099)
!3112 = !DILocation(line: 67, column: 96, scope: !3099)
!3113 = !DILocation(line: 67, column: 109, scope: !3099)
!3114 = !DILocation(line: 67, column: 107, scope: !3099)
!3115 = !DILocation(line: 67, column: 113, scope: !3099)
!3116 = !DILocation(line: 67, column: 119, scope: !3099)
!3117 = !DILocation(line: 67, column: 134, scope: !3099)
!3118 = !DILocation(line: 67, column: 138, scope: !3099)
!3119 = !DILocation(line: 67, column: 136, scope: !3099)
!3120 = !DILocation(line: 67, column: 152, scope: !3099)
!3121 = !DILocation(line: 67, column: 150, scope: !3099)
!3122 = !DILocation(line: 67, column: 131, scope: !3099)
!3123 = !DILocation(line: 67, column: 117, scope: !3099)
!3124 = !DILocation(line: 67, column: 17, scope: !3099)
!3125 = !DILocation(line: 68, column: 13, scope: !3099)
!3126 = !DILocation(line: 66, column: 48, scope: !3094)
!3127 = !DILocation(line: 66, column: 13, scope: !3094)
!3128 = distinct !{!3128, !3097, !3129, !165}
!3129 = !DILocation(line: 68, column: 13, scope: !3089)
!3130 = !DILocation(line: 69, column: 9, scope: !3090)
!3131 = !DILocation(line: 65, column: 40, scope: !3084)
!3132 = !DILocation(line: 65, column: 9, scope: !3084)
!3133 = distinct !{!3133, !3087, !3134, !165}
!3134 = !DILocation(line: 69, column: 9, scope: !3079)
!3135 = !DILocation(line: 70, column: 5, scope: !3080)
!3136 = !DILocation(line: 64, column: 36, scope: !3074)
!3137 = !DILocation(line: 64, column: 5, scope: !3074)
!3138 = distinct !{!3138, !3077, !3139, !165}
!3139 = !DILocation(line: 70, column: 5, scope: !3070)
!3140 = !DILocation(line: 71, column: 1, scope: !3054)
!3141 = distinct !DISubprogram(name: "P1_times_Vt", scope: !606, file: !606, line: 82, type: !694, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !91)
!3142 = !DILocalVariable(name: "p", arg: 1, scope: !3141, file: !606, line: 82, type: !345)
!3143 = !DILocation(line: 82, column: 39, scope: !3141)
!3144 = !DILocalVariable(name: "P1", arg: 2, scope: !3141, file: !606, line: 82, type: !609)
!3145 = !DILocation(line: 82, column: 58, scope: !3141)
!3146 = !DILocalVariable(name: "V", arg: 3, scope: !3141, file: !606, line: 82, type: !60)
!3147 = !DILocation(line: 82, column: 83, scope: !3141)
!3148 = !DILocalVariable(name: "acc", arg: 4, scope: !3141, file: !606, line: 82, type: !81)
!3149 = !DILocation(line: 82, column: 96, scope: !3141)
!3150 = !DILocation(line: 86, column: 48, scope: !3141)
!3151 = !DILocation(line: 86, column: 70, scope: !3141)
!3152 = !DILocation(line: 86, column: 74, scope: !3141)
!3153 = !DILocation(line: 86, column: 77, scope: !3141)
!3154 = !DILocation(line: 86, column: 82, scope: !3141)
!3155 = !DILocation(line: 86, column: 94, scope: !3141)
!3156 = !DILocation(line: 86, column: 106, scope: !3141)
!3157 = !DILocation(line: 86, column: 5, scope: !3141)
!3158 = !DILocation(line: 87, column: 1, scope: !3141)
!3159 = distinct !DISubprogram(name: "mul_add_m_upper_triangular_mat_x_mat_trans", scope: !606, file: !606, line: 32, type: !923, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !91)
!3160 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !3159, file: !606, line: 32, type: !426)
!3161 = !DILocation(line: 32, column: 59, scope: !3159)
!3162 = !DILocalVariable(name: "bs_mat", arg: 2, scope: !3159, file: !606, line: 32, type: !609)
!3163 = !DILocation(line: 32, column: 88, scope: !3159)
!3164 = !DILocalVariable(name: "mat", arg: 3, scope: !3159, file: !606, line: 32, type: !60)
!3165 = !DILocation(line: 32, column: 117, scope: !3159)
!3166 = !DILocalVariable(name: "acc", arg: 4, scope: !3159, file: !606, line: 32, type: !81)
!3167 = !DILocation(line: 32, column: 132, scope: !3159)
!3168 = !DILocalVariable(name: "bs_mat_rows", arg: 5, scope: !3159, file: !606, line: 33, type: !426)
!3169 = !DILocation(line: 33, column: 59, scope: !3159)
!3170 = !DILocalVariable(name: "bs_mat_cols", arg: 6, scope: !3159, file: !606, line: 33, type: !426)
!3171 = !DILocation(line: 33, column: 82, scope: !3159)
!3172 = !DILocalVariable(name: "mat_rows", arg: 7, scope: !3159, file: !606, line: 33, type: !426)
!3173 = !DILocation(line: 33, column: 105, scope: !3159)
!3174 = !DILocalVariable(name: "triangular", arg: 8, scope: !3159, file: !606, line: 33, type: !426)
!3175 = !DILocation(line: 33, column: 125, scope: !3159)
!3176 = !DILocalVariable(name: "bs_mat_entries_used", scope: !3159, file: !606, line: 34, type: !51)
!3177 = !DILocation(line: 34, column: 9, scope: !3159)
!3178 = !DILocalVariable(name: "r", scope: !3179, file: !606, line: 35, type: !51)
!3179 = distinct !DILexicalBlock(scope: !3159, file: !606, line: 35, column: 5)
!3180 = !DILocation(line: 35, column: 14, scope: !3179)
!3181 = !DILocation(line: 35, column: 10, scope: !3179)
!3182 = !DILocation(line: 35, column: 21, scope: !3183)
!3183 = distinct !DILexicalBlock(scope: !3179, file: !606, line: 35, column: 5)
!3184 = !DILocation(line: 35, column: 25, scope: !3183)
!3185 = !DILocation(line: 35, column: 23, scope: !3183)
!3186 = !DILocation(line: 35, column: 5, scope: !3179)
!3187 = !DILocalVariable(name: "c", scope: !3188, file: !606, line: 36, type: !51)
!3188 = distinct !DILexicalBlock(scope: !3189, file: !606, line: 36, column: 9)
!3189 = distinct !DILexicalBlock(scope: !3183, file: !606, line: 35, column: 43)
!3190 = !DILocation(line: 36, column: 18, scope: !3188)
!3191 = !DILocation(line: 36, column: 22, scope: !3188)
!3192 = !DILocation(line: 36, column: 35, scope: !3188)
!3193 = !DILocation(line: 36, column: 33, scope: !3188)
!3194 = !DILocation(line: 36, column: 14, scope: !3188)
!3195 = !DILocation(line: 36, column: 38, scope: !3196)
!3196 = distinct !DILexicalBlock(scope: !3188, file: !606, line: 36, column: 9)
!3197 = !DILocation(line: 36, column: 42, scope: !3196)
!3198 = !DILocation(line: 36, column: 40, scope: !3196)
!3199 = !DILocation(line: 36, column: 9, scope: !3188)
!3200 = !DILocalVariable(name: "k", scope: !3201, file: !606, line: 37, type: !51)
!3201 = distinct !DILexicalBlock(scope: !3202, file: !606, line: 37, column: 13)
!3202 = distinct !DILexicalBlock(scope: !3196, file: !606, line: 36, column: 60)
!3203 = !DILocation(line: 37, column: 22, scope: !3201)
!3204 = !DILocation(line: 37, column: 18, scope: !3201)
!3205 = !DILocation(line: 37, column: 29, scope: !3206)
!3206 = distinct !DILexicalBlock(scope: !3201, file: !606, line: 37, column: 13)
!3207 = !DILocation(line: 37, column: 33, scope: !3206)
!3208 = !DILocation(line: 37, column: 31, scope: !3206)
!3209 = !DILocation(line: 37, column: 13, scope: !3201)
!3210 = !DILocation(line: 38, column: 31, scope: !3211)
!3211 = distinct !DILexicalBlock(scope: !3206, file: !606, line: 37, column: 51)
!3212 = !DILocation(line: 38, column: 44, scope: !3211)
!3213 = !DILocation(line: 38, column: 53, scope: !3211)
!3214 = !DILocation(line: 38, column: 67, scope: !3211)
!3215 = !DILocation(line: 38, column: 65, scope: !3211)
!3216 = !DILocation(line: 38, column: 51, scope: !3211)
!3217 = !DILocation(line: 38, column: 88, scope: !3211)
!3218 = !DILocation(line: 38, column: 92, scope: !3211)
!3219 = !DILocation(line: 38, column: 96, scope: !3211)
!3220 = !DILocation(line: 38, column: 94, scope: !3211)
!3221 = !DILocation(line: 38, column: 110, scope: !3211)
!3222 = !DILocation(line: 38, column: 108, scope: !3211)
!3223 = !DILocation(line: 38, column: 114, scope: !3211)
!3224 = !DILocation(line: 38, column: 120, scope: !3211)
!3225 = !DILocation(line: 38, column: 135, scope: !3211)
!3226 = !DILocation(line: 38, column: 139, scope: !3211)
!3227 = !DILocation(line: 38, column: 137, scope: !3211)
!3228 = !DILocation(line: 38, column: 150, scope: !3211)
!3229 = !DILocation(line: 38, column: 148, scope: !3211)
!3230 = !DILocation(line: 38, column: 132, scope: !3211)
!3231 = !DILocation(line: 38, column: 118, scope: !3211)
!3232 = !DILocation(line: 38, column: 17, scope: !3211)
!3233 = !DILocation(line: 39, column: 13, scope: !3211)
!3234 = !DILocation(line: 37, column: 45, scope: !3206)
!3235 = !DILocation(line: 37, column: 13, scope: !3206)
!3236 = distinct !{!3236, !3209, !3237, !165}
!3237 = !DILocation(line: 39, column: 13, scope: !3201)
!3238 = !DILocation(line: 40, column: 33, scope: !3202)
!3239 = !DILocation(line: 41, column: 9, scope: !3202)
!3240 = !DILocation(line: 36, column: 56, scope: !3196)
!3241 = !DILocation(line: 36, column: 9, scope: !3196)
!3242 = distinct !{!3242, !3199, !3243, !165}
!3243 = !DILocation(line: 41, column: 9, scope: !3188)
!3244 = !DILocation(line: 42, column: 5, scope: !3189)
!3245 = !DILocation(line: 35, column: 39, scope: !3183)
!3246 = !DILocation(line: 35, column: 5, scope: !3183)
!3247 = distinct !{!3247, !3186, !3248, !165}
!3248 = !DILocation(line: 42, column: 5, scope: !3179)
!3249 = !DILocation(line: 43, column: 1, scope: !3159)
!3250 = distinct !DISubprogram(name: "mayo_sign", scope: !88, file: !88, line: 502, type: !1283, scopeLine: 504, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !79, retainedNodes: !91)
!3251 = !DILocalVariable(name: "p", arg: 1, scope: !3250, file: !88, line: 502, type: !345)
!3252 = !DILocation(line: 502, column: 36, scope: !3250)
!3253 = !DILocalVariable(name: "sm", arg: 2, scope: !3250, file: !88, line: 502, type: !55)
!3254 = !DILocation(line: 502, column: 54, scope: !3250)
!3255 = !DILocalVariable(name: "smlen", arg: 3, scope: !3250, file: !88, line: 503, type: !1285)
!3256 = !DILocation(line: 503, column: 23, scope: !3250)
!3257 = !DILocalVariable(name: "m", arg: 4, scope: !3250, file: !88, line: 503, type: !60)
!3258 = !DILocation(line: 503, column: 51, scope: !3250)
!3259 = !DILocalVariable(name: "mlen", arg: 5, scope: !3250, file: !88, line: 504, type: !82)
!3260 = !DILocation(line: 504, column: 22, scope: !3250)
!3261 = !DILocalVariable(name: "csk", arg: 6, scope: !3250, file: !88, line: 504, type: !60)
!3262 = !DILocation(line: 504, column: 49, scope: !3250)
!3263 = !DILocalVariable(name: "ret", scope: !3250, file: !88, line: 505, type: !51)
!3264 = !DILocation(line: 505, column: 9, scope: !3250)
!3265 = !DILocalVariable(name: "param_sig_bytes", scope: !3250, file: !88, line: 506, type: !426)
!3266 = !DILocation(line: 506, column: 15, scope: !3250)
!3267 = !DILocation(line: 506, column: 33, scope: !3250)
!3268 = !DILocalVariable(name: "siglen", scope: !3250, file: !88, line: 507, type: !82)
!3269 = !DILocation(line: 507, column: 12, scope: !3250)
!3270 = !DILocation(line: 508, column: 13, scope: !3250)
!3271 = !DILocation(line: 508, column: 18, scope: !3250)
!3272 = !DILocation(line: 508, column: 16, scope: !3250)
!3273 = !DILocation(line: 508, column: 35, scope: !3250)
!3274 = !DILocation(line: 508, column: 38, scope: !3250)
!3275 = !DILocation(line: 508, column: 5, scope: !3250)
!3276 = !DILocation(line: 509, column: 31, scope: !3250)
!3277 = !DILocation(line: 509, column: 34, scope: !3250)
!3278 = !DILocation(line: 509, column: 47, scope: !3250)
!3279 = !DILocation(line: 509, column: 52, scope: !3250)
!3280 = !DILocation(line: 509, column: 50, scope: !3250)
!3281 = !DILocation(line: 509, column: 69, scope: !3250)
!3282 = !DILocation(line: 509, column: 75, scope: !3250)
!3283 = !DILocation(line: 509, column: 11, scope: !3250)
!3284 = !DILocation(line: 509, column: 9, scope: !3250)
!3285 = !DILocation(line: 510, column: 9, scope: !3286)
!3286 = distinct !DILexicalBlock(scope: !3250, file: !88, line: 510, column: 9)
!3287 = !DILocation(line: 510, column: 13, scope: !3286)
!3288 = !DILocation(line: 510, column: 24, scope: !3286)
!3289 = !DILocation(line: 510, column: 27, scope: !3286)
!3290 = !DILocation(line: 510, column: 46, scope: !3286)
!3291 = !DILocation(line: 510, column: 34, scope: !3286)
!3292 = !DILocation(line: 511, column: 16, scope: !3293)
!3293 = distinct !DILexicalBlock(scope: !3286, file: !88, line: 510, column: 62)
!3294 = !DILocation(line: 511, column: 23, scope: !3293)
!3295 = !DILocation(line: 511, column: 32, scope: !3293)
!3296 = !DILocation(line: 511, column: 30, scope: !3293)
!3297 = !DILocation(line: 511, column: 9, scope: !3293)
!3298 = !DILocation(line: 512, column: 9, scope: !3293)
!3299 = !DILocation(line: 515, column: 14, scope: !3250)
!3300 = !DILocation(line: 515, column: 23, scope: !3250)
!3301 = !DILocation(line: 515, column: 21, scope: !3250)
!3302 = !DILocation(line: 515, column: 6, scope: !3250)
!3303 = !DILocation(line: 515, column: 12, scope: !3250)
!3304 = !DILocation(line: 515, column: 5, scope: !3250)
!3305 = !DILabel(scope: !3250, name: "err", file: !88, line: 516)
!3306 = !DILocation(line: 516, column: 1, scope: !3250)
!3307 = !DILocation(line: 517, column: 12, scope: !3250)
!3308 = !DILocation(line: 517, column: 5, scope: !3250)
!3309 = distinct !DISubprogram(name: "mayo_open", scope: !88, file: !88, line: 520, type: !1283, scopeLine: 522, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !79, retainedNodes: !91)
!3310 = !DILocalVariable(name: "p", arg: 1, scope: !3309, file: !88, line: 520, type: !345)
!3311 = !DILocation(line: 520, column: 36, scope: !3309)
!3312 = !DILocalVariable(name: "m", arg: 2, scope: !3309, file: !88, line: 520, type: !55)
!3313 = !DILocation(line: 520, column: 54, scope: !3309)
!3314 = !DILocalVariable(name: "mlen", arg: 3, scope: !3309, file: !88, line: 521, type: !1285)
!3315 = !DILocation(line: 521, column: 23, scope: !3309)
!3316 = !DILocalVariable(name: "sm", arg: 4, scope: !3309, file: !88, line: 521, type: !60)
!3317 = !DILocation(line: 521, column: 50, scope: !3309)
!3318 = !DILocalVariable(name: "smlen", arg: 5, scope: !3309, file: !88, line: 522, type: !82)
!3319 = !DILocation(line: 522, column: 22, scope: !3309)
!3320 = !DILocalVariable(name: "pk", arg: 6, scope: !3309, file: !88, line: 522, type: !60)
!3321 = !DILocation(line: 522, column: 50, scope: !3309)
!3322 = !DILocalVariable(name: "param_sig_bytes", scope: !3309, file: !88, line: 523, type: !426)
!3323 = !DILocation(line: 523, column: 15, scope: !3309)
!3324 = !DILocation(line: 523, column: 33, scope: !3309)
!3325 = !DILocation(line: 524, column: 9, scope: !3326)
!3326 = distinct !DILexicalBlock(scope: !3309, file: !88, line: 524, column: 9)
!3327 = !DILocation(line: 524, column: 25, scope: !3326)
!3328 = !DILocation(line: 524, column: 15, scope: !3326)
!3329 = !DILocation(line: 525, column: 9, scope: !3330)
!3330 = distinct !DILexicalBlock(scope: !3326, file: !88, line: 524, column: 42)
!3331 = !DILocalVariable(name: "result", scope: !3309, file: !88, line: 527, type: !51)
!3332 = !DILocation(line: 527, column: 9, scope: !3309)
!3333 = !DILocation(line: 527, column: 30, scope: !3309)
!3334 = !DILocation(line: 527, column: 33, scope: !3309)
!3335 = !DILocation(line: 527, column: 38, scope: !3309)
!3336 = !DILocation(line: 527, column: 36, scope: !3309)
!3337 = !DILocation(line: 527, column: 55, scope: !3309)
!3338 = !DILocation(line: 527, column: 63, scope: !3309)
!3339 = !DILocation(line: 527, column: 61, scope: !3309)
!3340 = !DILocation(line: 527, column: 80, scope: !3309)
!3341 = !DILocation(line: 528, column: 30, scope: !3309)
!3342 = !DILocation(line: 527, column: 18, scope: !3309)
!3343 = !DILocation(line: 530, column: 9, scope: !3344)
!3344 = distinct !DILexicalBlock(scope: !3309, file: !88, line: 530, column: 9)
!3345 = !DILocation(line: 530, column: 16, scope: !3344)
!3346 = !DILocation(line: 531, column: 17, scope: !3347)
!3347 = distinct !DILexicalBlock(scope: !3344, file: !88, line: 530, column: 28)
!3348 = !DILocation(line: 531, column: 25, scope: !3347)
!3349 = !DILocation(line: 531, column: 23, scope: !3347)
!3350 = !DILocation(line: 531, column: 10, scope: !3347)
!3351 = !DILocation(line: 531, column: 15, scope: !3347)
!3352 = !DILocation(line: 532, column: 17, scope: !3347)
!3353 = !DILocation(line: 532, column: 20, scope: !3347)
!3354 = !DILocation(line: 532, column: 25, scope: !3347)
!3355 = !DILocation(line: 532, column: 23, scope: !3347)
!3356 = !DILocation(line: 532, column: 43, scope: !3347)
!3357 = !DILocation(line: 532, column: 42, scope: !3347)
!3358 = !DILocation(line: 532, column: 9, scope: !3347)
!3359 = !DILocation(line: 533, column: 5, scope: !3347)
!3360 = !DILocation(line: 535, column: 12, scope: !3309)
!3361 = !DILocation(line: 535, column: 5, scope: !3309)
!3362 = !DILocation(line: 536, column: 1, scope: !3309)
!3363 = distinct !DISubprogram(name: "mayo_verify", scope: !88, file: !88, line: 617, type: !3364, scopeLine: 619, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !79, retainedNodes: !91)
!3364 = !DISubroutineType(types: !3365)
!3365 = !{!51, !345, !60, !82, !60, !60}
!3366 = !DILocalVariable(name: "p", arg: 1, scope: !3363, file: !88, line: 617, type: !345)
!3367 = !DILocation(line: 617, column: 38, scope: !3363)
!3368 = !DILocalVariable(name: "m", arg: 2, scope: !3363, file: !88, line: 617, type: !60)
!3369 = !DILocation(line: 617, column: 62, scope: !3363)
!3370 = !DILocalVariable(name: "mlen", arg: 3, scope: !3363, file: !88, line: 618, type: !82)
!3371 = !DILocation(line: 618, column: 24, scope: !3363)
!3372 = !DILocalVariable(name: "sig", arg: 4, scope: !3363, file: !88, line: 618, type: !60)
!3373 = !DILocation(line: 618, column: 51, scope: !3363)
!3374 = !DILocalVariable(name: "cpk", arg: 5, scope: !3363, file: !88, line: 619, type: !60)
!3375 = !DILocation(line: 619, column: 38, scope: !3363)
!3376 = !DILocalVariable(name: "tEnc", scope: !3363, file: !88, line: 620, type: !1301)
!3377 = !DILocation(line: 620, column: 19, scope: !3363)
!3378 = !DILocalVariable(name: "t", scope: !3363, file: !88, line: 621, type: !1306)
!3379 = !DILocation(line: 621, column: 19, scope: !3363)
!3380 = !DILocalVariable(name: "y", scope: !3363, file: !88, line: 622, type: !3381)
!3381 = !DICompositeType(tag: DW_TAG_array_type, baseType: !56, size: 2272, elements: !3382)
!3382 = !{!3383}
!3383 = !DISubrange(count: 284)
!3384 = !DILocation(line: 622, column: 19, scope: !3363)
!3385 = !DILocalVariable(name: "s", scope: !3363, file: !88, line: 623, type: !1333)
!3386 = !DILocation(line: 623, column: 19, scope: !3363)
!3387 = !DILocalVariable(name: "pk", scope: !3363, file: !88, line: 624, type: !3388)
!3388 = !DICompositeType(tag: DW_TAG_array_type, baseType: !46, size: 7326720, elements: !3389)
!3389 = !{!3390}
!3390 = !DISubrange(count: 114480)
!3391 = !DILocation(line: 624, column: 14, scope: !3363)
!3392 = !DILocalVariable(name: "tmp", scope: !3363, file: !88, line: 625, type: !3393)
!3393 = !DICompositeType(tag: DW_TAG_array_type, baseType: !56, size: 832, elements: !3394)
!3394 = !{!3395}
!3395 = !DISubrange(count: 104)
!3396 = !DILocation(line: 625, column: 19, scope: !3363)
!3397 = !DILocalVariable(name: "param_m", scope: !3363, file: !88, line: 627, type: !426)
!3398 = !DILocation(line: 627, column: 15, scope: !3363)
!3399 = !DILocation(line: 627, column: 25, scope: !3363)
!3400 = !DILocalVariable(name: "param_n", scope: !3363, file: !88, line: 628, type: !426)
!3401 = !DILocation(line: 628, column: 15, scope: !3363)
!3402 = !DILocation(line: 628, column: 25, scope: !3363)
!3403 = !DILocalVariable(name: "param_k", scope: !3363, file: !88, line: 629, type: !426)
!3404 = !DILocation(line: 629, column: 15, scope: !3363)
!3405 = !DILocation(line: 629, column: 25, scope: !3363)
!3406 = !DILocalVariable(name: "param_m_bytes", scope: !3363, file: !88, line: 630, type: !426)
!3407 = !DILocation(line: 630, column: 15, scope: !3363)
!3408 = !DILocation(line: 630, column: 31, scope: !3363)
!3409 = !DILocalVariable(name: "param_sig_bytes", scope: !3363, file: !88, line: 631, type: !426)
!3410 = !DILocation(line: 631, column: 15, scope: !3363)
!3411 = !DILocation(line: 631, column: 33, scope: !3363)
!3412 = !DILocalVariable(name: "param_digest_bytes", scope: !3363, file: !88, line: 632, type: !426)
!3413 = !DILocation(line: 632, column: 15, scope: !3363)
!3414 = !DILocation(line: 632, column: 36, scope: !3363)
!3415 = !DILocalVariable(name: "param_salt_bytes", scope: !3363, file: !88, line: 633, type: !426)
!3416 = !DILocation(line: 633, column: 15, scope: !3363)
!3417 = !DILocation(line: 633, column: 34, scope: !3363)
!3418 = !DILocalVariable(name: "ret", scope: !3363, file: !88, line: 635, type: !51)
!3419 = !DILocation(line: 635, column: 9, scope: !3363)
!3420 = !DILocation(line: 635, column: 30, scope: !3363)
!3421 = !DILocation(line: 635, column: 33, scope: !3363)
!3422 = !DILocation(line: 635, column: 38, scope: !3363)
!3423 = !DILocation(line: 635, column: 15, scope: !3363)
!3424 = !DILocation(line: 636, column: 9, scope: !3425)
!3425 = distinct !DILexicalBlock(scope: !3363, file: !88, line: 636, column: 9)
!3426 = !DILocation(line: 636, column: 13, scope: !3425)
!3427 = !DILocation(line: 637, column: 9, scope: !3428)
!3428 = distinct !DILexicalBlock(scope: !3425, file: !88, line: 636, column: 25)
!3429 = !DILocalVariable(name: "P1", scope: !3363, file: !88, line: 640, type: !81)
!3430 = !DILocation(line: 640, column: 15, scope: !3363)
!3431 = !DILocation(line: 640, column: 20, scope: !3363)
!3432 = !DILocalVariable(name: "P2", scope: !3363, file: !88, line: 641, type: !81)
!3433 = !DILocation(line: 641, column: 15, scope: !3363)
!3434 = !DILocation(line: 641, column: 20, scope: !3363)
!3435 = !DILocation(line: 641, column: 25, scope: !3363)
!3436 = !DILocation(line: 641, column: 23, scope: !3363)
!3437 = !DILocalVariable(name: "P3", scope: !3363, file: !88, line: 642, type: !81)
!3438 = !DILocation(line: 642, column: 15, scope: !3363)
!3439 = !DILocation(line: 642, column: 20, scope: !3363)
!3440 = !DILocation(line: 642, column: 25, scope: !3363)
!3441 = !DILocation(line: 642, column: 23, scope: !3363)
!3442 = !DILocation(line: 657, column: 14, scope: !3363)
!3443 = !DILocation(line: 657, column: 19, scope: !3363)
!3444 = !DILocation(line: 657, column: 39, scope: !3363)
!3445 = !DILocation(line: 657, column: 42, scope: !3363)
!3446 = !DILocation(line: 657, column: 5, scope: !3363)
!3447 = !DILocation(line: 660, column: 12, scope: !3363)
!3448 = !DILocation(line: 660, column: 18, scope: !3363)
!3449 = !DILocation(line: 660, column: 16, scope: !3363)
!3450 = !DILocation(line: 660, column: 38, scope: !3363)
!3451 = !DILocation(line: 660, column: 44, scope: !3363)
!3452 = !DILocation(line: 660, column: 42, scope: !3363)
!3453 = !DILocation(line: 660, column: 62, scope: !3363)
!3454 = !DILocation(line: 660, column: 60, scope: !3363)
!3455 = !DILocation(line: 661, column: 12, scope: !3363)
!3456 = !DILocation(line: 660, column: 5, scope: !3363)
!3457 = !DILocation(line: 662, column: 14, scope: !3363)
!3458 = !DILocation(line: 662, column: 20, scope: !3363)
!3459 = !DILocation(line: 662, column: 35, scope: !3363)
!3460 = !DILocation(line: 662, column: 40, scope: !3363)
!3461 = !DILocation(line: 662, column: 61, scope: !3363)
!3462 = !DILocation(line: 662, column: 59, scope: !3363)
!3463 = !DILocation(line: 662, column: 5, scope: !3363)
!3464 = !DILocation(line: 663, column: 12, scope: !3363)
!3465 = !DILocation(line: 663, column: 18, scope: !3363)
!3466 = !DILocation(line: 663, column: 21, scope: !3363)
!3467 = !DILocation(line: 663, column: 5, scope: !3363)
!3468 = !DILocation(line: 666, column: 12, scope: !3363)
!3469 = !DILocation(line: 666, column: 17, scope: !3363)
!3470 = !DILocation(line: 666, column: 20, scope: !3363)
!3471 = !DILocation(line: 666, column: 30, scope: !3363)
!3472 = !DILocation(line: 666, column: 28, scope: !3363)
!3473 = !DILocation(line: 666, column: 5, scope: !3363)
!3474 = !DILocation(line: 668, column: 21, scope: !3363)
!3475 = !DILocation(line: 668, column: 24, scope: !3363)
!3476 = !DILocation(line: 668, column: 27, scope: !3363)
!3477 = !DILocation(line: 668, column: 31, scope: !3363)
!3478 = !DILocation(line: 668, column: 35, scope: !3363)
!3479 = !DILocation(line: 668, column: 39, scope: !3363)
!3480 = !DILocation(line: 668, column: 5, scope: !3363)
!3481 = !DILocation(line: 670, column: 16, scope: !3482)
!3482 = distinct !DILexicalBlock(scope: !3363, file: !88, line: 670, column: 9)
!3483 = !DILocation(line: 670, column: 19, scope: !3482)
!3484 = !DILocation(line: 670, column: 22, scope: !3482)
!3485 = !DILocation(line: 670, column: 9, scope: !3482)
!3486 = !DILocation(line: 670, column: 31, scope: !3482)
!3487 = !DILocation(line: 671, column: 9, scope: !3488)
!3488 = distinct !DILexicalBlock(scope: !3482, file: !88, line: 670, column: 37)
!3489 = !DILocation(line: 673, column: 5, scope: !3363)
!3490 = !DILocation(line: 674, column: 1, scope: !3363)
!3491 = distinct !DISubprogram(name: "mayo_expand_pk", scope: !88, file: !88, line: 608, type: !3492, scopeLine: 609, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !79, retainedNodes: !91)
!3492 = !DISubroutineType(types: !3493)
!3493 = !{!51, !345, !60, !81}
!3494 = !DILocalVariable(name: "p", arg: 1, scope: !3491, file: !88, line: 608, type: !345)
!3495 = !DILocation(line: 608, column: 41, scope: !3491)
!3496 = !DILocalVariable(name: "cpk", arg: 2, scope: !3491, file: !88, line: 608, type: !60)
!3497 = !DILocation(line: 608, column: 65, scope: !3491)
!3498 = !DILocalVariable(name: "pk", arg: 3, scope: !3491, file: !88, line: 609, type: !81)
!3499 = !DILocation(line: 609, column: 30, scope: !3491)
!3500 = !DILocation(line: 610, column: 18, scope: !3491)
!3501 = !DILocation(line: 610, column: 21, scope: !3491)
!3502 = !DILocation(line: 610, column: 25, scope: !3491)
!3503 = !DILocation(line: 610, column: 5, scope: !3491)
!3504 = !DILocation(line: 612, column: 19, scope: !3491)
!3505 = !DILocation(line: 612, column: 25, scope: !3491)
!3506 = !DILocation(line: 612, column: 23, scope: !3491)
!3507 = !DILocation(line: 612, column: 49, scope: !3491)
!3508 = !DILocation(line: 612, column: 54, scope: !3491)
!3509 = !DILocation(line: 612, column: 52, scope: !3491)
!3510 = !DILocation(line: 612, column: 74, scope: !3491)
!3511 = !DILocation(line: 612, column: 72, scope: !3491)
!3512 = !DILocation(line: 612, column: 93, scope: !3491)
!3513 = !DILocation(line: 612, column: 111, scope: !3491)
!3514 = !DILocation(line: 612, column: 110, scope: !3491)
!3515 = !DILocation(line: 612, column: 133, scope: !3491)
!3516 = !DILocation(line: 612, column: 5, scope: !3491)
!3517 = !DILocation(line: 614, column: 5, scope: !3491)
!3518 = distinct !DISubprogram(name: "eval_public_map", scope: !88, file: !88, line: 288, type: !3519, scopeLine: 288, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !91)
!3519 = !DISubroutineType(types: !3520)
!3520 = !{null, !345, !60, !609, !609, !609, !55}
!3521 = !DILocalVariable(name: "p", arg: 1, scope: !3518, file: !88, line: 288, type: !345)
!3522 = !DILocation(line: 288, column: 50, scope: !3518)
!3523 = !DILocalVariable(name: "s", arg: 2, scope: !3518, file: !88, line: 288, type: !60)
!3524 = !DILocation(line: 288, column: 74, scope: !3518)
!3525 = !DILocalVariable(name: "P1", arg: 3, scope: !3518, file: !88, line: 288, type: !609)
!3526 = !DILocation(line: 288, column: 93, scope: !3518)
!3527 = !DILocalVariable(name: "P2", arg: 4, scope: !3518, file: !88, line: 288, type: !609)
!3528 = !DILocation(line: 288, column: 113, scope: !3518)
!3529 = !DILocalVariable(name: "P3", arg: 5, scope: !3518, file: !88, line: 288, type: !609)
!3530 = !DILocation(line: 288, column: 133, scope: !3518)
!3531 = !DILocalVariable(name: "eval", arg: 6, scope: !3518, file: !88, line: 288, type: !55)
!3532 = !DILocation(line: 288, column: 152, scope: !3518)
!3533 = !DILocalVariable(name: "SPS", scope: !3518, file: !88, line: 289, type: !3534)
!3534 = !DICompositeType(tag: DW_TAG_array_type, baseType: !46, size: 82944, elements: !3535)
!3535 = !{!3536}
!3536 = !DISubrange(count: 1296)
!3537 = !DILocation(line: 289, column: 14, scope: !3518)
!3538 = !DILocation(line: 291, column: 24, scope: !3518)
!3539 = !DILocation(line: 291, column: 27, scope: !3518)
!3540 = !DILocation(line: 291, column: 31, scope: !3518)
!3541 = !DILocation(line: 291, column: 35, scope: !3518)
!3542 = !DILocation(line: 291, column: 39, scope: !3518)
!3543 = !DILocation(line: 291, column: 42, scope: !3518)
!3544 = !DILocation(line: 291, column: 5, scope: !3518)
!3545 = !DILocalVariable(name: "zero", scope: !3518, file: !88, line: 292, type: !1306)
!3546 = !DILocation(line: 292, column: 19, scope: !3518)
!3547 = !DILocation(line: 293, column: 17, scope: !3518)
!3548 = !DILocation(line: 293, column: 20, scope: !3518)
!3549 = !DILocation(line: 293, column: 25, scope: !3518)
!3550 = !DILocation(line: 293, column: 31, scope: !3518)
!3551 = !DILocation(line: 293, column: 5, scope: !3518)
!3552 = !DILocation(line: 294, column: 1, scope: !3518)
!3553 = distinct !DISubprogram(name: "m_calculate_PS_SPS", scope: !606, file: !606, line: 277, type: !3554, scopeLine: 278, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !91)
!3554 = !DISubroutineType(types: !3555)
!3555 = !{null, !345, !609, !609, !609, !60, !81}
!3556 = !DILocalVariable(name: "p", arg: 1, scope: !3553, file: !606, line: 277, type: !345)
!3557 = !DILocation(line: 277, column: 60, scope: !3553)
!3558 = !DILocalVariable(name: "P1", arg: 2, scope: !3553, file: !606, line: 277, type: !609)
!3559 = !DILocation(line: 277, column: 79, scope: !3553)
!3560 = !DILocalVariable(name: "P2", arg: 3, scope: !3553, file: !606, line: 277, type: !609)
!3561 = !DILocation(line: 277, column: 99, scope: !3553)
!3562 = !DILocalVariable(name: "P3", arg: 4, scope: !3553, file: !606, line: 277, type: !609)
!3563 = !DILocation(line: 277, column: 119, scope: !3553)
!3564 = !DILocalVariable(name: "s", arg: 5, scope: !3553, file: !606, line: 277, type: !60)
!3565 = !DILocation(line: 277, column: 144, scope: !3553)
!3566 = !DILocalVariable(name: "SPS", arg: 6, scope: !3553, file: !606, line: 278, type: !81)
!3567 = !DILocation(line: 278, column: 49, scope: !3553)
!3568 = !DILocalVariable(name: "PS", scope: !3553, file: !606, line: 286, type: !3569)
!3569 = !DICompositeType(tag: DW_TAG_array_type, baseType: !46, size: 1064448, elements: !3570)
!3570 = !{!3571}
!3571 = !DISubrange(count: 16632)
!3572 = !DILocation(line: 286, column: 14, scope: !3553)
!3573 = !DILocation(line: 287, column: 33, scope: !3553)
!3574 = !DILocation(line: 287, column: 37, scope: !3553)
!3575 = !DILocation(line: 287, column: 41, scope: !3553)
!3576 = !DILocation(line: 287, column: 45, scope: !3553)
!3577 = !DILocation(line: 287, column: 48, scope: !3553)
!3578 = !DILocation(line: 287, column: 60, scope: !3553)
!3579 = !DILocation(line: 287, column: 72, scope: !3553)
!3580 = !DILocation(line: 287, column: 84, scope: !3553)
!3581 = !DILocation(line: 287, column: 96, scope: !3553)
!3582 = !DILocation(line: 287, column: 5, scope: !3553)
!3583 = !DILocation(line: 290, column: 34, scope: !3553)
!3584 = !DILocation(line: 290, column: 38, scope: !3553)
!3585 = !DILocation(line: 290, column: 41, scope: !3553)
!3586 = !DILocation(line: 290, column: 53, scope: !3553)
!3587 = !DILocation(line: 290, column: 65, scope: !3553)
!3588 = !DILocation(line: 290, column: 77, scope: !3553)
!3589 = !DILocation(line: 290, column: 5, scope: !3553)
!3590 = !DILocation(line: 292, column: 1, scope: !3553)
!3591 = distinct !DISubprogram(name: "mayo_generic_m_calculate_PS", scope: !606, file: !606, line: 151, type: !3592, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !91)
!3592 = !DISubroutineType(types: !3593)
!3593 = !{null, !609, !609, !609, !60, !426, !426, !426, !426, !81}
!3594 = !DILocalVariable(name: "P1", arg: 1, scope: !3591, file: !606, line: 151, type: !609)
!3595 = !DILocation(line: 151, column: 64, scope: !3591)
!3596 = !DILocalVariable(name: "P2", arg: 2, scope: !3591, file: !606, line: 151, type: !609)
!3597 = !DILocation(line: 151, column: 84, scope: !3591)
!3598 = !DILocalVariable(name: "P3", arg: 3, scope: !3591, file: !606, line: 151, type: !609)
!3599 = !DILocation(line: 151, column: 104, scope: !3591)
!3600 = !DILocalVariable(name: "S", arg: 4, scope: !3591, file: !606, line: 151, type: !60)
!3601 = !DILocation(line: 151, column: 129, scope: !3591)
!3602 = !DILocalVariable(name: "m", arg: 5, scope: !3591, file: !606, line: 152, type: !426)
!3603 = !DILocation(line: 152, column: 58, scope: !3591)
!3604 = !DILocalVariable(name: "v", arg: 6, scope: !3591, file: !606, line: 152, type: !426)
!3605 = !DILocation(line: 152, column: 71, scope: !3591)
!3606 = !DILocalVariable(name: "o", arg: 7, scope: !3591, file: !606, line: 152, type: !426)
!3607 = !DILocation(line: 152, column: 84, scope: !3591)
!3608 = !DILocalVariable(name: "k", arg: 8, scope: !3591, file: !606, line: 152, type: !426)
!3609 = !DILocation(line: 152, column: 97, scope: !3591)
!3610 = !DILocalVariable(name: "PS", arg: 9, scope: !3591, file: !606, line: 152, type: !81)
!3611 = !DILocation(line: 152, column: 110, scope: !3591)
!3612 = !DILocalVariable(name: "n", scope: !3591, file: !606, line: 154, type: !426)
!3613 = !DILocation(line: 154, column: 15, scope: !3591)
!3614 = !DILocation(line: 154, column: 19, scope: !3591)
!3615 = !DILocation(line: 154, column: 23, scope: !3591)
!3616 = !DILocation(line: 154, column: 21, scope: !3591)
!3617 = !DILocalVariable(name: "m_vec_limbs", scope: !3591, file: !606, line: 155, type: !426)
!3618 = !DILocation(line: 155, column: 15, scope: !3591)
!3619 = !DILocation(line: 155, column: 30, scope: !3591)
!3620 = !DILocation(line: 155, column: 32, scope: !3591)
!3621 = !DILocation(line: 155, column: 37, scope: !3591)
!3622 = !DILocalVariable(name: "accumulator", scope: !3591, file: !606, line: 157, type: !3623)
!3623 = !DICompositeType(tag: DW_TAG_array_type, baseType: !46, size: 17031168, elements: !3624)
!3624 = !{!3625}
!3625 = !DISubrange(count: 266112)
!3626 = !DILocation(line: 157, column: 14, scope: !3591)
!3627 = !DILocalVariable(name: "P1_used", scope: !3591, file: !606, line: 158, type: !51)
!3628 = !DILocation(line: 158, column: 9, scope: !3591)
!3629 = !DILocalVariable(name: "row", scope: !3630, file: !606, line: 159, type: !51)
!3630 = distinct !DILexicalBlock(scope: !3591, file: !606, line: 159, column: 5)
!3631 = !DILocation(line: 159, column: 14, scope: !3630)
!3632 = !DILocation(line: 159, column: 10, scope: !3630)
!3633 = !DILocation(line: 159, column: 23, scope: !3634)
!3634 = distinct !DILexicalBlock(scope: !3630, file: !606, line: 159, column: 5)
!3635 = !DILocation(line: 159, column: 29, scope: !3634)
!3636 = !DILocation(line: 159, column: 27, scope: !3634)
!3637 = !DILocation(line: 159, column: 5, scope: !3630)
!3638 = !DILocalVariable(name: "j", scope: !3639, file: !606, line: 160, type: !51)
!3639 = distinct !DILexicalBlock(scope: !3640, file: !606, line: 160, column: 9)
!3640 = distinct !DILexicalBlock(scope: !3634, file: !606, line: 159, column: 39)
!3641 = !DILocation(line: 160, column: 18, scope: !3639)
!3642 = !DILocation(line: 160, column: 22, scope: !3639)
!3643 = !DILocation(line: 160, column: 14, scope: !3639)
!3644 = !DILocation(line: 160, column: 27, scope: !3645)
!3645 = distinct !DILexicalBlock(scope: !3639, file: !606, line: 160, column: 9)
!3646 = !DILocation(line: 160, column: 31, scope: !3645)
!3647 = !DILocation(line: 160, column: 29, scope: !3645)
!3648 = !DILocation(line: 160, column: 9, scope: !3639)
!3649 = !DILocalVariable(name: "col", scope: !3650, file: !606, line: 161, type: !51)
!3650 = distinct !DILexicalBlock(scope: !3651, file: !606, line: 161, column: 13)
!3651 = distinct !DILexicalBlock(scope: !3645, file: !606, line: 160, column: 39)
!3652 = !DILocation(line: 161, column: 22, scope: !3650)
!3653 = !DILocation(line: 161, column: 18, scope: !3650)
!3654 = !DILocation(line: 161, column: 31, scope: !3655)
!3655 = distinct !DILexicalBlock(scope: !3650, file: !606, line: 161, column: 13)
!3656 = !DILocation(line: 161, column: 37, scope: !3655)
!3657 = !DILocation(line: 161, column: 35, scope: !3655)
!3658 = !DILocation(line: 161, column: 13, scope: !3650)
!3659 = !DILocation(line: 162, column: 27, scope: !3660)
!3660 = distinct !DILexicalBlock(scope: !3655, file: !606, line: 161, column: 47)
!3661 = !DILocation(line: 162, column: 40, scope: !3660)
!3662 = !DILocation(line: 162, column: 46, scope: !3660)
!3663 = !DILocation(line: 162, column: 56, scope: !3660)
!3664 = !DILocation(line: 162, column: 54, scope: !3660)
!3665 = !DILocation(line: 162, column: 43, scope: !3660)
!3666 = !DILocation(line: 162, column: 70, scope: !3660)
!3667 = !DILocation(line: 162, column: 87, scope: !3660)
!3668 = !DILocation(line: 162, column: 93, scope: !3660)
!3669 = !DILocation(line: 162, column: 91, scope: !3660)
!3670 = !DILocation(line: 162, column: 97, scope: !3660)
!3671 = !DILocation(line: 162, column: 95, scope: !3660)
!3672 = !DILocation(line: 162, column: 102, scope: !3660)
!3673 = !DILocation(line: 162, column: 109, scope: !3660)
!3674 = !DILocation(line: 162, column: 111, scope: !3660)
!3675 = !DILocation(line: 162, column: 117, scope: !3660)
!3676 = !DILocation(line: 162, column: 115, scope: !3660)
!3677 = !DILocation(line: 162, column: 121, scope: !3660)
!3678 = !DILocation(line: 162, column: 119, scope: !3660)
!3679 = !DILocation(line: 162, column: 107, scope: !3660)
!3680 = !DILocation(line: 162, column: 126, scope: !3660)
!3681 = !DILocation(line: 162, column: 125, scope: !3660)
!3682 = !DILocation(line: 162, column: 82, scope: !3660)
!3683 = !DILocation(line: 162, column: 17, scope: !3660)
!3684 = !DILocation(line: 163, column: 13, scope: !3660)
!3685 = !DILocation(line: 161, column: 43, scope: !3655)
!3686 = !DILocation(line: 161, column: 13, scope: !3655)
!3687 = distinct !{!3687, !3658, !3688, !165}
!3688 = !DILocation(line: 163, column: 13, scope: !3650)
!3689 = !DILocation(line: 164, column: 21, scope: !3651)
!3690 = !DILocation(line: 165, column: 9, scope: !3651)
!3691 = !DILocation(line: 160, column: 35, scope: !3645)
!3692 = !DILocation(line: 160, column: 9, scope: !3645)
!3693 = distinct !{!3693, !3648, !3694, !165}
!3694 = !DILocation(line: 165, column: 9, scope: !3639)
!3695 = !DILocalVariable(name: "j", scope: !3696, file: !606, line: 167, type: !51)
!3696 = distinct !DILexicalBlock(scope: !3640, file: !606, line: 167, column: 9)
!3697 = !DILocation(line: 167, column: 18, scope: !3696)
!3698 = !DILocation(line: 167, column: 14, scope: !3696)
!3699 = !DILocation(line: 167, column: 25, scope: !3700)
!3700 = distinct !DILexicalBlock(scope: !3696, file: !606, line: 167, column: 9)
!3701 = !DILocation(line: 167, column: 29, scope: !3700)
!3702 = !DILocation(line: 167, column: 27, scope: !3700)
!3703 = !DILocation(line: 167, column: 9, scope: !3696)
!3704 = !DILocalVariable(name: "col", scope: !3705, file: !606, line: 168, type: !51)
!3705 = distinct !DILexicalBlock(scope: !3706, file: !606, line: 168, column: 13)
!3706 = distinct !DILexicalBlock(scope: !3700, file: !606, line: 167, column: 37)
!3707 = !DILocation(line: 168, column: 22, scope: !3705)
!3708 = !DILocation(line: 168, column: 18, scope: !3705)
!3709 = !DILocation(line: 168, column: 31, scope: !3710)
!3710 = distinct !DILexicalBlock(scope: !3705, file: !606, line: 168, column: 13)
!3711 = !DILocation(line: 168, column: 37, scope: !3710)
!3712 = !DILocation(line: 168, column: 35, scope: !3710)
!3713 = !DILocation(line: 168, column: 13, scope: !3705)
!3714 = !DILocation(line: 169, column: 27, scope: !3715)
!3715 = distinct !DILexicalBlock(scope: !3710, file: !606, line: 168, column: 47)
!3716 = !DILocation(line: 169, column: 40, scope: !3715)
!3717 = !DILocation(line: 169, column: 46, scope: !3715)
!3718 = !DILocation(line: 169, column: 52, scope: !3715)
!3719 = !DILocation(line: 169, column: 50, scope: !3715)
!3720 = !DILocation(line: 169, column: 56, scope: !3715)
!3721 = !DILocation(line: 169, column: 54, scope: !3715)
!3722 = !DILocation(line: 169, column: 59, scope: !3715)
!3723 = !DILocation(line: 169, column: 58, scope: !3715)
!3724 = !DILocation(line: 169, column: 43, scope: !3715)
!3725 = !DILocation(line: 169, column: 72, scope: !3715)
!3726 = !DILocation(line: 169, column: 89, scope: !3715)
!3727 = !DILocation(line: 169, column: 95, scope: !3715)
!3728 = !DILocation(line: 169, column: 93, scope: !3715)
!3729 = !DILocation(line: 169, column: 99, scope: !3715)
!3730 = !DILocation(line: 169, column: 97, scope: !3715)
!3731 = !DILocation(line: 169, column: 104, scope: !3715)
!3732 = !DILocation(line: 169, column: 111, scope: !3715)
!3733 = !DILocation(line: 169, column: 114, scope: !3715)
!3734 = !DILocation(line: 169, column: 120, scope: !3715)
!3735 = !DILocation(line: 169, column: 118, scope: !3715)
!3736 = !DILocation(line: 169, column: 125, scope: !3715)
!3737 = !DILocation(line: 169, column: 123, scope: !3715)
!3738 = !DILocation(line: 169, column: 129, scope: !3715)
!3739 = !DILocation(line: 169, column: 127, scope: !3715)
!3740 = !DILocation(line: 169, column: 109, scope: !3715)
!3741 = !DILocation(line: 169, column: 135, scope: !3715)
!3742 = !DILocation(line: 169, column: 133, scope: !3715)
!3743 = !DILocation(line: 169, column: 84, scope: !3715)
!3744 = !DILocation(line: 169, column: 17, scope: !3715)
!3745 = !DILocation(line: 170, column: 13, scope: !3715)
!3746 = !DILocation(line: 168, column: 43, scope: !3710)
!3747 = !DILocation(line: 168, column: 13, scope: !3710)
!3748 = distinct !{!3748, !3713, !3749, !165}
!3749 = !DILocation(line: 170, column: 13, scope: !3705)
!3750 = !DILocation(line: 171, column: 9, scope: !3706)
!3751 = !DILocation(line: 167, column: 33, scope: !3700)
!3752 = !DILocation(line: 167, column: 9, scope: !3700)
!3753 = distinct !{!3753, !3703, !3754, !165}
!3754 = !DILocation(line: 171, column: 9, scope: !3696)
!3755 = !DILocation(line: 172, column: 5, scope: !3640)
!3756 = !DILocation(line: 159, column: 35, scope: !3634)
!3757 = !DILocation(line: 159, column: 5, scope: !3634)
!3758 = distinct !{!3758, !3637, !3759, !165}
!3759 = !DILocation(line: 172, column: 5, scope: !3630)
!3760 = !DILocalVariable(name: "P3_used", scope: !3591, file: !606, line: 174, type: !51)
!3761 = !DILocation(line: 174, column: 9, scope: !3591)
!3762 = !DILocalVariable(name: "row", scope: !3763, file: !606, line: 175, type: !51)
!3763 = distinct !DILexicalBlock(scope: !3591, file: !606, line: 175, column: 5)
!3764 = !DILocation(line: 175, column: 14, scope: !3763)
!3765 = !DILocation(line: 175, column: 20, scope: !3763)
!3766 = !DILocation(line: 175, column: 10, scope: !3763)
!3767 = !DILocation(line: 175, column: 23, scope: !3768)
!3768 = distinct !DILexicalBlock(scope: !3763, file: !606, line: 175, column: 5)
!3769 = !DILocation(line: 175, column: 29, scope: !3768)
!3770 = !DILocation(line: 175, column: 27, scope: !3768)
!3771 = !DILocation(line: 175, column: 5, scope: !3763)
!3772 = !DILocalVariable(name: "j", scope: !3773, file: !606, line: 176, type: !51)
!3773 = distinct !DILexicalBlock(scope: !3774, file: !606, line: 176, column: 9)
!3774 = distinct !DILexicalBlock(scope: !3768, file: !606, line: 175, column: 39)
!3775 = !DILocation(line: 176, column: 18, scope: !3773)
!3776 = !DILocation(line: 176, column: 22, scope: !3773)
!3777 = !DILocation(line: 176, column: 14, scope: !3773)
!3778 = !DILocation(line: 176, column: 27, scope: !3779)
!3779 = distinct !DILexicalBlock(scope: !3773, file: !606, line: 176, column: 9)
!3780 = !DILocation(line: 176, column: 31, scope: !3779)
!3781 = !DILocation(line: 176, column: 29, scope: !3779)
!3782 = !DILocation(line: 176, column: 9, scope: !3773)
!3783 = !DILocalVariable(name: "col", scope: !3784, file: !606, line: 177, type: !51)
!3784 = distinct !DILexicalBlock(scope: !3785, file: !606, line: 177, column: 13)
!3785 = distinct !DILexicalBlock(scope: !3779, file: !606, line: 176, column: 39)
!3786 = !DILocation(line: 177, column: 22, scope: !3784)
!3787 = !DILocation(line: 177, column: 18, scope: !3784)
!3788 = !DILocation(line: 177, column: 31, scope: !3789)
!3789 = distinct !DILexicalBlock(scope: !3784, file: !606, line: 177, column: 13)
!3790 = !DILocation(line: 177, column: 37, scope: !3789)
!3791 = !DILocation(line: 177, column: 35, scope: !3789)
!3792 = !DILocation(line: 177, column: 13, scope: !3784)
!3793 = !DILocation(line: 178, column: 27, scope: !3794)
!3794 = distinct !DILexicalBlock(scope: !3789, file: !606, line: 177, column: 47)
!3795 = !DILocation(line: 178, column: 40, scope: !3794)
!3796 = !DILocation(line: 178, column: 45, scope: !3794)
!3797 = !DILocation(line: 178, column: 55, scope: !3794)
!3798 = !DILocation(line: 178, column: 53, scope: !3794)
!3799 = !DILocation(line: 178, column: 43, scope: !3794)
!3800 = !DILocation(line: 178, column: 68, scope: !3794)
!3801 = !DILocation(line: 178, column: 85, scope: !3794)
!3802 = !DILocation(line: 178, column: 91, scope: !3794)
!3803 = !DILocation(line: 178, column: 89, scope: !3794)
!3804 = !DILocation(line: 178, column: 95, scope: !3794)
!3805 = !DILocation(line: 178, column: 93, scope: !3794)
!3806 = !DILocation(line: 178, column: 100, scope: !3794)
!3807 = !DILocation(line: 178, column: 107, scope: !3794)
!3808 = !DILocation(line: 178, column: 109, scope: !3794)
!3809 = !DILocation(line: 178, column: 115, scope: !3794)
!3810 = !DILocation(line: 178, column: 113, scope: !3794)
!3811 = !DILocation(line: 178, column: 119, scope: !3794)
!3812 = !DILocation(line: 178, column: 117, scope: !3794)
!3813 = !DILocation(line: 178, column: 105, scope: !3794)
!3814 = !DILocation(line: 178, column: 125, scope: !3794)
!3815 = !DILocation(line: 178, column: 123, scope: !3794)
!3816 = !DILocation(line: 178, column: 80, scope: !3794)
!3817 = !DILocation(line: 178, column: 17, scope: !3794)
!3818 = !DILocation(line: 179, column: 13, scope: !3794)
!3819 = !DILocation(line: 177, column: 43, scope: !3789)
!3820 = !DILocation(line: 177, column: 13, scope: !3789)
!3821 = distinct !{!3821, !3792, !3822, !165}
!3822 = !DILocation(line: 179, column: 13, scope: !3784)
!3823 = !DILocation(line: 180, column: 21, scope: !3785)
!3824 = !DILocation(line: 181, column: 9, scope: !3785)
!3825 = !DILocation(line: 176, column: 35, scope: !3779)
!3826 = !DILocation(line: 176, column: 9, scope: !3779)
!3827 = distinct !{!3827, !3782, !3828, !165}
!3828 = !DILocation(line: 181, column: 9, scope: !3773)
!3829 = !DILocation(line: 182, column: 5, scope: !3774)
!3830 = !DILocation(line: 175, column: 35, scope: !3768)
!3831 = !DILocation(line: 175, column: 5, scope: !3768)
!3832 = distinct !{!3832, !3771, !3833, !165}
!3833 = !DILocation(line: 182, column: 5, scope: !3763)
!3834 = !DILocalVariable(name: "i", scope: !3591, file: !606, line: 185, type: !51)
!3835 = !DILocation(line: 185, column: 9, scope: !3591)
!3836 = !DILocation(line: 186, column: 5, scope: !3591)
!3837 = !DILocation(line: 186, column: 12, scope: !3591)
!3838 = !DILocation(line: 186, column: 16, scope: !3591)
!3839 = !DILocation(line: 186, column: 20, scope: !3591)
!3840 = !DILocation(line: 186, column: 18, scope: !3591)
!3841 = !DILocation(line: 186, column: 14, scope: !3591)
!3842 = !DILocation(line: 187, column: 29, scope: !3843)
!3843 = distinct !DILexicalBlock(scope: !3591, file: !606, line: 186, column: 23)
!3844 = !DILocation(line: 187, column: 42, scope: !3843)
!3845 = !DILocation(line: 187, column: 56, scope: !3843)
!3846 = !DILocation(line: 187, column: 58, scope: !3843)
!3847 = !DILocation(line: 187, column: 65, scope: !3843)
!3848 = !DILocation(line: 187, column: 63, scope: !3843)
!3849 = !DILocation(line: 187, column: 54, scope: !3843)
!3850 = !DILocation(line: 187, column: 78, scope: !3843)
!3851 = !DILocation(line: 187, column: 83, scope: !3843)
!3852 = !DILocation(line: 187, column: 87, scope: !3843)
!3853 = !DILocation(line: 187, column: 85, scope: !3843)
!3854 = !DILocation(line: 187, column: 81, scope: !3843)
!3855 = !DILocation(line: 187, column: 9, scope: !3843)
!3856 = !DILocation(line: 188, column: 10, scope: !3843)
!3857 = distinct !{!3857, !3836, !3858, !165}
!3858 = !DILocation(line: 189, column: 5, scope: !3591)
!3859 = !DILocation(line: 191, column: 1, scope: !3591)
!3860 = distinct !DISubprogram(name: "mayo_generic_m_calculate_SPS", scope: !606, file: !606, line: 195, type: !3861, scopeLine: 195, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !91)
!3861 = !DISubroutineType(types: !3862)
!3862 = !{null, !609, !60, !51, !51, !51, !81}
!3863 = !DILocalVariable(name: "PS", arg: 1, scope: !3860, file: !606, line: 195, type: !609)
!3864 = !DILocation(line: 195, column: 65, scope: !3860)
!3865 = !DILocalVariable(name: "S", arg: 2, scope: !3860, file: !606, line: 195, type: !60)
!3866 = !DILocation(line: 195, column: 90, scope: !3860)
!3867 = !DILocalVariable(name: "m", arg: 3, scope: !3860, file: !606, line: 195, type: !51)
!3868 = !DILocation(line: 195, column: 97, scope: !3860)
!3869 = !DILocalVariable(name: "k", arg: 4, scope: !3860, file: !606, line: 195, type: !51)
!3870 = !DILocation(line: 195, column: 104, scope: !3860)
!3871 = !DILocalVariable(name: "n", arg: 5, scope: !3860, file: !606, line: 195, type: !51)
!3872 = !DILocation(line: 195, column: 112, scope: !3860)
!3873 = !DILocalVariable(name: "SPS", arg: 6, scope: !3860, file: !606, line: 195, type: !81)
!3874 = !DILocation(line: 195, column: 125, scope: !3860)
!3875 = !DILocalVariable(name: "accumulator", scope: !3860, file: !606, line: 196, type: !3876)
!3876 = !DICompositeType(tag: DW_TAG_array_type, baseType: !46, size: 1327104, elements: !3877)
!3877 = !{!3878}
!3878 = !DISubrange(count: 20736)
!3879 = !DILocation(line: 196, column: 14, scope: !3860)
!3880 = !DILocalVariable(name: "m_vec_limbs", scope: !3860, file: !606, line: 197, type: !426)
!3881 = !DILocation(line: 197, column: 15, scope: !3860)
!3882 = !DILocation(line: 197, column: 30, scope: !3860)
!3883 = !DILocation(line: 197, column: 32, scope: !3860)
!3884 = !DILocation(line: 197, column: 37, scope: !3860)
!3885 = !DILocalVariable(name: "row", scope: !3886, file: !606, line: 198, type: !51)
!3886 = distinct !DILexicalBlock(scope: !3860, file: !606, line: 198, column: 5)
!3887 = !DILocation(line: 198, column: 14, scope: !3886)
!3888 = !DILocation(line: 198, column: 10, scope: !3886)
!3889 = !DILocation(line: 198, column: 23, scope: !3890)
!3890 = distinct !DILexicalBlock(scope: !3886, file: !606, line: 198, column: 5)
!3891 = !DILocation(line: 198, column: 29, scope: !3890)
!3892 = !DILocation(line: 198, column: 27, scope: !3890)
!3893 = !DILocation(line: 198, column: 5, scope: !3886)
!3894 = !DILocalVariable(name: "j", scope: !3895, file: !606, line: 199, type: !51)
!3895 = distinct !DILexicalBlock(scope: !3896, file: !606, line: 199, column: 9)
!3896 = distinct !DILexicalBlock(scope: !3890, file: !606, line: 198, column: 39)
!3897 = !DILocation(line: 199, column: 18, scope: !3895)
!3898 = !DILocation(line: 199, column: 14, scope: !3895)
!3899 = !DILocation(line: 199, column: 25, scope: !3900)
!3900 = distinct !DILexicalBlock(scope: !3895, file: !606, line: 199, column: 9)
!3901 = !DILocation(line: 199, column: 29, scope: !3900)
!3902 = !DILocation(line: 199, column: 27, scope: !3900)
!3903 = !DILocation(line: 199, column: 9, scope: !3895)
!3904 = !DILocalVariable(name: "col", scope: !3905, file: !606, line: 200, type: !51)
!3905 = distinct !DILexicalBlock(scope: !3906, file: !606, line: 200, column: 13)
!3906 = distinct !DILexicalBlock(scope: !3900, file: !606, line: 199, column: 37)
!3907 = !DILocation(line: 200, column: 22, scope: !3905)
!3908 = !DILocation(line: 200, column: 18, scope: !3905)
!3909 = !DILocation(line: 200, column: 31, scope: !3910)
!3910 = distinct !DILexicalBlock(scope: !3905, file: !606, line: 200, column: 13)
!3911 = !DILocation(line: 200, column: 37, scope: !3910)
!3912 = !DILocation(line: 200, column: 35, scope: !3910)
!3913 = !DILocation(line: 200, column: 13, scope: !3905)
!3914 = !DILocation(line: 201, column: 31, scope: !3915)
!3915 = distinct !DILexicalBlock(scope: !3910, file: !606, line: 200, column: 50)
!3916 = !DILocation(line: 201, column: 44, scope: !3915)
!3917 = !DILocation(line: 201, column: 50, scope: !3915)
!3918 = !DILocation(line: 201, column: 54, scope: !3915)
!3919 = !DILocation(line: 201, column: 52, scope: !3915)
!3920 = !DILocation(line: 201, column: 58, scope: !3915)
!3921 = !DILocation(line: 201, column: 56, scope: !3915)
!3922 = !DILocation(line: 201, column: 65, scope: !3915)
!3923 = !DILocation(line: 201, column: 63, scope: !3915)
!3924 = !DILocation(line: 201, column: 47, scope: !3915)
!3925 = !DILocation(line: 201, column: 78, scope: !3915)
!3926 = !DILocation(line: 201, column: 95, scope: !3915)
!3927 = !DILocation(line: 201, column: 101, scope: !3915)
!3928 = !DILocation(line: 201, column: 99, scope: !3915)
!3929 = !DILocation(line: 201, column: 105, scope: !3915)
!3930 = !DILocation(line: 201, column: 103, scope: !3915)
!3931 = !DILocation(line: 201, column: 110, scope: !3915)
!3932 = !DILocation(line: 201, column: 117, scope: !3915)
!3933 = !DILocation(line: 201, column: 119, scope: !3915)
!3934 = !DILocation(line: 201, column: 125, scope: !3915)
!3935 = !DILocation(line: 201, column: 123, scope: !3915)
!3936 = !DILocation(line: 201, column: 129, scope: !3915)
!3937 = !DILocation(line: 201, column: 127, scope: !3915)
!3938 = !DILocation(line: 201, column: 115, scope: !3915)
!3939 = !DILocation(line: 201, column: 134, scope: !3915)
!3940 = !DILocation(line: 201, column: 133, scope: !3915)
!3941 = !DILocation(line: 201, column: 90, scope: !3915)
!3942 = !DILocation(line: 201, column: 21, scope: !3915)
!3943 = !DILocation(line: 202, column: 13, scope: !3915)
!3944 = !DILocation(line: 200, column: 44, scope: !3910)
!3945 = !DILocation(line: 200, column: 13, scope: !3910)
!3946 = distinct !{!3946, !3913, !3947, !165}
!3947 = !DILocation(line: 202, column: 13, scope: !3905)
!3948 = !DILocation(line: 203, column: 9, scope: !3906)
!3949 = !DILocation(line: 199, column: 33, scope: !3900)
!3950 = !DILocation(line: 199, column: 9, scope: !3900)
!3951 = distinct !{!3951, !3903, !3952, !165}
!3952 = !DILocation(line: 203, column: 9, scope: !3895)
!3953 = !DILocation(line: 204, column: 5, scope: !3896)
!3954 = !DILocation(line: 198, column: 35, scope: !3890)
!3955 = !DILocation(line: 198, column: 5, scope: !3890)
!3956 = distinct !{!3956, !3893, !3957, !165}
!3957 = !DILocation(line: 204, column: 5, scope: !3886)
!3958 = !DILocalVariable(name: "i", scope: !3860, file: !606, line: 207, type: !51)
!3959 = !DILocation(line: 207, column: 9, scope: !3860)
!3960 = !DILocation(line: 208, column: 5, scope: !3860)
!3961 = !DILocation(line: 208, column: 12, scope: !3860)
!3962 = !DILocation(line: 208, column: 16, scope: !3860)
!3963 = !DILocation(line: 208, column: 18, scope: !3860)
!3964 = !DILocation(line: 208, column: 17, scope: !3860)
!3965 = !DILocation(line: 208, column: 14, scope: !3860)
!3966 = !DILocation(line: 209, column: 29, scope: !3967)
!3967 = distinct !DILexicalBlock(scope: !3860, file: !606, line: 208, column: 21)
!3968 = !DILocation(line: 209, column: 42, scope: !3967)
!3969 = !DILocation(line: 209, column: 56, scope: !3967)
!3970 = !DILocation(line: 209, column: 58, scope: !3967)
!3971 = !DILocation(line: 209, column: 65, scope: !3967)
!3972 = !DILocation(line: 209, column: 63, scope: !3967)
!3973 = !DILocation(line: 209, column: 54, scope: !3967)
!3974 = !DILocation(line: 209, column: 78, scope: !3967)
!3975 = !DILocation(line: 209, column: 84, scope: !3967)
!3976 = !DILocation(line: 209, column: 88, scope: !3967)
!3977 = !DILocation(line: 209, column: 86, scope: !3967)
!3978 = !DILocation(line: 209, column: 82, scope: !3967)
!3979 = !DILocation(line: 209, column: 9, scope: !3967)
!3980 = !DILocation(line: 210, column: 10, scope: !3967)
!3981 = distinct !{!3981, !3960, !3982, !165}
!3982 = !DILocation(line: 211, column: 5, scope: !3860)
!3983 = !DILocation(line: 212, column: 1, scope: !3860)
!3984 = distinct !DISubprogram(name: "m_vec_add", scope: !803, file: !803, line: 17, type: !3985, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !91)
!3985 = !DISubroutineType(types: !3986)
!3986 = !{null, !51, !609, !81}
!3987 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !3984, file: !803, line: 17, type: !51)
!3988 = !DILocation(line: 17, column: 27, scope: !3984)
!3989 = !DILocalVariable(name: "in", arg: 2, scope: !3984, file: !803, line: 17, type: !609)
!3990 = !DILocation(line: 17, column: 56, scope: !3984)
!3991 = !DILocalVariable(name: "acc", arg: 3, scope: !3984, file: !803, line: 17, type: !81)
!3992 = !DILocation(line: 17, column: 70, scope: !3984)
!3993 = !DILocalVariable(name: "i", scope: !3994, file: !803, line: 18, type: !51)
!3994 = distinct !DILexicalBlock(scope: !3984, file: !803, line: 18, column: 5)
!3995 = !DILocation(line: 18, column: 14, scope: !3994)
!3996 = !DILocation(line: 18, column: 10, scope: !3994)
!3997 = !DILocation(line: 18, column: 21, scope: !3998)
!3998 = distinct !DILexicalBlock(scope: !3994, file: !803, line: 18, column: 5)
!3999 = !DILocation(line: 18, column: 25, scope: !3998)
!4000 = !DILocation(line: 18, column: 23, scope: !3998)
!4001 = !DILocation(line: 18, column: 5, scope: !3994)
!4002 = !DILocation(line: 19, column: 19, scope: !4003)
!4003 = distinct !DILexicalBlock(scope: !3998, file: !803, line: 18, column: 43)
!4004 = !DILocation(line: 19, column: 22, scope: !4003)
!4005 = !DILocation(line: 19, column: 9, scope: !4003)
!4006 = !DILocation(line: 19, column: 13, scope: !4003)
!4007 = !DILocation(line: 19, column: 16, scope: !4003)
!4008 = !DILocation(line: 20, column: 5, scope: !4003)
!4009 = !DILocation(line: 18, column: 39, scope: !3998)
!4010 = !DILocation(line: 18, column: 5, scope: !3998)
!4011 = distinct !{!4011, !4001, !4012, !165}
!4012 = !DILocation(line: 20, column: 5, scope: !3994)
!4013 = !DILocation(line: 21, column: 1, scope: !3984)
!4014 = distinct !DISubprogram(name: "m_vec_multiply_bins", scope: !803, file: !803, line: 49, type: !4015, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !91)
!4015 = !DISubroutineType(types: !4016)
!4016 = !{null, !51, !81, !81}
!4017 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !4014, file: !803, line: 49, type: !51)
!4018 = !DILocation(line: 49, column: 38, scope: !4014)
!4019 = !DILocalVariable(name: "bins", arg: 2, scope: !4014, file: !803, line: 49, type: !81)
!4020 = !DILocation(line: 49, column: 61, scope: !4014)
!4021 = !DILocalVariable(name: "out", arg: 3, scope: !4014, file: !803, line: 49, type: !81)
!4022 = !DILocation(line: 49, column: 77, scope: !4014)
!4023 = !DILocation(line: 51, column: 26, scope: !4014)
!4024 = !DILocation(line: 51, column: 39, scope: !4014)
!4025 = !DILocation(line: 51, column: 51, scope: !4014)
!4026 = !DILocation(line: 51, column: 49, scope: !4014)
!4027 = !DILocation(line: 51, column: 44, scope: !4014)
!4028 = !DILocation(line: 51, column: 64, scope: !4014)
!4029 = !DILocation(line: 51, column: 77, scope: !4014)
!4030 = !DILocation(line: 51, column: 75, scope: !4014)
!4031 = !DILocation(line: 51, column: 69, scope: !4014)
!4032 = !DILocation(line: 51, column: 5, scope: !4014)
!4033 = !DILocation(line: 52, column: 22, scope: !4014)
!4034 = !DILocation(line: 52, column: 35, scope: !4014)
!4035 = !DILocation(line: 52, column: 47, scope: !4014)
!4036 = !DILocation(line: 52, column: 45, scope: !4014)
!4037 = !DILocation(line: 52, column: 40, scope: !4014)
!4038 = !DILocation(line: 52, column: 60, scope: !4014)
!4039 = !DILocation(line: 52, column: 72, scope: !4014)
!4040 = !DILocation(line: 52, column: 70, scope: !4014)
!4041 = !DILocation(line: 52, column: 65, scope: !4014)
!4042 = !DILocation(line: 52, column: 5, scope: !4014)
!4043 = !DILocation(line: 53, column: 26, scope: !4014)
!4044 = !DILocation(line: 53, column: 39, scope: !4014)
!4045 = !DILocation(line: 53, column: 52, scope: !4014)
!4046 = !DILocation(line: 53, column: 50, scope: !4014)
!4047 = !DILocation(line: 53, column: 44, scope: !4014)
!4048 = !DILocation(line: 53, column: 65, scope: !4014)
!4049 = !DILocation(line: 53, column: 77, scope: !4014)
!4050 = !DILocation(line: 53, column: 75, scope: !4014)
!4051 = !DILocation(line: 53, column: 70, scope: !4014)
!4052 = !DILocation(line: 53, column: 5, scope: !4014)
!4053 = !DILocation(line: 54, column: 22, scope: !4014)
!4054 = !DILocation(line: 54, column: 35, scope: !4014)
!4055 = !DILocation(line: 54, column: 47, scope: !4014)
!4056 = !DILocation(line: 54, column: 45, scope: !4014)
!4057 = !DILocation(line: 54, column: 40, scope: !4014)
!4058 = !DILocation(line: 54, column: 60, scope: !4014)
!4059 = !DILocation(line: 54, column: 72, scope: !4014)
!4060 = !DILocation(line: 54, column: 70, scope: !4014)
!4061 = !DILocation(line: 54, column: 65, scope: !4014)
!4062 = !DILocation(line: 54, column: 5, scope: !4014)
!4063 = !DILocation(line: 55, column: 26, scope: !4014)
!4064 = !DILocation(line: 55, column: 39, scope: !4014)
!4065 = !DILocation(line: 55, column: 51, scope: !4014)
!4066 = !DILocation(line: 55, column: 49, scope: !4014)
!4067 = !DILocation(line: 55, column: 44, scope: !4014)
!4068 = !DILocation(line: 55, column: 64, scope: !4014)
!4069 = !DILocation(line: 55, column: 77, scope: !4014)
!4070 = !DILocation(line: 55, column: 75, scope: !4014)
!4071 = !DILocation(line: 55, column: 69, scope: !4014)
!4072 = !DILocation(line: 55, column: 5, scope: !4014)
!4073 = !DILocation(line: 56, column: 22, scope: !4014)
!4074 = !DILocation(line: 56, column: 35, scope: !4014)
!4075 = !DILocation(line: 56, column: 47, scope: !4014)
!4076 = !DILocation(line: 56, column: 45, scope: !4014)
!4077 = !DILocation(line: 56, column: 40, scope: !4014)
!4078 = !DILocation(line: 56, column: 60, scope: !4014)
!4079 = !DILocation(line: 56, column: 72, scope: !4014)
!4080 = !DILocation(line: 56, column: 70, scope: !4014)
!4081 = !DILocation(line: 56, column: 65, scope: !4014)
!4082 = !DILocation(line: 56, column: 5, scope: !4014)
!4083 = !DILocation(line: 57, column: 26, scope: !4014)
!4084 = !DILocation(line: 57, column: 39, scope: !4014)
!4085 = !DILocation(line: 57, column: 52, scope: !4014)
!4086 = !DILocation(line: 57, column: 50, scope: !4014)
!4087 = !DILocation(line: 57, column: 44, scope: !4014)
!4088 = !DILocation(line: 57, column: 65, scope: !4014)
!4089 = !DILocation(line: 57, column: 78, scope: !4014)
!4090 = !DILocation(line: 57, column: 76, scope: !4014)
!4091 = !DILocation(line: 57, column: 70, scope: !4014)
!4092 = !DILocation(line: 57, column: 5, scope: !4014)
!4093 = !DILocation(line: 58, column: 22, scope: !4014)
!4094 = !DILocation(line: 58, column: 35, scope: !4014)
!4095 = !DILocation(line: 58, column: 47, scope: !4014)
!4096 = !DILocation(line: 58, column: 45, scope: !4014)
!4097 = !DILocation(line: 58, column: 40, scope: !4014)
!4098 = !DILocation(line: 58, column: 60, scope: !4014)
!4099 = !DILocation(line: 58, column: 72, scope: !4014)
!4100 = !DILocation(line: 58, column: 70, scope: !4014)
!4101 = !DILocation(line: 58, column: 65, scope: !4014)
!4102 = !DILocation(line: 58, column: 5, scope: !4014)
!4103 = !DILocation(line: 59, column: 26, scope: !4014)
!4104 = !DILocation(line: 59, column: 39, scope: !4014)
!4105 = !DILocation(line: 59, column: 52, scope: !4014)
!4106 = !DILocation(line: 59, column: 50, scope: !4014)
!4107 = !DILocation(line: 59, column: 44, scope: !4014)
!4108 = !DILocation(line: 59, column: 65, scope: !4014)
!4109 = !DILocation(line: 59, column: 78, scope: !4014)
!4110 = !DILocation(line: 59, column: 76, scope: !4014)
!4111 = !DILocation(line: 59, column: 70, scope: !4014)
!4112 = !DILocation(line: 59, column: 5, scope: !4014)
!4113 = !DILocation(line: 60, column: 22, scope: !4014)
!4114 = !DILocation(line: 60, column: 35, scope: !4014)
!4115 = !DILocation(line: 60, column: 47, scope: !4014)
!4116 = !DILocation(line: 60, column: 45, scope: !4014)
!4117 = !DILocation(line: 60, column: 40, scope: !4014)
!4118 = !DILocation(line: 60, column: 60, scope: !4014)
!4119 = !DILocation(line: 60, column: 72, scope: !4014)
!4120 = !DILocation(line: 60, column: 70, scope: !4014)
!4121 = !DILocation(line: 60, column: 65, scope: !4014)
!4122 = !DILocation(line: 60, column: 5, scope: !4014)
!4123 = !DILocation(line: 61, column: 26, scope: !4014)
!4124 = !DILocation(line: 61, column: 39, scope: !4014)
!4125 = !DILocation(line: 61, column: 52, scope: !4014)
!4126 = !DILocation(line: 61, column: 50, scope: !4014)
!4127 = !DILocation(line: 61, column: 44, scope: !4014)
!4128 = !DILocation(line: 61, column: 65, scope: !4014)
!4129 = !DILocation(line: 61, column: 77, scope: !4014)
!4130 = !DILocation(line: 61, column: 75, scope: !4014)
!4131 = !DILocation(line: 61, column: 70, scope: !4014)
!4132 = !DILocation(line: 61, column: 5, scope: !4014)
!4133 = !DILocation(line: 62, column: 22, scope: !4014)
!4134 = !DILocation(line: 62, column: 35, scope: !4014)
!4135 = !DILocation(line: 62, column: 47, scope: !4014)
!4136 = !DILocation(line: 62, column: 45, scope: !4014)
!4137 = !DILocation(line: 62, column: 40, scope: !4014)
!4138 = !DILocation(line: 62, column: 60, scope: !4014)
!4139 = !DILocation(line: 62, column: 72, scope: !4014)
!4140 = !DILocation(line: 62, column: 70, scope: !4014)
!4141 = !DILocation(line: 62, column: 65, scope: !4014)
!4142 = !DILocation(line: 62, column: 5, scope: !4014)
!4143 = !DILocation(line: 63, column: 26, scope: !4014)
!4144 = !DILocation(line: 63, column: 39, scope: !4014)
!4145 = !DILocation(line: 63, column: 52, scope: !4014)
!4146 = !DILocation(line: 63, column: 50, scope: !4014)
!4147 = !DILocation(line: 63, column: 44, scope: !4014)
!4148 = !DILocation(line: 63, column: 65, scope: !4014)
!4149 = !DILocation(line: 63, column: 77, scope: !4014)
!4150 = !DILocation(line: 63, column: 75, scope: !4014)
!4151 = !DILocation(line: 63, column: 70, scope: !4014)
!4152 = !DILocation(line: 63, column: 5, scope: !4014)
!4153 = !DILocation(line: 64, column: 22, scope: !4014)
!4154 = !DILocation(line: 64, column: 35, scope: !4014)
!4155 = !DILocation(line: 64, column: 47, scope: !4014)
!4156 = !DILocation(line: 64, column: 45, scope: !4014)
!4157 = !DILocation(line: 64, column: 40, scope: !4014)
!4158 = !DILocation(line: 64, column: 60, scope: !4014)
!4159 = !DILocation(line: 64, column: 72, scope: !4014)
!4160 = !DILocation(line: 64, column: 70, scope: !4014)
!4161 = !DILocation(line: 64, column: 65, scope: !4014)
!4162 = !DILocation(line: 64, column: 5, scope: !4014)
!4163 = !DILocation(line: 65, column: 17, scope: !4014)
!4164 = !DILocation(line: 65, column: 30, scope: !4014)
!4165 = !DILocation(line: 65, column: 37, scope: !4014)
!4166 = !DILocation(line: 65, column: 35, scope: !4014)
!4167 = !DILocation(line: 65, column: 50, scope: !4014)
!4168 = !DILocation(line: 65, column: 5, scope: !4014)
!4169 = !DILocation(line: 66, column: 1, scope: !4014)
!4170 = distinct !DISubprogram(name: "m_vec_mul_add_x_inv", scope: !803, file: !803, line: 40, type: !3985, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !91)
!4171 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !4170, file: !803, line: 40, type: !51)
!4172 = !DILocation(line: 40, column: 38, scope: !4170)
!4173 = !DILocalVariable(name: "in", arg: 2, scope: !4170, file: !803, line: 40, type: !609)
!4174 = !DILocation(line: 40, column: 67, scope: !4170)
!4175 = !DILocalVariable(name: "acc", arg: 3, scope: !4170, file: !803, line: 40, type: !81)
!4176 = !DILocation(line: 40, column: 81, scope: !4170)
!4177 = !DILocalVariable(name: "mask_lsb", scope: !4170, file: !803, line: 41, type: !46)
!4178 = !DILocation(line: 41, column: 14, scope: !4170)
!4179 = !DILocalVariable(name: "i", scope: !4180, file: !803, line: 42, type: !51)
!4180 = distinct !DILexicalBlock(scope: !4170, file: !803, line: 42, column: 5)
!4181 = !DILocation(line: 42, column: 13, scope: !4180)
!4182 = !DILocation(line: 42, column: 9, scope: !4180)
!4183 = !DILocation(line: 42, column: 18, scope: !4184)
!4184 = distinct !DILexicalBlock(scope: !4180, file: !803, line: 42, column: 5)
!4185 = !DILocation(line: 42, column: 22, scope: !4184)
!4186 = !DILocation(line: 42, column: 20, scope: !4184)
!4187 = !DILocation(line: 42, column: 5, scope: !4180)
!4188 = !DILocalVariable(name: "t", scope: !4189, file: !803, line: 43, type: !46)
!4189 = distinct !DILexicalBlock(scope: !4184, file: !803, line: 42, column: 39)
!4190 = !DILocation(line: 43, column: 18, scope: !4189)
!4191 = !DILocation(line: 43, column: 22, scope: !4189)
!4192 = !DILocation(line: 43, column: 25, scope: !4189)
!4193 = !DILocation(line: 43, column: 30, scope: !4189)
!4194 = !DILocation(line: 43, column: 28, scope: !4189)
!4195 = !DILocation(line: 44, column: 21, scope: !4189)
!4196 = !DILocation(line: 44, column: 24, scope: !4189)
!4197 = !DILocation(line: 44, column: 29, scope: !4189)
!4198 = !DILocation(line: 44, column: 27, scope: !4189)
!4199 = !DILocation(line: 44, column: 32, scope: !4189)
!4200 = !DILocation(line: 44, column: 41, scope: !4189)
!4201 = !DILocation(line: 44, column: 43, scope: !4189)
!4202 = !DILocation(line: 44, column: 38, scope: !4189)
!4203 = !DILocation(line: 44, column: 9, scope: !4189)
!4204 = !DILocation(line: 44, column: 13, scope: !4189)
!4205 = !DILocation(line: 44, column: 16, scope: !4189)
!4206 = !DILocation(line: 45, column: 5, scope: !4189)
!4207 = !DILocation(line: 42, column: 36, scope: !4184)
!4208 = !DILocation(line: 42, column: 5, scope: !4184)
!4209 = distinct !{!4209, !4187, !4210, !165}
!4210 = !DILocation(line: 45, column: 5, scope: !4180)
!4211 = !DILocation(line: 46, column: 1, scope: !4170)
!4212 = distinct !DISubprogram(name: "m_vec_mul_add_x", scope: !803, file: !803, line: 31, type: !3985, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !91)
!4213 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !4212, file: !803, line: 31, type: !51)
!4214 = !DILocation(line: 31, column: 34, scope: !4212)
!4215 = !DILocalVariable(name: "in", arg: 2, scope: !4212, file: !803, line: 31, type: !609)
!4216 = !DILocation(line: 31, column: 63, scope: !4212)
!4217 = !DILocalVariable(name: "acc", arg: 3, scope: !4212, file: !803, line: 31, type: !81)
!4218 = !DILocation(line: 31, column: 77, scope: !4212)
!4219 = !DILocalVariable(name: "mask_msb", scope: !4212, file: !803, line: 32, type: !46)
!4220 = !DILocation(line: 32, column: 14, scope: !4212)
!4221 = !DILocalVariable(name: "i", scope: !4222, file: !803, line: 33, type: !51)
!4222 = distinct !DILexicalBlock(scope: !4212, file: !803, line: 33, column: 5)
!4223 = !DILocation(line: 33, column: 13, scope: !4222)
!4224 = !DILocation(line: 33, column: 9, scope: !4222)
!4225 = !DILocation(line: 33, column: 18, scope: !4226)
!4226 = distinct !DILexicalBlock(scope: !4222, file: !803, line: 33, column: 5)
!4227 = !DILocation(line: 33, column: 22, scope: !4226)
!4228 = !DILocation(line: 33, column: 20, scope: !4226)
!4229 = !DILocation(line: 33, column: 5, scope: !4222)
!4230 = !DILocalVariable(name: "t", scope: !4231, file: !803, line: 34, type: !46)
!4231 = distinct !DILexicalBlock(scope: !4226, file: !803, line: 33, column: 39)
!4232 = !DILocation(line: 34, column: 18, scope: !4231)
!4233 = !DILocation(line: 34, column: 22, scope: !4231)
!4234 = !DILocation(line: 34, column: 25, scope: !4231)
!4235 = !DILocation(line: 34, column: 30, scope: !4231)
!4236 = !DILocation(line: 34, column: 28, scope: !4231)
!4237 = !DILocation(line: 35, column: 21, scope: !4231)
!4238 = !DILocation(line: 35, column: 24, scope: !4231)
!4239 = !DILocation(line: 35, column: 29, scope: !4231)
!4240 = !DILocation(line: 35, column: 27, scope: !4231)
!4241 = !DILocation(line: 35, column: 32, scope: !4231)
!4242 = !DILocation(line: 35, column: 42, scope: !4231)
!4243 = !DILocation(line: 35, column: 44, scope: !4231)
!4244 = !DILocation(line: 35, column: 50, scope: !4231)
!4245 = !DILocation(line: 35, column: 38, scope: !4231)
!4246 = !DILocation(line: 35, column: 9, scope: !4231)
!4247 = !DILocation(line: 35, column: 13, scope: !4231)
!4248 = !DILocation(line: 35, column: 16, scope: !4231)
!4249 = !DILocation(line: 36, column: 5, scope: !4231)
!4250 = !DILocation(line: 33, column: 36, scope: !4226)
!4251 = !DILocation(line: 33, column: 5, scope: !4226)
!4252 = distinct !{!4252, !4229, !4253, !165}
!4253 = !DILocation(line: 36, column: 5, scope: !4222)
!4254 = !DILocation(line: 37, column: 1, scope: !4212)
!4255 = distinct !DISubprogram(name: "m_vec_copy", scope: !803, file: !803, line: 10, type: !3985, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !79, retainedNodes: !91)
!4256 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !4255, file: !803, line: 10, type: !51)
!4257 = !DILocation(line: 10, column: 28, scope: !4255)
!4258 = !DILocalVariable(name: "in", arg: 2, scope: !4255, file: !803, line: 10, type: !609)
!4259 = !DILocation(line: 10, column: 57, scope: !4255)
!4260 = !DILocalVariable(name: "out", arg: 3, scope: !4255, file: !803, line: 10, type: !81)
!4261 = !DILocation(line: 10, column: 71, scope: !4255)
!4262 = !DILocalVariable(name: "i", scope: !4263, file: !803, line: 11, type: !51)
!4263 = distinct !DILexicalBlock(scope: !4255, file: !803, line: 11, column: 5)
!4264 = !DILocation(line: 11, column: 14, scope: !4263)
!4265 = !DILocation(line: 11, column: 10, scope: !4263)
!4266 = !DILocation(line: 11, column: 21, scope: !4267)
!4267 = distinct !DILexicalBlock(scope: !4263, file: !803, line: 11, column: 5)
!4268 = !DILocation(line: 11, column: 25, scope: !4267)
!4269 = !DILocation(line: 11, column: 23, scope: !4267)
!4270 = !DILocation(line: 11, column: 5, scope: !4263)
!4271 = !DILocation(line: 12, column: 18, scope: !4272)
!4272 = distinct !DILexicalBlock(scope: !4267, file: !803, line: 11, column: 43)
!4273 = !DILocation(line: 12, column: 21, scope: !4272)
!4274 = !DILocation(line: 12, column: 9, scope: !4272)
!4275 = !DILocation(line: 12, column: 13, scope: !4272)
!4276 = !DILocation(line: 12, column: 16, scope: !4272)
!4277 = !DILocation(line: 13, column: 5, scope: !4272)
!4278 = !DILocation(line: 11, column: 39, scope: !4267)
!4279 = !DILocation(line: 11, column: 5, scope: !4267)
!4280 = distinct !{!4280, !4270, !4281, !165}
!4281 = !DILocation(line: 13, column: 5, scope: !4263)
!4282 = !DILocation(line: 14, column: 1, scope: !4255)
!4283 = distinct !DISubprogram(name: "m_upper", scope: !70, file: !70, line: 14, type: !4284, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !91)
!4284 = !DISubroutineType(types: !4285)
!4285 = !{null, !4286, !609, !81, !51}
!4286 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4287, size: 32)
!4287 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4288)
!4288 = !DIDerivedType(tag: DW_TAG_typedef, name: "mayo_params_t", file: !112, line: 289, baseType: !4289)
!4289 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !112, line: 265, size: 736, elements: !4290)
!4290 = !{!4291, !4292, !4293, !4294, !4295, !4296, !4297, !4298, !4299, !4300, !4301, !4302, !4303, !4304, !4305, !4306, !4307, !4308, !4309, !4310, !4311, !4312, !4313}
!4291 = !DIDerivedType(tag: DW_TAG_member, name: "m", scope: !4289, file: !112, line: 266, baseType: !51, size: 32)
!4292 = !DIDerivedType(tag: DW_TAG_member, name: "n", scope: !4289, file: !112, line: 267, baseType: !51, size: 32, offset: 32)
!4293 = !DIDerivedType(tag: DW_TAG_member, name: "o", scope: !4289, file: !112, line: 268, baseType: !51, size: 32, offset: 64)
!4294 = !DIDerivedType(tag: DW_TAG_member, name: "k", scope: !4289, file: !112, line: 269, baseType: !51, size: 32, offset: 96)
!4295 = !DIDerivedType(tag: DW_TAG_member, name: "q", scope: !4289, file: !112, line: 270, baseType: !51, size: 32, offset: 128)
!4296 = !DIDerivedType(tag: DW_TAG_member, name: "f_tail", scope: !4289, file: !112, line: 271, baseType: !60, size: 32, offset: 160)
!4297 = !DIDerivedType(tag: DW_TAG_member, name: "m_bytes", scope: !4289, file: !112, line: 272, baseType: !51, size: 32, offset: 192)
!4298 = !DIDerivedType(tag: DW_TAG_member, name: "O_bytes", scope: !4289, file: !112, line: 273, baseType: !51, size: 32, offset: 224)
!4299 = !DIDerivedType(tag: DW_TAG_member, name: "v_bytes", scope: !4289, file: !112, line: 274, baseType: !51, size: 32, offset: 256)
!4300 = !DIDerivedType(tag: DW_TAG_member, name: "r_bytes", scope: !4289, file: !112, line: 275, baseType: !51, size: 32, offset: 288)
!4301 = !DIDerivedType(tag: DW_TAG_member, name: "R_bytes", scope: !4289, file: !112, line: 276, baseType: !51, size: 32, offset: 320)
!4302 = !DIDerivedType(tag: DW_TAG_member, name: "P1_bytes", scope: !4289, file: !112, line: 277, baseType: !51, size: 32, offset: 352)
!4303 = !DIDerivedType(tag: DW_TAG_member, name: "P2_bytes", scope: !4289, file: !112, line: 278, baseType: !51, size: 32, offset: 384)
!4304 = !DIDerivedType(tag: DW_TAG_member, name: "P3_bytes", scope: !4289, file: !112, line: 279, baseType: !51, size: 32, offset: 416)
!4305 = !DIDerivedType(tag: DW_TAG_member, name: "csk_bytes", scope: !4289, file: !112, line: 280, baseType: !51, size: 32, offset: 448)
!4306 = !DIDerivedType(tag: DW_TAG_member, name: "cpk_bytes", scope: !4289, file: !112, line: 281, baseType: !51, size: 32, offset: 480)
!4307 = !DIDerivedType(tag: DW_TAG_member, name: "sig_bytes", scope: !4289, file: !112, line: 282, baseType: !51, size: 32, offset: 512)
!4308 = !DIDerivedType(tag: DW_TAG_member, name: "salt_bytes", scope: !4289, file: !112, line: 283, baseType: !51, size: 32, offset: 544)
!4309 = !DIDerivedType(tag: DW_TAG_member, name: "sk_seed_bytes", scope: !4289, file: !112, line: 284, baseType: !51, size: 32, offset: 576)
!4310 = !DIDerivedType(tag: DW_TAG_member, name: "digest_bytes", scope: !4289, file: !112, line: 285, baseType: !51, size: 32, offset: 608)
!4311 = !DIDerivedType(tag: DW_TAG_member, name: "pk_seed_bytes", scope: !4289, file: !112, line: 286, baseType: !51, size: 32, offset: 640)
!4312 = !DIDerivedType(tag: DW_TAG_member, name: "m_vec_limbs", scope: !4289, file: !112, line: 287, baseType: !51, size: 32, offset: 672)
!4313 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !4289, file: !112, line: 288, baseType: !138, size: 32, offset: 704)
!4314 = !DILocalVariable(name: "p", arg: 1, scope: !4283, file: !70, line: 14, type: !4286)
!4315 = !DILocation(line: 14, column: 35, scope: !4283)
!4316 = !DILocalVariable(name: "in", arg: 2, scope: !4283, file: !70, line: 14, type: !609)
!4317 = !DILocation(line: 14, column: 54, scope: !4283)
!4318 = !DILocalVariable(name: "out", arg: 3, scope: !4283, file: !70, line: 14, type: !81)
!4319 = !DILocation(line: 14, column: 68, scope: !4283)
!4320 = !DILocalVariable(name: "size", arg: 4, scope: !4283, file: !70, line: 14, type: !51)
!4321 = !DILocation(line: 14, column: 77, scope: !4283)
!4322 = !DILocalVariable(name: "m_vec_limbs", scope: !4283, file: !70, line: 19, type: !426)
!4323 = !DILocation(line: 19, column: 15, scope: !4283)
!4324 = !DILocation(line: 19, column: 29, scope: !4283)
!4325 = !DILocalVariable(name: "m_vecs_stored", scope: !4283, file: !70, line: 20, type: !51)
!4326 = !DILocation(line: 20, column: 9, scope: !4283)
!4327 = !DILocalVariable(name: "r", scope: !4328, file: !70, line: 21, type: !51)
!4328 = distinct !DILexicalBlock(scope: !4283, file: !70, line: 21, column: 5)
!4329 = !DILocation(line: 21, column: 14, scope: !4328)
!4330 = !DILocation(line: 21, column: 10, scope: !4328)
!4331 = !DILocation(line: 21, column: 21, scope: !4332)
!4332 = distinct !DILexicalBlock(scope: !4328, file: !70, line: 21, column: 5)
!4333 = !DILocation(line: 21, column: 25, scope: !4332)
!4334 = !DILocation(line: 21, column: 23, scope: !4332)
!4335 = !DILocation(line: 21, column: 5, scope: !4328)
!4336 = !DILocalVariable(name: "c", scope: !4337, file: !70, line: 22, type: !51)
!4337 = distinct !DILexicalBlock(scope: !4338, file: !70, line: 22, column: 9)
!4338 = distinct !DILexicalBlock(scope: !4332, file: !70, line: 21, column: 36)
!4339 = !DILocation(line: 22, column: 18, scope: !4337)
!4340 = !DILocation(line: 22, column: 22, scope: !4337)
!4341 = !DILocation(line: 22, column: 14, scope: !4337)
!4342 = !DILocation(line: 22, column: 25, scope: !4343)
!4343 = distinct !DILexicalBlock(scope: !4337, file: !70, line: 22, column: 9)
!4344 = !DILocation(line: 22, column: 29, scope: !4343)
!4345 = !DILocation(line: 22, column: 27, scope: !4343)
!4346 = !DILocation(line: 22, column: 9, scope: !4337)
!4347 = !DILocation(line: 23, column: 24, scope: !4348)
!4348 = distinct !DILexicalBlock(scope: !4343, file: !70, line: 22, column: 40)
!4349 = !DILocation(line: 23, column: 37, scope: !4348)
!4350 = !DILocation(line: 23, column: 42, scope: !4348)
!4351 = !DILocation(line: 23, column: 57, scope: !4348)
!4352 = !DILocation(line: 23, column: 61, scope: !4348)
!4353 = !DILocation(line: 23, column: 59, scope: !4348)
!4354 = !DILocation(line: 23, column: 68, scope: !4348)
!4355 = !DILocation(line: 23, column: 66, scope: !4348)
!4356 = !DILocation(line: 23, column: 54, scope: !4348)
!4357 = !DILocation(line: 23, column: 40, scope: !4348)
!4358 = !DILocation(line: 23, column: 72, scope: !4348)
!4359 = !DILocation(line: 23, column: 78, scope: !4348)
!4360 = !DILocation(line: 23, column: 92, scope: !4348)
!4361 = !DILocation(line: 23, column: 90, scope: !4348)
!4362 = !DILocation(line: 23, column: 76, scope: !4348)
!4363 = !DILocation(line: 23, column: 13, scope: !4348)
!4364 = !DILocation(line: 24, column: 17, scope: !4365)
!4365 = distinct !DILexicalBlock(scope: !4348, file: !70, line: 24, column: 17)
!4366 = !DILocation(line: 24, column: 22, scope: !4365)
!4367 = !DILocation(line: 24, column: 19, scope: !4365)
!4368 = !DILocation(line: 25, column: 27, scope: !4369)
!4369 = distinct !DILexicalBlock(scope: !4365, file: !70, line: 24, column: 25)
!4370 = !DILocation(line: 25, column: 40, scope: !4369)
!4371 = !DILocation(line: 25, column: 45, scope: !4369)
!4372 = !DILocation(line: 25, column: 60, scope: !4369)
!4373 = !DILocation(line: 25, column: 64, scope: !4369)
!4374 = !DILocation(line: 25, column: 62, scope: !4369)
!4375 = !DILocation(line: 25, column: 71, scope: !4369)
!4376 = !DILocation(line: 25, column: 69, scope: !4369)
!4377 = !DILocation(line: 25, column: 57, scope: !4369)
!4378 = !DILocation(line: 25, column: 43, scope: !4369)
!4379 = !DILocation(line: 25, column: 75, scope: !4369)
!4380 = !DILocation(line: 25, column: 81, scope: !4369)
!4381 = !DILocation(line: 25, column: 95, scope: !4369)
!4382 = !DILocation(line: 25, column: 93, scope: !4369)
!4383 = !DILocation(line: 25, column: 79, scope: !4369)
!4384 = !DILocation(line: 25, column: 17, scope: !4369)
!4385 = !DILocation(line: 26, column: 13, scope: !4369)
!4386 = !DILocation(line: 27, column: 27, scope: !4348)
!4387 = !DILocation(line: 28, column: 9, scope: !4348)
!4388 = !DILocation(line: 22, column: 36, scope: !4343)
!4389 = !DILocation(line: 22, column: 9, scope: !4343)
!4390 = distinct !{!4390, !4346, !4391, !165}
!4391 = !DILocation(line: 28, column: 9, scope: !4337)
!4392 = !DILocation(line: 29, column: 5, scope: !4338)
!4393 = !DILocation(line: 21, column: 32, scope: !4332)
!4394 = !DILocation(line: 21, column: 5, scope: !4332)
!4395 = distinct !{!4395, !4335, !4396, !165}
!4396 = !DILocation(line: 29, column: 5, scope: !4328)
!4397 = !DILocation(line: 30, column: 1, scope: !4283)
!4398 = distinct !DISubprogram(name: "m_vec_copy", scope: !803, file: !803, line: 10, type: !3985, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !91)
!4399 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !4398, file: !803, line: 10, type: !51)
!4400 = !DILocation(line: 10, column: 28, scope: !4398)
!4401 = !DILocalVariable(name: "in", arg: 2, scope: !4398, file: !803, line: 10, type: !609)
!4402 = !DILocation(line: 10, column: 57, scope: !4398)
!4403 = !DILocalVariable(name: "out", arg: 3, scope: !4398, file: !803, line: 10, type: !81)
!4404 = !DILocation(line: 10, column: 71, scope: !4398)
!4405 = !DILocalVariable(name: "i", scope: !4406, file: !803, line: 11, type: !51)
!4406 = distinct !DILexicalBlock(scope: !4398, file: !803, line: 11, column: 5)
!4407 = !DILocation(line: 11, column: 14, scope: !4406)
!4408 = !DILocation(line: 11, column: 10, scope: !4406)
!4409 = !DILocation(line: 11, column: 21, scope: !4410)
!4410 = distinct !DILexicalBlock(scope: !4406, file: !803, line: 11, column: 5)
!4411 = !DILocation(line: 11, column: 25, scope: !4410)
!4412 = !DILocation(line: 11, column: 23, scope: !4410)
!4413 = !DILocation(line: 11, column: 5, scope: !4406)
!4414 = !DILocation(line: 12, column: 18, scope: !4415)
!4415 = distinct !DILexicalBlock(scope: !4410, file: !803, line: 11, column: 43)
!4416 = !DILocation(line: 12, column: 21, scope: !4415)
!4417 = !DILocation(line: 12, column: 9, scope: !4415)
!4418 = !DILocation(line: 12, column: 13, scope: !4415)
!4419 = !DILocation(line: 12, column: 16, scope: !4415)
!4420 = !DILocation(line: 13, column: 5, scope: !4415)
!4421 = !DILocation(line: 11, column: 39, scope: !4410)
!4422 = !DILocation(line: 11, column: 5, scope: !4410)
!4423 = distinct !{!4423, !4413, !4424, !165}
!4424 = !DILocation(line: 13, column: 5, scope: !4406)
!4425 = !DILocation(line: 14, column: 1, scope: !4398)
!4426 = distinct !DISubprogram(name: "m_vec_add", scope: !803, file: !803, line: 17, type: !3985, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !91)
!4427 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !4426, file: !803, line: 17, type: !51)
!4428 = !DILocation(line: 17, column: 27, scope: !4426)
!4429 = !DILocalVariable(name: "in", arg: 2, scope: !4426, file: !803, line: 17, type: !609)
!4430 = !DILocation(line: 17, column: 56, scope: !4426)
!4431 = !DILocalVariable(name: "acc", arg: 3, scope: !4426, file: !803, line: 17, type: !81)
!4432 = !DILocation(line: 17, column: 70, scope: !4426)
!4433 = !DILocalVariable(name: "i", scope: !4434, file: !803, line: 18, type: !51)
!4434 = distinct !DILexicalBlock(scope: !4426, file: !803, line: 18, column: 5)
!4435 = !DILocation(line: 18, column: 14, scope: !4434)
!4436 = !DILocation(line: 18, column: 10, scope: !4434)
!4437 = !DILocation(line: 18, column: 21, scope: !4438)
!4438 = distinct !DILexicalBlock(scope: !4434, file: !803, line: 18, column: 5)
!4439 = !DILocation(line: 18, column: 25, scope: !4438)
!4440 = !DILocation(line: 18, column: 23, scope: !4438)
!4441 = !DILocation(line: 18, column: 5, scope: !4434)
!4442 = !DILocation(line: 19, column: 19, scope: !4443)
!4443 = distinct !DILexicalBlock(scope: !4438, file: !803, line: 18, column: 43)
!4444 = !DILocation(line: 19, column: 22, scope: !4443)
!4445 = !DILocation(line: 19, column: 9, scope: !4443)
!4446 = !DILocation(line: 19, column: 13, scope: !4443)
!4447 = !DILocation(line: 19, column: 16, scope: !4443)
!4448 = !DILocation(line: 20, column: 5, scope: !4443)
!4449 = !DILocation(line: 18, column: 39, scope: !4438)
!4450 = !DILocation(line: 18, column: 5, scope: !4438)
!4451 = distinct !{!4451, !4441, !4452, !165}
!4452 = !DILocation(line: 20, column: 5, scope: !4434)
!4453 = !DILocation(line: 21, column: 1, scope: !4426)
!4454 = distinct !DISubprogram(name: "sample_solution", scope: !70, file: !70, line: 40, type: !4455, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !43, retainedNodes: !91)
!4455 = !DISubroutineType(types: !4456)
!4456 = !{!51, !4286, !55, !60, !60, !55, !51, !51, !51, !51}
!4457 = !DILocalVariable(name: "p", arg: 1, scope: !4454, file: !70, line: 40, type: !4286)
!4458 = !DILocation(line: 40, column: 42, scope: !4454)
!4459 = !DILocalVariable(name: "A", arg: 2, scope: !4454, file: !70, line: 40, type: !55)
!4460 = !DILocation(line: 40, column: 60, scope: !4454)
!4461 = !DILocalVariable(name: "y", arg: 3, scope: !4454, file: !70, line: 41, type: !60)
!4462 = !DILocation(line: 41, column: 49, scope: !4454)
!4463 = !DILocalVariable(name: "r", arg: 4, scope: !4454, file: !70, line: 41, type: !60)
!4464 = !DILocation(line: 41, column: 73, scope: !4454)
!4465 = !DILocalVariable(name: "x", arg: 5, scope: !4454, file: !70, line: 42, type: !55)
!4466 = !DILocation(line: 42, column: 43, scope: !4454)
!4467 = !DILocalVariable(name: "k", arg: 6, scope: !4454, file: !70, line: 42, type: !51)
!4468 = !DILocation(line: 42, column: 50, scope: !4454)
!4469 = !DILocalVariable(name: "o", arg: 7, scope: !4454, file: !70, line: 42, type: !51)
!4470 = !DILocation(line: 42, column: 57, scope: !4454)
!4471 = !DILocalVariable(name: "m", arg: 8, scope: !4454, file: !70, line: 42, type: !51)
!4472 = !DILocation(line: 42, column: 64, scope: !4454)
!4473 = !DILocalVariable(name: "A_cols", arg: 9, scope: !4454, file: !70, line: 42, type: !51)
!4474 = !DILocation(line: 42, column: 71, scope: !4454)
!4475 = !DILocalVariable(name: "finished", scope: !4454, file: !70, line: 46, type: !56)
!4476 = !DILocation(line: 46, column: 19, scope: !4454)
!4477 = !DILocalVariable(name: "col_upper_bound", scope: !4454, file: !70, line: 47, type: !51)
!4478 = !DILocation(line: 47, column: 9, scope: !4454)
!4479 = !DILocalVariable(name: "correct_column", scope: !4454, file: !70, line: 48, type: !56)
!4480 = !DILocation(line: 48, column: 19, scope: !4454)
!4481 = !DILocalVariable(name: "i", scope: !4482, file: !70, line: 51, type: !51)
!4482 = distinct !DILexicalBlock(scope: !4454, file: !70, line: 51, column: 5)
!4483 = !DILocation(line: 51, column: 14, scope: !4482)
!4484 = !DILocation(line: 51, column: 10, scope: !4482)
!4485 = !DILocation(line: 51, column: 21, scope: !4486)
!4486 = distinct !DILexicalBlock(scope: !4482, file: !70, line: 51, column: 5)
!4487 = !DILocation(line: 51, column: 25, scope: !4486)
!4488 = !DILocation(line: 51, column: 29, scope: !4486)
!4489 = !DILocation(line: 51, column: 27, scope: !4486)
!4490 = !DILocation(line: 51, column: 23, scope: !4486)
!4491 = !DILocation(line: 51, column: 5, scope: !4482)
!4492 = !DILocation(line: 52, column: 16, scope: !4493)
!4493 = distinct !DILexicalBlock(scope: !4486, file: !70, line: 51, column: 37)
!4494 = !DILocation(line: 52, column: 18, scope: !4493)
!4495 = !DILocation(line: 52, column: 9, scope: !4493)
!4496 = !DILocation(line: 52, column: 11, scope: !4493)
!4497 = !DILocation(line: 52, column: 14, scope: !4493)
!4498 = !DILocation(line: 53, column: 5, scope: !4493)
!4499 = !DILocation(line: 51, column: 33, scope: !4486)
!4500 = !DILocation(line: 51, column: 5, scope: !4486)
!4501 = distinct !{!4501, !4491, !4502, !165}
!4502 = !DILocation(line: 53, column: 5, scope: !4482)
!4503 = !DILocalVariable(name: "Ar", scope: !4454, file: !70, line: 56, type: !1306)
!4504 = !DILocation(line: 56, column: 19, scope: !4454)
!4505 = !DILocalVariable(name: "i", scope: !4506, file: !70, line: 57, type: !51)
!4506 = distinct !DILexicalBlock(scope: !4454, file: !70, line: 57, column: 5)
!4507 = !DILocation(line: 57, column: 14, scope: !4506)
!4508 = !DILocation(line: 57, column: 10, scope: !4506)
!4509 = !DILocation(line: 57, column: 21, scope: !4510)
!4510 = distinct !DILexicalBlock(scope: !4506, file: !70, line: 57, column: 5)
!4511 = !DILocation(line: 57, column: 25, scope: !4510)
!4512 = !DILocation(line: 57, column: 23, scope: !4510)
!4513 = !DILocation(line: 57, column: 5, scope: !4506)
!4514 = !DILocation(line: 58, column: 9, scope: !4515)
!4515 = distinct !DILexicalBlock(scope: !4510, file: !70, line: 57, column: 33)
!4516 = !DILocation(line: 58, column: 11, scope: !4515)
!4517 = !DILocation(line: 58, column: 15, scope: !4515)
!4518 = !DILocation(line: 58, column: 13, scope: !4515)
!4519 = !DILocation(line: 58, column: 19, scope: !4515)
!4520 = !DILocation(line: 58, column: 24, scope: !4515)
!4521 = !DILocation(line: 58, column: 28, scope: !4515)
!4522 = !DILocation(line: 58, column: 26, scope: !4515)
!4523 = !DILocation(line: 58, column: 30, scope: !4515)
!4524 = !DILocation(line: 58, column: 21, scope: !4515)
!4525 = !DILocation(line: 58, column: 17, scope: !4515)
!4526 = !DILocation(line: 58, column: 36, scope: !4515)
!4527 = !DILocation(line: 59, column: 5, scope: !4515)
!4528 = !DILocation(line: 57, column: 29, scope: !4510)
!4529 = !DILocation(line: 57, column: 5, scope: !4510)
!4530 = distinct !{!4530, !4513, !4531, !165}
!4531 = !DILocation(line: 59, column: 5, scope: !4506)
!4532 = !DILocation(line: 60, column: 13, scope: !4454)
!4533 = !DILocation(line: 60, column: 16, scope: !4454)
!4534 = !DILocation(line: 60, column: 19, scope: !4454)
!4535 = !DILocation(line: 60, column: 23, scope: !4454)
!4536 = !DILocation(line: 60, column: 27, scope: !4454)
!4537 = !DILocation(line: 60, column: 25, scope: !4454)
!4538 = !DILocation(line: 60, column: 29, scope: !4454)
!4539 = !DILocation(line: 60, column: 34, scope: !4454)
!4540 = !DILocation(line: 60, column: 5, scope: !4454)
!4541 = !DILocalVariable(name: "i", scope: !4542, file: !70, line: 63, type: !51)
!4542 = distinct !DILexicalBlock(scope: !4454, file: !70, line: 63, column: 5)
!4543 = !DILocation(line: 63, column: 14, scope: !4542)
!4544 = !DILocation(line: 63, column: 10, scope: !4542)
!4545 = !DILocation(line: 63, column: 21, scope: !4546)
!4546 = distinct !DILexicalBlock(scope: !4542, file: !70, line: 63, column: 5)
!4547 = !DILocation(line: 63, column: 25, scope: !4546)
!4548 = !DILocation(line: 63, column: 23, scope: !4546)
!4549 = !DILocation(line: 63, column: 5, scope: !4542)
!4550 = !DILocation(line: 64, column: 44, scope: !4551)
!4551 = distinct !DILexicalBlock(scope: !4546, file: !70, line: 63, column: 33)
!4552 = !DILocation(line: 64, column: 46, scope: !4551)
!4553 = !DILocation(line: 64, column: 53, scope: !4551)
!4554 = !DILocation(line: 64, column: 50, scope: !4551)
!4555 = !DILocation(line: 64, column: 38, scope: !4551)
!4556 = !DILocation(line: 64, column: 9, scope: !4551)
!4557 = !DILocation(line: 64, column: 11, scope: !4551)
!4558 = !DILocation(line: 64, column: 15, scope: !4551)
!4559 = !DILocation(line: 64, column: 13, scope: !4551)
!4560 = !DILocation(line: 64, column: 19, scope: !4551)
!4561 = !DILocation(line: 64, column: 24, scope: !4551)
!4562 = !DILocation(line: 64, column: 28, scope: !4551)
!4563 = !DILocation(line: 64, column: 26, scope: !4551)
!4564 = !DILocation(line: 64, column: 30, scope: !4551)
!4565 = !DILocation(line: 64, column: 21, scope: !4551)
!4566 = !DILocation(line: 64, column: 17, scope: !4551)
!4567 = !DILocation(line: 64, column: 36, scope: !4551)
!4568 = !DILocation(line: 65, column: 5, scope: !4551)
!4569 = !DILocation(line: 63, column: 29, scope: !4546)
!4570 = !DILocation(line: 63, column: 5, scope: !4546)
!4571 = distinct !{!4571, !4549, !4572, !165}
!4572 = !DILocation(line: 65, column: 5, scope: !4542)
!4573 = !DILocation(line: 67, column: 8, scope: !4454)
!4574 = !DILocation(line: 67, column: 11, scope: !4454)
!4575 = !DILocation(line: 67, column: 14, scope: !4454)
!4576 = !DILocation(line: 67, column: 18, scope: !4454)
!4577 = !DILocation(line: 67, column: 16, scope: !4454)
!4578 = !DILocation(line: 67, column: 20, scope: !4454)
!4579 = !DILocation(line: 67, column: 5, scope: !4454)
!4580 = !DILocalVariable(name: "full_rank", scope: !4454, file: !70, line: 70, type: !56)
!4581 = !DILocation(line: 70, column: 19, scope: !4454)
!4582 = !DILocalVariable(name: "i", scope: !4583, file: !70, line: 71, type: !51)
!4583 = distinct !DILexicalBlock(scope: !4454, file: !70, line: 71, column: 5)
!4584 = !DILocation(line: 71, column: 14, scope: !4583)
!4585 = !DILocation(line: 71, column: 10, scope: !4583)
!4586 = !DILocation(line: 71, column: 21, scope: !4587)
!4587 = distinct !DILexicalBlock(scope: !4583, file: !70, line: 71, column: 5)
!4588 = !DILocation(line: 71, column: 25, scope: !4587)
!4589 = !DILocation(line: 71, column: 32, scope: !4587)
!4590 = !DILocation(line: 71, column: 23, scope: !4587)
!4591 = !DILocation(line: 71, column: 5, scope: !4583)
!4592 = !DILocation(line: 72, column: 22, scope: !4593)
!4593 = distinct !DILexicalBlock(scope: !4587, file: !70, line: 71, column: 42)
!4594 = !DILocation(line: 72, column: 25, scope: !4593)
!4595 = !DILocation(line: 72, column: 27, scope: !4593)
!4596 = !DILocation(line: 72, column: 34, scope: !4593)
!4597 = !DILocation(line: 72, column: 32, scope: !4593)
!4598 = !DILocation(line: 72, column: 43, scope: !4593)
!4599 = !DILocation(line: 72, column: 41, scope: !4593)
!4600 = !DILocation(line: 72, column: 19, scope: !4593)
!4601 = !DILocation(line: 73, column: 5, scope: !4593)
!4602 = !DILocation(line: 71, column: 38, scope: !4587)
!4603 = !DILocation(line: 71, column: 5, scope: !4587)
!4604 = distinct !{!4604, !4591, !4605, !165}
!4605 = !DILocation(line: 73, column: 5, scope: !4583)
!4606 = !DILocation(line: 80, column: 9, scope: !4607)
!4607 = distinct !DILexicalBlock(scope: !4454, file: !70, line: 80, column: 9)
!4608 = !DILocation(line: 80, column: 19, scope: !4607)
!4609 = !DILocation(line: 81, column: 9, scope: !4610)
!4610 = distinct !DILexicalBlock(scope: !4607, file: !70, line: 80, column: 25)
!4611 = !DILocalVariable(name: "row", scope: !4612, file: !70, line: 88, type: !51)
!4612 = distinct !DILexicalBlock(scope: !4454, file: !70, line: 88, column: 5)
!4613 = !DILocation(line: 88, column: 14, scope: !4612)
!4614 = !DILocation(line: 88, column: 20, scope: !4612)
!4615 = !DILocation(line: 88, column: 22, scope: !4612)
!4616 = !DILocation(line: 88, column: 10, scope: !4612)
!4617 = !DILocation(line: 88, column: 27, scope: !4618)
!4618 = distinct !DILexicalBlock(scope: !4612, file: !70, line: 88, column: 5)
!4619 = !DILocation(line: 88, column: 31, scope: !4618)
!4620 = !DILocation(line: 88, column: 5, scope: !4612)
!4621 = !DILocation(line: 89, column: 18, scope: !4622)
!4622 = distinct !DILexicalBlock(scope: !4618, file: !70, line: 88, column: 44)
!4623 = !DILocation(line: 90, column: 27, scope: !4622)
!4624 = !DILocation(line: 90, column: 25, scope: !4622)
!4625 = !DILocalVariable(name: "col", scope: !4626, file: !70, line: 93, type: !51)
!4626 = distinct !DILexicalBlock(scope: !4622, file: !70, line: 93, column: 9)
!4627 = !DILocation(line: 93, column: 18, scope: !4626)
!4628 = !DILocation(line: 93, column: 24, scope: !4626)
!4629 = !DILocation(line: 93, column: 14, scope: !4626)
!4630 = !DILocation(line: 93, column: 29, scope: !4631)
!4631 = distinct !DILexicalBlock(scope: !4626, file: !70, line: 93, column: 9)
!4632 = !DILocation(line: 93, column: 36, scope: !4631)
!4633 = !DILocation(line: 93, column: 33, scope: !4631)
!4634 = !DILocation(line: 93, column: 9, scope: !4626)
!4635 = !DILocation(line: 97, column: 44, scope: !4636)
!4636 = distinct !DILexicalBlock(scope: !4631, file: !70, line: 93, column: 60)
!4637 = !DILocation(line: 97, column: 46, scope: !4636)
!4638 = !DILocation(line: 97, column: 52, scope: !4636)
!4639 = !DILocation(line: 97, column: 50, scope: !4636)
!4640 = !DILocation(line: 97, column: 61, scope: !4636)
!4641 = !DILocation(line: 97, column: 59, scope: !4636)
!4642 = !DILocation(line: 97, column: 30, scope: !4636)
!4643 = !DILocation(line: 97, column: 74, scope: !4636)
!4644 = !DILocation(line: 97, column: 73, scope: !4636)
!4645 = !DILocation(line: 97, column: 71, scope: !4636)
!4646 = !DILocation(line: 97, column: 28, scope: !4636)
!4647 = !DILocalVariable(name: "u", scope: !4636, file: !70, line: 99, type: !56)
!4648 = !DILocation(line: 99, column: 27, scope: !4636)
!4649 = !DILocation(line: 99, column: 31, scope: !4636)
!4650 = !DILocation(line: 99, column: 48, scope: !4636)
!4651 = !DILocation(line: 99, column: 50, scope: !4636)
!4652 = !DILocation(line: 99, column: 56, scope: !4636)
!4653 = !DILocation(line: 99, column: 54, scope: !4636)
!4654 = !DILocation(line: 99, column: 65, scope: !4636)
!4655 = !DILocation(line: 99, column: 63, scope: !4636)
!4656 = !DILocation(line: 99, column: 72, scope: !4636)
!4657 = !DILocation(line: 99, column: 46, scope: !4636)
!4658 = !DILocation(line: 100, column: 23, scope: !4636)
!4659 = !DILocation(line: 100, column: 13, scope: !4636)
!4660 = !DILocation(line: 100, column: 15, scope: !4636)
!4661 = !DILocation(line: 100, column: 20, scope: !4636)
!4662 = !DILocalVariable(name: "i", scope: !4663, file: !70, line: 102, type: !51)
!4663 = distinct !DILexicalBlock(scope: !4636, file: !70, line: 102, column: 13)
!4664 = !DILocation(line: 102, column: 22, scope: !4663)
!4665 = !DILocation(line: 102, column: 18, scope: !4663)
!4666 = !DILocation(line: 102, column: 29, scope: !4667)
!4667 = distinct !DILexicalBlock(scope: !4663, file: !70, line: 102, column: 13)
!4668 = !DILocation(line: 102, column: 33, scope: !4667)
!4669 = !DILocation(line: 102, column: 31, scope: !4667)
!4670 = !DILocation(line: 102, column: 13, scope: !4663)
!4671 = !DILocalVariable(name: "tmp", scope: !4672, file: !70, line: 103, type: !46)
!4672 = distinct !DILexicalBlock(scope: !4667, file: !70, line: 102, column: 46)
!4673 = !DILocation(line: 103, column: 26, scope: !4672)
!4674 = !DILocation(line: 103, column: 45, scope: !4672)
!4675 = !DILocation(line: 103, column: 48, scope: !4672)
!4676 = !DILocation(line: 103, column: 55, scope: !4672)
!4677 = !DILocation(line: 103, column: 53, scope: !4672)
!4678 = !DILocation(line: 103, column: 64, scope: !4672)
!4679 = !DILocation(line: 103, column: 62, scope: !4672)
!4680 = !DILocation(line: 103, column: 34, scope: !4672)
!4681 = !DILocation(line: 103, column: 69, scope: !4672)
!4682 = !DILocation(line: 103, column: 91, scope: !4672)
!4683 = !DILocation(line: 103, column: 94, scope: !4672)
!4684 = !DILocation(line: 103, column: 95, scope: !4672)
!4685 = !DILocation(line: 103, column: 101, scope: !4672)
!4686 = !DILocation(line: 103, column: 99, scope: !4672)
!4687 = !DILocation(line: 103, column: 110, scope: !4672)
!4688 = !DILocation(line: 103, column: 108, scope: !4672)
!4689 = !DILocation(line: 103, column: 80, scope: !4672)
!4690 = !DILocation(line: 103, column: 115, scope: !4672)
!4691 = !DILocation(line: 103, column: 76, scope: !4672)
!4692 = !DILocation(line: 104, column: 45, scope: !4672)
!4693 = !DILocation(line: 104, column: 48, scope: !4672)
!4694 = !DILocation(line: 104, column: 49, scope: !4672)
!4695 = !DILocation(line: 104, column: 55, scope: !4672)
!4696 = !DILocation(line: 104, column: 53, scope: !4672)
!4697 = !DILocation(line: 104, column: 64, scope: !4672)
!4698 = !DILocation(line: 104, column: 62, scope: !4672)
!4699 = !DILocation(line: 104, column: 34, scope: !4672)
!4700 = !DILocation(line: 104, column: 69, scope: !4672)
!4701 = !DILocation(line: 104, column: 30, scope: !4672)
!4702 = !DILocation(line: 104, column: 91, scope: !4672)
!4703 = !DILocation(line: 104, column: 94, scope: !4672)
!4704 = !DILocation(line: 104, column: 95, scope: !4672)
!4705 = !DILocation(line: 104, column: 101, scope: !4672)
!4706 = !DILocation(line: 104, column: 99, scope: !4672)
!4707 = !DILocation(line: 104, column: 110, scope: !4672)
!4708 = !DILocation(line: 104, column: 108, scope: !4672)
!4709 = !DILocation(line: 104, column: 80, scope: !4672)
!4710 = !DILocation(line: 104, column: 115, scope: !4672)
!4711 = !DILocation(line: 104, column: 76, scope: !4672)
!4712 = !DILocation(line: 105, column: 45, scope: !4672)
!4713 = !DILocation(line: 105, column: 48, scope: !4672)
!4714 = !DILocation(line: 105, column: 49, scope: !4672)
!4715 = !DILocation(line: 105, column: 55, scope: !4672)
!4716 = !DILocation(line: 105, column: 53, scope: !4672)
!4717 = !DILocation(line: 105, column: 64, scope: !4672)
!4718 = !DILocation(line: 105, column: 62, scope: !4672)
!4719 = !DILocation(line: 105, column: 34, scope: !4672)
!4720 = !DILocation(line: 105, column: 69, scope: !4672)
!4721 = !DILocation(line: 105, column: 30, scope: !4672)
!4722 = !DILocation(line: 105, column: 91, scope: !4672)
!4723 = !DILocation(line: 105, column: 94, scope: !4672)
!4724 = !DILocation(line: 105, column: 95, scope: !4672)
!4725 = !DILocation(line: 105, column: 101, scope: !4672)
!4726 = !DILocation(line: 105, column: 99, scope: !4672)
!4727 = !DILocation(line: 105, column: 110, scope: !4672)
!4728 = !DILocation(line: 105, column: 108, scope: !4672)
!4729 = !DILocation(line: 105, column: 80, scope: !4672)
!4730 = !DILocation(line: 105, column: 115, scope: !4672)
!4731 = !DILocation(line: 105, column: 76, scope: !4672)
!4732 = !DILocation(line: 106, column: 45, scope: !4672)
!4733 = !DILocation(line: 106, column: 48, scope: !4672)
!4734 = !DILocation(line: 106, column: 49, scope: !4672)
!4735 = !DILocation(line: 106, column: 55, scope: !4672)
!4736 = !DILocation(line: 106, column: 53, scope: !4672)
!4737 = !DILocation(line: 106, column: 64, scope: !4672)
!4738 = !DILocation(line: 106, column: 62, scope: !4672)
!4739 = !DILocation(line: 106, column: 34, scope: !4672)
!4740 = !DILocation(line: 106, column: 69, scope: !4672)
!4741 = !DILocation(line: 106, column: 30, scope: !4672)
!4742 = !DILocation(line: 106, column: 91, scope: !4672)
!4743 = !DILocation(line: 106, column: 94, scope: !4672)
!4744 = !DILocation(line: 106, column: 95, scope: !4672)
!4745 = !DILocation(line: 106, column: 101, scope: !4672)
!4746 = !DILocation(line: 106, column: 99, scope: !4672)
!4747 = !DILocation(line: 106, column: 110, scope: !4672)
!4748 = !DILocation(line: 106, column: 108, scope: !4672)
!4749 = !DILocation(line: 106, column: 80, scope: !4672)
!4750 = !DILocation(line: 106, column: 115, scope: !4672)
!4751 = !DILocation(line: 106, column: 76, scope: !4672)
!4752 = !DILocation(line: 108, column: 31, scope: !4672)
!4753 = !DILocation(line: 108, column: 34, scope: !4672)
!4754 = !DILocation(line: 108, column: 23, scope: !4672)
!4755 = !DILocation(line: 108, column: 21, scope: !4672)
!4756 = !DILocation(line: 110, column: 52, scope: !4672)
!4757 = !DILocation(line: 110, column: 63, scope: !4672)
!4758 = !DILocation(line: 110, column: 17, scope: !4672)
!4759 = !DILocation(line: 110, column: 20, scope: !4672)
!4760 = !DILocation(line: 110, column: 27, scope: !4672)
!4761 = !DILocation(line: 110, column: 25, scope: !4672)
!4762 = !DILocation(line: 110, column: 36, scope: !4672)
!4763 = !DILocation(line: 110, column: 34, scope: !4672)
!4764 = !DILocation(line: 110, column: 43, scope: !4672)
!4765 = !DILocation(line: 110, column: 48, scope: !4672)
!4766 = !DILocation(line: 111, column: 52, scope: !4672)
!4767 = !DILocation(line: 111, column: 56, scope: !4672)
!4768 = !DILocation(line: 111, column: 63, scope: !4672)
!4769 = !DILocation(line: 111, column: 17, scope: !4672)
!4770 = !DILocation(line: 111, column: 20, scope: !4672)
!4771 = !DILocation(line: 111, column: 21, scope: !4672)
!4772 = !DILocation(line: 111, column: 27, scope: !4672)
!4773 = !DILocation(line: 111, column: 25, scope: !4672)
!4774 = !DILocation(line: 111, column: 36, scope: !4672)
!4775 = !DILocation(line: 111, column: 34, scope: !4672)
!4776 = !DILocation(line: 111, column: 43, scope: !4672)
!4777 = !DILocation(line: 111, column: 48, scope: !4672)
!4778 = !DILocation(line: 112, column: 52, scope: !4672)
!4779 = !DILocation(line: 112, column: 56, scope: !4672)
!4780 = !DILocation(line: 112, column: 63, scope: !4672)
!4781 = !DILocation(line: 112, column: 17, scope: !4672)
!4782 = !DILocation(line: 112, column: 20, scope: !4672)
!4783 = !DILocation(line: 112, column: 21, scope: !4672)
!4784 = !DILocation(line: 112, column: 27, scope: !4672)
!4785 = !DILocation(line: 112, column: 25, scope: !4672)
!4786 = !DILocation(line: 112, column: 36, scope: !4672)
!4787 = !DILocation(line: 112, column: 34, scope: !4672)
!4788 = !DILocation(line: 112, column: 43, scope: !4672)
!4789 = !DILocation(line: 112, column: 48, scope: !4672)
!4790 = !DILocation(line: 113, column: 52, scope: !4672)
!4791 = !DILocation(line: 113, column: 56, scope: !4672)
!4792 = !DILocation(line: 113, column: 63, scope: !4672)
!4793 = !DILocation(line: 113, column: 17, scope: !4672)
!4794 = !DILocation(line: 113, column: 20, scope: !4672)
!4795 = !DILocation(line: 113, column: 21, scope: !4672)
!4796 = !DILocation(line: 113, column: 27, scope: !4672)
!4797 = !DILocation(line: 113, column: 25, scope: !4672)
!4798 = !DILocation(line: 113, column: 36, scope: !4672)
!4799 = !DILocation(line: 113, column: 34, scope: !4672)
!4800 = !DILocation(line: 113, column: 43, scope: !4672)
!4801 = !DILocation(line: 113, column: 48, scope: !4672)
!4802 = !DILocation(line: 114, column: 52, scope: !4672)
!4803 = !DILocation(line: 114, column: 56, scope: !4672)
!4804 = !DILocation(line: 114, column: 63, scope: !4672)
!4805 = !DILocation(line: 114, column: 17, scope: !4672)
!4806 = !DILocation(line: 114, column: 20, scope: !4672)
!4807 = !DILocation(line: 114, column: 21, scope: !4672)
!4808 = !DILocation(line: 114, column: 27, scope: !4672)
!4809 = !DILocation(line: 114, column: 25, scope: !4672)
!4810 = !DILocation(line: 114, column: 36, scope: !4672)
!4811 = !DILocation(line: 114, column: 34, scope: !4672)
!4812 = !DILocation(line: 114, column: 43, scope: !4672)
!4813 = !DILocation(line: 114, column: 48, scope: !4672)
!4814 = !DILocation(line: 115, column: 52, scope: !4672)
!4815 = !DILocation(line: 115, column: 56, scope: !4672)
!4816 = !DILocation(line: 115, column: 63, scope: !4672)
!4817 = !DILocation(line: 115, column: 17, scope: !4672)
!4818 = !DILocation(line: 115, column: 20, scope: !4672)
!4819 = !DILocation(line: 115, column: 21, scope: !4672)
!4820 = !DILocation(line: 115, column: 27, scope: !4672)
!4821 = !DILocation(line: 115, column: 25, scope: !4672)
!4822 = !DILocation(line: 115, column: 36, scope: !4672)
!4823 = !DILocation(line: 115, column: 34, scope: !4672)
!4824 = !DILocation(line: 115, column: 43, scope: !4672)
!4825 = !DILocation(line: 115, column: 48, scope: !4672)
!4826 = !DILocation(line: 116, column: 52, scope: !4672)
!4827 = !DILocation(line: 116, column: 56, scope: !4672)
!4828 = !DILocation(line: 116, column: 63, scope: !4672)
!4829 = !DILocation(line: 116, column: 17, scope: !4672)
!4830 = !DILocation(line: 116, column: 20, scope: !4672)
!4831 = !DILocation(line: 116, column: 21, scope: !4672)
!4832 = !DILocation(line: 116, column: 27, scope: !4672)
!4833 = !DILocation(line: 116, column: 25, scope: !4672)
!4834 = !DILocation(line: 116, column: 36, scope: !4672)
!4835 = !DILocation(line: 116, column: 34, scope: !4672)
!4836 = !DILocation(line: 116, column: 43, scope: !4672)
!4837 = !DILocation(line: 116, column: 48, scope: !4672)
!4838 = !DILocation(line: 117, column: 52, scope: !4672)
!4839 = !DILocation(line: 117, column: 56, scope: !4672)
!4840 = !DILocation(line: 117, column: 63, scope: !4672)
!4841 = !DILocation(line: 117, column: 17, scope: !4672)
!4842 = !DILocation(line: 117, column: 20, scope: !4672)
!4843 = !DILocation(line: 117, column: 21, scope: !4672)
!4844 = !DILocation(line: 117, column: 27, scope: !4672)
!4845 = !DILocation(line: 117, column: 25, scope: !4672)
!4846 = !DILocation(line: 117, column: 36, scope: !4672)
!4847 = !DILocation(line: 117, column: 34, scope: !4672)
!4848 = !DILocation(line: 117, column: 43, scope: !4672)
!4849 = !DILocation(line: 117, column: 48, scope: !4672)
!4850 = !DILocation(line: 118, column: 13, scope: !4672)
!4851 = !DILocation(line: 102, column: 40, scope: !4667)
!4852 = !DILocation(line: 102, column: 13, scope: !4667)
!4853 = distinct !{!4853, !4670, !4854, !165}
!4854 = !DILocation(line: 118, column: 13, scope: !4663)
!4855 = !DILocation(line: 120, column: 24, scope: !4636)
!4856 = !DILocation(line: 120, column: 35, scope: !4636)
!4857 = !DILocation(line: 120, column: 33, scope: !4636)
!4858 = !DILocation(line: 120, column: 22, scope: !4636)
!4859 = !DILocation(line: 121, column: 9, scope: !4636)
!4860 = !DILocation(line: 93, column: 56, scope: !4631)
!4861 = !DILocation(line: 93, column: 9, scope: !4631)
!4862 = distinct !{!4862, !4634, !4863, !165}
!4863 = !DILocation(line: 121, column: 9, scope: !4626)
!4864 = !DILocation(line: 122, column: 5, scope: !4622)
!4865 = !DILocation(line: 88, column: 40, scope: !4618)
!4866 = !DILocation(line: 88, column: 5, scope: !4618)
!4867 = distinct !{!4867, !4620, !4868, !165}
!4868 = !DILocation(line: 122, column: 5, scope: !4612)
!4869 = !DILocation(line: 123, column: 5, scope: !4454)
!4870 = !DILocation(line: 124, column: 1, scope: !4454)
!4871 = distinct !DISubprogram(name: "mat_mul", scope: !838, file: !838, line: 78, type: !2599, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !91)
!4872 = !DILocalVariable(name: "a", arg: 1, scope: !4871, file: !838, line: 78, type: !60)
!4873 = !DILocation(line: 78, column: 49, scope: !4871)
!4874 = !DILocalVariable(name: "b", arg: 2, scope: !4871, file: !838, line: 78, type: !60)
!4875 = !DILocation(line: 78, column: 73, scope: !4871)
!4876 = !DILocalVariable(name: "c", arg: 3, scope: !4871, file: !838, line: 79, type: !55)
!4877 = !DILocation(line: 79, column: 36, scope: !4871)
!4878 = !DILocalVariable(name: "colrow_ab", arg: 4, scope: !4871, file: !838, line: 79, type: !51)
!4879 = !DILocation(line: 79, column: 43, scope: !4871)
!4880 = !DILocalVariable(name: "row_a", arg: 5, scope: !4871, file: !838, line: 79, type: !51)
!4881 = !DILocation(line: 79, column: 58, scope: !4871)
!4882 = !DILocalVariable(name: "col_b", arg: 6, scope: !4871, file: !838, line: 79, type: !51)
!4883 = !DILocation(line: 79, column: 69, scope: !4871)
!4884 = !DILocalVariable(name: "i", scope: !4885, file: !838, line: 80, type: !51)
!4885 = distinct !DILexicalBlock(scope: !4871, file: !838, line: 80, column: 5)
!4886 = !DILocation(line: 80, column: 14, scope: !4885)
!4887 = !DILocation(line: 80, column: 10, scope: !4885)
!4888 = !DILocation(line: 80, column: 21, scope: !4889)
!4889 = distinct !DILexicalBlock(scope: !4885, file: !838, line: 80, column: 5)
!4890 = !DILocation(line: 80, column: 25, scope: !4889)
!4891 = !DILocation(line: 80, column: 23, scope: !4889)
!4892 = !DILocation(line: 80, column: 5, scope: !4885)
!4893 = !DILocalVariable(name: "j", scope: !4894, file: !838, line: 81, type: !51)
!4894 = distinct !DILexicalBlock(scope: !4895, file: !838, line: 81, column: 9)
!4895 = distinct !DILexicalBlock(scope: !4889, file: !838, line: 80, column: 53)
!4896 = !DILocation(line: 81, column: 18, scope: !4894)
!4897 = !DILocation(line: 81, column: 14, scope: !4894)
!4898 = !DILocation(line: 81, column: 25, scope: !4899)
!4899 = distinct !DILexicalBlock(scope: !4894, file: !838, line: 81, column: 9)
!4900 = !DILocation(line: 81, column: 29, scope: !4899)
!4901 = !DILocation(line: 81, column: 27, scope: !4899)
!4902 = !DILocation(line: 81, column: 9, scope: !4894)
!4903 = !DILocation(line: 82, column: 26, scope: !4904)
!4904 = distinct !DILexicalBlock(scope: !4899, file: !838, line: 81, column: 46)
!4905 = !DILocation(line: 82, column: 29, scope: !4904)
!4906 = !DILocation(line: 82, column: 33, scope: !4904)
!4907 = !DILocation(line: 82, column: 31, scope: !4904)
!4908 = !DILocation(line: 82, column: 36, scope: !4904)
!4909 = !DILocation(line: 82, column: 47, scope: !4904)
!4910 = !DILocation(line: 82, column: 18, scope: !4904)
!4911 = !DILocation(line: 82, column: 14, scope: !4904)
!4912 = !DILocation(line: 82, column: 16, scope: !4904)
!4913 = !DILocation(line: 83, column: 9, scope: !4904)
!4914 = !DILocation(line: 81, column: 36, scope: !4899)
!4915 = !DILocation(line: 81, column: 41, scope: !4899)
!4916 = !DILocation(line: 81, column: 9, scope: !4899)
!4917 = distinct !{!4917, !4902, !4918, !165}
!4918 = !DILocation(line: 83, column: 9, scope: !4894)
!4919 = !DILocation(line: 84, column: 5, scope: !4895)
!4920 = !DILocation(line: 80, column: 32, scope: !4889)
!4921 = !DILocation(line: 80, column: 42, scope: !4889)
!4922 = !DILocation(line: 80, column: 39, scope: !4889)
!4923 = !DILocation(line: 80, column: 5, scope: !4889)
!4924 = distinct !{!4924, !4892, !4925, !165}
!4925 = !DILocation(line: 84, column: 5, scope: !4885)
!4926 = !DILocation(line: 85, column: 1, scope: !4871)
!4927 = distinct !DISubprogram(name: "sub_f", scope: !838, file: !838, line: 47, type: !2774, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !91)
!4928 = !DILocalVariable(name: "a", arg: 1, scope: !4927, file: !838, line: 47, type: !56)
!4929 = !DILocation(line: 47, column: 49, scope: !4927)
!4930 = !DILocalVariable(name: "b", arg: 2, scope: !4927, file: !838, line: 47, type: !56)
!4931 = !DILocation(line: 47, column: 66, scope: !4927)
!4932 = !DILocation(line: 48, column: 12, scope: !4927)
!4933 = !DILocation(line: 48, column: 16, scope: !4927)
!4934 = !DILocation(line: 48, column: 14, scope: !4927)
!4935 = !DILocation(line: 48, column: 5, scope: !4927)
!4936 = distinct !DISubprogram(name: "EF", scope: !4937, file: !4937, line: 60, type: !4938, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !91)
!4937 = !DIFile(filename: "../../../src/generic/echelon_form.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!4938 = !DISubroutineType(types: !4939)
!4939 = !{null, !55, !51, !51}
!4940 = !DILocalVariable(name: "A", arg: 1, scope: !4936, file: !4937, line: 60, type: !55)
!4941 = !DILocation(line: 60, column: 38, scope: !4936)
!4942 = !DILocalVariable(name: "nrows", arg: 2, scope: !4936, file: !4937, line: 60, type: !51)
!4943 = !DILocation(line: 60, column: 45, scope: !4936)
!4944 = !DILocalVariable(name: "ncols", arg: 3, scope: !4936, file: !4937, line: 60, type: !51)
!4945 = !DILocation(line: 60, column: 56, scope: !4936)
!4946 = !DILocalVariable(name: "_pivot_row", scope: !4936, file: !4937, line: 62, type: !4947, align: 256)
!4947 = !DICompositeType(tag: DW_TAG_array_type, baseType: !46, size: 832, elements: !4948)
!4948 = !{!4949}
!4949 = !DISubrange(count: 13)
!4950 = !DILocation(line: 62, column: 27, scope: !4936)
!4951 = !DILocalVariable(name: "_pivot_row2", scope: !4936, file: !4937, line: 63, type: !4947, align: 256)
!4952 = !DILocation(line: 63, column: 27, scope: !4936)
!4953 = !DILocalVariable(name: "packed_A", scope: !4936, file: !4937, line: 64, type: !4954, align: 256)
!4954 = !DICompositeType(tag: DW_TAG_array_type, baseType: !46, size: 118144, elements: !4955)
!4955 = !{!4956}
!4956 = !DISubrange(count: 1846)
!4957 = !DILocation(line: 64, column: 27, scope: !4936)
!4958 = !DILocalVariable(name: "row_len", scope: !4936, file: !4937, line: 66, type: !51)
!4959 = !DILocation(line: 66, column: 9, scope: !4936)
!4960 = !DILocation(line: 66, column: 20, scope: !4936)
!4961 = !DILocation(line: 66, column: 26, scope: !4936)
!4962 = !DILocation(line: 66, column: 32, scope: !4936)
!4963 = !DILocalVariable(name: "i", scope: !4964, file: !4937, line: 69, type: !51)
!4964 = distinct !DILexicalBlock(scope: !4936, file: !4937, line: 69, column: 5)
!4965 = !DILocation(line: 69, column: 14, scope: !4964)
!4966 = !DILocation(line: 69, column: 10, scope: !4964)
!4967 = !DILocation(line: 69, column: 21, scope: !4968)
!4968 = distinct !DILexicalBlock(scope: !4964, file: !4937, line: 69, column: 5)
!4969 = !DILocation(line: 69, column: 25, scope: !4968)
!4970 = !DILocation(line: 69, column: 23, scope: !4968)
!4971 = !DILocation(line: 69, column: 5, scope: !4964)
!4972 = !DILocation(line: 70, column: 23, scope: !4973)
!4973 = distinct !DILexicalBlock(scope: !4968, file: !4937, line: 69, column: 37)
!4974 = !DILocation(line: 70, column: 27, scope: !4973)
!4975 = !DILocation(line: 70, column: 31, scope: !4973)
!4976 = !DILocation(line: 70, column: 29, scope: !4973)
!4977 = !DILocation(line: 70, column: 25, scope: !4973)
!4978 = !DILocation(line: 70, column: 38, scope: !4973)
!4979 = !DILocation(line: 70, column: 49, scope: !4973)
!4980 = !DILocation(line: 70, column: 53, scope: !4973)
!4981 = !DILocation(line: 70, column: 51, scope: !4973)
!4982 = !DILocation(line: 70, column: 47, scope: !4973)
!4983 = !DILocation(line: 70, column: 62, scope: !4973)
!4984 = !DILocation(line: 70, column: 9, scope: !4973)
!4985 = !DILocation(line: 71, column: 5, scope: !4973)
!4986 = !DILocation(line: 69, column: 33, scope: !4968)
!4987 = !DILocation(line: 69, column: 5, scope: !4968)
!4988 = distinct !{!4988, !4971, !4989, !165}
!4989 = !DILocation(line: 71, column: 5, scope: !4964)
!4990 = !DILocalVariable(name: "inverse", scope: !4936, file: !4937, line: 75, type: !56)
!4991 = !DILocation(line: 75, column: 19, scope: !4936)
!4992 = !DILocalVariable(name: "pivot_row", scope: !4936, file: !4937, line: 76, type: !51)
!4993 = !DILocation(line: 76, column: 9, scope: !4936)
!4994 = !DILocalVariable(name: "pivot_col", scope: !4995, file: !4937, line: 77, type: !51)
!4995 = distinct !DILexicalBlock(scope: !4936, file: !4937, line: 77, column: 5)
!4996 = !DILocation(line: 77, column: 14, scope: !4995)
!4997 = !DILocation(line: 77, column: 10, scope: !4995)
!4998 = !DILocation(line: 77, column: 29, scope: !4999)
!4999 = distinct !DILexicalBlock(scope: !4995, file: !4937, line: 77, column: 5)
!5000 = !DILocation(line: 77, column: 41, scope: !4999)
!5001 = !DILocation(line: 77, column: 39, scope: !4999)
!5002 = !DILocation(line: 77, column: 5, scope: !4995)
!5003 = !DILocalVariable(name: "pivot_row_lower_bound", scope: !5004, file: !4937, line: 79, type: !51)
!5004 = distinct !DILexicalBlock(scope: !4999, file: !4937, line: 77, column: 61)
!5005 = !DILocation(line: 79, column: 13, scope: !5004)
!5006 = !DILocation(line: 79, column: 37, scope: !5004)
!5007 = !DILocalVariable(name: "pivot_row_upper_bound", scope: !5004, file: !4937, line: 80, type: !51)
!5008 = !DILocation(line: 80, column: 13, scope: !5004)
!5009 = !DILocation(line: 80, column: 37, scope: !5004)
!5010 = !DILocalVariable(name: "i", scope: !5011, file: !4937, line: 85, type: !51)
!5011 = distinct !DILexicalBlock(scope: !5004, file: !4937, line: 85, column: 9)
!5012 = !DILocation(line: 85, column: 18, scope: !5011)
!5013 = !DILocation(line: 85, column: 14, scope: !5011)
!5014 = !DILocation(line: 85, column: 25, scope: !5015)
!5015 = distinct !DILexicalBlock(scope: !5011, file: !4937, line: 85, column: 9)
!5016 = !DILocation(line: 85, column: 29, scope: !5015)
!5017 = !DILocation(line: 85, column: 27, scope: !5015)
!5018 = !DILocation(line: 85, column: 9, scope: !5011)
!5019 = !DILocation(line: 86, column: 24, scope: !5020)
!5020 = distinct !DILexicalBlock(scope: !5015, file: !4937, line: 85, column: 43)
!5021 = !DILocation(line: 86, column: 13, scope: !5020)
!5022 = !DILocation(line: 86, column: 27, scope: !5020)
!5023 = !DILocation(line: 87, column: 25, scope: !5020)
!5024 = !DILocation(line: 87, column: 13, scope: !5020)
!5025 = !DILocation(line: 87, column: 28, scope: !5020)
!5026 = !DILocation(line: 88, column: 9, scope: !5020)
!5027 = !DILocation(line: 85, column: 39, scope: !5015)
!5028 = !DILocation(line: 85, column: 9, scope: !5015)
!5029 = distinct !{!5029, !5018, !5030, !165}
!5030 = !DILocation(line: 88, column: 9, scope: !5011)
!5031 = !DILocalVariable(name: "pivot", scope: !5004, file: !4937, line: 91, type: !56)
!5032 = !DILocation(line: 91, column: 23, scope: !5004)
!5033 = !DILocalVariable(name: "pivot_is_zero", scope: !5004, file: !4937, line: 92, type: !46)
!5034 = !DILocation(line: 92, column: 18, scope: !5004)
!5035 = !DILocalVariable(name: "row", scope: !5036, file: !4937, line: 93, type: !51)
!5036 = distinct !DILexicalBlock(scope: !5004, file: !4937, line: 93, column: 9)
!5037 = !DILocation(line: 93, column: 18, scope: !5036)
!5038 = !DILocation(line: 93, column: 24, scope: !5036)
!5039 = !DILocation(line: 93, column: 14, scope: !5036)
!5040 = !DILocation(line: 94, column: 17, scope: !5041)
!5041 = distinct !DILexicalBlock(scope: !5036, file: !4937, line: 93, column: 9)
!5042 = !DILocation(line: 94, column: 24, scope: !5041)
!5043 = !DILocation(line: 94, column: 21, scope: !5041)
!5044 = !DILocation(line: 93, column: 9, scope: !5036)
!5045 = !DILocalVariable(name: "is_pivot_row", scope: !5046, file: !4937, line: 96, type: !46)
!5046 = distinct !DILexicalBlock(scope: !5041, file: !4937, line: 94, column: 80)
!5047 = !DILocation(line: 96, column: 22, scope: !5046)
!5048 = !DILocation(line: 96, column: 52, scope: !5046)
!5049 = !DILocation(line: 96, column: 57, scope: !5046)
!5050 = !DILocation(line: 96, column: 38, scope: !5046)
!5051 = !DILocation(line: 96, column: 37, scope: !5046)
!5052 = !DILocalVariable(name: "below_pivot_row", scope: !5046, file: !4937, line: 97, type: !46)
!5053 = !DILocation(line: 97, column: 22, scope: !5046)
!5054 = !DILocation(line: 97, column: 62, scope: !5046)
!5055 = !DILocation(line: 97, column: 67, scope: !5046)
!5056 = !DILocation(line: 97, column: 40, scope: !5046)
!5057 = !DILocalVariable(name: "j", scope: !5058, file: !4937, line: 99, type: !51)
!5058 = distinct !DILexicalBlock(scope: !5046, file: !4937, line: 99, column: 13)
!5059 = !DILocation(line: 99, column: 22, scope: !5058)
!5060 = !DILocation(line: 99, column: 18, scope: !5058)
!5061 = !DILocation(line: 99, column: 29, scope: !5062)
!5062 = distinct !DILexicalBlock(scope: !5058, file: !4937, line: 99, column: 13)
!5063 = !DILocation(line: 99, column: 33, scope: !5062)
!5064 = !DILocation(line: 99, column: 31, scope: !5062)
!5065 = !DILocation(line: 99, column: 13, scope: !5058)
!5066 = !DILocation(line: 100, column: 35, scope: !5067)
!5067 = distinct !DILexicalBlock(scope: !5062, file: !4937, line: 99, column: 47)
!5068 = !DILocation(line: 100, column: 51, scope: !5067)
!5069 = !DILocation(line: 100, column: 69, scope: !5067)
!5070 = !DILocation(line: 100, column: 67, scope: !5067)
!5071 = !DILocation(line: 100, column: 48, scope: !5067)
!5072 = !DILocation(line: 101, column: 43, scope: !5067)
!5073 = !DILocation(line: 101, column: 49, scope: !5067)
!5074 = !DILocation(line: 101, column: 47, scope: !5067)
!5075 = !DILocation(line: 101, column: 59, scope: !5067)
!5076 = !DILocation(line: 101, column: 57, scope: !5067)
!5077 = !DILocation(line: 101, column: 34, scope: !5067)
!5078 = !DILocation(line: 100, column: 85, scope: !5067)
!5079 = !DILocation(line: 100, column: 28, scope: !5067)
!5080 = !DILocation(line: 100, column: 17, scope: !5067)
!5081 = !DILocation(line: 100, column: 31, scope: !5067)
!5082 = !DILocation(line: 102, column: 13, scope: !5067)
!5083 = !DILocation(line: 99, column: 43, scope: !5062)
!5084 = !DILocation(line: 99, column: 13, scope: !5062)
!5085 = distinct !{!5085, !5065, !5086, !165}
!5086 = !DILocation(line: 102, column: 13, scope: !5058)
!5087 = !DILocation(line: 103, column: 39, scope: !5046)
!5088 = !DILocation(line: 103, column: 51, scope: !5046)
!5089 = !DILocation(line: 103, column: 21, scope: !5046)
!5090 = !DILocation(line: 103, column: 19, scope: !5046)
!5091 = !DILocation(line: 104, column: 50, scope: !5046)
!5092 = !DILocation(line: 104, column: 44, scope: !5046)
!5093 = !DILocation(line: 104, column: 30, scope: !5046)
!5094 = !DILocation(line: 104, column: 29, scope: !5046)
!5095 = !DILocation(line: 104, column: 27, scope: !5046)
!5096 = !DILocation(line: 105, column: 9, scope: !5046)
!5097 = !DILocation(line: 94, column: 76, scope: !5041)
!5098 = !DILocation(line: 93, column: 9, scope: !5041)
!5099 = distinct !{!5099, !5044, !5100, !165}
!5100 = !DILocation(line: 105, column: 9, scope: !5036)
!5101 = !DILocation(line: 108, column: 29, scope: !5004)
!5102 = !DILocation(line: 108, column: 19, scope: !5004)
!5103 = !DILocation(line: 108, column: 17, scope: !5004)
!5104 = !DILocation(line: 109, column: 25, scope: !5004)
!5105 = !DILocation(line: 109, column: 34, scope: !5004)
!5106 = !DILocation(line: 109, column: 46, scope: !5004)
!5107 = !DILocation(line: 109, column: 55, scope: !5004)
!5108 = !DILocation(line: 109, column: 9, scope: !5004)
!5109 = !DILocalVariable(name: "row", scope: !5110, file: !4937, line: 113, type: !51)
!5110 = distinct !DILexicalBlock(scope: !5004, file: !4937, line: 113, column: 9)
!5111 = !DILocation(line: 113, column: 18, scope: !5110)
!5112 = !DILocation(line: 113, column: 24, scope: !5110)
!5113 = !DILocation(line: 113, column: 14, scope: !5110)
!5114 = !DILocation(line: 113, column: 47, scope: !5115)
!5115 = distinct !DILexicalBlock(scope: !5110, file: !4937, line: 113, column: 9)
!5116 = !DILocation(line: 113, column: 54, scope: !5115)
!5117 = !DILocation(line: 113, column: 51, scope: !5115)
!5118 = !DILocation(line: 113, column: 9, scope: !5110)
!5119 = !DILocalVariable(name: "do_copy", scope: !5120, file: !4937, line: 114, type: !46)
!5120 = distinct !DILexicalBlock(scope: !5115, file: !4937, line: 113, column: 84)
!5121 = !DILocation(line: 114, column: 22, scope: !5120)
!5122 = !DILocation(line: 114, column: 47, scope: !5120)
!5123 = !DILocation(line: 114, column: 52, scope: !5120)
!5124 = !DILocation(line: 114, column: 33, scope: !5120)
!5125 = !DILocation(line: 114, column: 32, scope: !5120)
!5126 = !DILocation(line: 114, column: 66, scope: !5120)
!5127 = !DILocation(line: 114, column: 65, scope: !5120)
!5128 = !DILocation(line: 114, column: 63, scope: !5120)
!5129 = !DILocalVariable(name: "do_not_copy", scope: !5120, file: !4937, line: 115, type: !46)
!5130 = !DILocation(line: 115, column: 22, scope: !5120)
!5131 = !DILocation(line: 115, column: 37, scope: !5120)
!5132 = !DILocation(line: 115, column: 36, scope: !5120)
!5133 = !DILocalVariable(name: "col", scope: !5134, file: !4937, line: 116, type: !51)
!5134 = distinct !DILexicalBlock(scope: !5120, file: !4937, line: 116, column: 13)
!5135 = !DILocation(line: 116, column: 22, scope: !5134)
!5136 = !DILocation(line: 116, column: 18, scope: !5134)
!5137 = !DILocation(line: 116, column: 31, scope: !5138)
!5138 = distinct !DILexicalBlock(scope: !5134, file: !4937, line: 116, column: 13)
!5139 = !DILocation(line: 116, column: 37, scope: !5138)
!5140 = !DILocation(line: 116, column: 35, scope: !5138)
!5141 = !DILocation(line: 116, column: 13, scope: !5134)
!5142 = !DILocation(line: 118, column: 22, scope: !5143)
!5143 = distinct !DILexicalBlock(scope: !5138, file: !4937, line: 116, column: 53)
!5144 = !DILocation(line: 118, column: 45, scope: !5143)
!5145 = !DILocation(line: 118, column: 51, scope: !5143)
!5146 = !DILocation(line: 118, column: 49, scope: !5143)
!5147 = !DILocation(line: 118, column: 61, scope: !5143)
!5148 = !DILocation(line: 118, column: 59, scope: !5143)
!5149 = !DILocation(line: 118, column: 36, scope: !5143)
!5150 = !DILocation(line: 118, column: 34, scope: !5143)
!5151 = !DILocation(line: 119, column: 22, scope: !5143)
!5152 = !DILocation(line: 119, column: 44, scope: !5143)
!5153 = !DILocation(line: 119, column: 32, scope: !5143)
!5154 = !DILocation(line: 119, column: 30, scope: !5143)
!5155 = !DILocation(line: 118, column: 67, scope: !5143)
!5156 = !DILocation(line: 117, column: 26, scope: !5143)
!5157 = !DILocation(line: 117, column: 32, scope: !5143)
!5158 = !DILocation(line: 117, column: 30, scope: !5143)
!5159 = !DILocation(line: 117, column: 42, scope: !5143)
!5160 = !DILocation(line: 117, column: 40, scope: !5143)
!5161 = !DILocation(line: 117, column: 17, scope: !5143)
!5162 = !DILocation(line: 117, column: 47, scope: !5143)
!5163 = !DILocation(line: 120, column: 13, scope: !5143)
!5164 = !DILocation(line: 116, column: 49, scope: !5138)
!5165 = !DILocation(line: 116, column: 13, scope: !5138)
!5166 = distinct !{!5166, !5141, !5167, !165}
!5167 = !DILocation(line: 120, column: 13, scope: !5134)
!5168 = !DILocation(line: 121, column: 9, scope: !5120)
!5169 = !DILocation(line: 113, column: 80, scope: !5115)
!5170 = !DILocation(line: 113, column: 9, scope: !5115)
!5171 = distinct !{!5171, !5118, !5172, !165}
!5172 = !DILocation(line: 121, column: 9, scope: !5110)
!5173 = !DILocalVariable(name: "row", scope: !5174, file: !4937, line: 124, type: !51)
!5174 = distinct !DILexicalBlock(scope: !5004, file: !4937, line: 124, column: 9)
!5175 = !DILocation(line: 124, column: 18, scope: !5174)
!5176 = !DILocation(line: 124, column: 24, scope: !5174)
!5177 = !DILocation(line: 124, column: 14, scope: !5174)
!5178 = !DILocation(line: 124, column: 47, scope: !5179)
!5179 = distinct !DILexicalBlock(scope: !5174, file: !4937, line: 124, column: 9)
!5180 = !DILocation(line: 124, column: 53, scope: !5179)
!5181 = !DILocation(line: 124, column: 51, scope: !5179)
!5182 = !DILocation(line: 124, column: 9, scope: !5174)
!5183 = !DILocalVariable(name: "below_pivot", scope: !5184, file: !4937, line: 125, type: !56)
!5184 = distinct !DILexicalBlock(scope: !5179, file: !4937, line: 124, column: 67)
!5185 = !DILocation(line: 125, column: 27, scope: !5184)
!5186 = !DILocation(line: 125, column: 42, scope: !5184)
!5187 = !DILocation(line: 125, column: 48, scope: !5184)
!5188 = !DILocation(line: 125, column: 46, scope: !5184)
!5189 = !DILocation(line: 125, column: 41, scope: !5184)
!5190 = !DILocalVariable(name: "elt_to_elim", scope: !5184, file: !4937, line: 126, type: !56)
!5191 = !DILocation(line: 126, column: 27, scope: !5184)
!5192 = !DILocation(line: 126, column: 59, scope: !5184)
!5193 = !DILocation(line: 126, column: 70, scope: !5184)
!5194 = !DILocation(line: 126, column: 76, scope: !5184)
!5195 = !DILocation(line: 126, column: 74, scope: !5184)
!5196 = !DILocation(line: 126, column: 68, scope: !5184)
!5197 = !DILocation(line: 126, column: 85, scope: !5184)
!5198 = !DILocation(line: 126, column: 41, scope: !5184)
!5199 = !DILocation(line: 128, column: 29, scope: !5184)
!5200 = !DILocation(line: 128, column: 38, scope: !5184)
!5201 = !DILocation(line: 128, column: 51, scope: !5184)
!5202 = !DILocation(line: 128, column: 65, scope: !5184)
!5203 = !DILocation(line: 128, column: 63, scope: !5184)
!5204 = !DILocation(line: 129, column: 37, scope: !5184)
!5205 = !DILocation(line: 129, column: 48, scope: !5184)
!5206 = !DILocation(line: 129, column: 54, scope: !5184)
!5207 = !DILocation(line: 129, column: 52, scope: !5184)
!5208 = !DILocation(line: 129, column: 46, scope: !5184)
!5209 = !DILocation(line: 128, column: 13, scope: !5184)
!5210 = !DILocation(line: 130, column: 9, scope: !5184)
!5211 = !DILocation(line: 124, column: 63, scope: !5179)
!5212 = !DILocation(line: 124, column: 9, scope: !5179)
!5213 = distinct !{!5213, !5182, !5214, !165}
!5214 = !DILocation(line: 130, column: 9, scope: !5174)
!5215 = !DILocation(line: 132, column: 35, scope: !5004)
!5216 = !DILocation(line: 132, column: 34, scope: !5004)
!5217 = !DILocation(line: 132, column: 23, scope: !5004)
!5218 = !DILocation(line: 132, column: 19, scope: !5004)
!5219 = !DILocation(line: 133, column: 5, scope: !5004)
!5220 = !DILocation(line: 77, column: 57, scope: !4999)
!5221 = !DILocation(line: 77, column: 5, scope: !4999)
!5222 = distinct !{!5222, !5002, !5223, !165}
!5223 = !DILocation(line: 133, column: 5, scope: !4995)
!5224 = !DILocalVariable(name: "temp", scope: !4936, file: !4937, line: 135, type: !5225)
!5225 = !DICompositeType(tag: DW_TAG_array_type, baseType: !56, size: 1760, elements: !5226)
!5226 = !{!5227}
!5227 = !DISubrange(count: 220)
!5228 = !DILocation(line: 135, column: 19, scope: !4936)
!5229 = !DILocalVariable(name: "i", scope: !5230, file: !4937, line: 138, type: !51)
!5230 = distinct !DILexicalBlock(scope: !4936, file: !4937, line: 138, column: 5)
!5231 = !DILocation(line: 138, column: 14, scope: !5230)
!5232 = !DILocation(line: 138, column: 10, scope: !5230)
!5233 = !DILocation(line: 138, column: 21, scope: !5234)
!5234 = distinct !DILexicalBlock(scope: !5230, file: !4937, line: 138, column: 5)
!5235 = !DILocation(line: 138, column: 25, scope: !5234)
!5236 = !DILocation(line: 138, column: 23, scope: !5234)
!5237 = !DILocation(line: 138, column: 5, scope: !5230)
!5238 = !DILocation(line: 139, column: 25, scope: !5239)
!5239 = distinct !DILexicalBlock(scope: !5234, file: !4937, line: 138, column: 37)
!5240 = !DILocation(line: 139, column: 34, scope: !5239)
!5241 = !DILocation(line: 139, column: 45, scope: !5239)
!5242 = !DILocation(line: 139, column: 49, scope: !5239)
!5243 = !DILocation(line: 139, column: 47, scope: !5239)
!5244 = !DILocation(line: 139, column: 43, scope: !5239)
!5245 = !DILocation(line: 139, column: 58, scope: !5239)
!5246 = !DILocation(line: 139, column: 9, scope: !5239)
!5247 = !DILocalVariable(name: "j", scope: !5248, file: !4937, line: 140, type: !51)
!5248 = distinct !DILexicalBlock(scope: !5239, file: !4937, line: 140, column: 9)
!5249 = !DILocation(line: 140, column: 18, scope: !5248)
!5250 = !DILocation(line: 140, column: 14, scope: !5248)
!5251 = !DILocation(line: 140, column: 25, scope: !5252)
!5252 = distinct !DILexicalBlock(scope: !5248, file: !4937, line: 140, column: 9)
!5253 = !DILocation(line: 140, column: 29, scope: !5252)
!5254 = !DILocation(line: 140, column: 27, scope: !5252)
!5255 = !DILocation(line: 140, column: 9, scope: !5248)
!5256 = !DILocation(line: 141, column: 37, scope: !5257)
!5257 = distinct !DILexicalBlock(scope: !5252, file: !4937, line: 140, column: 41)
!5258 = !DILocation(line: 141, column: 32, scope: !5257)
!5259 = !DILocation(line: 141, column: 13, scope: !5257)
!5260 = !DILocation(line: 141, column: 15, scope: !5257)
!5261 = !DILocation(line: 141, column: 19, scope: !5257)
!5262 = !DILocation(line: 141, column: 17, scope: !5257)
!5263 = !DILocation(line: 141, column: 27, scope: !5257)
!5264 = !DILocation(line: 141, column: 25, scope: !5257)
!5265 = !DILocation(line: 141, column: 30, scope: !5257)
!5266 = !DILocation(line: 142, column: 9, scope: !5257)
!5267 = !DILocation(line: 140, column: 37, scope: !5252)
!5268 = !DILocation(line: 140, column: 9, scope: !5252)
!5269 = distinct !{!5269, !5255, !5270, !165}
!5270 = !DILocation(line: 142, column: 9, scope: !5248)
!5271 = !DILocation(line: 143, column: 5, scope: !5239)
!5272 = !DILocation(line: 138, column: 33, scope: !5234)
!5273 = !DILocation(line: 138, column: 5, scope: !5234)
!5274 = distinct !{!5274, !5237, !5275, !165}
!5275 = !DILocation(line: 143, column: 5, scope: !5230)
!5276 = !DILocation(line: 145, column: 23, scope: !4936)
!5277 = !DILocation(line: 145, column: 5, scope: !4936)
!5278 = !DILocation(line: 146, column: 23, scope: !4936)
!5279 = !DILocation(line: 146, column: 5, scope: !4936)
!5280 = !DILocation(line: 147, column: 23, scope: !4936)
!5281 = !DILocation(line: 147, column: 5, scope: !4936)
!5282 = !DILocation(line: 148, column: 23, scope: !4936)
!5283 = !DILocation(line: 148, column: 5, scope: !4936)
!5284 = !DILocation(line: 149, column: 1, scope: !4936)
!5285 = distinct !DISubprogram(name: "ct_compare_8", scope: !5286, file: !5286, line: 51, type: !2774, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !91)
!5286 = !DIFile(filename: "../../../src/arithmetic.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!5287 = !DILocalVariable(name: "a", arg: 1, scope: !5285, file: !5286, line: 51, type: !56)
!5288 = !DILocation(line: 51, column: 56, scope: !5285)
!5289 = !DILocalVariable(name: "b", arg: 2, scope: !5285, file: !5286, line: 51, type: !56)
!5290 = !DILocation(line: 51, column: 73, scope: !5285)
!5291 = !DILocation(line: 52, column: 34, scope: !5285)
!5292 = !DILocation(line: 52, column: 38, scope: !5285)
!5293 = !DILocation(line: 52, column: 36, scope: !5285)
!5294 = !DILocation(line: 52, column: 23, scope: !5285)
!5295 = !DILocation(line: 52, column: 42, scope: !5285)
!5296 = !DILocation(line: 52, column: 13, scope: !5285)
!5297 = !DILocation(line: 52, column: 71, scope: !5285)
!5298 = !DILocation(line: 52, column: 69, scope: !5285)
!5299 = !DILocation(line: 52, column: 12, scope: !5285)
!5300 = !DILocation(line: 52, column: 5, scope: !5285)
!5301 = distinct !DISubprogram(name: "mul_fx8", scope: !838, file: !838, line: 27, type: !5302, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !91)
!5302 = !DISubroutineType(types: !5303)
!5303 = !{!46, !56, !46}
!5304 = !DILocalVariable(name: "a", arg: 1, scope: !5301, file: !838, line: 27, type: !56)
!5305 = !DILocation(line: 27, column: 46, scope: !5301)
!5306 = !DILocalVariable(name: "b", arg: 2, scope: !5301, file: !838, line: 27, type: !46)
!5307 = !DILocation(line: 27, column: 58, scope: !5301)
!5308 = !DILocalVariable(name: "p", scope: !5301, file: !838, line: 29, type: !46)
!5309 = !DILocation(line: 29, column: 14, scope: !5301)
!5310 = !DILocation(line: 30, column: 11, scope: !5301)
!5311 = !DILocation(line: 30, column: 13, scope: !5301)
!5312 = !DILocation(line: 30, column: 10, scope: !5301)
!5313 = !DILocation(line: 30, column: 18, scope: !5301)
!5314 = !DILocation(line: 30, column: 17, scope: !5301)
!5315 = !DILocation(line: 30, column: 8, scope: !5301)
!5316 = !DILocation(line: 31, column: 11, scope: !5301)
!5317 = !DILocation(line: 31, column: 13, scope: !5301)
!5318 = !DILocation(line: 31, column: 10, scope: !5301)
!5319 = !DILocation(line: 31, column: 18, scope: !5301)
!5320 = !DILocation(line: 31, column: 17, scope: !5301)
!5321 = !DILocation(line: 31, column: 7, scope: !5301)
!5322 = !DILocation(line: 32, column: 11, scope: !5301)
!5323 = !DILocation(line: 32, column: 13, scope: !5301)
!5324 = !DILocation(line: 32, column: 10, scope: !5301)
!5325 = !DILocation(line: 32, column: 18, scope: !5301)
!5326 = !DILocation(line: 32, column: 17, scope: !5301)
!5327 = !DILocation(line: 32, column: 7, scope: !5301)
!5328 = !DILocation(line: 33, column: 11, scope: !5301)
!5329 = !DILocation(line: 33, column: 13, scope: !5301)
!5330 = !DILocation(line: 33, column: 10, scope: !5301)
!5331 = !DILocation(line: 33, column: 18, scope: !5301)
!5332 = !DILocation(line: 33, column: 17, scope: !5301)
!5333 = !DILocation(line: 33, column: 7, scope: !5301)
!5334 = !DILocalVariable(name: "top_p", scope: !5301, file: !838, line: 36, type: !46)
!5335 = !DILocation(line: 36, column: 14, scope: !5301)
!5336 = !DILocation(line: 36, column: 22, scope: !5301)
!5337 = !DILocation(line: 36, column: 24, scope: !5301)
!5338 = !DILocalVariable(name: "out", scope: !5301, file: !838, line: 37, type: !46)
!5339 = !DILocation(line: 37, column: 14, scope: !5301)
!5340 = !DILocation(line: 37, column: 21, scope: !5301)
!5341 = !DILocation(line: 37, column: 26, scope: !5301)
!5342 = !DILocation(line: 37, column: 32, scope: !5301)
!5343 = !DILocation(line: 37, column: 23, scope: !5301)
!5344 = !DILocation(line: 37, column: 41, scope: !5301)
!5345 = !DILocation(line: 37, column: 47, scope: !5301)
!5346 = !DILocation(line: 37, column: 38, scope: !5301)
!5347 = !DILocation(line: 37, column: 54, scope: !5301)
!5348 = !DILocation(line: 38, column: 12, scope: !5301)
!5349 = !DILocation(line: 38, column: 5, scope: !5301)
!5350 = distinct !DISubprogram(name: "ef_pack_m_vec", scope: !4937, file: !4937, line: 24, type: !5351, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !91)
!5351 = !DISubroutineType(types: !5352)
!5352 = !{null, !60, !81, !51}
!5353 = !DILocalVariable(name: "in", arg: 1, scope: !5350, file: !4937, line: 24, type: !60)
!5354 = !DILocation(line: 24, column: 36, scope: !5350)
!5355 = !DILocalVariable(name: "out", arg: 2, scope: !5350, file: !4937, line: 24, type: !81)
!5356 = !DILocation(line: 24, column: 50, scope: !5350)
!5357 = !DILocalVariable(name: "ncols", arg: 3, scope: !5350, file: !4937, line: 24, type: !51)
!5358 = !DILocation(line: 24, column: 59, scope: !5350)
!5359 = !DILocalVariable(name: "i", scope: !5350, file: !4937, line: 25, type: !51)
!5360 = !DILocation(line: 25, column: 9, scope: !5350)
!5361 = !DILocalVariable(name: "out8", scope: !5350, file: !4937, line: 26, type: !55)
!5362 = !DILocation(line: 26, column: 20, scope: !5350)
!5363 = !DILocation(line: 26, column: 44, scope: !5350)
!5364 = !DILocation(line: 27, column: 11, scope: !5365)
!5365 = distinct !DILexicalBlock(scope: !5350, file: !4937, line: 27, column: 5)
!5366 = !DILocation(line: 27, column: 9, scope: !5365)
!5367 = !DILocation(line: 27, column: 16, scope: !5368)
!5368 = distinct !DILexicalBlock(scope: !5365, file: !4937, line: 27, column: 5)
!5369 = !DILocation(line: 27, column: 17, scope: !5368)
!5370 = !DILocation(line: 27, column: 22, scope: !5368)
!5371 = !DILocation(line: 27, column: 20, scope: !5368)
!5372 = !DILocation(line: 27, column: 5, scope: !5365)
!5373 = !DILocation(line: 31, column: 23, scope: !5374)
!5374 = distinct !DILexicalBlock(scope: !5368, file: !4937, line: 27, column: 36)
!5375 = !DILocation(line: 31, column: 26, scope: !5374)
!5376 = !DILocation(line: 31, column: 27, scope: !5374)
!5377 = !DILocation(line: 31, column: 31, scope: !5374)
!5378 = !DILocation(line: 31, column: 40, scope: !5374)
!5379 = !DILocation(line: 31, column: 43, scope: !5374)
!5380 = !DILocation(line: 31, column: 44, scope: !5374)
!5381 = !DILocation(line: 31, column: 48, scope: !5374)
!5382 = !DILocation(line: 31, column: 37, scope: !5374)
!5383 = !DILocation(line: 31, column: 22, scope: !5374)
!5384 = !DILocation(line: 31, column: 9, scope: !5374)
!5385 = !DILocation(line: 31, column: 14, scope: !5374)
!5386 = !DILocation(line: 31, column: 15, scope: !5374)
!5387 = !DILocation(line: 31, column: 20, scope: !5374)
!5388 = !DILocation(line: 33, column: 5, scope: !5374)
!5389 = !DILocation(line: 27, column: 31, scope: !5368)
!5390 = !DILocation(line: 27, column: 5, scope: !5368)
!5391 = distinct !{!5391, !5372, !5392, !165}
!5392 = !DILocation(line: 33, column: 5, scope: !5365)
!5393 = !DILocation(line: 34, column: 9, scope: !5394)
!5394 = distinct !DILexicalBlock(scope: !5350, file: !4937, line: 34, column: 9)
!5395 = !DILocation(line: 34, column: 15, scope: !5394)
!5396 = !DILocation(line: 34, column: 19, scope: !5394)
!5397 = !DILocation(line: 38, column: 23, scope: !5398)
!5398 = distinct !DILexicalBlock(scope: !5394, file: !4937, line: 34, column: 24)
!5399 = !DILocation(line: 38, column: 26, scope: !5398)
!5400 = !DILocation(line: 38, column: 27, scope: !5398)
!5401 = !DILocation(line: 38, column: 31, scope: !5398)
!5402 = !DILocation(line: 38, column: 22, scope: !5398)
!5403 = !DILocation(line: 38, column: 9, scope: !5398)
!5404 = !DILocation(line: 38, column: 14, scope: !5398)
!5405 = !DILocation(line: 38, column: 15, scope: !5398)
!5406 = !DILocation(line: 38, column: 20, scope: !5398)
!5407 = !DILocation(line: 40, column: 5, scope: !5398)
!5408 = !DILocation(line: 41, column: 1, scope: !5350)
!5409 = distinct !DISubprogram(name: "ct_compare_64", scope: !5286, file: !5286, line: 46, type: !5410, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !91)
!5410 = !DISubroutineType(types: !5411)
!5411 = !{!46, !51, !51}
!5412 = !DILocalVariable(name: "a", arg: 1, scope: !5409, file: !5286, line: 46, type: !51)
!5413 = !DILocation(line: 46, column: 42, scope: !5409)
!5414 = !DILocalVariable(name: "b", arg: 2, scope: !5409, file: !5286, line: 46, type: !51)
!5415 = !DILocation(line: 46, column: 49, scope: !5409)
!5416 = !DILocation(line: 47, column: 36, scope: !5409)
!5417 = !DILocation(line: 47, column: 40, scope: !5409)
!5418 = !DILocation(line: 47, column: 38, scope: !5409)
!5419 = !DILocation(line: 47, column: 26, scope: !5409)
!5420 = !DILocation(line: 47, column: 25, scope: !5409)
!5421 = !DILocation(line: 47, column: 44, scope: !5409)
!5422 = !DILocation(line: 47, column: 73, scope: !5409)
!5423 = !DILocation(line: 47, column: 71, scope: !5409)
!5424 = !DILocation(line: 47, column: 5, scope: !5409)
!5425 = distinct !DISubprogram(name: "ct_64_is_greater_than", scope: !5286, file: !5286, line: 35, type: !5410, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !91)
!5426 = !DILocalVariable(name: "a", arg: 1, scope: !5425, file: !5286, line: 35, type: !51)
!5427 = !DILocation(line: 35, column: 50, scope: !5425)
!5428 = !DILocalVariable(name: "b", arg: 2, scope: !5425, file: !5286, line: 35, type: !51)
!5429 = !DILocation(line: 35, column: 57, scope: !5425)
!5430 = !DILocalVariable(name: "diff", scope: !5425, file: !5286, line: 36, type: !52)
!5431 = !DILocation(line: 36, column: 13, scope: !5425)
!5432 = !DILocation(line: 36, column: 31, scope: !5425)
!5433 = !DILocation(line: 36, column: 21, scope: !5425)
!5434 = !DILocation(line: 36, column: 47, scope: !5425)
!5435 = !DILocation(line: 36, column: 37, scope: !5425)
!5436 = !DILocation(line: 36, column: 34, scope: !5425)
!5437 = !DILocation(line: 37, column: 25, scope: !5425)
!5438 = !DILocation(line: 37, column: 30, scope: !5425)
!5439 = !DILocation(line: 37, column: 59, scope: !5425)
!5440 = !DILocation(line: 37, column: 57, scope: !5425)
!5441 = !DILocation(line: 37, column: 5, scope: !5425)
!5442 = distinct !DISubprogram(name: "m_extract_element", scope: !4937, file: !4937, line: 16, type: !5443, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !91)
!5443 = !DISubroutineType(types: !5444)
!5444 = !{!56, !609, !51}
!5445 = !DILocalVariable(name: "in", arg: 1, scope: !5442, file: !4937, line: 16, type: !609)
!5446 = !DILocation(line: 16, column: 35, scope: !5442)
!5447 = !DILocalVariable(name: "index", arg: 2, scope: !5442, file: !4937, line: 16, type: !51)
!5448 = !DILocation(line: 16, column: 43, scope: !5442)
!5449 = !DILocalVariable(name: "leg", scope: !5442, file: !4937, line: 17, type: !426)
!5450 = !DILocation(line: 17, column: 15, scope: !5442)
!5451 = !DILocation(line: 17, column: 21, scope: !5442)
!5452 = !DILocation(line: 17, column: 27, scope: !5442)
!5453 = !DILocalVariable(name: "offset", scope: !5442, file: !4937, line: 18, type: !426)
!5454 = !DILocation(line: 18, column: 15, scope: !5442)
!5455 = !DILocation(line: 18, column: 24, scope: !5442)
!5456 = !DILocation(line: 18, column: 30, scope: !5442)
!5457 = !DILocation(line: 20, column: 13, scope: !5442)
!5458 = !DILocation(line: 20, column: 16, scope: !5442)
!5459 = !DILocation(line: 20, column: 25, scope: !5442)
!5460 = !DILocation(line: 20, column: 31, scope: !5442)
!5461 = !DILocation(line: 20, column: 21, scope: !5442)
!5462 = !DILocation(line: 20, column: 36, scope: !5442)
!5463 = !DILocation(line: 20, column: 12, scope: !5442)
!5464 = !DILocation(line: 20, column: 5, scope: !5442)
!5465 = distinct !DISubprogram(name: "inverse_f", scope: !838, file: !838, line: 56, type: !5466, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !91)
!5466 = !DISubroutineType(types: !5467)
!5467 = !{!56, !56}
!5468 = !DILocalVariable(name: "a", arg: 1, scope: !5465, file: !838, line: 56, type: !56)
!5469 = !DILocation(line: 56, column: 53, scope: !5465)
!5470 = !DILocalVariable(name: "a2", scope: !5465, file: !838, line: 60, type: !56)
!5471 = !DILocation(line: 60, column: 19, scope: !5465)
!5472 = !DILocation(line: 60, column: 30, scope: !5465)
!5473 = !DILocation(line: 60, column: 33, scope: !5465)
!5474 = !DILocation(line: 60, column: 24, scope: !5465)
!5475 = !DILocalVariable(name: "a4", scope: !5465, file: !838, line: 61, type: !56)
!5476 = !DILocation(line: 61, column: 19, scope: !5465)
!5477 = !DILocation(line: 61, column: 30, scope: !5465)
!5478 = !DILocation(line: 61, column: 34, scope: !5465)
!5479 = !DILocation(line: 61, column: 24, scope: !5465)
!5480 = !DILocalVariable(name: "a8", scope: !5465, file: !838, line: 62, type: !56)
!5481 = !DILocation(line: 62, column: 19, scope: !5465)
!5482 = !DILocation(line: 62, column: 30, scope: !5465)
!5483 = !DILocation(line: 62, column: 34, scope: !5465)
!5484 = !DILocation(line: 62, column: 24, scope: !5465)
!5485 = !DILocalVariable(name: "a6", scope: !5465, file: !838, line: 63, type: !56)
!5486 = !DILocation(line: 63, column: 19, scope: !5465)
!5487 = !DILocation(line: 63, column: 30, scope: !5465)
!5488 = !DILocation(line: 63, column: 34, scope: !5465)
!5489 = !DILocation(line: 63, column: 24, scope: !5465)
!5490 = !DILocalVariable(name: "a14", scope: !5465, file: !838, line: 64, type: !56)
!5491 = !DILocation(line: 64, column: 19, scope: !5465)
!5492 = !DILocation(line: 64, column: 31, scope: !5465)
!5493 = !DILocation(line: 64, column: 35, scope: !5465)
!5494 = !DILocation(line: 64, column: 25, scope: !5465)
!5495 = !DILocation(line: 66, column: 12, scope: !5465)
!5496 = !DILocation(line: 66, column: 5, scope: !5465)
!5497 = distinct !DISubprogram(name: "vec_mul_add_u64", scope: !5286, file: !5286, line: 94, type: !5498, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !91)
!5498 = !DISubroutineType(types: !5499)
!5499 = !{null, !426, !609, !56, !81}
!5500 = !DILocalVariable(name: "legs", arg: 1, scope: !5497, file: !5286, line: 94, type: !426)
!5501 = !DILocation(line: 94, column: 39, scope: !5497)
!5502 = !DILocalVariable(name: "in", arg: 2, scope: !5497, file: !5286, line: 94, type: !609)
!5503 = !DILocation(line: 94, column: 61, scope: !5497)
!5504 = !DILocalVariable(name: "a", arg: 3, scope: !5497, file: !5286, line: 94, type: !56)
!5505 = !DILocation(line: 94, column: 79, scope: !5497)
!5506 = !DILocalVariable(name: "acc", arg: 4, scope: !5497, file: !5286, line: 94, type: !81)
!5507 = !DILocation(line: 94, column: 92, scope: !5497)
!5508 = !DILocalVariable(name: "tab", scope: !5497, file: !5286, line: 95, type: !57)
!5509 = !DILocation(line: 95, column: 14, scope: !5497)
!5510 = !DILocation(line: 95, column: 30, scope: !5497)
!5511 = !DILocation(line: 95, column: 20, scope: !5497)
!5512 = !DILocalVariable(name: "lsb_ask", scope: !5497, file: !5286, line: 97, type: !46)
!5513 = !DILocation(line: 97, column: 14, scope: !5497)
!5514 = !DILocalVariable(name: "i", scope: !5515, file: !5286, line: 99, type: !51)
!5515 = distinct !DILexicalBlock(scope: !5497, file: !5286, line: 99, column: 5)
!5516 = !DILocation(line: 99, column: 13, scope: !5515)
!5517 = !DILocation(line: 99, column: 9, scope: !5515)
!5518 = !DILocation(line: 99, column: 18, scope: !5519)
!5519 = distinct !DILexicalBlock(scope: !5515, file: !5286, line: 99, column: 5)
!5520 = !DILocation(line: 99, column: 22, scope: !5519)
!5521 = !DILocation(line: 99, column: 20, scope: !5519)
!5522 = !DILocation(line: 99, column: 5, scope: !5515)
!5523 = !DILocation(line: 100, column: 21, scope: !5524)
!5524 = distinct !DILexicalBlock(scope: !5519, file: !5286, line: 99, column: 32)
!5525 = !DILocation(line: 100, column: 24, scope: !5524)
!5526 = !DILocation(line: 100, column: 35, scope: !5524)
!5527 = !DILocation(line: 100, column: 33, scope: !5524)
!5528 = !DILocation(line: 100, column: 47, scope: !5524)
!5529 = !DILocation(line: 100, column: 51, scope: !5524)
!5530 = !DILocation(line: 100, column: 46, scope: !5524)
!5531 = !DILocation(line: 100, column: 44, scope: !5524)
!5532 = !DILocation(line: 101, column: 21, scope: !5524)
!5533 = !DILocation(line: 101, column: 24, scope: !5524)
!5534 = !DILocation(line: 101, column: 27, scope: !5524)
!5535 = !DILocation(line: 101, column: 35, scope: !5524)
!5536 = !DILocation(line: 101, column: 33, scope: !5524)
!5537 = !DILocation(line: 101, column: 48, scope: !5524)
!5538 = !DILocation(line: 101, column: 52, scope: !5524)
!5539 = !DILocation(line: 101, column: 59, scope: !5524)
!5540 = !DILocation(line: 101, column: 46, scope: !5524)
!5541 = !DILocation(line: 101, column: 44, scope: !5524)
!5542 = !DILocation(line: 101, column: 17, scope: !5524)
!5543 = !DILocation(line: 102, column: 21, scope: !5524)
!5544 = !DILocation(line: 102, column: 24, scope: !5524)
!5545 = !DILocation(line: 102, column: 27, scope: !5524)
!5546 = !DILocation(line: 102, column: 35, scope: !5524)
!5547 = !DILocation(line: 102, column: 33, scope: !5524)
!5548 = !DILocation(line: 102, column: 48, scope: !5524)
!5549 = !DILocation(line: 102, column: 52, scope: !5524)
!5550 = !DILocation(line: 102, column: 59, scope: !5524)
!5551 = !DILocation(line: 102, column: 46, scope: !5524)
!5552 = !DILocation(line: 102, column: 44, scope: !5524)
!5553 = !DILocation(line: 102, column: 17, scope: !5524)
!5554 = !DILocation(line: 103, column: 21, scope: !5524)
!5555 = !DILocation(line: 103, column: 24, scope: !5524)
!5556 = !DILocation(line: 103, column: 27, scope: !5524)
!5557 = !DILocation(line: 103, column: 35, scope: !5524)
!5558 = !DILocation(line: 103, column: 33, scope: !5524)
!5559 = !DILocation(line: 103, column: 48, scope: !5524)
!5560 = !DILocation(line: 103, column: 52, scope: !5524)
!5561 = !DILocation(line: 103, column: 59, scope: !5524)
!5562 = !DILocation(line: 103, column: 46, scope: !5524)
!5563 = !DILocation(line: 103, column: 44, scope: !5524)
!5564 = !DILocation(line: 103, column: 17, scope: !5524)
!5565 = !DILocation(line: 100, column: 9, scope: !5524)
!5566 = !DILocation(line: 100, column: 13, scope: !5524)
!5567 = !DILocation(line: 100, column: 16, scope: !5524)
!5568 = !DILocation(line: 104, column: 5, scope: !5524)
!5569 = !DILocation(line: 99, column: 29, scope: !5519)
!5570 = !DILocation(line: 99, column: 5, scope: !5519)
!5571 = distinct !{!5571, !5522, !5572, !165}
!5572 = !DILocation(line: 104, column: 5, scope: !5515)
!5573 = !DILocation(line: 105, column: 1, scope: !5497)
!5574 = distinct !DISubprogram(name: "ef_unpack_m_vec", scope: !4937, file: !4937, line: 44, type: !5575, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !91)
!5575 = !DISubroutineType(types: !5576)
!5576 = !{null, !51, !609, !55}
!5577 = !DILocalVariable(name: "legs", arg: 1, scope: !5574, file: !4937, line: 44, type: !51)
!5578 = !DILocation(line: 44, column: 21, scope: !5574)
!5579 = !DILocalVariable(name: "in", arg: 2, scope: !5574, file: !4937, line: 44, type: !609)
!5580 = !DILocation(line: 44, column: 43, scope: !5574)
!5581 = !DILocalVariable(name: "out", arg: 3, scope: !5574, file: !4937, line: 44, type: !55)
!5582 = !DILocation(line: 44, column: 62, scope: !5574)
!5583 = !DILocalVariable(name: "in8", scope: !5574, file: !4937, line: 45, type: !60)
!5584 = !DILocation(line: 45, column: 26, scope: !5574)
!5585 = !DILocation(line: 45, column: 55, scope: !5574)
!5586 = !DILocalVariable(name: "i", scope: !5587, file: !4937, line: 46, type: !51)
!5587 = distinct !DILexicalBlock(scope: !5574, file: !4937, line: 46, column: 5)
!5588 = !DILocation(line: 46, column: 13, scope: !5587)
!5589 = !DILocation(line: 46, column: 9, scope: !5587)
!5590 = !DILocation(line: 46, column: 20, scope: !5591)
!5591 = distinct !DILexicalBlock(scope: !5587, file: !4937, line: 46, column: 5)
!5592 = !DILocation(line: 46, column: 24, scope: !5591)
!5593 = !DILocation(line: 46, column: 29, scope: !5591)
!5594 = !DILocation(line: 46, column: 22, scope: !5591)
!5595 = !DILocation(line: 46, column: 5, scope: !5587)
!5596 = !DILocation(line: 51, column: 21, scope: !5597)
!5597 = distinct !DILexicalBlock(scope: !5591, file: !4937, line: 46, column: 42)
!5598 = !DILocation(line: 51, column: 25, scope: !5597)
!5599 = !DILocation(line: 51, column: 26, scope: !5597)
!5600 = !DILocation(line: 51, column: 20, scope: !5597)
!5601 = !DILocation(line: 51, column: 31, scope: !5597)
!5602 = !DILocation(line: 51, column: 9, scope: !5597)
!5603 = !DILocation(line: 51, column: 13, scope: !5597)
!5604 = !DILocation(line: 51, column: 18, scope: !5597)
!5605 = !DILocation(line: 52, column: 21, scope: !5597)
!5606 = !DILocation(line: 52, column: 25, scope: !5597)
!5607 = !DILocation(line: 52, column: 26, scope: !5597)
!5608 = !DILocation(line: 52, column: 30, scope: !5597)
!5609 = !DILocation(line: 52, column: 20, scope: !5597)
!5610 = !DILocation(line: 52, column: 9, scope: !5597)
!5611 = !DILocation(line: 52, column: 13, scope: !5597)
!5612 = !DILocation(line: 52, column: 14, scope: !5597)
!5613 = !DILocation(line: 52, column: 18, scope: !5597)
!5614 = !DILocation(line: 54, column: 5, scope: !5597)
!5615 = !DILocation(line: 46, column: 37, scope: !5591)
!5616 = !DILocation(line: 46, column: 5, scope: !5591)
!5617 = distinct !{!5617, !5595, !5618, !165}
!5618 = !DILocation(line: 54, column: 5, scope: !5587)
!5619 = !DILocation(line: 55, column: 1, scope: !5574)
!5620 = distinct !DISubprogram(name: "mul_table", scope: !838, file: !838, line: 128, type: !5621, scopeLine: 128, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !91)
!5621 = !DISubroutineType(types: !5622)
!5622 = !{!57, !201}
!5623 = !DILocalVariable(name: "b", arg: 1, scope: !5620, file: !838, line: 128, type: !201)
!5624 = !DILocation(line: 128, column: 42, scope: !5620)
!5625 = !DILocalVariable(name: "x", scope: !5620, file: !838, line: 129, type: !57)
!5626 = !DILocation(line: 129, column: 14, scope: !5620)
!5627 = !DILocation(line: 129, column: 30, scope: !5620)
!5628 = !DILocation(line: 129, column: 19, scope: !5620)
!5629 = !DILocation(line: 129, column: 33, scope: !5620)
!5630 = !DILocalVariable(name: "high_nibble_mask", scope: !5620, file: !838, line: 131, type: !57)
!5631 = !DILocation(line: 131, column: 14, scope: !5620)
!5632 = !DILocalVariable(name: "high_half", scope: !5620, file: !838, line: 133, type: !57)
!5633 = !DILocation(line: 133, column: 14, scope: !5620)
!5634 = !DILocation(line: 133, column: 26, scope: !5620)
!5635 = !DILocation(line: 133, column: 30, scope: !5620)
!5636 = !DILocation(line: 133, column: 28, scope: !5620)
!5637 = !DILocation(line: 134, column: 13, scope: !5620)
!5638 = !DILocation(line: 134, column: 18, scope: !5620)
!5639 = !DILocation(line: 134, column: 28, scope: !5620)
!5640 = !DILocation(line: 134, column: 15, scope: !5620)
!5641 = !DILocation(line: 134, column: 37, scope: !5620)
!5642 = !DILocation(line: 134, column: 47, scope: !5620)
!5643 = !DILocation(line: 134, column: 34, scope: !5620)
!5644 = !DILocation(line: 134, column: 5, scope: !5620)
!5645 = distinct !DISubprogram(name: "mul_f", scope: !838, file: !838, line: 8, type: !2774, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !91)
!5646 = !DILocalVariable(name: "a", arg: 1, scope: !5645, file: !838, line: 8, type: !56)
!5647 = !DILocation(line: 8, column: 49, scope: !5645)
!5648 = !DILocalVariable(name: "b", arg: 2, scope: !5645, file: !838, line: 8, type: !56)
!5649 = !DILocation(line: 8, column: 66, scope: !5645)
!5650 = !DILocalVariable(name: "p", scope: !5645, file: !838, line: 10, type: !56)
!5651 = !DILocation(line: 10, column: 19, scope: !5645)
!5652 = !DILocation(line: 13, column: 10, scope: !5645)
!5653 = !DILocation(line: 13, column: 7, scope: !5645)
!5654 = !DILocation(line: 16, column: 11, scope: !5645)
!5655 = !DILocation(line: 16, column: 13, scope: !5645)
!5656 = !DILocation(line: 16, column: 18, scope: !5645)
!5657 = !DILocation(line: 16, column: 17, scope: !5645)
!5658 = !DILocation(line: 16, column: 10, scope: !5645)
!5659 = !DILocation(line: 16, column: 8, scope: !5645)
!5660 = !DILocation(line: 17, column: 11, scope: !5645)
!5661 = !DILocation(line: 17, column: 13, scope: !5645)
!5662 = !DILocation(line: 17, column: 18, scope: !5645)
!5663 = !DILocation(line: 17, column: 17, scope: !5645)
!5664 = !DILocation(line: 17, column: 7, scope: !5645)
!5665 = !DILocation(line: 18, column: 11, scope: !5645)
!5666 = !DILocation(line: 18, column: 13, scope: !5645)
!5667 = !DILocation(line: 18, column: 18, scope: !5645)
!5668 = !DILocation(line: 18, column: 17, scope: !5645)
!5669 = !DILocation(line: 18, column: 7, scope: !5645)
!5670 = !DILocation(line: 19, column: 11, scope: !5645)
!5671 = !DILocation(line: 19, column: 13, scope: !5645)
!5672 = !DILocation(line: 19, column: 18, scope: !5645)
!5673 = !DILocation(line: 19, column: 17, scope: !5645)
!5674 = !DILocation(line: 19, column: 7, scope: !5645)
!5675 = !DILocalVariable(name: "top_p", scope: !5645, file: !838, line: 22, type: !56)
!5676 = !DILocation(line: 22, column: 19, scope: !5645)
!5677 = !DILocation(line: 22, column: 27, scope: !5645)
!5678 = !DILocation(line: 22, column: 29, scope: !5645)
!5679 = !DILocalVariable(name: "out", scope: !5645, file: !838, line: 23, type: !56)
!5680 = !DILocation(line: 23, column: 19, scope: !5645)
!5681 = !DILocation(line: 23, column: 26, scope: !5645)
!5682 = !DILocation(line: 23, column: 31, scope: !5645)
!5683 = !DILocation(line: 23, column: 37, scope: !5645)
!5684 = !DILocation(line: 23, column: 28, scope: !5645)
!5685 = !DILocation(line: 23, column: 46, scope: !5645)
!5686 = !DILocation(line: 23, column: 52, scope: !5645)
!5687 = !DILocation(line: 23, column: 43, scope: !5645)
!5688 = !DILocation(line: 23, column: 59, scope: !5645)
!5689 = !DILocation(line: 23, column: 25, scope: !5645)
!5690 = !DILocation(line: 24, column: 12, scope: !5645)
!5691 = !DILocation(line: 24, column: 5, scope: !5645)
!5692 = distinct !DISubprogram(name: "lincomb", scope: !838, file: !838, line: 69, type: !2785, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !91)
!5693 = !DILocalVariable(name: "a", arg: 1, scope: !5692, file: !838, line: 69, type: !60)
!5694 = !DILocation(line: 69, column: 58, scope: !5692)
!5695 = !DILocalVariable(name: "b", arg: 2, scope: !5692, file: !838, line: 70, type: !60)
!5696 = !DILocation(line: 70, column: 58, scope: !5692)
!5697 = !DILocalVariable(name: "n", arg: 3, scope: !5692, file: !838, line: 70, type: !51)
!5698 = !DILocation(line: 70, column: 65, scope: !5692)
!5699 = !DILocalVariable(name: "m", arg: 4, scope: !5692, file: !838, line: 70, type: !51)
!5700 = !DILocation(line: 70, column: 72, scope: !5692)
!5701 = !DILocalVariable(name: "ret", scope: !5692, file: !838, line: 71, type: !56)
!5702 = !DILocation(line: 71, column: 19, scope: !5692)
!5703 = !DILocalVariable(name: "i", scope: !5704, file: !838, line: 72, type: !51)
!5704 = distinct !DILexicalBlock(scope: !5692, file: !838, line: 72, column: 5)
!5705 = !DILocation(line: 72, column: 14, scope: !5704)
!5706 = !DILocation(line: 72, column: 10, scope: !5704)
!5707 = !DILocation(line: 72, column: 21, scope: !5708)
!5708 = distinct !DILexicalBlock(scope: !5704, file: !838, line: 72, column: 5)
!5709 = !DILocation(line: 72, column: 25, scope: !5708)
!5710 = !DILocation(line: 72, column: 23, scope: !5708)
!5711 = !DILocation(line: 72, column: 5, scope: !5704)
!5712 = !DILocation(line: 73, column: 27, scope: !5713)
!5713 = distinct !DILexicalBlock(scope: !5708, file: !838, line: 72, column: 41)
!5714 = !DILocation(line: 73, column: 29, scope: !5713)
!5715 = !DILocation(line: 73, column: 34, scope: !5713)
!5716 = !DILocation(line: 73, column: 33, scope: !5713)
!5717 = !DILocation(line: 73, column: 21, scope: !5713)
!5718 = !DILocation(line: 73, column: 38, scope: !5713)
!5719 = !DILocation(line: 73, column: 15, scope: !5713)
!5720 = !DILocation(line: 73, column: 13, scope: !5713)
!5721 = !DILocation(line: 74, column: 5, scope: !5713)
!5722 = !DILocation(line: 72, column: 28, scope: !5708)
!5723 = !DILocation(line: 72, column: 38, scope: !5708)
!5724 = !DILocation(line: 72, column: 35, scope: !5708)
!5725 = !DILocation(line: 72, column: 5, scope: !5708)
!5726 = distinct !{!5726, !5711, !5727, !165}
!5727 = !DILocation(line: 74, column: 5, scope: !5704)
!5728 = !DILocation(line: 75, column: 12, scope: !5692)
!5729 = !DILocation(line: 75, column: 5, scope: !5692)
!5730 = distinct !DISubprogram(name: "add_f", scope: !838, file: !838, line: 42, type: !2774, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !43, retainedNodes: !91)
!5731 = !DILocalVariable(name: "a", arg: 1, scope: !5730, file: !838, line: 42, type: !56)
!5732 = !DILocation(line: 42, column: 49, scope: !5730)
!5733 = !DILocalVariable(name: "b", arg: 2, scope: !5730, file: !838, line: 42, type: !56)
!5734 = !DILocation(line: 42, column: 66, scope: !5730)
!5735 = !DILocation(line: 43, column: 12, scope: !5730)
!5736 = !DILocation(line: 43, column: 16, scope: !5730)
!5737 = !DILocation(line: 43, column: 14, scope: !5730)
!5738 = !DILocation(line: 43, column: 5, scope: !5730)
