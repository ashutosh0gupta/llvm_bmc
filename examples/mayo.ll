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
@.str.9 = private unnamed_addr constant [39 x i8] c"mayo_open (with altered signature) -> \00", align 1, !dbg !41
@.str.10 = private unnamed_addr constant [41 x i8] c"mayo_verify (with altered signature) -> \00", align 1, !dbg !43
@unsigned_char_blocker = external dso_local global i8, align 1

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 !dbg !84 {
entry:
  %retval = alloca i32, align 4
  %params = alloca [4 x ptr], align 4
  %paramslen = alloca i32, align 4
  %i = alloca i32, align 4
    #dbg_declare(ptr %params, !88, !DIExpression(), !123)
  call void @llvm.memcpy.p0.p0.i32(ptr align 4 %params, ptr align 4 @__const.main.params, i32 16, i1 false), !dbg !123
    #dbg_declare(ptr %paramslen, !124, !DIExpression(), !125)
  store i32 4, ptr %paramslen, align 4, !dbg !125
    #dbg_declare(ptr %i, !126, !DIExpression(), !128)
  store i32 0, ptr %i, align 4, !dbg !128
  br label %for.cond, !dbg !129

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4, !dbg !130
  %1 = load i32, ptr %paramslen, align 4, !dbg !132
  %cmp = icmp slt i32 %0, %1, !dbg !133
  br i1 %cmp, label %for.body, label %for.end, !dbg !134

for.body:                                         ; preds = %for.cond
  %2 = load i32, ptr %i, align 4, !dbg !135
  %arrayidx = getelementptr inbounds [4 x ptr], ptr %params, i32 0, i32 %2, !dbg !138
  %3 = load ptr, ptr %arrayidx, align 4, !dbg !138
  %call = call i32 @example_mayo(ptr noundef %3) #5, !dbg !139
  %cmp1 = icmp ne i32 %call, 0, !dbg !140
  br i1 %cmp1, label %if.then, label %if.end, !dbg !140

if.then:                                          ; preds = %for.body
  store i32 -1, ptr %retval, align 4, !dbg !141
  br label %for.end, !dbg !141

if.end:                                           ; preds = %for.body
  br label %for.inc, !dbg !143

for.inc:                                          ; preds = %if.end
  %4 = load i32, ptr %i, align 4, !dbg !144
  %inc = add nsw i32 %4, 1, !dbg !144
  store i32 %inc, ptr %i, align 4, !dbg !144
  br label %for.cond, !dbg !145, !llvm.loop !146

for.end:                                          ; preds = %if.then, %for.cond
  %5 = load i32, ptr %retval, align 4, !dbg !149
  ret i32 %5, !dbg !149
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i32(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i32, i1 immarg) #1

; Function Attrs: noinline nounwind optnone
define internal i32 @example_mayo(ptr noundef %p) #0 !dbg !150 {
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
    #dbg_declare(ptr %p.addr, !153, !DIExpression(), !154)
    #dbg_declare(ptr %msglen, !155, !DIExpression(), !156)
  store i32 32, ptr %msglen, align 4, !dbg !156
    #dbg_declare(ptr %smlen, !157, !DIExpression(), !158)
  %0 = load ptr, ptr %p.addr, align 4, !dbg !159
  %sig_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %0, i32 0, i32 16, !dbg !160
  %1 = load i32, ptr %sig_bytes, align 4, !dbg !160
  %2 = load i32, ptr %msglen, align 4, !dbg !161
  %add = add i32 %1, %2, !dbg !162
  store i32 %add, ptr %smlen, align 4, !dbg !158
    #dbg_declare(ptr %pk, !163, !DIExpression(), !164)
  %3 = load ptr, ptr %p.addr, align 4, !dbg !165
  %cpk_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %3, i32 0, i32 15, !dbg !166
  %4 = load i32, ptr %cpk_bytes, align 4, !dbg !166
  %call = call ptr @calloc(i32 noundef %4, i32 noundef 1) #6, !dbg !167
  store ptr %call, ptr %pk, align 4, !dbg !164
    #dbg_declare(ptr %sk, !168, !DIExpression(), !169)
  %5 = load ptr, ptr %p.addr, align 4, !dbg !170
  %csk_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %5, i32 0, i32 14, !dbg !171
  %6 = load i32, ptr %csk_bytes, align 4, !dbg !171
  %call1 = call ptr @calloc(i32 noundef %6, i32 noundef 1) #6, !dbg !172
  store ptr %call1, ptr %sk, align 4, !dbg !169
    #dbg_declare(ptr %epk, !173, !DIExpression(), !174)
  %call2 = call ptr @calloc(i32 noundef 1, i32 noundef 915840) #6, !dbg !175
  store ptr %call2, ptr %epk, align 4, !dbg !174
    #dbg_declare(ptr %esk, !176, !DIExpression(), !191)
  %call3 = call ptr @calloc(i32 noundef 1, i32 noundef 907240) #6, !dbg !192
  store ptr %call3, ptr %esk, align 4, !dbg !191
    #dbg_declare(ptr %sig, !193, !DIExpression(), !194)
  %7 = load ptr, ptr %p.addr, align 4, !dbg !195
  %sig_bytes4 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %7, i32 0, i32 16, !dbg !196
  %8 = load i32, ptr %sig_bytes4, align 4, !dbg !196
  %9 = load i32, ptr %msglen, align 4, !dbg !197
  %add5 = add i32 %8, %9, !dbg !198
  %call6 = call ptr @calloc(i32 noundef %add5, i32 noundef 1) #6, !dbg !199
  store ptr %call6, ptr %sig, align 4, !dbg !194
    #dbg_declare(ptr %msg, !200, !DIExpression(), !204)
  call void @llvm.memcpy.p0.p0.i32(ptr align 1 %msg, ptr align 1 @__const.example_mayo.msg, i32 32, i1 false), !dbg !204
    #dbg_declare(ptr %msg2, !205, !DIExpression(), !206)
  call void @llvm.memset.p0.i32(ptr align 1 %msg2, i8 0, i32 32, i1 false), !dbg !206
  %10 = load ptr, ptr %p.addr, align 4, !dbg !207
  %name = getelementptr inbounds nuw %struct.mayo_params_t, ptr %10, i32 0, i32 22, !dbg !208
  %11 = load ptr, ptr %name, align 4, !dbg !208
  %call7 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %11) #5, !dbg !209
  %call8 = call i32 (ptr, ...) @printf(ptr noundef @.str.1) #5, !dbg !210
    #dbg_declare(ptr %res, !211, !DIExpression(), !212)
  %12 = load ptr, ptr %p.addr, align 4, !dbg !213
  %13 = load ptr, ptr %pk, align 4, !dbg !214
  %14 = load ptr, ptr %sk, align 4, !dbg !215
  %call9 = call i32 @mayo_keypair(ptr noundef %12, ptr noundef %13, ptr noundef %14) #5, !dbg !216
  store i32 %call9, ptr %res, align 4, !dbg !212
  %15 = load i32, ptr %res, align 4, !dbg !217
  %cmp = icmp ne i32 %15, 0, !dbg !219
  br i1 %cmp, label %if.then, label %if.else, !dbg !219

if.then:                                          ; preds = %entry
  %call10 = call i32 (ptr, ...) @printf(ptr noundef @.str.2) #5, !dbg !220
  store i32 -1, ptr %res, align 4, !dbg !222
  br label %err, !dbg !223

if.else:                                          ; preds = %entry
  %call11 = call i32 (ptr, ...) @printf(ptr noundef @.str.3) #5, !dbg !224
  br label %if.end

if.end:                                           ; preds = %if.else
  %call12 = call i32 (ptr, ...) @printf(ptr noundef @.str.4) #5, !dbg !226
  %16 = load ptr, ptr %p.addr, align 4, !dbg !227
  %17 = load ptr, ptr %sk, align 4, !dbg !228
  %18 = load ptr, ptr %esk, align 4, !dbg !229
  %call13 = call i32 @mayo_expand_sk(ptr noundef %16, ptr noundef %17, ptr noundef %18) #5, !dbg !230
  store i32 %call13, ptr %res, align 4, !dbg !231
  %19 = load i32, ptr %res, align 4, !dbg !232
  %cmp14 = icmp ne i32 %19, 0, !dbg !234
  br i1 %cmp14, label %if.then15, label %if.else17, !dbg !234

if.then15:                                        ; preds = %if.end
  %call16 = call i32 (ptr, ...) @printf(ptr noundef @.str.2) #5, !dbg !235
  store i32 -1, ptr %res, align 4, !dbg !237
  br label %err, !dbg !238

if.else17:                                        ; preds = %if.end
  %call18 = call i32 (ptr, ...) @printf(ptr noundef @.str.3) #5, !dbg !239
  br label %if.end19

if.end19:                                         ; preds = %if.else17
  %call20 = call i32 (ptr, ...) @printf(ptr noundef @.str.5) #5, !dbg !241
  %20 = load ptr, ptr %p.addr, align 4, !dbg !242
  %21 = load ptr, ptr %pk, align 4, !dbg !243
  %22 = load ptr, ptr %epk, align 4, !dbg !244
  %call21 = call i32 @mayo_expand_pk(ptr noundef %20, ptr noundef %21, ptr noundef %22) #5, !dbg !245
  store i32 %call21, ptr %res, align 4, !dbg !246
  %23 = load i32, ptr %res, align 4, !dbg !247
  %cmp22 = icmp ne i32 %23, 0, !dbg !249
  br i1 %cmp22, label %if.then23, label %if.else25, !dbg !249

if.then23:                                        ; preds = %if.end19
  %call24 = call i32 (ptr, ...) @printf(ptr noundef @.str.2) #5, !dbg !250
  store i32 -1, ptr %res, align 4, !dbg !252
  br label %err, !dbg !253

if.else25:                                        ; preds = %if.end19
  %call26 = call i32 (ptr, ...) @printf(ptr noundef @.str.3) #5, !dbg !254
  br label %if.end27

if.end27:                                         ; preds = %if.else25
  %call28 = call i32 (ptr, ...) @printf(ptr noundef @.str.6) #5, !dbg !256
  %24 = load ptr, ptr %p.addr, align 4, !dbg !257
  %25 = load ptr, ptr %sig, align 4, !dbg !258
  %arraydecay = getelementptr inbounds [32 x i8], ptr %msg, i32 0, i32 0, !dbg !259
  %26 = load i32, ptr %msglen, align 4, !dbg !260
  %27 = load ptr, ptr %sk, align 4, !dbg !261
  %call29 = call i32 @mayo_sign(ptr noundef %24, ptr noundef %25, ptr noundef %smlen, ptr noundef %arraydecay, i32 noundef %26, ptr noundef %27) #5, !dbg !262
  store i32 %call29, ptr %res, align 4, !dbg !263
  %28 = load i32, ptr %res, align 4, !dbg !264
  %cmp30 = icmp ne i32 %28, 0, !dbg !266
  br i1 %cmp30, label %if.then31, label %if.else33, !dbg !266

if.then31:                                        ; preds = %if.end27
  %call32 = call i32 (ptr, ...) @printf(ptr noundef @.str.2) #5, !dbg !267
  store i32 -1, ptr %res, align 4, !dbg !269
  br label %err, !dbg !270

if.else33:                                        ; preds = %if.end27
  %call34 = call i32 (ptr, ...) @printf(ptr noundef @.str.3) #5, !dbg !271
  br label %if.end35

if.end35:                                         ; preds = %if.else33
  %call36 = call i32 (ptr, ...) @printf(ptr noundef @.str.7) #5, !dbg !273
  %29 = load ptr, ptr %p.addr, align 4, !dbg !274
  %arraydecay37 = getelementptr inbounds [32 x i8], ptr %msg2, i32 0, i32 0, !dbg !275
  %30 = load ptr, ptr %sig, align 4, !dbg !276
  %31 = load i32, ptr %smlen, align 4, !dbg !277
  %32 = load ptr, ptr %pk, align 4, !dbg !278
  %call38 = call i32 @mayo_open(ptr noundef %29, ptr noundef %arraydecay37, ptr noundef %msglen, ptr noundef %30, i32 noundef %31, ptr noundef %32) #5, !dbg !279
  store i32 %call38, ptr %res, align 4, !dbg !280
  %33 = load i32, ptr %res, align 4, !dbg !281
  %cmp39 = icmp ne i32 %33, 0, !dbg !283
  br i1 %cmp39, label %if.then43, label %lor.lhs.false, !dbg !284

lor.lhs.false:                                    ; preds = %if.end35
  %arraydecay40 = getelementptr inbounds [32 x i8], ptr %msg, i32 0, i32 0, !dbg !285
  %arraydecay41 = getelementptr inbounds [32 x i8], ptr %msg2, i32 0, i32 0, !dbg !286
  %34 = load i32, ptr %msglen, align 4, !dbg !287
  %call42 = call i32 @memcmp(ptr noundef %arraydecay40, ptr noundef %arraydecay41, i32 noundef %34) #5, !dbg !288
  %tobool = icmp ne i32 %call42, 0, !dbg !288
  br i1 %tobool, label %if.then43, label %if.else45, !dbg !284

if.then43:                                        ; preds = %lor.lhs.false, %if.end35
  %call44 = call i32 (ptr, ...) @printf(ptr noundef @.str.2) #5, !dbg !289
  store i32 -1, ptr %res, align 4, !dbg !291
  br label %err, !dbg !292

if.else45:                                        ; preds = %lor.lhs.false
  store i32 0, ptr %res, align 4, !dbg !293
  %call46 = call i32 (ptr, ...) @printf(ptr noundef @.str.3) #5, !dbg !295
  br label %if.end47

if.end47:                                         ; preds = %if.else45
  %call48 = call i32 (ptr, ...) @printf(ptr noundef @.str.8) #5, !dbg !296
  %35 = load ptr, ptr %p.addr, align 4, !dbg !297
  %arraydecay49 = getelementptr inbounds [32 x i8], ptr %msg, i32 0, i32 0, !dbg !298
  %36 = load i32, ptr %msglen, align 4, !dbg !299
  %37 = load ptr, ptr %sig, align 4, !dbg !300
  %38 = load ptr, ptr %pk, align 4, !dbg !301
  %call50 = call i32 @mayo_verify(ptr noundef %35, ptr noundef %arraydecay49, i32 noundef %36, ptr noundef %37, ptr noundef %38) #5, !dbg !302
  store i32 %call50, ptr %res, align 4, !dbg !303
  %39 = load i32, ptr %res, align 4, !dbg !304
  %cmp51 = icmp ne i32 %39, 0, !dbg !306
  br i1 %cmp51, label %if.then52, label %if.else54, !dbg !306

if.then52:                                        ; preds = %if.end47
  %call53 = call i32 (ptr, ...) @printf(ptr noundef @.str.2) #5, !dbg !307
  store i32 -1, ptr %res, align 4, !dbg !309
  br label %err, !dbg !310

if.else54:                                        ; preds = %if.end47
  store i32 0, ptr %res, align 4, !dbg !311
  %call55 = call i32 (ptr, ...) @printf(ptr noundef @.str.3) #5, !dbg !313
  br label %if.end56

if.end56:                                         ; preds = %if.else54
  %call57 = call i32 (ptr, ...) @printf(ptr noundef @.str.9) #5, !dbg !314
  %40 = load ptr, ptr %sig, align 4, !dbg !315
  %arrayidx = getelementptr inbounds i8, ptr %40, i32 0, !dbg !315
  %41 = load i8, ptr %arrayidx, align 1, !dbg !315
  %conv = zext i8 %41 to i32, !dbg !315
  %not = xor i32 %conv, -1, !dbg !316
  %conv58 = trunc i32 %not to i8, !dbg !316
  %42 = load ptr, ptr %sig, align 4, !dbg !317
  %arrayidx59 = getelementptr inbounds i8, ptr %42, i32 0, !dbg !317
  store i8 %conv58, ptr %arrayidx59, align 1, !dbg !318
  %arraydecay60 = getelementptr inbounds [32 x i8], ptr %msg2, i32 0, i32 0, !dbg !319
  %43 = load i32, ptr %msglen, align 4, !dbg !320
  %call61 = call ptr @memset(ptr noundef %arraydecay60, i32 noundef 0, i32 noundef %43) #5, !dbg !321
  %44 = load ptr, ptr %p.addr, align 4, !dbg !322
  %arraydecay62 = getelementptr inbounds [32 x i8], ptr %msg2, i32 0, i32 0, !dbg !323
  %45 = load ptr, ptr %sig, align 4, !dbg !324
  %46 = load i32, ptr %smlen, align 4, !dbg !325
  %47 = load ptr, ptr %pk, align 4, !dbg !326
  %call63 = call i32 @mayo_open(ptr noundef %44, ptr noundef %arraydecay62, ptr noundef %msglen, ptr noundef %45, i32 noundef %46, ptr noundef %47) #5, !dbg !327
  store i32 %call63, ptr %res, align 4, !dbg !328
  %48 = load i32, ptr %res, align 4, !dbg !329
  %cmp64 = icmp ne i32 %48, 1, !dbg !331
  br i1 %cmp64, label %if.then71, label %lor.lhs.false66, !dbg !332

lor.lhs.false66:                                  ; preds = %if.end56
  %arraydecay67 = getelementptr inbounds [32 x i8], ptr %msg, i32 0, i32 0, !dbg !333
  %arraydecay68 = getelementptr inbounds [32 x i8], ptr %msg2, i32 0, i32 0, !dbg !334
  %49 = load i32, ptr %msglen, align 4, !dbg !335
  %call69 = call i32 @memcmp(ptr noundef %arraydecay67, ptr noundef %arraydecay68, i32 noundef %49) #5, !dbg !336
  %tobool70 = icmp ne i32 %call69, 0, !dbg !336
  br i1 %tobool70, label %if.else73, label %if.then71, !dbg !332

if.then71:                                        ; preds = %lor.lhs.false66, %if.end56
  %call72 = call i32 (ptr, ...) @printf(ptr noundef @.str.2) #5, !dbg !337
  store i32 -1, ptr %res, align 4, !dbg !339
  br label %err, !dbg !340

if.else73:                                        ; preds = %lor.lhs.false66
  store i32 0, ptr %res, align 4, !dbg !341
  %call74 = call i32 (ptr, ...) @printf(ptr noundef @.str.3) #5, !dbg !343
  br label %if.end75

if.end75:                                         ; preds = %if.else73
  %call76 = call i32 (ptr, ...) @printf(ptr noundef @.str.10) #5, !dbg !344
  %50 = load ptr, ptr %p.addr, align 4, !dbg !345
  %arraydecay77 = getelementptr inbounds [32 x i8], ptr %msg, i32 0, i32 0, !dbg !346
  %51 = load i32, ptr %msglen, align 4, !dbg !347
  %52 = load ptr, ptr %sig, align 4, !dbg !348
  %53 = load ptr, ptr %pk, align 4, !dbg !349
  %call78 = call i32 @mayo_verify(ptr noundef %50, ptr noundef %arraydecay77, i32 noundef %51, ptr noundef %52, ptr noundef %53) #5, !dbg !350
  store i32 %call78, ptr %res, align 4, !dbg !351
  %54 = load i32, ptr %res, align 4, !dbg !352
  %cmp79 = icmp eq i32 %54, 0, !dbg !354
  br i1 %cmp79, label %if.then81, label %if.else83, !dbg !354

if.then81:                                        ; preds = %if.end75
  %call82 = call i32 (ptr, ...) @printf(ptr noundef @.str.2) #5, !dbg !355
  store i32 -1, ptr %res, align 4, !dbg !357
  br label %err, !dbg !358

if.else83:                                        ; preds = %if.end75
  store i32 0, ptr %res, align 4, !dbg !359
  %call84 = call i32 (ptr, ...) @printf(ptr noundef @.str.3) #5, !dbg !361
  br label %if.end85

if.end85:                                         ; preds = %if.else83
  br label %err, !dbg !362

err:                                              ; preds = %if.end85, %if.then81, %if.then71, %if.then52, %if.then43, %if.then31, %if.then23, %if.then15, %if.then
    #dbg_label(!363, !364)
  %55 = load ptr, ptr %pk, align 4, !dbg !365
  call void @free(ptr noundef %55) #5, !dbg !366
  %56 = load ptr, ptr %epk, align 4, !dbg !367
  call void @free(ptr noundef %56) #5, !dbg !368
  %57 = load ptr, ptr %sk, align 4, !dbg !369
  %58 = load ptr, ptr %p.addr, align 4, !dbg !370
  %csk_bytes86 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %58, i32 0, i32 14, !dbg !371
  %59 = load i32, ptr %csk_bytes86, align 4, !dbg !371
  call void @mayo_secure_free(ptr noundef %57, i32 noundef %59) #5, !dbg !372
  %60 = load ptr, ptr %esk, align 4, !dbg !373
  call void @mayo_secure_free(ptr noundef %60, i32 noundef 907240) #5, !dbg !374
  %61 = load ptr, ptr %sig, align 4, !dbg !375
  call void @free(ptr noundef %61) #5, !dbg !376
  %62 = load i32, ptr %res, align 4, !dbg !377
  ret i32 %62, !dbg !378
}

; Function Attrs: allocsize(0,1)
declare dso_local ptr @calloc(i32 noundef, i32 noundef) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i32(ptr writeonly captures(none), i8, i32, i1 immarg) #3

declare dso_local i32 @printf(ptr noundef, ...) #4

declare dso_local i32 @memcmp(ptr noundef, ptr noundef, i32 noundef) #4

declare dso_local ptr @memset(ptr noundef, i32 noundef, i32 noundef) #4

declare dso_local void @free(ptr noundef) #4

declare dso_local void @mayo_secure_free(ptr noundef, i32 noundef) #4

; Function Attrs: noinline nounwind optnone
define dso_local i32 @mayo_keypair(ptr noundef %p, ptr noundef %pk, ptr noundef %sk) #0 !dbg !379 {
entry:
  %p.addr = alloca ptr, align 4
  %pk.addr = alloca ptr, align 4
  %sk.addr = alloca ptr, align 4
  %ret = alloca i32, align 4
  store ptr %p, ptr %p.addr, align 4
    #dbg_declare(ptr %p.addr, !410, !DIExpression(), !411)
  store ptr %pk, ptr %pk.addr, align 4
    #dbg_declare(ptr %pk.addr, !412, !DIExpression(), !413)
  store ptr %sk, ptr %sk.addr, align 4
    #dbg_declare(ptr %sk.addr, !414, !DIExpression(), !415)
    #dbg_declare(ptr %ret, !416, !DIExpression(), !417)
  store i32 0, ptr %ret, align 4, !dbg !417
  %0 = load ptr, ptr %p.addr, align 4, !dbg !418
  %1 = load ptr, ptr %pk.addr, align 4, !dbg !419
  %2 = load ptr, ptr %sk.addr, align 4, !dbg !420
  %call = call i32 @mayo_keypair_compact(ptr noundef %0, ptr noundef %1, ptr noundef %2) #5, !dbg !421
  store i32 %call, ptr %ret, align 4, !dbg !422
  %3 = load i32, ptr %ret, align 4, !dbg !423
  %cmp = icmp ne i32 %3, 0, !dbg !425
  br i1 %cmp, label %if.then, label %if.end, !dbg !425

if.then:                                          ; preds = %entry
  br label %err, !dbg !426

if.end:                                           ; preds = %entry
  br label %err, !dbg !428

err:                                              ; preds = %if.end, %if.then
    #dbg_label(!429, !430)
  %4 = load i32, ptr %ret, align 4, !dbg !431
  ret i32 %4, !dbg !432
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @mayo_keypair_compact(ptr noundef %p, ptr noundef %cpk, ptr noundef %csk) #0 !dbg !433 {
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
    #dbg_declare(ptr %p.addr, !434, !DIExpression(), !435)
  store ptr %cpk, ptr %cpk.addr, align 4
    #dbg_declare(ptr %cpk.addr, !436, !DIExpression(), !437)
  store ptr %csk, ptr %csk.addr, align 4
    #dbg_declare(ptr %csk.addr, !438, !DIExpression(), !439)
    #dbg_declare(ptr %ret, !440, !DIExpression(), !441)
  store i32 0, ptr %ret, align 4, !dbg !441
    #dbg_declare(ptr %seed_sk, !442, !DIExpression(), !443)
  %0 = load ptr, ptr %csk.addr, align 4, !dbg !444
  store ptr %0, ptr %seed_sk, align 4, !dbg !443
    #dbg_declare(ptr %S, !445, !DIExpression(), !449)
    #dbg_declare(ptr %P, !450, !DIExpression(), !451)
    #dbg_declare(ptr %P3, !452, !DIExpression(), !456)
  call void @llvm.memset.p0.i32(ptr align 8 %P3, i8 0, i32 20808, i1 false), !dbg !456
    #dbg_declare(ptr %seed_pk, !457, !DIExpression(), !458)
    #dbg_declare(ptr %O, !459, !DIExpression(), !461)
    #dbg_declare(ptr %m_vec_limbs, !462, !DIExpression(), !464)
  %1 = load ptr, ptr %p.addr, align 4, !dbg !465
  %m_vec_limbs1 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %1, i32 0, i32 21, !dbg !466
  %2 = load i32, ptr %m_vec_limbs1, align 4, !dbg !466
  store i32 %2, ptr %m_vec_limbs, align 4, !dbg !464
    #dbg_declare(ptr %param_m, !467, !DIExpression(), !468)
  %3 = load ptr, ptr %p.addr, align 4, !dbg !469
  %m = getelementptr inbounds nuw %struct.mayo_params_t, ptr %3, i32 0, i32 0, !dbg !470
  %4 = load i32, ptr %m, align 4, !dbg !470
  store i32 %4, ptr %param_m, align 4, !dbg !468
    #dbg_declare(ptr %param_v, !471, !DIExpression(), !472)
  %5 = load ptr, ptr %p.addr, align 4, !dbg !473
  %n = getelementptr inbounds nuw %struct.mayo_params_t, ptr %5, i32 0, i32 1, !dbg !474
  %6 = load i32, ptr %n, align 4, !dbg !474
  %7 = load ptr, ptr %p.addr, align 4, !dbg !473
  %o = getelementptr inbounds nuw %struct.mayo_params_t, ptr %7, i32 0, i32 2, !dbg !474
  %8 = load i32, ptr %o, align 4, !dbg !474
  %sub = sub nsw i32 %6, %8, !dbg !474
  store i32 %sub, ptr %param_v, align 4, !dbg !472
    #dbg_declare(ptr %param_o, !475, !DIExpression(), !476)
  %9 = load ptr, ptr %p.addr, align 4, !dbg !477
  %o2 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %9, i32 0, i32 2, !dbg !478
  %10 = load i32, ptr %o2, align 4, !dbg !478
  store i32 %10, ptr %param_o, align 4, !dbg !476
    #dbg_declare(ptr %param_O_bytes, !479, !DIExpression(), !480)
  %11 = load ptr, ptr %p.addr, align 4, !dbg !481
  %O_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %11, i32 0, i32 7, !dbg !482
  %12 = load i32, ptr %O_bytes, align 4, !dbg !482
  store i32 %12, ptr %param_O_bytes, align 4, !dbg !480
    #dbg_declare(ptr %param_P1_limbs, !483, !DIExpression(), !484)
  %13 = load ptr, ptr %p.addr, align 4, !dbg !485
  %n3 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %13, i32 0, i32 1, !dbg !486
  %14 = load i32, ptr %n3, align 4, !dbg !486
  %15 = load ptr, ptr %p.addr, align 4, !dbg !485
  %o4 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %15, i32 0, i32 2, !dbg !486
  %16 = load i32, ptr %o4, align 4, !dbg !486
  %sub5 = sub nsw i32 %14, %16, !dbg !486
  %17 = load ptr, ptr %p.addr, align 4, !dbg !485
  %n6 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %17, i32 0, i32 1, !dbg !486
  %18 = load i32, ptr %n6, align 4, !dbg !486
  %19 = load ptr, ptr %p.addr, align 4, !dbg !485
  %o7 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %19, i32 0, i32 2, !dbg !486
  %20 = load i32, ptr %o7, align 4, !dbg !486
  %sub8 = sub nsw i32 %18, %20, !dbg !486
  %add = add nsw i32 %sub8, 1, !dbg !486
  %mul = mul nsw i32 %sub5, %add, !dbg !486
  %div = sdiv i32 %mul, 2, !dbg !486
  %21 = load ptr, ptr %p.addr, align 4, !dbg !485
  %m_vec_limbs9 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %21, i32 0, i32 21, !dbg !486
  %22 = load i32, ptr %m_vec_limbs9, align 4, !dbg !486
  %mul10 = mul nsw i32 %div, %22, !dbg !486
  store i32 %mul10, ptr %param_P1_limbs, align 4, !dbg !484
    #dbg_declare(ptr %param_P3_limbs, !487, !DIExpression(), !488)
  %23 = load ptr, ptr %p.addr, align 4, !dbg !489
  %o11 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %23, i32 0, i32 2, !dbg !490
  %24 = load i32, ptr %o11, align 4, !dbg !490
  %25 = load ptr, ptr %p.addr, align 4, !dbg !489
  %o12 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %25, i32 0, i32 2, !dbg !490
  %26 = load i32, ptr %o12, align 4, !dbg !490
  %add13 = add nsw i32 %26, 1, !dbg !490
  %mul14 = mul nsw i32 %24, %add13, !dbg !490
  %div15 = sdiv i32 %mul14, 2, !dbg !490
  %27 = load ptr, ptr %p.addr, align 4, !dbg !489
  %m_vec_limbs16 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %27, i32 0, i32 21, !dbg !490
  %28 = load i32, ptr %m_vec_limbs16, align 4, !dbg !490
  %mul17 = mul nsw i32 %div15, %28, !dbg !490
  store i32 %mul17, ptr %param_P3_limbs, align 4, !dbg !488
    #dbg_declare(ptr %param_pk_seed_bytes, !491, !DIExpression(), !492)
  %29 = load ptr, ptr %p.addr, align 4, !dbg !493
  %pk_seed_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %29, i32 0, i32 20, !dbg !494
  %30 = load i32, ptr %pk_seed_bytes, align 4, !dbg !494
  store i32 %30, ptr %param_pk_seed_bytes, align 4, !dbg !492
    #dbg_declare(ptr %param_sk_seed_bytes, !495, !DIExpression(), !496)
  %31 = load ptr, ptr %p.addr, align 4, !dbg !497
  %sk_seed_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %31, i32 0, i32 18, !dbg !498
  %32 = load i32, ptr %sk_seed_bytes, align 4, !dbg !498
  store i32 %32, ptr %param_sk_seed_bytes, align 4, !dbg !496
    #dbg_declare(ptr %P1, !499, !DIExpression(), !500)
  %arraydecay = getelementptr inbounds [113103 x i64], ptr %P, i32 0, i32 0, !dbg !501
  store ptr %arraydecay, ptr %P1, align 4, !dbg !500
    #dbg_declare(ptr %P2, !502, !DIExpression(), !503)
  %arraydecay18 = getelementptr inbounds [113103 x i64], ptr %P, i32 0, i32 0, !dbg !504
  %33 = load i32, ptr %param_P1_limbs, align 4, !dbg !505
  %add.ptr = getelementptr inbounds i64, ptr %arraydecay18, i32 %33, !dbg !506
  store ptr %add.ptr, ptr %P2, align 4, !dbg !503
  %34 = load ptr, ptr %seed_sk, align 4, !dbg !507
  %35 = load i32, ptr %param_sk_seed_bytes, align 4, !dbg !509
  %call = call i32 @randombytes(ptr noundef %34, i32 noundef %35) #5, !dbg !510
  %cmp = icmp ne i32 %call, 0, !dbg !511
  br i1 %cmp, label %if.then, label %if.end, !dbg !511

if.then:                                          ; preds = %entry
  store i32 1, ptr %ret, align 4, !dbg !512
  br label %err, !dbg !514

if.end:                                           ; preds = %entry
  %arraydecay19 = getelementptr inbounds [868 x i8], ptr %S, i32 0, i32 0, !dbg !515
  %36 = load i32, ptr %param_pk_seed_bytes, align 4, !dbg !516
  %37 = load i32, ptr %param_O_bytes, align 4, !dbg !517
  %add20 = add nsw i32 %36, %37, !dbg !518
  %38 = load ptr, ptr %seed_sk, align 4, !dbg !519
  %39 = load i32, ptr %param_sk_seed_bytes, align 4, !dbg !520
  %call21 = call i32 @shake256(ptr noundef %arraydecay19, i32 noundef %add20, ptr noundef %38, i32 noundef %39) #5, !dbg !521
  %arraydecay22 = getelementptr inbounds [868 x i8], ptr %S, i32 0, i32 0, !dbg !522
  store ptr %arraydecay22, ptr %seed_pk, align 4, !dbg !523
  %arraydecay23 = getelementptr inbounds [868 x i8], ptr %S, i32 0, i32 0, !dbg !524
  %40 = load i32, ptr %param_pk_seed_bytes, align 4, !dbg !525
  %add.ptr24 = getelementptr inbounds i8, ptr %arraydecay23, i32 %40, !dbg !526
  %arraydecay25 = getelementptr inbounds [2414 x i8], ptr %O, i32 0, i32 0, !dbg !527
  %41 = load i32, ptr %param_v, align 4, !dbg !528
  %42 = load i32, ptr %param_o, align 4, !dbg !529
  %mul26 = mul nsw i32 %41, %42, !dbg !530
  call void @decode(ptr noundef %add.ptr24, ptr noundef %arraydecay25, i32 noundef %mul26) #5, !dbg !531
  %43 = load ptr, ptr %p.addr, align 4, !dbg !532
  %arraydecay27 = getelementptr inbounds [113103 x i64], ptr %P, i32 0, i32 0, !dbg !533
  %44 = load ptr, ptr %seed_pk, align 4, !dbg !534
  call void @expand_P1_P2(ptr noundef %43, ptr noundef %arraydecay27, ptr noundef %44) #5, !dbg !535
  %45 = load ptr, ptr %p.addr, align 4, !dbg !536
  %46 = load ptr, ptr %P1, align 4, !dbg !537
  %47 = load ptr, ptr %P2, align 4, !dbg !538
  %arraydecay28 = getelementptr inbounds [2414 x i8], ptr %O, i32 0, i32 0, !dbg !539
  %arraydecay29 = getelementptr inbounds [2601 x i64], ptr %P3, i32 0, i32 0, !dbg !540
  call void @compute_P3(ptr noundef %45, ptr noundef %46, ptr noundef %47, ptr noundef %arraydecay28, ptr noundef %arraydecay29) #5, !dbg !541
  %48 = load ptr, ptr %cpk.addr, align 4, !dbg !542
  %49 = load ptr, ptr %seed_pk, align 4, !dbg !543
  %50 = load i32, ptr %param_pk_seed_bytes, align 4, !dbg !544
  %call30 = call ptr @memcpy(ptr noundef %48, ptr noundef %49, i32 noundef %50) #5, !dbg !545
    #dbg_declare(ptr %P3_upper, !546, !DIExpression(), !550)
  %51 = load ptr, ptr %p.addr, align 4, !dbg !551
  %arraydecay31 = getelementptr inbounds [2601 x i64], ptr %P3, i32 0, i32 0, !dbg !552
  %arraydecay32 = getelementptr inbounds [1377 x i64], ptr %P3_upper, i32 0, i32 0, !dbg !553
  %52 = load i32, ptr %param_o, align 4, !dbg !554
  call void @m_upper(ptr noundef %51, ptr noundef %arraydecay31, ptr noundef %arraydecay32, i32 noundef %52) #5, !dbg !555
  %arraydecay33 = getelementptr inbounds [1377 x i64], ptr %P3_upper, i32 0, i32 0, !dbg !556
  %53 = load ptr, ptr %cpk.addr, align 4, !dbg !557
  %54 = load i32, ptr %param_pk_seed_bytes, align 4, !dbg !558
  %add.ptr34 = getelementptr inbounds i8, ptr %53, i32 %54, !dbg !559
  %55 = load i32, ptr %param_P3_limbs, align 4, !dbg !560
  %56 = load i32, ptr %m_vec_limbs, align 4, !dbg !561
  %div35 = sdiv i32 %55, %56, !dbg !562
  %57 = load i32, ptr %param_m, align 4, !dbg !563
  call void @pack_m_vecs(ptr noundef %arraydecay33, ptr noundef %add.ptr34, i32 noundef %div35, i32 noundef %57) #5, !dbg !564
  br label %err, !dbg !564

err:                                              ; preds = %if.end, %if.then
    #dbg_label(!565, !566)
  %arraydecay36 = getelementptr inbounds [2414 x i8], ptr %O, i32 0, i32 0, !dbg !567
  call void @mayo_secure_clear(ptr noundef %arraydecay36, i32 noundef 2414) #5, !dbg !568
  %58 = load ptr, ptr %P2, align 4, !dbg !569
  %59 = load ptr, ptr %p.addr, align 4, !dbg !570
  %n37 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %59, i32 0, i32 1, !dbg !571
  %60 = load i32, ptr %n37, align 4, !dbg !571
  %61 = load ptr, ptr %p.addr, align 4, !dbg !570
  %o38 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %61, i32 0, i32 2, !dbg !571
  %62 = load i32, ptr %o38, align 4, !dbg !571
  %sub39 = sub nsw i32 %60, %62, !dbg !571
  %63 = load ptr, ptr %p.addr, align 4, !dbg !570
  %o40 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %63, i32 0, i32 2, !dbg !571
  %64 = load i32, ptr %o40, align 4, !dbg !571
  %mul41 = mul nsw i32 %sub39, %64, !dbg !571
  %65 = load ptr, ptr %p.addr, align 4, !dbg !570
  %m_vec_limbs42 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %65, i32 0, i32 21, !dbg !571
  %66 = load i32, ptr %m_vec_limbs42, align 4, !dbg !571
  %mul43 = mul nsw i32 %mul41, %66, !dbg !571
  %mul44 = mul i32 %mul43, 8, !dbg !572
  call void @mayo_secure_clear(ptr noundef %58, i32 noundef %mul44) #5, !dbg !573
  %arraydecay45 = getelementptr inbounds [2601 x i64], ptr %P3, i32 0, i32 0, !dbg !574
  call void @mayo_secure_clear(ptr noundef %arraydecay45, i32 noundef 20808) #5, !dbg !575
  %67 = load i32, ptr %ret, align 4, !dbg !576
  ret i32 %67, !dbg !577
}

declare dso_local i32 @randombytes(ptr noundef, i32 noundef) #4

declare dso_local i32 @shake256(ptr noundef, i32 noundef, ptr noundef, i32 noundef) #4

; Function Attrs: noinline nounwind optnone
define internal void @decode(ptr noundef %m, ptr noundef %mdec, i32 noundef %mdeclen) #0 !dbg !578 {
entry:
  %m.addr = alloca ptr, align 4
  %mdec.addr = alloca ptr, align 4
  %mdeclen.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store ptr %m, ptr %m.addr, align 4
    #dbg_declare(ptr %m.addr, !581, !DIExpression(), !582)
  store ptr %mdec, ptr %mdec.addr, align 4
    #dbg_declare(ptr %mdec.addr, !583, !DIExpression(), !584)
  store i32 %mdeclen, ptr %mdeclen.addr, align 4
    #dbg_declare(ptr %mdeclen.addr, !585, !DIExpression(), !586)
    #dbg_declare(ptr %i, !587, !DIExpression(), !588)
  store i32 0, ptr %i, align 4, !dbg !589
  br label %for.cond, !dbg !591

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4, !dbg !592
  %1 = load i32, ptr %mdeclen.addr, align 4, !dbg !594
  %div = sdiv i32 %1, 2, !dbg !595
  %cmp = icmp slt i32 %0, %div, !dbg !596
  br i1 %cmp, label %for.body, label %for.end, !dbg !597

for.body:                                         ; preds = %for.cond
  %2 = load ptr, ptr %m.addr, align 4, !dbg !598
  %3 = load i32, ptr %i, align 4, !dbg !600
  %arrayidx = getelementptr inbounds i8, ptr %2, i32 %3, !dbg !598
  %4 = load i8, ptr %arrayidx, align 1, !dbg !598
  %conv = zext i8 %4 to i32, !dbg !598
  %and = and i32 %conv, 15, !dbg !601
  %conv1 = trunc i32 %and to i8, !dbg !598
  %5 = load ptr, ptr %mdec.addr, align 4, !dbg !602
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %5, i32 1, !dbg !602
  store ptr %incdec.ptr, ptr %mdec.addr, align 4, !dbg !602
  store i8 %conv1, ptr %5, align 1, !dbg !603
  %6 = load ptr, ptr %m.addr, align 4, !dbg !604
  %7 = load i32, ptr %i, align 4, !dbg !605
  %arrayidx2 = getelementptr inbounds i8, ptr %6, i32 %7, !dbg !604
  %8 = load i8, ptr %arrayidx2, align 1, !dbg !604
  %conv3 = zext i8 %8 to i32, !dbg !604
  %shr = ashr i32 %conv3, 4, !dbg !606
  %conv4 = trunc i32 %shr to i8, !dbg !604
  %9 = load ptr, ptr %mdec.addr, align 4, !dbg !607
  %incdec.ptr5 = getelementptr inbounds nuw i8, ptr %9, i32 1, !dbg !607
  store ptr %incdec.ptr5, ptr %mdec.addr, align 4, !dbg !607
  store i8 %conv4, ptr %9, align 1, !dbg !608
  br label %for.inc, !dbg !609

for.inc:                                          ; preds = %for.body
  %10 = load i32, ptr %i, align 4, !dbg !610
  %inc = add nsw i32 %10, 1, !dbg !610
  store i32 %inc, ptr %i, align 4, !dbg !610
  br label %for.cond, !dbg !611, !llvm.loop !612

for.end:                                          ; preds = %for.cond
  %11 = load i32, ptr %mdeclen.addr, align 4, !dbg !614
  %rem = srem i32 %11, 2, !dbg !616
  %cmp6 = icmp eq i32 %rem, 1, !dbg !617
  br i1 %cmp6, label %if.then, label %if.end, !dbg !617

if.then:                                          ; preds = %for.end
  %12 = load ptr, ptr %m.addr, align 4, !dbg !618
  %13 = load i32, ptr %i, align 4, !dbg !620
  %arrayidx8 = getelementptr inbounds i8, ptr %12, i32 %13, !dbg !618
  %14 = load i8, ptr %arrayidx8, align 1, !dbg !618
  %conv9 = zext i8 %14 to i32, !dbg !618
  %and10 = and i32 %conv9, 15, !dbg !621
  %conv11 = trunc i32 %and10 to i8, !dbg !618
  %15 = load ptr, ptr %mdec.addr, align 4, !dbg !622
  %incdec.ptr12 = getelementptr inbounds nuw i8, ptr %15, i32 1, !dbg !622
  store ptr %incdec.ptr12, ptr %mdec.addr, align 4, !dbg !622
  store i8 %conv11, ptr %15, align 1, !dbg !623
  br label %if.end, !dbg !624

if.end:                                           ; preds = %if.then, %for.end
  ret void, !dbg !625
}

; Function Attrs: noinline nounwind optnone
define internal void @expand_P1_P2(ptr noundef %p, ptr noundef %P, ptr noundef %seed_pk) #0 !dbg !626 {
entry:
  %p.addr = alloca ptr, align 4
  %P.addr = alloca ptr, align 4
  %seed_pk.addr = alloca ptr, align 4
  store ptr %p, ptr %p.addr, align 4
    #dbg_declare(ptr %p.addr, !629, !DIExpression(), !630)
  store ptr %P, ptr %P.addr, align 4
    #dbg_declare(ptr %P.addr, !631, !DIExpression(), !632)
  store ptr %seed_pk, ptr %seed_pk.addr, align 4
    #dbg_declare(ptr %seed_pk.addr, !633, !DIExpression(), !634)
  %0 = load ptr, ptr %P.addr, align 4, !dbg !635
  %1 = load ptr, ptr %p.addr, align 4, !dbg !636
  %P1_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %1, i32 0, i32 11, !dbg !637
  %2 = load i32, ptr %P1_bytes, align 4, !dbg !637
  %3 = load ptr, ptr %p.addr, align 4, !dbg !638
  %P2_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %3, i32 0, i32 12, !dbg !639
  %4 = load i32, ptr %P2_bytes, align 4, !dbg !639
  %add = add nsw i32 %2, %4, !dbg !640
  %5 = load ptr, ptr %seed_pk.addr, align 4, !dbg !641
  %6 = load ptr, ptr %p.addr, align 4, !dbg !642
  %pk_seed_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %6, i32 0, i32 20, !dbg !643
  %7 = load i32, ptr %pk_seed_bytes, align 4, !dbg !643
  %call = call i32 @AES_128_CTR(ptr noundef %0, i32 noundef %add, ptr noundef %5, i32 noundef %7) #5, !dbg !644
  %8 = load ptr, ptr %P.addr, align 4, !dbg !645
  %9 = load ptr, ptr %P.addr, align 4, !dbg !646
  %10 = load ptr, ptr %p.addr, align 4, !dbg !647
  %n = getelementptr inbounds nuw %struct.mayo_params_t, ptr %10, i32 0, i32 1, !dbg !648
  %11 = load i32, ptr %n, align 4, !dbg !648
  %12 = load ptr, ptr %p.addr, align 4, !dbg !647
  %o = getelementptr inbounds nuw %struct.mayo_params_t, ptr %12, i32 0, i32 2, !dbg !648
  %13 = load i32, ptr %o, align 4, !dbg !648
  %sub = sub nsw i32 %11, %13, !dbg !648
  %14 = load ptr, ptr %p.addr, align 4, !dbg !647
  %n1 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %14, i32 0, i32 1, !dbg !648
  %15 = load i32, ptr %n1, align 4, !dbg !648
  %16 = load ptr, ptr %p.addr, align 4, !dbg !647
  %o2 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %16, i32 0, i32 2, !dbg !648
  %17 = load i32, ptr %o2, align 4, !dbg !648
  %sub3 = sub nsw i32 %15, %17, !dbg !648
  %add4 = add nsw i32 %sub3, 1, !dbg !648
  %mul = mul nsw i32 %sub, %add4, !dbg !648
  %div = sdiv i32 %mul, 2, !dbg !648
  %18 = load ptr, ptr %p.addr, align 4, !dbg !647
  %m_vec_limbs = getelementptr inbounds nuw %struct.mayo_params_t, ptr %18, i32 0, i32 21, !dbg !648
  %19 = load i32, ptr %m_vec_limbs, align 4, !dbg !648
  %mul5 = mul nsw i32 %div, %19, !dbg !648
  %20 = load ptr, ptr %p.addr, align 4, !dbg !649
  %n6 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %20, i32 0, i32 1, !dbg !650
  %21 = load i32, ptr %n6, align 4, !dbg !650
  %22 = load ptr, ptr %p.addr, align 4, !dbg !649
  %o7 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %22, i32 0, i32 2, !dbg !650
  %23 = load i32, ptr %o7, align 4, !dbg !650
  %sub8 = sub nsw i32 %21, %23, !dbg !650
  %24 = load ptr, ptr %p.addr, align 4, !dbg !649
  %o9 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %24, i32 0, i32 2, !dbg !650
  %25 = load i32, ptr %o9, align 4, !dbg !650
  %mul10 = mul nsw i32 %sub8, %25, !dbg !650
  %26 = load ptr, ptr %p.addr, align 4, !dbg !649
  %m_vec_limbs11 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %26, i32 0, i32 21, !dbg !650
  %27 = load i32, ptr %m_vec_limbs11, align 4, !dbg !650
  %mul12 = mul nsw i32 %mul10, %27, !dbg !650
  %add13 = add nsw i32 %mul5, %mul12, !dbg !651
  %28 = load ptr, ptr %p.addr, align 4, !dbg !652
  %m_vec_limbs14 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %28, i32 0, i32 21, !dbg !653
  %29 = load i32, ptr %m_vec_limbs14, align 4, !dbg !653
  %div15 = sdiv i32 %add13, %29, !dbg !654
  %30 = load ptr, ptr %p.addr, align 4, !dbg !655
  %m = getelementptr inbounds nuw %struct.mayo_params_t, ptr %30, i32 0, i32 0, !dbg !656
  %31 = load i32, ptr %m, align 4, !dbg !656
  call void @unpack_m_vecs(ptr noundef %8, ptr noundef %9, i32 noundef %div15, i32 noundef %31) #5, !dbg !657
  ret void, !dbg !658
}

; Function Attrs: noinline nounwind optnone
define internal void @compute_P3(ptr noundef %p, ptr noundef %P1, ptr noundef %P2, ptr noundef %O, ptr noundef %P3) #0 !dbg !659 {
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
    #dbg_declare(ptr %p.addr, !664, !DIExpression(), !665)
  store ptr %P1, ptr %P1.addr, align 4
    #dbg_declare(ptr %P1.addr, !666, !DIExpression(), !667)
  store ptr %P2, ptr %P2.addr, align 4
    #dbg_declare(ptr %P2.addr, !668, !DIExpression(), !669)
  store ptr %O, ptr %O.addr, align 4
    #dbg_declare(ptr %O.addr, !670, !DIExpression(), !671)
  store ptr %P3, ptr %P3.addr, align 4
    #dbg_declare(ptr %P3.addr, !672, !DIExpression(), !673)
    #dbg_declare(ptr %m_vec_limbs, !674, !DIExpression(), !675)
  %0 = load ptr, ptr %p.addr, align 4, !dbg !676
  %m_vec_limbs1 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %0, i32 0, i32 21, !dbg !677
  %1 = load i32, ptr %m_vec_limbs1, align 4, !dbg !677
  store i32 %1, ptr %m_vec_limbs, align 4, !dbg !675
    #dbg_declare(ptr %param_v, !678, !DIExpression(), !679)
  %2 = load ptr, ptr %p.addr, align 4, !dbg !680
  %n = getelementptr inbounds nuw %struct.mayo_params_t, ptr %2, i32 0, i32 1, !dbg !681
  %3 = load i32, ptr %n, align 4, !dbg !681
  %4 = load ptr, ptr %p.addr, align 4, !dbg !680
  %o = getelementptr inbounds nuw %struct.mayo_params_t, ptr %4, i32 0, i32 2, !dbg !681
  %5 = load i32, ptr %o, align 4, !dbg !681
  %sub = sub nsw i32 %3, %5, !dbg !681
  store i32 %sub, ptr %param_v, align 4, !dbg !679
    #dbg_declare(ptr %param_o, !682, !DIExpression(), !683)
  %6 = load ptr, ptr %p.addr, align 4, !dbg !684
  %o2 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %6, i32 0, i32 2, !dbg !685
  %7 = load i32, ptr %o2, align 4, !dbg !685
  store i32 %7, ptr %param_o, align 4, !dbg !683
  %8 = load ptr, ptr %p.addr, align 4, !dbg !686
  %9 = load ptr, ptr %P1.addr, align 4, !dbg !687
  %10 = load ptr, ptr %O.addr, align 4, !dbg !688
  %11 = load ptr, ptr %P2.addr, align 4, !dbg !689
  call void @P1_times_O(ptr noundef %8, ptr noundef %9, ptr noundef %10, ptr noundef %11) #5, !dbg !690
  %12 = load i32, ptr %m_vec_limbs, align 4, !dbg !691
  %13 = load ptr, ptr %O.addr, align 4, !dbg !692
  %14 = load ptr, ptr %P2.addr, align 4, !dbg !693
  %15 = load ptr, ptr %P3.addr, align 4, !dbg !694
  %16 = load i32, ptr %param_v, align 4, !dbg !695
  %17 = load i32, ptr %param_o, align 4, !dbg !696
  %18 = load i32, ptr %param_o, align 4, !dbg !697
  call void @mul_add_mat_trans_x_m_mat(i32 noundef %12, ptr noundef %13, ptr noundef %14, ptr noundef %15, i32 noundef %16, i32 noundef %17, i32 noundef %18) #5, !dbg !698
  ret void, !dbg !699
}

declare dso_local ptr @memcpy(ptr noundef, ptr noundef, i32 noundef) #4

declare dso_local void @m_upper(ptr noundef, ptr noundef, ptr noundef, i32 noundef) #4

; Function Attrs: noinline nounwind optnone
define internal void @pack_m_vecs(ptr noundef %in, ptr noundef %out, i32 noundef %vecs, i32 noundef %m) #0 !dbg !700 {
entry:
  %in.addr = alloca ptr, align 4
  %out.addr = alloca ptr, align 4
  %vecs.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %m_vec_limbs = alloca i32, align 4
  %_in = alloca ptr, align 4
  %i = alloca i32, align 4
  store ptr %in, ptr %in.addr, align 4
    #dbg_declare(ptr %in.addr, !703, !DIExpression(), !704)
  store ptr %out, ptr %out.addr, align 4
    #dbg_declare(ptr %out.addr, !705, !DIExpression(), !706)
  store i32 %vecs, ptr %vecs.addr, align 4
    #dbg_declare(ptr %vecs.addr, !707, !DIExpression(), !708)
  store i32 %m, ptr %m.addr, align 4
    #dbg_declare(ptr %m.addr, !709, !DIExpression(), !710)
    #dbg_declare(ptr %m_vec_limbs, !711, !DIExpression(), !712)
  %0 = load i32, ptr %m.addr, align 4, !dbg !713
  %add = add nsw i32 %0, 15, !dbg !714
  %div = sdiv i32 %add, 16, !dbg !715
  store i32 %div, ptr %m_vec_limbs, align 4, !dbg !712
    #dbg_declare(ptr %_in, !716, !DIExpression(), !717)
  %1 = load ptr, ptr %in.addr, align 4, !dbg !718
  store ptr %1, ptr %_in, align 4, !dbg !717
    #dbg_declare(ptr %i, !719, !DIExpression(), !721)
  store i32 0, ptr %i, align 4, !dbg !721
  br label %for.cond, !dbg !722

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, ptr %i, align 4, !dbg !723
  %3 = load i32, ptr %vecs.addr, align 4, !dbg !725
  %cmp = icmp slt i32 %2, %3, !dbg !726
  br i1 %cmp, label %for.body, label %for.end, !dbg !727

for.body:                                         ; preds = %for.cond
  %4 = load ptr, ptr %out.addr, align 4, !dbg !728
  %5 = load i32, ptr %i, align 4, !dbg !730
  %6 = load i32, ptr %m.addr, align 4, !dbg !731
  %mul = mul nsw i32 %5, %6, !dbg !732
  %div1 = sdiv i32 %mul, 2, !dbg !733
  %add.ptr = getelementptr inbounds i8, ptr %4, i32 %div1, !dbg !734
  %7 = load ptr, ptr %_in, align 4, !dbg !735
  %8 = load i32, ptr %i, align 4, !dbg !736
  %9 = load i32, ptr %m_vec_limbs, align 4, !dbg !737
  %mul2 = mul nsw i32 %8, %9, !dbg !738
  %mul3 = mul i32 %mul2, 8, !dbg !739
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %7, i32 %mul3, !dbg !740
  %10 = load i32, ptr %m.addr, align 4, !dbg !741
  %div5 = sdiv i32 %10, 2, !dbg !742
  %call = call ptr @memmove(ptr noundef %add.ptr, ptr noundef %add.ptr4, i32 noundef %div5) #5, !dbg !743
  br label %for.inc, !dbg !744

for.inc:                                          ; preds = %for.body
  %11 = load i32, ptr %i, align 4, !dbg !745
  %inc = add nsw i32 %11, 1, !dbg !745
  store i32 %inc, ptr %i, align 4, !dbg !745
  br label %for.cond, !dbg !746, !llvm.loop !747

for.end:                                          ; preds = %for.cond
  ret void, !dbg !749
}

declare dso_local void @mayo_secure_clear(ptr noundef, i32 noundef) #4

declare dso_local ptr @memmove(ptr noundef, ptr noundef, i32 noundef) #4

; Function Attrs: noinline nounwind optnone
define internal void @P1_times_O(ptr noundef %p, ptr noundef %P1, ptr noundef %O, ptr noundef %acc) #0 !dbg !750 {
entry:
  %p.addr = alloca ptr, align 4
  %P1.addr = alloca ptr, align 4
  %O.addr = alloca ptr, align 4
  %acc.addr = alloca ptr, align 4
  store ptr %p, ptr %p.addr, align 4
    #dbg_declare(ptr %p.addr, !753, !DIExpression(), !754)
  store ptr %P1, ptr %P1.addr, align 4
    #dbg_declare(ptr %P1.addr, !755, !DIExpression(), !756)
  store ptr %O, ptr %O.addr, align 4
    #dbg_declare(ptr %O.addr, !757, !DIExpression(), !758)
  store ptr %acc, ptr %acc.addr, align 4
    #dbg_declare(ptr %acc.addr, !759, !DIExpression(), !760)
  %0 = load ptr, ptr %p.addr, align 4, !dbg !761
  %m_vec_limbs = getelementptr inbounds nuw %struct.mayo_params_t, ptr %0, i32 0, i32 21, !dbg !762
  %1 = load i32, ptr %m_vec_limbs, align 4, !dbg !762
  %2 = load ptr, ptr %P1.addr, align 4, !dbg !763
  %3 = load ptr, ptr %O.addr, align 4, !dbg !764
  %4 = load ptr, ptr %acc.addr, align 4, !dbg !765
  %5 = load ptr, ptr %p.addr, align 4, !dbg !766
  %n = getelementptr inbounds nuw %struct.mayo_params_t, ptr %5, i32 0, i32 1, !dbg !767
  %6 = load i32, ptr %n, align 4, !dbg !767
  %7 = load ptr, ptr %p.addr, align 4, !dbg !766
  %o = getelementptr inbounds nuw %struct.mayo_params_t, ptr %7, i32 0, i32 2, !dbg !767
  %8 = load i32, ptr %o, align 4, !dbg !767
  %sub = sub nsw i32 %6, %8, !dbg !767
  %9 = load ptr, ptr %p.addr, align 4, !dbg !768
  %n1 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %9, i32 0, i32 1, !dbg !769
  %10 = load i32, ptr %n1, align 4, !dbg !769
  %11 = load ptr, ptr %p.addr, align 4, !dbg !768
  %o2 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %11, i32 0, i32 2, !dbg !769
  %12 = load i32, ptr %o2, align 4, !dbg !769
  %sub3 = sub nsw i32 %10, %12, !dbg !769
  %13 = load ptr, ptr %p.addr, align 4, !dbg !770
  %o4 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %13, i32 0, i32 2, !dbg !771
  %14 = load i32, ptr %o4, align 4, !dbg !771
  call void @mul_add_m_upper_triangular_mat_x_mat(i32 noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, i32 noundef %sub, i32 noundef %sub3, i32 noundef %14, i32 noundef 1) #5, !dbg !772
  ret void, !dbg !773
}

; Function Attrs: noinline nounwind optnone
define internal void @mul_add_mat_trans_x_m_mat(i32 noundef %m_vec_limbs, ptr noundef %mat, ptr noundef %bs_mat, ptr noundef %acc, i32 noundef %mat_rows, i32 noundef %mat_cols, i32 noundef %bs_mat_cols) #0 !dbg !774 {
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
    #dbg_declare(ptr %m_vec_limbs.addr, !777, !DIExpression(), !778)
  store ptr %mat, ptr %mat.addr, align 4
    #dbg_declare(ptr %mat.addr, !779, !DIExpression(), !780)
  store ptr %bs_mat, ptr %bs_mat.addr, align 4
    #dbg_declare(ptr %bs_mat.addr, !781, !DIExpression(), !782)
  store ptr %acc, ptr %acc.addr, align 4
    #dbg_declare(ptr %acc.addr, !783, !DIExpression(), !784)
  store i32 %mat_rows, ptr %mat_rows.addr, align 4
    #dbg_declare(ptr %mat_rows.addr, !785, !DIExpression(), !786)
  store i32 %mat_cols, ptr %mat_cols.addr, align 4
    #dbg_declare(ptr %mat_cols.addr, !787, !DIExpression(), !788)
  store i32 %bs_mat_cols, ptr %bs_mat_cols.addr, align 4
    #dbg_declare(ptr %bs_mat_cols.addr, !789, !DIExpression(), !790)
    #dbg_declare(ptr %r, !791, !DIExpression(), !793)
  store i32 0, ptr %r, align 4, !dbg !793
  br label %for.cond, !dbg !794

for.cond:                                         ; preds = %for.inc17, %entry
  %0 = load i32, ptr %r, align 4, !dbg !795
  %1 = load i32, ptr %mat_cols.addr, align 4, !dbg !797
  %cmp = icmp slt i32 %0, %1, !dbg !798
  br i1 %cmp, label %for.body, label %for.end19, !dbg !799

for.body:                                         ; preds = %for.cond
    #dbg_declare(ptr %c, !800, !DIExpression(), !803)
  store i32 0, ptr %c, align 4, !dbg !803
  br label %for.cond1, !dbg !804

for.cond1:                                        ; preds = %for.inc15, %for.body
  %2 = load i32, ptr %c, align 4, !dbg !805
  %3 = load i32, ptr %mat_rows.addr, align 4, !dbg !807
  %cmp2 = icmp slt i32 %2, %3, !dbg !808
  br i1 %cmp2, label %for.body3, label %for.end16, !dbg !809

for.body3:                                        ; preds = %for.cond1
    #dbg_declare(ptr %k, !810, !DIExpression(), !813)
  store i32 0, ptr %k, align 4, !dbg !813
  br label %for.cond4, !dbg !814

for.cond4:                                        ; preds = %for.inc, %for.body3
  %4 = load i32, ptr %k, align 4, !dbg !815
  %5 = load i32, ptr %bs_mat_cols.addr, align 4, !dbg !817
  %cmp5 = icmp slt i32 %4, %5, !dbg !818
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !819

for.body6:                                        ; preds = %for.cond4
  %6 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !820
  %7 = load ptr, ptr %bs_mat.addr, align 4, !dbg !822
  %8 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !823
  %9 = load i32, ptr %c, align 4, !dbg !824
  %10 = load i32, ptr %bs_mat_cols.addr, align 4, !dbg !825
  %mul = mul nsw i32 %9, %10, !dbg !826
  %11 = load i32, ptr %k, align 4, !dbg !827
  %add = add nsw i32 %mul, %11, !dbg !828
  %mul7 = mul nsw i32 %8, %add, !dbg !829
  %add.ptr = getelementptr inbounds i64, ptr %7, i32 %mul7, !dbg !830
  %12 = load ptr, ptr %mat.addr, align 4, !dbg !831
  %13 = load i32, ptr %c, align 4, !dbg !832
  %14 = load i32, ptr %mat_cols.addr, align 4, !dbg !833
  %mul8 = mul nsw i32 %13, %14, !dbg !834
  %15 = load i32, ptr %r, align 4, !dbg !835
  %add9 = add nsw i32 %mul8, %15, !dbg !836
  %arrayidx = getelementptr inbounds i8, ptr %12, i32 %add9, !dbg !831
  %16 = load i8, ptr %arrayidx, align 1, !dbg !831
  %17 = load ptr, ptr %acc.addr, align 4, !dbg !837
  %18 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !838
  %19 = load i32, ptr %r, align 4, !dbg !839
  %20 = load i32, ptr %bs_mat_cols.addr, align 4, !dbg !840
  %mul10 = mul nsw i32 %19, %20, !dbg !841
  %21 = load i32, ptr %k, align 4, !dbg !842
  %add11 = add nsw i32 %mul10, %21, !dbg !843
  %mul12 = mul nsw i32 %18, %add11, !dbg !844
  %add.ptr13 = getelementptr inbounds i64, ptr %17, i32 %mul12, !dbg !845
  call void @m_vec_mul_add(i32 noundef %6, ptr noundef %add.ptr, i8 noundef zeroext %16, ptr noundef %add.ptr13) #5, !dbg !846
  br label %for.inc, !dbg !847

for.inc:                                          ; preds = %for.body6
  %22 = load i32, ptr %k, align 4, !dbg !848
  %add14 = add nsw i32 %22, 1, !dbg !848
  store i32 %add14, ptr %k, align 4, !dbg !848
  br label %for.cond4, !dbg !849, !llvm.loop !850

for.end:                                          ; preds = %for.cond4
  br label %for.inc15, !dbg !852

for.inc15:                                        ; preds = %for.end
  %23 = load i32, ptr %c, align 4, !dbg !853
  %inc = add nsw i32 %23, 1, !dbg !853
  store i32 %inc, ptr %c, align 4, !dbg !853
  br label %for.cond1, !dbg !854, !llvm.loop !855

for.end16:                                        ; preds = %for.cond1
  br label %for.inc17, !dbg !857

for.inc17:                                        ; preds = %for.end16
  %24 = load i32, ptr %r, align 4, !dbg !858
  %inc18 = add nsw i32 %24, 1, !dbg !858
  store i32 %inc18, ptr %r, align 4, !dbg !858
  br label %for.cond, !dbg !859, !llvm.loop !860

for.end19:                                        ; preds = %for.cond
  ret void, !dbg !862
}

; Function Attrs: noinline nounwind optnone
define internal void @m_vec_mul_add(i32 noundef %m_vec_limbs, ptr noundef %in, i8 noundef zeroext %a, ptr noundef %acc) #0 !dbg !863 {
entry:
  %m_vec_limbs.addr = alloca i32, align 4
  %in.addr = alloca ptr, align 4
  %a.addr = alloca i8, align 1
  %acc.addr = alloca ptr, align 4
  %i = alloca i32, align 4
  store i32 %m_vec_limbs, ptr %m_vec_limbs.addr, align 4
    #dbg_declare(ptr %m_vec_limbs.addr, !867, !DIExpression(), !868)
  store ptr %in, ptr %in.addr, align 4
    #dbg_declare(ptr %in.addr, !869, !DIExpression(), !870)
  store i8 %a, ptr %a.addr, align 1
    #dbg_declare(ptr %a.addr, !871, !DIExpression(), !872)
  store ptr %acc, ptr %acc.addr, align 4
    #dbg_declare(ptr %acc.addr, !873, !DIExpression(), !874)
    #dbg_declare(ptr %i, !875, !DIExpression(), !877)
  store i32 0, ptr %i, align 4, !dbg !877
  br label %for.cond, !dbg !878

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4, !dbg !879
  %1 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !881
  %cmp = icmp slt i32 %0, %1, !dbg !882
  br i1 %cmp, label %for.body, label %for.end, !dbg !883

for.body:                                         ; preds = %for.cond
  %2 = load ptr, ptr %in.addr, align 4, !dbg !884
  %3 = load i32, ptr %i, align 4, !dbg !886
  %arrayidx = getelementptr inbounds i64, ptr %2, i32 %3, !dbg !884
  %4 = load i64, ptr %arrayidx, align 8, !dbg !884
  %5 = load i8, ptr %a.addr, align 1, !dbg !887
  %call = call i64 @gf16v_mul_u64(i64 noundef %4, i8 noundef zeroext %5) #5, !dbg !888
  %6 = load ptr, ptr %acc.addr, align 4, !dbg !889
  %7 = load i32, ptr %i, align 4, !dbg !890
  %arrayidx1 = getelementptr inbounds i64, ptr %6, i32 %7, !dbg !889
  %8 = load i64, ptr %arrayidx1, align 8, !dbg !891
  %xor = xor i64 %8, %call, !dbg !891
  store i64 %xor, ptr %arrayidx1, align 8, !dbg !891
  br label %for.inc, !dbg !892

for.inc:                                          ; preds = %for.body
  %9 = load i32, ptr %i, align 4, !dbg !893
  %inc = add nsw i32 %9, 1, !dbg !893
  store i32 %inc, ptr %i, align 4, !dbg !893
  br label %for.cond, !dbg !894, !llvm.loop !895

for.end:                                          ; preds = %for.cond
  ret void, !dbg !897
}

; Function Attrs: noinline nounwind optnone
define internal i64 @gf16v_mul_u64(i64 noundef %a, i8 noundef zeroext %b) #0 !dbg !898 {
entry:
  %a.addr = alloca i64, align 8
  %b.addr = alloca i8, align 1
  %mask_msb = alloca i64, align 8
  %a_msb = alloca i64, align 8
  %a64 = alloca i64, align 8
  %b32 = alloca i64, align 8
  %r64 = alloca i64, align 8
  store i64 %a, ptr %a.addr, align 8
    #dbg_declare(ptr %a.addr, !902, !DIExpression(), !903)
  store i8 %b, ptr %b.addr, align 1
    #dbg_declare(ptr %b.addr, !904, !DIExpression(), !905)
    #dbg_declare(ptr %mask_msb, !906, !DIExpression(), !907)
  store i64 -8608480567731124088, ptr %mask_msb, align 8, !dbg !907
    #dbg_declare(ptr %a_msb, !908, !DIExpression(), !909)
    #dbg_declare(ptr %a64, !910, !DIExpression(), !911)
  %0 = load i64, ptr %a.addr, align 8, !dbg !912
  store i64 %0, ptr %a64, align 8, !dbg !911
    #dbg_declare(ptr %b32, !913, !DIExpression(), !914)
  %1 = load i8, ptr %b.addr, align 1, !dbg !915
  %conv = zext i8 %1 to i32, !dbg !915
  %2 = load volatile i8, ptr @unsigned_char_blocker, align 1, !dbg !916
  %conv1 = zext i8 %2 to i32, !dbg !916
  %xor = xor i32 %conv, %conv1, !dbg !917
  %conv2 = sext i32 %xor to i64, !dbg !915
  store i64 %conv2, ptr %b32, align 8, !dbg !914
    #dbg_declare(ptr %r64, !918, !DIExpression(), !919)
  %3 = load i64, ptr %a64, align 8, !dbg !920
  %4 = load i64, ptr %b32, align 8, !dbg !921
  %and = and i64 %4, 1, !dbg !922
  %mul = mul i64 %3, %and, !dbg !923
  store i64 %mul, ptr %r64, align 8, !dbg !919
  %5 = load i64, ptr %a64, align 8, !dbg !924
  %6 = load i64, ptr %mask_msb, align 8, !dbg !925
  %and3 = and i64 %5, %6, !dbg !926
  store i64 %and3, ptr %a_msb, align 8, !dbg !927
  %7 = load i64, ptr %a_msb, align 8, !dbg !928
  %8 = load i64, ptr %a64, align 8, !dbg !929
  %xor4 = xor i64 %8, %7, !dbg !929
  store i64 %xor4, ptr %a64, align 8, !dbg !929
  %9 = load i64, ptr %a64, align 8, !dbg !930
  %shl = shl i64 %9, 1, !dbg !931
  %10 = load i64, ptr %a_msb, align 8, !dbg !932
  %shr = lshr i64 %10, 3, !dbg !933
  %mul5 = mul i64 %shr, 3, !dbg !934
  %xor6 = xor i64 %shl, %mul5, !dbg !935
  store i64 %xor6, ptr %a64, align 8, !dbg !936
  %11 = load i64, ptr %a64, align 8, !dbg !937
  %12 = load i64, ptr %b32, align 8, !dbg !938
  %shr7 = lshr i64 %12, 1, !dbg !939
  %and8 = and i64 %shr7, 1, !dbg !940
  %mul9 = mul i64 %11, %and8, !dbg !941
  %13 = load i64, ptr %r64, align 8, !dbg !942
  %xor10 = xor i64 %13, %mul9, !dbg !942
  store i64 %xor10, ptr %r64, align 8, !dbg !942
  %14 = load i64, ptr %a64, align 8, !dbg !943
  %15 = load i64, ptr %mask_msb, align 8, !dbg !944
  %and11 = and i64 %14, %15, !dbg !945
  store i64 %and11, ptr %a_msb, align 8, !dbg !946
  %16 = load i64, ptr %a_msb, align 8, !dbg !947
  %17 = load i64, ptr %a64, align 8, !dbg !948
  %xor12 = xor i64 %17, %16, !dbg !948
  store i64 %xor12, ptr %a64, align 8, !dbg !948
  %18 = load i64, ptr %a64, align 8, !dbg !949
  %shl13 = shl i64 %18, 1, !dbg !950
  %19 = load i64, ptr %a_msb, align 8, !dbg !951
  %shr14 = lshr i64 %19, 3, !dbg !952
  %mul15 = mul i64 %shr14, 3, !dbg !953
  %xor16 = xor i64 %shl13, %mul15, !dbg !954
  store i64 %xor16, ptr %a64, align 8, !dbg !955
  %20 = load i64, ptr %a64, align 8, !dbg !956
  %21 = load i64, ptr %b32, align 8, !dbg !957
  %shr17 = lshr i64 %21, 2, !dbg !958
  %and18 = and i64 %shr17, 1, !dbg !959
  %mul19 = mul i64 %20, %and18, !dbg !960
  %22 = load i64, ptr %r64, align 8, !dbg !961
  %xor20 = xor i64 %22, %mul19, !dbg !961
  store i64 %xor20, ptr %r64, align 8, !dbg !961
  %23 = load i64, ptr %a64, align 8, !dbg !962
  %24 = load i64, ptr %mask_msb, align 8, !dbg !963
  %and21 = and i64 %23, %24, !dbg !964
  store i64 %and21, ptr %a_msb, align 8, !dbg !965
  %25 = load i64, ptr %a_msb, align 8, !dbg !966
  %26 = load i64, ptr %a64, align 8, !dbg !967
  %xor22 = xor i64 %26, %25, !dbg !967
  store i64 %xor22, ptr %a64, align 8, !dbg !967
  %27 = load i64, ptr %a64, align 8, !dbg !968
  %shl23 = shl i64 %27, 1, !dbg !969
  %28 = load i64, ptr %a_msb, align 8, !dbg !970
  %shr24 = lshr i64 %28, 3, !dbg !971
  %mul25 = mul i64 %shr24, 3, !dbg !972
  %xor26 = xor i64 %shl23, %mul25, !dbg !973
  store i64 %xor26, ptr %a64, align 8, !dbg !974
  %29 = load i64, ptr %a64, align 8, !dbg !975
  %30 = load i64, ptr %b32, align 8, !dbg !976
  %shr27 = lshr i64 %30, 3, !dbg !977
  %and28 = and i64 %shr27, 1, !dbg !978
  %mul29 = mul i64 %29, %and28, !dbg !979
  %31 = load i64, ptr %r64, align 8, !dbg !980
  %xor30 = xor i64 %31, %mul29, !dbg !980
  store i64 %xor30, ptr %r64, align 8, !dbg !980
  %32 = load i64, ptr %r64, align 8, !dbg !981
  ret i64 %32, !dbg !982
}

; Function Attrs: noinline nounwind optnone
define internal void @mul_add_m_upper_triangular_mat_x_mat(i32 noundef %m_vec_limbs, ptr noundef %bs_mat, ptr noundef %mat, ptr noundef %acc, i32 noundef %bs_mat_rows, i32 noundef %bs_mat_cols, i32 noundef %mat_cols, i32 noundef %triangular) #0 !dbg !983 {
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
    #dbg_declare(ptr %m_vec_limbs.addr, !986, !DIExpression(), !987)
  store ptr %bs_mat, ptr %bs_mat.addr, align 4
    #dbg_declare(ptr %bs_mat.addr, !988, !DIExpression(), !989)
  store ptr %mat, ptr %mat.addr, align 4
    #dbg_declare(ptr %mat.addr, !990, !DIExpression(), !991)
  store ptr %acc, ptr %acc.addr, align 4
    #dbg_declare(ptr %acc.addr, !992, !DIExpression(), !993)
  store i32 %bs_mat_rows, ptr %bs_mat_rows.addr, align 4
    #dbg_declare(ptr %bs_mat_rows.addr, !994, !DIExpression(), !995)
  store i32 %bs_mat_cols, ptr %bs_mat_cols.addr, align 4
    #dbg_declare(ptr %bs_mat_cols.addr, !996, !DIExpression(), !997)
  store i32 %mat_cols, ptr %mat_cols.addr, align 4
    #dbg_declare(ptr %mat_cols.addr, !998, !DIExpression(), !999)
  store i32 %triangular, ptr %triangular.addr, align 4
    #dbg_declare(ptr %triangular.addr, !1000, !DIExpression(), !1001)
    #dbg_declare(ptr %bs_mat_entries_used, !1002, !DIExpression(), !1003)
  store i32 0, ptr %bs_mat_entries_used, align 4, !dbg !1003
    #dbg_declare(ptr %r, !1004, !DIExpression(), !1006)
  store i32 0, ptr %r, align 4, !dbg !1006
  br label %for.cond, !dbg !1007

for.cond:                                         ; preds = %for.inc17, %entry
  %0 = load i32, ptr %r, align 4, !dbg !1008
  %1 = load i32, ptr %bs_mat_rows.addr, align 4, !dbg !1010
  %cmp = icmp slt i32 %0, %1, !dbg !1011
  br i1 %cmp, label %for.body, label %for.end19, !dbg !1012

for.body:                                         ; preds = %for.cond
    #dbg_declare(ptr %c, !1013, !DIExpression(), !1016)
  %2 = load i32, ptr %triangular.addr, align 4, !dbg !1017
  %3 = load i32, ptr %r, align 4, !dbg !1018
  %mul = mul nsw i32 %2, %3, !dbg !1019
  store i32 %mul, ptr %c, align 4, !dbg !1016
  br label %for.cond1, !dbg !1020

for.cond1:                                        ; preds = %for.inc15, %for.body
  %4 = load i32, ptr %c, align 4, !dbg !1021
  %5 = load i32, ptr %bs_mat_cols.addr, align 4, !dbg !1023
  %cmp2 = icmp slt i32 %4, %5, !dbg !1024
  br i1 %cmp2, label %for.body3, label %for.end16, !dbg !1025

for.body3:                                        ; preds = %for.cond1
    #dbg_declare(ptr %k, !1026, !DIExpression(), !1029)
  store i32 0, ptr %k, align 4, !dbg !1029
  br label %for.cond4, !dbg !1030

for.cond4:                                        ; preds = %for.inc, %for.body3
  %6 = load i32, ptr %k, align 4, !dbg !1031
  %7 = load i32, ptr %mat_cols.addr, align 4, !dbg !1033
  %cmp5 = icmp slt i32 %6, %7, !dbg !1034
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !1035

for.body6:                                        ; preds = %for.cond4
  %8 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !1036
  %9 = load ptr, ptr %bs_mat.addr, align 4, !dbg !1038
  %10 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !1039
  %11 = load i32, ptr %bs_mat_entries_used, align 4, !dbg !1040
  %mul7 = mul nsw i32 %10, %11, !dbg !1041
  %add.ptr = getelementptr inbounds i64, ptr %9, i32 %mul7, !dbg !1042
  %12 = load ptr, ptr %mat.addr, align 4, !dbg !1043
  %13 = load i32, ptr %c, align 4, !dbg !1044
  %14 = load i32, ptr %mat_cols.addr, align 4, !dbg !1045
  %mul8 = mul nsw i32 %13, %14, !dbg !1046
  %15 = load i32, ptr %k, align 4, !dbg !1047
  %add = add nsw i32 %mul8, %15, !dbg !1048
  %arrayidx = getelementptr inbounds i8, ptr %12, i32 %add, !dbg !1043
  %16 = load i8, ptr %arrayidx, align 1, !dbg !1043
  %17 = load ptr, ptr %acc.addr, align 4, !dbg !1049
  %18 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !1050
  %19 = load i32, ptr %r, align 4, !dbg !1051
  %20 = load i32, ptr %mat_cols.addr, align 4, !dbg !1052
  %mul9 = mul nsw i32 %19, %20, !dbg !1053
  %21 = load i32, ptr %k, align 4, !dbg !1054
  %add10 = add nsw i32 %mul9, %21, !dbg !1055
  %mul11 = mul nsw i32 %18, %add10, !dbg !1056
  %add.ptr12 = getelementptr inbounds i64, ptr %17, i32 %mul11, !dbg !1057
  call void @m_vec_mul_add(i32 noundef %8, ptr noundef %add.ptr, i8 noundef zeroext %16, ptr noundef %add.ptr12) #5, !dbg !1058
  br label %for.inc, !dbg !1059

for.inc:                                          ; preds = %for.body6
  %22 = load i32, ptr %k, align 4, !dbg !1060
  %add13 = add nsw i32 %22, 1, !dbg !1060
  store i32 %add13, ptr %k, align 4, !dbg !1060
  br label %for.cond4, !dbg !1061, !llvm.loop !1062

for.end:                                          ; preds = %for.cond4
  %23 = load i32, ptr %bs_mat_entries_used, align 4, !dbg !1064
  %add14 = add nsw i32 %23, 1, !dbg !1064
  store i32 %add14, ptr %bs_mat_entries_used, align 4, !dbg !1064
  br label %for.inc15, !dbg !1065

for.inc15:                                        ; preds = %for.end
  %24 = load i32, ptr %c, align 4, !dbg !1066
  %inc = add nsw i32 %24, 1, !dbg !1066
  store i32 %inc, ptr %c, align 4, !dbg !1066
  br label %for.cond1, !dbg !1067, !llvm.loop !1068

for.end16:                                        ; preds = %for.cond1
  br label %for.inc17, !dbg !1070

for.inc17:                                        ; preds = %for.end16
  %25 = load i32, ptr %r, align 4, !dbg !1071
  %inc18 = add nsw i32 %25, 1, !dbg !1071
  store i32 %inc18, ptr %r, align 4, !dbg !1071
  br label %for.cond, !dbg !1072, !llvm.loop !1073

for.end19:                                        ; preds = %for.cond
  ret void, !dbg !1075
}

declare dso_local i32 @AES_128_CTR(ptr noundef, i32 noundef, ptr noundef, i32 noundef) #4

; Function Attrs: noinline nounwind optnone
define internal void @unpack_m_vecs(ptr noundef %in, ptr noundef %out, i32 noundef %vecs, i32 noundef %m) #0 !dbg !1076 {
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
    #dbg_declare(ptr %in.addr, !1079, !DIExpression(), !1080)
  store ptr %out, ptr %out.addr, align 4
    #dbg_declare(ptr %out.addr, !1081, !DIExpression(), !1082)
  store i32 %vecs, ptr %vecs.addr, align 4
    #dbg_declare(ptr %vecs.addr, !1083, !DIExpression(), !1084)
  store i32 %m, ptr %m.addr, align 4
    #dbg_declare(ptr %m.addr, !1085, !DIExpression(), !1086)
    #dbg_declare(ptr %m_vec_limbs, !1087, !DIExpression(), !1088)
  %0 = load i32, ptr %m.addr, align 4, !dbg !1089
  %add = add nsw i32 %0, 15, !dbg !1090
  %div = sdiv i32 %add, 16, !dbg !1091
  store i32 %div, ptr %m_vec_limbs, align 4, !dbg !1088
    #dbg_declare(ptr %_out, !1092, !DIExpression(), !1093)
  %1 = load ptr, ptr %out.addr, align 4, !dbg !1094
  store ptr %1, ptr %_out, align 4, !dbg !1093
    #dbg_declare(ptr %tmp, !1095, !DIExpression(), !1099)
  call void @llvm.memset.p0.i32(ptr align 8 %tmp, i8 0, i32 72, i1 false), !dbg !1099
    #dbg_declare(ptr %i, !1100, !DIExpression(), !1102)
  %2 = load i32, ptr %vecs.addr, align 4, !dbg !1103
  %sub = sub nsw i32 %2, 1, !dbg !1104
  store i32 %sub, ptr %i, align 4, !dbg !1102
  br label %for.cond, !dbg !1105

for.cond:                                         ; preds = %for.inc, %entry
  %3 = load i32, ptr %i, align 4, !dbg !1106
  %cmp = icmp sge i32 %3, 0, !dbg !1108
  br i1 %cmp, label %for.body, label %for.end, !dbg !1109

for.body:                                         ; preds = %for.cond
  %arraydecay = getelementptr inbounds [9 x i64], ptr %tmp, i32 0, i32 0, !dbg !1110
  %4 = load ptr, ptr %in.addr, align 4, !dbg !1112
  %5 = load i32, ptr %i, align 4, !dbg !1113
  %6 = load i32, ptr %m.addr, align 4, !dbg !1114
  %mul = mul nsw i32 %5, %6, !dbg !1115
  %div1 = sdiv i32 %mul, 2, !dbg !1116
  %add.ptr = getelementptr inbounds i8, ptr %4, i32 %div1, !dbg !1117
  %7 = load i32, ptr %m.addr, align 4, !dbg !1118
  %div2 = sdiv i32 %7, 2, !dbg !1119
  %call = call ptr @memcpy(ptr noundef %arraydecay, ptr noundef %add.ptr, i32 noundef %div2) #5, !dbg !1120
  %8 = load ptr, ptr %_out, align 4, !dbg !1121
  %9 = load i32, ptr %i, align 4, !dbg !1122
  %10 = load i32, ptr %m_vec_limbs, align 4, !dbg !1123
  %mul3 = mul nsw i32 %9, %10, !dbg !1124
  %mul4 = mul i32 %mul3, 8, !dbg !1125
  %add.ptr5 = getelementptr inbounds nuw i8, ptr %8, i32 %mul4, !dbg !1126
  %arraydecay6 = getelementptr inbounds [9 x i64], ptr %tmp, i32 0, i32 0, !dbg !1127
  %11 = load i32, ptr %m_vec_limbs, align 4, !dbg !1128
  %mul7 = mul i32 %11, 8, !dbg !1129
  %call8 = call ptr @memcpy(ptr noundef %add.ptr5, ptr noundef %arraydecay6, i32 noundef %mul7) #5, !dbg !1130
  br label %for.inc, !dbg !1131

for.inc:                                          ; preds = %for.body
  %12 = load i32, ptr %i, align 4, !dbg !1132
  %dec = add nsw i32 %12, -1, !dbg !1132
  store i32 %dec, ptr %i, align 4, !dbg !1132
  br label %for.cond, !dbg !1133, !llvm.loop !1134

for.end:                                          ; preds = %for.cond
  ret void, !dbg !1136
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @mayo_expand_sk(ptr noundef %p, ptr noundef %csk, ptr noundef %sk) #0 !dbg !1137 {
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
    #dbg_declare(ptr %p.addr, !1146, !DIExpression(), !1147)
  store ptr %csk, ptr %csk.addr, align 4
    #dbg_declare(ptr %csk.addr, !1148, !DIExpression(), !1149)
  store ptr %sk, ptr %sk.addr, align 4
    #dbg_declare(ptr %sk.addr, !1150, !DIExpression(), !1151)
    #dbg_declare(ptr %ret, !1152, !DIExpression(), !1153)
  store i32 0, ptr %ret, align 4, !dbg !1153
    #dbg_declare(ptr %S, !1154, !DIExpression(), !1155)
    #dbg_declare(ptr %P, !1156, !DIExpression(), !1157)
  %0 = load ptr, ptr %sk.addr, align 4, !dbg !1158
  %p1 = getelementptr inbounds nuw %struct.sk_t, ptr %0, i32 0, i32 0, !dbg !1159
  %arraydecay = getelementptr inbounds [113103 x i64], ptr %p1, i32 0, i32 0, !dbg !1158
  store ptr %arraydecay, ptr %P, align 4, !dbg !1157
    #dbg_declare(ptr %O, !1160, !DIExpression(), !1161)
  %1 = load ptr, ptr %sk.addr, align 4, !dbg !1162
  %O2 = getelementptr inbounds nuw %struct.sk_t, ptr %1, i32 0, i32 1, !dbg !1163
  %arraydecay3 = getelementptr inbounds [2414 x i8], ptr %O2, i32 0, i32 0, !dbg !1162
  store ptr %arraydecay3, ptr %O, align 4, !dbg !1161
    #dbg_declare(ptr %param_o, !1164, !DIExpression(), !1165)
  %2 = load ptr, ptr %p.addr, align 4, !dbg !1166
  %o = getelementptr inbounds nuw %struct.mayo_params_t, ptr %2, i32 0, i32 2, !dbg !1167
  %3 = load i32, ptr %o, align 4, !dbg !1167
  store i32 %3, ptr %param_o, align 4, !dbg !1165
    #dbg_declare(ptr %param_v, !1168, !DIExpression(), !1169)
  %4 = load ptr, ptr %p.addr, align 4, !dbg !1170
  %n = getelementptr inbounds nuw %struct.mayo_params_t, ptr %4, i32 0, i32 1, !dbg !1171
  %5 = load i32, ptr %n, align 4, !dbg !1171
  %6 = load ptr, ptr %p.addr, align 4, !dbg !1170
  %o4 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %6, i32 0, i32 2, !dbg !1171
  %7 = load i32, ptr %o4, align 4, !dbg !1171
  %sub = sub nsw i32 %5, %7, !dbg !1171
  store i32 %sub, ptr %param_v, align 4, !dbg !1169
    #dbg_declare(ptr %param_O_bytes, !1172, !DIExpression(), !1173)
  %8 = load ptr, ptr %p.addr, align 4, !dbg !1174
  %O_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %8, i32 0, i32 7, !dbg !1175
  %9 = load i32, ptr %O_bytes, align 4, !dbg !1175
  store i32 %9, ptr %param_O_bytes, align 4, !dbg !1173
    #dbg_declare(ptr %param_pk_seed_bytes, !1176, !DIExpression(), !1177)
  %10 = load ptr, ptr %p.addr, align 4, !dbg !1178
  %pk_seed_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %10, i32 0, i32 20, !dbg !1179
  %11 = load i32, ptr %pk_seed_bytes, align 4, !dbg !1179
  store i32 %11, ptr %param_pk_seed_bytes, align 4, !dbg !1177
    #dbg_declare(ptr %param_sk_seed_bytes, !1180, !DIExpression(), !1181)
  %12 = load ptr, ptr %p.addr, align 4, !dbg !1182
  %sk_seed_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %12, i32 0, i32 18, !dbg !1183
  %13 = load i32, ptr %sk_seed_bytes, align 4, !dbg !1183
  store i32 %13, ptr %param_sk_seed_bytes, align 4, !dbg !1181
    #dbg_declare(ptr %seed_sk, !1184, !DIExpression(), !1185)
  %14 = load ptr, ptr %csk.addr, align 4, !dbg !1186
  store ptr %14, ptr %seed_sk, align 4, !dbg !1185
    #dbg_declare(ptr %seed_pk, !1187, !DIExpression(), !1188)
  %arraydecay5 = getelementptr inbounds [868 x i8], ptr %S, i32 0, i32 0, !dbg !1189
  store ptr %arraydecay5, ptr %seed_pk, align 4, !dbg !1188
  %arraydecay6 = getelementptr inbounds [868 x i8], ptr %S, i32 0, i32 0, !dbg !1190
  %15 = load i32, ptr %param_pk_seed_bytes, align 4, !dbg !1191
  %16 = load i32, ptr %param_O_bytes, align 4, !dbg !1192
  %add = add nsw i32 %15, %16, !dbg !1193
  %17 = load ptr, ptr %seed_sk, align 4, !dbg !1194
  %18 = load i32, ptr %param_sk_seed_bytes, align 4, !dbg !1195
  %call = call i32 @shake256(ptr noundef %arraydecay6, i32 noundef %add, ptr noundef %17, i32 noundef %18) #5, !dbg !1196
  %arraydecay7 = getelementptr inbounds [868 x i8], ptr %S, i32 0, i32 0, !dbg !1197
  %19 = load i32, ptr %param_pk_seed_bytes, align 4, !dbg !1198
  %add.ptr = getelementptr inbounds i8, ptr %arraydecay7, i32 %19, !dbg !1199
  %20 = load ptr, ptr %O, align 4, !dbg !1200
  %21 = load i32, ptr %param_v, align 4, !dbg !1201
  %22 = load i32, ptr %param_o, align 4, !dbg !1202
  %mul = mul nsw i32 %21, %22, !dbg !1203
  call void @decode(ptr noundef %add.ptr, ptr noundef %20, i32 noundef %mul) #5, !dbg !1204
  %23 = load ptr, ptr %p.addr, align 4, !dbg !1205
  %24 = load ptr, ptr %P, align 4, !dbg !1206
  %25 = load ptr, ptr %seed_pk, align 4, !dbg !1207
  call void @expand_P1_P2(ptr noundef %23, ptr noundef %24, ptr noundef %25) #5, !dbg !1208
    #dbg_declare(ptr %P2, !1209, !DIExpression(), !1210)
  %26 = load ptr, ptr %P, align 4, !dbg !1211
  %27 = load ptr, ptr %p.addr, align 4, !dbg !1212
  %n8 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %27, i32 0, i32 1, !dbg !1213
  %28 = load i32, ptr %n8, align 4, !dbg !1213
  %29 = load ptr, ptr %p.addr, align 4, !dbg !1212
  %o9 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %29, i32 0, i32 2, !dbg !1213
  %30 = load i32, ptr %o9, align 4, !dbg !1213
  %sub10 = sub nsw i32 %28, %30, !dbg !1213
  %31 = load ptr, ptr %p.addr, align 4, !dbg !1212
  %n11 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %31, i32 0, i32 1, !dbg !1213
  %32 = load i32, ptr %n11, align 4, !dbg !1213
  %33 = load ptr, ptr %p.addr, align 4, !dbg !1212
  %o12 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %33, i32 0, i32 2, !dbg !1213
  %34 = load i32, ptr %o12, align 4, !dbg !1213
  %sub13 = sub nsw i32 %32, %34, !dbg !1213
  %add14 = add nsw i32 %sub13, 1, !dbg !1213
  %mul15 = mul nsw i32 %sub10, %add14, !dbg !1213
  %div = sdiv i32 %mul15, 2, !dbg !1213
  %35 = load ptr, ptr %p.addr, align 4, !dbg !1212
  %m_vec_limbs = getelementptr inbounds nuw %struct.mayo_params_t, ptr %35, i32 0, i32 21, !dbg !1213
  %36 = load i32, ptr %m_vec_limbs, align 4, !dbg !1213
  %mul16 = mul nsw i32 %div, %36, !dbg !1213
  %add.ptr17 = getelementptr inbounds i64, ptr %26, i32 %mul16, !dbg !1214
  store ptr %add.ptr17, ptr %P2, align 4, !dbg !1210
    #dbg_declare(ptr %P1, !1215, !DIExpression(), !1216)
  %37 = load ptr, ptr %P, align 4, !dbg !1217
  store ptr %37, ptr %P1, align 4, !dbg !1216
    #dbg_declare(ptr %L, !1218, !DIExpression(), !1219)
  %38 = load ptr, ptr %P2, align 4, !dbg !1220
  store ptr %38, ptr %L, align 4, !dbg !1219
  %39 = load ptr, ptr %p.addr, align 4, !dbg !1221
  %40 = load ptr, ptr %P1, align 4, !dbg !1222
  %41 = load ptr, ptr %O, align 4, !dbg !1223
  %42 = load ptr, ptr %L, align 4, !dbg !1224
  call void @P1P1t_times_O(ptr noundef %39, ptr noundef %40, ptr noundef %41, ptr noundef %42) #5, !dbg !1225
  %arraydecay18 = getelementptr inbounds [868 x i8], ptr %S, i32 0, i32 0, !dbg !1226
  call void @mayo_secure_clear(ptr noundef %arraydecay18, i32 noundef 868) #5, !dbg !1227
  %43 = load i32, ptr %ret, align 4, !dbg !1228
  ret i32 %43, !dbg !1229
}

; Function Attrs: noinline nounwind optnone
define internal void @P1P1t_times_O(ptr noundef %p, ptr noundef %P1, ptr noundef %O, ptr noundef %acc) #0 !dbg !1230 {
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
    #dbg_declare(ptr %p.addr, !1231, !DIExpression(), !1232)
  store ptr %P1, ptr %P1.addr, align 4
    #dbg_declare(ptr %P1.addr, !1233, !DIExpression(), !1234)
  store ptr %O, ptr %O.addr, align 4
    #dbg_declare(ptr %O.addr, !1235, !DIExpression(), !1236)
  store ptr %acc, ptr %acc.addr, align 4
    #dbg_declare(ptr %acc.addr, !1237, !DIExpression(), !1238)
    #dbg_declare(ptr %param_o, !1239, !DIExpression(), !1240)
  %0 = load ptr, ptr %p.addr, align 4, !dbg !1241
  %o = getelementptr inbounds nuw %struct.mayo_params_t, ptr %0, i32 0, i32 2, !dbg !1242
  %1 = load i32, ptr %o, align 4, !dbg !1242
  store i32 %1, ptr %param_o, align 4, !dbg !1240
    #dbg_declare(ptr %param_v, !1243, !DIExpression(), !1244)
  %2 = load ptr, ptr %p.addr, align 4, !dbg !1245
  %n = getelementptr inbounds nuw %struct.mayo_params_t, ptr %2, i32 0, i32 1, !dbg !1246
  %3 = load i32, ptr %n, align 4, !dbg !1246
  %4 = load ptr, ptr %p.addr, align 4, !dbg !1245
  %o1 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %4, i32 0, i32 2, !dbg !1246
  %5 = load i32, ptr %o1, align 4, !dbg !1246
  %sub = sub nsw i32 %3, %5, !dbg !1246
  store i32 %sub, ptr %param_v, align 4, !dbg !1244
    #dbg_declare(ptr %m_vec_limbs, !1247, !DIExpression(), !1248)
  %6 = load ptr, ptr %p.addr, align 4, !dbg !1249
  %m_vec_limbs2 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %6, i32 0, i32 21, !dbg !1250
  %7 = load i32, ptr %m_vec_limbs2, align 4, !dbg !1250
  store i32 %7, ptr %m_vec_limbs, align 4, !dbg !1248
    #dbg_declare(ptr %bs_mat_entries_used, !1251, !DIExpression(), !1252)
  store i32 0, ptr %bs_mat_entries_used, align 4, !dbg !1252
    #dbg_declare(ptr %r, !1253, !DIExpression(), !1255)
  store i32 0, ptr %r, align 4, !dbg !1255
  br label %for.cond, !dbg !1256

for.cond:                                         ; preds = %for.inc29, %entry
  %8 = load i32, ptr %r, align 4, !dbg !1257
  %9 = load i32, ptr %param_v, align 4, !dbg !1259
  %cmp = icmp slt i32 %8, %9, !dbg !1260
  br i1 %cmp, label %for.body, label %for.end31, !dbg !1261

for.body:                                         ; preds = %for.cond
    #dbg_declare(ptr %c, !1262, !DIExpression(), !1265)
  %10 = load i32, ptr %r, align 4, !dbg !1266
  store i32 %10, ptr %c, align 4, !dbg !1265
  br label %for.cond3, !dbg !1267

for.cond3:                                        ; preds = %for.inc27, %for.body
  %11 = load i32, ptr %c, align 4, !dbg !1268
  %12 = load i32, ptr %param_v, align 4, !dbg !1270
  %cmp4 = icmp slt i32 %11, %12, !dbg !1271
  br i1 %cmp4, label %for.body5, label %for.end28, !dbg !1272

for.body5:                                        ; preds = %for.cond3
  %13 = load i32, ptr %c, align 4, !dbg !1273
  %14 = load i32, ptr %r, align 4, !dbg !1276
  %cmp6 = icmp eq i32 %13, %14, !dbg !1277
  br i1 %cmp6, label %if.then, label %if.end, !dbg !1277

if.then:                                          ; preds = %for.body5
  %15 = load i32, ptr %bs_mat_entries_used, align 4, !dbg !1278
  %add = add nsw i32 %15, 1, !dbg !1278
  store i32 %add, ptr %bs_mat_entries_used, align 4, !dbg !1278
  br label %for.inc27, !dbg !1280

if.end:                                           ; preds = %for.body5
    #dbg_declare(ptr %k, !1281, !DIExpression(), !1283)
  store i32 0, ptr %k, align 4, !dbg !1283
  br label %for.cond7, !dbg !1284

for.cond7:                                        ; preds = %for.inc, %if.end
  %16 = load i32, ptr %k, align 4, !dbg !1285
  %17 = load i32, ptr %param_o, align 4, !dbg !1287
  %cmp8 = icmp slt i32 %16, %17, !dbg !1288
  br i1 %cmp8, label %for.body9, label %for.end, !dbg !1289

for.body9:                                        ; preds = %for.cond7
  %18 = load i32, ptr %m_vec_limbs, align 4, !dbg !1290
  %19 = load ptr, ptr %P1.addr, align 4, !dbg !1292
  %20 = load i32, ptr %m_vec_limbs, align 4, !dbg !1293
  %21 = load i32, ptr %bs_mat_entries_used, align 4, !dbg !1294
  %mul = mul nsw i32 %20, %21, !dbg !1295
  %add.ptr = getelementptr inbounds i64, ptr %19, i32 %mul, !dbg !1296
  %22 = load ptr, ptr %O.addr, align 4, !dbg !1297
  %23 = load i32, ptr %c, align 4, !dbg !1298
  %24 = load i32, ptr %param_o, align 4, !dbg !1299
  %mul10 = mul nsw i32 %23, %24, !dbg !1300
  %25 = load i32, ptr %k, align 4, !dbg !1301
  %add11 = add nsw i32 %mul10, %25, !dbg !1302
  %arrayidx = getelementptr inbounds i8, ptr %22, i32 %add11, !dbg !1297
  %26 = load i8, ptr %arrayidx, align 1, !dbg !1297
  %27 = load ptr, ptr %acc.addr, align 4, !dbg !1303
  %28 = load i32, ptr %m_vec_limbs, align 4, !dbg !1304
  %29 = load i32, ptr %r, align 4, !dbg !1305
  %30 = load i32, ptr %param_o, align 4, !dbg !1306
  %mul12 = mul nsw i32 %29, %30, !dbg !1307
  %31 = load i32, ptr %k, align 4, !dbg !1308
  %add13 = add nsw i32 %mul12, %31, !dbg !1309
  %mul14 = mul nsw i32 %28, %add13, !dbg !1310
  %add.ptr15 = getelementptr inbounds i64, ptr %27, i32 %mul14, !dbg !1311
  call void @m_vec_mul_add(i32 noundef %18, ptr noundef %add.ptr, i8 noundef zeroext %26, ptr noundef %add.ptr15) #5, !dbg !1312
  %32 = load i32, ptr %m_vec_limbs, align 4, !dbg !1313
  %33 = load ptr, ptr %P1.addr, align 4, !dbg !1314
  %34 = load i32, ptr %m_vec_limbs, align 4, !dbg !1315
  %35 = load i32, ptr %bs_mat_entries_used, align 4, !dbg !1316
  %mul16 = mul nsw i32 %34, %35, !dbg !1317
  %add.ptr17 = getelementptr inbounds i64, ptr %33, i32 %mul16, !dbg !1318
  %36 = load ptr, ptr %O.addr, align 4, !dbg !1319
  %37 = load i32, ptr %r, align 4, !dbg !1320
  %38 = load i32, ptr %param_o, align 4, !dbg !1321
  %mul18 = mul nsw i32 %37, %38, !dbg !1322
  %39 = load i32, ptr %k, align 4, !dbg !1323
  %add19 = add nsw i32 %mul18, %39, !dbg !1324
  %arrayidx20 = getelementptr inbounds i8, ptr %36, i32 %add19, !dbg !1319
  %40 = load i8, ptr %arrayidx20, align 1, !dbg !1319
  %41 = load ptr, ptr %acc.addr, align 4, !dbg !1325
  %42 = load i32, ptr %m_vec_limbs, align 4, !dbg !1326
  %43 = load i32, ptr %c, align 4, !dbg !1327
  %44 = load i32, ptr %param_o, align 4, !dbg !1328
  %mul21 = mul nsw i32 %43, %44, !dbg !1329
  %45 = load i32, ptr %k, align 4, !dbg !1330
  %add22 = add nsw i32 %mul21, %45, !dbg !1331
  %mul23 = mul nsw i32 %42, %add22, !dbg !1332
  %add.ptr24 = getelementptr inbounds i64, ptr %41, i32 %mul23, !dbg !1333
  call void @m_vec_mul_add(i32 noundef %32, ptr noundef %add.ptr17, i8 noundef zeroext %40, ptr noundef %add.ptr24) #5, !dbg !1334
  br label %for.inc, !dbg !1335

for.inc:                                          ; preds = %for.body9
  %46 = load i32, ptr %k, align 4, !dbg !1336
  %add25 = add nsw i32 %46, 1, !dbg !1336
  store i32 %add25, ptr %k, align 4, !dbg !1336
  br label %for.cond7, !dbg !1337, !llvm.loop !1338

for.end:                                          ; preds = %for.cond7
  %47 = load i32, ptr %bs_mat_entries_used, align 4, !dbg !1340
  %add26 = add nsw i32 %47, 1, !dbg !1340
  store i32 %add26, ptr %bs_mat_entries_used, align 4, !dbg !1340
  br label %for.inc27, !dbg !1341

for.inc27:                                        ; preds = %for.end, %if.then
  %48 = load i32, ptr %c, align 4, !dbg !1342
  %inc = add nsw i32 %48, 1, !dbg !1342
  store i32 %inc, ptr %c, align 4, !dbg !1342
  br label %for.cond3, !dbg !1343, !llvm.loop !1344

for.end28:                                        ; preds = %for.cond3
  br label %for.inc29, !dbg !1346

for.inc29:                                        ; preds = %for.end28
  %49 = load i32, ptr %r, align 4, !dbg !1347
  %inc30 = add nsw i32 %49, 1, !dbg !1347
  store i32 %inc30, ptr %r, align 4, !dbg !1347
  br label %for.cond, !dbg !1348, !llvm.loop !1349

for.end31:                                        ; preds = %for.cond
  ret void, !dbg !1351
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @mayo_sign_signature(ptr noundef %p, ptr noundef %sig, ptr noundef %siglen, ptr noundef %m, i32 noundef %mlen, ptr noundef %csk) #0 !dbg !1352 {
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
    #dbg_declare(ptr %p.addr, !1356, !DIExpression(), !1357)
  store ptr %sig, ptr %sig.addr, align 4
    #dbg_declare(ptr %sig.addr, !1358, !DIExpression(), !1359)
  store ptr %siglen, ptr %siglen.addr, align 4
    #dbg_declare(ptr %siglen.addr, !1360, !DIExpression(), !1361)
  store ptr %m, ptr %m.addr, align 4
    #dbg_declare(ptr %m.addr, !1362, !DIExpression(), !1363)
  store i32 %mlen, ptr %mlen.addr, align 4
    #dbg_declare(ptr %mlen.addr, !1364, !DIExpression(), !1365)
  store ptr %csk, ptr %csk.addr, align 4
    #dbg_declare(ptr %csk.addr, !1366, !DIExpression(), !1367)
    #dbg_declare(ptr %ret, !1368, !DIExpression(), !1369)
  store i32 0, ptr %ret, align 4, !dbg !1369
    #dbg_declare(ptr %tenc, !1370, !DIExpression(), !1374)
    #dbg_declare(ptr %t, !1375, !DIExpression(), !1379)
    #dbg_declare(ptr %y, !1380, !DIExpression(), !1381)
    #dbg_declare(ptr %salt, !1382, !DIExpression(), !1386)
    #dbg_declare(ptr %V, !1387, !DIExpression(), !1391)
    #dbg_declare(ptr %Vdec, !1392, !DIExpression(), !1396)
    #dbg_declare(ptr %A, !1397, !DIExpression(), !1401)
  call void @llvm.memset.p0.i32(ptr align 1 %A, i8 0, i32 29520, i1 false), !dbg !1401
    #dbg_declare(ptr %x, !1402, !DIExpression(), !1406)
    #dbg_declare(ptr %r, !1407, !DIExpression(), !1411)
  call void @llvm.memset.p0.i32(ptr align 1 %r, i8 0, i32 205, i1 false), !dbg !1411
    #dbg_declare(ptr %s, !1412, !DIExpression(), !1413)
    #dbg_declare(ptr %seed_sk, !1414, !DIExpression(), !1415)
    #dbg_declare(ptr %sk, !1416, !DIExpression(), !1417)
    #dbg_declare(ptr %Ox, !1418, !DIExpression(), !1419)
    #dbg_declare(ptr %tmp, !1420, !DIExpression(), !1424)
    #dbg_declare(ptr %ctrbyte, !1425, !DIExpression(), !1426)
    #dbg_declare(ptr %vi, !1427, !DIExpression(), !1428)
    #dbg_declare(ptr %param_m, !1429, !DIExpression(), !1430)
  %0 = load ptr, ptr %p.addr, align 4, !dbg !1431
  %m1 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %0, i32 0, i32 0, !dbg !1432
  %1 = load i32, ptr %m1, align 4, !dbg !1432
  store i32 %1, ptr %param_m, align 4, !dbg !1430
    #dbg_declare(ptr %param_n, !1433, !DIExpression(), !1434)
  %2 = load ptr, ptr %p.addr, align 4, !dbg !1435
  %n = getelementptr inbounds nuw %struct.mayo_params_t, ptr %2, i32 0, i32 1, !dbg !1436
  %3 = load i32, ptr %n, align 4, !dbg !1436
  store i32 %3, ptr %param_n, align 4, !dbg !1434
    #dbg_declare(ptr %param_o, !1437, !DIExpression(), !1438)
  %4 = load ptr, ptr %p.addr, align 4, !dbg !1439
  %o = getelementptr inbounds nuw %struct.mayo_params_t, ptr %4, i32 0, i32 2, !dbg !1440
  %5 = load i32, ptr %o, align 4, !dbg !1440
  store i32 %5, ptr %param_o, align 4, !dbg !1438
    #dbg_declare(ptr %param_k, !1441, !DIExpression(), !1442)
  %6 = load ptr, ptr %p.addr, align 4, !dbg !1443
  %k = getelementptr inbounds nuw %struct.mayo_params_t, ptr %6, i32 0, i32 3, !dbg !1444
  %7 = load i32, ptr %k, align 4, !dbg !1444
  store i32 %7, ptr %param_k, align 4, !dbg !1442
    #dbg_declare(ptr %param_v, !1445, !DIExpression(), !1446)
  %8 = load ptr, ptr %p.addr, align 4, !dbg !1447
  %n2 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %8, i32 0, i32 1, !dbg !1448
  %9 = load i32, ptr %n2, align 4, !dbg !1448
  %10 = load ptr, ptr %p.addr, align 4, !dbg !1447
  %o3 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %10, i32 0, i32 2, !dbg !1448
  %11 = load i32, ptr %o3, align 4, !dbg !1448
  %sub = sub nsw i32 %9, %11, !dbg !1448
  store i32 %sub, ptr %param_v, align 4, !dbg !1446
    #dbg_declare(ptr %param_m_bytes, !1449, !DIExpression(), !1450)
  %12 = load ptr, ptr %p.addr, align 4, !dbg !1451
  %m_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %12, i32 0, i32 6, !dbg !1452
  %13 = load i32, ptr %m_bytes, align 4, !dbg !1452
  store i32 %13, ptr %param_m_bytes, align 4, !dbg !1450
    #dbg_declare(ptr %param_v_bytes, !1453, !DIExpression(), !1454)
  %14 = load ptr, ptr %p.addr, align 4, !dbg !1455
  %v_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %14, i32 0, i32 8, !dbg !1456
  %15 = load i32, ptr %v_bytes, align 4, !dbg !1456
  store i32 %15, ptr %param_v_bytes, align 4, !dbg !1454
    #dbg_declare(ptr %param_r_bytes, !1457, !DIExpression(), !1458)
  %16 = load ptr, ptr %p.addr, align 4, !dbg !1459
  %r_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %16, i32 0, i32 9, !dbg !1460
  %17 = load i32, ptr %r_bytes, align 4, !dbg !1460
  store i32 %17, ptr %param_r_bytes, align 4, !dbg !1458
    #dbg_declare(ptr %param_sig_bytes, !1461, !DIExpression(), !1462)
  %18 = load ptr, ptr %p.addr, align 4, !dbg !1463
  %sig_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %18, i32 0, i32 16, !dbg !1464
  %19 = load i32, ptr %sig_bytes, align 4, !dbg !1464
  store i32 %19, ptr %param_sig_bytes, align 4, !dbg !1462
    #dbg_declare(ptr %param_A_cols, !1465, !DIExpression(), !1466)
  %20 = load ptr, ptr %p.addr, align 4, !dbg !1467
  %k4 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %20, i32 0, i32 3, !dbg !1468
  %21 = load i32, ptr %k4, align 4, !dbg !1468
  %22 = load ptr, ptr %p.addr, align 4, !dbg !1467
  %o5 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %22, i32 0, i32 2, !dbg !1468
  %23 = load i32, ptr %o5, align 4, !dbg !1468
  %mul = mul nsw i32 %21, %23, !dbg !1468
  %add = add nsw i32 %mul, 1, !dbg !1468
  store i32 %add, ptr %param_A_cols, align 4, !dbg !1466
    #dbg_declare(ptr %param_digest_bytes, !1469, !DIExpression(), !1470)
  %24 = load ptr, ptr %p.addr, align 4, !dbg !1471
  %digest_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %24, i32 0, i32 19, !dbg !1472
  %25 = load i32, ptr %digest_bytes, align 4, !dbg !1472
  store i32 %25, ptr %param_digest_bytes, align 4, !dbg !1470
    #dbg_declare(ptr %param_sk_seed_bytes, !1473, !DIExpression(), !1474)
  %26 = load ptr, ptr %p.addr, align 4, !dbg !1475
  %sk_seed_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %26, i32 0, i32 18, !dbg !1476
  %27 = load i32, ptr %sk_seed_bytes, align 4, !dbg !1476
  store i32 %27, ptr %param_sk_seed_bytes, align 4, !dbg !1474
    #dbg_declare(ptr %param_salt_bytes, !1477, !DIExpression(), !1478)
  %28 = load ptr, ptr %p.addr, align 4, !dbg !1479
  %salt_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %28, i32 0, i32 17, !dbg !1480
  %29 = load i32, ptr %salt_bytes, align 4, !dbg !1480
  store i32 %29, ptr %param_salt_bytes, align 4, !dbg !1478
  %30 = load ptr, ptr %p.addr, align 4, !dbg !1481
  %31 = load ptr, ptr %csk.addr, align 4, !dbg !1482
  %call = call i32 @mayo_expand_sk(ptr noundef %30, ptr noundef %31, ptr noundef %sk) #5, !dbg !1483
  store i32 %call, ptr %ret, align 4, !dbg !1484
  %32 = load i32, ptr %ret, align 4, !dbg !1485
  %cmp = icmp ne i32 %32, 0, !dbg !1487
  br i1 %cmp, label %if.then, label %if.end, !dbg !1487

if.then:                                          ; preds = %entry
  br label %err, !dbg !1488

if.end:                                           ; preds = %entry
  %33 = load ptr, ptr %csk.addr, align 4, !dbg !1490
  store ptr %33, ptr %seed_sk, align 4, !dbg !1491
  %arraydecay = getelementptr inbounds [145 x i8], ptr %tmp, i32 0, i32 0, !dbg !1492
  %34 = load i32, ptr %param_digest_bytes, align 4, !dbg !1493
  %35 = load ptr, ptr %m.addr, align 4, !dbg !1494
  %36 = load i32, ptr %mlen.addr, align 4, !dbg !1495
  %call6 = call i32 @shake256(ptr noundef %arraydecay, i32 noundef %34, ptr noundef %35, i32 noundef %36) #5, !dbg !1496
    #dbg_declare(ptr %P1, !1497, !DIExpression(), !1498)
  %p7 = getelementptr inbounds nuw %struct.sk_t, ptr %sk, i32 0, i32 0, !dbg !1499
  %arraydecay8 = getelementptr inbounds [113103 x i64], ptr %p7, i32 0, i32 0, !dbg !1500
  store ptr %arraydecay8, ptr %P1, align 4, !dbg !1498
    #dbg_declare(ptr %L, !1501, !DIExpression(), !1502)
  %37 = load ptr, ptr %P1, align 4, !dbg !1503
  %38 = load ptr, ptr %p.addr, align 4, !dbg !1504
  %n9 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %38, i32 0, i32 1, !dbg !1505
  %39 = load i32, ptr %n9, align 4, !dbg !1505
  %40 = load ptr, ptr %p.addr, align 4, !dbg !1504
  %o10 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %40, i32 0, i32 2, !dbg !1505
  %41 = load i32, ptr %o10, align 4, !dbg !1505
  %sub11 = sub nsw i32 %39, %41, !dbg !1505
  %42 = load ptr, ptr %p.addr, align 4, !dbg !1504
  %n12 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %42, i32 0, i32 1, !dbg !1505
  %43 = load i32, ptr %n12, align 4, !dbg !1505
  %44 = load ptr, ptr %p.addr, align 4, !dbg !1504
  %o13 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %44, i32 0, i32 2, !dbg !1505
  %45 = load i32, ptr %o13, align 4, !dbg !1505
  %sub14 = sub nsw i32 %43, %45, !dbg !1505
  %add15 = add nsw i32 %sub14, 1, !dbg !1505
  %mul16 = mul nsw i32 %sub11, %add15, !dbg !1505
  %div = sdiv i32 %mul16, 2, !dbg !1505
  %46 = load ptr, ptr %p.addr, align 4, !dbg !1504
  %m_vec_limbs = getelementptr inbounds nuw %struct.mayo_params_t, ptr %46, i32 0, i32 21, !dbg !1505
  %47 = load i32, ptr %m_vec_limbs, align 4, !dbg !1505
  %mul17 = mul nsw i32 %div, %47, !dbg !1505
  %add.ptr = getelementptr inbounds i64, ptr %37, i32 %mul17, !dbg !1506
  store ptr %add.ptr, ptr %L, align 4, !dbg !1502
    #dbg_declare(ptr %Mtmp, !1507, !DIExpression(), !1511)
  call void @llvm.memset.p0.i32(ptr align 8 %Mtmp, i8 0, i32 14688, i1 false), !dbg !1511
  %arraydecay18 = getelementptr inbounds [145 x i8], ptr %tmp, i32 0, i32 0, !dbg !1512
  %48 = load i32, ptr %param_digest_bytes, align 4, !dbg !1514
  %add.ptr19 = getelementptr inbounds i8, ptr %arraydecay18, i32 %48, !dbg !1515
  %49 = load i32, ptr %param_salt_bytes, align 4, !dbg !1516
  %call20 = call i32 @randombytes(ptr noundef %add.ptr19, i32 noundef %49) #5, !dbg !1517
  %cmp21 = icmp ne i32 %call20, 0, !dbg !1518
  br i1 %cmp21, label %if.then22, label %if.end23, !dbg !1518

if.then22:                                        ; preds = %if.end
  store i32 1, ptr %ret, align 4, !dbg !1519
  br label %err, !dbg !1521

if.end23:                                         ; preds = %if.end
  %arraydecay24 = getelementptr inbounds [145 x i8], ptr %tmp, i32 0, i32 0, !dbg !1522
  %50 = load i32, ptr %param_digest_bytes, align 4, !dbg !1523
  %add.ptr25 = getelementptr inbounds i8, ptr %arraydecay24, i32 %50, !dbg !1524
  %51 = load i32, ptr %param_salt_bytes, align 4, !dbg !1525
  %add.ptr26 = getelementptr inbounds i8, ptr %add.ptr25, i32 %51, !dbg !1526
  %52 = load ptr, ptr %seed_sk, align 4, !dbg !1527
  %53 = load i32, ptr %param_sk_seed_bytes, align 4, !dbg !1528
  %call27 = call ptr @memcpy(ptr noundef %add.ptr26, ptr noundef %52, i32 noundef %53) #5, !dbg !1529
  %arraydecay28 = getelementptr inbounds [40 x i8], ptr %salt, i32 0, i32 0, !dbg !1530
  %54 = load i32, ptr %param_salt_bytes, align 4, !dbg !1531
  %arraydecay29 = getelementptr inbounds [145 x i8], ptr %tmp, i32 0, i32 0, !dbg !1532
  %55 = load i32, ptr %param_digest_bytes, align 4, !dbg !1533
  %56 = load i32, ptr %param_salt_bytes, align 4, !dbg !1534
  %add30 = add nsw i32 %55, %56, !dbg !1535
  %57 = load i32, ptr %param_sk_seed_bytes, align 4, !dbg !1536
  %add31 = add nsw i32 %add30, %57, !dbg !1537
  %call32 = call i32 @shake256(ptr noundef %arraydecay28, i32 noundef %54, ptr noundef %arraydecay29, i32 noundef %add31) #5, !dbg !1538
  %arraydecay33 = getelementptr inbounds [145 x i8], ptr %tmp, i32 0, i32 0, !dbg !1539
  %58 = load i32, ptr %param_digest_bytes, align 4, !dbg !1540
  %add.ptr34 = getelementptr inbounds i8, ptr %arraydecay33, i32 %58, !dbg !1541
  %arraydecay35 = getelementptr inbounds [40 x i8], ptr %salt, i32 0, i32 0, !dbg !1542
  %59 = load i32, ptr %param_salt_bytes, align 4, !dbg !1543
  %call36 = call ptr @memcpy(ptr noundef %add.ptr34, ptr noundef %arraydecay35, i32 noundef %59) #5, !dbg !1544
  %arraydecay37 = getelementptr inbounds [145 x i8], ptr %tmp, i32 0, i32 0, !dbg !1545
  %60 = load i32, ptr %param_digest_bytes, align 4, !dbg !1546
  %add.ptr38 = getelementptr inbounds i8, ptr %arraydecay37, i32 %60, !dbg !1547
  %61 = load i32, ptr %param_salt_bytes, align 4, !dbg !1548
  %add.ptr39 = getelementptr inbounds i8, ptr %add.ptr38, i32 %61, !dbg !1549
  %62 = load i32, ptr %param_sk_seed_bytes, align 4, !dbg !1550
  %add.ptr40 = getelementptr inbounds i8, ptr %add.ptr39, i32 %62, !dbg !1551
  store ptr %add.ptr40, ptr %ctrbyte, align 4, !dbg !1552
  %arraydecay41 = getelementptr inbounds [71 x i8], ptr %tenc, i32 0, i32 0, !dbg !1553
  %63 = load i32, ptr %param_m_bytes, align 4, !dbg !1554
  %arraydecay42 = getelementptr inbounds [145 x i8], ptr %tmp, i32 0, i32 0, !dbg !1555
  %64 = load i32, ptr %param_digest_bytes, align 4, !dbg !1556
  %65 = load i32, ptr %param_salt_bytes, align 4, !dbg !1557
  %add43 = add nsw i32 %64, %65, !dbg !1558
  %call44 = call i32 @shake256(ptr noundef %arraydecay41, i32 noundef %63, ptr noundef %arraydecay42, i32 noundef %add43) #5, !dbg !1559
  %arraydecay45 = getelementptr inbounds [71 x i8], ptr %tenc, i32 0, i32 0, !dbg !1560
  %arraydecay46 = getelementptr inbounds [142 x i8], ptr %t, i32 0, i32 0, !dbg !1561
  %66 = load i32, ptr %param_m, align 4, !dbg !1562
  call void @decode(ptr noundef %arraydecay45, ptr noundef %arraydecay46, i32 noundef %66) #5, !dbg !1563
    #dbg_declare(ptr %ctr, !1564, !DIExpression(), !1566)
  store i32 0, ptr %ctr, align 4, !dbg !1566
  br label %for.cond, !dbg !1567

for.cond:                                         ; preds = %for.inc104, %if.end23
  %67 = load i32, ptr %ctr, align 4, !dbg !1568
  %cmp47 = icmp sle i32 %67, 255, !dbg !1570
  br i1 %cmp47, label %for.body, label %for.end106, !dbg !1571

for.body:                                         ; preds = %for.cond
  %68 = load i32, ptr %ctr, align 4, !dbg !1572
  %conv = trunc i32 %68 to i8, !dbg !1574
  %69 = load ptr, ptr %ctrbyte, align 4, !dbg !1575
  store i8 %conv, ptr %69, align 1, !dbg !1576
  %arraydecay48 = getelementptr inbounds [924 x i8], ptr %V, i32 0, i32 0, !dbg !1577
  %70 = load i32, ptr %param_k, align 4, !dbg !1578
  %71 = load i32, ptr %param_v_bytes, align 4, !dbg !1579
  %mul49 = mul nsw i32 %70, %71, !dbg !1580
  %72 = load i32, ptr %param_r_bytes, align 4, !dbg !1581
  %add50 = add nsw i32 %mul49, %72, !dbg !1582
  %arraydecay51 = getelementptr inbounds [145 x i8], ptr %tmp, i32 0, i32 0, !dbg !1583
  %73 = load i32, ptr %param_digest_bytes, align 4, !dbg !1584
  %74 = load i32, ptr %param_salt_bytes, align 4, !dbg !1585
  %add52 = add nsw i32 %73, %74, !dbg !1586
  %75 = load i32, ptr %param_sk_seed_bytes, align 4, !dbg !1587
  %add53 = add nsw i32 %add52, %75, !dbg !1588
  %add54 = add nsw i32 %add53, 1, !dbg !1589
  %call55 = call i32 @shake256(ptr noundef %arraydecay48, i32 noundef %add50, ptr noundef %arraydecay51, i32 noundef %add54) #5, !dbg !1590
    #dbg_declare(ptr %i, !1591, !DIExpression(), !1593)
  store i32 0, ptr %i, align 4, !dbg !1593
  br label %for.cond56, !dbg !1594

for.cond56:                                       ; preds = %for.inc, %for.body
  %76 = load i32, ptr %i, align 4, !dbg !1595
  %77 = load i32, ptr %param_k, align 4, !dbg !1597
  %sub57 = sub nsw i32 %77, 1, !dbg !1598
  %cmp58 = icmp sle i32 %76, %sub57, !dbg !1599
  br i1 %cmp58, label %for.body60, label %for.end, !dbg !1600

for.body60:                                       ; preds = %for.cond56
  %arraydecay61 = getelementptr inbounds [924 x i8], ptr %V, i32 0, i32 0, !dbg !1601
  %78 = load i32, ptr %i, align 4, !dbg !1603
  %79 = load i32, ptr %param_v_bytes, align 4, !dbg !1604
  %mul62 = mul nsw i32 %78, %79, !dbg !1605
  %add.ptr63 = getelementptr inbounds i8, ptr %arraydecay61, i32 %mul62, !dbg !1606
  %arraydecay64 = getelementptr inbounds [1704 x i8], ptr %Vdec, i32 0, i32 0, !dbg !1607
  %80 = load i32, ptr %i, align 4, !dbg !1608
  %81 = load i32, ptr %param_v, align 4, !dbg !1609
  %mul65 = mul nsw i32 %80, %81, !dbg !1610
  %add.ptr66 = getelementptr inbounds i8, ptr %arraydecay64, i32 %mul65, !dbg !1611
  %82 = load i32, ptr %param_v, align 4, !dbg !1612
  call void @decode(ptr noundef %add.ptr63, ptr noundef %add.ptr66, i32 noundef %82) #5, !dbg !1613
  br label %for.inc, !dbg !1614

for.inc:                                          ; preds = %for.body60
  %83 = load i32, ptr %i, align 4, !dbg !1615
  %inc = add nsw i32 %83, 1, !dbg !1615
  store i32 %inc, ptr %i, align 4, !dbg !1615
  br label %for.cond56, !dbg !1616, !llvm.loop !1617

for.end:                                          ; preds = %for.cond56
  %84 = load ptr, ptr %p.addr, align 4, !dbg !1619
  %arraydecay67 = getelementptr inbounds [1704 x i8], ptr %Vdec, i32 0, i32 0, !dbg !1620
  %85 = load ptr, ptr %L, align 4, !dbg !1621
  %86 = load ptr, ptr %P1, align 4, !dbg !1622
  %arraydecay68 = getelementptr inbounds [1836 x i64], ptr %Mtmp, i32 0, i32 0, !dbg !1623
  %arraydecay69 = getelementptr inbounds [29520 x i8], ptr %A, i32 0, i32 0, !dbg !1624
  call void @compute_M_and_VPV(ptr noundef %84, ptr noundef %arraydecay67, ptr noundef %85, ptr noundef %86, ptr noundef %arraydecay68, ptr noundef %arraydecay69) #5, !dbg !1625
  %87 = load ptr, ptr %p.addr, align 4, !dbg !1626
  %arraydecay70 = getelementptr inbounds [29520 x i8], ptr %A, i32 0, i32 0, !dbg !1627
  %arraydecay71 = getelementptr inbounds [142 x i8], ptr %t, i32 0, i32 0, !dbg !1628
  %arraydecay72 = getelementptr inbounds [142 x i8], ptr %y, i32 0, i32 0, !dbg !1629
  call void @compute_rhs(ptr noundef %87, ptr noundef %arraydecay70, ptr noundef %arraydecay71, ptr noundef %arraydecay72) #5, !dbg !1630
  %88 = load ptr, ptr %p.addr, align 4, !dbg !1631
  %arraydecay73 = getelementptr inbounds [1836 x i64], ptr %Mtmp, i32 0, i32 0, !dbg !1632
  %arraydecay74 = getelementptr inbounds [29520 x i8], ptr %A, i32 0, i32 0, !dbg !1633
  call void @compute_A(ptr noundef %88, ptr noundef %arraydecay73, ptr noundef %arraydecay74) #5, !dbg !1634
    #dbg_declare(ptr %i75, !1635, !DIExpression(), !1637)
  store i32 0, ptr %i75, align 4, !dbg !1637
  br label %for.cond76, !dbg !1638

for.cond76:                                       ; preds = %for.inc85, %for.end
  %89 = load i32, ptr %i75, align 4, !dbg !1639
  %90 = load i32, ptr %param_m, align 4, !dbg !1641
  %cmp77 = icmp slt i32 %89, %90, !dbg !1642
  br i1 %cmp77, label %for.body79, label %for.end87, !dbg !1643

for.body79:                                       ; preds = %for.cond76
  %91 = load i32, ptr %i75, align 4, !dbg !1644
  %add80 = add nsw i32 1, %91, !dbg !1646
  %92 = load i32, ptr %param_k, align 4, !dbg !1647
  %93 = load i32, ptr %param_o, align 4, !dbg !1648
  %mul81 = mul nsw i32 %92, %93, !dbg !1649
  %add82 = add nsw i32 %mul81, 1, !dbg !1650
  %mul83 = mul nsw i32 %add80, %add82, !dbg !1651
  %sub84 = sub nsw i32 %mul83, 1, !dbg !1652
  %arrayidx = getelementptr inbounds [29520 x i8], ptr %A, i32 0, i32 %sub84, !dbg !1653
  store i8 0, ptr %arrayidx, align 1, !dbg !1654
  br label %for.inc85, !dbg !1655

for.inc85:                                        ; preds = %for.body79
  %94 = load i32, ptr %i75, align 4, !dbg !1656
  %inc86 = add nsw i32 %94, 1, !dbg !1656
  store i32 %inc86, ptr %i75, align 4, !dbg !1656
  br label %for.cond76, !dbg !1657, !llvm.loop !1658

for.end87:                                        ; preds = %for.cond76
  %arraydecay88 = getelementptr inbounds [924 x i8], ptr %V, i32 0, i32 0, !dbg !1660
  %95 = load i32, ptr %param_k, align 4, !dbg !1661
  %96 = load i32, ptr %param_v_bytes, align 4, !dbg !1662
  %mul89 = mul nsw i32 %95, %96, !dbg !1663
  %add.ptr90 = getelementptr inbounds i8, ptr %arraydecay88, i32 %mul89, !dbg !1664
  %arraydecay91 = getelementptr inbounds [205 x i8], ptr %r, i32 0, i32 0, !dbg !1665
  %97 = load i32, ptr %param_k, align 4, !dbg !1666
  %98 = load i32, ptr %param_o, align 4, !dbg !1667
  %mul92 = mul nsw i32 %97, %98, !dbg !1668
  call void @decode(ptr noundef %add.ptr90, ptr noundef %arraydecay91, i32 noundef %mul92) #5, !dbg !1669
  %99 = load ptr, ptr %p.addr, align 4, !dbg !1670
  %arraydecay93 = getelementptr inbounds [29520 x i8], ptr %A, i32 0, i32 0, !dbg !1672
  %arraydecay94 = getelementptr inbounds [142 x i8], ptr %y, i32 0, i32 0, !dbg !1673
  %arraydecay95 = getelementptr inbounds [205 x i8], ptr %r, i32 0, i32 0, !dbg !1674
  %arraydecay96 = getelementptr inbounds [1848 x i8], ptr %x, i32 0, i32 0, !dbg !1675
  %100 = load i32, ptr %param_k, align 4, !dbg !1676
  %101 = load i32, ptr %param_o, align 4, !dbg !1677
  %102 = load i32, ptr %param_m, align 4, !dbg !1678
  %103 = load i32, ptr %param_A_cols, align 4, !dbg !1679
  %call97 = call i32 @sample_solution(ptr noundef %99, ptr noundef %arraydecay93, ptr noundef %arraydecay94, ptr noundef %arraydecay95, ptr noundef %arraydecay96, i32 noundef %100, i32 noundef %101, i32 noundef %102, i32 noundef %103) #5, !dbg !1680
  %tobool = icmp ne i32 %call97, 0, !dbg !1680
  br i1 %tobool, label %if.then98, label %if.else, !dbg !1680

if.then98:                                        ; preds = %for.end87
  br label %for.end106, !dbg !1681

if.else:                                          ; preds = %for.end87
  %arraydecay99 = getelementptr inbounds [1836 x i64], ptr %Mtmp, i32 0, i32 0, !dbg !1683
  %call100 = call ptr @memset(ptr noundef %arraydecay99, i32 noundef 0, i32 noundef 14688) #5, !dbg !1685
  %arraydecay101 = getelementptr inbounds [29520 x i8], ptr %A, i32 0, i32 0, !dbg !1686
  %call102 = call ptr @memset(ptr noundef %arraydecay101, i32 noundef 0, i32 noundef 29520) #5, !dbg !1687
  br label %if.end103

if.end103:                                        ; preds = %if.else
  br label %for.inc104, !dbg !1688

for.inc104:                                       ; preds = %if.end103
  %104 = load i32, ptr %ctr, align 4, !dbg !1689
  %inc105 = add nsw i32 %104, 1, !dbg !1689
  store i32 %inc105, ptr %ctr, align 4, !dbg !1689
  br label %for.cond, !dbg !1690, !llvm.loop !1691

for.end106:                                       ; preds = %if.then98, %for.cond
    #dbg_declare(ptr %i107, !1693, !DIExpression(), !1695)
  store i32 0, ptr %i107, align 4, !dbg !1695
  br label %for.cond108, !dbg !1696

for.cond108:                                      ; preds = %for.inc137, %for.end106
  %105 = load i32, ptr %i107, align 4, !dbg !1697
  %106 = load i32, ptr %param_k, align 4, !dbg !1699
  %sub109 = sub nsw i32 %106, 1, !dbg !1700
  %cmp110 = icmp sle i32 %105, %sub109, !dbg !1701
  br i1 %cmp110, label %for.body112, label %for.end139, !dbg !1702

for.body112:                                      ; preds = %for.cond108
  %arraydecay113 = getelementptr inbounds [1704 x i8], ptr %Vdec, i32 0, i32 0, !dbg !1703
  %107 = load i32, ptr %i107, align 4, !dbg !1705
  %108 = load i32, ptr %param_n, align 4, !dbg !1706
  %109 = load i32, ptr %param_o, align 4, !dbg !1707
  %sub114 = sub nsw i32 %108, %109, !dbg !1708
  %mul115 = mul nsw i32 %107, %sub114, !dbg !1709
  %add.ptr116 = getelementptr inbounds i8, ptr %arraydecay113, i32 %mul115, !dbg !1710
  store ptr %add.ptr116, ptr %vi, align 4, !dbg !1711
  %O = getelementptr inbounds nuw %struct.sk_t, ptr %sk, i32 0, i32 1, !dbg !1712
  %arraydecay117 = getelementptr inbounds [2414 x i8], ptr %O, i32 0, i32 0, !dbg !1713
  %arraydecay118 = getelementptr inbounds [1848 x i8], ptr %x, i32 0, i32 0, !dbg !1714
  %110 = load i32, ptr %i107, align 4, !dbg !1715
  %111 = load i32, ptr %param_o, align 4, !dbg !1716
  %mul119 = mul nsw i32 %110, %111, !dbg !1717
  %add.ptr120 = getelementptr inbounds i8, ptr %arraydecay118, i32 %mul119, !dbg !1718
  %arraydecay121 = getelementptr inbounds [142 x i8], ptr %Ox, i32 0, i32 0, !dbg !1719
  %112 = load i32, ptr %param_o, align 4, !dbg !1720
  %113 = load i32, ptr %param_n, align 4, !dbg !1721
  %114 = load i32, ptr %param_o, align 4, !dbg !1722
  %sub122 = sub nsw i32 %113, %114, !dbg !1723
  call void @mat_mul(ptr noundef %arraydecay117, ptr noundef %add.ptr120, ptr noundef %arraydecay121, i32 noundef %112, i32 noundef %sub122, i32 noundef 1) #5, !dbg !1724
  %115 = load ptr, ptr %vi, align 4, !dbg !1725
  %arraydecay123 = getelementptr inbounds [142 x i8], ptr %Ox, i32 0, i32 0, !dbg !1726
  %arraydecay124 = getelementptr inbounds [1848 x i8], ptr %s, i32 0, i32 0, !dbg !1727
  %116 = load i32, ptr %i107, align 4, !dbg !1728
  %117 = load i32, ptr %param_n, align 4, !dbg !1729
  %mul125 = mul nsw i32 %116, %117, !dbg !1730
  %add.ptr126 = getelementptr inbounds i8, ptr %arraydecay124, i32 %mul125, !dbg !1731
  %118 = load i32, ptr %param_n, align 4, !dbg !1732
  %119 = load i32, ptr %param_o, align 4, !dbg !1733
  %sub127 = sub nsw i32 %118, %119, !dbg !1734
  call void @mat_add(ptr noundef %115, ptr noundef %arraydecay123, ptr noundef %add.ptr126, i32 noundef %sub127, i32 noundef 1) #5, !dbg !1735
  %arraydecay128 = getelementptr inbounds [1848 x i8], ptr %s, i32 0, i32 0, !dbg !1736
  %120 = load i32, ptr %i107, align 4, !dbg !1737
  %121 = load i32, ptr %param_n, align 4, !dbg !1738
  %mul129 = mul nsw i32 %120, %121, !dbg !1739
  %add.ptr130 = getelementptr inbounds i8, ptr %arraydecay128, i32 %mul129, !dbg !1740
  %122 = load i32, ptr %param_n, align 4, !dbg !1741
  %123 = load i32, ptr %param_o, align 4, !dbg !1742
  %sub131 = sub nsw i32 %122, %123, !dbg !1743
  %add.ptr132 = getelementptr inbounds i8, ptr %add.ptr130, i32 %sub131, !dbg !1744
  %arraydecay133 = getelementptr inbounds [1848 x i8], ptr %x, i32 0, i32 0, !dbg !1745
  %124 = load i32, ptr %i107, align 4, !dbg !1746
  %125 = load i32, ptr %param_o, align 4, !dbg !1747
  %mul134 = mul nsw i32 %124, %125, !dbg !1748
  %add.ptr135 = getelementptr inbounds i8, ptr %arraydecay133, i32 %mul134, !dbg !1749
  %126 = load i32, ptr %param_o, align 4, !dbg !1750
  %call136 = call ptr @memcpy(ptr noundef %add.ptr132, ptr noundef %add.ptr135, i32 noundef %126) #5, !dbg !1751
  br label %for.inc137, !dbg !1752

for.inc137:                                       ; preds = %for.body112
  %127 = load i32, ptr %i107, align 4, !dbg !1753
  %inc138 = add nsw i32 %127, 1, !dbg !1753
  store i32 %inc138, ptr %i107, align 4, !dbg !1753
  br label %for.cond108, !dbg !1754, !llvm.loop !1755

for.end139:                                       ; preds = %for.cond108
  %arraydecay140 = getelementptr inbounds [1848 x i8], ptr %s, i32 0, i32 0, !dbg !1757
  %128 = load ptr, ptr %sig.addr, align 4, !dbg !1758
  %129 = load i32, ptr %param_n, align 4, !dbg !1759
  %130 = load i32, ptr %param_k, align 4, !dbg !1760
  %mul141 = mul nsw i32 %129, %130, !dbg !1761
  call void @encode(ptr noundef %arraydecay140, ptr noundef %128, i32 noundef %mul141) #5, !dbg !1762
  %131 = load ptr, ptr %sig.addr, align 4, !dbg !1763
  %132 = load i32, ptr %param_sig_bytes, align 4, !dbg !1764
  %add.ptr142 = getelementptr inbounds i8, ptr %131, i32 %132, !dbg !1765
  %133 = load i32, ptr %param_salt_bytes, align 4, !dbg !1766
  %idx.neg = sub i32 0, %133, !dbg !1767
  %add.ptr143 = getelementptr inbounds i8, ptr %add.ptr142, i32 %idx.neg, !dbg !1767
  %arraydecay144 = getelementptr inbounds [40 x i8], ptr %salt, i32 0, i32 0, !dbg !1768
  %134 = load i32, ptr %param_salt_bytes, align 4, !dbg !1769
  %call145 = call ptr @memcpy(ptr noundef %add.ptr143, ptr noundef %arraydecay144, i32 noundef %134) #5, !dbg !1770
  %135 = load i32, ptr %param_sig_bytes, align 4, !dbg !1771
  %136 = load ptr, ptr %siglen.addr, align 4, !dbg !1772
  store i32 %135, ptr %136, align 4, !dbg !1773
  br label %err, !dbg !1774

err:                                              ; preds = %for.end139, %if.then22, %if.then
    #dbg_label(!1775, !1776)
  %arraydecay146 = getelementptr inbounds [924 x i8], ptr %V, i32 0, i32 0, !dbg !1777
  call void @mayo_secure_clear(ptr noundef %arraydecay146, i32 noundef 924) #5, !dbg !1778
  %arraydecay147 = getelementptr inbounds [1704 x i8], ptr %Vdec, i32 0, i32 0, !dbg !1779
  call void @mayo_secure_clear(ptr noundef %arraydecay147, i32 noundef 1704) #5, !dbg !1780
  %arraydecay148 = getelementptr inbounds [29520 x i8], ptr %A, i32 0, i32 0, !dbg !1781
  call void @mayo_secure_clear(ptr noundef %arraydecay148, i32 noundef 29520) #5, !dbg !1782
  %arraydecay149 = getelementptr inbounds [205 x i8], ptr %r, i32 0, i32 0, !dbg !1783
  call void @mayo_secure_clear(ptr noundef %arraydecay149, i32 noundef 205) #5, !dbg !1784
  %O150 = getelementptr inbounds nuw %struct.sk_t, ptr %sk, i32 0, i32 1, !dbg !1785
  %arraydecay151 = getelementptr inbounds [2414 x i8], ptr %O150, i32 0, i32 0, !dbg !1786
  call void @mayo_secure_clear(ptr noundef %arraydecay151, i32 noundef 2414) #5, !dbg !1787
  call void @mayo_secure_clear(ptr noundef %sk, i32 noundef 907240) #5, !dbg !1788
  %arraydecay152 = getelementptr inbounds [142 x i8], ptr %Ox, i32 0, i32 0, !dbg !1789
  call void @mayo_secure_clear(ptr noundef %arraydecay152, i32 noundef 142) #5, !dbg !1790
  %arraydecay153 = getelementptr inbounds [145 x i8], ptr %tmp, i32 0, i32 0, !dbg !1791
  call void @mayo_secure_clear(ptr noundef %arraydecay153, i32 noundef 145) #5, !dbg !1792
  %arraydecay154 = getelementptr inbounds [1836 x i64], ptr %Mtmp, i32 0, i32 0, !dbg !1793
  call void @mayo_secure_clear(ptr noundef %arraydecay154, i32 noundef 14688) #5, !dbg !1794
  %137 = load i32, ptr %ret, align 4, !dbg !1795
  ret i32 %137, !dbg !1796
}

; Function Attrs: noinline nounwind optnone
define internal void @compute_M_and_VPV(ptr noundef %p, ptr noundef %Vdec, ptr noundef %L, ptr noundef %P1, ptr noundef %VL, ptr noundef %VP1V) #0 !dbg !1797 {
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
    #dbg_declare(ptr %p.addr, !1800, !DIExpression(), !1801)
  store ptr %Vdec, ptr %Vdec.addr, align 4
    #dbg_declare(ptr %Vdec.addr, !1802, !DIExpression(), !1803)
  store ptr %L, ptr %L.addr, align 4
    #dbg_declare(ptr %L.addr, !1804, !DIExpression(), !1805)
  store ptr %P1, ptr %P1.addr, align 4
    #dbg_declare(ptr %P1.addr, !1806, !DIExpression(), !1807)
  store ptr %VL, ptr %VL.addr, align 4
    #dbg_declare(ptr %VL.addr, !1808, !DIExpression(), !1809)
  store ptr %VP1V, ptr %VP1V.addr, align 4
    #dbg_declare(ptr %VP1V.addr, !1810, !DIExpression(), !1811)
    #dbg_declare(ptr %param_k, !1812, !DIExpression(), !1813)
  %0 = load ptr, ptr %p.addr, align 4, !dbg !1814
  %k = getelementptr inbounds nuw %struct.mayo_params_t, ptr %0, i32 0, i32 3, !dbg !1815
  %1 = load i32, ptr %k, align 4, !dbg !1815
  store i32 %1, ptr %param_k, align 4, !dbg !1813
    #dbg_declare(ptr %param_v, !1816, !DIExpression(), !1817)
  %2 = load ptr, ptr %p.addr, align 4, !dbg !1818
  %n = getelementptr inbounds nuw %struct.mayo_params_t, ptr %2, i32 0, i32 1, !dbg !1819
  %3 = load i32, ptr %n, align 4, !dbg !1819
  %4 = load ptr, ptr %p.addr, align 4, !dbg !1818
  %o = getelementptr inbounds nuw %struct.mayo_params_t, ptr %4, i32 0, i32 2, !dbg !1819
  %5 = load i32, ptr %o, align 4, !dbg !1819
  %sub = sub nsw i32 %3, %5, !dbg !1819
  store i32 %sub, ptr %param_v, align 4, !dbg !1817
    #dbg_declare(ptr %param_o, !1820, !DIExpression(), !1821)
  %6 = load ptr, ptr %p.addr, align 4, !dbg !1822
  %o1 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %6, i32 0, i32 2, !dbg !1823
  %7 = load i32, ptr %o1, align 4, !dbg !1823
  store i32 %7, ptr %param_o, align 4, !dbg !1821
  %8 = load ptr, ptr %p.addr, align 4, !dbg !1824
  %m_vec_limbs = getelementptr inbounds nuw %struct.mayo_params_t, ptr %8, i32 0, i32 21, !dbg !1825
  %9 = load i32, ptr %m_vec_limbs, align 4, !dbg !1825
  %10 = load ptr, ptr %Vdec.addr, align 4, !dbg !1826
  %11 = load ptr, ptr %L.addr, align 4, !dbg !1827
  %12 = load ptr, ptr %VL.addr, align 4, !dbg !1828
  %13 = load i32, ptr %param_k, align 4, !dbg !1829
  %14 = load i32, ptr %param_v, align 4, !dbg !1830
  %15 = load i32, ptr %param_o, align 4, !dbg !1831
  call void @mul_add_mat_x_m_mat(i32 noundef %9, ptr noundef %10, ptr noundef %11, ptr noundef %12, i32 noundef %13, i32 noundef %14, i32 noundef %15) #5, !dbg !1832
    #dbg_declare(ptr %Pv, !1833, !DIExpression(), !1837)
  call void @llvm.memset.p0.i32(ptr align 8 %Pv, i8 0, i32 122688, i1 false), !dbg !1837
  %16 = load ptr, ptr %p.addr, align 4, !dbg !1838
  %17 = load ptr, ptr %P1.addr, align 4, !dbg !1839
  %18 = load ptr, ptr %Vdec.addr, align 4, !dbg !1840
  %arraydecay = getelementptr inbounds [15336 x i64], ptr %Pv, i32 0, i32 0, !dbg !1841
  call void @P1_times_Vt(ptr noundef %16, ptr noundef %17, ptr noundef %18, ptr noundef %arraydecay) #5, !dbg !1842
  %19 = load ptr, ptr %p.addr, align 4, !dbg !1843
  %m_vec_limbs2 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %19, i32 0, i32 21, !dbg !1844
  %20 = load i32, ptr %m_vec_limbs2, align 4, !dbg !1844
  %21 = load ptr, ptr %Vdec.addr, align 4, !dbg !1845
  %arraydecay3 = getelementptr inbounds [15336 x i64], ptr %Pv, i32 0, i32 0, !dbg !1846
  %22 = load ptr, ptr %VP1V.addr, align 4, !dbg !1847
  %23 = load i32, ptr %param_k, align 4, !dbg !1848
  %24 = load i32, ptr %param_v, align 4, !dbg !1849
  %25 = load i32, ptr %param_k, align 4, !dbg !1850
  call void @mul_add_mat_x_m_mat(i32 noundef %20, ptr noundef %21, ptr noundef %arraydecay3, ptr noundef %22, i32 noundef %23, i32 noundef %24, i32 noundef %25) #5, !dbg !1851
  ret void, !dbg !1852
}

; Function Attrs: noinline nounwind optnone
define internal void @compute_rhs(ptr noundef %p, ptr noundef %vPv, ptr noundef %t, ptr noundef %y) #0 !dbg !1853 {
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
    #dbg_declare(ptr %p.addr, !1856, !DIExpression(), !1857)
  store ptr %vPv, ptr %vPv.addr, align 4
    #dbg_declare(ptr %vPv.addr, !1858, !DIExpression(), !1859)
  store ptr %t, ptr %t.addr, align 4
    #dbg_declare(ptr %t.addr, !1860, !DIExpression(), !1861)
  store ptr %y, ptr %y.addr, align 4
    #dbg_declare(ptr %y.addr, !1862, !DIExpression(), !1863)
    #dbg_declare(ptr %top_pos, !1864, !DIExpression(), !1866)
  %0 = load ptr, ptr %p.addr, align 4, !dbg !1867
  %m = getelementptr inbounds nuw %struct.mayo_params_t, ptr %0, i32 0, i32 0, !dbg !1868
  %1 = load i32, ptr %m, align 4, !dbg !1868
  %sub = sub nsw i32 %1, 1, !dbg !1869
  %rem = srem i32 %sub, 16, !dbg !1870
  %mul = mul nsw i32 %rem, 4, !dbg !1871
  store i32 %mul, ptr %top_pos, align 4, !dbg !1866
    #dbg_declare(ptr %m_vec_limbs, !1872, !DIExpression(), !1873)
  %2 = load ptr, ptr %p.addr, align 4, !dbg !1874
  %m_vec_limbs1 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %2, i32 0, i32 21, !dbg !1875
  %3 = load i32, ptr %m_vec_limbs1, align 4, !dbg !1875
  store i32 %3, ptr %m_vec_limbs, align 4, !dbg !1873
  %4 = load ptr, ptr %p.addr, align 4, !dbg !1876
  %m2 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %4, i32 0, i32 0, !dbg !1878
  %5 = load i32, ptr %m2, align 4, !dbg !1878
  %rem3 = srem i32 %5, 16, !dbg !1879
  %cmp = icmp ne i32 %rem3, 0, !dbg !1880
  br i1 %cmp, label %if.then, label %if.end, !dbg !1880

if.then:                                          ; preds = %entry
    #dbg_declare(ptr %mask, !1881, !DIExpression(), !1883)
  store i64 1, ptr %mask, align 8, !dbg !1883
  %6 = load ptr, ptr %p.addr, align 4, !dbg !1884
  %m4 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %6, i32 0, i32 0, !dbg !1885
  %7 = load i32, ptr %m4, align 4, !dbg !1885
  %rem5 = srem i32 %7, 16, !dbg !1886
  %mul6 = mul nsw i32 %rem5, 4, !dbg !1887
  %8 = load i64, ptr %mask, align 8, !dbg !1888
  %sh_prom = zext i32 %mul6 to i64, !dbg !1888
  %shl = shl i64 %8, %sh_prom, !dbg !1888
  store i64 %shl, ptr %mask, align 8, !dbg !1888
  %9 = load i64, ptr %mask, align 8, !dbg !1889
  %sub7 = sub i64 %9, 1, !dbg !1889
  store i64 %sub7, ptr %mask, align 8, !dbg !1889
    #dbg_declare(ptr %i, !1890, !DIExpression(), !1892)
  store i32 0, ptr %i, align 4, !dbg !1892
  br label %for.cond, !dbg !1893

for.cond:                                         ; preds = %for.inc, %if.then
  %10 = load i32, ptr %i, align 4, !dbg !1894
  %11 = load ptr, ptr %p.addr, align 4, !dbg !1896
  %k = getelementptr inbounds nuw %struct.mayo_params_t, ptr %11, i32 0, i32 3, !dbg !1897
  %12 = load i32, ptr %k, align 4, !dbg !1897
  %13 = load ptr, ptr %p.addr, align 4, !dbg !1898
  %k8 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %13, i32 0, i32 3, !dbg !1899
  %14 = load i32, ptr %k8, align 4, !dbg !1899
  %mul9 = mul nsw i32 %12, %14, !dbg !1900
  %cmp10 = icmp slt i32 %10, %mul9, !dbg !1901
  br i1 %cmp10, label %for.body, label %for.end, !dbg !1902

for.body:                                         ; preds = %for.cond
  %15 = load i64, ptr %mask, align 8, !dbg !1903
  %16 = load ptr, ptr %vPv.addr, align 4, !dbg !1905
  %17 = load i32, ptr %i, align 4, !dbg !1906
  %18 = load i32, ptr %m_vec_limbs, align 4, !dbg !1907
  %mul11 = mul i32 %17, %18, !dbg !1908
  %19 = load i32, ptr %m_vec_limbs, align 4, !dbg !1909
  %add = add i32 %mul11, %19, !dbg !1910
  %sub12 = sub i32 %add, 1, !dbg !1911
  %arrayidx = getelementptr inbounds nuw i64, ptr %16, i32 %sub12, !dbg !1905
  %20 = load i64, ptr %arrayidx, align 8, !dbg !1912
  %and = and i64 %20, %15, !dbg !1912
  store i64 %and, ptr %arrayidx, align 8, !dbg !1912
  br label %for.inc, !dbg !1913

for.inc:                                          ; preds = %for.body
  %21 = load i32, ptr %i, align 4, !dbg !1914
  %inc = add nsw i32 %21, 1, !dbg !1914
  store i32 %inc, ptr %i, align 4, !dbg !1914
  br label %for.cond, !dbg !1915, !llvm.loop !1916

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !1918

if.end:                                           ; preds = %for.end, %entry
    #dbg_declare(ptr %temp, !1919, !DIExpression(), !1920)
  call void @llvm.memset.p0.i32(ptr align 8 %temp, i8 0, i32 72, i1 false), !dbg !1920
    #dbg_declare(ptr %temp_bytes, !1921, !DIExpression(), !1922)
  %arraydecay = getelementptr inbounds [9 x i64], ptr %temp, i32 0, i32 0, !dbg !1923
  store ptr %arraydecay, ptr %temp_bytes, align 4, !dbg !1922
    #dbg_declare(ptr %i13, !1924, !DIExpression(), !1926)
  %22 = load ptr, ptr %p.addr, align 4, !dbg !1927
  %k14 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %22, i32 0, i32 3, !dbg !1928
  %23 = load i32, ptr %k14, align 4, !dbg !1928
  %sub15 = sub nsw i32 %23, 1, !dbg !1929
  store i32 %sub15, ptr %i13, align 4, !dbg !1926
  br label %for.cond16, !dbg !1930

for.cond16:                                       ; preds = %for.inc102, %if.end
  %24 = load i32, ptr %i13, align 4, !dbg !1931
  %cmp17 = icmp sge i32 %24, 0, !dbg !1933
  br i1 %cmp17, label %for.body18, label %for.end104, !dbg !1934

for.body18:                                       ; preds = %for.cond16
    #dbg_declare(ptr %j, !1935, !DIExpression(), !1938)
  %25 = load i32, ptr %i13, align 4, !dbg !1939
  store i32 %25, ptr %j, align 4, !dbg !1938
  br label %for.cond19, !dbg !1940

for.cond19:                                       ; preds = %for.inc99, %for.body18
  %26 = load i32, ptr %j, align 4, !dbg !1941
  %27 = load ptr, ptr %p.addr, align 4, !dbg !1943
  %k20 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %27, i32 0, i32 3, !dbg !1944
  %28 = load i32, ptr %k20, align 4, !dbg !1944
  %cmp21 = icmp slt i32 %26, %28, !dbg !1945
  br i1 %cmp21, label %for.body22, label %for.end101, !dbg !1946

for.body22:                                       ; preds = %for.cond19
    #dbg_declare(ptr %top, !1947, !DIExpression(), !1949)
  %29 = load i32, ptr %m_vec_limbs, align 4, !dbg !1950
  %sub23 = sub i32 %29, 1, !dbg !1951
  %arrayidx24 = getelementptr inbounds nuw [9 x i64], ptr %temp, i32 0, i32 %sub23, !dbg !1952
  %30 = load i64, ptr %arrayidx24, align 8, !dbg !1952
  %31 = load i32, ptr %top_pos, align 4, !dbg !1953
  %sh_prom25 = zext i32 %31 to i64, !dbg !1954
  %shr = lshr i64 %30, %sh_prom25, !dbg !1954
  %rem26 = urem i64 %shr, 16, !dbg !1955
  %conv = trunc i64 %rem26 to i8, !dbg !1956
  store i8 %conv, ptr %top, align 1, !dbg !1949
  %32 = load i32, ptr %m_vec_limbs, align 4, !dbg !1957
  %sub27 = sub i32 %32, 1, !dbg !1958
  %arrayidx28 = getelementptr inbounds nuw [9 x i64], ptr %temp, i32 0, i32 %sub27, !dbg !1959
  %33 = load i64, ptr %arrayidx28, align 8, !dbg !1960
  %shl29 = shl i64 %33, 4, !dbg !1960
  store i64 %shl29, ptr %arrayidx28, align 8, !dbg !1960
    #dbg_declare(ptr %k30, !1961, !DIExpression(), !1963)
  %34 = load i32, ptr %m_vec_limbs, align 4, !dbg !1964
  %sub31 = sub i32 %34, 2, !dbg !1965
  store i32 %sub31, ptr %k30, align 4, !dbg !1963
  br label %for.cond32, !dbg !1966

for.cond32:                                       ; preds = %for.inc42, %for.body22
  %35 = load i32, ptr %k30, align 4, !dbg !1967
  %cmp33 = icmp sge i32 %35, 0, !dbg !1969
  br i1 %cmp33, label %for.body35, label %for.end43, !dbg !1970

for.body35:                                       ; preds = %for.cond32
  %36 = load i32, ptr %k30, align 4, !dbg !1971
  %arrayidx36 = getelementptr inbounds [9 x i64], ptr %temp, i32 0, i32 %36, !dbg !1973
  %37 = load i64, ptr %arrayidx36, align 8, !dbg !1973
  %shr37 = lshr i64 %37, 60, !dbg !1974
  %38 = load i32, ptr %k30, align 4, !dbg !1975
  %add38 = add nsw i32 %38, 1, !dbg !1976
  %arrayidx39 = getelementptr inbounds [9 x i64], ptr %temp, i32 0, i32 %add38, !dbg !1977
  %39 = load i64, ptr %arrayidx39, align 8, !dbg !1978
  %xor = xor i64 %39, %shr37, !dbg !1978
  store i64 %xor, ptr %arrayidx39, align 8, !dbg !1978
  %40 = load i32, ptr %k30, align 4, !dbg !1979
  %arrayidx40 = getelementptr inbounds [9 x i64], ptr %temp, i32 0, i32 %40, !dbg !1980
  %41 = load i64, ptr %arrayidx40, align 8, !dbg !1981
  %shl41 = shl i64 %41, 4, !dbg !1981
  store i64 %shl41, ptr %arrayidx40, align 8, !dbg !1981
  br label %for.inc42, !dbg !1982

for.inc42:                                        ; preds = %for.body35
  %42 = load i32, ptr %k30, align 4, !dbg !1983
  %dec = add nsw i32 %42, -1, !dbg !1983
  store i32 %dec, ptr %k30, align 4, !dbg !1983
  br label %for.cond32, !dbg !1984, !llvm.loop !1985

for.end43:                                        ; preds = %for.cond32
    #dbg_declare(ptr %jj, !1987, !DIExpression(), !1989)
  store i32 0, ptr %jj, align 4, !dbg !1989
  br label %for.cond44, !dbg !1990

for.cond44:                                       ; preds = %for.inc69, %for.end43
  %43 = load i32, ptr %jj, align 4, !dbg !1991
  %cmp45 = icmp slt i32 %43, 4, !dbg !1993
  br i1 %cmp45, label %for.body47, label %for.end71, !dbg !1994

for.body47:                                       ; preds = %for.cond44
  %44 = load i32, ptr %jj, align 4, !dbg !1995
  %rem48 = srem i32 %44, 2, !dbg !1998
  %cmp49 = icmp eq i32 %rem48, 0, !dbg !1999
  br i1 %cmp49, label %if.then51, label %if.else, !dbg !1999

if.then51:                                        ; preds = %for.body47
  %45 = load i8, ptr %top, align 1, !dbg !2000
  %46 = load ptr, ptr %p.addr, align 4, !dbg !2002
  %f_tail = getelementptr inbounds nuw %struct.mayo_params_t, ptr %46, i32 0, i32 5, !dbg !2003
  %47 = load ptr, ptr %f_tail, align 4, !dbg !2003
  %48 = load i32, ptr %jj, align 4, !dbg !2004
  %arrayidx52 = getelementptr inbounds i8, ptr %47, i32 %48, !dbg !2003
  %49 = load i8, ptr %arrayidx52, align 1, !dbg !2003
  %call = call zeroext i8 @mul_f(i8 noundef zeroext %45, i8 noundef zeroext %49) #5, !dbg !2005
  %conv53 = zext i8 %call to i32, !dbg !2005
  %50 = load ptr, ptr %temp_bytes, align 4, !dbg !2006
  %51 = load i32, ptr %jj, align 4, !dbg !2007
  %div = sdiv i32 %51, 2, !dbg !2008
  %arrayidx54 = getelementptr inbounds i8, ptr %50, i32 %div, !dbg !2006
  %52 = load i8, ptr %arrayidx54, align 1, !dbg !2009
  %conv55 = zext i8 %52 to i32, !dbg !2009
  %xor56 = xor i32 %conv55, %conv53, !dbg !2009
  %conv57 = trunc i32 %xor56 to i8, !dbg !2009
  store i8 %conv57, ptr %arrayidx54, align 1, !dbg !2009
  br label %if.end68, !dbg !2010

if.else:                                          ; preds = %for.body47
  %53 = load i8, ptr %top, align 1, !dbg !2011
  %54 = load ptr, ptr %p.addr, align 4, !dbg !2013
  %f_tail58 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %54, i32 0, i32 5, !dbg !2014
  %55 = load ptr, ptr %f_tail58, align 4, !dbg !2014
  %56 = load i32, ptr %jj, align 4, !dbg !2015
  %arrayidx59 = getelementptr inbounds i8, ptr %55, i32 %56, !dbg !2014
  %57 = load i8, ptr %arrayidx59, align 1, !dbg !2014
  %call60 = call zeroext i8 @mul_f(i8 noundef zeroext %53, i8 noundef zeroext %57) #5, !dbg !2016
  %conv61 = zext i8 %call60 to i32, !dbg !2016
  %shl62 = shl i32 %conv61, 4, !dbg !2017
  %58 = load ptr, ptr %temp_bytes, align 4, !dbg !2018
  %59 = load i32, ptr %jj, align 4, !dbg !2019
  %div63 = sdiv i32 %59, 2, !dbg !2020
  %arrayidx64 = getelementptr inbounds i8, ptr %58, i32 %div63, !dbg !2018
  %60 = load i8, ptr %arrayidx64, align 1, !dbg !2021
  %conv65 = zext i8 %60 to i32, !dbg !2021
  %xor66 = xor i32 %conv65, %shl62, !dbg !2021
  %conv67 = trunc i32 %xor66 to i8, !dbg !2021
  store i8 %conv67, ptr %arrayidx64, align 1, !dbg !2021
  br label %if.end68

if.end68:                                         ; preds = %if.else, %if.then51
  br label %for.inc69, !dbg !2022

for.inc69:                                        ; preds = %if.end68
  %61 = load i32, ptr %jj, align 4, !dbg !2023
  %inc70 = add nsw i32 %61, 1, !dbg !2023
  store i32 %inc70, ptr %jj, align 4, !dbg !2023
  br label %for.cond44, !dbg !2024, !llvm.loop !2025

for.end71:                                        ; preds = %for.cond44
    #dbg_declare(ptr %k72, !2027, !DIExpression(), !2029)
  store i32 0, ptr %k72, align 4, !dbg !2029
  br label %for.cond73, !dbg !2030

for.cond73:                                       ; preds = %for.inc96, %for.end71
  %62 = load i32, ptr %k72, align 4, !dbg !2031
  %63 = load i32, ptr %m_vec_limbs, align 4, !dbg !2033
  %cmp74 = icmp ult i32 %62, %63, !dbg !2034
  br i1 %cmp74, label %for.body76, label %for.end98, !dbg !2035

for.body76:                                       ; preds = %for.cond73
  %64 = load ptr, ptr %vPv.addr, align 4, !dbg !2036
  %65 = load i32, ptr %i13, align 4, !dbg !2038
  %66 = load ptr, ptr %p.addr, align 4, !dbg !2039
  %k77 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %66, i32 0, i32 3, !dbg !2040
  %67 = load i32, ptr %k77, align 4, !dbg !2040
  %mul78 = mul nsw i32 %65, %67, !dbg !2041
  %68 = load i32, ptr %j, align 4, !dbg !2042
  %add79 = add nsw i32 %mul78, %68, !dbg !2043
  %69 = load i32, ptr %m_vec_limbs, align 4, !dbg !2044
  %mul80 = mul i32 %add79, %69, !dbg !2045
  %70 = load i32, ptr %k72, align 4, !dbg !2046
  %add81 = add i32 %mul80, %70, !dbg !2047
  %arrayidx82 = getelementptr inbounds nuw i64, ptr %64, i32 %add81, !dbg !2036
  %71 = load i64, ptr %arrayidx82, align 8, !dbg !2036
  %72 = load i32, ptr %i13, align 4, !dbg !2048
  %73 = load i32, ptr %j, align 4, !dbg !2049
  %cmp83 = icmp ne i32 %72, %73, !dbg !2050
  %conv84 = zext i1 %cmp83 to i32, !dbg !2050
  %conv85 = sext i32 %conv84 to i64, !dbg !2051
  %74 = load ptr, ptr %vPv.addr, align 4, !dbg !2052
  %75 = load i32, ptr %j, align 4, !dbg !2053
  %76 = load ptr, ptr %p.addr, align 4, !dbg !2054
  %k86 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %76, i32 0, i32 3, !dbg !2055
  %77 = load i32, ptr %k86, align 4, !dbg !2055
  %mul87 = mul nsw i32 %75, %77, !dbg !2056
  %78 = load i32, ptr %i13, align 4, !dbg !2057
  %add88 = add nsw i32 %mul87, %78, !dbg !2058
  %79 = load i32, ptr %m_vec_limbs, align 4, !dbg !2059
  %mul89 = mul i32 %add88, %79, !dbg !2060
  %80 = load i32, ptr %k72, align 4, !dbg !2061
  %add90 = add i32 %mul89, %80, !dbg !2062
  %arrayidx91 = getelementptr inbounds nuw i64, ptr %74, i32 %add90, !dbg !2052
  %81 = load i64, ptr %arrayidx91, align 8, !dbg !2052
  %mul92 = mul i64 %conv85, %81, !dbg !2063
  %xor93 = xor i64 %71, %mul92, !dbg !2064
  %82 = load i32, ptr %k72, align 4, !dbg !2065
  %arrayidx94 = getelementptr inbounds nuw [9 x i64], ptr %temp, i32 0, i32 %82, !dbg !2066
  %83 = load i64, ptr %arrayidx94, align 8, !dbg !2067
  %xor95 = xor i64 %83, %xor93, !dbg !2067
  store i64 %xor95, ptr %arrayidx94, align 8, !dbg !2067
  br label %for.inc96, !dbg !2068

for.inc96:                                        ; preds = %for.body76
  %84 = load i32, ptr %k72, align 4, !dbg !2069
  %inc97 = add i32 %84, 1, !dbg !2069
  store i32 %inc97, ptr %k72, align 4, !dbg !2069
  br label %for.cond73, !dbg !2070, !llvm.loop !2071

for.end98:                                        ; preds = %for.cond73
  br label %for.inc99, !dbg !2073

for.inc99:                                        ; preds = %for.end98
  %85 = load i32, ptr %j, align 4, !dbg !2074
  %inc100 = add nsw i32 %85, 1, !dbg !2074
  store i32 %inc100, ptr %j, align 4, !dbg !2074
  br label %for.cond19, !dbg !2075, !llvm.loop !2076

for.end101:                                       ; preds = %for.cond19
  br label %for.inc102, !dbg !2078

for.inc102:                                       ; preds = %for.end101
  %86 = load i32, ptr %i13, align 4, !dbg !2079
  %dec103 = add nsw i32 %86, -1, !dbg !2079
  store i32 %dec103, ptr %i13, align 4, !dbg !2079
  br label %for.cond16, !dbg !2080, !llvm.loop !2081

for.end104:                                       ; preds = %for.cond16
    #dbg_declare(ptr %i105, !2083, !DIExpression(), !2085)
  store i32 0, ptr %i105, align 4, !dbg !2085
  br label %for.cond106, !dbg !2086

for.cond106:                                      ; preds = %for.inc131, %for.end104
  %87 = load i32, ptr %i105, align 4, !dbg !2087
  %88 = load ptr, ptr %p.addr, align 4, !dbg !2089
  %m107 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %88, i32 0, i32 0, !dbg !2090
  %89 = load i32, ptr %m107, align 4, !dbg !2090
  %cmp108 = icmp slt i32 %87, %89, !dbg !2091
  br i1 %cmp108, label %for.body110, label %for.end133, !dbg !2092

for.body110:                                      ; preds = %for.cond106
  %90 = load ptr, ptr %t.addr, align 4, !dbg !2093
  %91 = load i32, ptr %i105, align 4, !dbg !2095
  %arrayidx111 = getelementptr inbounds i8, ptr %90, i32 %91, !dbg !2093
  %92 = load i8, ptr %arrayidx111, align 1, !dbg !2093
  %conv112 = zext i8 %92 to i32, !dbg !2093
  %93 = load ptr, ptr %temp_bytes, align 4, !dbg !2096
  %94 = load i32, ptr %i105, align 4, !dbg !2097
  %div113 = sdiv i32 %94, 2, !dbg !2098
  %arrayidx114 = getelementptr inbounds i8, ptr %93, i32 %div113, !dbg !2096
  %95 = load i8, ptr %arrayidx114, align 1, !dbg !2096
  %conv115 = zext i8 %95 to i32, !dbg !2096
  %and116 = and i32 %conv115, 15, !dbg !2099
  %xor117 = xor i32 %conv112, %and116, !dbg !2100
  %conv118 = trunc i32 %xor117 to i8, !dbg !2093
  %96 = load ptr, ptr %y.addr, align 4, !dbg !2101
  %97 = load i32, ptr %i105, align 4, !dbg !2102
  %arrayidx119 = getelementptr inbounds i8, ptr %96, i32 %97, !dbg !2101
  store i8 %conv118, ptr %arrayidx119, align 1, !dbg !2103
  %98 = load ptr, ptr %t.addr, align 4, !dbg !2104
  %99 = load i32, ptr %i105, align 4, !dbg !2105
  %add120 = add nsw i32 %99, 1, !dbg !2106
  %arrayidx121 = getelementptr inbounds i8, ptr %98, i32 %add120, !dbg !2104
  %100 = load i8, ptr %arrayidx121, align 1, !dbg !2104
  %conv122 = zext i8 %100 to i32, !dbg !2104
  %101 = load ptr, ptr %temp_bytes, align 4, !dbg !2107
  %102 = load i32, ptr %i105, align 4, !dbg !2108
  %div123 = sdiv i32 %102, 2, !dbg !2109
  %arrayidx124 = getelementptr inbounds i8, ptr %101, i32 %div123, !dbg !2107
  %103 = load i8, ptr %arrayidx124, align 1, !dbg !2107
  %conv125 = zext i8 %103 to i32, !dbg !2107
  %shr126 = ashr i32 %conv125, 4, !dbg !2110
  %xor127 = xor i32 %conv122, %shr126, !dbg !2111
  %conv128 = trunc i32 %xor127 to i8, !dbg !2104
  %104 = load ptr, ptr %y.addr, align 4, !dbg !2112
  %105 = load i32, ptr %i105, align 4, !dbg !2113
  %add129 = add nsw i32 %105, 1, !dbg !2114
  %arrayidx130 = getelementptr inbounds i8, ptr %104, i32 %add129, !dbg !2112
  store i8 %conv128, ptr %arrayidx130, align 1, !dbg !2115
  br label %for.inc131, !dbg !2116

for.inc131:                                       ; preds = %for.body110
  %106 = load i32, ptr %i105, align 4, !dbg !2117
  %add132 = add nsw i32 %106, 2, !dbg !2117
  store i32 %add132, ptr %i105, align 4, !dbg !2117
  br label %for.cond106, !dbg !2118, !llvm.loop !2119

for.end133:                                       ; preds = %for.cond106
  ret void, !dbg !2121
}

; Function Attrs: noinline nounwind optnone
define internal void @compute_A(ptr noundef %p, ptr noundef %VtL, ptr noundef %A_out) #0 !dbg !2122 {
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
    #dbg_declare(ptr %p.addr, !2125, !DIExpression(), !2126)
  store ptr %VtL, ptr %VtL.addr, align 4
    #dbg_declare(ptr %VtL.addr, !2127, !DIExpression(), !2128)
  store ptr %A_out, ptr %A_out.addr, align 4
    #dbg_declare(ptr %A_out.addr, !2129, !DIExpression(), !2130)
    #dbg_declare(ptr %bits_to_shift, !2131, !DIExpression(), !2132)
  store i32 0, ptr %bits_to_shift, align 4, !dbg !2132
    #dbg_declare(ptr %words_to_shift, !2133, !DIExpression(), !2134)
  store i32 0, ptr %words_to_shift, align 4, !dbg !2134
    #dbg_declare(ptr %m_vec_limbs, !2135, !DIExpression(), !2136)
  %0 = load ptr, ptr %p.addr, align 4, !dbg !2137
  %m_vec_limbs1 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %0, i32 0, i32 21, !dbg !2138
  %1 = load i32, ptr %m_vec_limbs1, align 4, !dbg !2138
  store i32 %1, ptr %m_vec_limbs, align 4, !dbg !2136
    #dbg_declare(ptr %A, !2139, !DIExpression(), !2143)
  call void @llvm.memset.p0.i32(ptr align 8 %A, i8 0, i32 29952, i1 false), !dbg !2143
    #dbg_declare(ptr %A_width, !2144, !DIExpression(), !2145)
  %2 = load ptr, ptr %p.addr, align 4, !dbg !2146
  %o = getelementptr inbounds nuw %struct.mayo_params_t, ptr %2, i32 0, i32 2, !dbg !2147
  %3 = load i32, ptr %o, align 4, !dbg !2147
  %4 = load ptr, ptr %p.addr, align 4, !dbg !2148
  %k = getelementptr inbounds nuw %struct.mayo_params_t, ptr %4, i32 0, i32 3, !dbg !2149
  %5 = load i32, ptr %k, align 4, !dbg !2149
  %mul = mul nsw i32 %3, %5, !dbg !2150
  %add = add nsw i32 %mul, 15, !dbg !2151
  %div = sdiv i32 %add, 16, !dbg !2152
  %mul2 = mul nsw i32 %div, 16, !dbg !2153
  store i32 %mul2, ptr %A_width, align 4, !dbg !2145
    #dbg_declare(ptr %Mi, !2154, !DIExpression(), !2155)
    #dbg_declare(ptr %Mj, !2156, !DIExpression(), !2157)
  %6 = load ptr, ptr %p.addr, align 4, !dbg !2158
  %m = getelementptr inbounds nuw %struct.mayo_params_t, ptr %6, i32 0, i32 0, !dbg !2160
  %7 = load i32, ptr %m, align 4, !dbg !2160
  %rem = srem i32 %7, 16, !dbg !2161
  %cmp = icmp ne i32 %rem, 0, !dbg !2162
  br i1 %cmp, label %if.then, label %if.end, !dbg !2162

if.then:                                          ; preds = %entry
    #dbg_declare(ptr %mask, !2163, !DIExpression(), !2165)
  store i64 1, ptr %mask, align 8, !dbg !2165
  %8 = load ptr, ptr %p.addr, align 4, !dbg !2166
  %m3 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %8, i32 0, i32 0, !dbg !2167
  %9 = load i32, ptr %m3, align 4, !dbg !2167
  %rem4 = srem i32 %9, 16, !dbg !2168
  %mul5 = mul nsw i32 %rem4, 4, !dbg !2169
  %10 = load i64, ptr %mask, align 8, !dbg !2170
  %sh_prom = zext i32 %mul5 to i64, !dbg !2170
  %shl = shl i64 %10, %sh_prom, !dbg !2170
  store i64 %shl, ptr %mask, align 8, !dbg !2170
  %11 = load i64, ptr %mask, align 8, !dbg !2171
  %sub = sub i64 %11, 1, !dbg !2171
  store i64 %sub, ptr %mask, align 8, !dbg !2171
    #dbg_declare(ptr %i, !2172, !DIExpression(), !2174)
  store i32 0, ptr %i, align 4, !dbg !2174
  br label %for.cond, !dbg !2175

for.cond:                                         ; preds = %for.inc, %if.then
  %12 = load i32, ptr %i, align 4, !dbg !2176
  %13 = load ptr, ptr %p.addr, align 4, !dbg !2178
  %o6 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %13, i32 0, i32 2, !dbg !2179
  %14 = load i32, ptr %o6, align 4, !dbg !2179
  %15 = load ptr, ptr %p.addr, align 4, !dbg !2180
  %k7 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %15, i32 0, i32 3, !dbg !2181
  %16 = load i32, ptr %k7, align 4, !dbg !2181
  %mul8 = mul nsw i32 %14, %16, !dbg !2182
  %cmp9 = icmp slt i32 %12, %mul8, !dbg !2183
  br i1 %cmp9, label %for.body, label %for.end, !dbg !2184

for.body:                                         ; preds = %for.cond
  %17 = load i64, ptr %mask, align 8, !dbg !2185
  %18 = load ptr, ptr %VtL.addr, align 4, !dbg !2187
  %19 = load i32, ptr %i, align 4, !dbg !2188
  %20 = load i32, ptr %m_vec_limbs, align 4, !dbg !2189
  %mul10 = mul nsw i32 %19, %20, !dbg !2190
  %21 = load i32, ptr %m_vec_limbs, align 4, !dbg !2191
  %add11 = add nsw i32 %mul10, %21, !dbg !2192
  %sub12 = sub nsw i32 %add11, 1, !dbg !2193
  %arrayidx = getelementptr inbounds i64, ptr %18, i32 %sub12, !dbg !2187
  %22 = load i64, ptr %arrayidx, align 8, !dbg !2194
  %and = and i64 %22, %17, !dbg !2194
  store i64 %and, ptr %arrayidx, align 8, !dbg !2194
  br label %for.inc, !dbg !2195

for.inc:                                          ; preds = %for.body
  %23 = load i32, ptr %i, align 4, !dbg !2196
  %inc = add nsw i32 %23, 1, !dbg !2196
  store i32 %inc, ptr %i, align 4, !dbg !2196
  br label %for.cond, !dbg !2197, !llvm.loop !2198

for.end:                                          ; preds = %for.cond
  br label %if.end, !dbg !2200

if.end:                                           ; preds = %for.end, %entry
    #dbg_declare(ptr %i13, !2201, !DIExpression(), !2203)
  store i32 0, ptr %i13, align 4, !dbg !2203
  br label %for.cond14, !dbg !2204

for.cond14:                                       ; preds = %for.inc130, %if.end
  %24 = load i32, ptr %i13, align 4, !dbg !2205
  %25 = load ptr, ptr %p.addr, align 4, !dbg !2207
  %k15 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %25, i32 0, i32 3, !dbg !2208
  %26 = load i32, ptr %k15, align 4, !dbg !2208
  %sub16 = sub nsw i32 %26, 1, !dbg !2209
  %cmp17 = icmp sle i32 %24, %sub16, !dbg !2210
  br i1 %cmp17, label %for.body18, label %for.end132, !dbg !2211

for.body18:                                       ; preds = %for.cond14
    #dbg_declare(ptr %j, !2212, !DIExpression(), !2215)
  %27 = load ptr, ptr %p.addr, align 4, !dbg !2216
  %k19 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %27, i32 0, i32 3, !dbg !2217
  %28 = load i32, ptr %k19, align 4, !dbg !2217
  %sub20 = sub nsw i32 %28, 1, !dbg !2218
  store i32 %sub20, ptr %j, align 4, !dbg !2215
  br label %for.cond21, !dbg !2219

for.cond21:                                       ; preds = %for.inc128, %for.body18
  %29 = load i32, ptr %j, align 4, !dbg !2220
  %30 = load i32, ptr %i13, align 4, !dbg !2222
  %cmp22 = icmp sge i32 %29, %30, !dbg !2223
  br i1 %cmp22, label %for.body23, label %for.end129, !dbg !2224

for.body23:                                       ; preds = %for.cond21
  %31 = load ptr, ptr %VtL.addr, align 4, !dbg !2225
  %32 = load i32, ptr %j, align 4, !dbg !2227
  %33 = load i32, ptr %m_vec_limbs, align 4, !dbg !2228
  %mul24 = mul nsw i32 %32, %33, !dbg !2229
  %34 = load ptr, ptr %p.addr, align 4, !dbg !2230
  %o25 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %34, i32 0, i32 2, !dbg !2231
  %35 = load i32, ptr %o25, align 4, !dbg !2231
  %mul26 = mul nsw i32 %mul24, %35, !dbg !2232
  %add.ptr = getelementptr inbounds i64, ptr %31, i32 %mul26, !dbg !2233
  store ptr %add.ptr, ptr %Mj, align 4, !dbg !2234
    #dbg_declare(ptr %c, !2235, !DIExpression(), !2237)
  store i32 0, ptr %c, align 4, !dbg !2237
  br label %for.cond27, !dbg !2238

for.cond27:                                       ; preds = %for.inc67, %for.body23
  %36 = load i32, ptr %c, align 4, !dbg !2239
  %37 = load ptr, ptr %p.addr, align 4, !dbg !2241
  %o28 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %37, i32 0, i32 2, !dbg !2242
  %38 = load i32, ptr %o28, align 4, !dbg !2242
  %cmp29 = icmp slt i32 %36, %38, !dbg !2243
  br i1 %cmp29, label %for.body30, label %for.end69, !dbg !2244

for.body30:                                       ; preds = %for.cond27
    #dbg_declare(ptr %k31, !2245, !DIExpression(), !2248)
  store i32 0, ptr %k31, align 4, !dbg !2248
  br label %for.cond32, !dbg !2249

for.cond32:                                       ; preds = %for.inc64, %for.body30
  %39 = load i32, ptr %k31, align 4, !dbg !2250
  %40 = load i32, ptr %m_vec_limbs, align 4, !dbg !2252
  %cmp33 = icmp slt i32 %39, %40, !dbg !2253
  br i1 %cmp33, label %for.body34, label %for.end66, !dbg !2254

for.body34:                                       ; preds = %for.cond32
  %41 = load ptr, ptr %Mj, align 4, !dbg !2255
  %42 = load i32, ptr %k31, align 4, !dbg !2257
  %43 = load i32, ptr %c, align 4, !dbg !2258
  %44 = load i32, ptr %m_vec_limbs, align 4, !dbg !2259
  %mul35 = mul nsw i32 %43, %44, !dbg !2260
  %add36 = add nsw i32 %42, %mul35, !dbg !2261
  %arrayidx37 = getelementptr inbounds i64, ptr %41, i32 %add36, !dbg !2255
  %45 = load i64, ptr %arrayidx37, align 8, !dbg !2255
  %46 = load i32, ptr %bits_to_shift, align 4, !dbg !2262
  %sh_prom38 = zext i32 %46 to i64, !dbg !2263
  %shl39 = shl i64 %45, %sh_prom38, !dbg !2263
  %47 = load ptr, ptr %p.addr, align 4, !dbg !2264
  %o40 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %47, i32 0, i32 2, !dbg !2265
  %48 = load i32, ptr %o40, align 4, !dbg !2265
  %49 = load i32, ptr %i13, align 4, !dbg !2266
  %mul41 = mul nsw i32 %48, %49, !dbg !2267
  %50 = load i32, ptr %c, align 4, !dbg !2268
  %add42 = add nsw i32 %mul41, %50, !dbg !2269
  %51 = load i32, ptr %k31, align 4, !dbg !2270
  %52 = load i32, ptr %words_to_shift, align 4, !dbg !2271
  %add43 = add nsw i32 %51, %52, !dbg !2272
  %53 = load i32, ptr %A_width, align 4, !dbg !2273
  %mul44 = mul i32 %add43, %53, !dbg !2274
  %add45 = add i32 %add42, %mul44, !dbg !2275
  %arrayidx46 = getelementptr inbounds nuw [3744 x i64], ptr %A, i32 0, i32 %add45, !dbg !2276
  %54 = load i64, ptr %arrayidx46, align 8, !dbg !2277
  %xor = xor i64 %54, %shl39, !dbg !2277
  store i64 %xor, ptr %arrayidx46, align 8, !dbg !2277
  %55 = load i32, ptr %bits_to_shift, align 4, !dbg !2278
  %cmp47 = icmp sgt i32 %55, 0, !dbg !2280
  br i1 %cmp47, label %if.then48, label %if.end63, !dbg !2280

if.then48:                                        ; preds = %for.body34
  %56 = load ptr, ptr %Mj, align 4, !dbg !2281
  %57 = load i32, ptr %k31, align 4, !dbg !2283
  %58 = load i32, ptr %c, align 4, !dbg !2284
  %59 = load i32, ptr %m_vec_limbs, align 4, !dbg !2285
  %mul49 = mul nsw i32 %58, %59, !dbg !2286
  %add50 = add nsw i32 %57, %mul49, !dbg !2287
  %arrayidx51 = getelementptr inbounds i64, ptr %56, i32 %add50, !dbg !2281
  %60 = load i64, ptr %arrayidx51, align 8, !dbg !2281
  %61 = load i32, ptr %bits_to_shift, align 4, !dbg !2288
  %sub52 = sub nsw i32 64, %61, !dbg !2289
  %sh_prom53 = zext i32 %sub52 to i64, !dbg !2290
  %shr = lshr i64 %60, %sh_prom53, !dbg !2290
  %62 = load ptr, ptr %p.addr, align 4, !dbg !2291
  %o54 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %62, i32 0, i32 2, !dbg !2292
  %63 = load i32, ptr %o54, align 4, !dbg !2292
  %64 = load i32, ptr %i13, align 4, !dbg !2293
  %mul55 = mul nsw i32 %63, %64, !dbg !2294
  %65 = load i32, ptr %c, align 4, !dbg !2295
  %add56 = add nsw i32 %mul55, %65, !dbg !2296
  %66 = load i32, ptr %k31, align 4, !dbg !2297
  %67 = load i32, ptr %words_to_shift, align 4, !dbg !2298
  %add57 = add nsw i32 %66, %67, !dbg !2299
  %add58 = add nsw i32 %add57, 1, !dbg !2300
  %68 = load i32, ptr %A_width, align 4, !dbg !2301
  %mul59 = mul i32 %add58, %68, !dbg !2302
  %add60 = add i32 %add56, %mul59, !dbg !2303
  %arrayidx61 = getelementptr inbounds nuw [3744 x i64], ptr %A, i32 0, i32 %add60, !dbg !2304
  %69 = load i64, ptr %arrayidx61, align 8, !dbg !2305
  %xor62 = xor i64 %69, %shr, !dbg !2305
  store i64 %xor62, ptr %arrayidx61, align 8, !dbg !2305
  br label %if.end63, !dbg !2306

if.end63:                                         ; preds = %if.then48, %for.body34
  br label %for.inc64, !dbg !2307

for.inc64:                                        ; preds = %if.end63
  %70 = load i32, ptr %k31, align 4, !dbg !2308
  %inc65 = add nsw i32 %70, 1, !dbg !2308
  store i32 %inc65, ptr %k31, align 4, !dbg !2308
  br label %for.cond32, !dbg !2309, !llvm.loop !2310

for.end66:                                        ; preds = %for.cond32
  br label %for.inc67, !dbg !2312

for.inc67:                                        ; preds = %for.end66
  %71 = load i32, ptr %c, align 4, !dbg !2313
  %inc68 = add nsw i32 %71, 1, !dbg !2313
  store i32 %inc68, ptr %c, align 4, !dbg !2313
  br label %for.cond27, !dbg !2314, !llvm.loop !2315

for.end69:                                        ; preds = %for.cond27
  %72 = load i32, ptr %i13, align 4, !dbg !2317
  %73 = load i32, ptr %j, align 4, !dbg !2319
  %cmp70 = icmp ne i32 %72, %73, !dbg !2320
  br i1 %cmp70, label %if.then71, label %if.end122, !dbg !2320

if.then71:                                        ; preds = %for.end69
  %74 = load ptr, ptr %VtL.addr, align 4, !dbg !2321
  %75 = load i32, ptr %i13, align 4, !dbg !2323
  %76 = load i32, ptr %m_vec_limbs, align 4, !dbg !2324
  %mul72 = mul nsw i32 %75, %76, !dbg !2325
  %77 = load ptr, ptr %p.addr, align 4, !dbg !2326
  %o73 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %77, i32 0, i32 2, !dbg !2327
  %78 = load i32, ptr %o73, align 4, !dbg !2327
  %mul74 = mul nsw i32 %mul72, %78, !dbg !2328
  %add.ptr75 = getelementptr inbounds i64, ptr %74, i32 %mul74, !dbg !2329
  store ptr %add.ptr75, ptr %Mi, align 4, !dbg !2330
    #dbg_declare(ptr %c76, !2331, !DIExpression(), !2333)
  store i32 0, ptr %c76, align 4, !dbg !2333
  br label %for.cond77, !dbg !2334

for.cond77:                                       ; preds = %for.inc119, %if.then71
  %79 = load i32, ptr %c76, align 4, !dbg !2335
  %80 = load ptr, ptr %p.addr, align 4, !dbg !2337
  %o78 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %80, i32 0, i32 2, !dbg !2338
  %81 = load i32, ptr %o78, align 4, !dbg !2338
  %cmp79 = icmp slt i32 %79, %81, !dbg !2339
  br i1 %cmp79, label %for.body80, label %for.end121, !dbg !2340

for.body80:                                       ; preds = %for.cond77
    #dbg_declare(ptr %k81, !2341, !DIExpression(), !2344)
  store i32 0, ptr %k81, align 4, !dbg !2344
  br label %for.cond82, !dbg !2345

for.cond82:                                       ; preds = %for.inc116, %for.body80
  %82 = load i32, ptr %k81, align 4, !dbg !2346
  %83 = load i32, ptr %m_vec_limbs, align 4, !dbg !2348
  %cmp83 = icmp slt i32 %82, %83, !dbg !2349
  br i1 %cmp83, label %for.body84, label %for.end118, !dbg !2350

for.body84:                                       ; preds = %for.cond82
  %84 = load ptr, ptr %Mi, align 4, !dbg !2351
  %85 = load i32, ptr %k81, align 4, !dbg !2353
  %86 = load i32, ptr %c76, align 4, !dbg !2354
  %87 = load i32, ptr %m_vec_limbs, align 4, !dbg !2355
  %mul85 = mul nsw i32 %86, %87, !dbg !2356
  %add86 = add nsw i32 %85, %mul85, !dbg !2357
  %arrayidx87 = getelementptr inbounds i64, ptr %84, i32 %add86, !dbg !2351
  %88 = load i64, ptr %arrayidx87, align 8, !dbg !2351
  %89 = load i32, ptr %bits_to_shift, align 4, !dbg !2358
  %sh_prom88 = zext i32 %89 to i64, !dbg !2359
  %shl89 = shl i64 %88, %sh_prom88, !dbg !2359
  %90 = load ptr, ptr %p.addr, align 4, !dbg !2360
  %o90 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %90, i32 0, i32 2, !dbg !2361
  %91 = load i32, ptr %o90, align 4, !dbg !2361
  %92 = load i32, ptr %j, align 4, !dbg !2362
  %mul91 = mul nsw i32 %91, %92, !dbg !2363
  %93 = load i32, ptr %c76, align 4, !dbg !2364
  %add92 = add nsw i32 %mul91, %93, !dbg !2365
  %94 = load i32, ptr %k81, align 4, !dbg !2366
  %95 = load i32, ptr %words_to_shift, align 4, !dbg !2367
  %add93 = add nsw i32 %94, %95, !dbg !2368
  %96 = load i32, ptr %A_width, align 4, !dbg !2369
  %mul94 = mul i32 %add93, %96, !dbg !2370
  %add95 = add i32 %add92, %mul94, !dbg !2371
  %arrayidx96 = getelementptr inbounds nuw [3744 x i64], ptr %A, i32 0, i32 %add95, !dbg !2372
  %97 = load i64, ptr %arrayidx96, align 8, !dbg !2373
  %xor97 = xor i64 %97, %shl89, !dbg !2373
  store i64 %xor97, ptr %arrayidx96, align 8, !dbg !2373
  %98 = load i32, ptr %bits_to_shift, align 4, !dbg !2374
  %cmp98 = icmp sgt i32 %98, 0, !dbg !2376
  br i1 %cmp98, label %if.then99, label %if.end115, !dbg !2376

if.then99:                                        ; preds = %for.body84
  %99 = load ptr, ptr %Mi, align 4, !dbg !2377
  %100 = load i32, ptr %k81, align 4, !dbg !2379
  %101 = load i32, ptr %c76, align 4, !dbg !2380
  %102 = load i32, ptr %m_vec_limbs, align 4, !dbg !2381
  %mul100 = mul nsw i32 %101, %102, !dbg !2382
  %add101 = add nsw i32 %100, %mul100, !dbg !2383
  %arrayidx102 = getelementptr inbounds i64, ptr %99, i32 %add101, !dbg !2377
  %103 = load i64, ptr %arrayidx102, align 8, !dbg !2377
  %104 = load i32, ptr %bits_to_shift, align 4, !dbg !2384
  %sub103 = sub nsw i32 64, %104, !dbg !2385
  %sh_prom104 = zext i32 %sub103 to i64, !dbg !2386
  %shr105 = lshr i64 %103, %sh_prom104, !dbg !2386
  %105 = load ptr, ptr %p.addr, align 4, !dbg !2387
  %o106 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %105, i32 0, i32 2, !dbg !2388
  %106 = load i32, ptr %o106, align 4, !dbg !2388
  %107 = load i32, ptr %j, align 4, !dbg !2389
  %mul107 = mul nsw i32 %106, %107, !dbg !2390
  %108 = load i32, ptr %c76, align 4, !dbg !2391
  %add108 = add nsw i32 %mul107, %108, !dbg !2392
  %109 = load i32, ptr %k81, align 4, !dbg !2393
  %110 = load i32, ptr %words_to_shift, align 4, !dbg !2394
  %add109 = add nsw i32 %109, %110, !dbg !2395
  %add110 = add nsw i32 %add109, 1, !dbg !2396
  %111 = load i32, ptr %A_width, align 4, !dbg !2397
  %mul111 = mul i32 %add110, %111, !dbg !2398
  %add112 = add i32 %add108, %mul111, !dbg !2399
  %arrayidx113 = getelementptr inbounds nuw [3744 x i64], ptr %A, i32 0, i32 %add112, !dbg !2400
  %112 = load i64, ptr %arrayidx113, align 8, !dbg !2401
  %xor114 = xor i64 %112, %shr105, !dbg !2401
  store i64 %xor114, ptr %arrayidx113, align 8, !dbg !2401
  br label %if.end115, !dbg !2402

if.end115:                                        ; preds = %if.then99, %for.body84
  br label %for.inc116, !dbg !2403

for.inc116:                                       ; preds = %if.end115
  %113 = load i32, ptr %k81, align 4, !dbg !2404
  %inc117 = add nsw i32 %113, 1, !dbg !2404
  store i32 %inc117, ptr %k81, align 4, !dbg !2404
  br label %for.cond82, !dbg !2405, !llvm.loop !2406

for.end118:                                       ; preds = %for.cond82
  br label %for.inc119, !dbg !2408

for.inc119:                                       ; preds = %for.end118
  %114 = load i32, ptr %c76, align 4, !dbg !2409
  %inc120 = add nsw i32 %114, 1, !dbg !2409
  store i32 %inc120, ptr %c76, align 4, !dbg !2409
  br label %for.cond77, !dbg !2410, !llvm.loop !2411

for.end121:                                       ; preds = %for.cond77
  br label %if.end122, !dbg !2413

if.end122:                                        ; preds = %for.end121, %for.end69
  %115 = load i32, ptr %bits_to_shift, align 4, !dbg !2414
  %add123 = add nsw i32 %115, 4, !dbg !2414
  store i32 %add123, ptr %bits_to_shift, align 4, !dbg !2414
  %116 = load i32, ptr %bits_to_shift, align 4, !dbg !2415
  %cmp124 = icmp eq i32 %116, 64, !dbg !2417
  br i1 %cmp124, label %if.then125, label %if.end127, !dbg !2417

if.then125:                                       ; preds = %if.end122
  %117 = load i32, ptr %words_to_shift, align 4, !dbg !2418
  %inc126 = add nsw i32 %117, 1, !dbg !2418
  store i32 %inc126, ptr %words_to_shift, align 4, !dbg !2418
  store i32 0, ptr %bits_to_shift, align 4, !dbg !2420
  br label %if.end127, !dbg !2421

if.end127:                                        ; preds = %if.then125, %if.end122
  br label %for.inc128, !dbg !2422

for.inc128:                                       ; preds = %if.end127
  %118 = load i32, ptr %j, align 4, !dbg !2423
  %dec = add nsw i32 %118, -1, !dbg !2423
  store i32 %dec, ptr %j, align 4, !dbg !2423
  br label %for.cond21, !dbg !2424, !llvm.loop !2425

for.end129:                                       ; preds = %for.cond21
  br label %for.inc130, !dbg !2427

for.inc130:                                       ; preds = %for.end129
  %119 = load i32, ptr %i13, align 4, !dbg !2428
  %inc131 = add nsw i32 %119, 1, !dbg !2428
  store i32 %inc131, ptr %i13, align 4, !dbg !2428
  br label %for.cond14, !dbg !2429, !llvm.loop !2430

for.end132:                                       ; preds = %for.cond14
    #dbg_declare(ptr %c133, !2432, !DIExpression(), !2434)
  store i32 0, ptr %c133, align 4, !dbg !2434
  br label %for.cond134, !dbg !2435

for.cond134:                                      ; preds = %for.inc148, %for.end132
  %120 = load i32, ptr %c133, align 4, !dbg !2436
  %121 = load i32, ptr %A_width, align 4, !dbg !2438
  %122 = load ptr, ptr %p.addr, align 4, !dbg !2439
  %m135 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %122, i32 0, i32 0, !dbg !2440
  %123 = load i32, ptr %m135, align 4, !dbg !2440
  %124 = load ptr, ptr %p.addr, align 4, !dbg !2441
  %k136 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %124, i32 0, i32 3, !dbg !2442
  %125 = load i32, ptr %k136, align 4, !dbg !2442
  %add137 = add nsw i32 %125, 1, !dbg !2443
  %126 = load ptr, ptr %p.addr, align 4, !dbg !2444
  %k138 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %126, i32 0, i32 3, !dbg !2445
  %127 = load i32, ptr %k138, align 4, !dbg !2445
  %mul139 = mul nsw i32 %add137, %127, !dbg !2446
  %div140 = sdiv i32 %mul139, 2, !dbg !2447
  %add141 = add nsw i32 %123, %div140, !dbg !2448
  %add142 = add nsw i32 %add141, 15, !dbg !2449
  %div143 = sdiv i32 %add142, 16, !dbg !2450
  %mul144 = mul i32 %121, %div143, !dbg !2451
  %cmp145 = icmp ult i32 %120, %mul144, !dbg !2452
  br i1 %cmp145, label %for.body146, label %for.end150, !dbg !2453

for.body146:                                      ; preds = %for.cond134
  %arraydecay = getelementptr inbounds [3744 x i64], ptr %A, i32 0, i32 0, !dbg !2454
  %128 = load i32, ptr %c133, align 4, !dbg !2456
  %add.ptr147 = getelementptr inbounds nuw i64, ptr %arraydecay, i32 %128, !dbg !2457
  call void @transpose_16x16_nibbles(ptr noundef %add.ptr147) #5, !dbg !2458
  br label %for.inc148, !dbg !2459

for.inc148:                                       ; preds = %for.body146
  %129 = load i32, ptr %c133, align 4, !dbg !2460
  %add149 = add i32 %129, 16, !dbg !2460
  store i32 %add149, ptr %c133, align 4, !dbg !2460
  br label %for.cond134, !dbg !2461, !llvm.loop !2462

for.end150:                                       ; preds = %for.cond134
    #dbg_declare(ptr %tab, !2464, !DIExpression(), !2468)
  call void @llvm.memset.p0.i32(ptr align 1 %tab, i8 0, i32 16, i1 false), !dbg !2468
    #dbg_declare(ptr %i151, !2469, !DIExpression(), !2471)
  store i32 0, ptr %i151, align 4, !dbg !2471
  br label %for.cond152, !dbg !2472

for.cond152:                                      ; preds = %for.inc176, %for.end150
  %130 = load i32, ptr %i151, align 4, !dbg !2473
  %cmp153 = icmp ult i32 %130, 4, !dbg !2475
  br i1 %cmp153, label %for.body154, label %for.end178, !dbg !2476

for.body154:                                      ; preds = %for.cond152
  %131 = load ptr, ptr %p.addr, align 4, !dbg !2477
  %f_tail = getelementptr inbounds nuw %struct.mayo_params_t, ptr %131, i32 0, i32 5, !dbg !2479
  %132 = load ptr, ptr %f_tail, align 4, !dbg !2479
  %133 = load i32, ptr %i151, align 4, !dbg !2480
  %arrayidx155 = getelementptr inbounds nuw i8, ptr %132, i32 %133, !dbg !2479
  %134 = load i8, ptr %arrayidx155, align 1, !dbg !2479
  %call = call zeroext i8 @mul_f(i8 noundef zeroext %134, i8 noundef zeroext 1) #5, !dbg !2481
  %135 = load i32, ptr %i151, align 4, !dbg !2482
  %mul156 = mul i32 4, %135, !dbg !2483
  %arrayidx157 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %mul156, !dbg !2484
  store i8 %call, ptr %arrayidx157, align 1, !dbg !2485
  %136 = load ptr, ptr %p.addr, align 4, !dbg !2486
  %f_tail158 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %136, i32 0, i32 5, !dbg !2487
  %137 = load ptr, ptr %f_tail158, align 4, !dbg !2487
  %138 = load i32, ptr %i151, align 4, !dbg !2488
  %arrayidx159 = getelementptr inbounds nuw i8, ptr %137, i32 %138, !dbg !2487
  %139 = load i8, ptr %arrayidx159, align 1, !dbg !2487
  %call160 = call zeroext i8 @mul_f(i8 noundef zeroext %139, i8 noundef zeroext 2) #5, !dbg !2489
  %140 = load i32, ptr %i151, align 4, !dbg !2490
  %mul161 = mul i32 4, %140, !dbg !2491
  %add162 = add i32 %mul161, 1, !dbg !2492
  %arrayidx163 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add162, !dbg !2493
  store i8 %call160, ptr %arrayidx163, align 1, !dbg !2494
  %141 = load ptr, ptr %p.addr, align 4, !dbg !2495
  %f_tail164 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %141, i32 0, i32 5, !dbg !2496
  %142 = load ptr, ptr %f_tail164, align 4, !dbg !2496
  %143 = load i32, ptr %i151, align 4, !dbg !2497
  %arrayidx165 = getelementptr inbounds nuw i8, ptr %142, i32 %143, !dbg !2496
  %144 = load i8, ptr %arrayidx165, align 1, !dbg !2496
  %call166 = call zeroext i8 @mul_f(i8 noundef zeroext %144, i8 noundef zeroext 4) #5, !dbg !2498
  %145 = load i32, ptr %i151, align 4, !dbg !2499
  %mul167 = mul i32 4, %145, !dbg !2500
  %add168 = add i32 %mul167, 2, !dbg !2501
  %arrayidx169 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add168, !dbg !2502
  store i8 %call166, ptr %arrayidx169, align 1, !dbg !2503
  %146 = load ptr, ptr %p.addr, align 4, !dbg !2504
  %f_tail170 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %146, i32 0, i32 5, !dbg !2505
  %147 = load ptr, ptr %f_tail170, align 4, !dbg !2505
  %148 = load i32, ptr %i151, align 4, !dbg !2506
  %arrayidx171 = getelementptr inbounds nuw i8, ptr %147, i32 %148, !dbg !2505
  %149 = load i8, ptr %arrayidx171, align 1, !dbg !2505
  %call172 = call zeroext i8 @mul_f(i8 noundef zeroext %149, i8 noundef zeroext 8) #5, !dbg !2507
  %150 = load i32, ptr %i151, align 4, !dbg !2508
  %mul173 = mul i32 4, %150, !dbg !2509
  %add174 = add i32 %mul173, 3, !dbg !2510
  %arrayidx175 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add174, !dbg !2511
  store i8 %call172, ptr %arrayidx175, align 1, !dbg !2512
  br label %for.inc176, !dbg !2513

for.inc176:                                       ; preds = %for.body154
  %151 = load i32, ptr %i151, align 4, !dbg !2514
  %inc177 = add i32 %151, 1, !dbg !2514
  store i32 %inc177, ptr %i151, align 4, !dbg !2514
  br label %for.cond152, !dbg !2515, !llvm.loop !2516

for.end178:                                       ; preds = %for.cond152
    #dbg_declare(ptr %low_bit_in_nibble, !2518, !DIExpression(), !2519)
  store i64 1229782938247303441, ptr %low_bit_in_nibble, align 8, !dbg !2519
    #dbg_declare(ptr %c179, !2520, !DIExpression(), !2522)
  store i32 0, ptr %c179, align 4, !dbg !2522
  br label %for.cond180, !dbg !2523

for.cond180:                                      ; preds = %for.inc254, %for.end178
  %152 = load i32, ptr %c179, align 4, !dbg !2524
  %153 = load i32, ptr %A_width, align 4, !dbg !2526
  %cmp181 = icmp ult i32 %152, %153, !dbg !2527
  br i1 %cmp181, label %for.body182, label %for.end256, !dbg !2528

for.body182:                                      ; preds = %for.cond180
    #dbg_declare(ptr %r, !2529, !DIExpression(), !2532)
  %154 = load ptr, ptr %p.addr, align 4, !dbg !2533
  %m183 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %154, i32 0, i32 0, !dbg !2534
  %155 = load i32, ptr %m183, align 4, !dbg !2534
  store i32 %155, ptr %r, align 4, !dbg !2532
  br label %for.cond184, !dbg !2535

for.cond184:                                      ; preds = %for.inc251, %for.body182
  %156 = load i32, ptr %r, align 4, !dbg !2536
  %157 = load ptr, ptr %p.addr, align 4, !dbg !2538
  %m185 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %157, i32 0, i32 0, !dbg !2539
  %158 = load i32, ptr %m185, align 4, !dbg !2539
  %159 = load ptr, ptr %p.addr, align 4, !dbg !2540
  %k186 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %159, i32 0, i32 3, !dbg !2541
  %160 = load i32, ptr %k186, align 4, !dbg !2541
  %add187 = add nsw i32 %160, 1, !dbg !2542
  %161 = load ptr, ptr %p.addr, align 4, !dbg !2543
  %k188 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %161, i32 0, i32 3, !dbg !2544
  %162 = load i32, ptr %k188, align 4, !dbg !2544
  %mul189 = mul nsw i32 %add187, %162, !dbg !2545
  %div190 = sdiv i32 %mul189, 2, !dbg !2546
  %add191 = add nsw i32 %158, %div190, !dbg !2547
  %cmp192 = icmp slt i32 %156, %add191, !dbg !2548
  br i1 %cmp192, label %for.body193, label %for.end253, !dbg !2549

for.body193:                                      ; preds = %for.cond184
    #dbg_declare(ptr %pos, !2550, !DIExpression(), !2552)
  %163 = load i32, ptr %r, align 4, !dbg !2553
  %div194 = sdiv i32 %163, 16, !dbg !2554
  %164 = load i32, ptr %A_width, align 4, !dbg !2555
  %mul195 = mul i32 %div194, %164, !dbg !2556
  %165 = load i32, ptr %c179, align 4, !dbg !2557
  %add196 = add i32 %mul195, %165, !dbg !2558
  %166 = load i32, ptr %r, align 4, !dbg !2559
  %rem197 = srem i32 %166, 16, !dbg !2560
  %add198 = add i32 %add196, %rem197, !dbg !2561
  store i32 %add198, ptr %pos, align 4, !dbg !2552
    #dbg_declare(ptr %t0, !2562, !DIExpression(), !2563)
  %167 = load i32, ptr %pos, align 4, !dbg !2564
  %arrayidx199 = getelementptr inbounds nuw [3744 x i64], ptr %A, i32 0, i32 %167, !dbg !2565
  %168 = load i64, ptr %arrayidx199, align 8, !dbg !2565
  %169 = load i64, ptr %low_bit_in_nibble, align 8, !dbg !2566
  %and200 = and i64 %168, %169, !dbg !2567
  store i64 %and200, ptr %t0, align 8, !dbg !2563
    #dbg_declare(ptr %t1, !2568, !DIExpression(), !2569)
  %170 = load i32, ptr %pos, align 4, !dbg !2570
  %arrayidx201 = getelementptr inbounds nuw [3744 x i64], ptr %A, i32 0, i32 %170, !dbg !2571
  %171 = load i64, ptr %arrayidx201, align 8, !dbg !2571
  %shr202 = lshr i64 %171, 1, !dbg !2572
  %172 = load i64, ptr %low_bit_in_nibble, align 8, !dbg !2573
  %and203 = and i64 %shr202, %172, !dbg !2574
  store i64 %and203, ptr %t1, align 8, !dbg !2569
    #dbg_declare(ptr %t2, !2575, !DIExpression(), !2576)
  %173 = load i32, ptr %pos, align 4, !dbg !2577
  %arrayidx204 = getelementptr inbounds nuw [3744 x i64], ptr %A, i32 0, i32 %173, !dbg !2578
  %174 = load i64, ptr %arrayidx204, align 8, !dbg !2578
  %shr205 = lshr i64 %174, 2, !dbg !2579
  %175 = load i64, ptr %low_bit_in_nibble, align 8, !dbg !2580
  %and206 = and i64 %shr205, %175, !dbg !2581
  store i64 %and206, ptr %t2, align 8, !dbg !2576
    #dbg_declare(ptr %t3, !2582, !DIExpression(), !2583)
  %176 = load i32, ptr %pos, align 4, !dbg !2584
  %arrayidx207 = getelementptr inbounds nuw [3744 x i64], ptr %A, i32 0, i32 %176, !dbg !2585
  %177 = load i64, ptr %arrayidx207, align 8, !dbg !2585
  %shr208 = lshr i64 %177, 3, !dbg !2586
  %178 = load i64, ptr %low_bit_in_nibble, align 8, !dbg !2587
  %and209 = and i64 %shr208, %178, !dbg !2588
  store i64 %and209, ptr %t3, align 8, !dbg !2583
    #dbg_declare(ptr %t, !2589, !DIExpression(), !2591)
  store i32 0, ptr %t, align 4, !dbg !2591
  br label %for.cond210, !dbg !2592

for.cond210:                                      ; preds = %for.inc248, %for.body193
  %179 = load i32, ptr %t, align 4, !dbg !2593
  %cmp211 = icmp ult i32 %179, 4, !dbg !2595
  br i1 %cmp211, label %for.body212, label %for.end250, !dbg !2596

for.body212:                                      ; preds = %for.cond210
  %180 = load i64, ptr %t0, align 8, !dbg !2597
  %181 = load i32, ptr %t, align 4, !dbg !2599
  %mul213 = mul i32 4, %181, !dbg !2600
  %add214 = add i32 %mul213, 0, !dbg !2601
  %arrayidx215 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add214, !dbg !2602
  %182 = load i8, ptr %arrayidx215, align 1, !dbg !2602
  %conv = zext i8 %182 to i64, !dbg !2602
  %mul216 = mul i64 %180, %conv, !dbg !2603
  %183 = load i64, ptr %t1, align 8, !dbg !2604
  %184 = load i32, ptr %t, align 4, !dbg !2605
  %mul217 = mul i32 4, %184, !dbg !2606
  %add218 = add i32 %mul217, 1, !dbg !2607
  %arrayidx219 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add218, !dbg !2608
  %185 = load i8, ptr %arrayidx219, align 1, !dbg !2608
  %conv220 = zext i8 %185 to i64, !dbg !2608
  %mul221 = mul i64 %183, %conv220, !dbg !2609
  %xor222 = xor i64 %mul216, %mul221, !dbg !2610
  %186 = load i64, ptr %t2, align 8, !dbg !2611
  %187 = load i32, ptr %t, align 4, !dbg !2612
  %mul223 = mul i32 4, %187, !dbg !2613
  %add224 = add i32 %mul223, 2, !dbg !2614
  %arrayidx225 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add224, !dbg !2615
  %188 = load i8, ptr %arrayidx225, align 1, !dbg !2615
  %conv226 = zext i8 %188 to i64, !dbg !2615
  %mul227 = mul i64 %186, %conv226, !dbg !2616
  %xor228 = xor i64 %xor222, %mul227, !dbg !2617
  %189 = load i64, ptr %t3, align 8, !dbg !2618
  %190 = load i32, ptr %t, align 4, !dbg !2619
  %mul229 = mul i32 4, %190, !dbg !2620
  %add230 = add i32 %mul229, 3, !dbg !2621
  %arrayidx231 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add230, !dbg !2622
  %191 = load i8, ptr %arrayidx231, align 1, !dbg !2622
  %conv232 = zext i8 %191 to i64, !dbg !2622
  %mul233 = mul i64 %189, %conv232, !dbg !2623
  %xor234 = xor i64 %xor228, %mul233, !dbg !2624
  %192 = load i32, ptr %r, align 4, !dbg !2625
  %193 = load i32, ptr %t, align 4, !dbg !2626
  %add235 = add i32 %192, %193, !dbg !2627
  %194 = load ptr, ptr %p.addr, align 4, !dbg !2628
  %m236 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %194, i32 0, i32 0, !dbg !2629
  %195 = load i32, ptr %m236, align 4, !dbg !2629
  %sub237 = sub i32 %add235, %195, !dbg !2630
  %div238 = udiv i32 %sub237, 16, !dbg !2631
  %196 = load i32, ptr %A_width, align 4, !dbg !2632
  %mul239 = mul i32 %div238, %196, !dbg !2633
  %197 = load i32, ptr %c179, align 4, !dbg !2634
  %add240 = add i32 %mul239, %197, !dbg !2635
  %198 = load i32, ptr %r, align 4, !dbg !2636
  %199 = load i32, ptr %t, align 4, !dbg !2637
  %add241 = add i32 %198, %199, !dbg !2638
  %200 = load ptr, ptr %p.addr, align 4, !dbg !2639
  %m242 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %200, i32 0, i32 0, !dbg !2640
  %201 = load i32, ptr %m242, align 4, !dbg !2640
  %sub243 = sub i32 %add241, %201, !dbg !2641
  %rem244 = urem i32 %sub243, 16, !dbg !2642
  %add245 = add i32 %add240, %rem244, !dbg !2643
  %arrayidx246 = getelementptr inbounds nuw [3744 x i64], ptr %A, i32 0, i32 %add245, !dbg !2644
  %202 = load i64, ptr %arrayidx246, align 8, !dbg !2645
  %xor247 = xor i64 %202, %xor234, !dbg !2645
  store i64 %xor247, ptr %arrayidx246, align 8, !dbg !2645
  br label %for.inc248, !dbg !2646

for.inc248:                                       ; preds = %for.body212
  %203 = load i32, ptr %t, align 4, !dbg !2647
  %inc249 = add i32 %203, 1, !dbg !2647
  store i32 %inc249, ptr %t, align 4, !dbg !2647
  br label %for.cond210, !dbg !2648, !llvm.loop !2649

for.end250:                                       ; preds = %for.cond210
  br label %for.inc251, !dbg !2651

for.inc251:                                       ; preds = %for.end250
  %204 = load i32, ptr %r, align 4, !dbg !2652
  %inc252 = add nsw i32 %204, 1, !dbg !2652
  store i32 %inc252, ptr %r, align 4, !dbg !2652
  br label %for.cond184, !dbg !2653, !llvm.loop !2654

for.end253:                                       ; preds = %for.cond184
  br label %for.inc254, !dbg !2656

for.inc254:                                       ; preds = %for.end253
  %205 = load i32, ptr %c179, align 4, !dbg !2657
  %add255 = add i32 %205, 16, !dbg !2657
  store i32 %add255, ptr %c179, align 4, !dbg !2657
  br label %for.cond180, !dbg !2658, !llvm.loop !2659

for.end256:                                       ; preds = %for.cond180
    #dbg_declare(ptr %r257, !2661, !DIExpression(), !2663)
  store i32 0, ptr %r257, align 4, !dbg !2663
  br label %for.cond258, !dbg !2664

for.cond258:                                      ; preds = %for.inc313, %for.end256
  %206 = load i32, ptr %r257, align 4, !dbg !2665
  %207 = load ptr, ptr %p.addr, align 4, !dbg !2667
  %m259 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %207, i32 0, i32 0, !dbg !2668
  %208 = load i32, ptr %m259, align 4, !dbg !2668
  %cmp260 = icmp slt i32 %206, %208, !dbg !2669
  br i1 %cmp260, label %for.body262, label %for.end315, !dbg !2670

for.body262:                                      ; preds = %for.cond258
    #dbg_declare(ptr %c263, !2671, !DIExpression(), !2674)
  store i32 0, ptr %c263, align 4, !dbg !2674
  br label %for.cond264, !dbg !2675

for.cond264:                                      ; preds = %for.inc310, %for.body262
  %209 = load i32, ptr %c263, align 4, !dbg !2676
  %210 = load ptr, ptr %p.addr, align 4, !dbg !2678
  %k265 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %210, i32 0, i32 3, !dbg !2679
  %211 = load i32, ptr %k265, align 4, !dbg !2679
  %212 = load ptr, ptr %p.addr, align 4, !dbg !2678
  %o266 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %212, i32 0, i32 2, !dbg !2679
  %213 = load i32, ptr %o266, align 4, !dbg !2679
  %mul267 = mul nsw i32 %211, %213, !dbg !2679
  %add268 = add nsw i32 %mul267, 1, !dbg !2679
  %sub269 = sub nsw i32 %add268, 1, !dbg !2680
  %cmp270 = icmp slt i32 %209, %sub269, !dbg !2681
  br i1 %cmp270, label %for.body272, label %for.end312, !dbg !2682

for.body272:                                      ; preds = %for.cond264
    #dbg_declare(ptr %i273, !2683, !DIExpression(), !2686)
  store i32 0, ptr %i273, align 4, !dbg !2686
  br label %for.cond274, !dbg !2687

for.cond274:                                      ; preds = %for.inc307, %for.body272
  %214 = load i32, ptr %i273, align 4, !dbg !2688
  %215 = load i32, ptr %r257, align 4, !dbg !2690
  %add275 = add nsw i32 %214, %215, !dbg !2691
  %216 = load ptr, ptr %p.addr, align 4, !dbg !2692
  %m276 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %216, i32 0, i32 0, !dbg !2693
  %217 = load i32, ptr %m276, align 4, !dbg !2693
  %cmp277 = icmp slt i32 %add275, %217, !dbg !2694
  br i1 %cmp277, label %for.body279, label %for.end309, !dbg !2695

for.body279:                                      ; preds = %for.cond274
  %218 = load i32, ptr %r257, align 4, !dbg !2696
  %219 = load i32, ptr %A_width, align 4, !dbg !2698
  %mul280 = mul i32 %218, %219, !dbg !2699
  %div281 = udiv i32 %mul280, 16, !dbg !2700
  %220 = load i32, ptr %c263, align 4, !dbg !2701
  %add282 = add i32 %div281, %220, !dbg !2702
  %221 = load i32, ptr %i273, align 4, !dbg !2703
  %add283 = add i32 %add282, %221, !dbg !2704
  %arrayidx284 = getelementptr inbounds nuw [3744 x i64], ptr %A, i32 0, i32 %add283, !dbg !2705
  %222 = load ptr, ptr %A_out.addr, align 4, !dbg !2706
  %223 = load ptr, ptr %p.addr, align 4, !dbg !2707
  %k285 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %223, i32 0, i32 3, !dbg !2708
  %224 = load i32, ptr %k285, align 4, !dbg !2708
  %225 = load ptr, ptr %p.addr, align 4, !dbg !2707
  %o286 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %225, i32 0, i32 2, !dbg !2708
  %226 = load i32, ptr %o286, align 4, !dbg !2708
  %mul287 = mul nsw i32 %224, %226, !dbg !2708
  %add288 = add nsw i32 %mul287, 1, !dbg !2708
  %227 = load i32, ptr %r257, align 4, !dbg !2709
  %228 = load i32, ptr %i273, align 4, !dbg !2710
  %add289 = add nsw i32 %227, %228, !dbg !2711
  %mul290 = mul nsw i32 %add288, %add289, !dbg !2712
  %add.ptr291 = getelementptr inbounds i8, ptr %222, i32 %mul290, !dbg !2713
  %229 = load i32, ptr %c263, align 4, !dbg !2714
  %add.ptr292 = getelementptr inbounds i8, ptr %add.ptr291, i32 %229, !dbg !2715
  %230 = load ptr, ptr %p.addr, align 4, !dbg !2716
  %k293 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %230, i32 0, i32 3, !dbg !2717
  %231 = load i32, ptr %k293, align 4, !dbg !2717
  %232 = load ptr, ptr %p.addr, align 4, !dbg !2716
  %o294 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %232, i32 0, i32 2, !dbg !2717
  %233 = load i32, ptr %o294, align 4, !dbg !2717
  %mul295 = mul nsw i32 %231, %233, !dbg !2717
  %add296 = add nsw i32 %mul295, 1, !dbg !2717
  %sub297 = sub nsw i32 %add296, 1, !dbg !2718
  %234 = load i32, ptr %c263, align 4, !dbg !2719
  %sub298 = sub nsw i32 %sub297, %234, !dbg !2720
  %cmp299 = icmp slt i32 16, %sub298, !dbg !2721
  br i1 %cmp299, label %cond.true, label %cond.false, !dbg !2721

cond.true:                                        ; preds = %for.body279
  br label %cond.end, !dbg !2721

cond.false:                                       ; preds = %for.body279
  %235 = load ptr, ptr %p.addr, align 4, !dbg !2716
  %k301 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %235, i32 0, i32 3, !dbg !2717
  %236 = load i32, ptr %k301, align 4, !dbg !2717
  %237 = load ptr, ptr %p.addr, align 4, !dbg !2716
  %o302 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %237, i32 0, i32 2, !dbg !2717
  %238 = load i32, ptr %o302, align 4, !dbg !2717
  %mul303 = mul nsw i32 %236, %238, !dbg !2717
  %add304 = add nsw i32 %mul303, 1, !dbg !2717
  %sub305 = sub nsw i32 %add304, 1, !dbg !2718
  %239 = load i32, ptr %c263, align 4, !dbg !2719
  %sub306 = sub nsw i32 %sub305, %239, !dbg !2720
  br label %cond.end, !dbg !2721

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 16, %cond.true ], [ %sub306, %cond.false ], !dbg !2721
  call void @decode(ptr noundef %arrayidx284, ptr noundef %add.ptr292, i32 noundef %cond) #5, !dbg !2722
  br label %for.inc307, !dbg !2723

for.inc307:                                       ; preds = %cond.end
  %240 = load i32, ptr %i273, align 4, !dbg !2724
  %inc308 = add nsw i32 %240, 1, !dbg !2724
  store i32 %inc308, ptr %i273, align 4, !dbg !2724
  br label %for.cond274, !dbg !2725, !llvm.loop !2726

for.end309:                                       ; preds = %for.cond274
  br label %for.inc310, !dbg !2728

for.inc310:                                       ; preds = %for.end309
  %241 = load i32, ptr %c263, align 4, !dbg !2729
  %add311 = add nsw i32 %241, 16, !dbg !2729
  store i32 %add311, ptr %c263, align 4, !dbg !2729
  br label %for.cond264, !dbg !2730, !llvm.loop !2731

for.end312:                                       ; preds = %for.cond264
  br label %for.inc313, !dbg !2733

for.inc313:                                       ; preds = %for.end312
  %242 = load i32, ptr %r257, align 4, !dbg !2734
  %add314 = add nsw i32 %242, 16, !dbg !2734
  store i32 %add314, ptr %r257, align 4, !dbg !2734
  br label %for.cond258, !dbg !2735, !llvm.loop !2736

for.end315:                                       ; preds = %for.cond258
  ret void, !dbg !2738
}

declare dso_local i32 @sample_solution(ptr noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef) #4

; Function Attrs: noinline nounwind optnone
define internal void @mat_mul(ptr noundef %a, ptr noundef %b, ptr noundef %c, i32 noundef %colrow_ab, i32 noundef %row_a, i32 noundef %col_b) #0 !dbg !2739 {
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
    #dbg_declare(ptr %a.addr, !2742, !DIExpression(), !2743)
  store ptr %b, ptr %b.addr, align 4
    #dbg_declare(ptr %b.addr, !2744, !DIExpression(), !2745)
  store ptr %c, ptr %c.addr, align 4
    #dbg_declare(ptr %c.addr, !2746, !DIExpression(), !2747)
  store i32 %colrow_ab, ptr %colrow_ab.addr, align 4
    #dbg_declare(ptr %colrow_ab.addr, !2748, !DIExpression(), !2749)
  store i32 %row_a, ptr %row_a.addr, align 4
    #dbg_declare(ptr %row_a.addr, !2750, !DIExpression(), !2751)
  store i32 %col_b, ptr %col_b.addr, align 4
    #dbg_declare(ptr %col_b.addr, !2752, !DIExpression(), !2753)
    #dbg_declare(ptr %i, !2754, !DIExpression(), !2756)
  store i32 0, ptr %i, align 4, !dbg !2756
  br label %for.cond, !dbg !2757

for.cond:                                         ; preds = %for.inc4, %entry
  %0 = load i32, ptr %i, align 4, !dbg !2758
  %1 = load i32, ptr %row_a.addr, align 4, !dbg !2760
  %cmp = icmp slt i32 %0, %1, !dbg !2761
  br i1 %cmp, label %for.body, label %for.end7, !dbg !2762

for.body:                                         ; preds = %for.cond
    #dbg_declare(ptr %j, !2763, !DIExpression(), !2766)
  store i32 0, ptr %j, align 4, !dbg !2766
  br label %for.cond1, !dbg !2767

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, ptr %j, align 4, !dbg !2768
  %3 = load i32, ptr %col_b.addr, align 4, !dbg !2770
  %cmp2 = icmp slt i32 %2, %3, !dbg !2771
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !2772

for.body3:                                        ; preds = %for.cond1
  %4 = load ptr, ptr %a.addr, align 4, !dbg !2773
  %5 = load ptr, ptr %b.addr, align 4, !dbg !2775
  %6 = load i32, ptr %j, align 4, !dbg !2776
  %add.ptr = getelementptr inbounds i8, ptr %5, i32 %6, !dbg !2777
  %7 = load i32, ptr %colrow_ab.addr, align 4, !dbg !2778
  %8 = load i32, ptr %col_b.addr, align 4, !dbg !2779
  %call = call zeroext i8 @lincomb(ptr noundef %4, ptr noundef %add.ptr, i32 noundef %7, i32 noundef %8) #5, !dbg !2780
  %9 = load ptr, ptr %c.addr, align 4, !dbg !2781
  store i8 %call, ptr %9, align 1, !dbg !2782
  br label %for.inc, !dbg !2783

for.inc:                                          ; preds = %for.body3
  %10 = load i32, ptr %j, align 4, !dbg !2784
  %inc = add nsw i32 %10, 1, !dbg !2784
  store i32 %inc, ptr %j, align 4, !dbg !2784
  %11 = load ptr, ptr %c.addr, align 4, !dbg !2785
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %11, i32 1, !dbg !2785
  store ptr %incdec.ptr, ptr %c.addr, align 4, !dbg !2785
  br label %for.cond1, !dbg !2786, !llvm.loop !2787

for.end:                                          ; preds = %for.cond1
  br label %for.inc4, !dbg !2789

for.inc4:                                         ; preds = %for.end
  %12 = load i32, ptr %i, align 4, !dbg !2790
  %inc5 = add nsw i32 %12, 1, !dbg !2790
  store i32 %inc5, ptr %i, align 4, !dbg !2790
  %13 = load i32, ptr %colrow_ab.addr, align 4, !dbg !2791
  %14 = load ptr, ptr %a.addr, align 4, !dbg !2792
  %add.ptr6 = getelementptr inbounds i8, ptr %14, i32 %13, !dbg !2792
  store ptr %add.ptr6, ptr %a.addr, align 4, !dbg !2792
  br label %for.cond, !dbg !2793, !llvm.loop !2794

for.end7:                                         ; preds = %for.cond
  ret void, !dbg !2796
}

; Function Attrs: noinline nounwind optnone
define internal void @mat_add(ptr noundef %a, ptr noundef %b, ptr noundef %c, i32 noundef %m, i32 noundef %n) #0 !dbg !2797 {
entry:
  %a.addr = alloca ptr, align 4
  %b.addr = alloca ptr, align 4
  %c.addr = alloca ptr, align 4
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store ptr %a, ptr %a.addr, align 4
    #dbg_declare(ptr %a.addr, !2800, !DIExpression(), !2801)
  store ptr %b, ptr %b.addr, align 4
    #dbg_declare(ptr %b.addr, !2802, !DIExpression(), !2803)
  store ptr %c, ptr %c.addr, align 4
    #dbg_declare(ptr %c.addr, !2804, !DIExpression(), !2805)
  store i32 %m, ptr %m.addr, align 4
    #dbg_declare(ptr %m.addr, !2806, !DIExpression(), !2807)
  store i32 %n, ptr %n.addr, align 4
    #dbg_declare(ptr %n.addr, !2808, !DIExpression(), !2809)
    #dbg_declare(ptr %i, !2810, !DIExpression(), !2812)
  store i32 0, ptr %i, align 4, !dbg !2812
  br label %for.cond, !dbg !2813

for.cond:                                         ; preds = %for.inc11, %entry
  %0 = load i32, ptr %i, align 4, !dbg !2814
  %1 = load i32, ptr %m.addr, align 4, !dbg !2816
  %cmp = icmp slt i32 %0, %1, !dbg !2817
  br i1 %cmp, label %for.body, label %for.end13, !dbg !2818

for.body:                                         ; preds = %for.cond
    #dbg_declare(ptr %j, !2819, !DIExpression(), !2822)
  store i32 0, ptr %j, align 4, !dbg !2822
  br label %for.cond1, !dbg !2823

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, ptr %j, align 4, !dbg !2824
  %3 = load i32, ptr %n.addr, align 4, !dbg !2826
  %cmp2 = icmp slt i32 %2, %3, !dbg !2827
  br i1 %cmp2, label %for.body3, label %for.end, !dbg !2828

for.body3:                                        ; preds = %for.cond1
  %4 = load ptr, ptr %a.addr, align 4, !dbg !2829
  %5 = load i32, ptr %i, align 4, !dbg !2831
  %6 = load i32, ptr %n.addr, align 4, !dbg !2832
  %mul = mul nsw i32 %5, %6, !dbg !2833
  %add.ptr = getelementptr inbounds i8, ptr %4, i32 %mul, !dbg !2834
  %7 = load i32, ptr %j, align 4, !dbg !2835
  %add.ptr4 = getelementptr inbounds i8, ptr %add.ptr, i32 %7, !dbg !2834
  %8 = load i8, ptr %add.ptr4, align 1, !dbg !2834
  %9 = load ptr, ptr %b.addr, align 4, !dbg !2836
  %10 = load i32, ptr %i, align 4, !dbg !2837
  %11 = load i32, ptr %n.addr, align 4, !dbg !2838
  %mul5 = mul nsw i32 %10, %11, !dbg !2839
  %add.ptr6 = getelementptr inbounds i8, ptr %9, i32 %mul5, !dbg !2840
  %12 = load i32, ptr %j, align 4, !dbg !2841
  %add.ptr7 = getelementptr inbounds i8, ptr %add.ptr6, i32 %12, !dbg !2840
  %13 = load i8, ptr %add.ptr7, align 1, !dbg !2840
  %call = call zeroext i8 @add_f(i8 noundef zeroext %8, i8 noundef zeroext %13) #5, !dbg !2842
  %14 = load ptr, ptr %c.addr, align 4, !dbg !2843
  %15 = load i32, ptr %i, align 4, !dbg !2844
  %16 = load i32, ptr %n.addr, align 4, !dbg !2845
  %mul8 = mul nsw i32 %15, %16, !dbg !2846
  %add.ptr9 = getelementptr inbounds i8, ptr %14, i32 %mul8, !dbg !2847
  %17 = load i32, ptr %j, align 4, !dbg !2848
  %add.ptr10 = getelementptr inbounds i8, ptr %add.ptr9, i32 %17, !dbg !2847
  store i8 %call, ptr %add.ptr10, align 1, !dbg !2849
  br label %for.inc, !dbg !2850

for.inc:                                          ; preds = %for.body3
  %18 = load i32, ptr %j, align 4, !dbg !2851
  %inc = add nsw i32 %18, 1, !dbg !2851
  store i32 %inc, ptr %j, align 4, !dbg !2851
  br label %for.cond1, !dbg !2852, !llvm.loop !2853

for.end:                                          ; preds = %for.cond1
  br label %for.inc11, !dbg !2855

for.inc11:                                        ; preds = %for.end
  %19 = load i32, ptr %i, align 4, !dbg !2856
  %inc12 = add nsw i32 %19, 1, !dbg !2856
  store i32 %inc12, ptr %i, align 4, !dbg !2856
  br label %for.cond, !dbg !2857, !llvm.loop !2858

for.end13:                                        ; preds = %for.cond
  ret void, !dbg !2860
}

; Function Attrs: noinline nounwind optnone
define internal void @encode(ptr noundef %m, ptr noundef %menc, i32 noundef %mlen) #0 !dbg !2861 {
entry:
  %m.addr = alloca ptr, align 4
  %menc.addr = alloca ptr, align 4
  %mlen.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store ptr %m, ptr %m.addr, align 4
    #dbg_declare(ptr %m.addr, !2862, !DIExpression(), !2863)
  store ptr %menc, ptr %menc.addr, align 4
    #dbg_declare(ptr %menc.addr, !2864, !DIExpression(), !2865)
  store i32 %mlen, ptr %mlen.addr, align 4
    #dbg_declare(ptr %mlen.addr, !2866, !DIExpression(), !2867)
    #dbg_declare(ptr %i, !2868, !DIExpression(), !2869)
  store i32 0, ptr %i, align 4, !dbg !2870
  br label %for.cond, !dbg !2872

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4, !dbg !2873
  %1 = load i32, ptr %mlen.addr, align 4, !dbg !2875
  %div = sdiv i32 %1, 2, !dbg !2876
  %cmp = icmp slt i32 %0, %div, !dbg !2877
  br i1 %cmp, label %for.body, label %for.end, !dbg !2878

for.body:                                         ; preds = %for.cond
  %2 = load ptr, ptr %m.addr, align 4, !dbg !2879
  %3 = load i8, ptr %2, align 1, !dbg !2881
  %conv = zext i8 %3 to i32, !dbg !2882
  %4 = load ptr, ptr %m.addr, align 4, !dbg !2883
  %add.ptr = getelementptr inbounds i8, ptr %4, i32 1, !dbg !2884
  %5 = load i8, ptr %add.ptr, align 1, !dbg !2884
  %conv1 = zext i8 %5 to i32, !dbg !2884
  %shl = shl i32 %conv1, 4, !dbg !2885
  %or = or i32 %conv, %shl, !dbg !2886
  %conv2 = trunc i32 %or to i8, !dbg !2882
  %6 = load ptr, ptr %menc.addr, align 4, !dbg !2887
  %7 = load i32, ptr %i, align 4, !dbg !2888
  %arrayidx = getelementptr inbounds i8, ptr %6, i32 %7, !dbg !2887
  store i8 %conv2, ptr %arrayidx, align 1, !dbg !2889
  br label %for.inc, !dbg !2890

for.inc:                                          ; preds = %for.body
  %8 = load i32, ptr %i, align 4, !dbg !2891
  %inc = add nsw i32 %8, 1, !dbg !2891
  store i32 %inc, ptr %i, align 4, !dbg !2891
  %9 = load ptr, ptr %m.addr, align 4, !dbg !2892
  %add.ptr3 = getelementptr inbounds i8, ptr %9, i32 2, !dbg !2892
  store ptr %add.ptr3, ptr %m.addr, align 4, !dbg !2892
  br label %for.cond, !dbg !2893, !llvm.loop !2894

for.end:                                          ; preds = %for.cond
  %10 = load i32, ptr %mlen.addr, align 4, !dbg !2896
  %rem = srem i32 %10, 2, !dbg !2898
  %cmp4 = icmp eq i32 %rem, 1, !dbg !2899
  br i1 %cmp4, label %if.then, label %if.end, !dbg !2899

if.then:                                          ; preds = %for.end
  %11 = load ptr, ptr %m.addr, align 4, !dbg !2900
  %12 = load i8, ptr %11, align 1, !dbg !2902
  %13 = load ptr, ptr %menc.addr, align 4, !dbg !2903
  %14 = load i32, ptr %i, align 4, !dbg !2904
  %arrayidx6 = getelementptr inbounds i8, ptr %13, i32 %14, !dbg !2903
  store i8 %12, ptr %arrayidx6, align 1, !dbg !2905
  br label %if.end, !dbg !2906

if.end:                                           ; preds = %if.then, %for.end
  ret void, !dbg !2907
}

; Function Attrs: noinline nounwind optnone
define internal zeroext i8 @add_f(i8 noundef zeroext %a, i8 noundef zeroext %b) #0 !dbg !2908 {
entry:
  %a.addr = alloca i8, align 1
  %b.addr = alloca i8, align 1
  store i8 %a, ptr %a.addr, align 1
    #dbg_declare(ptr %a.addr, !2911, !DIExpression(), !2912)
  store i8 %b, ptr %b.addr, align 1
    #dbg_declare(ptr %b.addr, !2913, !DIExpression(), !2914)
  %0 = load i8, ptr %a.addr, align 1, !dbg !2915
  %conv = zext i8 %0 to i32, !dbg !2915
  %1 = load i8, ptr %b.addr, align 1, !dbg !2916
  %conv1 = zext i8 %1 to i32, !dbg !2916
  %xor = xor i32 %conv, %conv1, !dbg !2917
  %conv2 = trunc i32 %xor to i8, !dbg !2915
  ret i8 %conv2, !dbg !2918
}

; Function Attrs: noinline nounwind optnone
define internal zeroext i8 @lincomb(ptr noundef %a, ptr noundef %b, i32 noundef %n, i32 noundef %m) #0 !dbg !2919 {
entry:
  %a.addr = alloca ptr, align 4
  %b.addr = alloca ptr, align 4
  %n.addr = alloca i32, align 4
  %m.addr = alloca i32, align 4
  %ret = alloca i8, align 1
  %i = alloca i32, align 4
  store ptr %a, ptr %a.addr, align 4
    #dbg_declare(ptr %a.addr, !2922, !DIExpression(), !2923)
  store ptr %b, ptr %b.addr, align 4
    #dbg_declare(ptr %b.addr, !2924, !DIExpression(), !2925)
  store i32 %n, ptr %n.addr, align 4
    #dbg_declare(ptr %n.addr, !2926, !DIExpression(), !2927)
  store i32 %m, ptr %m.addr, align 4
    #dbg_declare(ptr %m.addr, !2928, !DIExpression(), !2929)
    #dbg_declare(ptr %ret, !2930, !DIExpression(), !2931)
  store i8 0, ptr %ret, align 1, !dbg !2931
    #dbg_declare(ptr %i, !2932, !DIExpression(), !2934)
  store i32 0, ptr %i, align 4, !dbg !2934
  br label %for.cond, !dbg !2935

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4, !dbg !2936
  %1 = load i32, ptr %n.addr, align 4, !dbg !2938
  %cmp = icmp slt i32 %0, %1, !dbg !2939
  br i1 %cmp, label %for.body, label %for.end, !dbg !2940

for.body:                                         ; preds = %for.cond
  %2 = load ptr, ptr %a.addr, align 4, !dbg !2941
  %3 = load i32, ptr %i, align 4, !dbg !2943
  %arrayidx = getelementptr inbounds i8, ptr %2, i32 %3, !dbg !2941
  %4 = load i8, ptr %arrayidx, align 1, !dbg !2941
  %5 = load ptr, ptr %b.addr, align 4, !dbg !2944
  %6 = load i8, ptr %5, align 1, !dbg !2945
  %call = call zeroext i8 @mul_f(i8 noundef zeroext %4, i8 noundef zeroext %6) #5, !dbg !2946
  %7 = load i8, ptr %ret, align 1, !dbg !2947
  %call1 = call zeroext i8 @add_f(i8 noundef zeroext %call, i8 noundef zeroext %7) #5, !dbg !2948
  store i8 %call1, ptr %ret, align 1, !dbg !2949
  br label %for.inc, !dbg !2950

for.inc:                                          ; preds = %for.body
  %8 = load i32, ptr %i, align 4, !dbg !2951
  %inc = add nsw i32 %8, 1, !dbg !2951
  store i32 %inc, ptr %i, align 4, !dbg !2951
  %9 = load i32, ptr %m.addr, align 4, !dbg !2952
  %10 = load ptr, ptr %b.addr, align 4, !dbg !2953
  %add.ptr = getelementptr inbounds i8, ptr %10, i32 %9, !dbg !2953
  store ptr %add.ptr, ptr %b.addr, align 4, !dbg !2953
  br label %for.cond, !dbg !2954, !llvm.loop !2955

for.end:                                          ; preds = %for.cond
  %11 = load i8, ptr %ret, align 1, !dbg !2957
  ret i8 %11, !dbg !2958
}

; Function Attrs: noinline nounwind optnone
define internal zeroext i8 @mul_f(i8 noundef zeroext %a, i8 noundef zeroext %b) #0 !dbg !2959 {
entry:
  %a.addr = alloca i8, align 1
  %b.addr = alloca i8, align 1
  %p = alloca i8, align 1
  %top_p = alloca i8, align 1
  %out = alloca i8, align 1
  store i8 %a, ptr %a.addr, align 1
    #dbg_declare(ptr %a.addr, !2960, !DIExpression(), !2961)
  store i8 %b, ptr %b.addr, align 1
    #dbg_declare(ptr %b.addr, !2962, !DIExpression(), !2963)
    #dbg_declare(ptr %p, !2964, !DIExpression(), !2965)
  %0 = load volatile i8, ptr @unsigned_char_blocker, align 1, !dbg !2966
  %conv = zext i8 %0 to i32, !dbg !2966
  %1 = load i8, ptr %a.addr, align 1, !dbg !2967
  %conv1 = zext i8 %1 to i32, !dbg !2967
  %xor = xor i32 %conv1, %conv, !dbg !2967
  %conv2 = trunc i32 %xor to i8, !dbg !2967
  store i8 %conv2, ptr %a.addr, align 1, !dbg !2967
  %2 = load i8, ptr %a.addr, align 1, !dbg !2968
  %conv3 = zext i8 %2 to i32, !dbg !2968
  %and = and i32 %conv3, 1, !dbg !2969
  %3 = load i8, ptr %b.addr, align 1, !dbg !2970
  %conv4 = zext i8 %3 to i32, !dbg !2970
  %mul = mul nsw i32 %and, %conv4, !dbg !2971
  %conv5 = trunc i32 %mul to i8, !dbg !2972
  store i8 %conv5, ptr %p, align 1, !dbg !2973
  %4 = load i8, ptr %a.addr, align 1, !dbg !2974
  %conv6 = zext i8 %4 to i32, !dbg !2974
  %and7 = and i32 %conv6, 2, !dbg !2975
  %5 = load i8, ptr %b.addr, align 1, !dbg !2976
  %conv8 = zext i8 %5 to i32, !dbg !2976
  %mul9 = mul nsw i32 %and7, %conv8, !dbg !2977
  %6 = load i8, ptr %p, align 1, !dbg !2978
  %conv10 = zext i8 %6 to i32, !dbg !2978
  %xor11 = xor i32 %conv10, %mul9, !dbg !2978
  %conv12 = trunc i32 %xor11 to i8, !dbg !2978
  store i8 %conv12, ptr %p, align 1, !dbg !2978
  %7 = load i8, ptr %a.addr, align 1, !dbg !2979
  %conv13 = zext i8 %7 to i32, !dbg !2979
  %and14 = and i32 %conv13, 4, !dbg !2980
  %8 = load i8, ptr %b.addr, align 1, !dbg !2981
  %conv15 = zext i8 %8 to i32, !dbg !2981
  %mul16 = mul nsw i32 %and14, %conv15, !dbg !2982
  %9 = load i8, ptr %p, align 1, !dbg !2983
  %conv17 = zext i8 %9 to i32, !dbg !2983
  %xor18 = xor i32 %conv17, %mul16, !dbg !2983
  %conv19 = trunc i32 %xor18 to i8, !dbg !2983
  store i8 %conv19, ptr %p, align 1, !dbg !2983
  %10 = load i8, ptr %a.addr, align 1, !dbg !2984
  %conv20 = zext i8 %10 to i32, !dbg !2984
  %and21 = and i32 %conv20, 8, !dbg !2985
  %11 = load i8, ptr %b.addr, align 1, !dbg !2986
  %conv22 = zext i8 %11 to i32, !dbg !2986
  %mul23 = mul nsw i32 %and21, %conv22, !dbg !2987
  %12 = load i8, ptr %p, align 1, !dbg !2988
  %conv24 = zext i8 %12 to i32, !dbg !2988
  %xor25 = xor i32 %conv24, %mul23, !dbg !2988
  %conv26 = trunc i32 %xor25 to i8, !dbg !2988
  store i8 %conv26, ptr %p, align 1, !dbg !2988
    #dbg_declare(ptr %top_p, !2989, !DIExpression(), !2990)
  %13 = load i8, ptr %p, align 1, !dbg !2991
  %conv27 = zext i8 %13 to i32, !dbg !2991
  %and28 = and i32 %conv27, 240, !dbg !2992
  %conv29 = trunc i32 %and28 to i8, !dbg !2991
  store i8 %conv29, ptr %top_p, align 1, !dbg !2990
    #dbg_declare(ptr %out, !2993, !DIExpression(), !2994)
  %14 = load i8, ptr %p, align 1, !dbg !2995
  %conv30 = zext i8 %14 to i32, !dbg !2995
  %15 = load i8, ptr %top_p, align 1, !dbg !2996
  %conv31 = zext i8 %15 to i32, !dbg !2996
  %shr = ashr i32 %conv31, 4, !dbg !2997
  %xor32 = xor i32 %conv30, %shr, !dbg !2998
  %16 = load i8, ptr %top_p, align 1, !dbg !2999
  %conv33 = zext i8 %16 to i32, !dbg !2999
  %shr34 = ashr i32 %conv33, 3, !dbg !3000
  %xor35 = xor i32 %xor32, %shr34, !dbg !3001
  %and36 = and i32 %xor35, 15, !dbg !3002
  %conv37 = trunc i32 %and36 to i8, !dbg !3003
  store i8 %conv37, ptr %out, align 1, !dbg !2994
  %17 = load i8, ptr %out, align 1, !dbg !3004
  ret i8 %17, !dbg !3005
}

; Function Attrs: noinline nounwind optnone
define internal void @transpose_16x16_nibbles(ptr noundef %M) #0 !dbg !65 {
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
    #dbg_declare(ptr %M.addr, !3006, !DIExpression(), !3007)
    #dbg_declare(ptr %i, !3008, !DIExpression(), !3010)
  store i32 0, ptr %i, align 4, !dbg !3010
  br label %for.cond, !dbg !3011

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4, !dbg !3012
  %cmp = icmp ult i32 %0, 16, !dbg !3014
  br i1 %cmp, label %for.body, label %for.end, !dbg !3015

for.body:                                         ; preds = %for.cond
    #dbg_declare(ptr %t, !3016, !DIExpression(), !3018)
  %1 = load ptr, ptr %M.addr, align 4, !dbg !3019
  %2 = load i32, ptr %i, align 4, !dbg !3020
  %arrayidx = getelementptr inbounds nuw i64, ptr %1, i32 %2, !dbg !3019
  %3 = load i64, ptr %arrayidx, align 8, !dbg !3019
  %shr = lshr i64 %3, 4, !dbg !3021
  %4 = load ptr, ptr %M.addr, align 4, !dbg !3022
  %5 = load i32, ptr %i, align 4, !dbg !3023
  %add = add i32 %5, 1, !dbg !3024
  %arrayidx1 = getelementptr inbounds nuw i64, ptr %4, i32 %add, !dbg !3022
  %6 = load i64, ptr %arrayidx1, align 8, !dbg !3022
  %xor = xor i64 %shr, %6, !dbg !3025
  %and = and i64 %xor, 1085102592571150095, !dbg !3026
  store i64 %and, ptr %t, align 8, !dbg !3018
  %7 = load i64, ptr %t, align 8, !dbg !3027
  %shl = shl i64 %7, 4, !dbg !3028
  %8 = load ptr, ptr %M.addr, align 4, !dbg !3029
  %9 = load i32, ptr %i, align 4, !dbg !3030
  %arrayidx2 = getelementptr inbounds nuw i64, ptr %8, i32 %9, !dbg !3029
  %10 = load i64, ptr %arrayidx2, align 8, !dbg !3031
  %xor3 = xor i64 %10, %shl, !dbg !3031
  store i64 %xor3, ptr %arrayidx2, align 8, !dbg !3031
  %11 = load i64, ptr %t, align 8, !dbg !3032
  %12 = load ptr, ptr %M.addr, align 4, !dbg !3033
  %13 = load i32, ptr %i, align 4, !dbg !3034
  %add4 = add i32 %13, 1, !dbg !3035
  %arrayidx5 = getelementptr inbounds nuw i64, ptr %12, i32 %add4, !dbg !3033
  %14 = load i64, ptr %arrayidx5, align 8, !dbg !3036
  %xor6 = xor i64 %14, %11, !dbg !3036
  store i64 %xor6, ptr %arrayidx5, align 8, !dbg !3036
  br label %for.inc, !dbg !3037

for.inc:                                          ; preds = %for.body
  %15 = load i32, ptr %i, align 4, !dbg !3038
  %add7 = add i32 %15, 2, !dbg !3038
  store i32 %add7, ptr %i, align 4, !dbg !3038
  br label %for.cond, !dbg !3039, !llvm.loop !3040

for.end:                                          ; preds = %for.cond
    #dbg_declare(ptr %i8, !3042, !DIExpression(), !3044)
  store i32 0, ptr %i8, align 4, !dbg !3044
  br label %for.cond9, !dbg !3045

for.cond9:                                        ; preds = %for.inc38, %for.end
  %16 = load i32, ptr %i8, align 4, !dbg !3046
  %cmp10 = icmp ult i32 %16, 16, !dbg !3048
  br i1 %cmp10, label %for.body11, label %for.end40, !dbg !3049

for.body11:                                       ; preds = %for.cond9
    #dbg_declare(ptr %t0, !3050, !DIExpression(), !3052)
  %17 = load ptr, ptr %M.addr, align 4, !dbg !3053
  %18 = load i32, ptr %i8, align 4, !dbg !3054
  %arrayidx12 = getelementptr inbounds nuw i64, ptr %17, i32 %18, !dbg !3053
  %19 = load i64, ptr %arrayidx12, align 8, !dbg !3053
  %shr13 = lshr i64 %19, 8, !dbg !3055
  %20 = load ptr, ptr %M.addr, align 4, !dbg !3056
  %21 = load i32, ptr %i8, align 4, !dbg !3057
  %add14 = add i32 %21, 2, !dbg !3058
  %arrayidx15 = getelementptr inbounds nuw i64, ptr %20, i32 %add14, !dbg !3056
  %22 = load i64, ptr %arrayidx15, align 8, !dbg !3056
  %xor16 = xor i64 %shr13, %22, !dbg !3059
  %and17 = and i64 %xor16, 71777214294589695, !dbg !3060
  store i64 %and17, ptr %t0, align 8, !dbg !3052
    #dbg_declare(ptr %t1, !3061, !DIExpression(), !3062)
  %23 = load ptr, ptr %M.addr, align 4, !dbg !3063
  %24 = load i32, ptr %i8, align 4, !dbg !3064
  %add18 = add i32 %24, 1, !dbg !3065
  %arrayidx19 = getelementptr inbounds nuw i64, ptr %23, i32 %add18, !dbg !3063
  %25 = load i64, ptr %arrayidx19, align 8, !dbg !3063
  %shr20 = lshr i64 %25, 8, !dbg !3066
  %26 = load ptr, ptr %M.addr, align 4, !dbg !3067
  %27 = load i32, ptr %i8, align 4, !dbg !3068
  %add21 = add i32 %27, 3, !dbg !3069
  %arrayidx22 = getelementptr inbounds nuw i64, ptr %26, i32 %add21, !dbg !3067
  %28 = load i64, ptr %arrayidx22, align 8, !dbg !3067
  %xor23 = xor i64 %shr20, %28, !dbg !3070
  %and24 = and i64 %xor23, 71777214294589695, !dbg !3071
  store i64 %and24, ptr %t1, align 8, !dbg !3062
  %29 = load i64, ptr %t0, align 8, !dbg !3072
  %shl25 = shl i64 %29, 8, !dbg !3073
  %30 = load ptr, ptr %M.addr, align 4, !dbg !3074
  %31 = load i32, ptr %i8, align 4, !dbg !3075
  %arrayidx26 = getelementptr inbounds nuw i64, ptr %30, i32 %31, !dbg !3074
  %32 = load i64, ptr %arrayidx26, align 8, !dbg !3076
  %xor27 = xor i64 %32, %shl25, !dbg !3076
  store i64 %xor27, ptr %arrayidx26, align 8, !dbg !3076
  %33 = load i64, ptr %t1, align 8, !dbg !3077
  %shl28 = shl i64 %33, 8, !dbg !3078
  %34 = load ptr, ptr %M.addr, align 4, !dbg !3079
  %35 = load i32, ptr %i8, align 4, !dbg !3080
  %add29 = add i32 %35, 1, !dbg !3081
  %arrayidx30 = getelementptr inbounds nuw i64, ptr %34, i32 %add29, !dbg !3079
  %36 = load i64, ptr %arrayidx30, align 8, !dbg !3082
  %xor31 = xor i64 %36, %shl28, !dbg !3082
  store i64 %xor31, ptr %arrayidx30, align 8, !dbg !3082
  %37 = load i64, ptr %t0, align 8, !dbg !3083
  %38 = load ptr, ptr %M.addr, align 4, !dbg !3084
  %39 = load i32, ptr %i8, align 4, !dbg !3085
  %add32 = add i32 %39, 2, !dbg !3086
  %arrayidx33 = getelementptr inbounds nuw i64, ptr %38, i32 %add32, !dbg !3084
  %40 = load i64, ptr %arrayidx33, align 8, !dbg !3087
  %xor34 = xor i64 %40, %37, !dbg !3087
  store i64 %xor34, ptr %arrayidx33, align 8, !dbg !3087
  %41 = load i64, ptr %t1, align 8, !dbg !3088
  %42 = load ptr, ptr %M.addr, align 4, !dbg !3089
  %43 = load i32, ptr %i8, align 4, !dbg !3090
  %add35 = add i32 %43, 3, !dbg !3091
  %arrayidx36 = getelementptr inbounds nuw i64, ptr %42, i32 %add35, !dbg !3089
  %44 = load i64, ptr %arrayidx36, align 8, !dbg !3092
  %xor37 = xor i64 %44, %41, !dbg !3092
  store i64 %xor37, ptr %arrayidx36, align 8, !dbg !3092
  br label %for.inc38, !dbg !3093

for.inc38:                                        ; preds = %for.body11
  %45 = load i32, ptr %i8, align 4, !dbg !3094
  %add39 = add i32 %45, 4, !dbg !3094
  store i32 %add39, ptr %i8, align 4, !dbg !3094
  br label %for.cond9, !dbg !3095, !llvm.loop !3096

for.end40:                                        ; preds = %for.cond9
    #dbg_declare(ptr %i41, !3098, !DIExpression(), !3100)
  store i32 0, ptr %i41, align 4, !dbg !3100
  br label %for.cond42, !dbg !3101

for.cond42:                                       ; preds = %for.inc73, %for.end40
  %46 = load i32, ptr %i41, align 4, !dbg !3102
  %cmp43 = icmp ult i32 %46, 4, !dbg !3104
  br i1 %cmp43, label %for.body44, label %for.end74, !dbg !3105

for.body44:                                       ; preds = %for.cond42
    #dbg_declare(ptr %t045, !3106, !DIExpression(), !3108)
  %47 = load ptr, ptr %M.addr, align 4, !dbg !3109
  %48 = load i32, ptr %i41, align 4, !dbg !3110
  %arrayidx46 = getelementptr inbounds nuw i64, ptr %47, i32 %48, !dbg !3109
  %49 = load i64, ptr %arrayidx46, align 8, !dbg !3109
  %shr47 = lshr i64 %49, 16, !dbg !3111
  %50 = load ptr, ptr %M.addr, align 4, !dbg !3112
  %51 = load i32, ptr %i41, align 4, !dbg !3113
  %add48 = add i32 %51, 4, !dbg !3114
  %arrayidx49 = getelementptr inbounds nuw i64, ptr %50, i32 %add48, !dbg !3112
  %52 = load i64, ptr %arrayidx49, align 8, !dbg !3112
  %xor50 = xor i64 %shr47, %52, !dbg !3115
  %and51 = and i64 %xor50, 281470681808895, !dbg !3116
  store i64 %and51, ptr %t045, align 8, !dbg !3108
    #dbg_declare(ptr %t152, !3117, !DIExpression(), !3118)
  %53 = load ptr, ptr %M.addr, align 4, !dbg !3119
  %54 = load i32, ptr %i41, align 4, !dbg !3120
  %add53 = add i32 %54, 8, !dbg !3121
  %arrayidx54 = getelementptr inbounds nuw i64, ptr %53, i32 %add53, !dbg !3119
  %55 = load i64, ptr %arrayidx54, align 8, !dbg !3119
  %shr55 = lshr i64 %55, 16, !dbg !3122
  %56 = load ptr, ptr %M.addr, align 4, !dbg !3123
  %57 = load i32, ptr %i41, align 4, !dbg !3124
  %add56 = add i32 %57, 12, !dbg !3125
  %arrayidx57 = getelementptr inbounds nuw i64, ptr %56, i32 %add56, !dbg !3123
  %58 = load i64, ptr %arrayidx57, align 8, !dbg !3123
  %xor58 = xor i64 %shr55, %58, !dbg !3126
  %and59 = and i64 %xor58, 281470681808895, !dbg !3127
  store i64 %and59, ptr %t152, align 8, !dbg !3118
  %59 = load i64, ptr %t045, align 8, !dbg !3128
  %shl60 = shl i64 %59, 16, !dbg !3129
  %60 = load ptr, ptr %M.addr, align 4, !dbg !3130
  %61 = load i32, ptr %i41, align 4, !dbg !3131
  %arrayidx61 = getelementptr inbounds nuw i64, ptr %60, i32 %61, !dbg !3130
  %62 = load i64, ptr %arrayidx61, align 8, !dbg !3132
  %xor62 = xor i64 %62, %shl60, !dbg !3132
  store i64 %xor62, ptr %arrayidx61, align 8, !dbg !3132
  %63 = load i64, ptr %t152, align 8, !dbg !3133
  %shl63 = shl i64 %63, 16, !dbg !3134
  %64 = load ptr, ptr %M.addr, align 4, !dbg !3135
  %65 = load i32, ptr %i41, align 4, !dbg !3136
  %add64 = add i32 %65, 8, !dbg !3137
  %arrayidx65 = getelementptr inbounds nuw i64, ptr %64, i32 %add64, !dbg !3135
  %66 = load i64, ptr %arrayidx65, align 8, !dbg !3138
  %xor66 = xor i64 %66, %shl63, !dbg !3138
  store i64 %xor66, ptr %arrayidx65, align 8, !dbg !3138
  %67 = load i64, ptr %t045, align 8, !dbg !3139
  %68 = load ptr, ptr %M.addr, align 4, !dbg !3140
  %69 = load i32, ptr %i41, align 4, !dbg !3141
  %add67 = add i32 %69, 4, !dbg !3142
  %arrayidx68 = getelementptr inbounds nuw i64, ptr %68, i32 %add67, !dbg !3140
  %70 = load i64, ptr %arrayidx68, align 8, !dbg !3143
  %xor69 = xor i64 %70, %67, !dbg !3143
  store i64 %xor69, ptr %arrayidx68, align 8, !dbg !3143
  %71 = load i64, ptr %t152, align 8, !dbg !3144
  %72 = load ptr, ptr %M.addr, align 4, !dbg !3145
  %73 = load i32, ptr %i41, align 4, !dbg !3146
  %add70 = add i32 %73, 12, !dbg !3147
  %arrayidx71 = getelementptr inbounds nuw i64, ptr %72, i32 %add70, !dbg !3145
  %74 = load i64, ptr %arrayidx71, align 8, !dbg !3148
  %xor72 = xor i64 %74, %71, !dbg !3148
  store i64 %xor72, ptr %arrayidx71, align 8, !dbg !3148
  br label %for.inc73, !dbg !3149

for.inc73:                                        ; preds = %for.body44
  %75 = load i32, ptr %i41, align 4, !dbg !3150
  %inc = add i32 %75, 1, !dbg !3150
  store i32 %inc, ptr %i41, align 4, !dbg !3150
  br label %for.cond42, !dbg !3151, !llvm.loop !3152

for.end74:                                        ; preds = %for.cond42
    #dbg_declare(ptr %i75, !3154, !DIExpression(), !3156)
  store i32 0, ptr %i75, align 4, !dbg !3156
  br label %for.cond76, !dbg !3157

for.cond76:                                       ; preds = %for.inc92, %for.end74
  %76 = load i32, ptr %i75, align 4, !dbg !3158
  %cmp77 = icmp ult i32 %76, 8, !dbg !3160
  br i1 %cmp77, label %for.body78, label %for.end94, !dbg !3161

for.body78:                                       ; preds = %for.cond76
    #dbg_declare(ptr %t79, !3162, !DIExpression(), !3164)
  %77 = load ptr, ptr %M.addr, align 4, !dbg !3165
  %78 = load i32, ptr %i75, align 4, !dbg !3166
  %arrayidx80 = getelementptr inbounds nuw i64, ptr %77, i32 %78, !dbg !3165
  %79 = load i64, ptr %arrayidx80, align 8, !dbg !3165
  %shr81 = lshr i64 %79, 32, !dbg !3167
  %80 = load ptr, ptr %M.addr, align 4, !dbg !3168
  %81 = load i32, ptr %i75, align 4, !dbg !3169
  %add82 = add i32 %81, 8, !dbg !3170
  %arrayidx83 = getelementptr inbounds nuw i64, ptr %80, i32 %add82, !dbg !3168
  %82 = load i64, ptr %arrayidx83, align 8, !dbg !3168
  %xor84 = xor i64 %shr81, %82, !dbg !3171
  %and85 = and i64 %xor84, 4294967295, !dbg !3172
  store i64 %and85, ptr %t79, align 8, !dbg !3164
  %83 = load i64, ptr %t79, align 8, !dbg !3173
  %shl86 = shl i64 %83, 32, !dbg !3174
  %84 = load ptr, ptr %M.addr, align 4, !dbg !3175
  %85 = load i32, ptr %i75, align 4, !dbg !3176
  %arrayidx87 = getelementptr inbounds nuw i64, ptr %84, i32 %85, !dbg !3175
  %86 = load i64, ptr %arrayidx87, align 8, !dbg !3177
  %xor88 = xor i64 %86, %shl86, !dbg !3177
  store i64 %xor88, ptr %arrayidx87, align 8, !dbg !3177
  %87 = load i64, ptr %t79, align 8, !dbg !3178
  %88 = load ptr, ptr %M.addr, align 4, !dbg !3179
  %89 = load i32, ptr %i75, align 4, !dbg !3180
  %add89 = add i32 %89, 8, !dbg !3181
  %arrayidx90 = getelementptr inbounds nuw i64, ptr %88, i32 %add89, !dbg !3179
  %90 = load i64, ptr %arrayidx90, align 8, !dbg !3182
  %xor91 = xor i64 %90, %87, !dbg !3182
  store i64 %xor91, ptr %arrayidx90, align 8, !dbg !3182
  br label %for.inc92, !dbg !3183

for.inc92:                                        ; preds = %for.body78
  %91 = load i32, ptr %i75, align 4, !dbg !3184
  %inc93 = add i32 %91, 1, !dbg !3184
  store i32 %inc93, ptr %i75, align 4, !dbg !3184
  br label %for.cond76, !dbg !3185, !llvm.loop !3186

for.end94:                                        ; preds = %for.cond76
  ret void, !dbg !3188
}

; Function Attrs: noinline nounwind optnone
define internal void @mul_add_mat_x_m_mat(i32 noundef %m_vec_limbs, ptr noundef %mat, ptr noundef %bs_mat, ptr noundef %acc, i32 noundef %mat_rows, i32 noundef %mat_cols, i32 noundef %bs_mat_cols) #0 !dbg !3189 {
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
    #dbg_declare(ptr %m_vec_limbs.addr, !3190, !DIExpression(), !3191)
  store ptr %mat, ptr %mat.addr, align 4
    #dbg_declare(ptr %mat.addr, !3192, !DIExpression(), !3193)
  store ptr %bs_mat, ptr %bs_mat.addr, align 4
    #dbg_declare(ptr %bs_mat.addr, !3194, !DIExpression(), !3195)
  store ptr %acc, ptr %acc.addr, align 4
    #dbg_declare(ptr %acc.addr, !3196, !DIExpression(), !3197)
  store i32 %mat_rows, ptr %mat_rows.addr, align 4
    #dbg_declare(ptr %mat_rows.addr, !3198, !DIExpression(), !3199)
  store i32 %mat_cols, ptr %mat_cols.addr, align 4
    #dbg_declare(ptr %mat_cols.addr, !3200, !DIExpression(), !3201)
  store i32 %bs_mat_cols, ptr %bs_mat_cols.addr, align 4
    #dbg_declare(ptr %bs_mat_cols.addr, !3202, !DIExpression(), !3203)
    #dbg_declare(ptr %r, !3204, !DIExpression(), !3206)
  store i32 0, ptr %r, align 4, !dbg !3206
  br label %for.cond, !dbg !3207

for.cond:                                         ; preds = %for.inc17, %entry
  %0 = load i32, ptr %r, align 4, !dbg !3208
  %1 = load i32, ptr %mat_rows.addr, align 4, !dbg !3210
  %cmp = icmp slt i32 %0, %1, !dbg !3211
  br i1 %cmp, label %for.body, label %for.end19, !dbg !3212

for.body:                                         ; preds = %for.cond
    #dbg_declare(ptr %c, !3213, !DIExpression(), !3216)
  store i32 0, ptr %c, align 4, !dbg !3216
  br label %for.cond1, !dbg !3217

for.cond1:                                        ; preds = %for.inc15, %for.body
  %2 = load i32, ptr %c, align 4, !dbg !3218
  %3 = load i32, ptr %mat_cols.addr, align 4, !dbg !3220
  %cmp2 = icmp slt i32 %2, %3, !dbg !3221
  br i1 %cmp2, label %for.body3, label %for.end16, !dbg !3222

for.body3:                                        ; preds = %for.cond1
    #dbg_declare(ptr %k, !3223, !DIExpression(), !3226)
  store i32 0, ptr %k, align 4, !dbg !3226
  br label %for.cond4, !dbg !3227

for.cond4:                                        ; preds = %for.inc, %for.body3
  %4 = load i32, ptr %k, align 4, !dbg !3228
  %5 = load i32, ptr %bs_mat_cols.addr, align 4, !dbg !3230
  %cmp5 = icmp slt i32 %4, %5, !dbg !3231
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !3232

for.body6:                                        ; preds = %for.cond4
  %6 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !3233
  %7 = load ptr, ptr %bs_mat.addr, align 4, !dbg !3235
  %8 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !3236
  %9 = load i32, ptr %c, align 4, !dbg !3237
  %10 = load i32, ptr %bs_mat_cols.addr, align 4, !dbg !3238
  %mul = mul nsw i32 %9, %10, !dbg !3239
  %11 = load i32, ptr %k, align 4, !dbg !3240
  %add = add nsw i32 %mul, %11, !dbg !3241
  %mul7 = mul nsw i32 %8, %add, !dbg !3242
  %add.ptr = getelementptr inbounds i64, ptr %7, i32 %mul7, !dbg !3243
  %12 = load ptr, ptr %mat.addr, align 4, !dbg !3244
  %13 = load i32, ptr %r, align 4, !dbg !3245
  %14 = load i32, ptr %mat_cols.addr, align 4, !dbg !3246
  %mul8 = mul nsw i32 %13, %14, !dbg !3247
  %15 = load i32, ptr %c, align 4, !dbg !3248
  %add9 = add nsw i32 %mul8, %15, !dbg !3249
  %arrayidx = getelementptr inbounds i8, ptr %12, i32 %add9, !dbg !3244
  %16 = load i8, ptr %arrayidx, align 1, !dbg !3244
  %17 = load ptr, ptr %acc.addr, align 4, !dbg !3250
  %18 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !3251
  %19 = load i32, ptr %r, align 4, !dbg !3252
  %20 = load i32, ptr %bs_mat_cols.addr, align 4, !dbg !3253
  %mul10 = mul nsw i32 %19, %20, !dbg !3254
  %21 = load i32, ptr %k, align 4, !dbg !3255
  %add11 = add nsw i32 %mul10, %21, !dbg !3256
  %mul12 = mul nsw i32 %18, %add11, !dbg !3257
  %add.ptr13 = getelementptr inbounds i64, ptr %17, i32 %mul12, !dbg !3258
  call void @m_vec_mul_add(i32 noundef %6, ptr noundef %add.ptr, i8 noundef zeroext %16, ptr noundef %add.ptr13) #5, !dbg !3259
  br label %for.inc, !dbg !3260

for.inc:                                          ; preds = %for.body6
  %22 = load i32, ptr %k, align 4, !dbg !3261
  %add14 = add nsw i32 %22, 1, !dbg !3261
  store i32 %add14, ptr %k, align 4, !dbg !3261
  br label %for.cond4, !dbg !3262, !llvm.loop !3263

for.end:                                          ; preds = %for.cond4
  br label %for.inc15, !dbg !3265

for.inc15:                                        ; preds = %for.end
  %23 = load i32, ptr %c, align 4, !dbg !3266
  %inc = add nsw i32 %23, 1, !dbg !3266
  store i32 %inc, ptr %c, align 4, !dbg !3266
  br label %for.cond1, !dbg !3267, !llvm.loop !3268

for.end16:                                        ; preds = %for.cond1
  br label %for.inc17, !dbg !3270

for.inc17:                                        ; preds = %for.end16
  %24 = load i32, ptr %r, align 4, !dbg !3271
  %inc18 = add nsw i32 %24, 1, !dbg !3271
  store i32 %inc18, ptr %r, align 4, !dbg !3271
  br label %for.cond, !dbg !3272, !llvm.loop !3273

for.end19:                                        ; preds = %for.cond
  ret void, !dbg !3275
}

; Function Attrs: noinline nounwind optnone
define internal void @P1_times_Vt(ptr noundef %p, ptr noundef %P1, ptr noundef %V, ptr noundef %acc) #0 !dbg !3276 {
entry:
  %p.addr = alloca ptr, align 4
  %P1.addr = alloca ptr, align 4
  %V.addr = alloca ptr, align 4
  %acc.addr = alloca ptr, align 4
  store ptr %p, ptr %p.addr, align 4
    #dbg_declare(ptr %p.addr, !3277, !DIExpression(), !3278)
  store ptr %P1, ptr %P1.addr, align 4
    #dbg_declare(ptr %P1.addr, !3279, !DIExpression(), !3280)
  store ptr %V, ptr %V.addr, align 4
    #dbg_declare(ptr %V.addr, !3281, !DIExpression(), !3282)
  store ptr %acc, ptr %acc.addr, align 4
    #dbg_declare(ptr %acc.addr, !3283, !DIExpression(), !3284)
  %0 = load ptr, ptr %p.addr, align 4, !dbg !3285
  %m_vec_limbs = getelementptr inbounds nuw %struct.mayo_params_t, ptr %0, i32 0, i32 21, !dbg !3286
  %1 = load i32, ptr %m_vec_limbs, align 4, !dbg !3286
  %2 = load ptr, ptr %P1.addr, align 4, !dbg !3287
  %3 = load ptr, ptr %V.addr, align 4, !dbg !3288
  %4 = load ptr, ptr %acc.addr, align 4, !dbg !3289
  %5 = load ptr, ptr %p.addr, align 4, !dbg !3290
  %n = getelementptr inbounds nuw %struct.mayo_params_t, ptr %5, i32 0, i32 1, !dbg !3291
  %6 = load i32, ptr %n, align 4, !dbg !3291
  %7 = load ptr, ptr %p.addr, align 4, !dbg !3290
  %o = getelementptr inbounds nuw %struct.mayo_params_t, ptr %7, i32 0, i32 2, !dbg !3291
  %8 = load i32, ptr %o, align 4, !dbg !3291
  %sub = sub nsw i32 %6, %8, !dbg !3291
  %9 = load ptr, ptr %p.addr, align 4, !dbg !3292
  %n1 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %9, i32 0, i32 1, !dbg !3293
  %10 = load i32, ptr %n1, align 4, !dbg !3293
  %11 = load ptr, ptr %p.addr, align 4, !dbg !3292
  %o2 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %11, i32 0, i32 2, !dbg !3293
  %12 = load i32, ptr %o2, align 4, !dbg !3293
  %sub3 = sub nsw i32 %10, %12, !dbg !3293
  %13 = load ptr, ptr %p.addr, align 4, !dbg !3294
  %k = getelementptr inbounds nuw %struct.mayo_params_t, ptr %13, i32 0, i32 3, !dbg !3295
  %14 = load i32, ptr %k, align 4, !dbg !3295
  call void @mul_add_m_upper_triangular_mat_x_mat_trans(i32 noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, i32 noundef %sub, i32 noundef %sub3, i32 noundef %14, i32 noundef 1) #5, !dbg !3296
  ret void, !dbg !3297
}

; Function Attrs: noinline nounwind optnone
define internal void @mul_add_m_upper_triangular_mat_x_mat_trans(i32 noundef %m_vec_limbs, ptr noundef %bs_mat, ptr noundef %mat, ptr noundef %acc, i32 noundef %bs_mat_rows, i32 noundef %bs_mat_cols, i32 noundef %mat_rows, i32 noundef %triangular) #0 !dbg !3298 {
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
    #dbg_declare(ptr %m_vec_limbs.addr, !3299, !DIExpression(), !3300)
  store ptr %bs_mat, ptr %bs_mat.addr, align 4
    #dbg_declare(ptr %bs_mat.addr, !3301, !DIExpression(), !3302)
  store ptr %mat, ptr %mat.addr, align 4
    #dbg_declare(ptr %mat.addr, !3303, !DIExpression(), !3304)
  store ptr %acc, ptr %acc.addr, align 4
    #dbg_declare(ptr %acc.addr, !3305, !DIExpression(), !3306)
  store i32 %bs_mat_rows, ptr %bs_mat_rows.addr, align 4
    #dbg_declare(ptr %bs_mat_rows.addr, !3307, !DIExpression(), !3308)
  store i32 %bs_mat_cols, ptr %bs_mat_cols.addr, align 4
    #dbg_declare(ptr %bs_mat_cols.addr, !3309, !DIExpression(), !3310)
  store i32 %mat_rows, ptr %mat_rows.addr, align 4
    #dbg_declare(ptr %mat_rows.addr, !3311, !DIExpression(), !3312)
  store i32 %triangular, ptr %triangular.addr, align 4
    #dbg_declare(ptr %triangular.addr, !3313, !DIExpression(), !3314)
    #dbg_declare(ptr %bs_mat_entries_used, !3315, !DIExpression(), !3316)
  store i32 0, ptr %bs_mat_entries_used, align 4, !dbg !3316
    #dbg_declare(ptr %r, !3317, !DIExpression(), !3319)
  store i32 0, ptr %r, align 4, !dbg !3319
  br label %for.cond, !dbg !3320

for.cond:                                         ; preds = %for.inc17, %entry
  %0 = load i32, ptr %r, align 4, !dbg !3321
  %1 = load i32, ptr %bs_mat_rows.addr, align 4, !dbg !3323
  %cmp = icmp slt i32 %0, %1, !dbg !3324
  br i1 %cmp, label %for.body, label %for.end19, !dbg !3325

for.body:                                         ; preds = %for.cond
    #dbg_declare(ptr %c, !3326, !DIExpression(), !3329)
  %2 = load i32, ptr %triangular.addr, align 4, !dbg !3330
  %3 = load i32, ptr %r, align 4, !dbg !3331
  %mul = mul nsw i32 %2, %3, !dbg !3332
  store i32 %mul, ptr %c, align 4, !dbg !3329
  br label %for.cond1, !dbg !3333

for.cond1:                                        ; preds = %for.inc15, %for.body
  %4 = load i32, ptr %c, align 4, !dbg !3334
  %5 = load i32, ptr %bs_mat_cols.addr, align 4, !dbg !3336
  %cmp2 = icmp slt i32 %4, %5, !dbg !3337
  br i1 %cmp2, label %for.body3, label %for.end16, !dbg !3338

for.body3:                                        ; preds = %for.cond1
    #dbg_declare(ptr %k, !3339, !DIExpression(), !3342)
  store i32 0, ptr %k, align 4, !dbg !3342
  br label %for.cond4, !dbg !3343

for.cond4:                                        ; preds = %for.inc, %for.body3
  %6 = load i32, ptr %k, align 4, !dbg !3344
  %7 = load i32, ptr %mat_rows.addr, align 4, !dbg !3346
  %cmp5 = icmp slt i32 %6, %7, !dbg !3347
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !3348

for.body6:                                        ; preds = %for.cond4
  %8 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !3349
  %9 = load ptr, ptr %bs_mat.addr, align 4, !dbg !3351
  %10 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !3352
  %11 = load i32, ptr %bs_mat_entries_used, align 4, !dbg !3353
  %mul7 = mul nsw i32 %10, %11, !dbg !3354
  %add.ptr = getelementptr inbounds i64, ptr %9, i32 %mul7, !dbg !3355
  %12 = load ptr, ptr %mat.addr, align 4, !dbg !3356
  %13 = load i32, ptr %k, align 4, !dbg !3357
  %14 = load i32, ptr %bs_mat_cols.addr, align 4, !dbg !3358
  %mul8 = mul nsw i32 %13, %14, !dbg !3359
  %15 = load i32, ptr %c, align 4, !dbg !3360
  %add = add nsw i32 %mul8, %15, !dbg !3361
  %arrayidx = getelementptr inbounds i8, ptr %12, i32 %add, !dbg !3356
  %16 = load i8, ptr %arrayidx, align 1, !dbg !3356
  %17 = load ptr, ptr %acc.addr, align 4, !dbg !3362
  %18 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !3363
  %19 = load i32, ptr %r, align 4, !dbg !3364
  %20 = load i32, ptr %mat_rows.addr, align 4, !dbg !3365
  %mul9 = mul nsw i32 %19, %20, !dbg !3366
  %21 = load i32, ptr %k, align 4, !dbg !3367
  %add10 = add nsw i32 %mul9, %21, !dbg !3368
  %mul11 = mul nsw i32 %18, %add10, !dbg !3369
  %add.ptr12 = getelementptr inbounds i64, ptr %17, i32 %mul11, !dbg !3370
  call void @m_vec_mul_add(i32 noundef %8, ptr noundef %add.ptr, i8 noundef zeroext %16, ptr noundef %add.ptr12) #5, !dbg !3371
  br label %for.inc, !dbg !3372

for.inc:                                          ; preds = %for.body6
  %22 = load i32, ptr %k, align 4, !dbg !3373
  %add13 = add nsw i32 %22, 1, !dbg !3373
  store i32 %add13, ptr %k, align 4, !dbg !3373
  br label %for.cond4, !dbg !3374, !llvm.loop !3375

for.end:                                          ; preds = %for.cond4
  %23 = load i32, ptr %bs_mat_entries_used, align 4, !dbg !3377
  %add14 = add nsw i32 %23, 1, !dbg !3377
  store i32 %add14, ptr %bs_mat_entries_used, align 4, !dbg !3377
  br label %for.inc15, !dbg !3378

for.inc15:                                        ; preds = %for.end
  %24 = load i32, ptr %c, align 4, !dbg !3379
  %inc = add nsw i32 %24, 1, !dbg !3379
  store i32 %inc, ptr %c, align 4, !dbg !3379
  br label %for.cond1, !dbg !3380, !llvm.loop !3381

for.end16:                                        ; preds = %for.cond1
  br label %for.inc17, !dbg !3383

for.inc17:                                        ; preds = %for.end16
  %25 = load i32, ptr %r, align 4, !dbg !3384
  %inc18 = add nsw i32 %25, 1, !dbg !3384
  store i32 %inc18, ptr %r, align 4, !dbg !3384
  br label %for.cond, !dbg !3385, !llvm.loop !3386

for.end19:                                        ; preds = %for.cond
  ret void, !dbg !3388
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @mayo_sign(ptr noundef %p, ptr noundef %sm, ptr noundef %smlen, ptr noundef %m, i32 noundef %mlen, ptr noundef %csk) #0 !dbg !3389 {
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
    #dbg_declare(ptr %p.addr, !3390, !DIExpression(), !3391)
  store ptr %sm, ptr %sm.addr, align 4
    #dbg_declare(ptr %sm.addr, !3392, !DIExpression(), !3393)
  store ptr %smlen, ptr %smlen.addr, align 4
    #dbg_declare(ptr %smlen.addr, !3394, !DIExpression(), !3395)
  store ptr %m, ptr %m.addr, align 4
    #dbg_declare(ptr %m.addr, !3396, !DIExpression(), !3397)
  store i32 %mlen, ptr %mlen.addr, align 4
    #dbg_declare(ptr %mlen.addr, !3398, !DIExpression(), !3399)
  store ptr %csk, ptr %csk.addr, align 4
    #dbg_declare(ptr %csk.addr, !3400, !DIExpression(), !3401)
    #dbg_declare(ptr %ret, !3402, !DIExpression(), !3403)
  store i32 0, ptr %ret, align 4, !dbg !3403
    #dbg_declare(ptr %param_sig_bytes, !3404, !DIExpression(), !3405)
  %0 = load ptr, ptr %p.addr, align 4, !dbg !3406
  %sig_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %0, i32 0, i32 16, !dbg !3407
  %1 = load i32, ptr %sig_bytes, align 4, !dbg !3407
  store i32 %1, ptr %param_sig_bytes, align 4, !dbg !3405
    #dbg_declare(ptr %siglen, !3408, !DIExpression(), !3409)
  %2 = load ptr, ptr %sm.addr, align 4, !dbg !3410
  %3 = load i32, ptr %param_sig_bytes, align 4, !dbg !3411
  %add.ptr = getelementptr inbounds i8, ptr %2, i32 %3, !dbg !3412
  %4 = load ptr, ptr %m.addr, align 4, !dbg !3413
  %5 = load i32, ptr %mlen.addr, align 4, !dbg !3414
  %call = call ptr @memmove(ptr noundef %add.ptr, ptr noundef %4, i32 noundef %5) #5, !dbg !3415
  %6 = load ptr, ptr %p.addr, align 4, !dbg !3416
  %7 = load ptr, ptr %sm.addr, align 4, !dbg !3417
  %8 = load ptr, ptr %sm.addr, align 4, !dbg !3418
  %9 = load i32, ptr %param_sig_bytes, align 4, !dbg !3419
  %add.ptr1 = getelementptr inbounds i8, ptr %8, i32 %9, !dbg !3420
  %10 = load i32, ptr %mlen.addr, align 4, !dbg !3421
  %11 = load ptr, ptr %csk.addr, align 4, !dbg !3422
  %call2 = call i32 @mayo_sign_signature(ptr noundef %6, ptr noundef %7, ptr noundef %siglen, ptr noundef %add.ptr1, i32 noundef %10, ptr noundef %11) #5, !dbg !3423
  store i32 %call2, ptr %ret, align 4, !dbg !3424
  %12 = load i32, ptr %ret, align 4, !dbg !3425
  %cmp = icmp ne i32 %12, 0, !dbg !3427
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !3428

lor.lhs.false:                                    ; preds = %entry
  %13 = load i32, ptr %siglen, align 4, !dbg !3429
  %14 = load i32, ptr %param_sig_bytes, align 4, !dbg !3430
  %cmp3 = icmp ne i32 %13, %14, !dbg !3431
  br i1 %cmp3, label %if.then, label %if.end, !dbg !3428

if.then:                                          ; preds = %lor.lhs.false, %entry
  %15 = load ptr, ptr %sm.addr, align 4, !dbg !3432
  %16 = load i32, ptr %siglen, align 4, !dbg !3434
  %17 = load i32, ptr %mlen.addr, align 4, !dbg !3435
  %add = add i32 %16, %17, !dbg !3436
  %call4 = call ptr @memset(ptr noundef %15, i32 noundef 0, i32 noundef %add) #5, !dbg !3437
  br label %err, !dbg !3438

if.end:                                           ; preds = %lor.lhs.false
  %18 = load i32, ptr %siglen, align 4, !dbg !3439
  %19 = load i32, ptr %mlen.addr, align 4, !dbg !3440
  %add5 = add i32 %18, %19, !dbg !3441
  %20 = load ptr, ptr %smlen.addr, align 4, !dbg !3442
  store i32 %add5, ptr %20, align 4, !dbg !3443
  br label %err, !dbg !3444

err:                                              ; preds = %if.end, %if.then
    #dbg_label(!3445, !3446)
  %21 = load i32, ptr %ret, align 4, !dbg !3447
  ret i32 %21, !dbg !3448
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @mayo_open(ptr noundef %p, ptr noundef %m, ptr noundef %mlen, ptr noundef %sm, i32 noundef %smlen, ptr noundef %pk) #0 !dbg !3449 {
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
    #dbg_declare(ptr %p.addr, !3450, !DIExpression(), !3451)
  store ptr %m, ptr %m.addr, align 4
    #dbg_declare(ptr %m.addr, !3452, !DIExpression(), !3453)
  store ptr %mlen, ptr %mlen.addr, align 4
    #dbg_declare(ptr %mlen.addr, !3454, !DIExpression(), !3455)
  store ptr %sm, ptr %sm.addr, align 4
    #dbg_declare(ptr %sm.addr, !3456, !DIExpression(), !3457)
  store i32 %smlen, ptr %smlen.addr, align 4
    #dbg_declare(ptr %smlen.addr, !3458, !DIExpression(), !3459)
  store ptr %pk, ptr %pk.addr, align 4
    #dbg_declare(ptr %pk.addr, !3460, !DIExpression(), !3461)
    #dbg_declare(ptr %param_sig_bytes, !3462, !DIExpression(), !3463)
  %0 = load ptr, ptr %p.addr, align 4, !dbg !3464
  %sig_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %0, i32 0, i32 16, !dbg !3465
  %1 = load i32, ptr %sig_bytes, align 4, !dbg !3465
  store i32 %1, ptr %param_sig_bytes, align 4, !dbg !3463
  %2 = load i32, ptr %smlen.addr, align 4, !dbg !3466
  %3 = load i32, ptr %param_sig_bytes, align 4, !dbg !3468
  %cmp = icmp ult i32 %2, %3, !dbg !3469
  br i1 %cmp, label %if.then, label %if.end, !dbg !3469

if.then:                                          ; preds = %entry
  store i32 1, ptr %retval, align 4, !dbg !3470
  br label %return, !dbg !3470

if.end:                                           ; preds = %entry
    #dbg_declare(ptr %result, !3472, !DIExpression(), !3473)
  %4 = load ptr, ptr %p.addr, align 4, !dbg !3474
  %5 = load ptr, ptr %sm.addr, align 4, !dbg !3475
  %6 = load i32, ptr %param_sig_bytes, align 4, !dbg !3476
  %add.ptr = getelementptr inbounds i8, ptr %5, i32 %6, !dbg !3477
  %7 = load i32, ptr %smlen.addr, align 4, !dbg !3478
  %8 = load i32, ptr %param_sig_bytes, align 4, !dbg !3479
  %sub = sub i32 %7, %8, !dbg !3480
  %9 = load ptr, ptr %sm.addr, align 4, !dbg !3481
  %10 = load ptr, ptr %pk.addr, align 4, !dbg !3482
  %call = call i32 @mayo_verify(ptr noundef %4, ptr noundef %add.ptr, i32 noundef %sub, ptr noundef %9, ptr noundef %10) #5, !dbg !3483
  store i32 %call, ptr %result, align 4, !dbg !3473
  %11 = load i32, ptr %result, align 4, !dbg !3484
  %cmp1 = icmp eq i32 %11, 0, !dbg !3486
  br i1 %cmp1, label %if.then2, label %if.end6, !dbg !3486

if.then2:                                         ; preds = %if.end
  %12 = load i32, ptr %smlen.addr, align 4, !dbg !3487
  %13 = load i32, ptr %param_sig_bytes, align 4, !dbg !3489
  %sub3 = sub i32 %12, %13, !dbg !3490
  %14 = load ptr, ptr %mlen.addr, align 4, !dbg !3491
  store i32 %sub3, ptr %14, align 4, !dbg !3492
  %15 = load ptr, ptr %m.addr, align 4, !dbg !3493
  %16 = load ptr, ptr %sm.addr, align 4, !dbg !3494
  %17 = load i32, ptr %param_sig_bytes, align 4, !dbg !3495
  %add.ptr4 = getelementptr inbounds i8, ptr %16, i32 %17, !dbg !3496
  %18 = load ptr, ptr %mlen.addr, align 4, !dbg !3497
  %19 = load i32, ptr %18, align 4, !dbg !3498
  %call5 = call ptr @memmove(ptr noundef %15, ptr noundef %add.ptr4, i32 noundef %19) #5, !dbg !3499
  br label %if.end6, !dbg !3500

if.end6:                                          ; preds = %if.then2, %if.end
  %20 = load i32, ptr %result, align 4, !dbg !3501
  store i32 %20, ptr %retval, align 4, !dbg !3502
  br label %return, !dbg !3502

return:                                           ; preds = %if.end6, %if.then
  %21 = load i32, ptr %retval, align 4, !dbg !3503
  ret i32 %21, !dbg !3503
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @mayo_verify(ptr noundef %p, ptr noundef %m, i32 noundef %mlen, ptr noundef %sig, ptr noundef %cpk) #0 !dbg !3504 {
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
    #dbg_declare(ptr %p.addr, !3507, !DIExpression(), !3508)
  store ptr %m, ptr %m.addr, align 4
    #dbg_declare(ptr %m.addr, !3509, !DIExpression(), !3510)
  store i32 %mlen, ptr %mlen.addr, align 4
    #dbg_declare(ptr %mlen.addr, !3511, !DIExpression(), !3512)
  store ptr %sig, ptr %sig.addr, align 4
    #dbg_declare(ptr %sig.addr, !3513, !DIExpression(), !3514)
  store ptr %cpk, ptr %cpk.addr, align 4
    #dbg_declare(ptr %cpk.addr, !3515, !DIExpression(), !3516)
    #dbg_declare(ptr %tEnc, !3517, !DIExpression(), !3518)
    #dbg_declare(ptr %t, !3519, !DIExpression(), !3520)
    #dbg_declare(ptr %y, !3521, !DIExpression(), !3525)
  call void @llvm.memset.p0.i32(ptr align 1 %y, i8 0, i32 284, i1 false), !dbg !3525
    #dbg_declare(ptr %s, !3526, !DIExpression(), !3527)
    #dbg_declare(ptr %pk, !3528, !DIExpression(), !3532)
  call void @llvm.memset.p0.i32(ptr align 8 %pk, i8 0, i32 915840, i1 false), !dbg !3532
    #dbg_declare(ptr %tmp, !3533, !DIExpression(), !3537)
    #dbg_declare(ptr %param_m, !3538, !DIExpression(), !3539)
  %0 = load ptr, ptr %p.addr, align 4, !dbg !3540
  %m1 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %0, i32 0, i32 0, !dbg !3541
  %1 = load i32, ptr %m1, align 4, !dbg !3541
  store i32 %1, ptr %param_m, align 4, !dbg !3539
    #dbg_declare(ptr %param_n, !3542, !DIExpression(), !3543)
  %2 = load ptr, ptr %p.addr, align 4, !dbg !3544
  %n = getelementptr inbounds nuw %struct.mayo_params_t, ptr %2, i32 0, i32 1, !dbg !3545
  %3 = load i32, ptr %n, align 4, !dbg !3545
  store i32 %3, ptr %param_n, align 4, !dbg !3543
    #dbg_declare(ptr %param_k, !3546, !DIExpression(), !3547)
  %4 = load ptr, ptr %p.addr, align 4, !dbg !3548
  %k = getelementptr inbounds nuw %struct.mayo_params_t, ptr %4, i32 0, i32 3, !dbg !3549
  %5 = load i32, ptr %k, align 4, !dbg !3549
  store i32 %5, ptr %param_k, align 4, !dbg !3547
    #dbg_declare(ptr %param_m_bytes, !3550, !DIExpression(), !3551)
  %6 = load ptr, ptr %p.addr, align 4, !dbg !3552
  %m_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %6, i32 0, i32 6, !dbg !3553
  %7 = load i32, ptr %m_bytes, align 4, !dbg !3553
  store i32 %7, ptr %param_m_bytes, align 4, !dbg !3551
    #dbg_declare(ptr %param_sig_bytes, !3554, !DIExpression(), !3555)
  %8 = load ptr, ptr %p.addr, align 4, !dbg !3556
  %sig_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %8, i32 0, i32 16, !dbg !3557
  %9 = load i32, ptr %sig_bytes, align 4, !dbg !3557
  store i32 %9, ptr %param_sig_bytes, align 4, !dbg !3555
    #dbg_declare(ptr %param_digest_bytes, !3558, !DIExpression(), !3559)
  %10 = load ptr, ptr %p.addr, align 4, !dbg !3560
  %digest_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %10, i32 0, i32 19, !dbg !3561
  %11 = load i32, ptr %digest_bytes, align 4, !dbg !3561
  store i32 %11, ptr %param_digest_bytes, align 4, !dbg !3559
    #dbg_declare(ptr %param_salt_bytes, !3562, !DIExpression(), !3563)
  %12 = load ptr, ptr %p.addr, align 4, !dbg !3564
  %salt_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %12, i32 0, i32 17, !dbg !3565
  %13 = load i32, ptr %salt_bytes, align 4, !dbg !3565
  store i32 %13, ptr %param_salt_bytes, align 4, !dbg !3563
    #dbg_declare(ptr %ret, !3566, !DIExpression(), !3567)
  %14 = load ptr, ptr %p.addr, align 4, !dbg !3568
  %15 = load ptr, ptr %cpk.addr, align 4, !dbg !3569
  %arraydecay = getelementptr inbounds [114480 x i64], ptr %pk, i32 0, i32 0, !dbg !3570
  %call = call i32 @mayo_expand_pk(ptr noundef %14, ptr noundef %15, ptr noundef %arraydecay) #5, !dbg !3571
  store i32 %call, ptr %ret, align 4, !dbg !3567
  %16 = load i32, ptr %ret, align 4, !dbg !3572
  %cmp = icmp ne i32 %16, 0, !dbg !3574
  br i1 %cmp, label %if.then, label %if.end, !dbg !3574

if.then:                                          ; preds = %entry
  store i32 1, ptr %retval, align 4, !dbg !3575
  br label %return, !dbg !3575

if.end:                                           ; preds = %entry
    #dbg_declare(ptr %P1, !3577, !DIExpression(), !3578)
  %arraydecay2 = getelementptr inbounds [114480 x i64], ptr %pk, i32 0, i32 0, !dbg !3579
  store ptr %arraydecay2, ptr %P1, align 4, !dbg !3578
    #dbg_declare(ptr %P2, !3580, !DIExpression(), !3581)
  %17 = load ptr, ptr %P1, align 4, !dbg !3582
  %18 = load ptr, ptr %p.addr, align 4, !dbg !3583
  %n3 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %18, i32 0, i32 1, !dbg !3584
  %19 = load i32, ptr %n3, align 4, !dbg !3584
  %20 = load ptr, ptr %p.addr, align 4, !dbg !3583
  %o = getelementptr inbounds nuw %struct.mayo_params_t, ptr %20, i32 0, i32 2, !dbg !3584
  %21 = load i32, ptr %o, align 4, !dbg !3584
  %sub = sub nsw i32 %19, %21, !dbg !3584
  %22 = load ptr, ptr %p.addr, align 4, !dbg !3583
  %n4 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %22, i32 0, i32 1, !dbg !3584
  %23 = load i32, ptr %n4, align 4, !dbg !3584
  %24 = load ptr, ptr %p.addr, align 4, !dbg !3583
  %o5 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %24, i32 0, i32 2, !dbg !3584
  %25 = load i32, ptr %o5, align 4, !dbg !3584
  %sub6 = sub nsw i32 %23, %25, !dbg !3584
  %add = add nsw i32 %sub6, 1, !dbg !3584
  %mul = mul nsw i32 %sub, %add, !dbg !3584
  %div = sdiv i32 %mul, 2, !dbg !3584
  %26 = load ptr, ptr %p.addr, align 4, !dbg !3583
  %m_vec_limbs = getelementptr inbounds nuw %struct.mayo_params_t, ptr %26, i32 0, i32 21, !dbg !3584
  %27 = load i32, ptr %m_vec_limbs, align 4, !dbg !3584
  %mul7 = mul nsw i32 %div, %27, !dbg !3584
  %add.ptr = getelementptr inbounds i64, ptr %17, i32 %mul7, !dbg !3585
  store ptr %add.ptr, ptr %P2, align 4, !dbg !3581
    #dbg_declare(ptr %P3, !3586, !DIExpression(), !3587)
  %28 = load ptr, ptr %P2, align 4, !dbg !3588
  %29 = load ptr, ptr %p.addr, align 4, !dbg !3589
  %n8 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %29, i32 0, i32 1, !dbg !3590
  %30 = load i32, ptr %n8, align 4, !dbg !3590
  %31 = load ptr, ptr %p.addr, align 4, !dbg !3589
  %o9 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %31, i32 0, i32 2, !dbg !3590
  %32 = load i32, ptr %o9, align 4, !dbg !3590
  %sub10 = sub nsw i32 %30, %32, !dbg !3590
  %33 = load ptr, ptr %p.addr, align 4, !dbg !3589
  %o11 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %33, i32 0, i32 2, !dbg !3590
  %34 = load i32, ptr %o11, align 4, !dbg !3590
  %mul12 = mul nsw i32 %sub10, %34, !dbg !3590
  %35 = load ptr, ptr %p.addr, align 4, !dbg !3589
  %m_vec_limbs13 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %35, i32 0, i32 21, !dbg !3590
  %36 = load i32, ptr %m_vec_limbs13, align 4, !dbg !3590
  %mul14 = mul nsw i32 %mul12, %36, !dbg !3590
  %add.ptr15 = getelementptr inbounds i64, ptr %28, i32 %mul14, !dbg !3591
  store ptr %add.ptr15, ptr %P3, align 4, !dbg !3587
  %arraydecay16 = getelementptr inbounds [104 x i8], ptr %tmp, i32 0, i32 0, !dbg !3592
  %37 = load i32, ptr %param_digest_bytes, align 4, !dbg !3593
  %38 = load ptr, ptr %m.addr, align 4, !dbg !3594
  %39 = load i32, ptr %mlen.addr, align 4, !dbg !3595
  %call17 = call i32 @shake256(ptr noundef %arraydecay16, i32 noundef %37, ptr noundef %38, i32 noundef %39) #5, !dbg !3596
  %arraydecay18 = getelementptr inbounds [104 x i8], ptr %tmp, i32 0, i32 0, !dbg !3597
  %40 = load i32, ptr %param_digest_bytes, align 4, !dbg !3598
  %add.ptr19 = getelementptr inbounds i8, ptr %arraydecay18, i32 %40, !dbg !3599
  %41 = load ptr, ptr %sig.addr, align 4, !dbg !3600
  %42 = load i32, ptr %param_sig_bytes, align 4, !dbg !3601
  %add.ptr20 = getelementptr inbounds i8, ptr %41, i32 %42, !dbg !3602
  %43 = load i32, ptr %param_salt_bytes, align 4, !dbg !3603
  %idx.neg = sub i32 0, %43, !dbg !3604
  %add.ptr21 = getelementptr inbounds i8, ptr %add.ptr20, i32 %idx.neg, !dbg !3604
  %44 = load i32, ptr %param_salt_bytes, align 4, !dbg !3605
  %call22 = call ptr @memcpy(ptr noundef %add.ptr19, ptr noundef %add.ptr21, i32 noundef %44) #5, !dbg !3606
  %arraydecay23 = getelementptr inbounds [71 x i8], ptr %tEnc, i32 0, i32 0, !dbg !3607
  %45 = load i32, ptr %param_m_bytes, align 4, !dbg !3608
  %arraydecay24 = getelementptr inbounds [104 x i8], ptr %tmp, i32 0, i32 0, !dbg !3609
  %46 = load i32, ptr %param_digest_bytes, align 4, !dbg !3610
  %47 = load i32, ptr %param_salt_bytes, align 4, !dbg !3611
  %add25 = add nsw i32 %46, %47, !dbg !3612
  %call26 = call i32 @shake256(ptr noundef %arraydecay23, i32 noundef %45, ptr noundef %arraydecay24, i32 noundef %add25) #5, !dbg !3613
  %arraydecay27 = getelementptr inbounds [71 x i8], ptr %tEnc, i32 0, i32 0, !dbg !3614
  %arraydecay28 = getelementptr inbounds [142 x i8], ptr %t, i32 0, i32 0, !dbg !3615
  %48 = load i32, ptr %param_m, align 4, !dbg !3616
  call void @decode(ptr noundef %arraydecay27, ptr noundef %arraydecay28, i32 noundef %48) #5, !dbg !3617
  %49 = load ptr, ptr %sig.addr, align 4, !dbg !3618
  %arraydecay29 = getelementptr inbounds [1848 x i8], ptr %s, i32 0, i32 0, !dbg !3619
  %50 = load i32, ptr %param_k, align 4, !dbg !3620
  %51 = load i32, ptr %param_n, align 4, !dbg !3621
  %mul30 = mul nsw i32 %50, %51, !dbg !3622
  call void @decode(ptr noundef %49, ptr noundef %arraydecay29, i32 noundef %mul30) #5, !dbg !3623
  %52 = load ptr, ptr %p.addr, align 4, !dbg !3624
  %arraydecay31 = getelementptr inbounds [1848 x i8], ptr %s, i32 0, i32 0, !dbg !3625
  %53 = load ptr, ptr %P1, align 4, !dbg !3626
  %54 = load ptr, ptr %P2, align 4, !dbg !3627
  %55 = load ptr, ptr %P3, align 4, !dbg !3628
  %arraydecay32 = getelementptr inbounds [284 x i8], ptr %y, i32 0, i32 0, !dbg !3629
  call void @eval_public_map(ptr noundef %52, ptr noundef %arraydecay31, ptr noundef %53, ptr noundef %54, ptr noundef %55, ptr noundef %arraydecay32) #5, !dbg !3630
  %arraydecay33 = getelementptr inbounds [284 x i8], ptr %y, i32 0, i32 0, !dbg !3631
  %arraydecay34 = getelementptr inbounds [142 x i8], ptr %t, i32 0, i32 0, !dbg !3633
  %56 = load i32, ptr %param_m, align 4, !dbg !3634
  %call35 = call i32 @memcmp(ptr noundef %arraydecay33, ptr noundef %arraydecay34, i32 noundef %56) #5, !dbg !3635
  %cmp36 = icmp eq i32 %call35, 0, !dbg !3636
  br i1 %cmp36, label %if.then37, label %if.end38, !dbg !3636

if.then37:                                        ; preds = %if.end
  store i32 0, ptr %retval, align 4, !dbg !3637
  br label %return, !dbg !3637

if.end38:                                         ; preds = %if.end
  store i32 1, ptr %retval, align 4, !dbg !3639
  br label %return, !dbg !3639

return:                                           ; preds = %if.end38, %if.then37, %if.then
  %57 = load i32, ptr %retval, align 4, !dbg !3640
  ret i32 %57, !dbg !3640
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @mayo_expand_pk(ptr noundef %p, ptr noundef %cpk, ptr noundef %pk) #0 !dbg !3641 {
entry:
  %p.addr = alloca ptr, align 4
  %cpk.addr = alloca ptr, align 4
  %pk.addr = alloca ptr, align 4
  store ptr %p, ptr %p.addr, align 4
    #dbg_declare(ptr %p.addr, !3644, !DIExpression(), !3645)
  store ptr %cpk, ptr %cpk.addr, align 4
    #dbg_declare(ptr %cpk.addr, !3646, !DIExpression(), !3647)
  store ptr %pk, ptr %pk.addr, align 4
    #dbg_declare(ptr %pk.addr, !3648, !DIExpression(), !3649)
  %0 = load ptr, ptr %p.addr, align 4, !dbg !3650
  %1 = load ptr, ptr %pk.addr, align 4, !dbg !3651
  %2 = load ptr, ptr %cpk.addr, align 4, !dbg !3652
  call void @expand_P1_P2(ptr noundef %0, ptr noundef %1, ptr noundef %2) #5, !dbg !3653
  %3 = load ptr, ptr %cpk.addr, align 4, !dbg !3654
  %4 = load ptr, ptr %p.addr, align 4, !dbg !3655
  %pk_seed_bytes = getelementptr inbounds nuw %struct.mayo_params_t, ptr %4, i32 0, i32 20, !dbg !3656
  %5 = load i32, ptr %pk_seed_bytes, align 4, !dbg !3656
  %add.ptr = getelementptr inbounds i8, ptr %3, i32 %5, !dbg !3657
  %6 = load ptr, ptr %pk.addr, align 4, !dbg !3658
  %7 = load ptr, ptr %p.addr, align 4, !dbg !3659
  %n = getelementptr inbounds nuw %struct.mayo_params_t, ptr %7, i32 0, i32 1, !dbg !3660
  %8 = load i32, ptr %n, align 4, !dbg !3660
  %9 = load ptr, ptr %p.addr, align 4, !dbg !3659
  %o = getelementptr inbounds nuw %struct.mayo_params_t, ptr %9, i32 0, i32 2, !dbg !3660
  %10 = load i32, ptr %o, align 4, !dbg !3660
  %sub = sub nsw i32 %8, %10, !dbg !3660
  %11 = load ptr, ptr %p.addr, align 4, !dbg !3659
  %n1 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %11, i32 0, i32 1, !dbg !3660
  %12 = load i32, ptr %n1, align 4, !dbg !3660
  %13 = load ptr, ptr %p.addr, align 4, !dbg !3659
  %o2 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %13, i32 0, i32 2, !dbg !3660
  %14 = load i32, ptr %o2, align 4, !dbg !3660
  %sub3 = sub nsw i32 %12, %14, !dbg !3660
  %add = add nsw i32 %sub3, 1, !dbg !3660
  %mul = mul nsw i32 %sub, %add, !dbg !3660
  %div = sdiv i32 %mul, 2, !dbg !3660
  %15 = load ptr, ptr %p.addr, align 4, !dbg !3659
  %m_vec_limbs = getelementptr inbounds nuw %struct.mayo_params_t, ptr %15, i32 0, i32 21, !dbg !3660
  %16 = load i32, ptr %m_vec_limbs, align 4, !dbg !3660
  %mul4 = mul nsw i32 %div, %16, !dbg !3660
  %add.ptr5 = getelementptr inbounds i64, ptr %6, i32 %mul4, !dbg !3661
  %17 = load ptr, ptr %p.addr, align 4, !dbg !3662
  %n6 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %17, i32 0, i32 1, !dbg !3663
  %18 = load i32, ptr %n6, align 4, !dbg !3663
  %19 = load ptr, ptr %p.addr, align 4, !dbg !3662
  %o7 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %19, i32 0, i32 2, !dbg !3663
  %20 = load i32, ptr %o7, align 4, !dbg !3663
  %sub8 = sub nsw i32 %18, %20, !dbg !3663
  %21 = load ptr, ptr %p.addr, align 4, !dbg !3662
  %o9 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %21, i32 0, i32 2, !dbg !3663
  %22 = load i32, ptr %o9, align 4, !dbg !3663
  %mul10 = mul nsw i32 %sub8, %22, !dbg !3663
  %23 = load ptr, ptr %p.addr, align 4, !dbg !3662
  %m_vec_limbs11 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %23, i32 0, i32 21, !dbg !3663
  %24 = load i32, ptr %m_vec_limbs11, align 4, !dbg !3663
  %mul12 = mul nsw i32 %mul10, %24, !dbg !3663
  %add.ptr13 = getelementptr inbounds i64, ptr %add.ptr5, i32 %mul12, !dbg !3664
  %25 = load ptr, ptr %p.addr, align 4, !dbg !3665
  %o14 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %25, i32 0, i32 2, !dbg !3666
  %26 = load i32, ptr %o14, align 4, !dbg !3666
  %27 = load ptr, ptr %p.addr, align 4, !dbg !3665
  %o15 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %27, i32 0, i32 2, !dbg !3666
  %28 = load i32, ptr %o15, align 4, !dbg !3666
  %add16 = add nsw i32 %28, 1, !dbg !3666
  %mul17 = mul nsw i32 %26, %add16, !dbg !3666
  %div18 = sdiv i32 %mul17, 2, !dbg !3666
  %29 = load ptr, ptr %p.addr, align 4, !dbg !3665
  %m_vec_limbs19 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %29, i32 0, i32 21, !dbg !3666
  %30 = load i32, ptr %m_vec_limbs19, align 4, !dbg !3666
  %mul20 = mul nsw i32 %div18, %30, !dbg !3666
  %31 = load ptr, ptr %p.addr, align 4, !dbg !3667
  %m_vec_limbs21 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %31, i32 0, i32 21, !dbg !3668
  %32 = load i32, ptr %m_vec_limbs21, align 4, !dbg !3668
  %div22 = sdiv i32 %mul20, %32, !dbg !3669
  %33 = load ptr, ptr %p.addr, align 4, !dbg !3670
  %m = getelementptr inbounds nuw %struct.mayo_params_t, ptr %33, i32 0, i32 0, !dbg !3671
  %34 = load i32, ptr %m, align 4, !dbg !3671
  call void @unpack_m_vecs(ptr noundef %add.ptr, ptr noundef %add.ptr13, i32 noundef %div22, i32 noundef %34) #5, !dbg !3672
  ret i32 0, !dbg !3673
}

; Function Attrs: noinline nounwind optnone
define internal void @eval_public_map(ptr noundef %p, ptr noundef %s, ptr noundef %P1, ptr noundef %P2, ptr noundef %P3, ptr noundef %eval) #0 !dbg !3674 {
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
    #dbg_declare(ptr %p.addr, !3677, !DIExpression(), !3678)
  store ptr %s, ptr %s.addr, align 4
    #dbg_declare(ptr %s.addr, !3679, !DIExpression(), !3680)
  store ptr %P1, ptr %P1.addr, align 4
    #dbg_declare(ptr %P1.addr, !3681, !DIExpression(), !3682)
  store ptr %P2, ptr %P2.addr, align 4
    #dbg_declare(ptr %P2.addr, !3683, !DIExpression(), !3684)
  store ptr %P3, ptr %P3.addr, align 4
    #dbg_declare(ptr %P3.addr, !3685, !DIExpression(), !3686)
  store ptr %eval, ptr %eval.addr, align 4
    #dbg_declare(ptr %eval.addr, !3687, !DIExpression(), !3688)
    #dbg_declare(ptr %SPS, !3689, !DIExpression(), !3693)
  call void @llvm.memset.p0.i32(ptr align 8 %SPS, i8 0, i32 10368, i1 false), !dbg !3693
  %0 = load ptr, ptr %p.addr, align 4, !dbg !3694
  %1 = load ptr, ptr %P1.addr, align 4, !dbg !3695
  %2 = load ptr, ptr %P2.addr, align 4, !dbg !3696
  %3 = load ptr, ptr %P3.addr, align 4, !dbg !3697
  %4 = load ptr, ptr %s.addr, align 4, !dbg !3698
  %arraydecay = getelementptr inbounds [1296 x i64], ptr %SPS, i32 0, i32 0, !dbg !3699
  call void @m_calculate_PS_SPS(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %arraydecay) #5, !dbg !3700
    #dbg_declare(ptr %zero, !3701, !DIExpression(), !3702)
  call void @llvm.memset.p0.i32(ptr align 1 %zero, i8 0, i32 142, i1 false), !dbg !3702
  %5 = load ptr, ptr %p.addr, align 4, !dbg !3703
  %arraydecay1 = getelementptr inbounds [1296 x i64], ptr %SPS, i32 0, i32 0, !dbg !3704
  %arraydecay2 = getelementptr inbounds [142 x i8], ptr %zero, i32 0, i32 0, !dbg !3705
  %6 = load ptr, ptr %eval.addr, align 4, !dbg !3706
  call void @compute_rhs(ptr noundef %5, ptr noundef %arraydecay1, ptr noundef %arraydecay2, ptr noundef %6) #5, !dbg !3707
  ret void, !dbg !3708
}

; Function Attrs: noinline nounwind optnone
define internal void @m_calculate_PS_SPS(ptr noundef %p, ptr noundef %P1, ptr noundef %P2, ptr noundef %P3, ptr noundef %s, ptr noundef %SPS) #0 !dbg !3709 {
entry:
  %p.addr = alloca ptr, align 4
  %P1.addr = alloca ptr, align 4
  %P2.addr = alloca ptr, align 4
  %P3.addr = alloca ptr, align 4
  %s.addr = alloca ptr, align 4
  %SPS.addr = alloca ptr, align 4
  %PS = alloca [16632 x i64], align 8
  store ptr %p, ptr %p.addr, align 4
    #dbg_declare(ptr %p.addr, !3712, !DIExpression(), !3713)
  store ptr %P1, ptr %P1.addr, align 4
    #dbg_declare(ptr %P1.addr, !3714, !DIExpression(), !3715)
  store ptr %P2, ptr %P2.addr, align 4
    #dbg_declare(ptr %P2.addr, !3716, !DIExpression(), !3717)
  store ptr %P3, ptr %P3.addr, align 4
    #dbg_declare(ptr %P3.addr, !3718, !DIExpression(), !3719)
  store ptr %s, ptr %s.addr, align 4
    #dbg_declare(ptr %s.addr, !3720, !DIExpression(), !3721)
  store ptr %SPS, ptr %SPS.addr, align 4
    #dbg_declare(ptr %SPS.addr, !3722, !DIExpression(), !3723)
    #dbg_declare(ptr %PS, !3724, !DIExpression(), !3728)
  call void @llvm.memset.p0.i32(ptr align 8 %PS, i8 0, i32 133056, i1 false), !dbg !3728
  %0 = load ptr, ptr %P1.addr, align 4, !dbg !3729
  %1 = load ptr, ptr %P2.addr, align 4, !dbg !3730
  %2 = load ptr, ptr %P3.addr, align 4, !dbg !3731
  %3 = load ptr, ptr %s.addr, align 4, !dbg !3732
  %4 = load ptr, ptr %p.addr, align 4, !dbg !3733
  %m = getelementptr inbounds nuw %struct.mayo_params_t, ptr %4, i32 0, i32 0, !dbg !3734
  %5 = load i32, ptr %m, align 4, !dbg !3734
  %6 = load ptr, ptr %p.addr, align 4, !dbg !3735
  %n = getelementptr inbounds nuw %struct.mayo_params_t, ptr %6, i32 0, i32 1, !dbg !3736
  %7 = load i32, ptr %n, align 4, !dbg !3736
  %8 = load ptr, ptr %p.addr, align 4, !dbg !3735
  %o = getelementptr inbounds nuw %struct.mayo_params_t, ptr %8, i32 0, i32 2, !dbg !3736
  %9 = load i32, ptr %o, align 4, !dbg !3736
  %sub = sub nsw i32 %7, %9, !dbg !3736
  %10 = load ptr, ptr %p.addr, align 4, !dbg !3737
  %o1 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %10, i32 0, i32 2, !dbg !3738
  %11 = load i32, ptr %o1, align 4, !dbg !3738
  %12 = load ptr, ptr %p.addr, align 4, !dbg !3739
  %k = getelementptr inbounds nuw %struct.mayo_params_t, ptr %12, i32 0, i32 3, !dbg !3740
  %13 = load i32, ptr %k, align 4, !dbg !3740
  %arraydecay = getelementptr inbounds [16632 x i64], ptr %PS, i32 0, i32 0, !dbg !3741
  call void @mayo_generic_m_calculate_PS(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, i32 noundef %5, i32 noundef %sub, i32 noundef %11, i32 noundef %13, ptr noundef %arraydecay) #5, !dbg !3742
  %arraydecay2 = getelementptr inbounds [16632 x i64], ptr %PS, i32 0, i32 0, !dbg !3743
  %14 = load ptr, ptr %s.addr, align 4, !dbg !3744
  %15 = load ptr, ptr %p.addr, align 4, !dbg !3745
  %m3 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %15, i32 0, i32 0, !dbg !3746
  %16 = load i32, ptr %m3, align 4, !dbg !3746
  %17 = load ptr, ptr %p.addr, align 4, !dbg !3747
  %k4 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %17, i32 0, i32 3, !dbg !3748
  %18 = load i32, ptr %k4, align 4, !dbg !3748
  %19 = load ptr, ptr %p.addr, align 4, !dbg !3749
  %n5 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %19, i32 0, i32 1, !dbg !3750
  %20 = load i32, ptr %n5, align 4, !dbg !3750
  %21 = load ptr, ptr %SPS.addr, align 4, !dbg !3751
  call void @mayo_generic_m_calculate_SPS(ptr noundef %arraydecay2, ptr noundef %14, i32 noundef %16, i32 noundef %18, i32 noundef %20, ptr noundef %21) #5, !dbg !3752
  ret void, !dbg !3753
}

; Function Attrs: noinline nounwind optnone
define internal void @mayo_generic_m_calculate_PS(ptr noundef %P1, ptr noundef %P2, ptr noundef %P3, ptr noundef %S, i32 noundef %m, i32 noundef %v, i32 noundef %o, i32 noundef %k, ptr noundef %PS) #0 !dbg !3754 {
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
    #dbg_declare(ptr %P1.addr, !3757, !DIExpression(), !3758)
  store ptr %P2, ptr %P2.addr, align 4
    #dbg_declare(ptr %P2.addr, !3759, !DIExpression(), !3760)
  store ptr %P3, ptr %P3.addr, align 4
    #dbg_declare(ptr %P3.addr, !3761, !DIExpression(), !3762)
  store ptr %S, ptr %S.addr, align 4
    #dbg_declare(ptr %S.addr, !3763, !DIExpression(), !3764)
  store i32 %m, ptr %m.addr, align 4
    #dbg_declare(ptr %m.addr, !3765, !DIExpression(), !3766)
  store i32 %v, ptr %v.addr, align 4
    #dbg_declare(ptr %v.addr, !3767, !DIExpression(), !3768)
  store i32 %o, ptr %o.addr, align 4
    #dbg_declare(ptr %o.addr, !3769, !DIExpression(), !3770)
  store i32 %k, ptr %k.addr, align 4
    #dbg_declare(ptr %k.addr, !3771, !DIExpression(), !3772)
  store ptr %PS, ptr %PS.addr, align 4
    #dbg_declare(ptr %PS.addr, !3773, !DIExpression(), !3774)
    #dbg_declare(ptr %n, !3775, !DIExpression(), !3776)
  %0 = load i32, ptr %o.addr, align 4, !dbg !3777
  %1 = load i32, ptr %v.addr, align 4, !dbg !3778
  %add = add nsw i32 %0, %1, !dbg !3779
  store i32 %add, ptr %n, align 4, !dbg !3776
    #dbg_declare(ptr %m_vec_limbs, !3780, !DIExpression(), !3781)
  %2 = load i32, ptr %m.addr, align 4, !dbg !3782
  %add1 = add nsw i32 %2, 15, !dbg !3783
  %div = sdiv i32 %add1, 16, !dbg !3784
  store i32 %div, ptr %m_vec_limbs, align 4, !dbg !3781
    #dbg_declare(ptr %accumulator, !3785, !DIExpression(), !3789)
  call void @llvm.memset.p0.i32(ptr align 8 %accumulator, i8 0, i32 2128896, i1 false), !dbg !3789
    #dbg_declare(ptr %P1_used, !3790, !DIExpression(), !3791)
  store i32 0, ptr %P1_used, align 4, !dbg !3791
    #dbg_declare(ptr %row, !3792, !DIExpression(), !3794)
  store i32 0, ptr %row, align 4, !dbg !3794
  br label %for.cond, !dbg !3795

for.cond:                                         ; preds = %for.inc52, %entry
  %3 = load i32, ptr %row, align 4, !dbg !3796
  %4 = load i32, ptr %v.addr, align 4, !dbg !3798
  %cmp = icmp slt i32 %3, %4, !dbg !3799
  br i1 %cmp, label %for.body, label %for.end54, !dbg !3800

for.body:                                         ; preds = %for.cond
    #dbg_declare(ptr %j, !3801, !DIExpression(), !3804)
  %5 = load i32, ptr %row, align 4, !dbg !3805
  store i32 %5, ptr %j, align 4, !dbg !3804
  br label %for.cond2, !dbg !3806

for.cond2:                                        ; preds = %for.inc17, %for.body
  %6 = load i32, ptr %j, align 4, !dbg !3807
  %7 = load i32, ptr %v.addr, align 4, !dbg !3809
  %cmp3 = icmp slt i32 %6, %7, !dbg !3810
  br i1 %cmp3, label %for.body4, label %for.end19, !dbg !3811

for.body4:                                        ; preds = %for.cond2
    #dbg_declare(ptr %col, !3812, !DIExpression(), !3815)
  store i32 0, ptr %col, align 4, !dbg !3815
  br label %for.cond5, !dbg !3816

for.cond5:                                        ; preds = %for.inc, %for.body4
  %8 = load i32, ptr %col, align 4, !dbg !3817
  %9 = load i32, ptr %k.addr, align 4, !dbg !3819
  %cmp6 = icmp slt i32 %8, %9, !dbg !3820
  br i1 %cmp6, label %for.body7, label %for.end, !dbg !3821

for.body7:                                        ; preds = %for.cond5
  %10 = load i32, ptr %m_vec_limbs, align 4, !dbg !3822
  %11 = load ptr, ptr %P1.addr, align 4, !dbg !3824
  %12 = load i32, ptr %P1_used, align 4, !dbg !3825
  %13 = load i32, ptr %m_vec_limbs, align 4, !dbg !3826
  %mul = mul nsw i32 %12, %13, !dbg !3827
  %add.ptr = getelementptr inbounds i64, ptr %11, i32 %mul, !dbg !3828
  %arraydecay = getelementptr inbounds [266112 x i64], ptr %accumulator, i32 0, i32 0, !dbg !3829
  %14 = load i32, ptr %row, align 4, !dbg !3830
  %15 = load i32, ptr %k.addr, align 4, !dbg !3831
  %mul8 = mul nsw i32 %14, %15, !dbg !3832
  %16 = load i32, ptr %col, align 4, !dbg !3833
  %add9 = add nsw i32 %mul8, %16, !dbg !3834
  %mul10 = mul nsw i32 %add9, 16, !dbg !3835
  %17 = load ptr, ptr %S.addr, align 4, !dbg !3836
  %18 = load i32, ptr %col, align 4, !dbg !3837
  %19 = load i32, ptr %n, align 4, !dbg !3838
  %mul11 = mul nsw i32 %18, %19, !dbg !3839
  %20 = load i32, ptr %j, align 4, !dbg !3840
  %add12 = add nsw i32 %mul11, %20, !dbg !3841
  %arrayidx = getelementptr inbounds i8, ptr %17, i32 %add12, !dbg !3836
  %21 = load i8, ptr %arrayidx, align 1, !dbg !3836
  %conv = zext i8 %21 to i32, !dbg !3836
  %add13 = add nsw i32 %mul10, %conv, !dbg !3842
  %22 = load i32, ptr %m_vec_limbs, align 4, !dbg !3843
  %mul14 = mul nsw i32 %add13, %22, !dbg !3844
  %add.ptr15 = getelementptr inbounds i64, ptr %arraydecay, i32 %mul14, !dbg !3845
  call void @m_vec_add(i32 noundef %10, ptr noundef %add.ptr, ptr noundef %add.ptr15) #5, !dbg !3846
  br label %for.inc, !dbg !3847

for.inc:                                          ; preds = %for.body7
  %23 = load i32, ptr %col, align 4, !dbg !3848
  %inc = add nsw i32 %23, 1, !dbg !3848
  store i32 %inc, ptr %col, align 4, !dbg !3848
  br label %for.cond5, !dbg !3849, !llvm.loop !3850

for.end:                                          ; preds = %for.cond5
  %24 = load i32, ptr %P1_used, align 4, !dbg !3852
  %inc16 = add nsw i32 %24, 1, !dbg !3852
  store i32 %inc16, ptr %P1_used, align 4, !dbg !3852
  br label %for.inc17, !dbg !3853

for.inc17:                                        ; preds = %for.end
  %25 = load i32, ptr %j, align 4, !dbg !3854
  %inc18 = add nsw i32 %25, 1, !dbg !3854
  store i32 %inc18, ptr %j, align 4, !dbg !3854
  br label %for.cond2, !dbg !3855, !llvm.loop !3856

for.end19:                                        ; preds = %for.cond2
    #dbg_declare(ptr %j20, !3858, !DIExpression(), !3860)
  store i32 0, ptr %j20, align 4, !dbg !3860
  br label %for.cond21, !dbg !3861

for.cond21:                                       ; preds = %for.inc49, %for.end19
  %26 = load i32, ptr %j20, align 4, !dbg !3862
  %27 = load i32, ptr %o.addr, align 4, !dbg !3864
  %cmp22 = icmp slt i32 %26, %27, !dbg !3865
  br i1 %cmp22, label %for.body24, label %for.end51, !dbg !3866

for.body24:                                       ; preds = %for.cond21
    #dbg_declare(ptr %col25, !3867, !DIExpression(), !3870)
  store i32 0, ptr %col25, align 4, !dbg !3870
  br label %for.cond26, !dbg !3871

for.cond26:                                       ; preds = %for.inc46, %for.body24
  %28 = load i32, ptr %col25, align 4, !dbg !3872
  %29 = load i32, ptr %k.addr, align 4, !dbg !3874
  %cmp27 = icmp slt i32 %28, %29, !dbg !3875
  br i1 %cmp27, label %for.body29, label %for.end48, !dbg !3876

for.body29:                                       ; preds = %for.cond26
  %30 = load i32, ptr %m_vec_limbs, align 4, !dbg !3877
  %31 = load ptr, ptr %P2.addr, align 4, !dbg !3879
  %32 = load i32, ptr %row, align 4, !dbg !3880
  %33 = load i32, ptr %o.addr, align 4, !dbg !3881
  %mul30 = mul nsw i32 %32, %33, !dbg !3882
  %34 = load i32, ptr %j20, align 4, !dbg !3883
  %add31 = add nsw i32 %mul30, %34, !dbg !3884
  %35 = load i32, ptr %m_vec_limbs, align 4, !dbg !3885
  %mul32 = mul nsw i32 %add31, %35, !dbg !3886
  %add.ptr33 = getelementptr inbounds i64, ptr %31, i32 %mul32, !dbg !3887
  %arraydecay34 = getelementptr inbounds [266112 x i64], ptr %accumulator, i32 0, i32 0, !dbg !3888
  %36 = load i32, ptr %row, align 4, !dbg !3889
  %37 = load i32, ptr %k.addr, align 4, !dbg !3890
  %mul35 = mul nsw i32 %36, %37, !dbg !3891
  %38 = load i32, ptr %col25, align 4, !dbg !3892
  %add36 = add nsw i32 %mul35, %38, !dbg !3893
  %mul37 = mul nsw i32 %add36, 16, !dbg !3894
  %39 = load ptr, ptr %S.addr, align 4, !dbg !3895
  %40 = load i32, ptr %col25, align 4, !dbg !3896
  %41 = load i32, ptr %n, align 4, !dbg !3897
  %mul38 = mul nsw i32 %40, %41, !dbg !3898
  %42 = load i32, ptr %j20, align 4, !dbg !3899
  %add39 = add nsw i32 %mul38, %42, !dbg !3900
  %43 = load i32, ptr %v.addr, align 4, !dbg !3901
  %add40 = add nsw i32 %add39, %43, !dbg !3902
  %arrayidx41 = getelementptr inbounds i8, ptr %39, i32 %add40, !dbg !3895
  %44 = load i8, ptr %arrayidx41, align 1, !dbg !3895
  %conv42 = zext i8 %44 to i32, !dbg !3895
  %add43 = add nsw i32 %mul37, %conv42, !dbg !3903
  %45 = load i32, ptr %m_vec_limbs, align 4, !dbg !3904
  %mul44 = mul nsw i32 %add43, %45, !dbg !3905
  %add.ptr45 = getelementptr inbounds i64, ptr %arraydecay34, i32 %mul44, !dbg !3906
  call void @m_vec_add(i32 noundef %30, ptr noundef %add.ptr33, ptr noundef %add.ptr45) #5, !dbg !3907
  br label %for.inc46, !dbg !3908

for.inc46:                                        ; preds = %for.body29
  %46 = load i32, ptr %col25, align 4, !dbg !3909
  %inc47 = add nsw i32 %46, 1, !dbg !3909
  store i32 %inc47, ptr %col25, align 4, !dbg !3909
  br label %for.cond26, !dbg !3910, !llvm.loop !3911

for.end48:                                        ; preds = %for.cond26
  br label %for.inc49, !dbg !3913

for.inc49:                                        ; preds = %for.end48
  %47 = load i32, ptr %j20, align 4, !dbg !3914
  %inc50 = add nsw i32 %47, 1, !dbg !3914
  store i32 %inc50, ptr %j20, align 4, !dbg !3914
  br label %for.cond21, !dbg !3915, !llvm.loop !3916

for.end51:                                        ; preds = %for.cond21
  br label %for.inc52, !dbg !3918

for.inc52:                                        ; preds = %for.end51
  %48 = load i32, ptr %row, align 4, !dbg !3919
  %inc53 = add nsw i32 %48, 1, !dbg !3919
  store i32 %inc53, ptr %row, align 4, !dbg !3919
  br label %for.cond, !dbg !3920, !llvm.loop !3921

for.end54:                                        ; preds = %for.cond
    #dbg_declare(ptr %P3_used, !3923, !DIExpression(), !3924)
  store i32 0, ptr %P3_used, align 4, !dbg !3924
    #dbg_declare(ptr %row55, !3925, !DIExpression(), !3927)
  %49 = load i32, ptr %v.addr, align 4, !dbg !3928
  store i32 %49, ptr %row55, align 4, !dbg !3927
  br label %for.cond56, !dbg !3929

for.cond56:                                       ; preds = %for.inc90, %for.end54
  %50 = load i32, ptr %row55, align 4, !dbg !3930
  %51 = load i32, ptr %n, align 4, !dbg !3932
  %cmp57 = icmp slt i32 %50, %51, !dbg !3933
  br i1 %cmp57, label %for.body59, label %for.end92, !dbg !3934

for.body59:                                       ; preds = %for.cond56
    #dbg_declare(ptr %j60, !3935, !DIExpression(), !3938)
  %52 = load i32, ptr %row55, align 4, !dbg !3939
  store i32 %52, ptr %j60, align 4, !dbg !3938
  br label %for.cond61, !dbg !3940

for.cond61:                                       ; preds = %for.inc87, %for.body59
  %53 = load i32, ptr %j60, align 4, !dbg !3941
  %54 = load i32, ptr %n, align 4, !dbg !3943
  %cmp62 = icmp slt i32 %53, %54, !dbg !3944
  br i1 %cmp62, label %for.body64, label %for.end89, !dbg !3945

for.body64:                                       ; preds = %for.cond61
    #dbg_declare(ptr %col65, !3946, !DIExpression(), !3949)
  store i32 0, ptr %col65, align 4, !dbg !3949
  br label %for.cond66, !dbg !3950

for.cond66:                                       ; preds = %for.inc83, %for.body64
  %55 = load i32, ptr %col65, align 4, !dbg !3951
  %56 = load i32, ptr %k.addr, align 4, !dbg !3953
  %cmp67 = icmp slt i32 %55, %56, !dbg !3954
  br i1 %cmp67, label %for.body69, label %for.end85, !dbg !3955

for.body69:                                       ; preds = %for.cond66
  %57 = load i32, ptr %m_vec_limbs, align 4, !dbg !3956
  %58 = load ptr, ptr %P3.addr, align 4, !dbg !3958
  %59 = load i32, ptr %P3_used, align 4, !dbg !3959
  %60 = load i32, ptr %m_vec_limbs, align 4, !dbg !3960
  %mul70 = mul nsw i32 %59, %60, !dbg !3961
  %add.ptr71 = getelementptr inbounds i64, ptr %58, i32 %mul70, !dbg !3962
  %arraydecay72 = getelementptr inbounds [266112 x i64], ptr %accumulator, i32 0, i32 0, !dbg !3963
  %61 = load i32, ptr %row55, align 4, !dbg !3964
  %62 = load i32, ptr %k.addr, align 4, !dbg !3965
  %mul73 = mul nsw i32 %61, %62, !dbg !3966
  %63 = load i32, ptr %col65, align 4, !dbg !3967
  %add74 = add nsw i32 %mul73, %63, !dbg !3968
  %mul75 = mul nsw i32 %add74, 16, !dbg !3969
  %64 = load ptr, ptr %S.addr, align 4, !dbg !3970
  %65 = load i32, ptr %col65, align 4, !dbg !3971
  %66 = load i32, ptr %n, align 4, !dbg !3972
  %mul76 = mul nsw i32 %65, %66, !dbg !3973
  %67 = load i32, ptr %j60, align 4, !dbg !3974
  %add77 = add nsw i32 %mul76, %67, !dbg !3975
  %arrayidx78 = getelementptr inbounds i8, ptr %64, i32 %add77, !dbg !3970
  %68 = load i8, ptr %arrayidx78, align 1, !dbg !3970
  %conv79 = zext i8 %68 to i32, !dbg !3970
  %add80 = add nsw i32 %mul75, %conv79, !dbg !3976
  %69 = load i32, ptr %m_vec_limbs, align 4, !dbg !3977
  %mul81 = mul nsw i32 %add80, %69, !dbg !3978
  %add.ptr82 = getelementptr inbounds i64, ptr %arraydecay72, i32 %mul81, !dbg !3979
  call void @m_vec_add(i32 noundef %57, ptr noundef %add.ptr71, ptr noundef %add.ptr82) #5, !dbg !3980
  br label %for.inc83, !dbg !3981

for.inc83:                                        ; preds = %for.body69
  %70 = load i32, ptr %col65, align 4, !dbg !3982
  %inc84 = add nsw i32 %70, 1, !dbg !3982
  store i32 %inc84, ptr %col65, align 4, !dbg !3982
  br label %for.cond66, !dbg !3983, !llvm.loop !3984

for.end85:                                        ; preds = %for.cond66
  %71 = load i32, ptr %P3_used, align 4, !dbg !3986
  %inc86 = add nsw i32 %71, 1, !dbg !3986
  store i32 %inc86, ptr %P3_used, align 4, !dbg !3986
  br label %for.inc87, !dbg !3987

for.inc87:                                        ; preds = %for.end85
  %72 = load i32, ptr %j60, align 4, !dbg !3988
  %inc88 = add nsw i32 %72, 1, !dbg !3988
  store i32 %inc88, ptr %j60, align 4, !dbg !3988
  br label %for.cond61, !dbg !3989, !llvm.loop !3990

for.end89:                                        ; preds = %for.cond61
  br label %for.inc90, !dbg !3992

for.inc90:                                        ; preds = %for.end89
  %73 = load i32, ptr %row55, align 4, !dbg !3993
  %inc91 = add nsw i32 %73, 1, !dbg !3993
  store i32 %inc91, ptr %row55, align 4, !dbg !3993
  br label %for.cond56, !dbg !3994, !llvm.loop !3995

for.end92:                                        ; preds = %for.cond56
    #dbg_declare(ptr %i, !3997, !DIExpression(), !3998)
  store i32 0, ptr %i, align 4, !dbg !3998
  br label %while.cond, !dbg !3999

while.cond:                                       ; preds = %while.body, %for.end92
  %74 = load i32, ptr %i, align 4, !dbg !4000
  %75 = load i32, ptr %n, align 4, !dbg !4001
  %76 = load i32, ptr %k.addr, align 4, !dbg !4002
  %mul93 = mul nsw i32 %75, %76, !dbg !4003
  %cmp94 = icmp slt i32 %74, %mul93, !dbg !4004
  br i1 %cmp94, label %while.body, label %while.end, !dbg !3999

while.body:                                       ; preds = %while.cond
  %77 = load i32, ptr %m_vec_limbs, align 4, !dbg !4005
  %arraydecay96 = getelementptr inbounds [266112 x i64], ptr %accumulator, i32 0, i32 0, !dbg !4007
  %78 = load i32, ptr %i, align 4, !dbg !4008
  %mul97 = mul nsw i32 %78, 16, !dbg !4009
  %79 = load i32, ptr %m_vec_limbs, align 4, !dbg !4010
  %mul98 = mul nsw i32 %mul97, %79, !dbg !4011
  %add.ptr99 = getelementptr inbounds i64, ptr %arraydecay96, i32 %mul98, !dbg !4012
  %80 = load ptr, ptr %PS.addr, align 4, !dbg !4013
  %81 = load i32, ptr %i, align 4, !dbg !4014
  %82 = load i32, ptr %m_vec_limbs, align 4, !dbg !4015
  %mul100 = mul nsw i32 %81, %82, !dbg !4016
  %add.ptr101 = getelementptr inbounds i64, ptr %80, i32 %mul100, !dbg !4017
  call void @m_vec_multiply_bins(i32 noundef %77, ptr noundef %add.ptr99, ptr noundef %add.ptr101) #5, !dbg !4018
  %83 = load i32, ptr %i, align 4, !dbg !4019
  %inc102 = add nsw i32 %83, 1, !dbg !4019
  store i32 %inc102, ptr %i, align 4, !dbg !4019
  br label %while.cond, !dbg !3999, !llvm.loop !4020

while.end:                                        ; preds = %while.cond
  ret void, !dbg !4022
}

; Function Attrs: noinline nounwind optnone
define internal void @mayo_generic_m_calculate_SPS(ptr noundef %PS, ptr noundef %S, i32 noundef %m, i32 noundef %k, i32 noundef %n, ptr noundef %SPS) #0 !dbg !4023 {
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
    #dbg_declare(ptr %PS.addr, !4026, !DIExpression(), !4027)
  store ptr %S, ptr %S.addr, align 4
    #dbg_declare(ptr %S.addr, !4028, !DIExpression(), !4029)
  store i32 %m, ptr %m.addr, align 4
    #dbg_declare(ptr %m.addr, !4030, !DIExpression(), !4031)
  store i32 %k, ptr %k.addr, align 4
    #dbg_declare(ptr %k.addr, !4032, !DIExpression(), !4033)
  store i32 %n, ptr %n.addr, align 4
    #dbg_declare(ptr %n.addr, !4034, !DIExpression(), !4035)
  store ptr %SPS, ptr %SPS.addr, align 4
    #dbg_declare(ptr %SPS.addr, !4036, !DIExpression(), !4037)
    #dbg_declare(ptr %accumulator, !4038, !DIExpression(), !4042)
  call void @llvm.memset.p0.i32(ptr align 8 %accumulator, i8 0, i32 165888, i1 false), !dbg !4042
    #dbg_declare(ptr %m_vec_limbs, !4043, !DIExpression(), !4044)
  %0 = load i32, ptr %m.addr, align 4, !dbg !4045
  %add = add nsw i32 %0, 15, !dbg !4046
  %div = sdiv i32 %add, 16, !dbg !4047
  store i32 %div, ptr %m_vec_limbs, align 4, !dbg !4044
    #dbg_declare(ptr %row, !4048, !DIExpression(), !4050)
  store i32 0, ptr %row, align 4, !dbg !4050
  br label %for.cond, !dbg !4051

for.cond:                                         ; preds = %for.inc20, %entry
  %1 = load i32, ptr %row, align 4, !dbg !4052
  %2 = load i32, ptr %k.addr, align 4, !dbg !4054
  %cmp = icmp slt i32 %1, %2, !dbg !4055
  br i1 %cmp, label %for.body, label %for.end22, !dbg !4056

for.body:                                         ; preds = %for.cond
    #dbg_declare(ptr %j, !4057, !DIExpression(), !4060)
  store i32 0, ptr %j, align 4, !dbg !4060
  br label %for.cond1, !dbg !4061

for.cond1:                                        ; preds = %for.inc18, %for.body
  %3 = load i32, ptr %j, align 4, !dbg !4062
  %4 = load i32, ptr %n.addr, align 4, !dbg !4064
  %cmp2 = icmp slt i32 %3, %4, !dbg !4065
  br i1 %cmp2, label %for.body3, label %for.end19, !dbg !4066

for.body3:                                        ; preds = %for.cond1
    #dbg_declare(ptr %col, !4067, !DIExpression(), !4070)
  store i32 0, ptr %col, align 4, !dbg !4070
  br label %for.cond4, !dbg !4071

for.cond4:                                        ; preds = %for.inc, %for.body3
  %5 = load i32, ptr %col, align 4, !dbg !4072
  %6 = load i32, ptr %k.addr, align 4, !dbg !4074
  %cmp5 = icmp slt i32 %5, %6, !dbg !4075
  br i1 %cmp5, label %for.body6, label %for.end, !dbg !4076

for.body6:                                        ; preds = %for.cond4
  %7 = load i32, ptr %m_vec_limbs, align 4, !dbg !4077
  %8 = load ptr, ptr %PS.addr, align 4, !dbg !4079
  %9 = load i32, ptr %j, align 4, !dbg !4080
  %10 = load i32, ptr %k.addr, align 4, !dbg !4081
  %mul = mul nsw i32 %9, %10, !dbg !4082
  %11 = load i32, ptr %col, align 4, !dbg !4083
  %add7 = add nsw i32 %mul, %11, !dbg !4084
  %12 = load i32, ptr %m_vec_limbs, align 4, !dbg !4085
  %mul8 = mul nsw i32 %add7, %12, !dbg !4086
  %add.ptr = getelementptr inbounds i64, ptr %8, i32 %mul8, !dbg !4087
  %arraydecay = getelementptr inbounds [20736 x i64], ptr %accumulator, i32 0, i32 0, !dbg !4088
  %13 = load i32, ptr %row, align 4, !dbg !4089
  %14 = load i32, ptr %k.addr, align 4, !dbg !4090
  %mul9 = mul nsw i32 %13, %14, !dbg !4091
  %15 = load i32, ptr %col, align 4, !dbg !4092
  %add10 = add nsw i32 %mul9, %15, !dbg !4093
  %mul11 = mul nsw i32 %add10, 16, !dbg !4094
  %16 = load ptr, ptr %S.addr, align 4, !dbg !4095
  %17 = load i32, ptr %row, align 4, !dbg !4096
  %18 = load i32, ptr %n.addr, align 4, !dbg !4097
  %mul12 = mul nsw i32 %17, %18, !dbg !4098
  %19 = load i32, ptr %j, align 4, !dbg !4099
  %add13 = add nsw i32 %mul12, %19, !dbg !4100
  %arrayidx = getelementptr inbounds i8, ptr %16, i32 %add13, !dbg !4095
  %20 = load i8, ptr %arrayidx, align 1, !dbg !4095
  %conv = zext i8 %20 to i32, !dbg !4095
  %add14 = add nsw i32 %mul11, %conv, !dbg !4101
  %21 = load i32, ptr %m_vec_limbs, align 4, !dbg !4102
  %mul15 = mul nsw i32 %add14, %21, !dbg !4103
  %add.ptr16 = getelementptr inbounds i64, ptr %arraydecay, i32 %mul15, !dbg !4104
  call void @m_vec_add(i32 noundef %7, ptr noundef %add.ptr, ptr noundef %add.ptr16) #5, !dbg !4105
  br label %for.inc, !dbg !4106

for.inc:                                          ; preds = %for.body6
  %22 = load i32, ptr %col, align 4, !dbg !4107
  %add17 = add nsw i32 %22, 1, !dbg !4107
  store i32 %add17, ptr %col, align 4, !dbg !4107
  br label %for.cond4, !dbg !4108, !llvm.loop !4109

for.end:                                          ; preds = %for.cond4
  br label %for.inc18, !dbg !4111

for.inc18:                                        ; preds = %for.end
  %23 = load i32, ptr %j, align 4, !dbg !4112
  %inc = add nsw i32 %23, 1, !dbg !4112
  store i32 %inc, ptr %j, align 4, !dbg !4112
  br label %for.cond1, !dbg !4113, !llvm.loop !4114

for.end19:                                        ; preds = %for.cond1
  br label %for.inc20, !dbg !4116

for.inc20:                                        ; preds = %for.end19
  %24 = load i32, ptr %row, align 4, !dbg !4117
  %inc21 = add nsw i32 %24, 1, !dbg !4117
  store i32 %inc21, ptr %row, align 4, !dbg !4117
  br label %for.cond, !dbg !4118, !llvm.loop !4119

for.end22:                                        ; preds = %for.cond
    #dbg_declare(ptr %i, !4121, !DIExpression(), !4122)
  store i32 0, ptr %i, align 4, !dbg !4122
  br label %while.cond, !dbg !4123

while.cond:                                       ; preds = %while.body, %for.end22
  %25 = load i32, ptr %i, align 4, !dbg !4124
  %26 = load i32, ptr %k.addr, align 4, !dbg !4125
  %27 = load i32, ptr %k.addr, align 4, !dbg !4126
  %mul23 = mul nsw i32 %26, %27, !dbg !4127
  %cmp24 = icmp slt i32 %25, %mul23, !dbg !4128
  br i1 %cmp24, label %while.body, label %while.end, !dbg !4123

while.body:                                       ; preds = %while.cond
  %28 = load i32, ptr %m_vec_limbs, align 4, !dbg !4129
  %arraydecay26 = getelementptr inbounds [20736 x i64], ptr %accumulator, i32 0, i32 0, !dbg !4131
  %29 = load i32, ptr %i, align 4, !dbg !4132
  %mul27 = mul nsw i32 %29, 16, !dbg !4133
  %30 = load i32, ptr %m_vec_limbs, align 4, !dbg !4134
  %mul28 = mul nsw i32 %mul27, %30, !dbg !4135
  %add.ptr29 = getelementptr inbounds i64, ptr %arraydecay26, i32 %mul28, !dbg !4136
  %31 = load ptr, ptr %SPS.addr, align 4, !dbg !4137
  %32 = load i32, ptr %i, align 4, !dbg !4138
  %33 = load i32, ptr %m_vec_limbs, align 4, !dbg !4139
  %mul30 = mul nsw i32 %32, %33, !dbg !4140
  %add.ptr31 = getelementptr inbounds i64, ptr %31, i32 %mul30, !dbg !4141
  call void @m_vec_multiply_bins(i32 noundef %28, ptr noundef %add.ptr29, ptr noundef %add.ptr31) #5, !dbg !4142
  %34 = load i32, ptr %i, align 4, !dbg !4143
  %inc32 = add nsw i32 %34, 1, !dbg !4143
  store i32 %inc32, ptr %i, align 4, !dbg !4143
  br label %while.cond, !dbg !4123, !llvm.loop !4144

while.end:                                        ; preds = %while.cond
  ret void, !dbg !4146
}

; Function Attrs: noinline nounwind optnone
define internal void @m_vec_add(i32 noundef %m_vec_limbs, ptr noundef %in, ptr noundef %acc) #0 !dbg !4147 {
entry:
  %m_vec_limbs.addr = alloca i32, align 4
  %in.addr = alloca ptr, align 4
  %acc.addr = alloca ptr, align 4
  %i = alloca i32, align 4
  store i32 %m_vec_limbs, ptr %m_vec_limbs.addr, align 4
    #dbg_declare(ptr %m_vec_limbs.addr, !4150, !DIExpression(), !4151)
  store ptr %in, ptr %in.addr, align 4
    #dbg_declare(ptr %in.addr, !4152, !DIExpression(), !4153)
  store ptr %acc, ptr %acc.addr, align 4
    #dbg_declare(ptr %acc.addr, !4154, !DIExpression(), !4155)
    #dbg_declare(ptr %i, !4156, !DIExpression(), !4158)
  store i32 0, ptr %i, align 4, !dbg !4158
  br label %for.cond, !dbg !4159

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4, !dbg !4160
  %1 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4162
  %cmp = icmp slt i32 %0, %1, !dbg !4163
  br i1 %cmp, label %for.body, label %for.end, !dbg !4164

for.body:                                         ; preds = %for.cond
  %2 = load ptr, ptr %in.addr, align 4, !dbg !4165
  %3 = load i32, ptr %i, align 4, !dbg !4167
  %arrayidx = getelementptr inbounds i64, ptr %2, i32 %3, !dbg !4165
  %4 = load i64, ptr %arrayidx, align 8, !dbg !4165
  %5 = load ptr, ptr %acc.addr, align 4, !dbg !4168
  %6 = load i32, ptr %i, align 4, !dbg !4169
  %arrayidx1 = getelementptr inbounds i64, ptr %5, i32 %6, !dbg !4168
  %7 = load i64, ptr %arrayidx1, align 8, !dbg !4170
  %xor = xor i64 %7, %4, !dbg !4170
  store i64 %xor, ptr %arrayidx1, align 8, !dbg !4170
  br label %for.inc, !dbg !4171

for.inc:                                          ; preds = %for.body
  %8 = load i32, ptr %i, align 4, !dbg !4172
  %inc = add nsw i32 %8, 1, !dbg !4172
  store i32 %inc, ptr %i, align 4, !dbg !4172
  br label %for.cond, !dbg !4173, !llvm.loop !4174

for.end:                                          ; preds = %for.cond
  ret void, !dbg !4176
}

; Function Attrs: noinline nounwind optnone
define internal void @m_vec_multiply_bins(i32 noundef %m_vec_limbs, ptr noundef %bins, ptr noundef %out) #0 !dbg !4177 {
entry:
  %m_vec_limbs.addr = alloca i32, align 4
  %bins.addr = alloca ptr, align 4
  %out.addr = alloca ptr, align 4
  store i32 %m_vec_limbs, ptr %m_vec_limbs.addr, align 4
    #dbg_declare(ptr %m_vec_limbs.addr, !4180, !DIExpression(), !4181)
  store ptr %bins, ptr %bins.addr, align 4
    #dbg_declare(ptr %bins.addr, !4182, !DIExpression(), !4183)
  store ptr %out, ptr %out.addr, align 4
    #dbg_declare(ptr %out.addr, !4184, !DIExpression(), !4185)
  %0 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4186
  %1 = load ptr, ptr %bins.addr, align 4, !dbg !4187
  %2 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4188
  %mul = mul nsw i32 5, %2, !dbg !4189
  %add.ptr = getelementptr inbounds i64, ptr %1, i32 %mul, !dbg !4190
  %3 = load ptr, ptr %bins.addr, align 4, !dbg !4191
  %4 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4192
  %mul1 = mul nsw i32 10, %4, !dbg !4193
  %add.ptr2 = getelementptr inbounds i64, ptr %3, i32 %mul1, !dbg !4194
  call void @m_vec_mul_add_x_inv(i32 noundef %0, ptr noundef %add.ptr, ptr noundef %add.ptr2) #5, !dbg !4195
  %5 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4196
  %6 = load ptr, ptr %bins.addr, align 4, !dbg !4197
  %7 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4198
  %mul3 = mul nsw i32 11, %7, !dbg !4199
  %add.ptr4 = getelementptr inbounds i64, ptr %6, i32 %mul3, !dbg !4200
  %8 = load ptr, ptr %bins.addr, align 4, !dbg !4201
  %9 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4202
  %mul5 = mul nsw i32 12, %9, !dbg !4203
  %add.ptr6 = getelementptr inbounds i64, ptr %8, i32 %mul5, !dbg !4204
  call void @m_vec_mul_add_x(i32 noundef %5, ptr noundef %add.ptr4, ptr noundef %add.ptr6) #5, !dbg !4205
  %10 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4206
  %11 = load ptr, ptr %bins.addr, align 4, !dbg !4207
  %12 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4208
  %mul7 = mul nsw i32 10, %12, !dbg !4209
  %add.ptr8 = getelementptr inbounds i64, ptr %11, i32 %mul7, !dbg !4210
  %13 = load ptr, ptr %bins.addr, align 4, !dbg !4211
  %14 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4212
  %mul9 = mul nsw i32 7, %14, !dbg !4213
  %add.ptr10 = getelementptr inbounds i64, ptr %13, i32 %mul9, !dbg !4214
  call void @m_vec_mul_add_x_inv(i32 noundef %10, ptr noundef %add.ptr8, ptr noundef %add.ptr10) #5, !dbg !4215
  %15 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4216
  %16 = load ptr, ptr %bins.addr, align 4, !dbg !4217
  %17 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4218
  %mul11 = mul nsw i32 12, %17, !dbg !4219
  %add.ptr12 = getelementptr inbounds i64, ptr %16, i32 %mul11, !dbg !4220
  %18 = load ptr, ptr %bins.addr, align 4, !dbg !4221
  %19 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4222
  %mul13 = mul nsw i32 6, %19, !dbg !4223
  %add.ptr14 = getelementptr inbounds i64, ptr %18, i32 %mul13, !dbg !4224
  call void @m_vec_mul_add_x(i32 noundef %15, ptr noundef %add.ptr12, ptr noundef %add.ptr14) #5, !dbg !4225
  %20 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4226
  %21 = load ptr, ptr %bins.addr, align 4, !dbg !4227
  %22 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4228
  %mul15 = mul nsw i32 7, %22, !dbg !4229
  %add.ptr16 = getelementptr inbounds i64, ptr %21, i32 %mul15, !dbg !4230
  %23 = load ptr, ptr %bins.addr, align 4, !dbg !4231
  %24 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4232
  %mul17 = mul nsw i32 14, %24, !dbg !4233
  %add.ptr18 = getelementptr inbounds i64, ptr %23, i32 %mul17, !dbg !4234
  call void @m_vec_mul_add_x_inv(i32 noundef %20, ptr noundef %add.ptr16, ptr noundef %add.ptr18) #5, !dbg !4235
  %25 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4236
  %26 = load ptr, ptr %bins.addr, align 4, !dbg !4237
  %27 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4238
  %mul19 = mul nsw i32 6, %27, !dbg !4239
  %add.ptr20 = getelementptr inbounds i64, ptr %26, i32 %mul19, !dbg !4240
  %28 = load ptr, ptr %bins.addr, align 4, !dbg !4241
  %29 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4242
  %mul21 = mul nsw i32 3, %29, !dbg !4243
  %add.ptr22 = getelementptr inbounds i64, ptr %28, i32 %mul21, !dbg !4244
  call void @m_vec_mul_add_x(i32 noundef %25, ptr noundef %add.ptr20, ptr noundef %add.ptr22) #5, !dbg !4245
  %30 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4246
  %31 = load ptr, ptr %bins.addr, align 4, !dbg !4247
  %32 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4248
  %mul23 = mul nsw i32 14, %32, !dbg !4249
  %add.ptr24 = getelementptr inbounds i64, ptr %31, i32 %mul23, !dbg !4250
  %33 = load ptr, ptr %bins.addr, align 4, !dbg !4251
  %34 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4252
  %mul25 = mul nsw i32 15, %34, !dbg !4253
  %add.ptr26 = getelementptr inbounds i64, ptr %33, i32 %mul25, !dbg !4254
  call void @m_vec_mul_add_x_inv(i32 noundef %30, ptr noundef %add.ptr24, ptr noundef %add.ptr26) #5, !dbg !4255
  %35 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4256
  %36 = load ptr, ptr %bins.addr, align 4, !dbg !4257
  %37 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4258
  %mul27 = mul nsw i32 3, %37, !dbg !4259
  %add.ptr28 = getelementptr inbounds i64, ptr %36, i32 %mul27, !dbg !4260
  %38 = load ptr, ptr %bins.addr, align 4, !dbg !4261
  %39 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4262
  %mul29 = mul nsw i32 8, %39, !dbg !4263
  %add.ptr30 = getelementptr inbounds i64, ptr %38, i32 %mul29, !dbg !4264
  call void @m_vec_mul_add_x(i32 noundef %35, ptr noundef %add.ptr28, ptr noundef %add.ptr30) #5, !dbg !4265
  %40 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4266
  %41 = load ptr, ptr %bins.addr, align 4, !dbg !4267
  %42 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4268
  %mul31 = mul nsw i32 15, %42, !dbg !4269
  %add.ptr32 = getelementptr inbounds i64, ptr %41, i32 %mul31, !dbg !4270
  %43 = load ptr, ptr %bins.addr, align 4, !dbg !4271
  %44 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4272
  %mul33 = mul nsw i32 13, %44, !dbg !4273
  %add.ptr34 = getelementptr inbounds i64, ptr %43, i32 %mul33, !dbg !4274
  call void @m_vec_mul_add_x_inv(i32 noundef %40, ptr noundef %add.ptr32, ptr noundef %add.ptr34) #5, !dbg !4275
  %45 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4276
  %46 = load ptr, ptr %bins.addr, align 4, !dbg !4277
  %47 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4278
  %mul35 = mul nsw i32 8, %47, !dbg !4279
  %add.ptr36 = getelementptr inbounds i64, ptr %46, i32 %mul35, !dbg !4280
  %48 = load ptr, ptr %bins.addr, align 4, !dbg !4281
  %49 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4282
  %mul37 = mul nsw i32 4, %49, !dbg !4283
  %add.ptr38 = getelementptr inbounds i64, ptr %48, i32 %mul37, !dbg !4284
  call void @m_vec_mul_add_x(i32 noundef %45, ptr noundef %add.ptr36, ptr noundef %add.ptr38) #5, !dbg !4285
  %50 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4286
  %51 = load ptr, ptr %bins.addr, align 4, !dbg !4287
  %52 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4288
  %mul39 = mul nsw i32 13, %52, !dbg !4289
  %add.ptr40 = getelementptr inbounds i64, ptr %51, i32 %mul39, !dbg !4290
  %53 = load ptr, ptr %bins.addr, align 4, !dbg !4291
  %54 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4292
  %mul41 = mul nsw i32 9, %54, !dbg !4293
  %add.ptr42 = getelementptr inbounds i64, ptr %53, i32 %mul41, !dbg !4294
  call void @m_vec_mul_add_x_inv(i32 noundef %50, ptr noundef %add.ptr40, ptr noundef %add.ptr42) #5, !dbg !4295
  %55 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4296
  %56 = load ptr, ptr %bins.addr, align 4, !dbg !4297
  %57 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4298
  %mul43 = mul nsw i32 4, %57, !dbg !4299
  %add.ptr44 = getelementptr inbounds i64, ptr %56, i32 %mul43, !dbg !4300
  %58 = load ptr, ptr %bins.addr, align 4, !dbg !4301
  %59 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4302
  %mul45 = mul nsw i32 2, %59, !dbg !4303
  %add.ptr46 = getelementptr inbounds i64, ptr %58, i32 %mul45, !dbg !4304
  call void @m_vec_mul_add_x(i32 noundef %55, ptr noundef %add.ptr44, ptr noundef %add.ptr46) #5, !dbg !4305
  %60 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4306
  %61 = load ptr, ptr %bins.addr, align 4, !dbg !4307
  %62 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4308
  %mul47 = mul nsw i32 9, %62, !dbg !4309
  %add.ptr48 = getelementptr inbounds i64, ptr %61, i32 %mul47, !dbg !4310
  %63 = load ptr, ptr %bins.addr, align 4, !dbg !4311
  %64 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4312
  %mul49 = mul nsw i32 1, %64, !dbg !4313
  %add.ptr50 = getelementptr inbounds i64, ptr %63, i32 %mul49, !dbg !4314
  call void @m_vec_mul_add_x_inv(i32 noundef %60, ptr noundef %add.ptr48, ptr noundef %add.ptr50) #5, !dbg !4315
  %65 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4316
  %66 = load ptr, ptr %bins.addr, align 4, !dbg !4317
  %67 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4318
  %mul51 = mul nsw i32 2, %67, !dbg !4319
  %add.ptr52 = getelementptr inbounds i64, ptr %66, i32 %mul51, !dbg !4320
  %68 = load ptr, ptr %bins.addr, align 4, !dbg !4321
  %69 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4322
  %mul53 = mul nsw i32 1, %69, !dbg !4323
  %add.ptr54 = getelementptr inbounds i64, ptr %68, i32 %mul53, !dbg !4324
  call void @m_vec_mul_add_x(i32 noundef %65, ptr noundef %add.ptr52, ptr noundef %add.ptr54) #5, !dbg !4325
  %70 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4326
  %71 = load ptr, ptr %bins.addr, align 4, !dbg !4327
  %72 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4328
  %add.ptr55 = getelementptr inbounds i64, ptr %71, i32 %72, !dbg !4329
  %73 = load ptr, ptr %out.addr, align 4, !dbg !4330
  call void @m_vec_copy(i32 noundef %70, ptr noundef %add.ptr55, ptr noundef %73) #5, !dbg !4331
  ret void, !dbg !4332
}

; Function Attrs: noinline nounwind optnone
define internal void @m_vec_mul_add_x_inv(i32 noundef %m_vec_limbs, ptr noundef %in, ptr noundef %acc) #0 !dbg !4333 {
entry:
  %m_vec_limbs.addr = alloca i32, align 4
  %in.addr = alloca ptr, align 4
  %acc.addr = alloca ptr, align 4
  %mask_lsb = alloca i64, align 8
  %i = alloca i32, align 4
  %t = alloca i64, align 8
  store i32 %m_vec_limbs, ptr %m_vec_limbs.addr, align 4
    #dbg_declare(ptr %m_vec_limbs.addr, !4334, !DIExpression(), !4335)
  store ptr %in, ptr %in.addr, align 4
    #dbg_declare(ptr %in.addr, !4336, !DIExpression(), !4337)
  store ptr %acc, ptr %acc.addr, align 4
    #dbg_declare(ptr %acc.addr, !4338, !DIExpression(), !4339)
    #dbg_declare(ptr %mask_lsb, !4340, !DIExpression(), !4341)
  store i64 1229782938247303441, ptr %mask_lsb, align 8, !dbg !4341
    #dbg_declare(ptr %i, !4342, !DIExpression(), !4344)
  store i32 0, ptr %i, align 4, !dbg !4344
  br label %for.cond, !dbg !4345

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4, !dbg !4346
  %1 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4348
  %cmp = icmp slt i32 %0, %1, !dbg !4349
  br i1 %cmp, label %for.body, label %for.end, !dbg !4350

for.body:                                         ; preds = %for.cond
    #dbg_declare(ptr %t, !4351, !DIExpression(), !4353)
  %2 = load ptr, ptr %in.addr, align 4, !dbg !4354
  %3 = load i32, ptr %i, align 4, !dbg !4355
  %arrayidx = getelementptr inbounds i64, ptr %2, i32 %3, !dbg !4354
  %4 = load i64, ptr %arrayidx, align 8, !dbg !4354
  %5 = load i64, ptr %mask_lsb, align 8, !dbg !4356
  %and = and i64 %4, %5, !dbg !4357
  store i64 %and, ptr %t, align 8, !dbg !4353
  %6 = load ptr, ptr %in.addr, align 4, !dbg !4358
  %7 = load i32, ptr %i, align 4, !dbg !4359
  %arrayidx1 = getelementptr inbounds i64, ptr %6, i32 %7, !dbg !4358
  %8 = load i64, ptr %arrayidx1, align 8, !dbg !4358
  %9 = load i64, ptr %t, align 8, !dbg !4360
  %xor = xor i64 %8, %9, !dbg !4361
  %shr = lshr i64 %xor, 1, !dbg !4362
  %10 = load i64, ptr %t, align 8, !dbg !4363
  %mul = mul i64 %10, 9, !dbg !4364
  %xor2 = xor i64 %shr, %mul, !dbg !4365
  %11 = load ptr, ptr %acc.addr, align 4, !dbg !4366
  %12 = load i32, ptr %i, align 4, !dbg !4367
  %arrayidx3 = getelementptr inbounds i64, ptr %11, i32 %12, !dbg !4366
  %13 = load i64, ptr %arrayidx3, align 8, !dbg !4368
  %xor4 = xor i64 %13, %xor2, !dbg !4368
  store i64 %xor4, ptr %arrayidx3, align 8, !dbg !4368
  br label %for.inc, !dbg !4369

for.inc:                                          ; preds = %for.body
  %14 = load i32, ptr %i, align 4, !dbg !4370
  %inc = add nsw i32 %14, 1, !dbg !4370
  store i32 %inc, ptr %i, align 4, !dbg !4370
  br label %for.cond, !dbg !4371, !llvm.loop !4372

for.end:                                          ; preds = %for.cond
  ret void, !dbg !4374
}

; Function Attrs: noinline nounwind optnone
define internal void @m_vec_mul_add_x(i32 noundef %m_vec_limbs, ptr noundef %in, ptr noundef %acc) #0 !dbg !4375 {
entry:
  %m_vec_limbs.addr = alloca i32, align 4
  %in.addr = alloca ptr, align 4
  %acc.addr = alloca ptr, align 4
  %mask_msb = alloca i64, align 8
  %i = alloca i32, align 4
  %t = alloca i64, align 8
  store i32 %m_vec_limbs, ptr %m_vec_limbs.addr, align 4
    #dbg_declare(ptr %m_vec_limbs.addr, !4376, !DIExpression(), !4377)
  store ptr %in, ptr %in.addr, align 4
    #dbg_declare(ptr %in.addr, !4378, !DIExpression(), !4379)
  store ptr %acc, ptr %acc.addr, align 4
    #dbg_declare(ptr %acc.addr, !4380, !DIExpression(), !4381)
    #dbg_declare(ptr %mask_msb, !4382, !DIExpression(), !4383)
  store i64 -8608480567731124088, ptr %mask_msb, align 8, !dbg !4383
    #dbg_declare(ptr %i, !4384, !DIExpression(), !4386)
  store i32 0, ptr %i, align 4, !dbg !4386
  br label %for.cond, !dbg !4387

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4, !dbg !4388
  %1 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4390
  %cmp = icmp slt i32 %0, %1, !dbg !4391
  br i1 %cmp, label %for.body, label %for.end, !dbg !4392

for.body:                                         ; preds = %for.cond
    #dbg_declare(ptr %t, !4393, !DIExpression(), !4395)
  %2 = load ptr, ptr %in.addr, align 4, !dbg !4396
  %3 = load i32, ptr %i, align 4, !dbg !4397
  %arrayidx = getelementptr inbounds i64, ptr %2, i32 %3, !dbg !4396
  %4 = load i64, ptr %arrayidx, align 8, !dbg !4396
  %5 = load i64, ptr %mask_msb, align 8, !dbg !4398
  %and = and i64 %4, %5, !dbg !4399
  store i64 %and, ptr %t, align 8, !dbg !4395
  %6 = load ptr, ptr %in.addr, align 4, !dbg !4400
  %7 = load i32, ptr %i, align 4, !dbg !4401
  %arrayidx1 = getelementptr inbounds i64, ptr %6, i32 %7, !dbg !4400
  %8 = load i64, ptr %arrayidx1, align 8, !dbg !4400
  %9 = load i64, ptr %t, align 8, !dbg !4402
  %xor = xor i64 %8, %9, !dbg !4403
  %shl = shl i64 %xor, 1, !dbg !4404
  %10 = load i64, ptr %t, align 8, !dbg !4405
  %shr = lshr i64 %10, 3, !dbg !4406
  %mul = mul i64 %shr, 3, !dbg !4407
  %xor2 = xor i64 %shl, %mul, !dbg !4408
  %11 = load ptr, ptr %acc.addr, align 4, !dbg !4409
  %12 = load i32, ptr %i, align 4, !dbg !4410
  %arrayidx3 = getelementptr inbounds i64, ptr %11, i32 %12, !dbg !4409
  %13 = load i64, ptr %arrayidx3, align 8, !dbg !4411
  %xor4 = xor i64 %13, %xor2, !dbg !4411
  store i64 %xor4, ptr %arrayidx3, align 8, !dbg !4411
  br label %for.inc, !dbg !4412

for.inc:                                          ; preds = %for.body
  %14 = load i32, ptr %i, align 4, !dbg !4413
  %inc = add nsw i32 %14, 1, !dbg !4413
  store i32 %inc, ptr %i, align 4, !dbg !4413
  br label %for.cond, !dbg !4414, !llvm.loop !4415

for.end:                                          ; preds = %for.cond
  ret void, !dbg !4417
}

; Function Attrs: noinline nounwind optnone
define internal void @m_vec_copy(i32 noundef %m_vec_limbs, ptr noundef %in, ptr noundef %out) #0 !dbg !4418 {
entry:
  %m_vec_limbs.addr = alloca i32, align 4
  %in.addr = alloca ptr, align 4
  %out.addr = alloca ptr, align 4
  %i = alloca i32, align 4
  store i32 %m_vec_limbs, ptr %m_vec_limbs.addr, align 4
    #dbg_declare(ptr %m_vec_limbs.addr, !4419, !DIExpression(), !4420)
  store ptr %in, ptr %in.addr, align 4
    #dbg_declare(ptr %in.addr, !4421, !DIExpression(), !4422)
  store ptr %out, ptr %out.addr, align 4
    #dbg_declare(ptr %out.addr, !4423, !DIExpression(), !4424)
    #dbg_declare(ptr %i, !4425, !DIExpression(), !4427)
  store i32 0, ptr %i, align 4, !dbg !4427
  br label %for.cond, !dbg !4428

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4, !dbg !4429
  %1 = load i32, ptr %m_vec_limbs.addr, align 4, !dbg !4431
  %cmp = icmp slt i32 %0, %1, !dbg !4432
  br i1 %cmp, label %for.body, label %for.end, !dbg !4433

for.body:                                         ; preds = %for.cond
  %2 = load ptr, ptr %in.addr, align 4, !dbg !4434
  %3 = load i32, ptr %i, align 4, !dbg !4436
  %arrayidx = getelementptr inbounds i64, ptr %2, i32 %3, !dbg !4434
  %4 = load i64, ptr %arrayidx, align 8, !dbg !4434
  %5 = load ptr, ptr %out.addr, align 4, !dbg !4437
  %6 = load i32, ptr %i, align 4, !dbg !4438
  %arrayidx1 = getelementptr inbounds i64, ptr %5, i32 %6, !dbg !4437
  store i64 %4, ptr %arrayidx1, align 8, !dbg !4439
  br label %for.inc, !dbg !4440

for.inc:                                          ; preds = %for.body
  %7 = load i32, ptr %i, align 4, !dbg !4441
  %inc = add nsw i32 %7, 1, !dbg !4441
  store i32 %inc, ptr %i, align 4, !dbg !4441
  br label %for.cond, !dbg !4442, !llvm.loop !4443

for.end:                                          ; preds = %for.cond
  ret void, !dbg !4445
}

attributes #0 = { noinline nounwind optnone "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+vfp2sp,+vfp3d16sp,+vfp4d16sp,-thumb-mode" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { allocsize(0,1) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+vfp2sp,+vfp3d16sp,+vfp4d16sp,-thumb-mode" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #4 = { "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+vfp2sp,+vfp3d16sp,+vfp4d16sp,-thumb-mode" }
attributes #5 = { nobuiltin "no-builtins" }
attributes #6 = { nobuiltin allocsize(0,1) "no-builtins" }

!llvm.dbg.cu = !{!45, !48}
!llvm.ident = !{!77}
!llvm.module.flags = !{!78, !79, !80, !81, !82, !83}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 41, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "../example.c", directory: "")
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
!42 = distinct !DIGlobalVariable(scope: null, file: !2, line: 105, type: !33, isLocal: true, isDefinition: true)
!43 = !DIGlobalVariableExpression(var: !44, expr: !DIExpression())
!44 = distinct !DIGlobalVariable(scope: null, file: !2, line: 118, type: !38, isLocal: true, isDefinition: true)
!45 = distinct !DICompileUnit(language: DW_LANG_C11, file: !46, producer: "clang version 23.0.0git (https://github.com/llvm/llvm-project.git 3482a9c6cba57b4e605c2b99fb6d90a023439f9b)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !47, splitDebugInlining: false, nameTableKind: None)
!46 = !DIFile(filename: "../<stdin>", directory: "")
!47 = !{!0, !7, !9, !14, !19, !24, !26, !31, !36, !41, !43}
!48 = distinct !DICompileUnit(language: DW_LANG_C11, file: !49, producer: "clang version 23.0.0git (https://github.com/llvm/llvm-project.git 3482a9c6cba57b4e605c2b99fb6d90a023439f9b)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !50, globals: !62, splitDebugInlining: false, nameTableKind: None)
!49 = !DIFile(filename: "../../../src/<stdin>", directory: "")
!50 = !{!51, !52, !58, !61}
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
!62 = !{!63, !71, !73, !75}
!63 = !DIGlobalVariableExpression(var: !64, expr: !DIExpression())
!64 = distinct !DIGlobalVariable(name: "even_nibbles", scope: !65, file: !66, line: 112, type: !70, isLocal: true, isDefinition: true)
!65 = distinct !DISubprogram(name: "transpose_16x16_nibbles", scope: !66, file: !66, line: 111, type: !67, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !69)
!66 = !DIFile(filename: "../../../src/mayo.c", directory: "")
!67 = !DISubroutineType(types: !68)
!68 = !{null, !52}
!69 = !{}
!70 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !53)
!71 = !DIGlobalVariableExpression(var: !72, expr: !DIExpression())
!72 = distinct !DIGlobalVariable(name: "even_bytes", scope: !65, file: !66, line: 113, type: !70, isLocal: true, isDefinition: true)
!73 = !DIGlobalVariableExpression(var: !74, expr: !DIExpression())
!74 = distinct !DIGlobalVariable(name: "even_2bytes", scope: !65, file: !66, line: 114, type: !70, isLocal: true, isDefinition: true)
!75 = !DIGlobalVariableExpression(var: !76, expr: !DIExpression())
!76 = distinct !DIGlobalVariable(name: "even_half", scope: !65, file: !66, line: 115, type: !70, isLocal: true, isDefinition: true)
!77 = !{!"clang version 23.0.0git (https://github.com/llvm/llvm-project.git 3482a9c6cba57b4e605c2b99fb6d90a023439f9b)"}
!78 = !{i32 2, !"Debug Info Version", i32 3}
!79 = !{i32 1, !"wchar_size", i32 4}
!80 = !{i32 1, !"min_enum_size", i32 4}
!81 = !{i32 4, !"arm-eabi-fp-denormal", i32 1}
!82 = !{i32 8, !"arm-eabi-fp-number-model", i32 3}
!83 = !{i32 1, !"Code Model", i32 1}
!84 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 138, type: !85, scopeLine: 138, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !45, retainedNodes: !69)
!85 = !DISubroutineType(types: !86)
!86 = !{!87}
!87 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!88 = !DILocalVariable(name: "params", scope: !84, file: !2, line: 140, type: !89)
!89 = !DICompositeType(tag: DW_TAG_array_type, baseType: !90, size: 128, elements: !17)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 32)
!91 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !92)
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "mayo_params_t", file: !93, line: 289, baseType: !94)
!93 = !DIFile(filename: "../../../include/mayo.h", directory: "")
!94 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !93, line: 265, size: 736, elements: !95)
!95 = !{!96, !97, !98, !99, !100, !101, !104, !105, !106, !107, !108, !109, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120}
!96 = !DIDerivedType(tag: DW_TAG_member, name: "m", scope: !94, file: !93, line: 266, baseType: !87, size: 32)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "n", scope: !94, file: !93, line: 267, baseType: !87, size: 32, offset: 32)
!98 = !DIDerivedType(tag: DW_TAG_member, name: "o", scope: !94, file: !93, line: 268, baseType: !87, size: 32, offset: 64)
!99 = !DIDerivedType(tag: DW_TAG_member, name: "k", scope: !94, file: !93, line: 269, baseType: !87, size: 32, offset: 96)
!100 = !DIDerivedType(tag: DW_TAG_member, name: "q", scope: !94, file: !93, line: 270, baseType: !87, size: 32, offset: 128)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "f_tail", scope: !94, file: !93, line: 271, baseType: !102, size: 32, offset: 160)
!102 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !103, size: 32)
!103 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !51)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "m_bytes", scope: !94, file: !93, line: 272, baseType: !87, size: 32, offset: 192)
!105 = !DIDerivedType(tag: DW_TAG_member, name: "O_bytes", scope: !94, file: !93, line: 273, baseType: !87, size: 32, offset: 224)
!106 = !DIDerivedType(tag: DW_TAG_member, name: "v_bytes", scope: !94, file: !93, line: 274, baseType: !87, size: 32, offset: 256)
!107 = !DIDerivedType(tag: DW_TAG_member, name: "r_bytes", scope: !94, file: !93, line: 275, baseType: !87, size: 32, offset: 288)
!108 = !DIDerivedType(tag: DW_TAG_member, name: "R_bytes", scope: !94, file: !93, line: 276, baseType: !87, size: 32, offset: 320)
!109 = !DIDerivedType(tag: DW_TAG_member, name: "P1_bytes", scope: !94, file: !93, line: 277, baseType: !87, size: 32, offset: 352)
!110 = !DIDerivedType(tag: DW_TAG_member, name: "P2_bytes", scope: !94, file: !93, line: 278, baseType: !87, size: 32, offset: 384)
!111 = !DIDerivedType(tag: DW_TAG_member, name: "P3_bytes", scope: !94, file: !93, line: 279, baseType: !87, size: 32, offset: 416)
!112 = !DIDerivedType(tag: DW_TAG_member, name: "csk_bytes", scope: !94, file: !93, line: 280, baseType: !87, size: 32, offset: 448)
!113 = !DIDerivedType(tag: DW_TAG_member, name: "cpk_bytes", scope: !94, file: !93, line: 281, baseType: !87, size: 32, offset: 480)
!114 = !DIDerivedType(tag: DW_TAG_member, name: "sig_bytes", scope: !94, file: !93, line: 282, baseType: !87, size: 32, offset: 512)
!115 = !DIDerivedType(tag: DW_TAG_member, name: "salt_bytes", scope: !94, file: !93, line: 283, baseType: !87, size: 32, offset: 544)
!116 = !DIDerivedType(tag: DW_TAG_member, name: "sk_seed_bytes", scope: !94, file: !93, line: 284, baseType: !87, size: 32, offset: 576)
!117 = !DIDerivedType(tag: DW_TAG_member, name: "digest_bytes", scope: !94, file: !93, line: 285, baseType: !87, size: 32, offset: 608)
!118 = !DIDerivedType(tag: DW_TAG_member, name: "pk_seed_bytes", scope: !94, file: !93, line: 286, baseType: !87, size: 32, offset: 640)
!119 = !DIDerivedType(tag: DW_TAG_member, name: "m_vec_limbs", scope: !94, file: !93, line: 287, baseType: !87, size: 32, offset: 672)
!120 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !94, file: !93, line: 288, baseType: !121, size: 32, offset: 704)
!121 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !122, size: 32)
!122 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!123 = !DILocation(line: 140, column: 26, scope: !84)
!124 = !DILocalVariable(name: "paramslen", scope: !84, file: !2, line: 141, type: !87)
!125 = !DILocation(line: 141, column: 9, scope: !84)
!126 = !DILocalVariable(name: "i", scope: !127, file: !2, line: 142, type: !87)
!127 = distinct !DILexicalBlock(scope: !84, file: !2, line: 142, column: 5)
!128 = !DILocation(line: 142, column: 14, scope: !127)
!129 = !DILocation(line: 142, column: 10, scope: !127)
!130 = !DILocation(line: 142, column: 21, scope: !131)
!131 = distinct !DILexicalBlock(scope: !127, file: !2, line: 142, column: 5)
!132 = !DILocation(line: 142, column: 25, scope: !131)
!133 = !DILocation(line: 142, column: 23, scope: !131)
!134 = !DILocation(line: 142, column: 5, scope: !127)
!135 = !DILocation(line: 143, column: 33, scope: !136)
!136 = distinct !DILexicalBlock(scope: !137, file: !2, line: 143, column: 13)
!137 = distinct !DILexicalBlock(scope: !131, file: !2, line: 142, column: 41)
!138 = !DILocation(line: 143, column: 26, scope: !136)
!139 = !DILocation(line: 143, column: 13, scope: !136)
!140 = !DILocation(line: 143, column: 37, scope: !136)
!141 = !DILocation(line: 144, column: 13, scope: !142)
!142 = distinct !DILexicalBlock(scope: !136, file: !2, line: 143, column: 49)
!143 = !DILocation(line: 146, column: 5, scope: !137)
!144 = !DILocation(line: 142, column: 36, scope: !131)
!145 = !DILocation(line: 142, column: 5, scope: !131)
!146 = distinct !{!146, !134, !147, !148}
!147 = !DILocation(line: 146, column: 5, scope: !127)
!148 = !{!"llvm.loop.mustprogress"}
!149 = !DILocation(line: 150, column: 1, scope: !84)
!150 = distinct !DISubprogram(name: "example_mayo", scope: !2, file: !2, line: 25, type: !151, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !45, retainedNodes: !69)
!151 = !DISubroutineType(types: !152)
!152 = !{!87, !90}
!153 = !DILocalVariable(name: "p", arg: 1, scope: !150, file: !2, line: 25, type: !90)
!154 = !DILocation(line: 25, column: 46, scope: !150)
!155 = !DILocalVariable(name: "msglen", scope: !150, file: !2, line: 27, type: !58)
!156 = !DILocation(line: 27, column: 12, scope: !150)
!157 = !DILocalVariable(name: "smlen", scope: !150, file: !2, line: 28, type: !58)
!158 = !DILocation(line: 28, column: 12, scope: !150)
!159 = !DILocation(line: 28, column: 36, scope: !150)
!160 = !DILocation(line: 28, column: 20, scope: !150)
!161 = !DILocation(line: 28, column: 41, scope: !150)
!162 = !DILocation(line: 28, column: 39, scope: !150)
!163 = !DILocalVariable(name: "pk", scope: !150, file: !2, line: 30, type: !61)
!164 = !DILocation(line: 30, column: 20, scope: !150)
!165 = !DILocation(line: 30, column: 49, scope: !150)
!166 = !DILocation(line: 30, column: 33, scope: !150)
!167 = !DILocation(line: 30, column: 26, scope: !150)
!168 = !DILocalVariable(name: "sk", scope: !150, file: !2, line: 31, type: !61)
!169 = !DILocation(line: 31, column: 20, scope: !150)
!170 = !DILocation(line: 31, column: 49, scope: !150)
!171 = !DILocation(line: 31, column: 33, scope: !150)
!172 = !DILocation(line: 31, column: 26, scope: !150)
!173 = !DILocalVariable(name: "epk", scope: !150, file: !2, line: 33, type: !52)
!174 = !DILocation(line: 33, column: 15, scope: !150)
!175 = !DILocation(line: 33, column: 21, scope: !150)
!176 = !DILocalVariable(name: "esk", scope: !150, file: !2, line: 34, type: !177)
!177 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !178, size: 32)
!178 = !DIDerivedType(tag: DW_TAG_typedef, name: "sk_t", file: !93, line: 294, baseType: !179)
!179 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sk_t", file: !93, line: 291, size: 7257920, elements: !180)
!180 = !{!181, !185}
!181 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !179, file: !93, line: 292, baseType: !182, size: 7238592)
!182 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 7238592, elements: !183)
!183 = !{!184}
!184 = !DISubrange(count: 113103)
!185 = !DIDerivedType(tag: DW_TAG_member, name: "O", scope: !179, file: !93, line: 293, baseType: !186, size: 19312, offset: 7238592)
!186 = !DICompositeType(tag: DW_TAG_array_type, baseType: !187, size: 19312, elements: !189)
!187 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !54, line: 24, baseType: !188)
!188 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !56, line: 43, baseType: !51)
!189 = !{!190}
!190 = !DISubrange(count: 2414)
!191 = !DILocation(line: 34, column: 11, scope: !150)
!192 = !DILocation(line: 34, column: 17, scope: !150)
!193 = !DILocalVariable(name: "sig", scope: !150, file: !2, line: 36, type: !61)
!194 = !DILocation(line: 36, column: 20, scope: !150)
!195 = !DILocation(line: 36, column: 49, scope: !150)
!196 = !DILocation(line: 36, column: 33, scope: !150)
!197 = !DILocation(line: 36, column: 54, scope: !150)
!198 = !DILocation(line: 36, column: 52, scope: !150)
!199 = !DILocation(line: 36, column: 26, scope: !150)
!200 = !DILocalVariable(name: "msg", scope: !150, file: !2, line: 38, type: !201)
!201 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 256, elements: !202)
!202 = !{!203}
!203 = !DISubrange(count: 32)
!204 = !DILocation(line: 38, column: 19, scope: !150)
!205 = !DILocalVariable(name: "msg2", scope: !150, file: !2, line: 39, type: !201)
!206 = !DILocation(line: 39, column: 19, scope: !150)
!207 = !DILocation(line: 41, column: 44, scope: !150)
!208 = !DILocation(line: 41, column: 33, scope: !150)
!209 = !DILocation(line: 41, column: 5, scope: !150)
!210 = !DILocation(line: 43, column: 5, scope: !150)
!211 = !DILocalVariable(name: "res", scope: !150, file: !2, line: 44, type: !87)
!212 = !DILocation(line: 44, column: 9, scope: !150)
!213 = !DILocation(line: 44, column: 28, scope: !150)
!214 = !DILocation(line: 44, column: 31, scope: !150)
!215 = !DILocation(line: 44, column: 35, scope: !150)
!216 = !DILocation(line: 44, column: 15, scope: !150)
!217 = !DILocation(line: 45, column: 9, scope: !218)
!218 = distinct !DILexicalBlock(scope: !150, file: !2, line: 45, column: 9)
!219 = !DILocation(line: 45, column: 13, scope: !218)
!220 = !DILocation(line: 46, column: 9, scope: !221)
!221 = distinct !DILexicalBlock(scope: !218, file: !2, line: 45, column: 25)
!222 = !DILocation(line: 47, column: 13, scope: !221)
!223 = !DILocation(line: 48, column: 9, scope: !221)
!224 = !DILocation(line: 50, column: 9, scope: !225)
!225 = distinct !DILexicalBlock(scope: !218, file: !2, line: 49, column: 12)
!226 = !DILocation(line: 53, column: 5, scope: !150)
!227 = !DILocation(line: 54, column: 26, scope: !150)
!228 = !DILocation(line: 54, column: 29, scope: !150)
!229 = !DILocation(line: 54, column: 33, scope: !150)
!230 = !DILocation(line: 54, column: 11, scope: !150)
!231 = !DILocation(line: 54, column: 9, scope: !150)
!232 = !DILocation(line: 55, column: 9, scope: !233)
!233 = distinct !DILexicalBlock(scope: !150, file: !2, line: 55, column: 9)
!234 = !DILocation(line: 55, column: 13, scope: !233)
!235 = !DILocation(line: 56, column: 9, scope: !236)
!236 = distinct !DILexicalBlock(scope: !233, file: !2, line: 55, column: 25)
!237 = !DILocation(line: 57, column: 13, scope: !236)
!238 = !DILocation(line: 58, column: 9, scope: !236)
!239 = !DILocation(line: 60, column: 9, scope: !240)
!240 = distinct !DILexicalBlock(scope: !233, file: !2, line: 59, column: 12)
!241 = !DILocation(line: 63, column: 5, scope: !150)
!242 = !DILocation(line: 64, column: 26, scope: !150)
!243 = !DILocation(line: 64, column: 29, scope: !150)
!244 = !DILocation(line: 64, column: 33, scope: !150)
!245 = !DILocation(line: 64, column: 11, scope: !150)
!246 = !DILocation(line: 64, column: 9, scope: !150)
!247 = !DILocation(line: 65, column: 9, scope: !248)
!248 = distinct !DILexicalBlock(scope: !150, file: !2, line: 65, column: 9)
!249 = !DILocation(line: 65, column: 13, scope: !248)
!250 = !DILocation(line: 66, column: 9, scope: !251)
!251 = distinct !DILexicalBlock(scope: !248, file: !2, line: 65, column: 25)
!252 = !DILocation(line: 67, column: 13, scope: !251)
!253 = !DILocation(line: 68, column: 9, scope: !251)
!254 = !DILocation(line: 70, column: 9, scope: !255)
!255 = distinct !DILexicalBlock(scope: !248, file: !2, line: 69, column: 12)
!256 = !DILocation(line: 73, column: 5, scope: !150)
!257 = !DILocation(line: 74, column: 21, scope: !150)
!258 = !DILocation(line: 74, column: 24, scope: !150)
!259 = !DILocation(line: 74, column: 37, scope: !150)
!260 = !DILocation(line: 74, column: 42, scope: !150)
!261 = !DILocation(line: 74, column: 50, scope: !150)
!262 = !DILocation(line: 74, column: 11, scope: !150)
!263 = !DILocation(line: 74, column: 9, scope: !150)
!264 = !DILocation(line: 75, column: 9, scope: !265)
!265 = distinct !DILexicalBlock(scope: !150, file: !2, line: 75, column: 9)
!266 = !DILocation(line: 75, column: 13, scope: !265)
!267 = !DILocation(line: 76, column: 9, scope: !268)
!268 = distinct !DILexicalBlock(scope: !265, file: !2, line: 75, column: 25)
!269 = !DILocation(line: 77, column: 13, scope: !268)
!270 = !DILocation(line: 78, column: 9, scope: !268)
!271 = !DILocation(line: 80, column: 9, scope: !272)
!272 = distinct !DILexicalBlock(scope: !265, file: !2, line: 79, column: 12)
!273 = !DILocation(line: 83, column: 5, scope: !150)
!274 = !DILocation(line: 84, column: 21, scope: !150)
!275 = !DILocation(line: 84, column: 24, scope: !150)
!276 = !DILocation(line: 84, column: 39, scope: !150)
!277 = !DILocation(line: 84, column: 44, scope: !150)
!278 = !DILocation(line: 84, column: 51, scope: !150)
!279 = !DILocation(line: 84, column: 11, scope: !150)
!280 = !DILocation(line: 84, column: 9, scope: !150)
!281 = !DILocation(line: 85, column: 9, scope: !282)
!282 = distinct !DILexicalBlock(scope: !150, file: !2, line: 85, column: 9)
!283 = !DILocation(line: 85, column: 13, scope: !282)
!284 = !DILocation(line: 85, column: 24, scope: !282)
!285 = !DILocation(line: 85, column: 34, scope: !282)
!286 = !DILocation(line: 85, column: 39, scope: !282)
!287 = !DILocation(line: 85, column: 45, scope: !282)
!288 = !DILocation(line: 85, column: 27, scope: !282)
!289 = !DILocation(line: 86, column: 9, scope: !290)
!290 = distinct !DILexicalBlock(scope: !282, file: !2, line: 85, column: 54)
!291 = !DILocation(line: 87, column: 13, scope: !290)
!292 = !DILocation(line: 88, column: 9, scope: !290)
!293 = !DILocation(line: 90, column: 13, scope: !294)
!294 = distinct !DILexicalBlock(scope: !282, file: !2, line: 89, column: 12)
!295 = !DILocation(line: 91, column: 9, scope: !294)
!296 = !DILocation(line: 94, column: 5, scope: !150)
!297 = !DILocation(line: 95, column: 23, scope: !150)
!298 = !DILocation(line: 95, column: 26, scope: !150)
!299 = !DILocation(line: 95, column: 31, scope: !150)
!300 = !DILocation(line: 95, column: 39, scope: !150)
!301 = !DILocation(line: 95, column: 44, scope: !150)
!302 = !DILocation(line: 95, column: 11, scope: !150)
!303 = !DILocation(line: 95, column: 9, scope: !150)
!304 = !DILocation(line: 96, column: 9, scope: !305)
!305 = distinct !DILexicalBlock(scope: !150, file: !2, line: 96, column: 9)
!306 = !DILocation(line: 96, column: 13, scope: !305)
!307 = !DILocation(line: 97, column: 9, scope: !308)
!308 = distinct !DILexicalBlock(scope: !305, file: !2, line: 96, column: 25)
!309 = !DILocation(line: 98, column: 13, scope: !308)
!310 = !DILocation(line: 99, column: 9, scope: !308)
!311 = !DILocation(line: 101, column: 13, scope: !312)
!312 = distinct !DILexicalBlock(scope: !305, file: !2, line: 100, column: 12)
!313 = !DILocation(line: 102, column: 9, scope: !312)
!314 = !DILocation(line: 105, column: 5, scope: !150)
!315 = !DILocation(line: 106, column: 15, scope: !150)
!316 = !DILocation(line: 106, column: 14, scope: !150)
!317 = !DILocation(line: 106, column: 5, scope: !150)
!318 = !DILocation(line: 106, column: 12, scope: !150)
!319 = !DILocation(line: 107, column: 12, scope: !150)
!320 = !DILocation(line: 107, column: 21, scope: !150)
!321 = !DILocation(line: 107, column: 5, scope: !150)
!322 = !DILocation(line: 108, column: 21, scope: !150)
!323 = !DILocation(line: 108, column: 24, scope: !150)
!324 = !DILocation(line: 108, column: 39, scope: !150)
!325 = !DILocation(line: 108, column: 44, scope: !150)
!326 = !DILocation(line: 108, column: 51, scope: !150)
!327 = !DILocation(line: 108, column: 11, scope: !150)
!328 = !DILocation(line: 108, column: 9, scope: !150)
!329 = !DILocation(line: 109, column: 9, scope: !330)
!330 = distinct !DILexicalBlock(scope: !150, file: !2, line: 109, column: 9)
!331 = !DILocation(line: 109, column: 13, scope: !330)
!332 = !DILocation(line: 109, column: 25, scope: !330)
!333 = !DILocation(line: 109, column: 36, scope: !330)
!334 = !DILocation(line: 109, column: 41, scope: !330)
!335 = !DILocation(line: 109, column: 47, scope: !330)
!336 = !DILocation(line: 109, column: 29, scope: !330)
!337 = !DILocation(line: 110, column: 9, scope: !338)
!338 = distinct !DILexicalBlock(scope: !330, file: !2, line: 109, column: 56)
!339 = !DILocation(line: 111, column: 13, scope: !338)
!340 = !DILocation(line: 112, column: 9, scope: !338)
!341 = !DILocation(line: 114, column: 13, scope: !342)
!342 = distinct !DILexicalBlock(scope: !330, file: !2, line: 113, column: 12)
!343 = !DILocation(line: 115, column: 9, scope: !342)
!344 = !DILocation(line: 118, column: 5, scope: !150)
!345 = !DILocation(line: 119, column: 23, scope: !150)
!346 = !DILocation(line: 119, column: 26, scope: !150)
!347 = !DILocation(line: 119, column: 31, scope: !150)
!348 = !DILocation(line: 119, column: 39, scope: !150)
!349 = !DILocation(line: 119, column: 44, scope: !150)
!350 = !DILocation(line: 119, column: 11, scope: !150)
!351 = !DILocation(line: 119, column: 9, scope: !150)
!352 = !DILocation(line: 120, column: 9, scope: !353)
!353 = distinct !DILexicalBlock(scope: !150, file: !2, line: 120, column: 9)
!354 = !DILocation(line: 120, column: 13, scope: !353)
!355 = !DILocation(line: 121, column: 9, scope: !356)
!356 = distinct !DILexicalBlock(scope: !353, file: !2, line: 120, column: 25)
!357 = !DILocation(line: 122, column: 13, scope: !356)
!358 = !DILocation(line: 123, column: 9, scope: !356)
!359 = !DILocation(line: 125, column: 13, scope: !360)
!360 = distinct !DILexicalBlock(scope: !353, file: !2, line: 124, column: 12)
!361 = !DILocation(line: 126, column: 9, scope: !360)
!362 = !DILocation(line: 120, column: 16, scope: !353)
!363 = !DILabel(scope: !150, name: "err", file: !2, line: 129, column: 1)
!364 = !DILocation(line: 129, column: 1, scope: !150)
!365 = !DILocation(line: 130, column: 10, scope: !150)
!366 = !DILocation(line: 130, column: 5, scope: !150)
!367 = !DILocation(line: 131, column: 10, scope: !150)
!368 = !DILocation(line: 131, column: 5, scope: !150)
!369 = !DILocation(line: 132, column: 22, scope: !150)
!370 = !DILocation(line: 132, column: 42, scope: !150)
!371 = !DILocation(line: 132, column: 26, scope: !150)
!372 = !DILocation(line: 132, column: 5, scope: !150)
!373 = !DILocation(line: 133, column: 22, scope: !150)
!374 = !DILocation(line: 133, column: 5, scope: !150)
!375 = !DILocation(line: 134, column: 10, scope: !150)
!376 = !DILocation(line: 134, column: 5, scope: !150)
!377 = !DILocation(line: 135, column: 12, scope: !150)
!378 = !DILocation(line: 135, column: 5, scope: !150)
!379 = distinct !DISubprogram(name: "mayo_keypair", scope: !66, file: !66, line: 298, type: !380, scopeLine: 298, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !69)
!380 = !DISubroutineType(types: !381)
!381 = !{!87, !382, !61, !61}
!382 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !383, size: 32)
!383 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !384)
!384 = !DIDerivedType(tag: DW_TAG_typedef, name: "mayo_params_t", file: !93, line: 289, baseType: !385)
!385 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !93, line: 265, size: 736, elements: !386)
!386 = !{!387, !388, !389, !390, !391, !392, !393, !394, !395, !396, !397, !398, !399, !400, !401, !402, !403, !404, !405, !406, !407, !408, !409}
!387 = !DIDerivedType(tag: DW_TAG_member, name: "m", scope: !385, file: !93, line: 266, baseType: !87, size: 32)
!388 = !DIDerivedType(tag: DW_TAG_member, name: "n", scope: !385, file: !93, line: 267, baseType: !87, size: 32, offset: 32)
!389 = !DIDerivedType(tag: DW_TAG_member, name: "o", scope: !385, file: !93, line: 268, baseType: !87, size: 32, offset: 64)
!390 = !DIDerivedType(tag: DW_TAG_member, name: "k", scope: !385, file: !93, line: 269, baseType: !87, size: 32, offset: 96)
!391 = !DIDerivedType(tag: DW_TAG_member, name: "q", scope: !385, file: !93, line: 270, baseType: !87, size: 32, offset: 128)
!392 = !DIDerivedType(tag: DW_TAG_member, name: "f_tail", scope: !385, file: !93, line: 271, baseType: !102, size: 32, offset: 160)
!393 = !DIDerivedType(tag: DW_TAG_member, name: "m_bytes", scope: !385, file: !93, line: 272, baseType: !87, size: 32, offset: 192)
!394 = !DIDerivedType(tag: DW_TAG_member, name: "O_bytes", scope: !385, file: !93, line: 273, baseType: !87, size: 32, offset: 224)
!395 = !DIDerivedType(tag: DW_TAG_member, name: "v_bytes", scope: !385, file: !93, line: 274, baseType: !87, size: 32, offset: 256)
!396 = !DIDerivedType(tag: DW_TAG_member, name: "r_bytes", scope: !385, file: !93, line: 275, baseType: !87, size: 32, offset: 288)
!397 = !DIDerivedType(tag: DW_TAG_member, name: "R_bytes", scope: !385, file: !93, line: 276, baseType: !87, size: 32, offset: 320)
!398 = !DIDerivedType(tag: DW_TAG_member, name: "P1_bytes", scope: !385, file: !93, line: 277, baseType: !87, size: 32, offset: 352)
!399 = !DIDerivedType(tag: DW_TAG_member, name: "P2_bytes", scope: !385, file: !93, line: 278, baseType: !87, size: 32, offset: 384)
!400 = !DIDerivedType(tag: DW_TAG_member, name: "P3_bytes", scope: !385, file: !93, line: 279, baseType: !87, size: 32, offset: 416)
!401 = !DIDerivedType(tag: DW_TAG_member, name: "csk_bytes", scope: !385, file: !93, line: 280, baseType: !87, size: 32, offset: 448)
!402 = !DIDerivedType(tag: DW_TAG_member, name: "cpk_bytes", scope: !385, file: !93, line: 281, baseType: !87, size: 32, offset: 480)
!403 = !DIDerivedType(tag: DW_TAG_member, name: "sig_bytes", scope: !385, file: !93, line: 282, baseType: !87, size: 32, offset: 512)
!404 = !DIDerivedType(tag: DW_TAG_member, name: "salt_bytes", scope: !385, file: !93, line: 283, baseType: !87, size: 32, offset: 544)
!405 = !DIDerivedType(tag: DW_TAG_member, name: "sk_seed_bytes", scope: !385, file: !93, line: 284, baseType: !87, size: 32, offset: 576)
!406 = !DIDerivedType(tag: DW_TAG_member, name: "digest_bytes", scope: !385, file: !93, line: 285, baseType: !87, size: 32, offset: 608)
!407 = !DIDerivedType(tag: DW_TAG_member, name: "pk_seed_bytes", scope: !385, file: !93, line: 286, baseType: !87, size: 32, offset: 640)
!408 = !DIDerivedType(tag: DW_TAG_member, name: "m_vec_limbs", scope: !385, file: !93, line: 287, baseType: !87, size: 32, offset: 672)
!409 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !385, file: !93, line: 288, baseType: !121, size: 32, offset: 704)
!410 = !DILocalVariable(name: "p", arg: 1, scope: !379, file: !66, line: 298, type: !382)
!411 = !DILocation(line: 298, column: 39, scope: !379)
!412 = !DILocalVariable(name: "pk", arg: 2, scope: !379, file: !66, line: 298, type: !61)
!413 = !DILocation(line: 298, column: 57, scope: !379)
!414 = !DILocalVariable(name: "sk", arg: 3, scope: !379, file: !66, line: 298, type: !61)
!415 = !DILocation(line: 298, column: 76, scope: !379)
!416 = !DILocalVariable(name: "ret", scope: !379, file: !66, line: 299, type: !87)
!417 = !DILocation(line: 299, column: 9, scope: !379)
!418 = !DILocation(line: 301, column: 32, scope: !379)
!419 = !DILocation(line: 301, column: 35, scope: !379)
!420 = !DILocation(line: 301, column: 39, scope: !379)
!421 = !DILocation(line: 301, column: 11, scope: !379)
!422 = !DILocation(line: 301, column: 9, scope: !379)
!423 = !DILocation(line: 302, column: 9, scope: !424)
!424 = distinct !DILexicalBlock(scope: !379, file: !66, line: 302, column: 9)
!425 = !DILocation(line: 302, column: 13, scope: !424)
!426 = !DILocation(line: 303, column: 9, scope: !427)
!427 = distinct !DILexicalBlock(scope: !424, file: !66, line: 302, column: 25)
!428 = !DILocation(line: 302, column: 16, scope: !424)
!429 = !DILabel(scope: !379, name: "err", file: !66, line: 306, column: 1)
!430 = !DILocation(line: 306, column: 1, scope: !379)
!431 = !DILocation(line: 307, column: 12, scope: !379)
!432 = !DILocation(line: 307, column: 5, scope: !379)
!433 = distinct !DISubprogram(name: "mayo_keypair_compact", scope: !66, file: !66, line: 538, type: !380, scopeLine: 539, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !69)
!434 = !DILocalVariable(name: "p", arg: 1, scope: !433, file: !66, line: 538, type: !382)
!435 = !DILocation(line: 538, column: 47, scope: !433)
!436 = !DILocalVariable(name: "cpk", arg: 2, scope: !433, file: !66, line: 538, type: !61)
!437 = !DILocation(line: 538, column: 65, scope: !433)
!438 = !DILocalVariable(name: "csk", arg: 3, scope: !433, file: !66, line: 539, type: !61)
!439 = !DILocation(line: 539, column: 41, scope: !433)
!440 = !DILocalVariable(name: "ret", scope: !433, file: !66, line: 540, type: !87)
!441 = !DILocation(line: 540, column: 9, scope: !433)
!442 = !DILocalVariable(name: "seed_sk", scope: !433, file: !66, line: 541, type: !61)
!443 = !DILocation(line: 541, column: 20, scope: !433)
!444 = !DILocation(line: 541, column: 30, scope: !433)
!445 = !DILocalVariable(name: "S", scope: !433, file: !66, line: 542, type: !446)
!446 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 6944, elements: !447)
!447 = !{!448}
!448 = !DISubrange(count: 868)
!449 = !DILocation(line: 542, column: 19, scope: !433)
!450 = !DILocalVariable(name: "P", scope: !433, file: !66, line: 543, type: !182)
!451 = !DILocation(line: 543, column: 14, scope: !433)
!452 = !DILocalVariable(name: "P3", scope: !433, file: !66, line: 544, type: !453)
!453 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 166464, elements: !454)
!454 = !{!455}
!455 = !DISubrange(count: 2601)
!456 = !DILocation(line: 544, column: 14, scope: !433)
!457 = !DILocalVariable(name: "seed_pk", scope: !433, file: !66, line: 546, type: !61)
!458 = !DILocation(line: 546, column: 20, scope: !433)
!459 = !DILocalVariable(name: "O", scope: !433, file: !66, line: 547, type: !460)
!460 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 19312, elements: !189)
!461 = !DILocation(line: 547, column: 19, scope: !433)
!462 = !DILocalVariable(name: "m_vec_limbs", scope: !433, file: !66, line: 549, type: !463)
!463 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !87)
!464 = !DILocation(line: 549, column: 15, scope: !433)
!465 = !DILocation(line: 549, column: 47, scope: !433)
!466 = !DILocation(line: 549, column: 29, scope: !433)
!467 = !DILocalVariable(name: "param_m", scope: !433, file: !66, line: 550, type: !463)
!468 = !DILocation(line: 550, column: 15, scope: !433)
!469 = !DILocation(line: 550, column: 33, scope: !433)
!470 = !DILocation(line: 550, column: 25, scope: !433)
!471 = !DILocalVariable(name: "param_v", scope: !433, file: !66, line: 551, type: !463)
!472 = !DILocation(line: 551, column: 15, scope: !433)
!473 = !DILocation(line: 551, column: 33, scope: !433)
!474 = !DILocation(line: 551, column: 25, scope: !433)
!475 = !DILocalVariable(name: "param_o", scope: !433, file: !66, line: 552, type: !463)
!476 = !DILocation(line: 552, column: 15, scope: !433)
!477 = !DILocation(line: 552, column: 33, scope: !433)
!478 = !DILocation(line: 552, column: 25, scope: !433)
!479 = !DILocalVariable(name: "param_O_bytes", scope: !433, file: !66, line: 553, type: !463)
!480 = !DILocation(line: 553, column: 15, scope: !433)
!481 = !DILocation(line: 553, column: 45, scope: !433)
!482 = !DILocation(line: 553, column: 31, scope: !433)
!483 = !DILocalVariable(name: "param_P1_limbs", scope: !433, file: !66, line: 554, type: !463)
!484 = !DILocation(line: 554, column: 15, scope: !433)
!485 = !DILocation(line: 554, column: 47, scope: !433)
!486 = !DILocation(line: 554, column: 32, scope: !433)
!487 = !DILocalVariable(name: "param_P3_limbs", scope: !433, file: !66, line: 555, type: !463)
!488 = !DILocation(line: 555, column: 15, scope: !433)
!489 = !DILocation(line: 555, column: 47, scope: !433)
!490 = !DILocation(line: 555, column: 32, scope: !433)
!491 = !DILocalVariable(name: "param_pk_seed_bytes", scope: !433, file: !66, line: 556, type: !463)
!492 = !DILocation(line: 556, column: 15, scope: !433)
!493 = !DILocation(line: 556, column: 57, scope: !433)
!494 = !DILocation(line: 556, column: 37, scope: !433)
!495 = !DILocalVariable(name: "param_sk_seed_bytes", scope: !433, file: !66, line: 557, type: !463)
!496 = !DILocation(line: 557, column: 15, scope: !433)
!497 = !DILocation(line: 557, column: 57, scope: !433)
!498 = !DILocation(line: 557, column: 37, scope: !433)
!499 = !DILocalVariable(name: "P1", scope: !433, file: !66, line: 559, type: !52)
!500 = !DILocation(line: 559, column: 15, scope: !433)
!501 = !DILocation(line: 559, column: 20, scope: !433)
!502 = !DILocalVariable(name: "P2", scope: !433, file: !66, line: 560, type: !52)
!503 = !DILocation(line: 560, column: 15, scope: !433)
!504 = !DILocation(line: 560, column: 20, scope: !433)
!505 = !DILocation(line: 560, column: 24, scope: !433)
!506 = !DILocation(line: 560, column: 22, scope: !433)
!507 = !DILocation(line: 566, column: 21, scope: !508)
!508 = distinct !DILexicalBlock(scope: !433, file: !66, line: 566, column: 9)
!509 = !DILocation(line: 566, column: 30, scope: !508)
!510 = !DILocation(line: 566, column: 9, scope: !508)
!511 = !DILocation(line: 566, column: 51, scope: !508)
!512 = !DILocation(line: 567, column: 13, scope: !513)
!513 = distinct !DILexicalBlock(scope: !508, file: !66, line: 566, column: 63)
!514 = !DILocation(line: 568, column: 9, scope: !513)
!515 = !DILocation(line: 573, column: 14, scope: !433)
!516 = !DILocation(line: 573, column: 17, scope: !433)
!517 = !DILocation(line: 573, column: 39, scope: !433)
!518 = !DILocation(line: 573, column: 37, scope: !433)
!519 = !DILocation(line: 573, column: 54, scope: !433)
!520 = !DILocation(line: 574, column: 14, scope: !433)
!521 = !DILocation(line: 573, column: 5, scope: !433)
!522 = !DILocation(line: 576, column: 15, scope: !433)
!523 = !DILocation(line: 576, column: 13, scope: !433)
!524 = !DILocation(line: 579, column: 12, scope: !433)
!525 = !DILocation(line: 579, column: 16, scope: !433)
!526 = !DILocation(line: 579, column: 14, scope: !433)
!527 = !DILocation(line: 579, column: 37, scope: !433)
!528 = !DILocation(line: 579, column: 40, scope: !433)
!529 = !DILocation(line: 579, column: 50, scope: !433)
!530 = !DILocation(line: 579, column: 48, scope: !433)
!531 = !DILocation(line: 579, column: 5, scope: !433)
!532 = !DILocation(line: 585, column: 18, scope: !433)
!533 = !DILocation(line: 585, column: 21, scope: !433)
!534 = !DILocation(line: 585, column: 24, scope: !433)
!535 = !DILocation(line: 585, column: 5, scope: !433)
!536 = !DILocation(line: 588, column: 16, scope: !433)
!537 = !DILocation(line: 588, column: 19, scope: !433)
!538 = !DILocation(line: 588, column: 23, scope: !433)
!539 = !DILocation(line: 588, column: 27, scope: !433)
!540 = !DILocation(line: 588, column: 30, scope: !433)
!541 = !DILocation(line: 588, column: 5, scope: !433)
!542 = !DILocation(line: 591, column: 12, scope: !433)
!543 = !DILocation(line: 591, column: 17, scope: !433)
!544 = !DILocation(line: 591, column: 26, scope: !433)
!545 = !DILocation(line: 591, column: 5, scope: !433)
!546 = !DILocalVariable(name: "P3_upper", scope: !433, file: !66, line: 593, type: !547)
!547 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 88128, elements: !548)
!548 = !{!549}
!549 = !DISubrange(count: 1377)
!550 = !DILocation(line: 593, column: 14, scope: !433)
!551 = !DILocation(line: 596, column: 13, scope: !433)
!552 = !DILocation(line: 596, column: 16, scope: !433)
!553 = !DILocation(line: 596, column: 20, scope: !433)
!554 = !DILocation(line: 596, column: 30, scope: !433)
!555 = !DILocation(line: 596, column: 5, scope: !433)
!556 = !DILocation(line: 597, column: 17, scope: !433)
!557 = !DILocation(line: 597, column: 27, scope: !433)
!558 = !DILocation(line: 597, column: 33, scope: !433)
!559 = !DILocation(line: 597, column: 31, scope: !433)
!560 = !DILocation(line: 597, column: 54, scope: !433)
!561 = !DILocation(line: 597, column: 69, scope: !433)
!562 = !DILocation(line: 597, column: 68, scope: !433)
!563 = !DILocation(line: 597, column: 82, scope: !433)
!564 = !DILocation(line: 597, column: 5, scope: !433)
!565 = !DILabel(scope: !433, name: "err", file: !66, line: 600, column: 5)
!566 = !DILocation(line: 600, column: 5, scope: !433)
!567 = !DILocation(line: 602, column: 23, scope: !433)
!568 = !DILocation(line: 602, column: 5, scope: !433)
!569 = !DILocation(line: 603, column: 23, scope: !433)
!570 = !DILocation(line: 603, column: 42, scope: !433)
!571 = !DILocation(line: 603, column: 27, scope: !433)
!572 = !DILocation(line: 603, column: 44, scope: !433)
!573 = !DILocation(line: 603, column: 5, scope: !433)
!574 = !DILocation(line: 604, column: 23, scope: !433)
!575 = !DILocation(line: 604, column: 5, scope: !433)
!576 = !DILocation(line: 605, column: 12, scope: !433)
!577 = !DILocation(line: 605, column: 5, scope: !433)
!578 = distinct !DISubprogram(name: "decode", scope: !66, file: !66, line: 20, type: !579, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !69)
!579 = !DISubroutineType(types: !580)
!580 = !{null, !102, !61, !87}
!581 = !DILocalVariable(name: "m", arg: 1, scope: !578, file: !66, line: 20, type: !102)
!582 = !DILocation(line: 20, column: 41, scope: !578)
!583 = !DILocalVariable(name: "mdec", arg: 2, scope: !578, file: !66, line: 20, type: !61)
!584 = !DILocation(line: 20, column: 59, scope: !578)
!585 = !DILocalVariable(name: "mdeclen", arg: 3, scope: !578, file: !66, line: 20, type: !87)
!586 = !DILocation(line: 20, column: 69, scope: !578)
!587 = !DILocalVariable(name: "i", scope: !578, file: !66, line: 21, type: !87)
!588 = !DILocation(line: 21, column: 9, scope: !578)
!589 = !DILocation(line: 22, column: 12, scope: !590)
!590 = distinct !DILexicalBlock(scope: !578, file: !66, line: 22, column: 5)
!591 = !DILocation(line: 22, column: 10, scope: !590)
!592 = !DILocation(line: 22, column: 17, scope: !593)
!593 = distinct !DILexicalBlock(scope: !590, file: !66, line: 22, column: 5)
!594 = !DILocation(line: 22, column: 21, scope: !593)
!595 = !DILocation(line: 22, column: 29, scope: !593)
!596 = !DILocation(line: 22, column: 19, scope: !593)
!597 = !DILocation(line: 22, column: 5, scope: !590)
!598 = !DILocation(line: 23, column: 19, scope: !599)
!599 = distinct !DILexicalBlock(scope: !593, file: !66, line: 22, column: 39)
!600 = !DILocation(line: 23, column: 21, scope: !599)
!601 = !DILocation(line: 23, column: 24, scope: !599)
!602 = !DILocation(line: 23, column: 14, scope: !599)
!603 = !DILocation(line: 23, column: 17, scope: !599)
!604 = !DILocation(line: 24, column: 19, scope: !599)
!605 = !DILocation(line: 24, column: 21, scope: !599)
!606 = !DILocation(line: 24, column: 24, scope: !599)
!607 = !DILocation(line: 24, column: 14, scope: !599)
!608 = !DILocation(line: 24, column: 17, scope: !599)
!609 = !DILocation(line: 25, column: 5, scope: !599)
!610 = !DILocation(line: 22, column: 34, scope: !593)
!611 = !DILocation(line: 22, column: 5, scope: !593)
!612 = distinct !{!612, !597, !613, !148}
!613 = !DILocation(line: 25, column: 5, scope: !590)
!614 = !DILocation(line: 27, column: 9, scope: !615)
!615 = distinct !DILexicalBlock(scope: !578, file: !66, line: 27, column: 9)
!616 = !DILocation(line: 27, column: 17, scope: !615)
!617 = !DILocation(line: 27, column: 21, scope: !615)
!618 = !DILocation(line: 28, column: 19, scope: !619)
!619 = distinct !DILexicalBlock(scope: !615, file: !66, line: 27, column: 27)
!620 = !DILocation(line: 28, column: 21, scope: !619)
!621 = !DILocation(line: 28, column: 24, scope: !619)
!622 = !DILocation(line: 28, column: 14, scope: !619)
!623 = !DILocation(line: 28, column: 17, scope: !619)
!624 = !DILocation(line: 29, column: 5, scope: !619)
!625 = !DILocation(line: 30, column: 1, scope: !578)
!626 = distinct !DISubprogram(name: "expand_P1_P2", scope: !66, file: !66, line: 280, type: !627, scopeLine: 280, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !69)
!627 = !DISubroutineType(types: !628)
!628 = !{null, !382, !52, !102}
!629 = !DILocalVariable(name: "p", arg: 1, scope: !626, file: !66, line: 280, type: !382)
!630 = !DILocation(line: 280, column: 47, scope: !626)
!631 = !DILocalVariable(name: "P", arg: 2, scope: !626, file: !66, line: 280, type: !52)
!632 = !DILocation(line: 280, column: 60, scope: !626)
!633 = !DILocalVariable(name: "seed_pk", arg: 3, scope: !626, file: !66, line: 280, type: !102)
!634 = !DILocation(line: 280, column: 84, scope: !626)
!635 = !DILocation(line: 284, column: 29, scope: !626)
!636 = !DILocation(line: 284, column: 47, scope: !626)
!637 = !DILocation(line: 284, column: 32, scope: !626)
!638 = !DILocation(line: 284, column: 67, scope: !626)
!639 = !DILocation(line: 284, column: 52, scope: !626)
!640 = !DILocation(line: 284, column: 50, scope: !626)
!641 = !DILocation(line: 284, column: 71, scope: !626)
!642 = !DILocation(line: 284, column: 100, scope: !626)
!643 = !DILocation(line: 284, column: 80, scope: !626)
!644 = !DILocation(line: 284, column: 5, scope: !626)
!645 = !DILocation(line: 285, column: 36, scope: !626)
!646 = !DILocation(line: 285, column: 39, scope: !626)
!647 = !DILocation(line: 285, column: 58, scope: !626)
!648 = !DILocation(line: 285, column: 43, scope: !626)
!649 = !DILocation(line: 285, column: 78, scope: !626)
!650 = !DILocation(line: 285, column: 63, scope: !626)
!651 = !DILocation(line: 285, column: 61, scope: !626)
!652 = !DILocation(line: 285, column: 100, scope: !626)
!653 = !DILocation(line: 285, column: 82, scope: !626)
!654 = !DILocation(line: 285, column: 81, scope: !626)
!655 = !DILocation(line: 285, column: 112, scope: !626)
!656 = !DILocation(line: 285, column: 104, scope: !626)
!657 = !DILocation(line: 285, column: 5, scope: !626)
!658 = !DILocation(line: 286, column: 1, scope: !626)
!659 = distinct !DISubprogram(name: "compute_P3", scope: !660, file: !660, line: 260, type: !661, scopeLine: 260, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !69)
!660 = !DIFile(filename: "../../../src/generic/generic_arithmetic.h", directory: "")
!661 = !DISubroutineType(types: !662)
!662 = !{null, !382, !663, !52, !102, !52}
!663 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 32)
!664 = !DILocalVariable(name: "p", arg: 1, scope: !659, file: !660, line: 260, type: !382)
!665 = !DILocation(line: 260, column: 38, scope: !659)
!666 = !DILocalVariable(name: "P1", arg: 2, scope: !659, file: !660, line: 260, type: !663)
!667 = !DILocation(line: 260, column: 57, scope: !659)
!668 = !DILocalVariable(name: "P2", arg: 3, scope: !659, file: !660, line: 260, type: !52)
!669 = !DILocation(line: 260, column: 71, scope: !659)
!670 = !DILocalVariable(name: "O", arg: 4, scope: !659, file: !660, line: 260, type: !102)
!671 = !DILocation(line: 260, column: 96, scope: !659)
!672 = !DILocalVariable(name: "P3", arg: 5, scope: !659, file: !660, line: 260, type: !52)
!673 = !DILocation(line: 260, column: 109, scope: !659)
!674 = !DILocalVariable(name: "m_vec_limbs", scope: !659, file: !660, line: 262, type: !463)
!675 = !DILocation(line: 262, column: 15, scope: !659)
!676 = !DILocation(line: 262, column: 47, scope: !659)
!677 = !DILocation(line: 262, column: 29, scope: !659)
!678 = !DILocalVariable(name: "param_v", scope: !659, file: !660, line: 263, type: !463)
!679 = !DILocation(line: 263, column: 15, scope: !659)
!680 = !DILocation(line: 263, column: 33, scope: !659)
!681 = !DILocation(line: 263, column: 25, scope: !659)
!682 = !DILocalVariable(name: "param_o", scope: !659, file: !660, line: 264, type: !463)
!683 = !DILocation(line: 264, column: 15, scope: !659)
!684 = !DILocation(line: 264, column: 33, scope: !659)
!685 = !DILocation(line: 264, column: 25, scope: !659)
!686 = !DILocation(line: 267, column: 16, scope: !659)
!687 = !DILocation(line: 267, column: 19, scope: !659)
!688 = !DILocation(line: 267, column: 23, scope: !659)
!689 = !DILocation(line: 267, column: 26, scope: !659)
!690 = !DILocation(line: 267, column: 5, scope: !659)
!691 = !DILocation(line: 270, column: 31, scope: !659)
!692 = !DILocation(line: 270, column: 44, scope: !659)
!693 = !DILocation(line: 270, column: 47, scope: !659)
!694 = !DILocation(line: 270, column: 51, scope: !659)
!695 = !DILocation(line: 270, column: 55, scope: !659)
!696 = !DILocation(line: 270, column: 64, scope: !659)
!697 = !DILocation(line: 270, column: 73, scope: !659)
!698 = !DILocation(line: 270, column: 5, scope: !659)
!699 = !DILocation(line: 271, column: 1, scope: !659)
!700 = distinct !DISubprogram(name: "pack_m_vecs", scope: !66, file: !66, line: 272, type: !701, scopeLine: 272, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !69)
!701 = !DISubroutineType(types: !702)
!702 = !{null, !663, !61, !87, !87}
!703 = !DILocalVariable(name: "in", arg: 1, scope: !700, file: !66, line: 272, type: !663)
!704 = !DILocation(line: 272, column: 41, scope: !700)
!705 = !DILocalVariable(name: "out", arg: 2, scope: !700, file: !66, line: 272, type: !61)
!706 = !DILocation(line: 272, column: 60, scope: !700)
!707 = !DILocalVariable(name: "vecs", arg: 3, scope: !700, file: !66, line: 272, type: !87)
!708 = !DILocation(line: 272, column: 69, scope: !700)
!709 = !DILocalVariable(name: "m", arg: 4, scope: !700, file: !66, line: 272, type: !87)
!710 = !DILocation(line: 272, column: 79, scope: !700)
!711 = !DILocalVariable(name: "m_vec_limbs", scope: !700, file: !66, line: 273, type: !463)
!712 = !DILocation(line: 273, column: 15, scope: !700)
!713 = !DILocation(line: 273, column: 30, scope: !700)
!714 = !DILocation(line: 273, column: 32, scope: !700)
!715 = !DILocation(line: 273, column: 38, scope: !700)
!716 = !DILocalVariable(name: "_in", scope: !700, file: !66, line: 274, type: !61)
!717 = !DILocation(line: 274, column: 20, scope: !700)
!718 = !DILocation(line: 274, column: 44, scope: !700)
!719 = !DILocalVariable(name: "i", scope: !720, file: !66, line: 275, type: !87)
!720 = distinct !DILexicalBlock(scope: !700, file: !66, line: 275, column: 5)
!721 = !DILocation(line: 275, column: 14, scope: !720)
!722 = !DILocation(line: 275, column: 10, scope: !720)
!723 = !DILocation(line: 275, column: 21, scope: !724)
!724 = distinct !DILexicalBlock(scope: !720, file: !66, line: 275, column: 5)
!725 = !DILocation(line: 275, column: 25, scope: !724)
!726 = !DILocation(line: 275, column: 23, scope: !724)
!727 = !DILocation(line: 275, column: 5, scope: !720)
!728 = !DILocation(line: 277, column: 17, scope: !729)
!729 = distinct !DILexicalBlock(scope: !724, file: !66, line: 276, column: 5)
!730 = !DILocation(line: 277, column: 24, scope: !729)
!731 = !DILocation(line: 277, column: 26, scope: !729)
!732 = !DILocation(line: 277, column: 25, scope: !729)
!733 = !DILocation(line: 277, column: 27, scope: !729)
!734 = !DILocation(line: 277, column: 21, scope: !729)
!735 = !DILocation(line: 277, column: 32, scope: !729)
!736 = !DILocation(line: 277, column: 38, scope: !729)
!737 = !DILocation(line: 277, column: 40, scope: !729)
!738 = !DILocation(line: 277, column: 39, scope: !729)
!739 = !DILocation(line: 277, column: 51, scope: !729)
!740 = !DILocation(line: 277, column: 36, scope: !729)
!741 = !DILocation(line: 277, column: 70, scope: !729)
!742 = !DILocation(line: 277, column: 71, scope: !729)
!743 = !DILocation(line: 277, column: 9, scope: !729)
!744 = !DILocation(line: 278, column: 5, scope: !729)
!745 = !DILocation(line: 275, column: 32, scope: !724)
!746 = !DILocation(line: 275, column: 5, scope: !724)
!747 = distinct !{!747, !727, !748, !148}
!748 = !DILocation(line: 278, column: 5, scope: !720)
!749 = !DILocation(line: 279, column: 1, scope: !700)
!750 = distinct !DISubprogram(name: "P1_times_O", scope: !660, file: !660, line: 74, type: !751, scopeLine: 74, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !69)
!751 = !DISubroutineType(types: !752)
!752 = !{null, !382, !663, !102, !52}
!753 = !DILocalVariable(name: "p", arg: 1, scope: !750, file: !660, line: 74, type: !382)
!754 = !DILocation(line: 74, column: 38, scope: !750)
!755 = !DILocalVariable(name: "P1", arg: 2, scope: !750, file: !660, line: 74, type: !663)
!756 = !DILocation(line: 74, column: 57, scope: !750)
!757 = !DILocalVariable(name: "O", arg: 3, scope: !750, file: !660, line: 74, type: !102)
!758 = !DILocation(line: 74, column: 82, scope: !750)
!759 = !DILocalVariable(name: "acc", arg: 4, scope: !750, file: !660, line: 74, type: !52)
!760 = !DILocation(line: 74, column: 95, scope: !750)
!761 = !DILocation(line: 78, column: 60, scope: !750)
!762 = !DILocation(line: 78, column: 42, scope: !750)
!763 = !DILocation(line: 78, column: 64, scope: !750)
!764 = !DILocation(line: 78, column: 68, scope: !750)
!765 = !DILocation(line: 78, column: 71, scope: !750)
!766 = !DILocation(line: 78, column: 84, scope: !750)
!767 = !DILocation(line: 78, column: 76, scope: !750)
!768 = !DILocation(line: 78, column: 96, scope: !750)
!769 = !DILocation(line: 78, column: 88, scope: !750)
!770 = !DILocation(line: 78, column: 108, scope: !750)
!771 = !DILocation(line: 78, column: 100, scope: !750)
!772 = !DILocation(line: 78, column: 5, scope: !750)
!773 = !DILocation(line: 79, column: 1, scope: !750)
!774 = distinct !DISubprogram(name: "mul_add_mat_trans_x_m_mat", scope: !660, file: !660, line: 47, type: !775, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !69)
!775 = !DISubroutineType(types: !776)
!776 = !{null, !463, !102, !663, !52, !463, !463, !463}
!777 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !774, file: !660, line: 47, type: !463)
!778 = !DILocation(line: 47, column: 42, scope: !774)
!779 = !DILocalVariable(name: "mat", arg: 2, scope: !774, file: !660, line: 47, type: !102)
!780 = !DILocation(line: 47, column: 76, scope: !774)
!781 = !DILocalVariable(name: "bs_mat", arg: 3, scope: !774, file: !660, line: 47, type: !663)
!782 = !DILocation(line: 47, column: 97, scope: !774)
!783 = !DILocalVariable(name: "acc", arg: 4, scope: !774, file: !660, line: 47, type: !52)
!784 = !DILocation(line: 47, column: 115, scope: !774)
!785 = !DILocalVariable(name: "mat_rows", arg: 5, scope: !774, file: !660, line: 48, type: !463)
!786 = !DILocation(line: 48, column: 42, scope: !774)
!787 = !DILocalVariable(name: "mat_cols", arg: 6, scope: !774, file: !660, line: 48, type: !463)
!788 = !DILocation(line: 48, column: 62, scope: !774)
!789 = !DILocalVariable(name: "bs_mat_cols", arg: 7, scope: !774, file: !660, line: 48, type: !463)
!790 = !DILocation(line: 48, column: 82, scope: !774)
!791 = !DILocalVariable(name: "r", scope: !792, file: !660, line: 50, type: !87)
!792 = distinct !DILexicalBlock(scope: !774, file: !660, line: 50, column: 5)
!793 = !DILocation(line: 50, column: 14, scope: !792)
!794 = !DILocation(line: 50, column: 10, scope: !792)
!795 = !DILocation(line: 50, column: 21, scope: !796)
!796 = distinct !DILexicalBlock(scope: !792, file: !660, line: 50, column: 5)
!797 = !DILocation(line: 50, column: 25, scope: !796)
!798 = !DILocation(line: 50, column: 23, scope: !796)
!799 = !DILocation(line: 50, column: 5, scope: !792)
!800 = !DILocalVariable(name: "c", scope: !801, file: !660, line: 51, type: !87)
!801 = distinct !DILexicalBlock(scope: !802, file: !660, line: 51, column: 9)
!802 = distinct !DILexicalBlock(scope: !796, file: !660, line: 50, column: 40)
!803 = !DILocation(line: 51, column: 18, scope: !801)
!804 = !DILocation(line: 51, column: 14, scope: !801)
!805 = !DILocation(line: 51, column: 25, scope: !806)
!806 = distinct !DILexicalBlock(scope: !801, file: !660, line: 51, column: 9)
!807 = !DILocation(line: 51, column: 29, scope: !806)
!808 = !DILocation(line: 51, column: 27, scope: !806)
!809 = !DILocation(line: 51, column: 9, scope: !801)
!810 = !DILocalVariable(name: "k", scope: !811, file: !660, line: 52, type: !87)
!811 = distinct !DILexicalBlock(scope: !812, file: !660, line: 52, column: 13)
!812 = distinct !DILexicalBlock(scope: !806, file: !660, line: 51, column: 44)
!813 = !DILocation(line: 52, column: 22, scope: !811)
!814 = !DILocation(line: 52, column: 18, scope: !811)
!815 = !DILocation(line: 52, column: 29, scope: !816)
!816 = distinct !DILexicalBlock(scope: !811, file: !660, line: 52, column: 13)
!817 = !DILocation(line: 52, column: 33, scope: !816)
!818 = !DILocation(line: 52, column: 31, scope: !816)
!819 = !DILocation(line: 52, column: 13, scope: !811)
!820 = !DILocation(line: 53, column: 31, scope: !821)
!821 = distinct !DILexicalBlock(scope: !816, file: !660, line: 52, column: 54)
!822 = !DILocation(line: 53, column: 44, scope: !821)
!823 = !DILocation(line: 53, column: 53, scope: !821)
!824 = !DILocation(line: 53, column: 68, scope: !821)
!825 = !DILocation(line: 53, column: 72, scope: !821)
!826 = !DILocation(line: 53, column: 70, scope: !821)
!827 = !DILocation(line: 53, column: 86, scope: !821)
!828 = !DILocation(line: 53, column: 84, scope: !821)
!829 = !DILocation(line: 53, column: 65, scope: !821)
!830 = !DILocation(line: 53, column: 51, scope: !821)
!831 = !DILocation(line: 53, column: 90, scope: !821)
!832 = !DILocation(line: 53, column: 94, scope: !821)
!833 = !DILocation(line: 53, column: 98, scope: !821)
!834 = !DILocation(line: 53, column: 96, scope: !821)
!835 = !DILocation(line: 53, column: 109, scope: !821)
!836 = !DILocation(line: 53, column: 107, scope: !821)
!837 = !DILocation(line: 53, column: 113, scope: !821)
!838 = !DILocation(line: 53, column: 119, scope: !821)
!839 = !DILocation(line: 53, column: 134, scope: !821)
!840 = !DILocation(line: 53, column: 138, scope: !821)
!841 = !DILocation(line: 53, column: 136, scope: !821)
!842 = !DILocation(line: 53, column: 152, scope: !821)
!843 = !DILocation(line: 53, column: 150, scope: !821)
!844 = !DILocation(line: 53, column: 131, scope: !821)
!845 = !DILocation(line: 53, column: 117, scope: !821)
!846 = !DILocation(line: 53, column: 17, scope: !821)
!847 = !DILocation(line: 54, column: 13, scope: !821)
!848 = !DILocation(line: 52, column: 48, scope: !816)
!849 = !DILocation(line: 52, column: 13, scope: !816)
!850 = distinct !{!850, !819, !851, !148}
!851 = !DILocation(line: 54, column: 13, scope: !811)
!852 = !DILocation(line: 55, column: 9, scope: !812)
!853 = !DILocation(line: 51, column: 40, scope: !806)
!854 = !DILocation(line: 51, column: 9, scope: !806)
!855 = distinct !{!855, !809, !856, !148}
!856 = !DILocation(line: 55, column: 9, scope: !801)
!857 = !DILocation(line: 56, column: 5, scope: !802)
!858 = !DILocation(line: 50, column: 36, scope: !796)
!859 = !DILocation(line: 50, column: 5, scope: !796)
!860 = distinct !{!860, !799, !861, !148}
!861 = !DILocation(line: 56, column: 5, scope: !792)
!862 = !DILocation(line: 57, column: 1, scope: !774)
!863 = distinct !DISubprogram(name: "m_vec_mul_add", scope: !864, file: !864, line: 24, type: !865, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !69)
!864 = !DIFile(filename: "../../../src/generic/arithmetic_dynamic.h", directory: "")
!865 = !DISubroutineType(types: !866)
!866 = !{null, !87, !663, !51, !52}
!867 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !863, file: !864, line: 24, type: !87)
!868 = !DILocation(line: 24, column: 24, scope: !863)
!869 = !DILocalVariable(name: "in", arg: 2, scope: !863, file: !864, line: 24, type: !663)
!870 = !DILocation(line: 24, column: 53, scope: !863)
!871 = !DILocalVariable(name: "a", arg: 3, scope: !863, file: !864, line: 24, type: !51)
!872 = !DILocation(line: 24, column: 71, scope: !863)
!873 = !DILocalVariable(name: "acc", arg: 4, scope: !863, file: !864, line: 24, type: !52)
!874 = !DILocation(line: 24, column: 84, scope: !863)
!875 = !DILocalVariable(name: "i", scope: !876, file: !864, line: 25, type: !87)
!876 = distinct !DILexicalBlock(scope: !863, file: !864, line: 25, column: 5)
!877 = !DILocation(line: 25, column: 13, scope: !876)
!878 = !DILocation(line: 25, column: 9, scope: !876)
!879 = !DILocation(line: 25, column: 18, scope: !880)
!880 = distinct !DILexicalBlock(scope: !876, file: !864, line: 25, column: 5)
!881 = !DILocation(line: 25, column: 22, scope: !880)
!882 = !DILocation(line: 25, column: 20, scope: !880)
!883 = !DILocation(line: 25, column: 5, scope: !876)
!884 = !DILocation(line: 26, column: 33, scope: !885)
!885 = distinct !DILexicalBlock(scope: !880, file: !864, line: 25, column: 39)
!886 = !DILocation(line: 26, column: 36, scope: !885)
!887 = !DILocation(line: 26, column: 40, scope: !885)
!888 = !DILocation(line: 26, column: 19, scope: !885)
!889 = !DILocation(line: 26, column: 9, scope: !885)
!890 = !DILocation(line: 26, column: 13, scope: !885)
!891 = !DILocation(line: 26, column: 16, scope: !885)
!892 = !DILocation(line: 27, column: 5, scope: !885)
!893 = !DILocation(line: 25, column: 36, scope: !880)
!894 = !DILocation(line: 25, column: 5, scope: !880)
!895 = distinct !{!895, !883, !896, !148}
!896 = !DILocation(line: 27, column: 5, scope: !876)
!897 = !DILocation(line: 28, column: 1, scope: !863)
!898 = distinct !DISubprogram(name: "gf16v_mul_u64", scope: !899, file: !899, line: 96, type: !900, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !69)
!899 = !DIFile(filename: "../../../src/simple_arithmetic.h", directory: "")
!900 = !DISubroutineType(types: !901)
!901 = !{!53, !53, !187}
!902 = !DILocalVariable(name: "a", arg: 1, scope: !898, file: !899, line: 96, type: !53)
!903 = !DILocation(line: 96, column: 48, scope: !898)
!904 = !DILocalVariable(name: "b", arg: 2, scope: !898, file: !899, line: 96, type: !187)
!905 = !DILocation(line: 96, column: 59, scope: !898)
!906 = !DILocalVariable(name: "mask_msb", scope: !898, file: !899, line: 97, type: !53)
!907 = !DILocation(line: 97, column: 14, scope: !898)
!908 = !DILocalVariable(name: "a_msb", scope: !898, file: !899, line: 98, type: !53)
!909 = !DILocation(line: 98, column: 14, scope: !898)
!910 = !DILocalVariable(name: "a64", scope: !898, file: !899, line: 99, type: !53)
!911 = !DILocation(line: 99, column: 14, scope: !898)
!912 = !DILocation(line: 99, column: 20, scope: !898)
!913 = !DILocalVariable(name: "b32", scope: !898, file: !899, line: 101, type: !53)
!914 = !DILocation(line: 101, column: 14, scope: !898)
!915 = !DILocation(line: 101, column: 20, scope: !898)
!916 = !DILocation(line: 101, column: 24, scope: !898)
!917 = !DILocation(line: 101, column: 22, scope: !898)
!918 = !DILocalVariable(name: "r64", scope: !898, file: !899, line: 105, type: !53)
!919 = !DILocation(line: 105, column: 14, scope: !898)
!920 = !DILocation(line: 105, column: 20, scope: !898)
!921 = !DILocation(line: 105, column: 27, scope: !898)
!922 = !DILocation(line: 105, column: 31, scope: !898)
!923 = !DILocation(line: 105, column: 24, scope: !898)
!924 = !DILocation(line: 107, column: 13, scope: !898)
!925 = !DILocation(line: 107, column: 19, scope: !898)
!926 = !DILocation(line: 107, column: 17, scope: !898)
!927 = !DILocation(line: 107, column: 11, scope: !898)
!928 = !DILocation(line: 108, column: 12, scope: !898)
!929 = !DILocation(line: 108, column: 9, scope: !898)
!930 = !DILocation(line: 109, column: 12, scope: !898)
!931 = !DILocation(line: 109, column: 16, scope: !898)
!932 = !DILocation(line: 109, column: 26, scope: !898)
!933 = !DILocation(line: 109, column: 32, scope: !898)
!934 = !DILocation(line: 109, column: 38, scope: !898)
!935 = !DILocation(line: 109, column: 22, scope: !898)
!936 = !DILocation(line: 109, column: 9, scope: !898)
!937 = !DILocation(line: 110, column: 13, scope: !898)
!938 = !DILocation(line: 110, column: 22, scope: !898)
!939 = !DILocation(line: 110, column: 26, scope: !898)
!940 = !DILocation(line: 110, column: 32, scope: !898)
!941 = !DILocation(line: 110, column: 18, scope: !898)
!942 = !DILocation(line: 110, column: 9, scope: !898)
!943 = !DILocation(line: 112, column: 13, scope: !898)
!944 = !DILocation(line: 112, column: 19, scope: !898)
!945 = !DILocation(line: 112, column: 17, scope: !898)
!946 = !DILocation(line: 112, column: 11, scope: !898)
!947 = !DILocation(line: 113, column: 12, scope: !898)
!948 = !DILocation(line: 113, column: 9, scope: !898)
!949 = !DILocation(line: 114, column: 12, scope: !898)
!950 = !DILocation(line: 114, column: 16, scope: !898)
!951 = !DILocation(line: 114, column: 26, scope: !898)
!952 = !DILocation(line: 114, column: 32, scope: !898)
!953 = !DILocation(line: 114, column: 38, scope: !898)
!954 = !DILocation(line: 114, column: 22, scope: !898)
!955 = !DILocation(line: 114, column: 9, scope: !898)
!956 = !DILocation(line: 115, column: 13, scope: !898)
!957 = !DILocation(line: 115, column: 22, scope: !898)
!958 = !DILocation(line: 115, column: 26, scope: !898)
!959 = !DILocation(line: 115, column: 32, scope: !898)
!960 = !DILocation(line: 115, column: 18, scope: !898)
!961 = !DILocation(line: 115, column: 9, scope: !898)
!962 = !DILocation(line: 117, column: 13, scope: !898)
!963 = !DILocation(line: 117, column: 19, scope: !898)
!964 = !DILocation(line: 117, column: 17, scope: !898)
!965 = !DILocation(line: 117, column: 11, scope: !898)
!966 = !DILocation(line: 118, column: 12, scope: !898)
!967 = !DILocation(line: 118, column: 9, scope: !898)
!968 = !DILocation(line: 119, column: 12, scope: !898)
!969 = !DILocation(line: 119, column: 16, scope: !898)
!970 = !DILocation(line: 119, column: 26, scope: !898)
!971 = !DILocation(line: 119, column: 32, scope: !898)
!972 = !DILocation(line: 119, column: 38, scope: !898)
!973 = !DILocation(line: 119, column: 22, scope: !898)
!974 = !DILocation(line: 119, column: 9, scope: !898)
!975 = !DILocation(line: 120, column: 13, scope: !898)
!976 = !DILocation(line: 120, column: 22, scope: !898)
!977 = !DILocation(line: 120, column: 26, scope: !898)
!978 = !DILocation(line: 120, column: 32, scope: !898)
!979 = !DILocation(line: 120, column: 18, scope: !898)
!980 = !DILocation(line: 120, column: 9, scope: !898)
!981 = !DILocation(line: 122, column: 12, scope: !898)
!982 = !DILocation(line: 122, column: 5, scope: !898)
!983 = distinct !DISubprogram(name: "mul_add_m_upper_triangular_mat_x_mat", scope: !660, file: !660, line: 16, type: !984, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !69)
!984 = !DISubroutineType(types: !985)
!985 = !{null, !463, !663, !102, !52, !463, !463, !463, !463}
!986 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !983, file: !660, line: 16, type: !463)
!987 = !DILocation(line: 16, column: 53, scope: !983)
!988 = !DILocalVariable(name: "bs_mat", arg: 2, scope: !983, file: !660, line: 16, type: !663)
!989 = !DILocation(line: 16, column: 82, scope: !983)
!990 = !DILocalVariable(name: "mat", arg: 3, scope: !983, file: !660, line: 16, type: !102)
!991 = !DILocation(line: 16, column: 111, scope: !983)
!992 = !DILocalVariable(name: "acc", arg: 4, scope: !983, file: !660, line: 16, type: !52)
!993 = !DILocation(line: 16, column: 126, scope: !983)
!994 = !DILocalVariable(name: "bs_mat_rows", arg: 5, scope: !983, file: !660, line: 17, type: !463)
!995 = !DILocation(line: 17, column: 53, scope: !983)
!996 = !DILocalVariable(name: "bs_mat_cols", arg: 6, scope: !983, file: !660, line: 17, type: !463)
!997 = !DILocation(line: 17, column: 76, scope: !983)
!998 = !DILocalVariable(name: "mat_cols", arg: 7, scope: !983, file: !660, line: 17, type: !463)
!999 = !DILocation(line: 17, column: 99, scope: !983)
!1000 = !DILocalVariable(name: "triangular", arg: 8, scope: !983, file: !660, line: 17, type: !463)
!1001 = !DILocation(line: 17, column: 119, scope: !983)
!1002 = !DILocalVariable(name: "bs_mat_entries_used", scope: !983, file: !660, line: 19, type: !87)
!1003 = !DILocation(line: 19, column: 9, scope: !983)
!1004 = !DILocalVariable(name: "r", scope: !1005, file: !660, line: 20, type: !87)
!1005 = distinct !DILexicalBlock(scope: !983, file: !660, line: 20, column: 5)
!1006 = !DILocation(line: 20, column: 14, scope: !1005)
!1007 = !DILocation(line: 20, column: 10, scope: !1005)
!1008 = !DILocation(line: 20, column: 21, scope: !1009)
!1009 = distinct !DILexicalBlock(scope: !1005, file: !660, line: 20, column: 5)
!1010 = !DILocation(line: 20, column: 25, scope: !1009)
!1011 = !DILocation(line: 20, column: 23, scope: !1009)
!1012 = !DILocation(line: 20, column: 5, scope: !1005)
!1013 = !DILocalVariable(name: "c", scope: !1014, file: !660, line: 21, type: !87)
!1014 = distinct !DILexicalBlock(scope: !1015, file: !660, line: 21, column: 9)
!1015 = distinct !DILexicalBlock(scope: !1009, file: !660, line: 20, column: 43)
!1016 = !DILocation(line: 21, column: 18, scope: !1014)
!1017 = !DILocation(line: 21, column: 22, scope: !1014)
!1018 = !DILocation(line: 21, column: 35, scope: !1014)
!1019 = !DILocation(line: 21, column: 33, scope: !1014)
!1020 = !DILocation(line: 21, column: 14, scope: !1014)
!1021 = !DILocation(line: 21, column: 38, scope: !1022)
!1022 = distinct !DILexicalBlock(scope: !1014, file: !660, line: 21, column: 9)
!1023 = !DILocation(line: 21, column: 42, scope: !1022)
!1024 = !DILocation(line: 21, column: 40, scope: !1022)
!1025 = !DILocation(line: 21, column: 9, scope: !1014)
!1026 = !DILocalVariable(name: "k", scope: !1027, file: !660, line: 22, type: !87)
!1027 = distinct !DILexicalBlock(scope: !1028, file: !660, line: 22, column: 13)
!1028 = distinct !DILexicalBlock(scope: !1022, file: !660, line: 21, column: 60)
!1029 = !DILocation(line: 22, column: 22, scope: !1027)
!1030 = !DILocation(line: 22, column: 18, scope: !1027)
!1031 = !DILocation(line: 22, column: 29, scope: !1032)
!1032 = distinct !DILexicalBlock(scope: !1027, file: !660, line: 22, column: 13)
!1033 = !DILocation(line: 22, column: 33, scope: !1032)
!1034 = !DILocation(line: 22, column: 31, scope: !1032)
!1035 = !DILocation(line: 22, column: 13, scope: !1027)
!1036 = !DILocation(line: 23, column: 31, scope: !1037)
!1037 = distinct !DILexicalBlock(scope: !1032, file: !660, line: 22, column: 51)
!1038 = !DILocation(line: 23, column: 44, scope: !1037)
!1039 = !DILocation(line: 23, column: 53, scope: !1037)
!1040 = !DILocation(line: 23, column: 67, scope: !1037)
!1041 = !DILocation(line: 23, column: 65, scope: !1037)
!1042 = !DILocation(line: 23, column: 51, scope: !1037)
!1043 = !DILocation(line: 23, column: 88, scope: !1037)
!1044 = !DILocation(line: 23, column: 92, scope: !1037)
!1045 = !DILocation(line: 23, column: 96, scope: !1037)
!1046 = !DILocation(line: 23, column: 94, scope: !1037)
!1047 = !DILocation(line: 23, column: 107, scope: !1037)
!1048 = !DILocation(line: 23, column: 105, scope: !1037)
!1049 = !DILocation(line: 23, column: 111, scope: !1037)
!1050 = !DILocation(line: 23, column: 117, scope: !1037)
!1051 = !DILocation(line: 23, column: 132, scope: !1037)
!1052 = !DILocation(line: 23, column: 136, scope: !1037)
!1053 = !DILocation(line: 23, column: 134, scope: !1037)
!1054 = !DILocation(line: 23, column: 147, scope: !1037)
!1055 = !DILocation(line: 23, column: 145, scope: !1037)
!1056 = !DILocation(line: 23, column: 129, scope: !1037)
!1057 = !DILocation(line: 23, column: 115, scope: !1037)
!1058 = !DILocation(line: 23, column: 17, scope: !1037)
!1059 = !DILocation(line: 24, column: 13, scope: !1037)
!1060 = !DILocation(line: 22, column: 45, scope: !1032)
!1061 = !DILocation(line: 22, column: 13, scope: !1032)
!1062 = distinct !{!1062, !1035, !1063, !148}
!1063 = !DILocation(line: 24, column: 13, scope: !1027)
!1064 = !DILocation(line: 25, column: 33, scope: !1028)
!1065 = !DILocation(line: 26, column: 9, scope: !1028)
!1066 = !DILocation(line: 21, column: 56, scope: !1022)
!1067 = !DILocation(line: 21, column: 9, scope: !1022)
!1068 = distinct !{!1068, !1025, !1069, !148}
!1069 = !DILocation(line: 26, column: 9, scope: !1014)
!1070 = !DILocation(line: 27, column: 5, scope: !1015)
!1071 = !DILocation(line: 20, column: 39, scope: !1009)
!1072 = !DILocation(line: 20, column: 5, scope: !1009)
!1073 = distinct !{!1073, !1012, !1074, !148}
!1074 = !DILocation(line: 27, column: 5, scope: !1005)
!1075 = !DILocation(line: 28, column: 1, scope: !983)
!1076 = distinct !DISubprogram(name: "unpack_m_vecs", scope: !66, file: !66, line: 262, type: !1077, scopeLine: 262, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !69)
!1077 = !DISubroutineType(types: !1078)
!1078 = !{null, !102, !52, !87, !87}
!1079 = !DILocalVariable(name: "in", arg: 1, scope: !1076, file: !66, line: 262, type: !102)
!1080 = !DILocation(line: 262, column: 48, scope: !1076)
!1081 = !DILocalVariable(name: "out", arg: 2, scope: !1076, file: !66, line: 262, type: !52)
!1082 = !DILocation(line: 262, column: 62, scope: !1076)
!1083 = !DILocalVariable(name: "vecs", arg: 3, scope: !1076, file: !66, line: 262, type: !87)
!1084 = !DILocation(line: 262, column: 71, scope: !1076)
!1085 = !DILocalVariable(name: "m", arg: 4, scope: !1076, file: !66, line: 262, type: !87)
!1086 = !DILocation(line: 262, column: 81, scope: !1076)
!1087 = !DILocalVariable(name: "m_vec_limbs", scope: !1076, file: !66, line: 263, type: !463)
!1088 = !DILocation(line: 263, column: 15, scope: !1076)
!1089 = !DILocation(line: 263, column: 30, scope: !1076)
!1090 = !DILocation(line: 263, column: 32, scope: !1076)
!1091 = !DILocation(line: 263, column: 38, scope: !1076)
!1092 = !DILocalVariable(name: "_out", scope: !1076, file: !66, line: 264, type: !61)
!1093 = !DILocation(line: 264, column: 20, scope: !1076)
!1094 = !DILocation(line: 264, column: 45, scope: !1076)
!1095 = !DILocalVariable(name: "tmp", scope: !1076, file: !66, line: 265, type: !1096)
!1096 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 576, elements: !1097)
!1097 = !{!1098}
!1098 = !DISubrange(count: 9)
!1099 = !DILocation(line: 265, column: 14, scope: !1076)
!1100 = !DILocalVariable(name: "i", scope: !1101, file: !66, line: 266, type: !87)
!1101 = distinct !DILexicalBlock(scope: !1076, file: !66, line: 266, column: 5)
!1102 = !DILocation(line: 266, column: 14, scope: !1101)
!1103 = !DILocation(line: 266, column: 18, scope: !1101)
!1104 = !DILocation(line: 266, column: 22, scope: !1101)
!1105 = !DILocation(line: 266, column: 10, scope: !1101)
!1106 = !DILocation(line: 266, column: 26, scope: !1107)
!1107 = distinct !DILexicalBlock(scope: !1101, file: !66, line: 266, column: 5)
!1108 = !DILocation(line: 266, column: 28, scope: !1107)
!1109 = !DILocation(line: 266, column: 5, scope: !1101)
!1110 = !DILocation(line: 268, column: 16, scope: !1111)
!1111 = distinct !DILexicalBlock(scope: !1107, file: !66, line: 267, column: 5)
!1112 = !DILocation(line: 268, column: 21, scope: !1111)
!1113 = !DILocation(line: 268, column: 26, scope: !1111)
!1114 = !DILocation(line: 268, column: 28, scope: !1111)
!1115 = !DILocation(line: 268, column: 27, scope: !1111)
!1116 = !DILocation(line: 268, column: 29, scope: !1111)
!1117 = !DILocation(line: 268, column: 24, scope: !1111)
!1118 = !DILocation(line: 268, column: 33, scope: !1111)
!1119 = !DILocation(line: 268, column: 34, scope: !1111)
!1120 = !DILocation(line: 268, column: 9, scope: !1111)
!1121 = !DILocation(line: 269, column: 16, scope: !1111)
!1122 = !DILocation(line: 269, column: 23, scope: !1111)
!1123 = !DILocation(line: 269, column: 25, scope: !1111)
!1124 = !DILocation(line: 269, column: 24, scope: !1111)
!1125 = !DILocation(line: 269, column: 36, scope: !1111)
!1126 = !DILocation(line: 269, column: 21, scope: !1111)
!1127 = !DILocation(line: 269, column: 55, scope: !1111)
!1128 = !DILocation(line: 269, column: 60, scope: !1111)
!1129 = !DILocation(line: 269, column: 71, scope: !1111)
!1130 = !DILocation(line: 269, column: 9, scope: !1111)
!1131 = !DILocation(line: 270, column: 5, scope: !1111)
!1132 = !DILocation(line: 266, column: 35, scope: !1107)
!1133 = !DILocation(line: 266, column: 5, scope: !1107)
!1134 = distinct !{!1134, !1109, !1135, !148}
!1135 = !DILocation(line: 270, column: 5, scope: !1101)
!1136 = !DILocation(line: 271, column: 1, scope: !1076)
!1137 = distinct !DISubprogram(name: "mayo_expand_sk", scope: !66, file: !66, line: 310, type: !1138, scopeLine: 311, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !69)
!1138 = !DISubroutineType(types: !1139)
!1139 = !{!87, !382, !102, !1140}
!1140 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1141, size: 32)
!1141 = !DIDerivedType(tag: DW_TAG_typedef, name: "sk_t", file: !93, line: 294, baseType: !1142)
!1142 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sk_t", file: !93, line: 291, size: 7257920, elements: !1143)
!1143 = !{!1144, !1145}
!1144 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !1142, file: !93, line: 292, baseType: !182, size: 7238592)
!1145 = !DIDerivedType(tag: DW_TAG_member, name: "O", scope: !1142, file: !93, line: 293, baseType: !186, size: 19312, offset: 7238592)
!1146 = !DILocalVariable(name: "p", arg: 1, scope: !1137, file: !66, line: 310, type: !382)
!1147 = !DILocation(line: 310, column: 41, scope: !1137)
!1148 = !DILocalVariable(name: "csk", arg: 2, scope: !1137, file: !66, line: 310, type: !102)
!1149 = !DILocation(line: 310, column: 65, scope: !1137)
!1150 = !DILocalVariable(name: "sk", arg: 3, scope: !1137, file: !66, line: 311, type: !1140)
!1151 = !DILocation(line: 311, column: 26, scope: !1137)
!1152 = !DILocalVariable(name: "ret", scope: !1137, file: !66, line: 312, type: !87)
!1153 = !DILocation(line: 312, column: 9, scope: !1137)
!1154 = !DILocalVariable(name: "S", scope: !1137, file: !66, line: 313, type: !446)
!1155 = !DILocation(line: 313, column: 19, scope: !1137)
!1156 = !DILocalVariable(name: "P", scope: !1137, file: !66, line: 314, type: !52)
!1157 = !DILocation(line: 314, column: 15, scope: !1137)
!1158 = !DILocation(line: 314, column: 19, scope: !1137)
!1159 = !DILocation(line: 314, column: 23, scope: !1137)
!1160 = !DILocalVariable(name: "O", scope: !1137, file: !66, line: 315, type: !61)
!1161 = !DILocation(line: 315, column: 20, scope: !1137)
!1162 = !DILocation(line: 315, column: 24, scope: !1137)
!1163 = !DILocation(line: 315, column: 28, scope: !1137)
!1164 = !DILocalVariable(name: "param_o", scope: !1137, file: !66, line: 317, type: !463)
!1165 = !DILocation(line: 317, column: 15, scope: !1137)
!1166 = !DILocation(line: 317, column: 33, scope: !1137)
!1167 = !DILocation(line: 317, column: 25, scope: !1137)
!1168 = !DILocalVariable(name: "param_v", scope: !1137, file: !66, line: 318, type: !463)
!1169 = !DILocation(line: 318, column: 15, scope: !1137)
!1170 = !DILocation(line: 318, column: 33, scope: !1137)
!1171 = !DILocation(line: 318, column: 25, scope: !1137)
!1172 = !DILocalVariable(name: "param_O_bytes", scope: !1137, file: !66, line: 319, type: !463)
!1173 = !DILocation(line: 319, column: 15, scope: !1137)
!1174 = !DILocation(line: 319, column: 45, scope: !1137)
!1175 = !DILocation(line: 319, column: 31, scope: !1137)
!1176 = !DILocalVariable(name: "param_pk_seed_bytes", scope: !1137, file: !66, line: 320, type: !463)
!1177 = !DILocation(line: 320, column: 15, scope: !1137)
!1178 = !DILocation(line: 320, column: 57, scope: !1137)
!1179 = !DILocation(line: 320, column: 37, scope: !1137)
!1180 = !DILocalVariable(name: "param_sk_seed_bytes", scope: !1137, file: !66, line: 321, type: !463)
!1181 = !DILocation(line: 321, column: 15, scope: !1137)
!1182 = !DILocation(line: 321, column: 57, scope: !1137)
!1183 = !DILocation(line: 321, column: 37, scope: !1137)
!1184 = !DILocalVariable(name: "seed_sk", scope: !1137, file: !66, line: 323, type: !102)
!1185 = !DILocation(line: 323, column: 26, scope: !1137)
!1186 = !DILocation(line: 323, column: 36, scope: !1137)
!1187 = !DILocalVariable(name: "seed_pk", scope: !1137, file: !66, line: 324, type: !61)
!1188 = !DILocation(line: 324, column: 20, scope: !1137)
!1189 = !DILocation(line: 324, column: 30, scope: !1137)
!1190 = !DILocation(line: 326, column: 14, scope: !1137)
!1191 = !DILocation(line: 326, column: 17, scope: !1137)
!1192 = !DILocation(line: 326, column: 39, scope: !1137)
!1193 = !DILocation(line: 326, column: 37, scope: !1137)
!1194 = !DILocation(line: 326, column: 54, scope: !1137)
!1195 = !DILocation(line: 327, column: 14, scope: !1137)
!1196 = !DILocation(line: 326, column: 5, scope: !1137)
!1197 = !DILocation(line: 328, column: 12, scope: !1137)
!1198 = !DILocation(line: 328, column: 16, scope: !1137)
!1199 = !DILocation(line: 328, column: 14, scope: !1137)
!1200 = !DILocation(line: 328, column: 37, scope: !1137)
!1201 = !DILocation(line: 328, column: 40, scope: !1137)
!1202 = !DILocation(line: 328, column: 50, scope: !1137)
!1203 = !DILocation(line: 328, column: 48, scope: !1137)
!1204 = !DILocation(line: 328, column: 5, scope: !1137)
!1205 = !DILocation(line: 334, column: 18, scope: !1137)
!1206 = !DILocation(line: 334, column: 21, scope: !1137)
!1207 = !DILocation(line: 334, column: 24, scope: !1137)
!1208 = !DILocation(line: 334, column: 5, scope: !1137)
!1209 = !DILocalVariable(name: "P2", scope: !1137, file: !66, line: 341, type: !52)
!1210 = !DILocation(line: 341, column: 15, scope: !1137)
!1211 = !DILocation(line: 341, column: 20, scope: !1137)
!1212 = !DILocation(line: 341, column: 39, scope: !1137)
!1213 = !DILocation(line: 341, column: 24, scope: !1137)
!1214 = !DILocation(line: 341, column: 22, scope: !1137)
!1215 = !DILocalVariable(name: "P1", scope: !1137, file: !66, line: 343, type: !52)
!1216 = !DILocation(line: 343, column: 15, scope: !1137)
!1217 = !DILocation(line: 343, column: 20, scope: !1137)
!1218 = !DILocalVariable(name: "L", scope: !1137, file: !66, line: 346, type: !52)
!1219 = !DILocation(line: 346, column: 15, scope: !1137)
!1220 = !DILocation(line: 346, column: 19, scope: !1137)
!1221 = !DILocation(line: 347, column: 19, scope: !1137)
!1222 = !DILocation(line: 347, column: 22, scope: !1137)
!1223 = !DILocation(line: 347, column: 26, scope: !1137)
!1224 = !DILocation(line: 347, column: 29, scope: !1137)
!1225 = !DILocation(line: 347, column: 5, scope: !1137)
!1226 = !DILocation(line: 355, column: 23, scope: !1137)
!1227 = !DILocation(line: 355, column: 5, scope: !1137)
!1228 = !DILocation(line: 356, column: 12, scope: !1137)
!1229 = !DILocation(line: 356, column: 5, scope: !1137)
!1230 = distinct !DISubprogram(name: "P1P1t_times_O", scope: !660, file: !660, line: 218, type: !751, scopeLine: 218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !69)
!1231 = !DILocalVariable(name: "p", arg: 1, scope: !1230, file: !660, line: 218, type: !382)
!1232 = !DILocation(line: 218, column: 41, scope: !1230)
!1233 = !DILocalVariable(name: "P1", arg: 2, scope: !1230, file: !660, line: 218, type: !663)
!1234 = !DILocation(line: 218, column: 60, scope: !1230)
!1235 = !DILocalVariable(name: "O", arg: 3, scope: !1230, file: !660, line: 218, type: !102)
!1236 = !DILocation(line: 218, column: 85, scope: !1230)
!1237 = !DILocalVariable(name: "acc", arg: 4, scope: !1230, file: !660, line: 218, type: !52)
!1238 = !DILocation(line: 218, column: 98, scope: !1230)
!1239 = !DILocalVariable(name: "param_o", scope: !1230, file: !660, line: 222, type: !463)
!1240 = !DILocation(line: 222, column: 15, scope: !1230)
!1241 = !DILocation(line: 222, column: 33, scope: !1230)
!1242 = !DILocation(line: 222, column: 25, scope: !1230)
!1243 = !DILocalVariable(name: "param_v", scope: !1230, file: !660, line: 223, type: !463)
!1244 = !DILocation(line: 223, column: 15, scope: !1230)
!1245 = !DILocation(line: 223, column: 33, scope: !1230)
!1246 = !DILocation(line: 223, column: 25, scope: !1230)
!1247 = !DILocalVariable(name: "m_vec_limbs", scope: !1230, file: !660, line: 224, type: !463)
!1248 = !DILocation(line: 224, column: 15, scope: !1230)
!1249 = !DILocation(line: 224, column: 47, scope: !1230)
!1250 = !DILocation(line: 224, column: 29, scope: !1230)
!1251 = !DILocalVariable(name: "bs_mat_entries_used", scope: !1230, file: !660, line: 226, type: !87)
!1252 = !DILocation(line: 226, column: 9, scope: !1230)
!1253 = !DILocalVariable(name: "r", scope: !1254, file: !660, line: 227, type: !87)
!1254 = distinct !DILexicalBlock(scope: !1230, file: !660, line: 227, column: 5)
!1255 = !DILocation(line: 227, column: 14, scope: !1254)
!1256 = !DILocation(line: 227, column: 10, scope: !1254)
!1257 = !DILocation(line: 227, column: 21, scope: !1258)
!1258 = distinct !DILexicalBlock(scope: !1254, file: !660, line: 227, column: 5)
!1259 = !DILocation(line: 227, column: 25, scope: !1258)
!1260 = !DILocation(line: 227, column: 23, scope: !1258)
!1261 = !DILocation(line: 227, column: 5, scope: !1254)
!1262 = !DILocalVariable(name: "c", scope: !1263, file: !660, line: 228, type: !87)
!1263 = distinct !DILexicalBlock(scope: !1264, file: !660, line: 228, column: 9)
!1264 = distinct !DILexicalBlock(scope: !1258, file: !660, line: 227, column: 39)
!1265 = !DILocation(line: 228, column: 18, scope: !1263)
!1266 = !DILocation(line: 228, column: 22, scope: !1263)
!1267 = !DILocation(line: 228, column: 14, scope: !1263)
!1268 = !DILocation(line: 228, column: 25, scope: !1269)
!1269 = distinct !DILexicalBlock(scope: !1263, file: !660, line: 228, column: 9)
!1270 = !DILocation(line: 228, column: 29, scope: !1269)
!1271 = !DILocation(line: 228, column: 27, scope: !1269)
!1272 = !DILocation(line: 228, column: 9, scope: !1263)
!1273 = !DILocation(line: 229, column: 16, scope: !1274)
!1274 = distinct !DILexicalBlock(scope: !1275, file: !660, line: 229, column: 16)
!1275 = distinct !DILexicalBlock(scope: !1269, file: !660, line: 228, column: 43)
!1276 = !DILocation(line: 229, column: 19, scope: !1274)
!1277 = !DILocation(line: 229, column: 17, scope: !1274)
!1278 = !DILocation(line: 230, column: 37, scope: !1279)
!1279 = distinct !DILexicalBlock(scope: !1274, file: !660, line: 229, column: 22)
!1280 = !DILocation(line: 231, column: 17, scope: !1279)
!1281 = !DILocalVariable(name: "k", scope: !1282, file: !660, line: 233, type: !87)
!1282 = distinct !DILexicalBlock(scope: !1275, file: !660, line: 233, column: 13)
!1283 = !DILocation(line: 233, column: 22, scope: !1282)
!1284 = !DILocation(line: 233, column: 18, scope: !1282)
!1285 = !DILocation(line: 233, column: 29, scope: !1286)
!1286 = distinct !DILexicalBlock(scope: !1282, file: !660, line: 233, column: 13)
!1287 = !DILocation(line: 233, column: 33, scope: !1286)
!1288 = !DILocation(line: 233, column: 31, scope: !1286)
!1289 = !DILocation(line: 233, column: 13, scope: !1282)
!1290 = !DILocation(line: 234, column: 31, scope: !1291)
!1291 = distinct !DILexicalBlock(scope: !1286, file: !660, line: 233, column: 50)
!1292 = !DILocation(line: 234, column: 44, scope: !1291)
!1293 = !DILocation(line: 234, column: 49, scope: !1291)
!1294 = !DILocation(line: 234, column: 63, scope: !1291)
!1295 = !DILocation(line: 234, column: 61, scope: !1291)
!1296 = !DILocation(line: 234, column: 47, scope: !1291)
!1297 = !DILocation(line: 234, column: 84, scope: !1291)
!1298 = !DILocation(line: 234, column: 86, scope: !1291)
!1299 = !DILocation(line: 234, column: 90, scope: !1291)
!1300 = !DILocation(line: 234, column: 88, scope: !1291)
!1301 = !DILocation(line: 234, column: 100, scope: !1291)
!1302 = !DILocation(line: 234, column: 98, scope: !1291)
!1303 = !DILocation(line: 234, column: 104, scope: !1291)
!1304 = !DILocation(line: 234, column: 110, scope: !1291)
!1305 = !DILocation(line: 234, column: 125, scope: !1291)
!1306 = !DILocation(line: 234, column: 129, scope: !1291)
!1307 = !DILocation(line: 234, column: 127, scope: !1291)
!1308 = !DILocation(line: 234, column: 139, scope: !1291)
!1309 = !DILocation(line: 234, column: 137, scope: !1291)
!1310 = !DILocation(line: 234, column: 122, scope: !1291)
!1311 = !DILocation(line: 234, column: 108, scope: !1291)
!1312 = !DILocation(line: 234, column: 17, scope: !1291)
!1313 = !DILocation(line: 235, column: 31, scope: !1291)
!1314 = !DILocation(line: 235, column: 44, scope: !1291)
!1315 = !DILocation(line: 235, column: 49, scope: !1291)
!1316 = !DILocation(line: 235, column: 63, scope: !1291)
!1317 = !DILocation(line: 235, column: 61, scope: !1291)
!1318 = !DILocation(line: 235, column: 47, scope: !1291)
!1319 = !DILocation(line: 235, column: 84, scope: !1291)
!1320 = !DILocation(line: 235, column: 86, scope: !1291)
!1321 = !DILocation(line: 235, column: 90, scope: !1291)
!1322 = !DILocation(line: 235, column: 88, scope: !1291)
!1323 = !DILocation(line: 235, column: 100, scope: !1291)
!1324 = !DILocation(line: 235, column: 98, scope: !1291)
!1325 = !DILocation(line: 235, column: 104, scope: !1291)
!1326 = !DILocation(line: 235, column: 110, scope: !1291)
!1327 = !DILocation(line: 235, column: 125, scope: !1291)
!1328 = !DILocation(line: 235, column: 129, scope: !1291)
!1329 = !DILocation(line: 235, column: 127, scope: !1291)
!1330 = !DILocation(line: 235, column: 139, scope: !1291)
!1331 = !DILocation(line: 235, column: 137, scope: !1291)
!1332 = !DILocation(line: 235, column: 122, scope: !1291)
!1333 = !DILocation(line: 235, column: 108, scope: !1291)
!1334 = !DILocation(line: 235, column: 17, scope: !1291)
!1335 = !DILocation(line: 236, column: 13, scope: !1291)
!1336 = !DILocation(line: 233, column: 44, scope: !1286)
!1337 = !DILocation(line: 233, column: 13, scope: !1286)
!1338 = distinct !{!1338, !1289, !1339, !148}
!1339 = !DILocation(line: 236, column: 13, scope: !1282)
!1340 = !DILocation(line: 237, column: 33, scope: !1275)
!1341 = !DILocation(line: 238, column: 9, scope: !1275)
!1342 = !DILocation(line: 228, column: 39, scope: !1269)
!1343 = !DILocation(line: 228, column: 9, scope: !1269)
!1344 = distinct !{!1344, !1272, !1345, !148}
!1345 = !DILocation(line: 238, column: 9, scope: !1263)
!1346 = !DILocation(line: 239, column: 5, scope: !1264)
!1347 = !DILocation(line: 227, column: 35, scope: !1258)
!1348 = !DILocation(line: 227, column: 5, scope: !1258)
!1349 = distinct !{!1349, !1261, !1350, !148}
!1350 = !DILocation(line: 239, column: 5, scope: !1254)
!1351 = !DILocation(line: 240, column: 1, scope: !1230)
!1352 = distinct !DISubprogram(name: "mayo_sign_signature", scope: !66, file: !66, line: 359, type: !1353, scopeLine: 361, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !69)
!1353 = !DISubroutineType(types: !1354)
!1354 = !{!87, !382, !61, !1355, !102, !58, !102}
!1355 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 32)
!1356 = !DILocalVariable(name: "p", arg: 1, scope: !1352, file: !66, line: 359, type: !382)
!1357 = !DILocation(line: 359, column: 46, scope: !1352)
!1358 = !DILocalVariable(name: "sig", arg: 2, scope: !1352, file: !66, line: 359, type: !61)
!1359 = !DILocation(line: 359, column: 64, scope: !1352)
!1360 = !DILocalVariable(name: "siglen", arg: 3, scope: !1352, file: !66, line: 360, type: !1355)
!1361 = !DILocation(line: 360, column: 23, scope: !1352)
!1362 = !DILocalVariable(name: "m", arg: 4, scope: !1352, file: !66, line: 360, type: !102)
!1363 = !DILocation(line: 360, column: 52, scope: !1352)
!1364 = !DILocalVariable(name: "mlen", arg: 5, scope: !1352, file: !66, line: 361, type: !58)
!1365 = !DILocation(line: 361, column: 22, scope: !1352)
!1366 = !DILocalVariable(name: "csk", arg: 6, scope: !1352, file: !66, line: 361, type: !102)
!1367 = !DILocation(line: 361, column: 49, scope: !1352)
!1368 = !DILocalVariable(name: "ret", scope: !1352, file: !66, line: 362, type: !87)
!1369 = !DILocation(line: 362, column: 9, scope: !1352)
!1370 = !DILocalVariable(name: "tenc", scope: !1352, file: !66, line: 363, type: !1371)
!1371 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 568, elements: !1372)
!1372 = !{!1373}
!1373 = !DISubrange(count: 71)
!1374 = !DILocation(line: 363, column: 19, scope: !1352)
!1375 = !DILocalVariable(name: "t", scope: !1352, file: !66, line: 363, type: !1376)
!1376 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 1136, elements: !1377)
!1377 = !{!1378}
!1378 = !DISubrange(count: 142)
!1379 = !DILocation(line: 363, column: 38, scope: !1352)
!1380 = !DILocalVariable(name: "y", scope: !1352, file: !66, line: 364, type: !1376)
!1381 = !DILocation(line: 364, column: 19, scope: !1352)
!1382 = !DILocalVariable(name: "salt", scope: !1352, file: !66, line: 365, type: !1383)
!1383 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 320, elements: !1384)
!1384 = !{!1385}
!1385 = !DISubrange(count: 40)
!1386 = !DILocation(line: 365, column: 19, scope: !1352)
!1387 = !DILocalVariable(name: "V", scope: !1352, file: !66, line: 366, type: !1388)
!1388 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 7392, elements: !1389)
!1389 = !{!1390}
!1390 = !DISubrange(count: 924)
!1391 = !DILocation(line: 366, column: 19, scope: !1352)
!1392 = !DILocalVariable(name: "Vdec", scope: !1352, file: !66, line: 366, type: !1393)
!1393 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 13632, elements: !1394)
!1394 = !{!1395}
!1395 = !DISubrange(count: 1704)
!1396 = !DILocation(line: 366, column: 57, scope: !1352)
!1397 = !DILocalVariable(name: "A", scope: !1352, file: !66, line: 367, type: !1398)
!1398 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 236160, elements: !1399)
!1399 = !{!1400}
!1400 = !DISubrange(count: 29520)
!1401 = !DILocation(line: 367, column: 19, scope: !1352)
!1402 = !DILocalVariable(name: "x", scope: !1352, file: !66, line: 368, type: !1403)
!1403 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 14784, elements: !1404)
!1404 = !{!1405}
!1405 = !DISubrange(count: 1848)
!1406 = !DILocation(line: 368, column: 19, scope: !1352)
!1407 = !DILocalVariable(name: "r", scope: !1352, file: !66, line: 369, type: !1408)
!1408 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 1640, elements: !1409)
!1409 = !{!1410}
!1410 = !DISubrange(count: 205)
!1411 = !DILocation(line: 369, column: 19, scope: !1352)
!1412 = !DILocalVariable(name: "s", scope: !1352, file: !66, line: 370, type: !1403)
!1413 = !DILocation(line: 370, column: 19, scope: !1352)
!1414 = !DILocalVariable(name: "seed_sk", scope: !1352, file: !66, line: 371, type: !102)
!1415 = !DILocation(line: 371, column: 26, scope: !1352)
!1416 = !DILocalVariable(name: "sk", scope: !1352, file: !66, line: 372, type: !1141, align: 256)
!1417 = !DILocation(line: 372, column: 22, scope: !1352)
!1418 = !DILocalVariable(name: "Ox", scope: !1352, file: !66, line: 373, type: !1376)
!1419 = !DILocation(line: 373, column: 19, scope: !1352)
!1420 = !DILocalVariable(name: "tmp", scope: !1352, file: !66, line: 374, type: !1421)
!1421 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 1160, elements: !1422)
!1422 = !{!1423}
!1423 = !DISubrange(count: 145)
!1424 = !DILocation(line: 374, column: 19, scope: !1352)
!1425 = !DILocalVariable(name: "ctrbyte", scope: !1352, file: !66, line: 375, type: !61)
!1426 = !DILocation(line: 375, column: 20, scope: !1352)
!1427 = !DILocalVariable(name: "vi", scope: !1352, file: !66, line: 376, type: !61)
!1428 = !DILocation(line: 376, column: 20, scope: !1352)
!1429 = !DILocalVariable(name: "param_m", scope: !1352, file: !66, line: 378, type: !463)
!1430 = !DILocation(line: 378, column: 15, scope: !1352)
!1431 = !DILocation(line: 378, column: 33, scope: !1352)
!1432 = !DILocation(line: 378, column: 25, scope: !1352)
!1433 = !DILocalVariable(name: "param_n", scope: !1352, file: !66, line: 379, type: !463)
!1434 = !DILocation(line: 379, column: 15, scope: !1352)
!1435 = !DILocation(line: 379, column: 33, scope: !1352)
!1436 = !DILocation(line: 379, column: 25, scope: !1352)
!1437 = !DILocalVariable(name: "param_o", scope: !1352, file: !66, line: 380, type: !463)
!1438 = !DILocation(line: 380, column: 15, scope: !1352)
!1439 = !DILocation(line: 380, column: 33, scope: !1352)
!1440 = !DILocation(line: 380, column: 25, scope: !1352)
!1441 = !DILocalVariable(name: "param_k", scope: !1352, file: !66, line: 381, type: !463)
!1442 = !DILocation(line: 381, column: 15, scope: !1352)
!1443 = !DILocation(line: 381, column: 33, scope: !1352)
!1444 = !DILocation(line: 381, column: 25, scope: !1352)
!1445 = !DILocalVariable(name: "param_v", scope: !1352, file: !66, line: 382, type: !463)
!1446 = !DILocation(line: 382, column: 15, scope: !1352)
!1447 = !DILocation(line: 382, column: 33, scope: !1352)
!1448 = !DILocation(line: 382, column: 25, scope: !1352)
!1449 = !DILocalVariable(name: "param_m_bytes", scope: !1352, file: !66, line: 383, type: !463)
!1450 = !DILocation(line: 383, column: 15, scope: !1352)
!1451 = !DILocation(line: 383, column: 45, scope: !1352)
!1452 = !DILocation(line: 383, column: 31, scope: !1352)
!1453 = !DILocalVariable(name: "param_v_bytes", scope: !1352, file: !66, line: 384, type: !463)
!1454 = !DILocation(line: 384, column: 15, scope: !1352)
!1455 = !DILocation(line: 384, column: 45, scope: !1352)
!1456 = !DILocation(line: 384, column: 31, scope: !1352)
!1457 = !DILocalVariable(name: "param_r_bytes", scope: !1352, file: !66, line: 385, type: !463)
!1458 = !DILocation(line: 385, column: 15, scope: !1352)
!1459 = !DILocation(line: 385, column: 45, scope: !1352)
!1460 = !DILocation(line: 385, column: 31, scope: !1352)
!1461 = !DILocalVariable(name: "param_sig_bytes", scope: !1352, file: !66, line: 386, type: !463)
!1462 = !DILocation(line: 386, column: 15, scope: !1352)
!1463 = !DILocation(line: 386, column: 49, scope: !1352)
!1464 = !DILocation(line: 386, column: 33, scope: !1352)
!1465 = !DILocalVariable(name: "param_A_cols", scope: !1352, file: !66, line: 387, type: !463)
!1466 = !DILocation(line: 387, column: 15, scope: !1352)
!1467 = !DILocation(line: 387, column: 43, scope: !1352)
!1468 = !DILocation(line: 387, column: 30, scope: !1352)
!1469 = !DILocalVariable(name: "param_digest_bytes", scope: !1352, file: !66, line: 388, type: !463)
!1470 = !DILocation(line: 388, column: 15, scope: !1352)
!1471 = !DILocation(line: 388, column: 55, scope: !1352)
!1472 = !DILocation(line: 388, column: 36, scope: !1352)
!1473 = !DILocalVariable(name: "param_sk_seed_bytes", scope: !1352, file: !66, line: 389, type: !463)
!1474 = !DILocation(line: 389, column: 15, scope: !1352)
!1475 = !DILocation(line: 389, column: 57, scope: !1352)
!1476 = !DILocation(line: 389, column: 37, scope: !1352)
!1477 = !DILocalVariable(name: "param_salt_bytes", scope: !1352, file: !66, line: 390, type: !463)
!1478 = !DILocation(line: 390, column: 15, scope: !1352)
!1479 = !DILocation(line: 390, column: 51, scope: !1352)
!1480 = !DILocation(line: 390, column: 34, scope: !1352)
!1481 = !DILocation(line: 392, column: 26, scope: !1352)
!1482 = !DILocation(line: 392, column: 29, scope: !1352)
!1483 = !DILocation(line: 392, column: 11, scope: !1352)
!1484 = !DILocation(line: 392, column: 9, scope: !1352)
!1485 = !DILocation(line: 393, column: 9, scope: !1486)
!1486 = distinct !DILexicalBlock(scope: !1352, file: !66, line: 393, column: 9)
!1487 = !DILocation(line: 393, column: 13, scope: !1486)
!1488 = !DILocation(line: 394, column: 9, scope: !1489)
!1489 = distinct !DILexicalBlock(scope: !1486, file: !66, line: 393, column: 25)
!1490 = !DILocation(line: 397, column: 15, scope: !1352)
!1491 = !DILocation(line: 397, column: 13, scope: !1352)
!1492 = !DILocation(line: 401, column: 14, scope: !1352)
!1493 = !DILocation(line: 401, column: 19, scope: !1352)
!1494 = !DILocation(line: 401, column: 39, scope: !1352)
!1495 = !DILocation(line: 401, column: 42, scope: !1352)
!1496 = !DILocation(line: 401, column: 5, scope: !1352)
!1497 = !DILocalVariable(name: "P1", scope: !1352, file: !66, line: 403, type: !52)
!1498 = !DILocation(line: 403, column: 15, scope: !1352)
!1499 = !DILocation(line: 403, column: 23, scope: !1352)
!1500 = !DILocation(line: 403, column: 20, scope: !1352)
!1501 = !DILocalVariable(name: "L", scope: !1352, file: !66, line: 404, type: !52)
!1502 = !DILocation(line: 404, column: 15, scope: !1352)
!1503 = !DILocation(line: 404, column: 20, scope: !1352)
!1504 = !DILocation(line: 404, column: 40, scope: !1352)
!1505 = !DILocation(line: 404, column: 25, scope: !1352)
!1506 = !DILocation(line: 404, column: 23, scope: !1352)
!1507 = !DILocalVariable(name: "Mtmp", scope: !1352, file: !66, line: 405, type: !1508)
!1508 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 117504, elements: !1509)
!1509 = !{!1510}
!1510 = !DISubrange(count: 1836)
!1511 = !DILocation(line: 405, column: 14, scope: !1352)
!1512 = !DILocation(line: 420, column: 21, scope: !1513)
!1513 = distinct !DILexicalBlock(scope: !1352, file: !66, line: 420, column: 9)
!1514 = !DILocation(line: 420, column: 27, scope: !1513)
!1515 = !DILocation(line: 420, column: 25, scope: !1513)
!1516 = !DILocation(line: 420, column: 47, scope: !1513)
!1517 = !DILocation(line: 420, column: 9, scope: !1513)
!1518 = !DILocation(line: 420, column: 65, scope: !1513)
!1519 = !DILocation(line: 421, column: 13, scope: !1520)
!1520 = distinct !DILexicalBlock(scope: !1513, file: !66, line: 420, column: 77)
!1521 = !DILocation(line: 422, column: 9, scope: !1520)
!1522 = !DILocation(line: 427, column: 12, scope: !1352)
!1523 = !DILocation(line: 427, column: 18, scope: !1352)
!1524 = !DILocation(line: 427, column: 16, scope: !1352)
!1525 = !DILocation(line: 427, column: 39, scope: !1352)
!1526 = !DILocation(line: 427, column: 37, scope: !1352)
!1527 = !DILocation(line: 427, column: 57, scope: !1352)
!1528 = !DILocation(line: 428, column: 12, scope: !1352)
!1529 = !DILocation(line: 427, column: 5, scope: !1352)
!1530 = !DILocation(line: 429, column: 14, scope: !1352)
!1531 = !DILocation(line: 429, column: 20, scope: !1352)
!1532 = !DILocation(line: 429, column: 38, scope: !1352)
!1533 = !DILocation(line: 430, column: 14, scope: !1352)
!1534 = !DILocation(line: 430, column: 35, scope: !1352)
!1535 = !DILocation(line: 430, column: 33, scope: !1352)
!1536 = !DILocation(line: 430, column: 54, scope: !1352)
!1537 = !DILocation(line: 430, column: 52, scope: !1352)
!1538 = !DILocation(line: 429, column: 5, scope: !1352)
!1539 = !DILocation(line: 437, column: 12, scope: !1352)
!1540 = !DILocation(line: 437, column: 18, scope: !1352)
!1541 = !DILocation(line: 437, column: 16, scope: !1352)
!1542 = !DILocation(line: 437, column: 38, scope: !1352)
!1543 = !DILocation(line: 437, column: 44, scope: !1352)
!1544 = !DILocation(line: 437, column: 5, scope: !1352)
!1545 = !DILocation(line: 438, column: 15, scope: !1352)
!1546 = !DILocation(line: 438, column: 21, scope: !1352)
!1547 = !DILocation(line: 438, column: 19, scope: !1352)
!1548 = !DILocation(line: 438, column: 42, scope: !1352)
!1549 = !DILocation(line: 438, column: 40, scope: !1352)
!1550 = !DILocation(line: 438, column: 61, scope: !1352)
!1551 = !DILocation(line: 438, column: 59, scope: !1352)
!1552 = !DILocation(line: 438, column: 13, scope: !1352)
!1553 = !DILocation(line: 440, column: 14, scope: !1352)
!1554 = !DILocation(line: 440, column: 20, scope: !1352)
!1555 = !DILocation(line: 440, column: 35, scope: !1352)
!1556 = !DILocation(line: 440, column: 40, scope: !1352)
!1557 = !DILocation(line: 440, column: 61, scope: !1352)
!1558 = !DILocation(line: 440, column: 59, scope: !1352)
!1559 = !DILocation(line: 440, column: 5, scope: !1352)
!1560 = !DILocation(line: 442, column: 12, scope: !1352)
!1561 = !DILocation(line: 442, column: 18, scope: !1352)
!1562 = !DILocation(line: 442, column: 21, scope: !1352)
!1563 = !DILocation(line: 442, column: 5, scope: !1352)
!1564 = !DILocalVariable(name: "ctr", scope: !1565, file: !66, line: 444, type: !87)
!1565 = distinct !DILexicalBlock(scope: !1352, file: !66, line: 444, column: 5)
!1566 = !DILocation(line: 444, column: 14, scope: !1565)
!1567 = !DILocation(line: 444, column: 10, scope: !1565)
!1568 = !DILocation(line: 444, column: 23, scope: !1569)
!1569 = distinct !DILexicalBlock(scope: !1565, file: !66, line: 444, column: 5)
!1570 = !DILocation(line: 444, column: 27, scope: !1569)
!1571 = !DILocation(line: 444, column: 5, scope: !1565)
!1572 = !DILocation(line: 445, column: 35, scope: !1573)
!1573 = distinct !DILexicalBlock(scope: !1569, file: !66, line: 444, column: 42)
!1574 = !DILocation(line: 445, column: 20, scope: !1573)
!1575 = !DILocation(line: 445, column: 10, scope: !1573)
!1576 = !DILocation(line: 445, column: 18, scope: !1573)
!1577 = !DILocation(line: 447, column: 18, scope: !1573)
!1578 = !DILocation(line: 447, column: 21, scope: !1573)
!1579 = !DILocation(line: 447, column: 31, scope: !1573)
!1580 = !DILocation(line: 447, column: 29, scope: !1573)
!1581 = !DILocation(line: 447, column: 47, scope: !1573)
!1582 = !DILocation(line: 447, column: 45, scope: !1573)
!1583 = !DILocation(line: 447, column: 62, scope: !1573)
!1584 = !DILocation(line: 448, column: 18, scope: !1573)
!1585 = !DILocation(line: 448, column: 39, scope: !1573)
!1586 = !DILocation(line: 448, column: 37, scope: !1573)
!1587 = !DILocation(line: 448, column: 58, scope: !1573)
!1588 = !DILocation(line: 448, column: 56, scope: !1573)
!1589 = !DILocation(line: 448, column: 78, scope: !1573)
!1590 = !DILocation(line: 447, column: 9, scope: !1573)
!1591 = !DILocalVariable(name: "i", scope: !1592, file: !66, line: 451, type: !87)
!1592 = distinct !DILexicalBlock(scope: !1573, file: !66, line: 451, column: 9)
!1593 = !DILocation(line: 451, column: 18, scope: !1592)
!1594 = !DILocation(line: 451, column: 14, scope: !1592)
!1595 = !DILocation(line: 451, column: 25, scope: !1596)
!1596 = distinct !DILexicalBlock(scope: !1592, file: !66, line: 451, column: 9)
!1597 = !DILocation(line: 451, column: 30, scope: !1596)
!1598 = !DILocation(line: 451, column: 38, scope: !1596)
!1599 = !DILocation(line: 451, column: 27, scope: !1596)
!1600 = !DILocation(line: 451, column: 9, scope: !1592)
!1601 = !DILocation(line: 452, column: 20, scope: !1602)
!1602 = distinct !DILexicalBlock(scope: !1596, file: !66, line: 451, column: 48)
!1603 = !DILocation(line: 452, column: 24, scope: !1602)
!1604 = !DILocation(line: 452, column: 28, scope: !1602)
!1605 = !DILocation(line: 452, column: 26, scope: !1602)
!1606 = !DILocation(line: 452, column: 22, scope: !1602)
!1607 = !DILocation(line: 452, column: 43, scope: !1602)
!1608 = !DILocation(line: 452, column: 50, scope: !1602)
!1609 = !DILocation(line: 452, column: 54, scope: !1602)
!1610 = !DILocation(line: 452, column: 52, scope: !1602)
!1611 = !DILocation(line: 452, column: 48, scope: !1602)
!1612 = !DILocation(line: 452, column: 63, scope: !1602)
!1613 = !DILocation(line: 452, column: 13, scope: !1602)
!1614 = !DILocation(line: 453, column: 9, scope: !1602)
!1615 = !DILocation(line: 451, column: 43, scope: !1596)
!1616 = !DILocation(line: 451, column: 9, scope: !1596)
!1617 = distinct !{!1617, !1600, !1618, !148}
!1618 = !DILocation(line: 453, column: 9, scope: !1592)
!1619 = !DILocation(line: 456, column: 27, scope: !1573)
!1620 = !DILocation(line: 456, column: 30, scope: !1573)
!1621 = !DILocation(line: 456, column: 36, scope: !1573)
!1622 = !DILocation(line: 456, column: 39, scope: !1573)
!1623 = !DILocation(line: 456, column: 43, scope: !1573)
!1624 = !DILocation(line: 456, column: 61, scope: !1573)
!1625 = !DILocation(line: 456, column: 9, scope: !1573)
!1626 = !DILocation(line: 458, column: 21, scope: !1573)
!1627 = !DILocation(line: 458, column: 36, scope: !1573)
!1628 = !DILocation(line: 458, column: 39, scope: !1573)
!1629 = !DILocation(line: 458, column: 42, scope: !1573)
!1630 = !DILocation(line: 458, column: 9, scope: !1573)
!1631 = !DILocation(line: 459, column: 19, scope: !1573)
!1632 = !DILocation(line: 459, column: 22, scope: !1573)
!1633 = !DILocation(line: 459, column: 28, scope: !1573)
!1634 = !DILocation(line: 459, column: 9, scope: !1573)
!1635 = !DILocalVariable(name: "i", scope: !1636, file: !66, line: 461, type: !87)
!1636 = distinct !DILexicalBlock(scope: !1573, file: !66, line: 461, column: 9)
!1637 = !DILocation(line: 461, column: 18, scope: !1636)
!1638 = !DILocation(line: 461, column: 14, scope: !1636)
!1639 = !DILocation(line: 461, column: 25, scope: !1640)
!1640 = distinct !DILexicalBlock(scope: !1636, file: !66, line: 461, column: 9)
!1641 = !DILocation(line: 461, column: 29, scope: !1640)
!1642 = !DILocation(line: 461, column: 27, scope: !1640)
!1643 = !DILocation(line: 461, column: 9, scope: !1636)
!1644 = !DILocation(line: 463, column: 18, scope: !1645)
!1645 = distinct !DILexicalBlock(scope: !1640, file: !66, line: 462, column: 9)
!1646 = !DILocation(line: 463, column: 17, scope: !1645)
!1647 = !DILocation(line: 463, column: 22, scope: !1645)
!1648 = !DILocation(line: 463, column: 30, scope: !1645)
!1649 = !DILocation(line: 463, column: 29, scope: !1645)
!1650 = !DILocation(line: 463, column: 38, scope: !1645)
!1651 = !DILocation(line: 463, column: 20, scope: !1645)
!1652 = !DILocation(line: 463, column: 43, scope: !1645)
!1653 = !DILocation(line: 463, column: 13, scope: !1645)
!1654 = !DILocation(line: 463, column: 48, scope: !1645)
!1655 = !DILocation(line: 464, column: 9, scope: !1645)
!1656 = !DILocation(line: 461, column: 39, scope: !1640)
!1657 = !DILocation(line: 461, column: 9, scope: !1640)
!1658 = distinct !{!1658, !1643, !1659, !148}
!1659 = !DILocation(line: 464, column: 9, scope: !1636)
!1660 = !DILocation(line: 466, column: 16, scope: !1573)
!1661 = !DILocation(line: 466, column: 20, scope: !1573)
!1662 = !DILocation(line: 466, column: 30, scope: !1573)
!1663 = !DILocation(line: 466, column: 28, scope: !1573)
!1664 = !DILocation(line: 466, column: 18, scope: !1573)
!1665 = !DILocation(line: 466, column: 45, scope: !1573)
!1666 = !DILocation(line: 467, column: 16, scope: !1573)
!1667 = !DILocation(line: 468, column: 16, scope: !1573)
!1668 = !DILocation(line: 467, column: 24, scope: !1573)
!1669 = !DILocation(line: 466, column: 9, scope: !1573)
!1670 = !DILocation(line: 470, column: 29, scope: !1671)
!1671 = distinct !DILexicalBlock(scope: !1573, file: !66, line: 470, column: 13)
!1672 = !DILocation(line: 470, column: 32, scope: !1671)
!1673 = !DILocation(line: 470, column: 35, scope: !1671)
!1674 = !DILocation(line: 470, column: 38, scope: !1671)
!1675 = !DILocation(line: 470, column: 41, scope: !1671)
!1676 = !DILocation(line: 470, column: 44, scope: !1671)
!1677 = !DILocation(line: 470, column: 53, scope: !1671)
!1678 = !DILocation(line: 470, column: 62, scope: !1671)
!1679 = !DILocation(line: 470, column: 71, scope: !1671)
!1680 = !DILocation(line: 470, column: 13, scope: !1671)
!1681 = !DILocation(line: 471, column: 13, scope: !1682)
!1682 = distinct !DILexicalBlock(scope: !1671, file: !66, line: 470, column: 86)
!1683 = !DILocation(line: 473, column: 20, scope: !1684)
!1684 = distinct !DILexicalBlock(scope: !1671, file: !66, line: 472, column: 16)
!1685 = !DILocation(line: 473, column: 13, scope: !1684)
!1686 = !DILocation(line: 474, column: 20, scope: !1684)
!1687 = !DILocation(line: 474, column: 13, scope: !1684)
!1688 = !DILocation(line: 476, column: 5, scope: !1573)
!1689 = !DILocation(line: 444, column: 35, scope: !1569)
!1690 = !DILocation(line: 444, column: 5, scope: !1569)
!1691 = distinct !{!1691, !1571, !1692, !148}
!1692 = !DILocation(line: 476, column: 5, scope: !1565)
!1693 = !DILocalVariable(name: "i", scope: !1694, file: !66, line: 478, type: !87)
!1694 = distinct !DILexicalBlock(scope: !1352, file: !66, line: 478, column: 5)
!1695 = !DILocation(line: 478, column: 14, scope: !1694)
!1696 = !DILocation(line: 478, column: 10, scope: !1694)
!1697 = !DILocation(line: 478, column: 21, scope: !1698)
!1698 = distinct !DILexicalBlock(scope: !1694, file: !66, line: 478, column: 5)
!1699 = !DILocation(line: 478, column: 26, scope: !1698)
!1700 = !DILocation(line: 478, column: 34, scope: !1698)
!1701 = !DILocation(line: 478, column: 23, scope: !1698)
!1702 = !DILocation(line: 478, column: 5, scope: !1694)
!1703 = !DILocation(line: 479, column: 14, scope: !1704)
!1704 = distinct !DILexicalBlock(scope: !1698, file: !66, line: 478, column: 44)
!1705 = !DILocation(line: 479, column: 21, scope: !1704)
!1706 = !DILocation(line: 479, column: 26, scope: !1704)
!1707 = !DILocation(line: 479, column: 36, scope: !1704)
!1708 = !DILocation(line: 479, column: 34, scope: !1704)
!1709 = !DILocation(line: 479, column: 23, scope: !1704)
!1710 = !DILocation(line: 479, column: 19, scope: !1704)
!1711 = !DILocation(line: 479, column: 12, scope: !1704)
!1712 = !DILocation(line: 480, column: 20, scope: !1704)
!1713 = !DILocation(line: 480, column: 17, scope: !1704)
!1714 = !DILocation(line: 480, column: 23, scope: !1704)
!1715 = !DILocation(line: 480, column: 27, scope: !1704)
!1716 = !DILocation(line: 480, column: 31, scope: !1704)
!1717 = !DILocation(line: 480, column: 29, scope: !1704)
!1718 = !DILocation(line: 480, column: 25, scope: !1704)
!1719 = !DILocation(line: 480, column: 40, scope: !1704)
!1720 = !DILocation(line: 480, column: 44, scope: !1704)
!1721 = !DILocation(line: 480, column: 53, scope: !1704)
!1722 = !DILocation(line: 480, column: 63, scope: !1704)
!1723 = !DILocation(line: 480, column: 61, scope: !1704)
!1724 = !DILocation(line: 480, column: 9, scope: !1704)
!1725 = !DILocation(line: 481, column: 17, scope: !1704)
!1726 = !DILocation(line: 481, column: 21, scope: !1704)
!1727 = !DILocation(line: 481, column: 25, scope: !1704)
!1728 = !DILocation(line: 481, column: 29, scope: !1704)
!1729 = !DILocation(line: 481, column: 33, scope: !1704)
!1730 = !DILocation(line: 481, column: 31, scope: !1704)
!1731 = !DILocation(line: 481, column: 27, scope: !1704)
!1732 = !DILocation(line: 481, column: 42, scope: !1704)
!1733 = !DILocation(line: 481, column: 52, scope: !1704)
!1734 = !DILocation(line: 481, column: 50, scope: !1704)
!1735 = !DILocation(line: 481, column: 9, scope: !1704)
!1736 = !DILocation(line: 482, column: 16, scope: !1704)
!1737 = !DILocation(line: 482, column: 20, scope: !1704)
!1738 = !DILocation(line: 482, column: 24, scope: !1704)
!1739 = !DILocation(line: 482, column: 22, scope: !1704)
!1740 = !DILocation(line: 482, column: 18, scope: !1704)
!1741 = !DILocation(line: 482, column: 35, scope: !1704)
!1742 = !DILocation(line: 482, column: 45, scope: !1704)
!1743 = !DILocation(line: 482, column: 43, scope: !1704)
!1744 = !DILocation(line: 482, column: 32, scope: !1704)
!1745 = !DILocation(line: 482, column: 55, scope: !1704)
!1746 = !DILocation(line: 482, column: 59, scope: !1704)
!1747 = !DILocation(line: 482, column: 63, scope: !1704)
!1748 = !DILocation(line: 482, column: 61, scope: !1704)
!1749 = !DILocation(line: 482, column: 57, scope: !1704)
!1750 = !DILocation(line: 482, column: 72, scope: !1704)
!1751 = !DILocation(line: 482, column: 9, scope: !1704)
!1752 = !DILocation(line: 483, column: 5, scope: !1704)
!1753 = !DILocation(line: 478, column: 39, scope: !1698)
!1754 = !DILocation(line: 478, column: 5, scope: !1698)
!1755 = distinct !{!1755, !1702, !1756, !148}
!1756 = !DILocation(line: 483, column: 5, scope: !1694)
!1757 = !DILocation(line: 484, column: 12, scope: !1352)
!1758 = !DILocation(line: 484, column: 15, scope: !1352)
!1759 = !DILocation(line: 484, column: 20, scope: !1352)
!1760 = !DILocation(line: 484, column: 30, scope: !1352)
!1761 = !DILocation(line: 484, column: 28, scope: !1352)
!1762 = !DILocation(line: 484, column: 5, scope: !1352)
!1763 = !DILocation(line: 486, column: 12, scope: !1352)
!1764 = !DILocation(line: 486, column: 18, scope: !1352)
!1765 = !DILocation(line: 486, column: 16, scope: !1352)
!1766 = !DILocation(line: 486, column: 36, scope: !1352)
!1767 = !DILocation(line: 486, column: 34, scope: !1352)
!1768 = !DILocation(line: 486, column: 54, scope: !1352)
!1769 = !DILocation(line: 486, column: 60, scope: !1352)
!1770 = !DILocation(line: 486, column: 5, scope: !1352)
!1771 = !DILocation(line: 487, column: 15, scope: !1352)
!1772 = !DILocation(line: 487, column: 6, scope: !1352)
!1773 = !DILocation(line: 487, column: 13, scope: !1352)
!1774 = !DILocation(line: 487, column: 5, scope: !1352)
!1775 = !DILabel(scope: !1352, name: "err", file: !66, line: 489, column: 1)
!1776 = !DILocation(line: 489, column: 1, scope: !1352)
!1777 = !DILocation(line: 490, column: 23, scope: !1352)
!1778 = !DILocation(line: 490, column: 5, scope: !1352)
!1779 = !DILocation(line: 491, column: 23, scope: !1352)
!1780 = !DILocation(line: 491, column: 5, scope: !1352)
!1781 = !DILocation(line: 492, column: 23, scope: !1352)
!1782 = !DILocation(line: 492, column: 5, scope: !1352)
!1783 = !DILocation(line: 493, column: 23, scope: !1352)
!1784 = !DILocation(line: 493, column: 5, scope: !1352)
!1785 = !DILocation(line: 494, column: 26, scope: !1352)
!1786 = !DILocation(line: 494, column: 23, scope: !1352)
!1787 = !DILocation(line: 494, column: 5, scope: !1352)
!1788 = !DILocation(line: 495, column: 5, scope: !1352)
!1789 = !DILocation(line: 496, column: 23, scope: !1352)
!1790 = !DILocation(line: 496, column: 5, scope: !1352)
!1791 = !DILocation(line: 497, column: 23, scope: !1352)
!1792 = !DILocation(line: 497, column: 5, scope: !1352)
!1793 = !DILocation(line: 498, column: 23, scope: !1352)
!1794 = !DILocation(line: 498, column: 5, scope: !1352)
!1795 = !DILocation(line: 499, column: 12, scope: !1352)
!1796 = !DILocation(line: 499, column: 5, scope: !1352)
!1797 = distinct !DISubprogram(name: "compute_M_and_VPV", scope: !660, file: !660, line: 244, type: !1798, scopeLine: 244, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !69)
!1798 = !DISubroutineType(types: !1799)
!1799 = !{null, !382, !102, !663, !663, !52, !52}
!1800 = !DILocalVariable(name: "p", arg: 1, scope: !1797, file: !660, line: 244, type: !382)
!1801 = !DILocation(line: 244, column: 45, scope: !1797)
!1802 = !DILocalVariable(name: "Vdec", arg: 2, scope: !1797, file: !660, line: 244, type: !102)
!1803 = !DILocation(line: 244, column: 69, scope: !1797)
!1804 = !DILocalVariable(name: "L", arg: 3, scope: !1797, file: !660, line: 244, type: !663)
!1805 = !DILocation(line: 244, column: 91, scope: !1797)
!1806 = !DILocalVariable(name: "P1", arg: 4, scope: !1797, file: !660, line: 244, type: !663)
!1807 = !DILocation(line: 244, column: 110, scope: !1797)
!1808 = !DILocalVariable(name: "VL", arg: 5, scope: !1797, file: !660, line: 244, type: !52)
!1809 = !DILocation(line: 244, column: 124, scope: !1797)
!1810 = !DILocalVariable(name: "VP1V", arg: 6, scope: !1797, file: !660, line: 244, type: !52)
!1811 = !DILocation(line: 244, column: 138, scope: !1797)
!1812 = !DILocalVariable(name: "param_k", scope: !1797, file: !660, line: 246, type: !463)
!1813 = !DILocation(line: 246, column: 15, scope: !1797)
!1814 = !DILocation(line: 246, column: 33, scope: !1797)
!1815 = !DILocation(line: 246, column: 25, scope: !1797)
!1816 = !DILocalVariable(name: "param_v", scope: !1797, file: !660, line: 247, type: !463)
!1817 = !DILocation(line: 247, column: 15, scope: !1797)
!1818 = !DILocation(line: 247, column: 33, scope: !1797)
!1819 = !DILocation(line: 247, column: 25, scope: !1797)
!1820 = !DILocalVariable(name: "param_o", scope: !1797, file: !660, line: 248, type: !463)
!1821 = !DILocation(line: 248, column: 15, scope: !1797)
!1822 = !DILocation(line: 248, column: 33, scope: !1797)
!1823 = !DILocation(line: 248, column: 25, scope: !1797)
!1824 = !DILocation(line: 251, column: 43, scope: !1797)
!1825 = !DILocation(line: 251, column: 25, scope: !1797)
!1826 = !DILocation(line: 251, column: 47, scope: !1797)
!1827 = !DILocation(line: 251, column: 53, scope: !1797)
!1828 = !DILocation(line: 251, column: 56, scope: !1797)
!1829 = !DILocation(line: 251, column: 60, scope: !1797)
!1830 = !DILocation(line: 251, column: 69, scope: !1797)
!1831 = !DILocation(line: 251, column: 78, scope: !1797)
!1832 = !DILocation(line: 251, column: 5, scope: !1797)
!1833 = !DILocalVariable(name: "Pv", scope: !1797, file: !660, line: 254, type: !1834)
!1834 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 981504, elements: !1835)
!1835 = !{!1836}
!1836 = !DISubrange(count: 15336)
!1837 = !DILocation(line: 254, column: 14, scope: !1797)
!1838 = !DILocation(line: 255, column: 17, scope: !1797)
!1839 = !DILocation(line: 255, column: 20, scope: !1797)
!1840 = !DILocation(line: 255, column: 24, scope: !1797)
!1841 = !DILocation(line: 255, column: 30, scope: !1797)
!1842 = !DILocation(line: 255, column: 5, scope: !1797)
!1843 = !DILocation(line: 256, column: 43, scope: !1797)
!1844 = !DILocation(line: 256, column: 25, scope: !1797)
!1845 = !DILocation(line: 256, column: 47, scope: !1797)
!1846 = !DILocation(line: 256, column: 53, scope: !1797)
!1847 = !DILocation(line: 256, column: 57, scope: !1797)
!1848 = !DILocation(line: 256, column: 63, scope: !1797)
!1849 = !DILocation(line: 256, column: 72, scope: !1797)
!1850 = !DILocation(line: 256, column: 81, scope: !1797)
!1851 = !DILocation(line: 256, column: 5, scope: !1797)
!1852 = !DILocation(line: 257, column: 1, scope: !1797)
!1853 = distinct !DISubprogram(name: "compute_rhs", scope: !66, file: !66, line: 43, type: !1854, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !69)
!1854 = !DISubroutineType(types: !1855)
!1855 = !{null, !382, !52, !102, !61}
!1856 = !DILocalVariable(name: "p", arg: 1, scope: !1853, file: !66, line: 43, type: !382)
!1857 = !DILocation(line: 43, column: 46, scope: !1853)
!1858 = !DILocalVariable(name: "vPv", arg: 2, scope: !1853, file: !66, line: 43, type: !52)
!1859 = !DILocation(line: 43, column: 59, scope: !1853)
!1860 = !DILocalVariable(name: "t", arg: 3, scope: !1853, file: !66, line: 43, type: !102)
!1861 = !DILocation(line: 43, column: 85, scope: !1853)
!1862 = !DILocalVariable(name: "y", arg: 4, scope: !1853, file: !66, line: 43, type: !61)
!1863 = !DILocation(line: 43, column: 103, scope: !1853)
!1864 = !DILocalVariable(name: "top_pos", scope: !1853, file: !66, line: 48, type: !1865)
!1865 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !58)
!1866 = !DILocation(line: 48, column: 18, scope: !1853)
!1867 = !DILocation(line: 48, column: 38, scope: !1853)
!1868 = !DILocation(line: 48, column: 30, scope: !1853)
!1869 = !DILocation(line: 48, column: 41, scope: !1853)
!1870 = !DILocation(line: 48, column: 46, scope: !1853)
!1871 = !DILocation(line: 48, column: 52, scope: !1853)
!1872 = !DILocalVariable(name: "m_vec_limbs", scope: !1853, file: !66, line: 49, type: !1865)
!1873 = !DILocation(line: 49, column: 18, scope: !1853)
!1874 = !DILocation(line: 49, column: 50, scope: !1853)
!1875 = !DILocation(line: 49, column: 32, scope: !1853)
!1876 = !DILocation(line: 52, column: 16, scope: !1877)
!1877 = distinct !DILexicalBlock(scope: !1853, file: !66, line: 52, column: 8)
!1878 = !DILocation(line: 52, column: 8, scope: !1877)
!1879 = !DILocation(line: 52, column: 19, scope: !1877)
!1880 = !DILocation(line: 52, column: 24, scope: !1877)
!1881 = !DILocalVariable(name: "mask", scope: !1882, file: !66, line: 53, type: !53)
!1882 = distinct !DILexicalBlock(scope: !1877, file: !66, line: 52, column: 29)
!1883 = !DILocation(line: 53, column: 18, scope: !1882)
!1884 = !DILocation(line: 54, column: 28, scope: !1882)
!1885 = !DILocation(line: 54, column: 20, scope: !1882)
!1886 = !DILocation(line: 54, column: 31, scope: !1882)
!1887 = !DILocation(line: 54, column: 36, scope: !1882)
!1888 = !DILocation(line: 54, column: 14, scope: !1882)
!1889 = !DILocation(line: 55, column: 14, scope: !1882)
!1890 = !DILocalVariable(name: "i", scope: !1891, file: !66, line: 56, type: !87)
!1891 = distinct !DILexicalBlock(scope: !1882, file: !66, line: 56, column: 9)
!1892 = !DILocation(line: 56, column: 18, scope: !1891)
!1893 = !DILocation(line: 56, column: 14, scope: !1891)
!1894 = !DILocation(line: 56, column: 25, scope: !1895)
!1895 = distinct !DILexicalBlock(scope: !1891, file: !66, line: 56, column: 9)
!1896 = !DILocation(line: 56, column: 37, scope: !1895)
!1897 = !DILocation(line: 56, column: 29, scope: !1895)
!1898 = !DILocation(line: 56, column: 48, scope: !1895)
!1899 = !DILocation(line: 56, column: 40, scope: !1895)
!1900 = !DILocation(line: 56, column: 39, scope: !1895)
!1901 = !DILocation(line: 56, column: 27, scope: !1895)
!1902 = !DILocation(line: 56, column: 9, scope: !1891)
!1903 = !DILocation(line: 58, column: 53, scope: !1904)
!1904 = distinct !DILexicalBlock(scope: !1895, file: !66, line: 57, column: 9)
!1905 = !DILocation(line: 58, column: 13, scope: !1904)
!1906 = !DILocation(line: 58, column: 17, scope: !1904)
!1907 = !DILocation(line: 58, column: 19, scope: !1904)
!1908 = !DILocation(line: 58, column: 18, scope: !1904)
!1909 = !DILocation(line: 58, column: 33, scope: !1904)
!1910 = !DILocation(line: 58, column: 31, scope: !1904)
!1911 = !DILocation(line: 58, column: 45, scope: !1904)
!1912 = !DILocation(line: 58, column: 50, scope: !1904)
!1913 = !DILocation(line: 59, column: 9, scope: !1904)
!1914 = !DILocation(line: 56, column: 53, scope: !1895)
!1915 = !DILocation(line: 56, column: 9, scope: !1895)
!1916 = distinct !{!1916, !1902, !1917, !148}
!1917 = !DILocation(line: 59, column: 9, scope: !1891)
!1918 = !DILocation(line: 60, column: 5, scope: !1882)
!1919 = !DILocalVariable(name: "temp", scope: !1853, file: !66, line: 62, type: !1096)
!1920 = !DILocation(line: 62, column: 14, scope: !1853)
!1921 = !DILocalVariable(name: "temp_bytes", scope: !1853, file: !66, line: 63, type: !61)
!1922 = !DILocation(line: 63, column: 20, scope: !1853)
!1923 = !DILocation(line: 63, column: 51, scope: !1853)
!1924 = !DILocalVariable(name: "i", scope: !1925, file: !66, line: 64, type: !87)
!1925 = distinct !DILexicalBlock(scope: !1853, file: !66, line: 64, column: 5)
!1926 = !DILocation(line: 64, column: 14, scope: !1925)
!1927 = !DILocation(line: 64, column: 26, scope: !1925)
!1928 = !DILocation(line: 64, column: 18, scope: !1925)
!1929 = !DILocation(line: 64, column: 29, scope: !1925)
!1930 = !DILocation(line: 64, column: 10, scope: !1925)
!1931 = !DILocation(line: 64, column: 34, scope: !1932)
!1932 = distinct !DILexicalBlock(scope: !1925, file: !66, line: 64, column: 5)
!1933 = !DILocation(line: 64, column: 36, scope: !1932)
!1934 = !DILocation(line: 64, column: 5, scope: !1925)
!1935 = !DILocalVariable(name: "j", scope: !1936, file: !66, line: 65, type: !87)
!1936 = distinct !DILexicalBlock(scope: !1937, file: !66, line: 65, column: 9)
!1937 = distinct !DILexicalBlock(scope: !1932, file: !66, line: 64, column: 48)
!1938 = !DILocation(line: 65, column: 18, scope: !1936)
!1939 = !DILocation(line: 65, column: 22, scope: !1936)
!1940 = !DILocation(line: 65, column: 14, scope: !1936)
!1941 = !DILocation(line: 65, column: 25, scope: !1942)
!1942 = distinct !DILexicalBlock(scope: !1936, file: !66, line: 65, column: 9)
!1943 = !DILocation(line: 65, column: 37, scope: !1942)
!1944 = !DILocation(line: 65, column: 29, scope: !1942)
!1945 = !DILocation(line: 65, column: 27, scope: !1942)
!1946 = !DILocation(line: 65, column: 9, scope: !1936)
!1947 = !DILocalVariable(name: "top", scope: !1948, file: !66, line: 67, type: !51)
!1948 = distinct !DILexicalBlock(scope: !1942, file: !66, line: 65, column: 46)
!1949 = !DILocation(line: 67, column: 27, scope: !1948)
!1950 = !DILocation(line: 67, column: 39, scope: !1948)
!1951 = !DILocation(line: 67, column: 50, scope: !1948)
!1952 = !DILocation(line: 67, column: 34, scope: !1948)
!1953 = !DILocation(line: 67, column: 57, scope: !1948)
!1954 = !DILocation(line: 67, column: 54, scope: !1948)
!1955 = !DILocation(line: 67, column: 66, scope: !1948)
!1956 = !DILocation(line: 67, column: 33, scope: !1948)
!1957 = !DILocation(line: 68, column: 18, scope: !1948)
!1958 = !DILocation(line: 68, column: 29, scope: !1948)
!1959 = !DILocation(line: 68, column: 13, scope: !1948)
!1960 = !DILocation(line: 68, column: 33, scope: !1948)
!1961 = !DILocalVariable(name: "k", scope: !1962, file: !66, line: 69, type: !87)
!1962 = distinct !DILexicalBlock(scope: !1948, file: !66, line: 69, column: 13)
!1963 = !DILocation(line: 69, column: 21, scope: !1962)
!1964 = !DILocation(line: 69, column: 25, scope: !1962)
!1965 = !DILocation(line: 69, column: 37, scope: !1962)
!1966 = !DILocation(line: 69, column: 17, scope: !1962)
!1967 = !DILocation(line: 69, column: 42, scope: !1968)
!1968 = distinct !DILexicalBlock(scope: !1962, file: !66, line: 69, column: 13)
!1969 = !DILocation(line: 69, column: 43, scope: !1968)
!1970 = !DILocation(line: 69, column: 13, scope: !1962)
!1971 = !DILocation(line: 70, column: 35, scope: !1972)
!1972 = distinct !DILexicalBlock(scope: !1968, file: !66, line: 69, column: 52)
!1973 = !DILocation(line: 70, column: 30, scope: !1972)
!1974 = !DILocation(line: 70, column: 38, scope: !1972)
!1975 = !DILocation(line: 70, column: 22, scope: !1972)
!1976 = !DILocation(line: 70, column: 23, scope: !1972)
!1977 = !DILocation(line: 70, column: 17, scope: !1972)
!1978 = !DILocation(line: 70, column: 27, scope: !1972)
!1979 = !DILocation(line: 71, column: 22, scope: !1972)
!1980 = !DILocation(line: 71, column: 17, scope: !1972)
!1981 = !DILocation(line: 71, column: 25, scope: !1972)
!1982 = !DILocation(line: 72, column: 13, scope: !1972)
!1983 = !DILocation(line: 69, column: 49, scope: !1968)
!1984 = !DILocation(line: 69, column: 13, scope: !1968)
!1985 = distinct !{!1985, !1970, !1986, !148}
!1986 = !DILocation(line: 72, column: 13, scope: !1962)
!1987 = !DILocalVariable(name: "jj", scope: !1988, file: !66, line: 74, type: !87)
!1988 = distinct !DILexicalBlock(scope: !1948, file: !66, line: 74, column: 13)
!1989 = !DILocation(line: 74, column: 22, scope: !1988)
!1990 = !DILocation(line: 74, column: 18, scope: !1988)
!1991 = !DILocation(line: 74, column: 30, scope: !1992)
!1992 = distinct !DILexicalBlock(scope: !1988, file: !66, line: 74, column: 13)
!1993 = !DILocation(line: 74, column: 33, scope: !1992)
!1994 = !DILocation(line: 74, column: 13, scope: !1988)
!1995 = !DILocation(line: 75, column: 20, scope: !1996)
!1996 = distinct !DILexicalBlock(scope: !1997, file: !66, line: 75, column: 20)
!1997 = distinct !DILexicalBlock(scope: !1992, file: !66, line: 74, column: 53)
!1998 = !DILocation(line: 75, column: 22, scope: !1996)
!1999 = !DILocation(line: 75, column: 25, scope: !1996)
!2000 = !DILocation(line: 79, column: 47, scope: !2001)
!2001 = distinct !DILexicalBlock(scope: !1996, file: !66, line: 75, column: 30)
!2002 = !DILocation(line: 79, column: 65, scope: !2001)
!2003 = !DILocation(line: 79, column: 52, scope: !2001)
!2004 = !DILocation(line: 79, column: 68, scope: !2001)
!2005 = !DILocation(line: 79, column: 41, scope: !2001)
!2006 = !DILocation(line: 79, column: 21, scope: !2001)
!2007 = !DILocation(line: 79, column: 32, scope: !2001)
!2008 = !DILocation(line: 79, column: 34, scope: !2001)
!2009 = !DILocation(line: 79, column: 38, scope: !2001)
!2010 = !DILocation(line: 81, column: 17, scope: !2001)
!2011 = !DILocation(line: 86, column: 47, scope: !2012)
!2012 = distinct !DILexicalBlock(scope: !1996, file: !66, line: 82, column: 22)
!2013 = !DILocation(line: 86, column: 65, scope: !2012)
!2014 = !DILocation(line: 86, column: 52, scope: !2012)
!2015 = !DILocation(line: 86, column: 68, scope: !2012)
!2016 = !DILocation(line: 86, column: 41, scope: !2012)
!2017 = !DILocation(line: 86, column: 73, scope: !2012)
!2018 = !DILocation(line: 86, column: 21, scope: !2012)
!2019 = !DILocation(line: 86, column: 32, scope: !2012)
!2020 = !DILocation(line: 86, column: 34, scope: !2012)
!2021 = !DILocation(line: 86, column: 38, scope: !2012)
!2022 = !DILocation(line: 89, column: 13, scope: !1997)
!2023 = !DILocation(line: 74, column: 49, scope: !1992)
!2024 = !DILocation(line: 74, column: 13, scope: !1992)
!2025 = distinct !{!2025, !1994, !2026, !148}
!2026 = !DILocation(line: 89, column: 13, scope: !1988)
!2027 = !DILocalVariable(name: "k", scope: !2028, file: !66, line: 92, type: !58)
!2028 = distinct !DILexicalBlock(scope: !1948, file: !66, line: 92, column: 13)
!2029 = !DILocation(line: 92, column: 24, scope: !2028)
!2030 = !DILocation(line: 92, column: 17, scope: !2028)
!2031 = !DILocation(line: 92, column: 29, scope: !2032)
!2032 = distinct !DILexicalBlock(scope: !2028, file: !66, line: 92, column: 13)
!2033 = !DILocation(line: 92, column: 33, scope: !2032)
!2034 = !DILocation(line: 92, column: 31, scope: !2032)
!2035 = !DILocation(line: 92, column: 13, scope: !2028)
!2036 = !DILocation(line: 93, column: 28, scope: !2037)
!2037 = distinct !DILexicalBlock(scope: !2032, file: !66, line: 92, column: 51)
!2038 = !DILocation(line: 93, column: 34, scope: !2037)
!2039 = !DILocation(line: 93, column: 46, scope: !2037)
!2040 = !DILocation(line: 93, column: 38, scope: !2037)
!2041 = !DILocation(line: 93, column: 36, scope: !2037)
!2042 = !DILocation(line: 93, column: 51, scope: !2037)
!2043 = !DILocation(line: 93, column: 49, scope: !2037)
!2044 = !DILocation(line: 93, column: 56, scope: !2037)
!2045 = !DILocation(line: 93, column: 54, scope: !2037)
!2046 = !DILocation(line: 93, column: 70, scope: !2037)
!2047 = !DILocation(line: 93, column: 68, scope: !2037)
!2048 = !DILocation(line: 93, column: 77, scope: !2037)
!2049 = !DILocation(line: 93, column: 80, scope: !2037)
!2050 = !DILocation(line: 93, column: 78, scope: !2037)
!2051 = !DILocation(line: 93, column: 76, scope: !2037)
!2052 = !DILocation(line: 93, column: 83, scope: !2037)
!2053 = !DILocation(line: 93, column: 89, scope: !2037)
!2054 = !DILocation(line: 93, column: 101, scope: !2037)
!2055 = !DILocation(line: 93, column: 93, scope: !2037)
!2056 = !DILocation(line: 93, column: 91, scope: !2037)
!2057 = !DILocation(line: 93, column: 106, scope: !2037)
!2058 = !DILocation(line: 93, column: 104, scope: !2037)
!2059 = !DILocation(line: 93, column: 111, scope: !2037)
!2060 = !DILocation(line: 93, column: 109, scope: !2037)
!2061 = !DILocation(line: 93, column: 125, scope: !2037)
!2062 = !DILocation(line: 93, column: 123, scope: !2037)
!2063 = !DILocation(line: 93, column: 82, scope: !2037)
!2064 = !DILocation(line: 93, column: 73, scope: !2037)
!2065 = !DILocation(line: 93, column: 22, scope: !2037)
!2066 = !DILocation(line: 93, column: 17, scope: !2037)
!2067 = !DILocation(line: 93, column: 25, scope: !2037)
!2068 = !DILocation(line: 94, column: 13, scope: !2037)
!2069 = !DILocation(line: 92, column: 48, scope: !2032)
!2070 = !DILocation(line: 92, column: 13, scope: !2032)
!2071 = distinct !{!2071, !2035, !2072, !148}
!2072 = !DILocation(line: 94, column: 13, scope: !2028)
!2073 = !DILocation(line: 95, column: 9, scope: !1948)
!2074 = !DILocation(line: 65, column: 42, scope: !1942)
!2075 = !DILocation(line: 65, column: 9, scope: !1942)
!2076 = distinct !{!2076, !1946, !2077, !148}
!2077 = !DILocation(line: 95, column: 9, scope: !1936)
!2078 = !DILocation(line: 96, column: 5, scope: !1937)
!2079 = !DILocation(line: 64, column: 44, scope: !1932)
!2080 = !DILocation(line: 64, column: 5, scope: !1932)
!2081 = distinct !{!2081, !1934, !2082, !148}
!2082 = !DILocation(line: 96, column: 5, scope: !1925)
!2083 = !DILocalVariable(name: "i", scope: !2084, file: !66, line: 99, type: !87)
!2084 = distinct !DILexicalBlock(scope: !1853, file: !66, line: 99, column: 5)
!2085 = !DILocation(line: 99, column: 14, scope: !2084)
!2086 = !DILocation(line: 99, column: 10, scope: !2084)
!2087 = !DILocation(line: 99, column: 21, scope: !2088)
!2088 = distinct !DILexicalBlock(scope: !2084, file: !66, line: 99, column: 5)
!2089 = !DILocation(line: 99, column: 33, scope: !2088)
!2090 = !DILocation(line: 99, column: 25, scope: !2088)
!2091 = !DILocation(line: 99, column: 23, scope: !2088)
!2092 = !DILocation(line: 99, column: 5, scope: !2084)
!2093 = !DILocation(line: 105, column: 18, scope: !2094)
!2094 = distinct !DILexicalBlock(scope: !2088, file: !66, line: 100, column: 5)
!2095 = !DILocation(line: 105, column: 20, scope: !2094)
!2096 = !DILocation(line: 105, column: 28, scope: !2094)
!2097 = !DILocation(line: 105, column: 39, scope: !2094)
!2098 = !DILocation(line: 105, column: 40, scope: !2094)
!2099 = !DILocation(line: 105, column: 44, scope: !2094)
!2100 = !DILocation(line: 105, column: 25, scope: !2094)
!2101 = !DILocation(line: 105, column: 9, scope: !2094)
!2102 = !DILocation(line: 105, column: 11, scope: !2094)
!2103 = !DILocation(line: 105, column: 16, scope: !2094)
!2104 = !DILocation(line: 106, column: 18, scope: !2094)
!2105 = !DILocation(line: 106, column: 20, scope: !2094)
!2106 = !DILocation(line: 106, column: 21, scope: !2094)
!2107 = !DILocation(line: 106, column: 28, scope: !2094)
!2108 = !DILocation(line: 106, column: 39, scope: !2094)
!2109 = !DILocation(line: 106, column: 40, scope: !2094)
!2110 = !DILocation(line: 106, column: 44, scope: !2094)
!2111 = !DILocation(line: 106, column: 25, scope: !2094)
!2112 = !DILocation(line: 106, column: 9, scope: !2094)
!2113 = !DILocation(line: 106, column: 11, scope: !2094)
!2114 = !DILocation(line: 106, column: 12, scope: !2094)
!2115 = !DILocation(line: 106, column: 16, scope: !2094)
!2116 = !DILocation(line: 108, column: 5, scope: !2094)
!2117 = !DILocation(line: 99, column: 38, scope: !2088)
!2118 = !DILocation(line: 99, column: 5, scope: !2088)
!2119 = distinct !{!2119, !2092, !2120, !148}
!2120 = !DILocation(line: 108, column: 5, scope: !2084)
!2121 = !DILocation(line: 109, column: 1, scope: !1853)
!2122 = distinct !DISubprogram(name: "compute_A", scope: !66, file: !66, line: 154, type: !2123, scopeLine: 154, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !69)
!2123 = !DISubroutineType(types: !2124)
!2124 = !{null, !382, !52, !61}
!2125 = !DILocalVariable(name: "p", arg: 1, scope: !2122, file: !66, line: 154, type: !382)
!2126 = !DILocation(line: 154, column: 44, scope: !2122)
!2127 = !DILocalVariable(name: "VtL", arg: 2, scope: !2122, file: !66, line: 154, type: !52)
!2128 = !DILocation(line: 154, column: 57, scope: !2122)
!2129 = !DILocalVariable(name: "A_out", arg: 3, scope: !2122, file: !66, line: 154, type: !61)
!2130 = !DILocation(line: 154, column: 77, scope: !2122)
!2131 = !DILocalVariable(name: "bits_to_shift", scope: !2122, file: !66, line: 159, type: !87)
!2132 = !DILocation(line: 159, column: 9, scope: !2122)
!2133 = !DILocalVariable(name: "words_to_shift", scope: !2122, file: !66, line: 160, type: !87)
!2134 = !DILocation(line: 160, column: 9, scope: !2122)
!2135 = !DILocalVariable(name: "m_vec_limbs", scope: !2122, file: !66, line: 161, type: !463)
!2136 = !DILocation(line: 161, column: 15, scope: !2122)
!2137 = !DILocation(line: 161, column: 47, scope: !2122)
!2138 = !DILocation(line: 161, column: 29, scope: !2122)
!2139 = !DILocalVariable(name: "A", scope: !2122, file: !66, line: 162, type: !2140)
!2140 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 239616, elements: !2141)
!2141 = !{!2142}
!2142 = !DISubrange(count: 3744)
!2143 = !DILocation(line: 162, column: 14, scope: !2122)
!2144 = !DILocalVariable(name: "A_width", scope: !2122, file: !66, line: 163, type: !58)
!2145 = !DILocation(line: 163, column: 12, scope: !2122)
!2146 = !DILocation(line: 163, column: 32, scope: !2122)
!2147 = !DILocation(line: 163, column: 24, scope: !2122)
!2148 = !DILocation(line: 163, column: 43, scope: !2122)
!2149 = !DILocation(line: 163, column: 35, scope: !2122)
!2150 = !DILocation(line: 163, column: 34, scope: !2122)
!2151 = !DILocation(line: 163, column: 46, scope: !2122)
!2152 = !DILocation(line: 163, column: 51, scope: !2122)
!2153 = !DILocation(line: 163, column: 55, scope: !2122)
!2154 = !DILocalVariable(name: "Mi", scope: !2122, file: !66, line: 164, type: !663)
!2155 = !DILocation(line: 164, column: 21, scope: !2122)
!2156 = !DILocalVariable(name: "Mj", scope: !2122, file: !66, line: 164, type: !663)
!2157 = !DILocation(line: 164, column: 26, scope: !2122)
!2158 = !DILocation(line: 167, column: 16, scope: !2159)
!2159 = distinct !DILexicalBlock(scope: !2122, file: !66, line: 167, column: 8)
!2160 = !DILocation(line: 167, column: 8, scope: !2159)
!2161 = !DILocation(line: 167, column: 19, scope: !2159)
!2162 = !DILocation(line: 167, column: 24, scope: !2159)
!2163 = !DILocalVariable(name: "mask", scope: !2164, file: !66, line: 168, type: !53)
!2164 = distinct !DILexicalBlock(scope: !2159, file: !66, line: 167, column: 29)
!2165 = !DILocation(line: 168, column: 18, scope: !2164)
!2166 = !DILocation(line: 169, column: 27, scope: !2164)
!2167 = !DILocation(line: 169, column: 19, scope: !2164)
!2168 = !DILocation(line: 169, column: 30, scope: !2164)
!2169 = !DILocation(line: 169, column: 35, scope: !2164)
!2170 = !DILocation(line: 169, column: 14, scope: !2164)
!2171 = !DILocation(line: 170, column: 14, scope: !2164)
!2172 = !DILocalVariable(name: "i", scope: !2173, file: !66, line: 171, type: !87)
!2173 = distinct !DILexicalBlock(scope: !2164, file: !66, line: 171, column: 9)
!2174 = !DILocation(line: 171, column: 18, scope: !2173)
!2175 = !DILocation(line: 171, column: 14, scope: !2173)
!2176 = !DILocation(line: 171, column: 25, scope: !2177)
!2177 = distinct !DILexicalBlock(scope: !2173, file: !66, line: 171, column: 9)
!2178 = !DILocation(line: 171, column: 37, scope: !2177)
!2179 = !DILocation(line: 171, column: 29, scope: !2177)
!2180 = !DILocation(line: 171, column: 48, scope: !2177)
!2181 = !DILocation(line: 171, column: 40, scope: !2177)
!2182 = !DILocation(line: 171, column: 39, scope: !2177)
!2183 = !DILocation(line: 171, column: 27, scope: !2177)
!2184 = !DILocation(line: 171, column: 9, scope: !2173)
!2185 = !DILocation(line: 173, column: 53, scope: !2186)
!2186 = distinct !DILexicalBlock(scope: !2177, file: !66, line: 172, column: 9)
!2187 = !DILocation(line: 173, column: 13, scope: !2186)
!2188 = !DILocation(line: 173, column: 17, scope: !2186)
!2189 = !DILocation(line: 173, column: 19, scope: !2186)
!2190 = !DILocation(line: 173, column: 18, scope: !2186)
!2191 = !DILocation(line: 173, column: 33, scope: !2186)
!2192 = !DILocation(line: 173, column: 31, scope: !2186)
!2193 = !DILocation(line: 173, column: 45, scope: !2186)
!2194 = !DILocation(line: 173, column: 50, scope: !2186)
!2195 = !DILocation(line: 174, column: 9, scope: !2186)
!2196 = !DILocation(line: 171, column: 53, scope: !2177)
!2197 = !DILocation(line: 171, column: 9, scope: !2177)
!2198 = distinct !{!2198, !2184, !2199, !148}
!2199 = !DILocation(line: 174, column: 9, scope: !2173)
!2200 = !DILocation(line: 175, column: 5, scope: !2164)
!2201 = !DILocalVariable(name: "i", scope: !2202, file: !66, line: 177, type: !87)
!2202 = distinct !DILexicalBlock(scope: !2122, file: !66, line: 177, column: 5)
!2203 = !DILocation(line: 177, column: 14, scope: !2202)
!2204 = !DILocation(line: 177, column: 10, scope: !2202)
!2205 = !DILocation(line: 177, column: 21, scope: !2206)
!2206 = distinct !DILexicalBlock(scope: !2202, file: !66, line: 177, column: 5)
!2207 = !DILocation(line: 177, column: 34, scope: !2206)
!2208 = !DILocation(line: 177, column: 26, scope: !2206)
!2209 = !DILocation(line: 177, column: 37, scope: !2206)
!2210 = !DILocation(line: 177, column: 23, scope: !2206)
!2211 = !DILocation(line: 177, column: 5, scope: !2202)
!2212 = !DILocalVariable(name: "j", scope: !2213, file: !66, line: 178, type: !87)
!2213 = distinct !DILexicalBlock(scope: !2214, file: !66, line: 178, column: 9)
!2214 = distinct !DILexicalBlock(scope: !2206, file: !66, line: 177, column: 47)
!2215 = !DILocation(line: 178, column: 18, scope: !2213)
!2216 = !DILocation(line: 178, column: 30, scope: !2213)
!2217 = !DILocation(line: 178, column: 22, scope: !2213)
!2218 = !DILocation(line: 178, column: 33, scope: !2213)
!2219 = !DILocation(line: 178, column: 14, scope: !2213)
!2220 = !DILocation(line: 178, column: 38, scope: !2221)
!2221 = distinct !DILexicalBlock(scope: !2213, file: !66, line: 178, column: 9)
!2222 = !DILocation(line: 178, column: 43, scope: !2221)
!2223 = !DILocation(line: 178, column: 40, scope: !2221)
!2224 = !DILocation(line: 178, column: 9, scope: !2213)
!2225 = !DILocation(line: 180, column: 18, scope: !2226)
!2226 = distinct !DILexicalBlock(scope: !2221, file: !66, line: 178, column: 51)
!2227 = !DILocation(line: 180, column: 24, scope: !2226)
!2228 = !DILocation(line: 180, column: 28, scope: !2226)
!2229 = !DILocation(line: 180, column: 26, scope: !2226)
!2230 = !DILocation(line: 180, column: 50, scope: !2226)
!2231 = !DILocation(line: 180, column: 42, scope: !2226)
!2232 = !DILocation(line: 180, column: 40, scope: !2226)
!2233 = !DILocation(line: 180, column: 22, scope: !2226)
!2234 = !DILocation(line: 180, column: 16, scope: !2226)
!2235 = !DILocalVariable(name: "c", scope: !2236, file: !66, line: 181, type: !87)
!2236 = distinct !DILexicalBlock(scope: !2226, file: !66, line: 181, column: 13)
!2237 = !DILocation(line: 181, column: 22, scope: !2236)
!2238 = !DILocation(line: 181, column: 18, scope: !2236)
!2239 = !DILocation(line: 181, column: 29, scope: !2240)
!2240 = distinct !DILexicalBlock(scope: !2236, file: !66, line: 181, column: 13)
!2241 = !DILocation(line: 181, column: 41, scope: !2240)
!2242 = !DILocation(line: 181, column: 33, scope: !2240)
!2243 = !DILocation(line: 181, column: 31, scope: !2240)
!2244 = !DILocation(line: 181, column: 13, scope: !2236)
!2245 = !DILocalVariable(name: "k", scope: !2246, file: !66, line: 182, type: !87)
!2246 = distinct !DILexicalBlock(scope: !2247, file: !66, line: 182, column: 17)
!2247 = distinct !DILexicalBlock(scope: !2240, file: !66, line: 181, column: 50)
!2248 = !DILocation(line: 182, column: 26, scope: !2246)
!2249 = !DILocation(line: 182, column: 22, scope: !2246)
!2250 = !DILocation(line: 182, column: 33, scope: !2251)
!2251 = distinct !DILexicalBlock(scope: !2246, file: !66, line: 182, column: 17)
!2252 = !DILocation(line: 182, column: 37, scope: !2251)
!2253 = !DILocation(line: 182, column: 35, scope: !2251)
!2254 = !DILocation(line: 182, column: 17, scope: !2246)
!2255 = !DILocation(line: 184, column: 78, scope: !2256)
!2256 = distinct !DILexicalBlock(scope: !2251, file: !66, line: 183, column: 17)
!2257 = !DILocation(line: 184, column: 81, scope: !2256)
!2258 = !DILocation(line: 184, column: 85, scope: !2256)
!2259 = !DILocation(line: 184, column: 87, scope: !2256)
!2260 = !DILocation(line: 184, column: 86, scope: !2256)
!2261 = !DILocation(line: 184, column: 83, scope: !2256)
!2262 = !DILocation(line: 184, column: 103, scope: !2256)
!2263 = !DILocation(line: 184, column: 100, scope: !2256)
!2264 = !DILocation(line: 184, column: 32, scope: !2256)
!2265 = !DILocation(line: 184, column: 24, scope: !2256)
!2266 = !DILocation(line: 184, column: 37, scope: !2256)
!2267 = !DILocation(line: 184, column: 35, scope: !2256)
!2268 = !DILocation(line: 184, column: 41, scope: !2256)
!2269 = !DILocation(line: 184, column: 39, scope: !2256)
!2270 = !DILocation(line: 184, column: 46, scope: !2256)
!2271 = !DILocation(line: 184, column: 50, scope: !2256)
!2272 = !DILocation(line: 184, column: 48, scope: !2256)
!2273 = !DILocation(line: 184, column: 66, scope: !2256)
!2274 = !DILocation(line: 184, column: 65, scope: !2256)
!2275 = !DILocation(line: 184, column: 43, scope: !2256)
!2276 = !DILocation(line: 184, column: 21, scope: !2256)
!2277 = !DILocation(line: 184, column: 75, scope: !2256)
!2278 = !DILocation(line: 185, column: 24, scope: !2279)
!2279 = distinct !DILexicalBlock(scope: !2256, file: !66, line: 185, column: 24)
!2280 = !DILocation(line: 185, column: 38, scope: !2279)
!2281 = !DILocation(line: 186, column: 86, scope: !2282)
!2282 = distinct !DILexicalBlock(scope: !2279, file: !66, line: 185, column: 42)
!2283 = !DILocation(line: 186, column: 89, scope: !2282)
!2284 = !DILocation(line: 186, column: 93, scope: !2282)
!2285 = !DILocation(line: 186, column: 95, scope: !2282)
!2286 = !DILocation(line: 186, column: 94, scope: !2282)
!2287 = !DILocation(line: 186, column: 91, scope: !2282)
!2288 = !DILocation(line: 186, column: 115, scope: !2282)
!2289 = !DILocation(line: 186, column: 114, scope: !2282)
!2290 = !DILocation(line: 186, column: 108, scope: !2282)
!2291 = !DILocation(line: 186, column: 36, scope: !2282)
!2292 = !DILocation(line: 186, column: 28, scope: !2282)
!2293 = !DILocation(line: 186, column: 41, scope: !2282)
!2294 = !DILocation(line: 186, column: 39, scope: !2282)
!2295 = !DILocation(line: 186, column: 45, scope: !2282)
!2296 = !DILocation(line: 186, column: 43, scope: !2282)
!2297 = !DILocation(line: 186, column: 50, scope: !2282)
!2298 = !DILocation(line: 186, column: 54, scope: !2282)
!2299 = !DILocation(line: 186, column: 52, scope: !2282)
!2300 = !DILocation(line: 186, column: 69, scope: !2282)
!2301 = !DILocation(line: 186, column: 74, scope: !2282)
!2302 = !DILocation(line: 186, column: 73, scope: !2282)
!2303 = !DILocation(line: 186, column: 47, scope: !2282)
!2304 = !DILocation(line: 186, column: 25, scope: !2282)
!2305 = !DILocation(line: 186, column: 83, scope: !2282)
!2306 = !DILocation(line: 187, column: 21, scope: !2282)
!2307 = !DILocation(line: 188, column: 17, scope: !2256)
!2308 = !DILocation(line: 182, column: 51, scope: !2251)
!2309 = !DILocation(line: 182, column: 17, scope: !2251)
!2310 = distinct !{!2310, !2254, !2311, !148}
!2311 = !DILocation(line: 188, column: 17, scope: !2246)
!2312 = !DILocation(line: 189, column: 13, scope: !2247)
!2313 = !DILocation(line: 181, column: 46, scope: !2240)
!2314 = !DILocation(line: 181, column: 13, scope: !2240)
!2315 = distinct !{!2315, !2244, !2316, !148}
!2316 = !DILocation(line: 189, column: 13, scope: !2236)
!2317 = !DILocation(line: 191, column: 17, scope: !2318)
!2318 = distinct !DILexicalBlock(scope: !2226, file: !66, line: 191, column: 17)
!2319 = !DILocation(line: 191, column: 22, scope: !2318)
!2320 = !DILocation(line: 191, column: 19, scope: !2318)
!2321 = !DILocation(line: 192, column: 22, scope: !2322)
!2322 = distinct !DILexicalBlock(scope: !2318, file: !66, line: 191, column: 25)
!2323 = !DILocation(line: 192, column: 28, scope: !2322)
!2324 = !DILocation(line: 192, column: 32, scope: !2322)
!2325 = !DILocation(line: 192, column: 30, scope: !2322)
!2326 = !DILocation(line: 192, column: 54, scope: !2322)
!2327 = !DILocation(line: 192, column: 46, scope: !2322)
!2328 = !DILocation(line: 192, column: 44, scope: !2322)
!2329 = !DILocation(line: 192, column: 26, scope: !2322)
!2330 = !DILocation(line: 192, column: 20, scope: !2322)
!2331 = !DILocalVariable(name: "c", scope: !2332, file: !66, line: 193, type: !87)
!2332 = distinct !DILexicalBlock(scope: !2322, file: !66, line: 193, column: 17)
!2333 = !DILocation(line: 193, column: 26, scope: !2332)
!2334 = !DILocation(line: 193, column: 22, scope: !2332)
!2335 = !DILocation(line: 193, column: 33, scope: !2336)
!2336 = distinct !DILexicalBlock(scope: !2332, file: !66, line: 193, column: 17)
!2337 = !DILocation(line: 193, column: 45, scope: !2336)
!2338 = !DILocation(line: 193, column: 37, scope: !2336)
!2339 = !DILocation(line: 193, column: 35, scope: !2336)
!2340 = !DILocation(line: 193, column: 17, scope: !2332)
!2341 = !DILocalVariable(name: "k", scope: !2342, file: !66, line: 194, type: !87)
!2342 = distinct !DILexicalBlock(scope: !2343, file: !66, line: 194, column: 21)
!2343 = distinct !DILexicalBlock(scope: !2336, file: !66, line: 193, column: 54)
!2344 = !DILocation(line: 194, column: 30, scope: !2342)
!2345 = !DILocation(line: 194, column: 26, scope: !2342)
!2346 = !DILocation(line: 194, column: 37, scope: !2347)
!2347 = distinct !DILexicalBlock(scope: !2342, file: !66, line: 194, column: 21)
!2348 = !DILocation(line: 194, column: 41, scope: !2347)
!2349 = !DILocation(line: 194, column: 39, scope: !2347)
!2350 = !DILocation(line: 194, column: 21, scope: !2342)
!2351 = !DILocation(line: 196, column: 81, scope: !2352)
!2352 = distinct !DILexicalBlock(scope: !2347, file: !66, line: 195, column: 21)
!2353 = !DILocation(line: 196, column: 84, scope: !2352)
!2354 = !DILocation(line: 196, column: 88, scope: !2352)
!2355 = !DILocation(line: 196, column: 90, scope: !2352)
!2356 = !DILocation(line: 196, column: 89, scope: !2352)
!2357 = !DILocation(line: 196, column: 86, scope: !2352)
!2358 = !DILocation(line: 196, column: 106, scope: !2352)
!2359 = !DILocation(line: 196, column: 103, scope: !2352)
!2360 = !DILocation(line: 196, column: 35, scope: !2352)
!2361 = !DILocation(line: 196, column: 27, scope: !2352)
!2362 = !DILocation(line: 196, column: 40, scope: !2352)
!2363 = !DILocation(line: 196, column: 38, scope: !2352)
!2364 = !DILocation(line: 196, column: 44, scope: !2352)
!2365 = !DILocation(line: 196, column: 42, scope: !2352)
!2366 = !DILocation(line: 196, column: 49, scope: !2352)
!2367 = !DILocation(line: 196, column: 53, scope: !2352)
!2368 = !DILocation(line: 196, column: 51, scope: !2352)
!2369 = !DILocation(line: 196, column: 69, scope: !2352)
!2370 = !DILocation(line: 196, column: 68, scope: !2352)
!2371 = !DILocation(line: 196, column: 46, scope: !2352)
!2372 = !DILocation(line: 196, column: 25, scope: !2352)
!2373 = !DILocation(line: 196, column: 78, scope: !2352)
!2374 = !DILocation(line: 197, column: 28, scope: !2375)
!2375 = distinct !DILexicalBlock(scope: !2352, file: !66, line: 197, column: 28)
!2376 = !DILocation(line: 197, column: 42, scope: !2375)
!2377 = !DILocation(line: 198, column: 89, scope: !2378)
!2378 = distinct !DILexicalBlock(scope: !2375, file: !66, line: 197, column: 46)
!2379 = !DILocation(line: 198, column: 92, scope: !2378)
!2380 = !DILocation(line: 198, column: 96, scope: !2378)
!2381 = !DILocation(line: 198, column: 98, scope: !2378)
!2382 = !DILocation(line: 198, column: 97, scope: !2378)
!2383 = !DILocation(line: 198, column: 94, scope: !2378)
!2384 = !DILocation(line: 198, column: 118, scope: !2378)
!2385 = !DILocation(line: 198, column: 117, scope: !2378)
!2386 = !DILocation(line: 198, column: 111, scope: !2378)
!2387 = !DILocation(line: 198, column: 39, scope: !2378)
!2388 = !DILocation(line: 198, column: 31, scope: !2378)
!2389 = !DILocation(line: 198, column: 44, scope: !2378)
!2390 = !DILocation(line: 198, column: 42, scope: !2378)
!2391 = !DILocation(line: 198, column: 48, scope: !2378)
!2392 = !DILocation(line: 198, column: 46, scope: !2378)
!2393 = !DILocation(line: 198, column: 53, scope: !2378)
!2394 = !DILocation(line: 198, column: 57, scope: !2378)
!2395 = !DILocation(line: 198, column: 55, scope: !2378)
!2396 = !DILocation(line: 198, column: 72, scope: !2378)
!2397 = !DILocation(line: 198, column: 77, scope: !2378)
!2398 = !DILocation(line: 198, column: 76, scope: !2378)
!2399 = !DILocation(line: 198, column: 50, scope: !2378)
!2400 = !DILocation(line: 198, column: 29, scope: !2378)
!2401 = !DILocation(line: 198, column: 86, scope: !2378)
!2402 = !DILocation(line: 199, column: 25, scope: !2378)
!2403 = !DILocation(line: 200, column: 21, scope: !2352)
!2404 = !DILocation(line: 194, column: 55, scope: !2347)
!2405 = !DILocation(line: 194, column: 21, scope: !2347)
!2406 = distinct !{!2406, !2350, !2407, !148}
!2407 = !DILocation(line: 200, column: 21, scope: !2342)
!2408 = !DILocation(line: 201, column: 17, scope: !2343)
!2409 = !DILocation(line: 193, column: 50, scope: !2336)
!2410 = !DILocation(line: 193, column: 17, scope: !2336)
!2411 = distinct !{!2411, !2340, !2412, !148}
!2412 = !DILocation(line: 201, column: 17, scope: !2332)
!2413 = !DILocation(line: 202, column: 13, scope: !2322)
!2414 = !DILocation(line: 204, column: 27, scope: !2226)
!2415 = !DILocation(line: 205, column: 16, scope: !2416)
!2416 = distinct !DILexicalBlock(scope: !2226, file: !66, line: 205, column: 16)
!2417 = !DILocation(line: 205, column: 30, scope: !2416)
!2418 = !DILocation(line: 206, column: 32, scope: !2419)
!2419 = distinct !DILexicalBlock(scope: !2416, file: !66, line: 205, column: 36)
!2420 = !DILocation(line: 207, column: 31, scope: !2419)
!2421 = !DILocation(line: 208, column: 13, scope: !2419)
!2422 = !DILocation(line: 209, column: 9, scope: !2226)
!2423 = !DILocation(line: 178, column: 46, scope: !2221)
!2424 = !DILocation(line: 178, column: 9, scope: !2221)
!2425 = distinct !{!2425, !2224, !2426, !148}
!2426 = !DILocation(line: 209, column: 9, scope: !2213)
!2427 = !DILocation(line: 210, column: 5, scope: !2214)
!2428 = !DILocation(line: 177, column: 42, scope: !2206)
!2429 = !DILocation(line: 177, column: 5, scope: !2206)
!2430 = distinct !{!2430, !2211, !2431, !148}
!2431 = !DILocation(line: 210, column: 5, scope: !2202)
!2432 = !DILocalVariable(name: "c", scope: !2433, file: !66, line: 212, type: !58)
!2433 = distinct !DILexicalBlock(scope: !2122, file: !66, line: 212, column: 5)
!2434 = !DILocation(line: 212, column: 17, scope: !2433)
!2435 = !DILocation(line: 212, column: 10, scope: !2433)
!2436 = !DILocation(line: 212, column: 24, scope: !2437)
!2437 = distinct !DILexicalBlock(scope: !2433, file: !66, line: 212, column: 5)
!2438 = !DILocation(line: 212, column: 28, scope: !2437)
!2439 = !DILocation(line: 212, column: 46, scope: !2437)
!2440 = !DILocation(line: 212, column: 38, scope: !2437)
!2441 = !DILocation(line: 212, column: 60, scope: !2437)
!2442 = !DILocation(line: 212, column: 52, scope: !2437)
!2443 = !DILocation(line: 212, column: 62, scope: !2437)
!2444 = !DILocation(line: 212, column: 74, scope: !2437)
!2445 = !DILocation(line: 212, column: 66, scope: !2437)
!2446 = !DILocation(line: 212, column: 65, scope: !2437)
!2447 = !DILocation(line: 212, column: 76, scope: !2437)
!2448 = !DILocation(line: 212, column: 49, scope: !2437)
!2449 = !DILocation(line: 212, column: 79, scope: !2437)
!2450 = !DILocation(line: 212, column: 83, scope: !2437)
!2451 = !DILocation(line: 212, column: 35, scope: !2437)
!2452 = !DILocation(line: 212, column: 26, scope: !2437)
!2453 = !DILocation(line: 212, column: 5, scope: !2433)
!2454 = !DILocation(line: 214, column: 33, scope: !2455)
!2455 = distinct !DILexicalBlock(scope: !2437, file: !66, line: 213, column: 5)
!2456 = !DILocation(line: 214, column: 37, scope: !2455)
!2457 = !DILocation(line: 214, column: 35, scope: !2455)
!2458 = !DILocation(line: 214, column: 9, scope: !2455)
!2459 = !DILocation(line: 215, column: 5, scope: !2455)
!2460 = !DILocation(line: 212, column: 91, scope: !2437)
!2461 = !DILocation(line: 212, column: 5, scope: !2437)
!2462 = distinct !{!2462, !2453, !2463, !148}
!2463 = !DILocation(line: 215, column: 5, scope: !2433)
!2464 = !DILocalVariable(name: "tab", scope: !2122, file: !66, line: 217, type: !2465)
!2465 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 128, elements: !2466)
!2466 = !{!2467}
!2467 = !DISubrange(count: 16)
!2468 = !DILocation(line: 217, column: 19, scope: !2122)
!2469 = !DILocalVariable(name: "i", scope: !2470, file: !66, line: 218, type: !58)
!2470 = distinct !DILexicalBlock(scope: !2122, file: !66, line: 218, column: 5)
!2471 = !DILocation(line: 218, column: 17, scope: !2470)
!2472 = !DILocation(line: 218, column: 10, scope: !2470)
!2473 = !DILocation(line: 218, column: 24, scope: !2474)
!2474 = distinct !DILexicalBlock(scope: !2470, file: !66, line: 218, column: 5)
!2475 = !DILocation(line: 218, column: 26, scope: !2474)
!2476 = !DILocation(line: 218, column: 5, scope: !2470)
!2477 = !DILocation(line: 220, column: 41, scope: !2478)
!2478 = distinct !DILexicalBlock(scope: !2474, file: !66, line: 219, column: 5)
!2479 = !DILocation(line: 220, column: 28, scope: !2478)
!2480 = !DILocation(line: 220, column: 44, scope: !2478)
!2481 = !DILocation(line: 220, column: 22, scope: !2478)
!2482 = !DILocation(line: 220, column: 15, scope: !2478)
!2483 = !DILocation(line: 220, column: 14, scope: !2478)
!2484 = !DILocation(line: 220, column: 9, scope: !2478)
!2485 = !DILocation(line: 220, column: 20, scope: !2478)
!2486 = !DILocation(line: 221, column: 41, scope: !2478)
!2487 = !DILocation(line: 221, column: 28, scope: !2478)
!2488 = !DILocation(line: 221, column: 44, scope: !2478)
!2489 = !DILocation(line: 221, column: 22, scope: !2478)
!2490 = !DILocation(line: 221, column: 15, scope: !2478)
!2491 = !DILocation(line: 221, column: 14, scope: !2478)
!2492 = !DILocation(line: 221, column: 16, scope: !2478)
!2493 = !DILocation(line: 221, column: 9, scope: !2478)
!2494 = !DILocation(line: 221, column: 20, scope: !2478)
!2495 = !DILocation(line: 222, column: 41, scope: !2478)
!2496 = !DILocation(line: 222, column: 28, scope: !2478)
!2497 = !DILocation(line: 222, column: 44, scope: !2478)
!2498 = !DILocation(line: 222, column: 22, scope: !2478)
!2499 = !DILocation(line: 222, column: 15, scope: !2478)
!2500 = !DILocation(line: 222, column: 14, scope: !2478)
!2501 = !DILocation(line: 222, column: 16, scope: !2478)
!2502 = !DILocation(line: 222, column: 9, scope: !2478)
!2503 = !DILocation(line: 222, column: 20, scope: !2478)
!2504 = !DILocation(line: 223, column: 41, scope: !2478)
!2505 = !DILocation(line: 223, column: 28, scope: !2478)
!2506 = !DILocation(line: 223, column: 44, scope: !2478)
!2507 = !DILocation(line: 223, column: 22, scope: !2478)
!2508 = !DILocation(line: 223, column: 15, scope: !2478)
!2509 = !DILocation(line: 223, column: 14, scope: !2478)
!2510 = !DILocation(line: 223, column: 16, scope: !2478)
!2511 = !DILocation(line: 223, column: 9, scope: !2478)
!2512 = !DILocation(line: 223, column: 20, scope: !2478)
!2513 = !DILocation(line: 224, column: 5, scope: !2478)
!2514 = !DILocation(line: 218, column: 41, scope: !2474)
!2515 = !DILocation(line: 218, column: 5, scope: !2474)
!2516 = distinct !{!2516, !2476, !2517, !148}
!2517 = !DILocation(line: 224, column: 5, scope: !2470)
!2518 = !DILocalVariable(name: "low_bit_in_nibble", scope: !2122, file: !66, line: 226, type: !53)
!2519 = !DILocation(line: 226, column: 14, scope: !2122)
!2520 = !DILocalVariable(name: "c", scope: !2521, file: !66, line: 228, type: !58)
!2521 = distinct !DILexicalBlock(scope: !2122, file: !66, line: 228, column: 5)
!2522 = !DILocation(line: 228, column: 17, scope: !2521)
!2523 = !DILocation(line: 228, column: 10, scope: !2521)
!2524 = !DILocation(line: 228, column: 24, scope: !2525)
!2525 = distinct !DILexicalBlock(scope: !2521, file: !66, line: 228, column: 5)
!2526 = !DILocation(line: 228, column: 28, scope: !2525)
!2527 = !DILocation(line: 228, column: 26, scope: !2525)
!2528 = !DILocation(line: 228, column: 5, scope: !2521)
!2529 = !DILocalVariable(name: "r", scope: !2530, file: !66, line: 230, type: !87)
!2530 = distinct !DILexicalBlock(scope: !2531, file: !66, line: 230, column: 9)
!2531 = distinct !DILexicalBlock(scope: !2525, file: !66, line: 229, column: 5)
!2532 = !DILocation(line: 230, column: 18, scope: !2530)
!2533 = !DILocation(line: 230, column: 30, scope: !2530)
!2534 = !DILocation(line: 230, column: 22, scope: !2530)
!2535 = !DILocation(line: 230, column: 14, scope: !2530)
!2536 = !DILocation(line: 230, column: 34, scope: !2537)
!2537 = distinct !DILexicalBlock(scope: !2530, file: !66, line: 230, column: 9)
!2538 = !DILocation(line: 230, column: 46, scope: !2537)
!2539 = !DILocation(line: 230, column: 38, scope: !2537)
!2540 = !DILocation(line: 230, column: 60, scope: !2537)
!2541 = !DILocation(line: 230, column: 52, scope: !2537)
!2542 = !DILocation(line: 230, column: 62, scope: !2537)
!2543 = !DILocation(line: 230, column: 74, scope: !2537)
!2544 = !DILocation(line: 230, column: 66, scope: !2537)
!2545 = !DILocation(line: 230, column: 65, scope: !2537)
!2546 = !DILocation(line: 230, column: 76, scope: !2537)
!2547 = !DILocation(line: 230, column: 49, scope: !2537)
!2548 = !DILocation(line: 230, column: 36, scope: !2537)
!2549 = !DILocation(line: 230, column: 9, scope: !2530)
!2550 = !DILocalVariable(name: "pos", scope: !2551, file: !66, line: 232, type: !58)
!2551 = distinct !DILexicalBlock(scope: !2537, file: !66, line: 231, column: 9)
!2552 = !DILocation(line: 232, column: 20, scope: !2551)
!2553 = !DILocation(line: 232, column: 27, scope: !2551)
!2554 = !DILocation(line: 232, column: 28, scope: !2551)
!2555 = !DILocation(line: 232, column: 33, scope: !2551)
!2556 = !DILocation(line: 232, column: 32, scope: !2551)
!2557 = !DILocation(line: 232, column: 43, scope: !2551)
!2558 = !DILocation(line: 232, column: 41, scope: !2551)
!2559 = !DILocation(line: 232, column: 48, scope: !2551)
!2560 = !DILocation(line: 232, column: 49, scope: !2551)
!2561 = !DILocation(line: 232, column: 45, scope: !2551)
!2562 = !DILocalVariable(name: "t0", scope: !2551, file: !66, line: 233, type: !53)
!2563 = !DILocation(line: 233, column: 22, scope: !2551)
!2564 = !DILocation(line: 233, column: 30, scope: !2551)
!2565 = !DILocation(line: 233, column: 28, scope: !2551)
!2566 = !DILocation(line: 233, column: 43, scope: !2551)
!2567 = !DILocation(line: 233, column: 41, scope: !2551)
!2568 = !DILocalVariable(name: "t1", scope: !2551, file: !66, line: 234, type: !53)
!2569 = !DILocation(line: 234, column: 22, scope: !2551)
!2570 = !DILocation(line: 234, column: 30, scope: !2551)
!2571 = !DILocation(line: 234, column: 28, scope: !2551)
!2572 = !DILocation(line: 234, column: 35, scope: !2551)
!2573 = !DILocation(line: 234, column: 43, scope: !2551)
!2574 = !DILocation(line: 234, column: 41, scope: !2551)
!2575 = !DILocalVariable(name: "t2", scope: !2551, file: !66, line: 235, type: !53)
!2576 = !DILocation(line: 235, column: 22, scope: !2551)
!2577 = !DILocation(line: 235, column: 30, scope: !2551)
!2578 = !DILocation(line: 235, column: 28, scope: !2551)
!2579 = !DILocation(line: 235, column: 35, scope: !2551)
!2580 = !DILocation(line: 235, column: 43, scope: !2551)
!2581 = !DILocation(line: 235, column: 41, scope: !2551)
!2582 = !DILocalVariable(name: "t3", scope: !2551, file: !66, line: 236, type: !53)
!2583 = !DILocation(line: 236, column: 22, scope: !2551)
!2584 = !DILocation(line: 236, column: 30, scope: !2551)
!2585 = !DILocation(line: 236, column: 28, scope: !2551)
!2586 = !DILocation(line: 236, column: 35, scope: !2551)
!2587 = !DILocation(line: 236, column: 43, scope: !2551)
!2588 = !DILocation(line: 236, column: 41, scope: !2551)
!2589 = !DILocalVariable(name: "t", scope: !2590, file: !66, line: 237, type: !58)
!2590 = distinct !DILexicalBlock(scope: !2551, file: !66, line: 237, column: 13)
!2591 = !DILocation(line: 237, column: 25, scope: !2590)
!2592 = !DILocation(line: 237, column: 18, scope: !2590)
!2593 = !DILocation(line: 237, column: 32, scope: !2594)
!2594 = distinct !DILexicalBlock(scope: !2590, file: !66, line: 237, column: 13)
!2595 = !DILocation(line: 237, column: 34, scope: !2594)
!2596 = !DILocation(line: 237, column: 13, scope: !2590)
!2597 = !DILocation(line: 239, column: 81, scope: !2598)
!2598 = distinct !DILexicalBlock(scope: !2594, file: !66, line: 238, column: 13)
!2599 = !DILocation(line: 239, column: 90, scope: !2598)
!2600 = !DILocation(line: 239, column: 89, scope: !2598)
!2601 = !DILocation(line: 239, column: 91, scope: !2598)
!2602 = !DILocation(line: 239, column: 84, scope: !2598)
!2603 = !DILocation(line: 239, column: 83, scope: !2598)
!2604 = !DILocation(line: 239, column: 97, scope: !2598)
!2605 = !DILocation(line: 239, column: 106, scope: !2598)
!2606 = !DILocation(line: 239, column: 105, scope: !2598)
!2607 = !DILocation(line: 239, column: 107, scope: !2598)
!2608 = !DILocation(line: 239, column: 100, scope: !2598)
!2609 = !DILocation(line: 239, column: 99, scope: !2598)
!2610 = !DILocation(line: 239, column: 95, scope: !2598)
!2611 = !DILocation(line: 239, column: 113, scope: !2598)
!2612 = !DILocation(line: 239, column: 122, scope: !2598)
!2613 = !DILocation(line: 239, column: 121, scope: !2598)
!2614 = !DILocation(line: 239, column: 123, scope: !2598)
!2615 = !DILocation(line: 239, column: 116, scope: !2598)
!2616 = !DILocation(line: 239, column: 115, scope: !2598)
!2617 = !DILocation(line: 239, column: 111, scope: !2598)
!2618 = !DILocation(line: 239, column: 129, scope: !2598)
!2619 = !DILocation(line: 239, column: 138, scope: !2598)
!2620 = !DILocation(line: 239, column: 137, scope: !2598)
!2621 = !DILocation(line: 239, column: 139, scope: !2598)
!2622 = !DILocation(line: 239, column: 132, scope: !2598)
!2623 = !DILocation(line: 239, column: 131, scope: !2598)
!2624 = !DILocation(line: 239, column: 127, scope: !2598)
!2625 = !DILocation(line: 239, column: 21, scope: !2598)
!2626 = !DILocation(line: 239, column: 23, scope: !2598)
!2627 = !DILocation(line: 239, column: 22, scope: !2598)
!2628 = !DILocation(line: 239, column: 33, scope: !2598)
!2629 = !DILocation(line: 239, column: 25, scope: !2598)
!2630 = !DILocation(line: 239, column: 24, scope: !2598)
!2631 = !DILocation(line: 239, column: 36, scope: !2598)
!2632 = !DILocation(line: 239, column: 41, scope: !2598)
!2633 = !DILocation(line: 239, column: 40, scope: !2598)
!2634 = !DILocation(line: 239, column: 51, scope: !2598)
!2635 = !DILocation(line: 239, column: 49, scope: !2598)
!2636 = !DILocation(line: 239, column: 57, scope: !2598)
!2637 = !DILocation(line: 239, column: 59, scope: !2598)
!2638 = !DILocation(line: 239, column: 58, scope: !2598)
!2639 = !DILocation(line: 239, column: 69, scope: !2598)
!2640 = !DILocation(line: 239, column: 61, scope: !2598)
!2641 = !DILocation(line: 239, column: 60, scope: !2598)
!2642 = !DILocation(line: 239, column: 72, scope: !2598)
!2643 = !DILocation(line: 239, column: 53, scope: !2598)
!2644 = !DILocation(line: 239, column: 17, scope: !2598)
!2645 = !DILocation(line: 239, column: 78, scope: !2598)
!2646 = !DILocation(line: 240, column: 13, scope: !2598)
!2647 = !DILocation(line: 237, column: 49, scope: !2594)
!2648 = !DILocation(line: 237, column: 13, scope: !2594)
!2649 = distinct !{!2649, !2596, !2650, !148}
!2650 = !DILocation(line: 240, column: 13, scope: !2590)
!2651 = !DILocation(line: 241, column: 9, scope: !2551)
!2652 = !DILocation(line: 230, column: 82, scope: !2537)
!2653 = !DILocation(line: 230, column: 9, scope: !2537)
!2654 = distinct !{!2654, !2549, !2655, !148}
!2655 = !DILocation(line: 241, column: 9, scope: !2530)
!2656 = !DILocation(line: 242, column: 5, scope: !2531)
!2657 = !DILocation(line: 228, column: 38, scope: !2525)
!2658 = !DILocation(line: 228, column: 5, scope: !2525)
!2659 = distinct !{!2659, !2528, !2660, !148}
!2660 = !DILocation(line: 242, column: 5, scope: !2521)
!2661 = !DILocalVariable(name: "r", scope: !2662, file: !66, line: 250, type: !87)
!2662 = distinct !DILexicalBlock(scope: !2122, file: !66, line: 250, column: 5)
!2663 = !DILocation(line: 250, column: 14, scope: !2662)
!2664 = !DILocation(line: 250, column: 10, scope: !2662)
!2665 = !DILocation(line: 250, column: 21, scope: !2666)
!2666 = distinct !DILexicalBlock(scope: !2662, file: !66, line: 250, column: 5)
!2667 = !DILocation(line: 250, column: 33, scope: !2666)
!2668 = !DILocation(line: 250, column: 25, scope: !2666)
!2669 = !DILocation(line: 250, column: 23, scope: !2666)
!2670 = !DILocation(line: 250, column: 5, scope: !2662)
!2671 = !DILocalVariable(name: "c", scope: !2672, file: !66, line: 252, type: !87)
!2672 = distinct !DILexicalBlock(scope: !2673, file: !66, line: 252, column: 9)
!2673 = distinct !DILexicalBlock(scope: !2666, file: !66, line: 251, column: 5)
!2674 = !DILocation(line: 252, column: 18, scope: !2672)
!2675 = !DILocation(line: 252, column: 14, scope: !2672)
!2676 = !DILocation(line: 252, column: 25, scope: !2677)
!2677 = distinct !DILexicalBlock(scope: !2672, file: !66, line: 252, column: 9)
!2678 = !DILocation(line: 252, column: 42, scope: !2677)
!2679 = !DILocation(line: 252, column: 29, scope: !2677)
!2680 = !DILocation(line: 252, column: 44, scope: !2677)
!2681 = !DILocation(line: 252, column: 27, scope: !2677)
!2682 = !DILocation(line: 252, column: 9, scope: !2672)
!2683 = !DILocalVariable(name: "i", scope: !2684, file: !66, line: 254, type: !87)
!2684 = distinct !DILexicalBlock(scope: !2685, file: !66, line: 254, column: 13)
!2685 = distinct !DILexicalBlock(scope: !2677, file: !66, line: 253, column: 9)
!2686 = !DILocation(line: 254, column: 22, scope: !2684)
!2687 = !DILocation(line: 254, column: 18, scope: !2684)
!2688 = !DILocation(line: 254, column: 29, scope: !2689)
!2689 = distinct !DILexicalBlock(scope: !2684, file: !66, line: 254, column: 13)
!2690 = !DILocation(line: 254, column: 33, scope: !2689)
!2691 = !DILocation(line: 254, column: 31, scope: !2689)
!2692 = !DILocation(line: 254, column: 45, scope: !2689)
!2693 = !DILocation(line: 254, column: 37, scope: !2689)
!2694 = !DILocation(line: 254, column: 35, scope: !2689)
!2695 = !DILocation(line: 254, column: 13, scope: !2684)
!2696 = !DILocation(line: 256, column: 46, scope: !2697)
!2697 = distinct !DILexicalBlock(scope: !2689, file: !66, line: 255, column: 13)
!2698 = !DILocation(line: 256, column: 48, scope: !2697)
!2699 = !DILocation(line: 256, column: 47, scope: !2697)
!2700 = !DILocation(line: 256, column: 55, scope: !2697)
!2701 = !DILocation(line: 256, column: 61, scope: !2697)
!2702 = !DILocation(line: 256, column: 59, scope: !2697)
!2703 = !DILocation(line: 256, column: 65, scope: !2697)
!2704 = !DILocation(line: 256, column: 63, scope: !2697)
!2705 = !DILocation(line: 256, column: 44, scope: !2697)
!2706 = !DILocation(line: 256, column: 69, scope: !2697)
!2707 = !DILocation(line: 256, column: 90, scope: !2697)
!2708 = !DILocation(line: 256, column: 77, scope: !2697)
!2709 = !DILocation(line: 256, column: 94, scope: !2697)
!2710 = !DILocation(line: 256, column: 96, scope: !2697)
!2711 = !DILocation(line: 256, column: 95, scope: !2697)
!2712 = !DILocation(line: 256, column: 92, scope: !2697)
!2713 = !DILocation(line: 256, column: 75, scope: !2697)
!2714 = !DILocation(line: 256, column: 101, scope: !2697)
!2715 = !DILocation(line: 256, column: 99, scope: !2697)
!2716 = !DILocation(line: 256, column: 130, scope: !2697)
!2717 = !DILocation(line: 256, column: 117, scope: !2697)
!2718 = !DILocation(line: 256, column: 132, scope: !2697)
!2719 = !DILocation(line: 256, column: 135, scope: !2697)
!2720 = !DILocation(line: 256, column: 134, scope: !2697)
!2721 = !DILocation(line: 256, column: 104, scope: !2697)
!2722 = !DILocation(line: 256, column: 17, scope: !2697)
!2723 = !DILocation(line: 257, column: 13, scope: !2697)
!2724 = !DILocation(line: 254, column: 50, scope: !2689)
!2725 = !DILocation(line: 254, column: 13, scope: !2689)
!2726 = distinct !{!2726, !2695, !2727, !148}
!2727 = !DILocation(line: 257, column: 13, scope: !2684)
!2728 = !DILocation(line: 258, column: 9, scope: !2685)
!2729 = !DILocation(line: 252, column: 50, scope: !2677)
!2730 = !DILocation(line: 252, column: 9, scope: !2677)
!2731 = distinct !{!2731, !2682, !2732, !148}
!2732 = !DILocation(line: 258, column: 9, scope: !2672)
!2733 = !DILocation(line: 259, column: 5, scope: !2673)
!2734 = !DILocation(line: 250, column: 38, scope: !2666)
!2735 = !DILocation(line: 250, column: 5, scope: !2666)
!2736 = distinct !{!2736, !2670, !2737, !148}
!2737 = !DILocation(line: 259, column: 5, scope: !2662)
!2738 = !DILocation(line: 260, column: 1, scope: !2122)
!2739 = distinct !DISubprogram(name: "mat_mul", scope: !899, file: !899, line: 78, type: !2740, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !69)
!2740 = !DISubroutineType(types: !2741)
!2741 = !{null, !102, !102, !61, !87, !87, !87}
!2742 = !DILocalVariable(name: "a", arg: 1, scope: !2739, file: !899, line: 78, type: !102)
!2743 = !DILocation(line: 78, column: 49, scope: !2739)
!2744 = !DILocalVariable(name: "b", arg: 2, scope: !2739, file: !899, line: 78, type: !102)
!2745 = !DILocation(line: 78, column: 73, scope: !2739)
!2746 = !DILocalVariable(name: "c", arg: 3, scope: !2739, file: !899, line: 79, type: !61)
!2747 = !DILocation(line: 79, column: 36, scope: !2739)
!2748 = !DILocalVariable(name: "colrow_ab", arg: 4, scope: !2739, file: !899, line: 79, type: !87)
!2749 = !DILocation(line: 79, column: 43, scope: !2739)
!2750 = !DILocalVariable(name: "row_a", arg: 5, scope: !2739, file: !899, line: 79, type: !87)
!2751 = !DILocation(line: 79, column: 58, scope: !2739)
!2752 = !DILocalVariable(name: "col_b", arg: 6, scope: !2739, file: !899, line: 79, type: !87)
!2753 = !DILocation(line: 79, column: 69, scope: !2739)
!2754 = !DILocalVariable(name: "i", scope: !2755, file: !899, line: 80, type: !87)
!2755 = distinct !DILexicalBlock(scope: !2739, file: !899, line: 80, column: 5)
!2756 = !DILocation(line: 80, column: 14, scope: !2755)
!2757 = !DILocation(line: 80, column: 10, scope: !2755)
!2758 = !DILocation(line: 80, column: 21, scope: !2759)
!2759 = distinct !DILexicalBlock(scope: !2755, file: !899, line: 80, column: 5)
!2760 = !DILocation(line: 80, column: 25, scope: !2759)
!2761 = !DILocation(line: 80, column: 23, scope: !2759)
!2762 = !DILocation(line: 80, column: 5, scope: !2755)
!2763 = !DILocalVariable(name: "j", scope: !2764, file: !899, line: 81, type: !87)
!2764 = distinct !DILexicalBlock(scope: !2765, file: !899, line: 81, column: 9)
!2765 = distinct !DILexicalBlock(scope: !2759, file: !899, line: 80, column: 53)
!2766 = !DILocation(line: 81, column: 18, scope: !2764)
!2767 = !DILocation(line: 81, column: 14, scope: !2764)
!2768 = !DILocation(line: 81, column: 25, scope: !2769)
!2769 = distinct !DILexicalBlock(scope: !2764, file: !899, line: 81, column: 9)
!2770 = !DILocation(line: 81, column: 29, scope: !2769)
!2771 = !DILocation(line: 81, column: 27, scope: !2769)
!2772 = !DILocation(line: 81, column: 9, scope: !2764)
!2773 = !DILocation(line: 82, column: 26, scope: !2774)
!2774 = distinct !DILexicalBlock(scope: !2769, file: !899, line: 81, column: 46)
!2775 = !DILocation(line: 82, column: 29, scope: !2774)
!2776 = !DILocation(line: 82, column: 33, scope: !2774)
!2777 = !DILocation(line: 82, column: 31, scope: !2774)
!2778 = !DILocation(line: 82, column: 36, scope: !2774)
!2779 = !DILocation(line: 82, column: 47, scope: !2774)
!2780 = !DILocation(line: 82, column: 18, scope: !2774)
!2781 = !DILocation(line: 82, column: 14, scope: !2774)
!2782 = !DILocation(line: 82, column: 16, scope: !2774)
!2783 = !DILocation(line: 83, column: 9, scope: !2774)
!2784 = !DILocation(line: 81, column: 36, scope: !2769)
!2785 = !DILocation(line: 81, column: 41, scope: !2769)
!2786 = !DILocation(line: 81, column: 9, scope: !2769)
!2787 = distinct !{!2787, !2772, !2788, !148}
!2788 = !DILocation(line: 83, column: 9, scope: !2764)
!2789 = !DILocation(line: 84, column: 5, scope: !2765)
!2790 = !DILocation(line: 80, column: 32, scope: !2759)
!2791 = !DILocation(line: 80, column: 42, scope: !2759)
!2792 = !DILocation(line: 80, column: 39, scope: !2759)
!2793 = !DILocation(line: 80, column: 5, scope: !2759)
!2794 = distinct !{!2794, !2762, !2795, !148}
!2795 = !DILocation(line: 84, column: 5, scope: !2755)
!2796 = !DILocation(line: 85, column: 1, scope: !2739)
!2797 = distinct !DISubprogram(name: "mat_add", scope: !899, file: !899, line: 87, type: !2798, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !69)
!2798 = !DISubroutineType(types: !2799)
!2799 = !{null, !102, !102, !61, !87, !87}
!2800 = !DILocalVariable(name: "a", arg: 1, scope: !2797, file: !899, line: 87, type: !102)
!2801 = !DILocation(line: 87, column: 49, scope: !2797)
!2802 = !DILocalVariable(name: "b", arg: 2, scope: !2797, file: !899, line: 87, type: !102)
!2803 = !DILocation(line: 87, column: 73, scope: !2797)
!2804 = !DILocalVariable(name: "c", arg: 3, scope: !2797, file: !899, line: 88, type: !61)
!2805 = !DILocation(line: 88, column: 36, scope: !2797)
!2806 = !DILocalVariable(name: "m", arg: 4, scope: !2797, file: !899, line: 88, type: !87)
!2807 = !DILocation(line: 88, column: 43, scope: !2797)
!2808 = !DILocalVariable(name: "n", arg: 5, scope: !2797, file: !899, line: 88, type: !87)
!2809 = !DILocation(line: 88, column: 50, scope: !2797)
!2810 = !DILocalVariable(name: "i", scope: !2811, file: !899, line: 89, type: !87)
!2811 = distinct !DILexicalBlock(scope: !2797, file: !899, line: 89, column: 5)
!2812 = !DILocation(line: 89, column: 14, scope: !2811)
!2813 = !DILocation(line: 89, column: 10, scope: !2811)
!2814 = !DILocation(line: 89, column: 21, scope: !2815)
!2815 = distinct !DILexicalBlock(scope: !2811, file: !899, line: 89, column: 5)
!2816 = !DILocation(line: 89, column: 25, scope: !2815)
!2817 = !DILocation(line: 89, column: 23, scope: !2815)
!2818 = !DILocation(line: 89, column: 5, scope: !2811)
!2819 = !DILocalVariable(name: "j", scope: !2820, file: !899, line: 90, type: !87)
!2820 = distinct !DILexicalBlock(scope: !2821, file: !899, line: 90, column: 9)
!2821 = distinct !DILexicalBlock(scope: !2815, file: !899, line: 89, column: 33)
!2822 = !DILocation(line: 90, column: 18, scope: !2820)
!2823 = !DILocation(line: 90, column: 14, scope: !2820)
!2824 = !DILocation(line: 90, column: 25, scope: !2825)
!2825 = distinct !DILexicalBlock(scope: !2820, file: !899, line: 90, column: 9)
!2826 = !DILocation(line: 90, column: 29, scope: !2825)
!2827 = !DILocation(line: 90, column: 27, scope: !2825)
!2828 = !DILocation(line: 90, column: 9, scope: !2820)
!2829 = !DILocation(line: 91, column: 40, scope: !2830)
!2830 = distinct !DILexicalBlock(scope: !2825, file: !899, line: 90, column: 37)
!2831 = !DILocation(line: 91, column: 44, scope: !2830)
!2832 = !DILocation(line: 91, column: 48, scope: !2830)
!2833 = !DILocation(line: 91, column: 46, scope: !2830)
!2834 = !DILocation(line: 91, column: 38, scope: !2830)
!2835 = !DILocation(line: 91, column: 52, scope: !2830)
!2836 = !DILocation(line: 91, column: 58, scope: !2830)
!2837 = !DILocation(line: 91, column: 62, scope: !2830)
!2838 = !DILocation(line: 91, column: 66, scope: !2830)
!2839 = !DILocation(line: 91, column: 64, scope: !2830)
!2840 = !DILocation(line: 91, column: 56, scope: !2830)
!2841 = !DILocation(line: 91, column: 70, scope: !2830)
!2842 = !DILocation(line: 91, column: 32, scope: !2830)
!2843 = !DILocation(line: 91, column: 15, scope: !2830)
!2844 = !DILocation(line: 91, column: 19, scope: !2830)
!2845 = !DILocation(line: 91, column: 23, scope: !2830)
!2846 = !DILocation(line: 91, column: 21, scope: !2830)
!2847 = !DILocation(line: 91, column: 13, scope: !2830)
!2848 = !DILocation(line: 91, column: 27, scope: !2830)
!2849 = !DILocation(line: 91, column: 30, scope: !2830)
!2850 = !DILocation(line: 92, column: 9, scope: !2830)
!2851 = !DILocation(line: 90, column: 32, scope: !2825)
!2852 = !DILocation(line: 90, column: 9, scope: !2825)
!2853 = distinct !{!2853, !2828, !2854, !148}
!2854 = !DILocation(line: 92, column: 9, scope: !2820)
!2855 = !DILocation(line: 93, column: 5, scope: !2821)
!2856 = !DILocation(line: 89, column: 28, scope: !2815)
!2857 = !DILocation(line: 89, column: 5, scope: !2815)
!2858 = distinct !{!2858, !2818, !2859, !148}
!2859 = !DILocation(line: 93, column: 5, scope: !2811)
!2860 = !DILocation(line: 94, column: 1, scope: !2797)
!2861 = distinct !DISubprogram(name: "encode", scope: !66, file: !66, line: 32, type: !579, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !69)
!2862 = !DILocalVariable(name: "m", arg: 1, scope: !2861, file: !66, line: 32, type: !102)
!2863 = !DILocation(line: 32, column: 41, scope: !2861)
!2864 = !DILocalVariable(name: "menc", arg: 2, scope: !2861, file: !66, line: 32, type: !61)
!2865 = !DILocation(line: 32, column: 59, scope: !2861)
!2866 = !DILocalVariable(name: "mlen", arg: 3, scope: !2861, file: !66, line: 32, type: !87)
!2867 = !DILocation(line: 32, column: 69, scope: !2861)
!2868 = !DILocalVariable(name: "i", scope: !2861, file: !66, line: 33, type: !87)
!2869 = !DILocation(line: 33, column: 9, scope: !2861)
!2870 = !DILocation(line: 34, column: 12, scope: !2871)
!2871 = distinct !DILexicalBlock(scope: !2861, file: !66, line: 34, column: 5)
!2872 = !DILocation(line: 34, column: 10, scope: !2871)
!2873 = !DILocation(line: 34, column: 17, scope: !2874)
!2874 = distinct !DILexicalBlock(scope: !2871, file: !66, line: 34, column: 5)
!2875 = !DILocation(line: 34, column: 21, scope: !2874)
!2876 = !DILocation(line: 34, column: 26, scope: !2874)
!2877 = !DILocation(line: 34, column: 19, scope: !2874)
!2878 = !DILocation(line: 34, column: 5, scope: !2871)
!2879 = !DILocation(line: 35, column: 21, scope: !2880)
!2880 = distinct !DILexicalBlock(scope: !2874, file: !66, line: 34, column: 44)
!2881 = !DILocation(line: 35, column: 20, scope: !2880)
!2882 = !DILocation(line: 35, column: 19, scope: !2880)
!2883 = !DILocation(line: 35, column: 29, scope: !2880)
!2884 = !DILocation(line: 35, column: 27, scope: !2880)
!2885 = !DILocation(line: 35, column: 36, scope: !2880)
!2886 = !DILocation(line: 35, column: 24, scope: !2880)
!2887 = !DILocation(line: 35, column: 9, scope: !2880)
!2888 = !DILocation(line: 35, column: 14, scope: !2880)
!2889 = !DILocation(line: 35, column: 17, scope: !2880)
!2890 = !DILocation(line: 36, column: 5, scope: !2880)
!2891 = !DILocation(line: 34, column: 31, scope: !2874)
!2892 = !DILocation(line: 34, column: 38, scope: !2874)
!2893 = !DILocation(line: 34, column: 5, scope: !2874)
!2894 = distinct !{!2894, !2878, !2895, !148}
!2895 = !DILocation(line: 36, column: 5, scope: !2871)
!2896 = !DILocation(line: 38, column: 9, scope: !2897)
!2897 = distinct !DILexicalBlock(scope: !2861, file: !66, line: 38, column: 9)
!2898 = !DILocation(line: 38, column: 14, scope: !2897)
!2899 = !DILocation(line: 38, column: 18, scope: !2897)
!2900 = !DILocation(line: 39, column: 21, scope: !2901)
!2901 = distinct !DILexicalBlock(scope: !2897, file: !66, line: 38, column: 24)
!2902 = !DILocation(line: 39, column: 20, scope: !2901)
!2903 = !DILocation(line: 39, column: 9, scope: !2901)
!2904 = !DILocation(line: 39, column: 14, scope: !2901)
!2905 = !DILocation(line: 39, column: 17, scope: !2901)
!2906 = !DILocation(line: 40, column: 5, scope: !2901)
!2907 = !DILocation(line: 41, column: 1, scope: !2861)
!2908 = distinct !DISubprogram(name: "add_f", scope: !899, file: !899, line: 42, type: !2909, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !69)
!2909 = !DISubroutineType(types: !2910)
!2910 = !{!51, !51, !51}
!2911 = !DILocalVariable(name: "a", arg: 1, scope: !2908, file: !899, line: 42, type: !51)
!2912 = !DILocation(line: 42, column: 49, scope: !2908)
!2913 = !DILocalVariable(name: "b", arg: 2, scope: !2908, file: !899, line: 42, type: !51)
!2914 = !DILocation(line: 42, column: 66, scope: !2908)
!2915 = !DILocation(line: 43, column: 12, scope: !2908)
!2916 = !DILocation(line: 43, column: 16, scope: !2908)
!2917 = !DILocation(line: 43, column: 14, scope: !2908)
!2918 = !DILocation(line: 43, column: 5, scope: !2908)
!2919 = distinct !DISubprogram(name: "lincomb", scope: !899, file: !899, line: 69, type: !2920, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !69)
!2920 = !DISubroutineType(types: !2921)
!2921 = !{!51, !102, !102, !87, !87}
!2922 = !DILocalVariable(name: "a", arg: 1, scope: !2919, file: !899, line: 69, type: !102)
!2923 = !DILocation(line: 69, column: 58, scope: !2919)
!2924 = !DILocalVariable(name: "b", arg: 2, scope: !2919, file: !899, line: 70, type: !102)
!2925 = !DILocation(line: 70, column: 58, scope: !2919)
!2926 = !DILocalVariable(name: "n", arg: 3, scope: !2919, file: !899, line: 70, type: !87)
!2927 = !DILocation(line: 70, column: 65, scope: !2919)
!2928 = !DILocalVariable(name: "m", arg: 4, scope: !2919, file: !899, line: 70, type: !87)
!2929 = !DILocation(line: 70, column: 72, scope: !2919)
!2930 = !DILocalVariable(name: "ret", scope: !2919, file: !899, line: 71, type: !51)
!2931 = !DILocation(line: 71, column: 19, scope: !2919)
!2932 = !DILocalVariable(name: "i", scope: !2933, file: !899, line: 72, type: !87)
!2933 = distinct !DILexicalBlock(scope: !2919, file: !899, line: 72, column: 5)
!2934 = !DILocation(line: 72, column: 14, scope: !2933)
!2935 = !DILocation(line: 72, column: 10, scope: !2933)
!2936 = !DILocation(line: 72, column: 21, scope: !2937)
!2937 = distinct !DILexicalBlock(scope: !2933, file: !899, line: 72, column: 5)
!2938 = !DILocation(line: 72, column: 25, scope: !2937)
!2939 = !DILocation(line: 72, column: 23, scope: !2937)
!2940 = !DILocation(line: 72, column: 5, scope: !2933)
!2941 = !DILocation(line: 73, column: 27, scope: !2942)
!2942 = distinct !DILexicalBlock(scope: !2937, file: !899, line: 72, column: 41)
!2943 = !DILocation(line: 73, column: 29, scope: !2942)
!2944 = !DILocation(line: 73, column: 34, scope: !2942)
!2945 = !DILocation(line: 73, column: 33, scope: !2942)
!2946 = !DILocation(line: 73, column: 21, scope: !2942)
!2947 = !DILocation(line: 73, column: 38, scope: !2942)
!2948 = !DILocation(line: 73, column: 15, scope: !2942)
!2949 = !DILocation(line: 73, column: 13, scope: !2942)
!2950 = !DILocation(line: 74, column: 5, scope: !2942)
!2951 = !DILocation(line: 72, column: 28, scope: !2937)
!2952 = !DILocation(line: 72, column: 38, scope: !2937)
!2953 = !DILocation(line: 72, column: 35, scope: !2937)
!2954 = !DILocation(line: 72, column: 5, scope: !2937)
!2955 = distinct !{!2955, !2940, !2956, !148}
!2956 = !DILocation(line: 74, column: 5, scope: !2933)
!2957 = !DILocation(line: 75, column: 12, scope: !2919)
!2958 = !DILocation(line: 75, column: 5, scope: !2919)
!2959 = distinct !DISubprogram(name: "mul_f", scope: !899, file: !899, line: 8, type: !2909, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !69)
!2960 = !DILocalVariable(name: "a", arg: 1, scope: !2959, file: !899, line: 8, type: !51)
!2961 = !DILocation(line: 8, column: 49, scope: !2959)
!2962 = !DILocalVariable(name: "b", arg: 2, scope: !2959, file: !899, line: 8, type: !51)
!2963 = !DILocation(line: 8, column: 66, scope: !2959)
!2964 = !DILocalVariable(name: "p", scope: !2959, file: !899, line: 10, type: !51)
!2965 = !DILocation(line: 10, column: 19, scope: !2959)
!2966 = !DILocation(line: 13, column: 10, scope: !2959)
!2967 = !DILocation(line: 13, column: 7, scope: !2959)
!2968 = !DILocation(line: 16, column: 11, scope: !2959)
!2969 = !DILocation(line: 16, column: 13, scope: !2959)
!2970 = !DILocation(line: 16, column: 18, scope: !2959)
!2971 = !DILocation(line: 16, column: 17, scope: !2959)
!2972 = !DILocation(line: 16, column: 10, scope: !2959)
!2973 = !DILocation(line: 16, column: 8, scope: !2959)
!2974 = !DILocation(line: 17, column: 11, scope: !2959)
!2975 = !DILocation(line: 17, column: 13, scope: !2959)
!2976 = !DILocation(line: 17, column: 18, scope: !2959)
!2977 = !DILocation(line: 17, column: 17, scope: !2959)
!2978 = !DILocation(line: 17, column: 7, scope: !2959)
!2979 = !DILocation(line: 18, column: 11, scope: !2959)
!2980 = !DILocation(line: 18, column: 13, scope: !2959)
!2981 = !DILocation(line: 18, column: 18, scope: !2959)
!2982 = !DILocation(line: 18, column: 17, scope: !2959)
!2983 = !DILocation(line: 18, column: 7, scope: !2959)
!2984 = !DILocation(line: 19, column: 11, scope: !2959)
!2985 = !DILocation(line: 19, column: 13, scope: !2959)
!2986 = !DILocation(line: 19, column: 18, scope: !2959)
!2987 = !DILocation(line: 19, column: 17, scope: !2959)
!2988 = !DILocation(line: 19, column: 7, scope: !2959)
!2989 = !DILocalVariable(name: "top_p", scope: !2959, file: !899, line: 22, type: !51)
!2990 = !DILocation(line: 22, column: 19, scope: !2959)
!2991 = !DILocation(line: 22, column: 27, scope: !2959)
!2992 = !DILocation(line: 22, column: 29, scope: !2959)
!2993 = !DILocalVariable(name: "out", scope: !2959, file: !899, line: 23, type: !51)
!2994 = !DILocation(line: 23, column: 19, scope: !2959)
!2995 = !DILocation(line: 23, column: 26, scope: !2959)
!2996 = !DILocation(line: 23, column: 31, scope: !2959)
!2997 = !DILocation(line: 23, column: 37, scope: !2959)
!2998 = !DILocation(line: 23, column: 28, scope: !2959)
!2999 = !DILocation(line: 23, column: 46, scope: !2959)
!3000 = !DILocation(line: 23, column: 52, scope: !2959)
!3001 = !DILocation(line: 23, column: 43, scope: !2959)
!3002 = !DILocation(line: 23, column: 59, scope: !2959)
!3003 = !DILocation(line: 23, column: 25, scope: !2959)
!3004 = !DILocation(line: 24, column: 12, scope: !2959)
!3005 = !DILocation(line: 24, column: 5, scope: !2959)
!3006 = !DILocalVariable(name: "M", arg: 1, scope: !65, file: !66, line: 111, type: !52)
!3007 = !DILocation(line: 111, column: 47, scope: !65)
!3008 = !DILocalVariable(name: "i", scope: !3009, file: !66, line: 117, type: !58)
!3009 = distinct !DILexicalBlock(scope: !65, file: !66, line: 117, column: 5)
!3010 = !DILocation(line: 117, column: 17, scope: !3009)
!3011 = !DILocation(line: 117, column: 10, scope: !3009)
!3012 = !DILocation(line: 117, column: 24, scope: !3013)
!3013 = distinct !DILexicalBlock(scope: !3009, file: !66, line: 117, column: 5)
!3014 = !DILocation(line: 117, column: 26, scope: !3013)
!3015 = !DILocation(line: 117, column: 5, scope: !3009)
!3016 = !DILocalVariable(name: "t", scope: !3017, file: !66, line: 119, type: !53)
!3017 = distinct !DILexicalBlock(scope: !3013, file: !66, line: 118, column: 5)
!3018 = !DILocation(line: 119, column: 18, scope: !3017)
!3019 = !DILocation(line: 119, column: 24, scope: !3017)
!3020 = !DILocation(line: 119, column: 26, scope: !3017)
!3021 = !DILocation(line: 119, column: 29, scope: !3017)
!3022 = !DILocation(line: 119, column: 38, scope: !3017)
!3023 = !DILocation(line: 119, column: 40, scope: !3017)
!3024 = !DILocation(line: 119, column: 41, scope: !3017)
!3025 = !DILocation(line: 119, column: 36, scope: !3017)
!3026 = !DILocation(line: 119, column: 46, scope: !3017)
!3027 = !DILocation(line: 120, column: 19, scope: !3017)
!3028 = !DILocation(line: 120, column: 21, scope: !3017)
!3029 = !DILocation(line: 120, column: 9, scope: !3017)
!3030 = !DILocation(line: 120, column: 11, scope: !3017)
!3031 = !DILocation(line: 120, column: 16, scope: !3017)
!3032 = !DILocation(line: 121, column: 19, scope: !3017)
!3033 = !DILocation(line: 121, column: 9, scope: !3017)
!3034 = !DILocation(line: 121, column: 11, scope: !3017)
!3035 = !DILocation(line: 121, column: 12, scope: !3017)
!3036 = !DILocation(line: 121, column: 16, scope: !3017)
!3037 = !DILocation(line: 122, column: 5, scope: !3017)
!3038 = !DILocation(line: 117, column: 33, scope: !3013)
!3039 = !DILocation(line: 117, column: 5, scope: !3013)
!3040 = distinct !{!3040, !3015, !3041, !148}
!3041 = !DILocation(line: 122, column: 5, scope: !3009)
!3042 = !DILocalVariable(name: "i", scope: !3043, file: !66, line: 124, type: !58)
!3043 = distinct !DILexicalBlock(scope: !65, file: !66, line: 124, column: 5)
!3044 = !DILocation(line: 124, column: 17, scope: !3043)
!3045 = !DILocation(line: 124, column: 10, scope: !3043)
!3046 = !DILocation(line: 124, column: 24, scope: !3047)
!3047 = distinct !DILexicalBlock(scope: !3043, file: !66, line: 124, column: 5)
!3048 = !DILocation(line: 124, column: 26, scope: !3047)
!3049 = !DILocation(line: 124, column: 5, scope: !3043)
!3050 = !DILocalVariable(name: "t0", scope: !3051, file: !66, line: 126, type: !53)
!3051 = distinct !DILexicalBlock(scope: !3047, file: !66, line: 125, column: 5)
!3052 = !DILocation(line: 126, column: 18, scope: !3051)
!3053 = !DILocation(line: 126, column: 25, scope: !3051)
!3054 = !DILocation(line: 126, column: 27, scope: !3051)
!3055 = !DILocation(line: 126, column: 32, scope: !3051)
!3056 = !DILocation(line: 126, column: 40, scope: !3051)
!3057 = !DILocation(line: 126, column: 42, scope: !3051)
!3058 = !DILocation(line: 126, column: 43, scope: !3051)
!3059 = !DILocation(line: 126, column: 38, scope: !3051)
!3060 = !DILocation(line: 126, column: 48, scope: !3051)
!3061 = !DILocalVariable(name: "t1", scope: !3051, file: !66, line: 127, type: !53)
!3062 = !DILocation(line: 127, column: 18, scope: !3051)
!3063 = !DILocation(line: 127, column: 25, scope: !3051)
!3064 = !DILocation(line: 127, column: 27, scope: !3051)
!3065 = !DILocation(line: 127, column: 28, scope: !3051)
!3066 = !DILocation(line: 127, column: 32, scope: !3051)
!3067 = !DILocation(line: 127, column: 40, scope: !3051)
!3068 = !DILocation(line: 127, column: 42, scope: !3051)
!3069 = !DILocation(line: 127, column: 43, scope: !3051)
!3070 = !DILocation(line: 127, column: 38, scope: !3051)
!3071 = !DILocation(line: 127, column: 48, scope: !3051)
!3072 = !DILocation(line: 128, column: 20, scope: !3051)
!3073 = !DILocation(line: 128, column: 23, scope: !3051)
!3074 = !DILocation(line: 128, column: 9, scope: !3051)
!3075 = !DILocation(line: 128, column: 11, scope: !3051)
!3076 = !DILocation(line: 128, column: 16, scope: !3051)
!3077 = !DILocation(line: 129, column: 20, scope: !3051)
!3078 = !DILocation(line: 129, column: 23, scope: !3051)
!3079 = !DILocation(line: 129, column: 9, scope: !3051)
!3080 = !DILocation(line: 129, column: 11, scope: !3051)
!3081 = !DILocation(line: 129, column: 12, scope: !3051)
!3082 = !DILocation(line: 129, column: 16, scope: !3051)
!3083 = !DILocation(line: 130, column: 19, scope: !3051)
!3084 = !DILocation(line: 130, column: 9, scope: !3051)
!3085 = !DILocation(line: 130, column: 11, scope: !3051)
!3086 = !DILocation(line: 130, column: 12, scope: !3051)
!3087 = !DILocation(line: 130, column: 16, scope: !3051)
!3088 = !DILocation(line: 131, column: 19, scope: !3051)
!3089 = !DILocation(line: 131, column: 9, scope: !3051)
!3090 = !DILocation(line: 131, column: 11, scope: !3051)
!3091 = !DILocation(line: 131, column: 12, scope: !3051)
!3092 = !DILocation(line: 131, column: 16, scope: !3051)
!3093 = !DILocation(line: 132, column: 5, scope: !3051)
!3094 = !DILocation(line: 124, column: 33, scope: !3047)
!3095 = !DILocation(line: 124, column: 5, scope: !3047)
!3096 = distinct !{!3096, !3049, !3097, !148}
!3097 = !DILocation(line: 132, column: 5, scope: !3043)
!3098 = !DILocalVariable(name: "i", scope: !3099, file: !66, line: 134, type: !58)
!3099 = distinct !DILexicalBlock(scope: !65, file: !66, line: 134, column: 5)
!3100 = !DILocation(line: 134, column: 17, scope: !3099)
!3101 = !DILocation(line: 134, column: 10, scope: !3099)
!3102 = !DILocation(line: 134, column: 24, scope: !3103)
!3103 = distinct !DILexicalBlock(scope: !3099, file: !66, line: 134, column: 5)
!3104 = !DILocation(line: 134, column: 26, scope: !3103)
!3105 = !DILocation(line: 134, column: 5, scope: !3099)
!3106 = !DILocalVariable(name: "t0", scope: !3107, file: !66, line: 136, type: !53)
!3107 = distinct !DILexicalBlock(scope: !3103, file: !66, line: 135, column: 5)
!3108 = !DILocation(line: 136, column: 18, scope: !3107)
!3109 = !DILocation(line: 136, column: 25, scope: !3107)
!3110 = !DILocation(line: 136, column: 27, scope: !3107)
!3111 = !DILocation(line: 136, column: 32, scope: !3107)
!3112 = !DILocation(line: 136, column: 41, scope: !3107)
!3113 = !DILocation(line: 136, column: 43, scope: !3107)
!3114 = !DILocation(line: 136, column: 44, scope: !3107)
!3115 = !DILocation(line: 136, column: 39, scope: !3107)
!3116 = !DILocation(line: 136, column: 50, scope: !3107)
!3117 = !DILocalVariable(name: "t1", scope: !3107, file: !66, line: 137, type: !53)
!3118 = !DILocation(line: 137, column: 18, scope: !3107)
!3119 = !DILocation(line: 137, column: 25, scope: !3107)
!3120 = !DILocation(line: 137, column: 27, scope: !3107)
!3121 = !DILocation(line: 137, column: 28, scope: !3107)
!3122 = !DILocation(line: 137, column: 32, scope: !3107)
!3123 = !DILocation(line: 137, column: 41, scope: !3107)
!3124 = !DILocation(line: 137, column: 43, scope: !3107)
!3125 = !DILocation(line: 137, column: 44, scope: !3107)
!3126 = !DILocation(line: 137, column: 39, scope: !3107)
!3127 = !DILocation(line: 137, column: 50, scope: !3107)
!3128 = !DILocation(line: 139, column: 20, scope: !3107)
!3129 = !DILocation(line: 139, column: 23, scope: !3107)
!3130 = !DILocation(line: 139, column: 9, scope: !3107)
!3131 = !DILocation(line: 139, column: 11, scope: !3107)
!3132 = !DILocation(line: 139, column: 17, scope: !3107)
!3133 = !DILocation(line: 140, column: 20, scope: !3107)
!3134 = !DILocation(line: 140, column: 23, scope: !3107)
!3135 = !DILocation(line: 140, column: 9, scope: !3107)
!3136 = !DILocation(line: 140, column: 11, scope: !3107)
!3137 = !DILocation(line: 140, column: 12, scope: !3107)
!3138 = !DILocation(line: 140, column: 17, scope: !3107)
!3139 = !DILocation(line: 141, column: 20, scope: !3107)
!3140 = !DILocation(line: 141, column: 9, scope: !3107)
!3141 = !DILocation(line: 141, column: 11, scope: !3107)
!3142 = !DILocation(line: 141, column: 12, scope: !3107)
!3143 = !DILocation(line: 141, column: 17, scope: !3107)
!3144 = !DILocation(line: 142, column: 20, scope: !3107)
!3145 = !DILocation(line: 142, column: 9, scope: !3107)
!3146 = !DILocation(line: 142, column: 11, scope: !3107)
!3147 = !DILocation(line: 142, column: 12, scope: !3107)
!3148 = !DILocation(line: 142, column: 17, scope: !3107)
!3149 = !DILocation(line: 143, column: 5, scope: !3107)
!3150 = !DILocation(line: 134, column: 32, scope: !3103)
!3151 = !DILocation(line: 134, column: 5, scope: !3103)
!3152 = distinct !{!3152, !3105, !3153, !148}
!3153 = !DILocation(line: 143, column: 5, scope: !3099)
!3154 = !DILocalVariable(name: "i", scope: !3155, file: !66, line: 145, type: !58)
!3155 = distinct !DILexicalBlock(scope: !65, file: !66, line: 145, column: 5)
!3156 = !DILocation(line: 145, column: 17, scope: !3155)
!3157 = !DILocation(line: 145, column: 10, scope: !3155)
!3158 = !DILocation(line: 145, column: 24, scope: !3159)
!3159 = distinct !DILexicalBlock(scope: !3155, file: !66, line: 145, column: 5)
!3160 = !DILocation(line: 145, column: 26, scope: !3159)
!3161 = !DILocation(line: 145, column: 5, scope: !3155)
!3162 = !DILocalVariable(name: "t", scope: !3163, file: !66, line: 147, type: !53)
!3163 = distinct !DILexicalBlock(scope: !3159, file: !66, line: 146, column: 5)
!3164 = !DILocation(line: 147, column: 18, scope: !3163)
!3165 = !DILocation(line: 147, column: 24, scope: !3163)
!3166 = !DILocation(line: 147, column: 26, scope: !3163)
!3167 = !DILocation(line: 147, column: 28, scope: !3163)
!3168 = !DILocation(line: 147, column: 36, scope: !3163)
!3169 = !DILocation(line: 147, column: 38, scope: !3163)
!3170 = !DILocation(line: 147, column: 39, scope: !3163)
!3171 = !DILocation(line: 147, column: 34, scope: !3163)
!3172 = !DILocation(line: 147, column: 44, scope: !3163)
!3173 = !DILocation(line: 148, column: 19, scope: !3163)
!3174 = !DILocation(line: 148, column: 21, scope: !3163)
!3175 = !DILocation(line: 148, column: 9, scope: !3163)
!3176 = !DILocation(line: 148, column: 11, scope: !3163)
!3177 = !DILocation(line: 148, column: 16, scope: !3163)
!3178 = !DILocation(line: 149, column: 19, scope: !3163)
!3179 = !DILocation(line: 149, column: 9, scope: !3163)
!3180 = !DILocation(line: 149, column: 11, scope: !3163)
!3181 = !DILocation(line: 149, column: 12, scope: !3163)
!3182 = !DILocation(line: 149, column: 16, scope: !3163)
!3183 = !DILocation(line: 150, column: 5, scope: !3163)
!3184 = !DILocation(line: 145, column: 32, scope: !3159)
!3185 = !DILocation(line: 145, column: 5, scope: !3159)
!3186 = distinct !{!3186, !3161, !3187, !148}
!3187 = !DILocation(line: 150, column: 5, scope: !3155)
!3188 = !DILocation(line: 151, column: 1, scope: !65)
!3189 = distinct !DISubprogram(name: "mul_add_mat_x_m_mat", scope: !660, file: !660, line: 61, type: !775, scopeLine: 62, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !69)
!3190 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !3189, file: !660, line: 61, type: !463)
!3191 = !DILocation(line: 61, column: 36, scope: !3189)
!3192 = !DILocalVariable(name: "mat", arg: 2, scope: !3189, file: !660, line: 61, type: !102)
!3193 = !DILocation(line: 61, column: 70, scope: !3189)
!3194 = !DILocalVariable(name: "bs_mat", arg: 3, scope: !3189, file: !660, line: 61, type: !663)
!3195 = !DILocation(line: 61, column: 91, scope: !3189)
!3196 = !DILocalVariable(name: "acc", arg: 4, scope: !3189, file: !660, line: 61, type: !52)
!3197 = !DILocation(line: 61, column: 109, scope: !3189)
!3198 = !DILocalVariable(name: "mat_rows", arg: 5, scope: !3189, file: !660, line: 62, type: !463)
!3199 = !DILocation(line: 62, column: 36, scope: !3189)
!3200 = !DILocalVariable(name: "mat_cols", arg: 6, scope: !3189, file: !660, line: 62, type: !463)
!3201 = !DILocation(line: 62, column: 56, scope: !3189)
!3202 = !DILocalVariable(name: "bs_mat_cols", arg: 7, scope: !3189, file: !660, line: 62, type: !463)
!3203 = !DILocation(line: 62, column: 76, scope: !3189)
!3204 = !DILocalVariable(name: "r", scope: !3205, file: !660, line: 64, type: !87)
!3205 = distinct !DILexicalBlock(scope: !3189, file: !660, line: 64, column: 5)
!3206 = !DILocation(line: 64, column: 14, scope: !3205)
!3207 = !DILocation(line: 64, column: 10, scope: !3205)
!3208 = !DILocation(line: 64, column: 21, scope: !3209)
!3209 = distinct !DILexicalBlock(scope: !3205, file: !660, line: 64, column: 5)
!3210 = !DILocation(line: 64, column: 25, scope: !3209)
!3211 = !DILocation(line: 64, column: 23, scope: !3209)
!3212 = !DILocation(line: 64, column: 5, scope: !3205)
!3213 = !DILocalVariable(name: "c", scope: !3214, file: !660, line: 65, type: !87)
!3214 = distinct !DILexicalBlock(scope: !3215, file: !660, line: 65, column: 9)
!3215 = distinct !DILexicalBlock(scope: !3209, file: !660, line: 64, column: 40)
!3216 = !DILocation(line: 65, column: 18, scope: !3214)
!3217 = !DILocation(line: 65, column: 14, scope: !3214)
!3218 = !DILocation(line: 65, column: 25, scope: !3219)
!3219 = distinct !DILexicalBlock(scope: !3214, file: !660, line: 65, column: 9)
!3220 = !DILocation(line: 65, column: 29, scope: !3219)
!3221 = !DILocation(line: 65, column: 27, scope: !3219)
!3222 = !DILocation(line: 65, column: 9, scope: !3214)
!3223 = !DILocalVariable(name: "k", scope: !3224, file: !660, line: 66, type: !87)
!3224 = distinct !DILexicalBlock(scope: !3225, file: !660, line: 66, column: 13)
!3225 = distinct !DILexicalBlock(scope: !3219, file: !660, line: 65, column: 44)
!3226 = !DILocation(line: 66, column: 22, scope: !3224)
!3227 = !DILocation(line: 66, column: 18, scope: !3224)
!3228 = !DILocation(line: 66, column: 29, scope: !3229)
!3229 = distinct !DILexicalBlock(scope: !3224, file: !660, line: 66, column: 13)
!3230 = !DILocation(line: 66, column: 33, scope: !3229)
!3231 = !DILocation(line: 66, column: 31, scope: !3229)
!3232 = !DILocation(line: 66, column: 13, scope: !3224)
!3233 = !DILocation(line: 67, column: 31, scope: !3234)
!3234 = distinct !DILexicalBlock(scope: !3229, file: !660, line: 66, column: 54)
!3235 = !DILocation(line: 67, column: 44, scope: !3234)
!3236 = !DILocation(line: 67, column: 53, scope: !3234)
!3237 = !DILocation(line: 67, column: 68, scope: !3234)
!3238 = !DILocation(line: 67, column: 72, scope: !3234)
!3239 = !DILocation(line: 67, column: 70, scope: !3234)
!3240 = !DILocation(line: 67, column: 86, scope: !3234)
!3241 = !DILocation(line: 67, column: 84, scope: !3234)
!3242 = !DILocation(line: 67, column: 65, scope: !3234)
!3243 = !DILocation(line: 67, column: 51, scope: !3234)
!3244 = !DILocation(line: 67, column: 90, scope: !3234)
!3245 = !DILocation(line: 67, column: 94, scope: !3234)
!3246 = !DILocation(line: 67, column: 98, scope: !3234)
!3247 = !DILocation(line: 67, column: 96, scope: !3234)
!3248 = !DILocation(line: 67, column: 109, scope: !3234)
!3249 = !DILocation(line: 67, column: 107, scope: !3234)
!3250 = !DILocation(line: 67, column: 113, scope: !3234)
!3251 = !DILocation(line: 67, column: 119, scope: !3234)
!3252 = !DILocation(line: 67, column: 134, scope: !3234)
!3253 = !DILocation(line: 67, column: 138, scope: !3234)
!3254 = !DILocation(line: 67, column: 136, scope: !3234)
!3255 = !DILocation(line: 67, column: 152, scope: !3234)
!3256 = !DILocation(line: 67, column: 150, scope: !3234)
!3257 = !DILocation(line: 67, column: 131, scope: !3234)
!3258 = !DILocation(line: 67, column: 117, scope: !3234)
!3259 = !DILocation(line: 67, column: 17, scope: !3234)
!3260 = !DILocation(line: 68, column: 13, scope: !3234)
!3261 = !DILocation(line: 66, column: 48, scope: !3229)
!3262 = !DILocation(line: 66, column: 13, scope: !3229)
!3263 = distinct !{!3263, !3232, !3264, !148}
!3264 = !DILocation(line: 68, column: 13, scope: !3224)
!3265 = !DILocation(line: 69, column: 9, scope: !3225)
!3266 = !DILocation(line: 65, column: 40, scope: !3219)
!3267 = !DILocation(line: 65, column: 9, scope: !3219)
!3268 = distinct !{!3268, !3222, !3269, !148}
!3269 = !DILocation(line: 69, column: 9, scope: !3214)
!3270 = !DILocation(line: 70, column: 5, scope: !3215)
!3271 = !DILocation(line: 64, column: 36, scope: !3209)
!3272 = !DILocation(line: 64, column: 5, scope: !3209)
!3273 = distinct !{!3273, !3212, !3274, !148}
!3274 = !DILocation(line: 70, column: 5, scope: !3205)
!3275 = !DILocation(line: 71, column: 1, scope: !3189)
!3276 = distinct !DISubprogram(name: "P1_times_Vt", scope: !660, file: !660, line: 82, type: !751, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !69)
!3277 = !DILocalVariable(name: "p", arg: 1, scope: !3276, file: !660, line: 82, type: !382)
!3278 = !DILocation(line: 82, column: 39, scope: !3276)
!3279 = !DILocalVariable(name: "P1", arg: 2, scope: !3276, file: !660, line: 82, type: !663)
!3280 = !DILocation(line: 82, column: 58, scope: !3276)
!3281 = !DILocalVariable(name: "V", arg: 3, scope: !3276, file: !660, line: 82, type: !102)
!3282 = !DILocation(line: 82, column: 83, scope: !3276)
!3283 = !DILocalVariable(name: "acc", arg: 4, scope: !3276, file: !660, line: 82, type: !52)
!3284 = !DILocation(line: 82, column: 96, scope: !3276)
!3285 = !DILocation(line: 86, column: 66, scope: !3276)
!3286 = !DILocation(line: 86, column: 48, scope: !3276)
!3287 = !DILocation(line: 86, column: 70, scope: !3276)
!3288 = !DILocation(line: 86, column: 74, scope: !3276)
!3289 = !DILocation(line: 86, column: 77, scope: !3276)
!3290 = !DILocation(line: 86, column: 90, scope: !3276)
!3291 = !DILocation(line: 86, column: 82, scope: !3276)
!3292 = !DILocation(line: 86, column: 102, scope: !3276)
!3293 = !DILocation(line: 86, column: 94, scope: !3276)
!3294 = !DILocation(line: 86, column: 114, scope: !3276)
!3295 = !DILocation(line: 86, column: 106, scope: !3276)
!3296 = !DILocation(line: 86, column: 5, scope: !3276)
!3297 = !DILocation(line: 87, column: 1, scope: !3276)
!3298 = distinct !DISubprogram(name: "mul_add_m_upper_triangular_mat_x_mat_trans", scope: !660, file: !660, line: 32, type: !984, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !69)
!3299 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !3298, file: !660, line: 32, type: !463)
!3300 = !DILocation(line: 32, column: 59, scope: !3298)
!3301 = !DILocalVariable(name: "bs_mat", arg: 2, scope: !3298, file: !660, line: 32, type: !663)
!3302 = !DILocation(line: 32, column: 88, scope: !3298)
!3303 = !DILocalVariable(name: "mat", arg: 3, scope: !3298, file: !660, line: 32, type: !102)
!3304 = !DILocation(line: 32, column: 117, scope: !3298)
!3305 = !DILocalVariable(name: "acc", arg: 4, scope: !3298, file: !660, line: 32, type: !52)
!3306 = !DILocation(line: 32, column: 132, scope: !3298)
!3307 = !DILocalVariable(name: "bs_mat_rows", arg: 5, scope: !3298, file: !660, line: 33, type: !463)
!3308 = !DILocation(line: 33, column: 59, scope: !3298)
!3309 = !DILocalVariable(name: "bs_mat_cols", arg: 6, scope: !3298, file: !660, line: 33, type: !463)
!3310 = !DILocation(line: 33, column: 82, scope: !3298)
!3311 = !DILocalVariable(name: "mat_rows", arg: 7, scope: !3298, file: !660, line: 33, type: !463)
!3312 = !DILocation(line: 33, column: 105, scope: !3298)
!3313 = !DILocalVariable(name: "triangular", arg: 8, scope: !3298, file: !660, line: 33, type: !463)
!3314 = !DILocation(line: 33, column: 125, scope: !3298)
!3315 = !DILocalVariable(name: "bs_mat_entries_used", scope: !3298, file: !660, line: 34, type: !87)
!3316 = !DILocation(line: 34, column: 9, scope: !3298)
!3317 = !DILocalVariable(name: "r", scope: !3318, file: !660, line: 35, type: !87)
!3318 = distinct !DILexicalBlock(scope: !3298, file: !660, line: 35, column: 5)
!3319 = !DILocation(line: 35, column: 14, scope: !3318)
!3320 = !DILocation(line: 35, column: 10, scope: !3318)
!3321 = !DILocation(line: 35, column: 21, scope: !3322)
!3322 = distinct !DILexicalBlock(scope: !3318, file: !660, line: 35, column: 5)
!3323 = !DILocation(line: 35, column: 25, scope: !3322)
!3324 = !DILocation(line: 35, column: 23, scope: !3322)
!3325 = !DILocation(line: 35, column: 5, scope: !3318)
!3326 = !DILocalVariable(name: "c", scope: !3327, file: !660, line: 36, type: !87)
!3327 = distinct !DILexicalBlock(scope: !3328, file: !660, line: 36, column: 9)
!3328 = distinct !DILexicalBlock(scope: !3322, file: !660, line: 35, column: 43)
!3329 = !DILocation(line: 36, column: 18, scope: !3327)
!3330 = !DILocation(line: 36, column: 22, scope: !3327)
!3331 = !DILocation(line: 36, column: 35, scope: !3327)
!3332 = !DILocation(line: 36, column: 33, scope: !3327)
!3333 = !DILocation(line: 36, column: 14, scope: !3327)
!3334 = !DILocation(line: 36, column: 38, scope: !3335)
!3335 = distinct !DILexicalBlock(scope: !3327, file: !660, line: 36, column: 9)
!3336 = !DILocation(line: 36, column: 42, scope: !3335)
!3337 = !DILocation(line: 36, column: 40, scope: !3335)
!3338 = !DILocation(line: 36, column: 9, scope: !3327)
!3339 = !DILocalVariable(name: "k", scope: !3340, file: !660, line: 37, type: !87)
!3340 = distinct !DILexicalBlock(scope: !3341, file: !660, line: 37, column: 13)
!3341 = distinct !DILexicalBlock(scope: !3335, file: !660, line: 36, column: 60)
!3342 = !DILocation(line: 37, column: 22, scope: !3340)
!3343 = !DILocation(line: 37, column: 18, scope: !3340)
!3344 = !DILocation(line: 37, column: 29, scope: !3345)
!3345 = distinct !DILexicalBlock(scope: !3340, file: !660, line: 37, column: 13)
!3346 = !DILocation(line: 37, column: 33, scope: !3345)
!3347 = !DILocation(line: 37, column: 31, scope: !3345)
!3348 = !DILocation(line: 37, column: 13, scope: !3340)
!3349 = !DILocation(line: 38, column: 31, scope: !3350)
!3350 = distinct !DILexicalBlock(scope: !3345, file: !660, line: 37, column: 51)
!3351 = !DILocation(line: 38, column: 44, scope: !3350)
!3352 = !DILocation(line: 38, column: 53, scope: !3350)
!3353 = !DILocation(line: 38, column: 67, scope: !3350)
!3354 = !DILocation(line: 38, column: 65, scope: !3350)
!3355 = !DILocation(line: 38, column: 51, scope: !3350)
!3356 = !DILocation(line: 38, column: 88, scope: !3350)
!3357 = !DILocation(line: 38, column: 92, scope: !3350)
!3358 = !DILocation(line: 38, column: 96, scope: !3350)
!3359 = !DILocation(line: 38, column: 94, scope: !3350)
!3360 = !DILocation(line: 38, column: 110, scope: !3350)
!3361 = !DILocation(line: 38, column: 108, scope: !3350)
!3362 = !DILocation(line: 38, column: 114, scope: !3350)
!3363 = !DILocation(line: 38, column: 120, scope: !3350)
!3364 = !DILocation(line: 38, column: 135, scope: !3350)
!3365 = !DILocation(line: 38, column: 139, scope: !3350)
!3366 = !DILocation(line: 38, column: 137, scope: !3350)
!3367 = !DILocation(line: 38, column: 150, scope: !3350)
!3368 = !DILocation(line: 38, column: 148, scope: !3350)
!3369 = !DILocation(line: 38, column: 132, scope: !3350)
!3370 = !DILocation(line: 38, column: 118, scope: !3350)
!3371 = !DILocation(line: 38, column: 17, scope: !3350)
!3372 = !DILocation(line: 39, column: 13, scope: !3350)
!3373 = !DILocation(line: 37, column: 45, scope: !3345)
!3374 = !DILocation(line: 37, column: 13, scope: !3345)
!3375 = distinct !{!3375, !3348, !3376, !148}
!3376 = !DILocation(line: 39, column: 13, scope: !3340)
!3377 = !DILocation(line: 40, column: 33, scope: !3341)
!3378 = !DILocation(line: 41, column: 9, scope: !3341)
!3379 = !DILocation(line: 36, column: 56, scope: !3335)
!3380 = !DILocation(line: 36, column: 9, scope: !3335)
!3381 = distinct !{!3381, !3338, !3382, !148}
!3382 = !DILocation(line: 41, column: 9, scope: !3327)
!3383 = !DILocation(line: 42, column: 5, scope: !3328)
!3384 = !DILocation(line: 35, column: 39, scope: !3322)
!3385 = !DILocation(line: 35, column: 5, scope: !3322)
!3386 = distinct !{!3386, !3325, !3387, !148}
!3387 = !DILocation(line: 42, column: 5, scope: !3318)
!3388 = !DILocation(line: 43, column: 1, scope: !3298)
!3389 = distinct !DISubprogram(name: "mayo_sign", scope: !66, file: !66, line: 502, type: !1353, scopeLine: 504, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !69)
!3390 = !DILocalVariable(name: "p", arg: 1, scope: !3389, file: !66, line: 502, type: !382)
!3391 = !DILocation(line: 502, column: 36, scope: !3389)
!3392 = !DILocalVariable(name: "sm", arg: 2, scope: !3389, file: !66, line: 502, type: !61)
!3393 = !DILocation(line: 502, column: 54, scope: !3389)
!3394 = !DILocalVariable(name: "smlen", arg: 3, scope: !3389, file: !66, line: 503, type: !1355)
!3395 = !DILocation(line: 503, column: 23, scope: !3389)
!3396 = !DILocalVariable(name: "m", arg: 4, scope: !3389, file: !66, line: 503, type: !102)
!3397 = !DILocation(line: 503, column: 51, scope: !3389)
!3398 = !DILocalVariable(name: "mlen", arg: 5, scope: !3389, file: !66, line: 504, type: !58)
!3399 = !DILocation(line: 504, column: 22, scope: !3389)
!3400 = !DILocalVariable(name: "csk", arg: 6, scope: !3389, file: !66, line: 504, type: !102)
!3401 = !DILocation(line: 504, column: 49, scope: !3389)
!3402 = !DILocalVariable(name: "ret", scope: !3389, file: !66, line: 505, type: !87)
!3403 = !DILocation(line: 505, column: 9, scope: !3389)
!3404 = !DILocalVariable(name: "param_sig_bytes", scope: !3389, file: !66, line: 506, type: !463)
!3405 = !DILocation(line: 506, column: 15, scope: !3389)
!3406 = !DILocation(line: 506, column: 49, scope: !3389)
!3407 = !DILocation(line: 506, column: 33, scope: !3389)
!3408 = !DILocalVariable(name: "siglen", scope: !3389, file: !66, line: 507, type: !58)
!3409 = !DILocation(line: 507, column: 12, scope: !3389)
!3410 = !DILocation(line: 508, column: 13, scope: !3389)
!3411 = !DILocation(line: 508, column: 18, scope: !3389)
!3412 = !DILocation(line: 508, column: 16, scope: !3389)
!3413 = !DILocation(line: 508, column: 35, scope: !3389)
!3414 = !DILocation(line: 508, column: 38, scope: !3389)
!3415 = !DILocation(line: 508, column: 5, scope: !3389)
!3416 = !DILocation(line: 509, column: 31, scope: !3389)
!3417 = !DILocation(line: 509, column: 34, scope: !3389)
!3418 = !DILocation(line: 509, column: 47, scope: !3389)
!3419 = !DILocation(line: 509, column: 52, scope: !3389)
!3420 = !DILocation(line: 509, column: 50, scope: !3389)
!3421 = !DILocation(line: 509, column: 69, scope: !3389)
!3422 = !DILocation(line: 509, column: 75, scope: !3389)
!3423 = !DILocation(line: 509, column: 11, scope: !3389)
!3424 = !DILocation(line: 509, column: 9, scope: !3389)
!3425 = !DILocation(line: 510, column: 9, scope: !3426)
!3426 = distinct !DILexicalBlock(scope: !3389, file: !66, line: 510, column: 9)
!3427 = !DILocation(line: 510, column: 13, scope: !3426)
!3428 = !DILocation(line: 510, column: 24, scope: !3426)
!3429 = !DILocation(line: 510, column: 27, scope: !3426)
!3430 = !DILocation(line: 510, column: 46, scope: !3426)
!3431 = !DILocation(line: 510, column: 34, scope: !3426)
!3432 = !DILocation(line: 511, column: 16, scope: !3433)
!3433 = distinct !DILexicalBlock(scope: !3426, file: !66, line: 510, column: 62)
!3434 = !DILocation(line: 511, column: 23, scope: !3433)
!3435 = !DILocation(line: 511, column: 32, scope: !3433)
!3436 = !DILocation(line: 511, column: 30, scope: !3433)
!3437 = !DILocation(line: 511, column: 9, scope: !3433)
!3438 = !DILocation(line: 512, column: 9, scope: !3433)
!3439 = !DILocation(line: 515, column: 14, scope: !3389)
!3440 = !DILocation(line: 515, column: 23, scope: !3389)
!3441 = !DILocation(line: 515, column: 21, scope: !3389)
!3442 = !DILocation(line: 515, column: 6, scope: !3389)
!3443 = !DILocation(line: 515, column: 12, scope: !3389)
!3444 = !DILocation(line: 515, column: 5, scope: !3389)
!3445 = !DILabel(scope: !3389, name: "err", file: !66, line: 516, column: 1)
!3446 = !DILocation(line: 516, column: 1, scope: !3389)
!3447 = !DILocation(line: 517, column: 12, scope: !3389)
!3448 = !DILocation(line: 517, column: 5, scope: !3389)
!3449 = distinct !DISubprogram(name: "mayo_open", scope: !66, file: !66, line: 520, type: !1353, scopeLine: 522, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !69)
!3450 = !DILocalVariable(name: "p", arg: 1, scope: !3449, file: !66, line: 520, type: !382)
!3451 = !DILocation(line: 520, column: 36, scope: !3449)
!3452 = !DILocalVariable(name: "m", arg: 2, scope: !3449, file: !66, line: 520, type: !61)
!3453 = !DILocation(line: 520, column: 54, scope: !3449)
!3454 = !DILocalVariable(name: "mlen", arg: 3, scope: !3449, file: !66, line: 521, type: !1355)
!3455 = !DILocation(line: 521, column: 23, scope: !3449)
!3456 = !DILocalVariable(name: "sm", arg: 4, scope: !3449, file: !66, line: 521, type: !102)
!3457 = !DILocation(line: 521, column: 50, scope: !3449)
!3458 = !DILocalVariable(name: "smlen", arg: 5, scope: !3449, file: !66, line: 522, type: !58)
!3459 = !DILocation(line: 522, column: 22, scope: !3449)
!3460 = !DILocalVariable(name: "pk", arg: 6, scope: !3449, file: !66, line: 522, type: !102)
!3461 = !DILocation(line: 522, column: 50, scope: !3449)
!3462 = !DILocalVariable(name: "param_sig_bytes", scope: !3449, file: !66, line: 523, type: !463)
!3463 = !DILocation(line: 523, column: 15, scope: !3449)
!3464 = !DILocation(line: 523, column: 49, scope: !3449)
!3465 = !DILocation(line: 523, column: 33, scope: !3449)
!3466 = !DILocation(line: 524, column: 9, scope: !3467)
!3467 = distinct !DILexicalBlock(scope: !3449, file: !66, line: 524, column: 9)
!3468 = !DILocation(line: 524, column: 25, scope: !3467)
!3469 = !DILocation(line: 524, column: 15, scope: !3467)
!3470 = !DILocation(line: 525, column: 9, scope: !3471)
!3471 = distinct !DILexicalBlock(scope: !3467, file: !66, line: 524, column: 42)
!3472 = !DILocalVariable(name: "result", scope: !3449, file: !66, line: 527, type: !87)
!3473 = !DILocation(line: 527, column: 9, scope: !3449)
!3474 = !DILocation(line: 527, column: 30, scope: !3449)
!3475 = !DILocation(line: 527, column: 33, scope: !3449)
!3476 = !DILocation(line: 527, column: 38, scope: !3449)
!3477 = !DILocation(line: 527, column: 36, scope: !3449)
!3478 = !DILocation(line: 527, column: 55, scope: !3449)
!3479 = !DILocation(line: 527, column: 63, scope: !3449)
!3480 = !DILocation(line: 527, column: 61, scope: !3449)
!3481 = !DILocation(line: 527, column: 80, scope: !3449)
!3482 = !DILocation(line: 528, column: 30, scope: !3449)
!3483 = !DILocation(line: 527, column: 18, scope: !3449)
!3484 = !DILocation(line: 530, column: 9, scope: !3485)
!3485 = distinct !DILexicalBlock(scope: !3449, file: !66, line: 530, column: 9)
!3486 = !DILocation(line: 530, column: 16, scope: !3485)
!3487 = !DILocation(line: 531, column: 17, scope: !3488)
!3488 = distinct !DILexicalBlock(scope: !3485, file: !66, line: 530, column: 28)
!3489 = !DILocation(line: 531, column: 25, scope: !3488)
!3490 = !DILocation(line: 531, column: 23, scope: !3488)
!3491 = !DILocation(line: 531, column: 10, scope: !3488)
!3492 = !DILocation(line: 531, column: 15, scope: !3488)
!3493 = !DILocation(line: 532, column: 17, scope: !3488)
!3494 = !DILocation(line: 532, column: 20, scope: !3488)
!3495 = !DILocation(line: 532, column: 25, scope: !3488)
!3496 = !DILocation(line: 532, column: 23, scope: !3488)
!3497 = !DILocation(line: 532, column: 43, scope: !3488)
!3498 = !DILocation(line: 532, column: 42, scope: !3488)
!3499 = !DILocation(line: 532, column: 9, scope: !3488)
!3500 = !DILocation(line: 533, column: 5, scope: !3488)
!3501 = !DILocation(line: 535, column: 12, scope: !3449)
!3502 = !DILocation(line: 535, column: 5, scope: !3449)
!3503 = !DILocation(line: 536, column: 1, scope: !3449)
!3504 = distinct !DISubprogram(name: "mayo_verify", scope: !66, file: !66, line: 617, type: !3505, scopeLine: 619, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !69)
!3505 = !DISubroutineType(types: !3506)
!3506 = !{!87, !382, !102, !58, !102, !102}
!3507 = !DILocalVariable(name: "p", arg: 1, scope: !3504, file: !66, line: 617, type: !382)
!3508 = !DILocation(line: 617, column: 38, scope: !3504)
!3509 = !DILocalVariable(name: "m", arg: 2, scope: !3504, file: !66, line: 617, type: !102)
!3510 = !DILocation(line: 617, column: 62, scope: !3504)
!3511 = !DILocalVariable(name: "mlen", arg: 3, scope: !3504, file: !66, line: 618, type: !58)
!3512 = !DILocation(line: 618, column: 24, scope: !3504)
!3513 = !DILocalVariable(name: "sig", arg: 4, scope: !3504, file: !66, line: 618, type: !102)
!3514 = !DILocation(line: 618, column: 51, scope: !3504)
!3515 = !DILocalVariable(name: "cpk", arg: 5, scope: !3504, file: !66, line: 619, type: !102)
!3516 = !DILocation(line: 619, column: 38, scope: !3504)
!3517 = !DILocalVariable(name: "tEnc", scope: !3504, file: !66, line: 620, type: !1371)
!3518 = !DILocation(line: 620, column: 19, scope: !3504)
!3519 = !DILocalVariable(name: "t", scope: !3504, file: !66, line: 621, type: !1376)
!3520 = !DILocation(line: 621, column: 19, scope: !3504)
!3521 = !DILocalVariable(name: "y", scope: !3504, file: !66, line: 622, type: !3522)
!3522 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 2272, elements: !3523)
!3523 = !{!3524}
!3524 = !DISubrange(count: 284)
!3525 = !DILocation(line: 622, column: 19, scope: !3504)
!3526 = !DILocalVariable(name: "s", scope: !3504, file: !66, line: 623, type: !1403)
!3527 = !DILocation(line: 623, column: 19, scope: !3504)
!3528 = !DILocalVariable(name: "pk", scope: !3504, file: !66, line: 624, type: !3529)
!3529 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 7326720, elements: !3530)
!3530 = !{!3531}
!3531 = !DISubrange(count: 114480)
!3532 = !DILocation(line: 624, column: 14, scope: !3504)
!3533 = !DILocalVariable(name: "tmp", scope: !3504, file: !66, line: 625, type: !3534)
!3534 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 832, elements: !3535)
!3535 = !{!3536}
!3536 = !DISubrange(count: 104)
!3537 = !DILocation(line: 625, column: 19, scope: !3504)
!3538 = !DILocalVariable(name: "param_m", scope: !3504, file: !66, line: 627, type: !463)
!3539 = !DILocation(line: 627, column: 15, scope: !3504)
!3540 = !DILocation(line: 627, column: 33, scope: !3504)
!3541 = !DILocation(line: 627, column: 25, scope: !3504)
!3542 = !DILocalVariable(name: "param_n", scope: !3504, file: !66, line: 628, type: !463)
!3543 = !DILocation(line: 628, column: 15, scope: !3504)
!3544 = !DILocation(line: 628, column: 33, scope: !3504)
!3545 = !DILocation(line: 628, column: 25, scope: !3504)
!3546 = !DILocalVariable(name: "param_k", scope: !3504, file: !66, line: 629, type: !463)
!3547 = !DILocation(line: 629, column: 15, scope: !3504)
!3548 = !DILocation(line: 629, column: 33, scope: !3504)
!3549 = !DILocation(line: 629, column: 25, scope: !3504)
!3550 = !DILocalVariable(name: "param_m_bytes", scope: !3504, file: !66, line: 630, type: !463)
!3551 = !DILocation(line: 630, column: 15, scope: !3504)
!3552 = !DILocation(line: 630, column: 45, scope: !3504)
!3553 = !DILocation(line: 630, column: 31, scope: !3504)
!3554 = !DILocalVariable(name: "param_sig_bytes", scope: !3504, file: !66, line: 631, type: !463)
!3555 = !DILocation(line: 631, column: 15, scope: !3504)
!3556 = !DILocation(line: 631, column: 49, scope: !3504)
!3557 = !DILocation(line: 631, column: 33, scope: !3504)
!3558 = !DILocalVariable(name: "param_digest_bytes", scope: !3504, file: !66, line: 632, type: !463)
!3559 = !DILocation(line: 632, column: 15, scope: !3504)
!3560 = !DILocation(line: 632, column: 55, scope: !3504)
!3561 = !DILocation(line: 632, column: 36, scope: !3504)
!3562 = !DILocalVariable(name: "param_salt_bytes", scope: !3504, file: !66, line: 633, type: !463)
!3563 = !DILocation(line: 633, column: 15, scope: !3504)
!3564 = !DILocation(line: 633, column: 51, scope: !3504)
!3565 = !DILocation(line: 633, column: 34, scope: !3504)
!3566 = !DILocalVariable(name: "ret", scope: !3504, file: !66, line: 635, type: !87)
!3567 = !DILocation(line: 635, column: 9, scope: !3504)
!3568 = !DILocation(line: 635, column: 30, scope: !3504)
!3569 = !DILocation(line: 635, column: 33, scope: !3504)
!3570 = !DILocation(line: 635, column: 38, scope: !3504)
!3571 = !DILocation(line: 635, column: 15, scope: !3504)
!3572 = !DILocation(line: 636, column: 9, scope: !3573)
!3573 = distinct !DILexicalBlock(scope: !3504, file: !66, line: 636, column: 9)
!3574 = !DILocation(line: 636, column: 13, scope: !3573)
!3575 = !DILocation(line: 637, column: 9, scope: !3576)
!3576 = distinct !DILexicalBlock(scope: !3573, file: !66, line: 636, column: 25)
!3577 = !DILocalVariable(name: "P1", scope: !3504, file: !66, line: 640, type: !52)
!3578 = !DILocation(line: 640, column: 15, scope: !3504)
!3579 = !DILocation(line: 640, column: 20, scope: !3504)
!3580 = !DILocalVariable(name: "P2", scope: !3504, file: !66, line: 641, type: !52)
!3581 = !DILocation(line: 641, column: 15, scope: !3504)
!3582 = !DILocation(line: 641, column: 20, scope: !3504)
!3583 = !DILocation(line: 641, column: 40, scope: !3504)
!3584 = !DILocation(line: 641, column: 25, scope: !3504)
!3585 = !DILocation(line: 641, column: 23, scope: !3504)
!3586 = !DILocalVariable(name: "P3", scope: !3504, file: !66, line: 642, type: !52)
!3587 = !DILocation(line: 642, column: 15, scope: !3504)
!3588 = !DILocation(line: 642, column: 20, scope: !3504)
!3589 = !DILocation(line: 642, column: 40, scope: !3504)
!3590 = !DILocation(line: 642, column: 25, scope: !3504)
!3591 = !DILocation(line: 642, column: 23, scope: !3504)
!3592 = !DILocation(line: 657, column: 14, scope: !3504)
!3593 = !DILocation(line: 657, column: 19, scope: !3504)
!3594 = !DILocation(line: 657, column: 39, scope: !3504)
!3595 = !DILocation(line: 657, column: 42, scope: !3504)
!3596 = !DILocation(line: 657, column: 5, scope: !3504)
!3597 = !DILocation(line: 660, column: 12, scope: !3504)
!3598 = !DILocation(line: 660, column: 18, scope: !3504)
!3599 = !DILocation(line: 660, column: 16, scope: !3504)
!3600 = !DILocation(line: 660, column: 38, scope: !3504)
!3601 = !DILocation(line: 660, column: 44, scope: !3504)
!3602 = !DILocation(line: 660, column: 42, scope: !3504)
!3603 = !DILocation(line: 660, column: 62, scope: !3504)
!3604 = !DILocation(line: 660, column: 60, scope: !3504)
!3605 = !DILocation(line: 661, column: 12, scope: !3504)
!3606 = !DILocation(line: 660, column: 5, scope: !3504)
!3607 = !DILocation(line: 662, column: 14, scope: !3504)
!3608 = !DILocation(line: 662, column: 20, scope: !3504)
!3609 = !DILocation(line: 662, column: 35, scope: !3504)
!3610 = !DILocation(line: 662, column: 40, scope: !3504)
!3611 = !DILocation(line: 662, column: 61, scope: !3504)
!3612 = !DILocation(line: 662, column: 59, scope: !3504)
!3613 = !DILocation(line: 662, column: 5, scope: !3504)
!3614 = !DILocation(line: 663, column: 12, scope: !3504)
!3615 = !DILocation(line: 663, column: 18, scope: !3504)
!3616 = !DILocation(line: 663, column: 21, scope: !3504)
!3617 = !DILocation(line: 663, column: 5, scope: !3504)
!3618 = !DILocation(line: 666, column: 12, scope: !3504)
!3619 = !DILocation(line: 666, column: 17, scope: !3504)
!3620 = !DILocation(line: 666, column: 20, scope: !3504)
!3621 = !DILocation(line: 666, column: 30, scope: !3504)
!3622 = !DILocation(line: 666, column: 28, scope: !3504)
!3623 = !DILocation(line: 666, column: 5, scope: !3504)
!3624 = !DILocation(line: 668, column: 21, scope: !3504)
!3625 = !DILocation(line: 668, column: 24, scope: !3504)
!3626 = !DILocation(line: 668, column: 27, scope: !3504)
!3627 = !DILocation(line: 668, column: 31, scope: !3504)
!3628 = !DILocation(line: 668, column: 35, scope: !3504)
!3629 = !DILocation(line: 668, column: 39, scope: !3504)
!3630 = !DILocation(line: 668, column: 5, scope: !3504)
!3631 = !DILocation(line: 670, column: 16, scope: !3632)
!3632 = distinct !DILexicalBlock(scope: !3504, file: !66, line: 670, column: 9)
!3633 = !DILocation(line: 670, column: 19, scope: !3632)
!3634 = !DILocation(line: 670, column: 22, scope: !3632)
!3635 = !DILocation(line: 670, column: 9, scope: !3632)
!3636 = !DILocation(line: 670, column: 31, scope: !3632)
!3637 = !DILocation(line: 671, column: 9, scope: !3638)
!3638 = distinct !DILexicalBlock(scope: !3632, file: !66, line: 670, column: 37)
!3639 = !DILocation(line: 673, column: 5, scope: !3504)
!3640 = !DILocation(line: 674, column: 1, scope: !3504)
!3641 = distinct !DISubprogram(name: "mayo_expand_pk", scope: !66, file: !66, line: 608, type: !3642, scopeLine: 609, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !69)
!3642 = !DISubroutineType(types: !3643)
!3643 = !{!87, !382, !102, !52}
!3644 = !DILocalVariable(name: "p", arg: 1, scope: !3641, file: !66, line: 608, type: !382)
!3645 = !DILocation(line: 608, column: 41, scope: !3641)
!3646 = !DILocalVariable(name: "cpk", arg: 2, scope: !3641, file: !66, line: 608, type: !102)
!3647 = !DILocation(line: 608, column: 65, scope: !3641)
!3648 = !DILocalVariable(name: "pk", arg: 3, scope: !3641, file: !66, line: 609, type: !52)
!3649 = !DILocation(line: 609, column: 30, scope: !3641)
!3650 = !DILocation(line: 610, column: 18, scope: !3641)
!3651 = !DILocation(line: 610, column: 21, scope: !3641)
!3652 = !DILocation(line: 610, column: 25, scope: !3641)
!3653 = !DILocation(line: 610, column: 5, scope: !3641)
!3654 = !DILocation(line: 612, column: 19, scope: !3641)
!3655 = !DILocation(line: 612, column: 45, scope: !3641)
!3656 = !DILocation(line: 612, column: 25, scope: !3641)
!3657 = !DILocation(line: 612, column: 23, scope: !3641)
!3658 = !DILocation(line: 612, column: 49, scope: !3641)
!3659 = !DILocation(line: 612, column: 69, scope: !3641)
!3660 = !DILocation(line: 612, column: 54, scope: !3641)
!3661 = !DILocation(line: 612, column: 52, scope: !3641)
!3662 = !DILocation(line: 612, column: 89, scope: !3641)
!3663 = !DILocation(line: 612, column: 74, scope: !3641)
!3664 = !DILocation(line: 612, column: 72, scope: !3641)
!3665 = !DILocation(line: 612, column: 108, scope: !3641)
!3666 = !DILocation(line: 612, column: 93, scope: !3641)
!3667 = !DILocation(line: 612, column: 129, scope: !3641)
!3668 = !DILocation(line: 612, column: 111, scope: !3641)
!3669 = !DILocation(line: 612, column: 110, scope: !3641)
!3670 = !DILocation(line: 612, column: 141, scope: !3641)
!3671 = !DILocation(line: 612, column: 133, scope: !3641)
!3672 = !DILocation(line: 612, column: 5, scope: !3641)
!3673 = !DILocation(line: 614, column: 5, scope: !3641)
!3674 = distinct !DISubprogram(name: "eval_public_map", scope: !66, file: !66, line: 288, type: !3675, scopeLine: 288, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !69)
!3675 = !DISubroutineType(types: !3676)
!3676 = !{null, !382, !102, !663, !663, !663, !61}
!3677 = !DILocalVariable(name: "p", arg: 1, scope: !3674, file: !66, line: 288, type: !382)
!3678 = !DILocation(line: 288, column: 50, scope: !3674)
!3679 = !DILocalVariable(name: "s", arg: 2, scope: !3674, file: !66, line: 288, type: !102)
!3680 = !DILocation(line: 288, column: 74, scope: !3674)
!3681 = !DILocalVariable(name: "P1", arg: 3, scope: !3674, file: !66, line: 288, type: !663)
!3682 = !DILocation(line: 288, column: 93, scope: !3674)
!3683 = !DILocalVariable(name: "P2", arg: 4, scope: !3674, file: !66, line: 288, type: !663)
!3684 = !DILocation(line: 288, column: 113, scope: !3674)
!3685 = !DILocalVariable(name: "P3", arg: 5, scope: !3674, file: !66, line: 288, type: !663)
!3686 = !DILocation(line: 288, column: 133, scope: !3674)
!3687 = !DILocalVariable(name: "eval", arg: 6, scope: !3674, file: !66, line: 288, type: !61)
!3688 = !DILocation(line: 288, column: 152, scope: !3674)
!3689 = !DILocalVariable(name: "SPS", scope: !3674, file: !66, line: 289, type: !3690)
!3690 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 82944, elements: !3691)
!3691 = !{!3692}
!3692 = !DISubrange(count: 1296)
!3693 = !DILocation(line: 289, column: 14, scope: !3674)
!3694 = !DILocation(line: 291, column: 24, scope: !3674)
!3695 = !DILocation(line: 291, column: 27, scope: !3674)
!3696 = !DILocation(line: 291, column: 31, scope: !3674)
!3697 = !DILocation(line: 291, column: 35, scope: !3674)
!3698 = !DILocation(line: 291, column: 39, scope: !3674)
!3699 = !DILocation(line: 291, column: 42, scope: !3674)
!3700 = !DILocation(line: 291, column: 5, scope: !3674)
!3701 = !DILocalVariable(name: "zero", scope: !3674, file: !66, line: 292, type: !1376)
!3702 = !DILocation(line: 292, column: 19, scope: !3674)
!3703 = !DILocation(line: 293, column: 17, scope: !3674)
!3704 = !DILocation(line: 293, column: 20, scope: !3674)
!3705 = !DILocation(line: 293, column: 25, scope: !3674)
!3706 = !DILocation(line: 293, column: 31, scope: !3674)
!3707 = !DILocation(line: 293, column: 5, scope: !3674)
!3708 = !DILocation(line: 294, column: 1, scope: !3674)
!3709 = distinct !DISubprogram(name: "m_calculate_PS_SPS", scope: !660, file: !660, line: 277, type: !3710, scopeLine: 278, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !69)
!3710 = !DISubroutineType(types: !3711)
!3711 = !{null, !382, !663, !663, !663, !102, !52}
!3712 = !DILocalVariable(name: "p", arg: 1, scope: !3709, file: !660, line: 277, type: !382)
!3713 = !DILocation(line: 277, column: 60, scope: !3709)
!3714 = !DILocalVariable(name: "P1", arg: 2, scope: !3709, file: !660, line: 277, type: !663)
!3715 = !DILocation(line: 277, column: 79, scope: !3709)
!3716 = !DILocalVariable(name: "P2", arg: 3, scope: !3709, file: !660, line: 277, type: !663)
!3717 = !DILocation(line: 277, column: 99, scope: !3709)
!3718 = !DILocalVariable(name: "P3", arg: 4, scope: !3709, file: !660, line: 277, type: !663)
!3719 = !DILocation(line: 277, column: 119, scope: !3709)
!3720 = !DILocalVariable(name: "s", arg: 5, scope: !3709, file: !660, line: 277, type: !102)
!3721 = !DILocation(line: 277, column: 144, scope: !3709)
!3722 = !DILocalVariable(name: "SPS", arg: 6, scope: !3709, file: !660, line: 278, type: !52)
!3723 = !DILocation(line: 278, column: 49, scope: !3709)
!3724 = !DILocalVariable(name: "PS", scope: !3709, file: !660, line: 286, type: !3725)
!3725 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 1064448, elements: !3726)
!3726 = !{!3727}
!3727 = !DISubrange(count: 16632)
!3728 = !DILocation(line: 286, column: 14, scope: !3709)
!3729 = !DILocation(line: 287, column: 33, scope: !3709)
!3730 = !DILocation(line: 287, column: 37, scope: !3709)
!3731 = !DILocation(line: 287, column: 41, scope: !3709)
!3732 = !DILocation(line: 287, column: 45, scope: !3709)
!3733 = !DILocation(line: 287, column: 56, scope: !3709)
!3734 = !DILocation(line: 287, column: 48, scope: !3709)
!3735 = !DILocation(line: 287, column: 68, scope: !3709)
!3736 = !DILocation(line: 287, column: 60, scope: !3709)
!3737 = !DILocation(line: 287, column: 80, scope: !3709)
!3738 = !DILocation(line: 287, column: 72, scope: !3709)
!3739 = !DILocation(line: 287, column: 92, scope: !3709)
!3740 = !DILocation(line: 287, column: 84, scope: !3709)
!3741 = !DILocation(line: 287, column: 96, scope: !3709)
!3742 = !DILocation(line: 287, column: 5, scope: !3709)
!3743 = !DILocation(line: 290, column: 34, scope: !3709)
!3744 = !DILocation(line: 290, column: 38, scope: !3709)
!3745 = !DILocation(line: 290, column: 49, scope: !3709)
!3746 = !DILocation(line: 290, column: 41, scope: !3709)
!3747 = !DILocation(line: 290, column: 61, scope: !3709)
!3748 = !DILocation(line: 290, column: 53, scope: !3709)
!3749 = !DILocation(line: 290, column: 73, scope: !3709)
!3750 = !DILocation(line: 290, column: 65, scope: !3709)
!3751 = !DILocation(line: 290, column: 77, scope: !3709)
!3752 = !DILocation(line: 290, column: 5, scope: !3709)
!3753 = !DILocation(line: 292, column: 1, scope: !3709)
!3754 = distinct !DISubprogram(name: "mayo_generic_m_calculate_PS", scope: !660, file: !660, line: 151, type: !3755, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !69)
!3755 = !DISubroutineType(types: !3756)
!3756 = !{null, !663, !663, !663, !102, !463, !463, !463, !463, !52}
!3757 = !DILocalVariable(name: "P1", arg: 1, scope: !3754, file: !660, line: 151, type: !663)
!3758 = !DILocation(line: 151, column: 64, scope: !3754)
!3759 = !DILocalVariable(name: "P2", arg: 2, scope: !3754, file: !660, line: 151, type: !663)
!3760 = !DILocation(line: 151, column: 84, scope: !3754)
!3761 = !DILocalVariable(name: "P3", arg: 3, scope: !3754, file: !660, line: 151, type: !663)
!3762 = !DILocation(line: 151, column: 104, scope: !3754)
!3763 = !DILocalVariable(name: "S", arg: 4, scope: !3754, file: !660, line: 151, type: !102)
!3764 = !DILocation(line: 151, column: 129, scope: !3754)
!3765 = !DILocalVariable(name: "m", arg: 5, scope: !3754, file: !660, line: 152, type: !463)
!3766 = !DILocation(line: 152, column: 58, scope: !3754)
!3767 = !DILocalVariable(name: "v", arg: 6, scope: !3754, file: !660, line: 152, type: !463)
!3768 = !DILocation(line: 152, column: 71, scope: !3754)
!3769 = !DILocalVariable(name: "o", arg: 7, scope: !3754, file: !660, line: 152, type: !463)
!3770 = !DILocation(line: 152, column: 84, scope: !3754)
!3771 = !DILocalVariable(name: "k", arg: 8, scope: !3754, file: !660, line: 152, type: !463)
!3772 = !DILocation(line: 152, column: 97, scope: !3754)
!3773 = !DILocalVariable(name: "PS", arg: 9, scope: !3754, file: !660, line: 152, type: !52)
!3774 = !DILocation(line: 152, column: 110, scope: !3754)
!3775 = !DILocalVariable(name: "n", scope: !3754, file: !660, line: 154, type: !463)
!3776 = !DILocation(line: 154, column: 15, scope: !3754)
!3777 = !DILocation(line: 154, column: 19, scope: !3754)
!3778 = !DILocation(line: 154, column: 23, scope: !3754)
!3779 = !DILocation(line: 154, column: 21, scope: !3754)
!3780 = !DILocalVariable(name: "m_vec_limbs", scope: !3754, file: !660, line: 155, type: !463)
!3781 = !DILocation(line: 155, column: 15, scope: !3754)
!3782 = !DILocation(line: 155, column: 30, scope: !3754)
!3783 = !DILocation(line: 155, column: 32, scope: !3754)
!3784 = !DILocation(line: 155, column: 37, scope: !3754)
!3785 = !DILocalVariable(name: "accumulator", scope: !3754, file: !660, line: 157, type: !3786)
!3786 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 17031168, elements: !3787)
!3787 = !{!3788}
!3788 = !DISubrange(count: 266112)
!3789 = !DILocation(line: 157, column: 14, scope: !3754)
!3790 = !DILocalVariable(name: "P1_used", scope: !3754, file: !660, line: 158, type: !87)
!3791 = !DILocation(line: 158, column: 9, scope: !3754)
!3792 = !DILocalVariable(name: "row", scope: !3793, file: !660, line: 159, type: !87)
!3793 = distinct !DILexicalBlock(scope: !3754, file: !660, line: 159, column: 5)
!3794 = !DILocation(line: 159, column: 14, scope: !3793)
!3795 = !DILocation(line: 159, column: 10, scope: !3793)
!3796 = !DILocation(line: 159, column: 23, scope: !3797)
!3797 = distinct !DILexicalBlock(scope: !3793, file: !660, line: 159, column: 5)
!3798 = !DILocation(line: 159, column: 29, scope: !3797)
!3799 = !DILocation(line: 159, column: 27, scope: !3797)
!3800 = !DILocation(line: 159, column: 5, scope: !3793)
!3801 = !DILocalVariable(name: "j", scope: !3802, file: !660, line: 160, type: !87)
!3802 = distinct !DILexicalBlock(scope: !3803, file: !660, line: 160, column: 9)
!3803 = distinct !DILexicalBlock(scope: !3797, file: !660, line: 159, column: 39)
!3804 = !DILocation(line: 160, column: 18, scope: !3802)
!3805 = !DILocation(line: 160, column: 22, scope: !3802)
!3806 = !DILocation(line: 160, column: 14, scope: !3802)
!3807 = !DILocation(line: 160, column: 27, scope: !3808)
!3808 = distinct !DILexicalBlock(scope: !3802, file: !660, line: 160, column: 9)
!3809 = !DILocation(line: 160, column: 31, scope: !3808)
!3810 = !DILocation(line: 160, column: 29, scope: !3808)
!3811 = !DILocation(line: 160, column: 9, scope: !3802)
!3812 = !DILocalVariable(name: "col", scope: !3813, file: !660, line: 161, type: !87)
!3813 = distinct !DILexicalBlock(scope: !3814, file: !660, line: 161, column: 13)
!3814 = distinct !DILexicalBlock(scope: !3808, file: !660, line: 160, column: 39)
!3815 = !DILocation(line: 161, column: 22, scope: !3813)
!3816 = !DILocation(line: 161, column: 18, scope: !3813)
!3817 = !DILocation(line: 161, column: 31, scope: !3818)
!3818 = distinct !DILexicalBlock(scope: !3813, file: !660, line: 161, column: 13)
!3819 = !DILocation(line: 161, column: 37, scope: !3818)
!3820 = !DILocation(line: 161, column: 35, scope: !3818)
!3821 = !DILocation(line: 161, column: 13, scope: !3813)
!3822 = !DILocation(line: 162, column: 27, scope: !3823)
!3823 = distinct !DILexicalBlock(scope: !3818, file: !660, line: 161, column: 47)
!3824 = !DILocation(line: 162, column: 40, scope: !3823)
!3825 = !DILocation(line: 162, column: 46, scope: !3823)
!3826 = !DILocation(line: 162, column: 56, scope: !3823)
!3827 = !DILocation(line: 162, column: 54, scope: !3823)
!3828 = !DILocation(line: 162, column: 43, scope: !3823)
!3829 = !DILocation(line: 162, column: 70, scope: !3823)
!3830 = !DILocation(line: 162, column: 87, scope: !3823)
!3831 = !DILocation(line: 162, column: 93, scope: !3823)
!3832 = !DILocation(line: 162, column: 91, scope: !3823)
!3833 = !DILocation(line: 162, column: 97, scope: !3823)
!3834 = !DILocation(line: 162, column: 95, scope: !3823)
!3835 = !DILocation(line: 162, column: 102, scope: !3823)
!3836 = !DILocation(line: 162, column: 109, scope: !3823)
!3837 = !DILocation(line: 162, column: 111, scope: !3823)
!3838 = !DILocation(line: 162, column: 117, scope: !3823)
!3839 = !DILocation(line: 162, column: 115, scope: !3823)
!3840 = !DILocation(line: 162, column: 121, scope: !3823)
!3841 = !DILocation(line: 162, column: 119, scope: !3823)
!3842 = !DILocation(line: 162, column: 107, scope: !3823)
!3843 = !DILocation(line: 162, column: 126, scope: !3823)
!3844 = !DILocation(line: 162, column: 125, scope: !3823)
!3845 = !DILocation(line: 162, column: 82, scope: !3823)
!3846 = !DILocation(line: 162, column: 17, scope: !3823)
!3847 = !DILocation(line: 163, column: 13, scope: !3823)
!3848 = !DILocation(line: 161, column: 43, scope: !3818)
!3849 = !DILocation(line: 161, column: 13, scope: !3818)
!3850 = distinct !{!3850, !3821, !3851, !148}
!3851 = !DILocation(line: 163, column: 13, scope: !3813)
!3852 = !DILocation(line: 164, column: 21, scope: !3814)
!3853 = !DILocation(line: 165, column: 9, scope: !3814)
!3854 = !DILocation(line: 160, column: 35, scope: !3808)
!3855 = !DILocation(line: 160, column: 9, scope: !3808)
!3856 = distinct !{!3856, !3811, !3857, !148}
!3857 = !DILocation(line: 165, column: 9, scope: !3802)
!3858 = !DILocalVariable(name: "j", scope: !3859, file: !660, line: 167, type: !87)
!3859 = distinct !DILexicalBlock(scope: !3803, file: !660, line: 167, column: 9)
!3860 = !DILocation(line: 167, column: 18, scope: !3859)
!3861 = !DILocation(line: 167, column: 14, scope: !3859)
!3862 = !DILocation(line: 167, column: 25, scope: !3863)
!3863 = distinct !DILexicalBlock(scope: !3859, file: !660, line: 167, column: 9)
!3864 = !DILocation(line: 167, column: 29, scope: !3863)
!3865 = !DILocation(line: 167, column: 27, scope: !3863)
!3866 = !DILocation(line: 167, column: 9, scope: !3859)
!3867 = !DILocalVariable(name: "col", scope: !3868, file: !660, line: 168, type: !87)
!3868 = distinct !DILexicalBlock(scope: !3869, file: !660, line: 168, column: 13)
!3869 = distinct !DILexicalBlock(scope: !3863, file: !660, line: 167, column: 37)
!3870 = !DILocation(line: 168, column: 22, scope: !3868)
!3871 = !DILocation(line: 168, column: 18, scope: !3868)
!3872 = !DILocation(line: 168, column: 31, scope: !3873)
!3873 = distinct !DILexicalBlock(scope: !3868, file: !660, line: 168, column: 13)
!3874 = !DILocation(line: 168, column: 37, scope: !3873)
!3875 = !DILocation(line: 168, column: 35, scope: !3873)
!3876 = !DILocation(line: 168, column: 13, scope: !3868)
!3877 = !DILocation(line: 169, column: 27, scope: !3878)
!3878 = distinct !DILexicalBlock(scope: !3873, file: !660, line: 168, column: 47)
!3879 = !DILocation(line: 169, column: 40, scope: !3878)
!3880 = !DILocation(line: 169, column: 46, scope: !3878)
!3881 = !DILocation(line: 169, column: 52, scope: !3878)
!3882 = !DILocation(line: 169, column: 50, scope: !3878)
!3883 = !DILocation(line: 169, column: 56, scope: !3878)
!3884 = !DILocation(line: 169, column: 54, scope: !3878)
!3885 = !DILocation(line: 169, column: 59, scope: !3878)
!3886 = !DILocation(line: 169, column: 58, scope: !3878)
!3887 = !DILocation(line: 169, column: 43, scope: !3878)
!3888 = !DILocation(line: 169, column: 72, scope: !3878)
!3889 = !DILocation(line: 169, column: 89, scope: !3878)
!3890 = !DILocation(line: 169, column: 95, scope: !3878)
!3891 = !DILocation(line: 169, column: 93, scope: !3878)
!3892 = !DILocation(line: 169, column: 99, scope: !3878)
!3893 = !DILocation(line: 169, column: 97, scope: !3878)
!3894 = !DILocation(line: 169, column: 104, scope: !3878)
!3895 = !DILocation(line: 169, column: 111, scope: !3878)
!3896 = !DILocation(line: 169, column: 114, scope: !3878)
!3897 = !DILocation(line: 169, column: 120, scope: !3878)
!3898 = !DILocation(line: 169, column: 118, scope: !3878)
!3899 = !DILocation(line: 169, column: 125, scope: !3878)
!3900 = !DILocation(line: 169, column: 123, scope: !3878)
!3901 = !DILocation(line: 169, column: 129, scope: !3878)
!3902 = !DILocation(line: 169, column: 127, scope: !3878)
!3903 = !DILocation(line: 169, column: 109, scope: !3878)
!3904 = !DILocation(line: 169, column: 135, scope: !3878)
!3905 = !DILocation(line: 169, column: 133, scope: !3878)
!3906 = !DILocation(line: 169, column: 84, scope: !3878)
!3907 = !DILocation(line: 169, column: 17, scope: !3878)
!3908 = !DILocation(line: 170, column: 13, scope: !3878)
!3909 = !DILocation(line: 168, column: 43, scope: !3873)
!3910 = !DILocation(line: 168, column: 13, scope: !3873)
!3911 = distinct !{!3911, !3876, !3912, !148}
!3912 = !DILocation(line: 170, column: 13, scope: !3868)
!3913 = !DILocation(line: 171, column: 9, scope: !3869)
!3914 = !DILocation(line: 167, column: 33, scope: !3863)
!3915 = !DILocation(line: 167, column: 9, scope: !3863)
!3916 = distinct !{!3916, !3866, !3917, !148}
!3917 = !DILocation(line: 171, column: 9, scope: !3859)
!3918 = !DILocation(line: 172, column: 5, scope: !3803)
!3919 = !DILocation(line: 159, column: 35, scope: !3797)
!3920 = !DILocation(line: 159, column: 5, scope: !3797)
!3921 = distinct !{!3921, !3800, !3922, !148}
!3922 = !DILocation(line: 172, column: 5, scope: !3793)
!3923 = !DILocalVariable(name: "P3_used", scope: !3754, file: !660, line: 174, type: !87)
!3924 = !DILocation(line: 174, column: 9, scope: !3754)
!3925 = !DILocalVariable(name: "row", scope: !3926, file: !660, line: 175, type: !87)
!3926 = distinct !DILexicalBlock(scope: !3754, file: !660, line: 175, column: 5)
!3927 = !DILocation(line: 175, column: 14, scope: !3926)
!3928 = !DILocation(line: 175, column: 20, scope: !3926)
!3929 = !DILocation(line: 175, column: 10, scope: !3926)
!3930 = !DILocation(line: 175, column: 23, scope: !3931)
!3931 = distinct !DILexicalBlock(scope: !3926, file: !660, line: 175, column: 5)
!3932 = !DILocation(line: 175, column: 29, scope: !3931)
!3933 = !DILocation(line: 175, column: 27, scope: !3931)
!3934 = !DILocation(line: 175, column: 5, scope: !3926)
!3935 = !DILocalVariable(name: "j", scope: !3936, file: !660, line: 176, type: !87)
!3936 = distinct !DILexicalBlock(scope: !3937, file: !660, line: 176, column: 9)
!3937 = distinct !DILexicalBlock(scope: !3931, file: !660, line: 175, column: 39)
!3938 = !DILocation(line: 176, column: 18, scope: !3936)
!3939 = !DILocation(line: 176, column: 22, scope: !3936)
!3940 = !DILocation(line: 176, column: 14, scope: !3936)
!3941 = !DILocation(line: 176, column: 27, scope: !3942)
!3942 = distinct !DILexicalBlock(scope: !3936, file: !660, line: 176, column: 9)
!3943 = !DILocation(line: 176, column: 31, scope: !3942)
!3944 = !DILocation(line: 176, column: 29, scope: !3942)
!3945 = !DILocation(line: 176, column: 9, scope: !3936)
!3946 = !DILocalVariable(name: "col", scope: !3947, file: !660, line: 177, type: !87)
!3947 = distinct !DILexicalBlock(scope: !3948, file: !660, line: 177, column: 13)
!3948 = distinct !DILexicalBlock(scope: !3942, file: !660, line: 176, column: 39)
!3949 = !DILocation(line: 177, column: 22, scope: !3947)
!3950 = !DILocation(line: 177, column: 18, scope: !3947)
!3951 = !DILocation(line: 177, column: 31, scope: !3952)
!3952 = distinct !DILexicalBlock(scope: !3947, file: !660, line: 177, column: 13)
!3953 = !DILocation(line: 177, column: 37, scope: !3952)
!3954 = !DILocation(line: 177, column: 35, scope: !3952)
!3955 = !DILocation(line: 177, column: 13, scope: !3947)
!3956 = !DILocation(line: 178, column: 27, scope: !3957)
!3957 = distinct !DILexicalBlock(scope: !3952, file: !660, line: 177, column: 47)
!3958 = !DILocation(line: 178, column: 40, scope: !3957)
!3959 = !DILocation(line: 178, column: 45, scope: !3957)
!3960 = !DILocation(line: 178, column: 55, scope: !3957)
!3961 = !DILocation(line: 178, column: 53, scope: !3957)
!3962 = !DILocation(line: 178, column: 43, scope: !3957)
!3963 = !DILocation(line: 178, column: 68, scope: !3957)
!3964 = !DILocation(line: 178, column: 85, scope: !3957)
!3965 = !DILocation(line: 178, column: 91, scope: !3957)
!3966 = !DILocation(line: 178, column: 89, scope: !3957)
!3967 = !DILocation(line: 178, column: 95, scope: !3957)
!3968 = !DILocation(line: 178, column: 93, scope: !3957)
!3969 = !DILocation(line: 178, column: 100, scope: !3957)
!3970 = !DILocation(line: 178, column: 107, scope: !3957)
!3971 = !DILocation(line: 178, column: 109, scope: !3957)
!3972 = !DILocation(line: 178, column: 115, scope: !3957)
!3973 = !DILocation(line: 178, column: 113, scope: !3957)
!3974 = !DILocation(line: 178, column: 119, scope: !3957)
!3975 = !DILocation(line: 178, column: 117, scope: !3957)
!3976 = !DILocation(line: 178, column: 105, scope: !3957)
!3977 = !DILocation(line: 178, column: 125, scope: !3957)
!3978 = !DILocation(line: 178, column: 123, scope: !3957)
!3979 = !DILocation(line: 178, column: 80, scope: !3957)
!3980 = !DILocation(line: 178, column: 17, scope: !3957)
!3981 = !DILocation(line: 179, column: 13, scope: !3957)
!3982 = !DILocation(line: 177, column: 43, scope: !3952)
!3983 = !DILocation(line: 177, column: 13, scope: !3952)
!3984 = distinct !{!3984, !3955, !3985, !148}
!3985 = !DILocation(line: 179, column: 13, scope: !3947)
!3986 = !DILocation(line: 180, column: 21, scope: !3948)
!3987 = !DILocation(line: 181, column: 9, scope: !3948)
!3988 = !DILocation(line: 176, column: 35, scope: !3942)
!3989 = !DILocation(line: 176, column: 9, scope: !3942)
!3990 = distinct !{!3990, !3945, !3991, !148}
!3991 = !DILocation(line: 181, column: 9, scope: !3936)
!3992 = !DILocation(line: 182, column: 5, scope: !3937)
!3993 = !DILocation(line: 175, column: 35, scope: !3931)
!3994 = !DILocation(line: 175, column: 5, scope: !3931)
!3995 = distinct !{!3995, !3934, !3996, !148}
!3996 = !DILocation(line: 182, column: 5, scope: !3926)
!3997 = !DILocalVariable(name: "i", scope: !3754, file: !660, line: 185, type: !87)
!3998 = !DILocation(line: 185, column: 9, scope: !3754)
!3999 = !DILocation(line: 186, column: 5, scope: !3754)
!4000 = !DILocation(line: 186, column: 12, scope: !3754)
!4001 = !DILocation(line: 186, column: 16, scope: !3754)
!4002 = !DILocation(line: 186, column: 20, scope: !3754)
!4003 = !DILocation(line: 186, column: 18, scope: !3754)
!4004 = !DILocation(line: 186, column: 14, scope: !3754)
!4005 = !DILocation(line: 187, column: 29, scope: !4006)
!4006 = distinct !DILexicalBlock(scope: !3754, file: !660, line: 186, column: 23)
!4007 = !DILocation(line: 187, column: 42, scope: !4006)
!4008 = !DILocation(line: 187, column: 56, scope: !4006)
!4009 = !DILocation(line: 187, column: 58, scope: !4006)
!4010 = !DILocation(line: 187, column: 65, scope: !4006)
!4011 = !DILocation(line: 187, column: 63, scope: !4006)
!4012 = !DILocation(line: 187, column: 54, scope: !4006)
!4013 = !DILocation(line: 187, column: 78, scope: !4006)
!4014 = !DILocation(line: 187, column: 83, scope: !4006)
!4015 = !DILocation(line: 187, column: 87, scope: !4006)
!4016 = !DILocation(line: 187, column: 85, scope: !4006)
!4017 = !DILocation(line: 187, column: 81, scope: !4006)
!4018 = !DILocation(line: 187, column: 9, scope: !4006)
!4019 = !DILocation(line: 188, column: 10, scope: !4006)
!4020 = distinct !{!4020, !3999, !4021, !148}
!4021 = !DILocation(line: 189, column: 5, scope: !3754)
!4022 = !DILocation(line: 191, column: 1, scope: !3754)
!4023 = distinct !DISubprogram(name: "mayo_generic_m_calculate_SPS", scope: !660, file: !660, line: 195, type: !4024, scopeLine: 195, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !69)
!4024 = !DISubroutineType(types: !4025)
!4025 = !{null, !663, !102, !87, !87, !87, !52}
!4026 = !DILocalVariable(name: "PS", arg: 1, scope: !4023, file: !660, line: 195, type: !663)
!4027 = !DILocation(line: 195, column: 65, scope: !4023)
!4028 = !DILocalVariable(name: "S", arg: 2, scope: !4023, file: !660, line: 195, type: !102)
!4029 = !DILocation(line: 195, column: 90, scope: !4023)
!4030 = !DILocalVariable(name: "m", arg: 3, scope: !4023, file: !660, line: 195, type: !87)
!4031 = !DILocation(line: 195, column: 97, scope: !4023)
!4032 = !DILocalVariable(name: "k", arg: 4, scope: !4023, file: !660, line: 195, type: !87)
!4033 = !DILocation(line: 195, column: 104, scope: !4023)
!4034 = !DILocalVariable(name: "n", arg: 5, scope: !4023, file: !660, line: 195, type: !87)
!4035 = !DILocation(line: 195, column: 112, scope: !4023)
!4036 = !DILocalVariable(name: "SPS", arg: 6, scope: !4023, file: !660, line: 195, type: !52)
!4037 = !DILocation(line: 195, column: 125, scope: !4023)
!4038 = !DILocalVariable(name: "accumulator", scope: !4023, file: !660, line: 196, type: !4039)
!4039 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 1327104, elements: !4040)
!4040 = !{!4041}
!4041 = !DISubrange(count: 20736)
!4042 = !DILocation(line: 196, column: 14, scope: !4023)
!4043 = !DILocalVariable(name: "m_vec_limbs", scope: !4023, file: !660, line: 197, type: !463)
!4044 = !DILocation(line: 197, column: 15, scope: !4023)
!4045 = !DILocation(line: 197, column: 30, scope: !4023)
!4046 = !DILocation(line: 197, column: 32, scope: !4023)
!4047 = !DILocation(line: 197, column: 37, scope: !4023)
!4048 = !DILocalVariable(name: "row", scope: !4049, file: !660, line: 198, type: !87)
!4049 = distinct !DILexicalBlock(scope: !4023, file: !660, line: 198, column: 5)
!4050 = !DILocation(line: 198, column: 14, scope: !4049)
!4051 = !DILocation(line: 198, column: 10, scope: !4049)
!4052 = !DILocation(line: 198, column: 23, scope: !4053)
!4053 = distinct !DILexicalBlock(scope: !4049, file: !660, line: 198, column: 5)
!4054 = !DILocation(line: 198, column: 29, scope: !4053)
!4055 = !DILocation(line: 198, column: 27, scope: !4053)
!4056 = !DILocation(line: 198, column: 5, scope: !4049)
!4057 = !DILocalVariable(name: "j", scope: !4058, file: !660, line: 199, type: !87)
!4058 = distinct !DILexicalBlock(scope: !4059, file: !660, line: 199, column: 9)
!4059 = distinct !DILexicalBlock(scope: !4053, file: !660, line: 198, column: 39)
!4060 = !DILocation(line: 199, column: 18, scope: !4058)
!4061 = !DILocation(line: 199, column: 14, scope: !4058)
!4062 = !DILocation(line: 199, column: 25, scope: !4063)
!4063 = distinct !DILexicalBlock(scope: !4058, file: !660, line: 199, column: 9)
!4064 = !DILocation(line: 199, column: 29, scope: !4063)
!4065 = !DILocation(line: 199, column: 27, scope: !4063)
!4066 = !DILocation(line: 199, column: 9, scope: !4058)
!4067 = !DILocalVariable(name: "col", scope: !4068, file: !660, line: 200, type: !87)
!4068 = distinct !DILexicalBlock(scope: !4069, file: !660, line: 200, column: 13)
!4069 = distinct !DILexicalBlock(scope: !4063, file: !660, line: 199, column: 37)
!4070 = !DILocation(line: 200, column: 22, scope: !4068)
!4071 = !DILocation(line: 200, column: 18, scope: !4068)
!4072 = !DILocation(line: 200, column: 31, scope: !4073)
!4073 = distinct !DILexicalBlock(scope: !4068, file: !660, line: 200, column: 13)
!4074 = !DILocation(line: 200, column: 37, scope: !4073)
!4075 = !DILocation(line: 200, column: 35, scope: !4073)
!4076 = !DILocation(line: 200, column: 13, scope: !4068)
!4077 = !DILocation(line: 201, column: 31, scope: !4078)
!4078 = distinct !DILexicalBlock(scope: !4073, file: !660, line: 200, column: 50)
!4079 = !DILocation(line: 201, column: 44, scope: !4078)
!4080 = !DILocation(line: 201, column: 50, scope: !4078)
!4081 = !DILocation(line: 201, column: 54, scope: !4078)
!4082 = !DILocation(line: 201, column: 52, scope: !4078)
!4083 = !DILocation(line: 201, column: 58, scope: !4078)
!4084 = !DILocation(line: 201, column: 56, scope: !4078)
!4085 = !DILocation(line: 201, column: 65, scope: !4078)
!4086 = !DILocation(line: 201, column: 63, scope: !4078)
!4087 = !DILocation(line: 201, column: 47, scope: !4078)
!4088 = !DILocation(line: 201, column: 78, scope: !4078)
!4089 = !DILocation(line: 201, column: 95, scope: !4078)
!4090 = !DILocation(line: 201, column: 101, scope: !4078)
!4091 = !DILocation(line: 201, column: 99, scope: !4078)
!4092 = !DILocation(line: 201, column: 105, scope: !4078)
!4093 = !DILocation(line: 201, column: 103, scope: !4078)
!4094 = !DILocation(line: 201, column: 110, scope: !4078)
!4095 = !DILocation(line: 201, column: 117, scope: !4078)
!4096 = !DILocation(line: 201, column: 119, scope: !4078)
!4097 = !DILocation(line: 201, column: 125, scope: !4078)
!4098 = !DILocation(line: 201, column: 123, scope: !4078)
!4099 = !DILocation(line: 201, column: 129, scope: !4078)
!4100 = !DILocation(line: 201, column: 127, scope: !4078)
!4101 = !DILocation(line: 201, column: 115, scope: !4078)
!4102 = !DILocation(line: 201, column: 134, scope: !4078)
!4103 = !DILocation(line: 201, column: 133, scope: !4078)
!4104 = !DILocation(line: 201, column: 90, scope: !4078)
!4105 = !DILocation(line: 201, column: 21, scope: !4078)
!4106 = !DILocation(line: 202, column: 13, scope: !4078)
!4107 = !DILocation(line: 200, column: 44, scope: !4073)
!4108 = !DILocation(line: 200, column: 13, scope: !4073)
!4109 = distinct !{!4109, !4076, !4110, !148}
!4110 = !DILocation(line: 202, column: 13, scope: !4068)
!4111 = !DILocation(line: 203, column: 9, scope: !4069)
!4112 = !DILocation(line: 199, column: 33, scope: !4063)
!4113 = !DILocation(line: 199, column: 9, scope: !4063)
!4114 = distinct !{!4114, !4066, !4115, !148}
!4115 = !DILocation(line: 203, column: 9, scope: !4058)
!4116 = !DILocation(line: 204, column: 5, scope: !4059)
!4117 = !DILocation(line: 198, column: 35, scope: !4053)
!4118 = !DILocation(line: 198, column: 5, scope: !4053)
!4119 = distinct !{!4119, !4056, !4120, !148}
!4120 = !DILocation(line: 204, column: 5, scope: !4049)
!4121 = !DILocalVariable(name: "i", scope: !4023, file: !660, line: 207, type: !87)
!4122 = !DILocation(line: 207, column: 9, scope: !4023)
!4123 = !DILocation(line: 208, column: 5, scope: !4023)
!4124 = !DILocation(line: 208, column: 12, scope: !4023)
!4125 = !DILocation(line: 208, column: 16, scope: !4023)
!4126 = !DILocation(line: 208, column: 18, scope: !4023)
!4127 = !DILocation(line: 208, column: 17, scope: !4023)
!4128 = !DILocation(line: 208, column: 14, scope: !4023)
!4129 = !DILocation(line: 209, column: 29, scope: !4130)
!4130 = distinct !DILexicalBlock(scope: !4023, file: !660, line: 208, column: 21)
!4131 = !DILocation(line: 209, column: 42, scope: !4130)
!4132 = !DILocation(line: 209, column: 56, scope: !4130)
!4133 = !DILocation(line: 209, column: 58, scope: !4130)
!4134 = !DILocation(line: 209, column: 65, scope: !4130)
!4135 = !DILocation(line: 209, column: 63, scope: !4130)
!4136 = !DILocation(line: 209, column: 54, scope: !4130)
!4137 = !DILocation(line: 209, column: 78, scope: !4130)
!4138 = !DILocation(line: 209, column: 84, scope: !4130)
!4139 = !DILocation(line: 209, column: 88, scope: !4130)
!4140 = !DILocation(line: 209, column: 86, scope: !4130)
!4141 = !DILocation(line: 209, column: 82, scope: !4130)
!4142 = !DILocation(line: 209, column: 9, scope: !4130)
!4143 = !DILocation(line: 210, column: 10, scope: !4130)
!4144 = distinct !{!4144, !4123, !4145, !148}
!4145 = !DILocation(line: 211, column: 5, scope: !4023)
!4146 = !DILocation(line: 212, column: 1, scope: !4023)
!4147 = distinct !DISubprogram(name: "m_vec_add", scope: !864, file: !864, line: 17, type: !4148, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !69)
!4148 = !DISubroutineType(types: !4149)
!4149 = !{null, !87, !663, !52}
!4150 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !4147, file: !864, line: 17, type: !87)
!4151 = !DILocation(line: 17, column: 27, scope: !4147)
!4152 = !DILocalVariable(name: "in", arg: 2, scope: !4147, file: !864, line: 17, type: !663)
!4153 = !DILocation(line: 17, column: 56, scope: !4147)
!4154 = !DILocalVariable(name: "acc", arg: 3, scope: !4147, file: !864, line: 17, type: !52)
!4155 = !DILocation(line: 17, column: 70, scope: !4147)
!4156 = !DILocalVariable(name: "i", scope: !4157, file: !864, line: 18, type: !87)
!4157 = distinct !DILexicalBlock(scope: !4147, file: !864, line: 18, column: 5)
!4158 = !DILocation(line: 18, column: 14, scope: !4157)
!4159 = !DILocation(line: 18, column: 10, scope: !4157)
!4160 = !DILocation(line: 18, column: 21, scope: !4161)
!4161 = distinct !DILexicalBlock(scope: !4157, file: !864, line: 18, column: 5)
!4162 = !DILocation(line: 18, column: 25, scope: !4161)
!4163 = !DILocation(line: 18, column: 23, scope: !4161)
!4164 = !DILocation(line: 18, column: 5, scope: !4157)
!4165 = !DILocation(line: 19, column: 19, scope: !4166)
!4166 = distinct !DILexicalBlock(scope: !4161, file: !864, line: 18, column: 43)
!4167 = !DILocation(line: 19, column: 22, scope: !4166)
!4168 = !DILocation(line: 19, column: 9, scope: !4166)
!4169 = !DILocation(line: 19, column: 13, scope: !4166)
!4170 = !DILocation(line: 19, column: 16, scope: !4166)
!4171 = !DILocation(line: 20, column: 5, scope: !4166)
!4172 = !DILocation(line: 18, column: 39, scope: !4161)
!4173 = !DILocation(line: 18, column: 5, scope: !4161)
!4174 = distinct !{!4174, !4164, !4175, !148}
!4175 = !DILocation(line: 20, column: 5, scope: !4157)
!4176 = !DILocation(line: 21, column: 1, scope: !4147)
!4177 = distinct !DISubprogram(name: "m_vec_multiply_bins", scope: !864, file: !864, line: 49, type: !4178, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !69)
!4178 = !DISubroutineType(types: !4179)
!4179 = !{null, !87, !52, !52}
!4180 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !4177, file: !864, line: 49, type: !87)
!4181 = !DILocation(line: 49, column: 38, scope: !4177)
!4182 = !DILocalVariable(name: "bins", arg: 2, scope: !4177, file: !864, line: 49, type: !52)
!4183 = !DILocation(line: 49, column: 61, scope: !4177)
!4184 = !DILocalVariable(name: "out", arg: 3, scope: !4177, file: !864, line: 49, type: !52)
!4185 = !DILocation(line: 49, column: 77, scope: !4177)
!4186 = !DILocation(line: 51, column: 26, scope: !4177)
!4187 = !DILocation(line: 51, column: 39, scope: !4177)
!4188 = !DILocation(line: 51, column: 51, scope: !4177)
!4189 = !DILocation(line: 51, column: 49, scope: !4177)
!4190 = !DILocation(line: 51, column: 44, scope: !4177)
!4191 = !DILocation(line: 51, column: 64, scope: !4177)
!4192 = !DILocation(line: 51, column: 77, scope: !4177)
!4193 = !DILocation(line: 51, column: 75, scope: !4177)
!4194 = !DILocation(line: 51, column: 69, scope: !4177)
!4195 = !DILocation(line: 51, column: 5, scope: !4177)
!4196 = !DILocation(line: 52, column: 22, scope: !4177)
!4197 = !DILocation(line: 52, column: 35, scope: !4177)
!4198 = !DILocation(line: 52, column: 47, scope: !4177)
!4199 = !DILocation(line: 52, column: 45, scope: !4177)
!4200 = !DILocation(line: 52, column: 40, scope: !4177)
!4201 = !DILocation(line: 52, column: 60, scope: !4177)
!4202 = !DILocation(line: 52, column: 72, scope: !4177)
!4203 = !DILocation(line: 52, column: 70, scope: !4177)
!4204 = !DILocation(line: 52, column: 65, scope: !4177)
!4205 = !DILocation(line: 52, column: 5, scope: !4177)
!4206 = !DILocation(line: 53, column: 26, scope: !4177)
!4207 = !DILocation(line: 53, column: 39, scope: !4177)
!4208 = !DILocation(line: 53, column: 52, scope: !4177)
!4209 = !DILocation(line: 53, column: 50, scope: !4177)
!4210 = !DILocation(line: 53, column: 44, scope: !4177)
!4211 = !DILocation(line: 53, column: 65, scope: !4177)
!4212 = !DILocation(line: 53, column: 77, scope: !4177)
!4213 = !DILocation(line: 53, column: 75, scope: !4177)
!4214 = !DILocation(line: 53, column: 70, scope: !4177)
!4215 = !DILocation(line: 53, column: 5, scope: !4177)
!4216 = !DILocation(line: 54, column: 22, scope: !4177)
!4217 = !DILocation(line: 54, column: 35, scope: !4177)
!4218 = !DILocation(line: 54, column: 47, scope: !4177)
!4219 = !DILocation(line: 54, column: 45, scope: !4177)
!4220 = !DILocation(line: 54, column: 40, scope: !4177)
!4221 = !DILocation(line: 54, column: 60, scope: !4177)
!4222 = !DILocation(line: 54, column: 72, scope: !4177)
!4223 = !DILocation(line: 54, column: 70, scope: !4177)
!4224 = !DILocation(line: 54, column: 65, scope: !4177)
!4225 = !DILocation(line: 54, column: 5, scope: !4177)
!4226 = !DILocation(line: 55, column: 26, scope: !4177)
!4227 = !DILocation(line: 55, column: 39, scope: !4177)
!4228 = !DILocation(line: 55, column: 51, scope: !4177)
!4229 = !DILocation(line: 55, column: 49, scope: !4177)
!4230 = !DILocation(line: 55, column: 44, scope: !4177)
!4231 = !DILocation(line: 55, column: 64, scope: !4177)
!4232 = !DILocation(line: 55, column: 77, scope: !4177)
!4233 = !DILocation(line: 55, column: 75, scope: !4177)
!4234 = !DILocation(line: 55, column: 69, scope: !4177)
!4235 = !DILocation(line: 55, column: 5, scope: !4177)
!4236 = !DILocation(line: 56, column: 22, scope: !4177)
!4237 = !DILocation(line: 56, column: 35, scope: !4177)
!4238 = !DILocation(line: 56, column: 47, scope: !4177)
!4239 = !DILocation(line: 56, column: 45, scope: !4177)
!4240 = !DILocation(line: 56, column: 40, scope: !4177)
!4241 = !DILocation(line: 56, column: 60, scope: !4177)
!4242 = !DILocation(line: 56, column: 72, scope: !4177)
!4243 = !DILocation(line: 56, column: 70, scope: !4177)
!4244 = !DILocation(line: 56, column: 65, scope: !4177)
!4245 = !DILocation(line: 56, column: 5, scope: !4177)
!4246 = !DILocation(line: 57, column: 26, scope: !4177)
!4247 = !DILocation(line: 57, column: 39, scope: !4177)
!4248 = !DILocation(line: 57, column: 52, scope: !4177)
!4249 = !DILocation(line: 57, column: 50, scope: !4177)
!4250 = !DILocation(line: 57, column: 44, scope: !4177)
!4251 = !DILocation(line: 57, column: 65, scope: !4177)
!4252 = !DILocation(line: 57, column: 78, scope: !4177)
!4253 = !DILocation(line: 57, column: 76, scope: !4177)
!4254 = !DILocation(line: 57, column: 70, scope: !4177)
!4255 = !DILocation(line: 57, column: 5, scope: !4177)
!4256 = !DILocation(line: 58, column: 22, scope: !4177)
!4257 = !DILocation(line: 58, column: 35, scope: !4177)
!4258 = !DILocation(line: 58, column: 47, scope: !4177)
!4259 = !DILocation(line: 58, column: 45, scope: !4177)
!4260 = !DILocation(line: 58, column: 40, scope: !4177)
!4261 = !DILocation(line: 58, column: 60, scope: !4177)
!4262 = !DILocation(line: 58, column: 72, scope: !4177)
!4263 = !DILocation(line: 58, column: 70, scope: !4177)
!4264 = !DILocation(line: 58, column: 65, scope: !4177)
!4265 = !DILocation(line: 58, column: 5, scope: !4177)
!4266 = !DILocation(line: 59, column: 26, scope: !4177)
!4267 = !DILocation(line: 59, column: 39, scope: !4177)
!4268 = !DILocation(line: 59, column: 52, scope: !4177)
!4269 = !DILocation(line: 59, column: 50, scope: !4177)
!4270 = !DILocation(line: 59, column: 44, scope: !4177)
!4271 = !DILocation(line: 59, column: 65, scope: !4177)
!4272 = !DILocation(line: 59, column: 78, scope: !4177)
!4273 = !DILocation(line: 59, column: 76, scope: !4177)
!4274 = !DILocation(line: 59, column: 70, scope: !4177)
!4275 = !DILocation(line: 59, column: 5, scope: !4177)
!4276 = !DILocation(line: 60, column: 22, scope: !4177)
!4277 = !DILocation(line: 60, column: 35, scope: !4177)
!4278 = !DILocation(line: 60, column: 47, scope: !4177)
!4279 = !DILocation(line: 60, column: 45, scope: !4177)
!4280 = !DILocation(line: 60, column: 40, scope: !4177)
!4281 = !DILocation(line: 60, column: 60, scope: !4177)
!4282 = !DILocation(line: 60, column: 72, scope: !4177)
!4283 = !DILocation(line: 60, column: 70, scope: !4177)
!4284 = !DILocation(line: 60, column: 65, scope: !4177)
!4285 = !DILocation(line: 60, column: 5, scope: !4177)
!4286 = !DILocation(line: 61, column: 26, scope: !4177)
!4287 = !DILocation(line: 61, column: 39, scope: !4177)
!4288 = !DILocation(line: 61, column: 52, scope: !4177)
!4289 = !DILocation(line: 61, column: 50, scope: !4177)
!4290 = !DILocation(line: 61, column: 44, scope: !4177)
!4291 = !DILocation(line: 61, column: 65, scope: !4177)
!4292 = !DILocation(line: 61, column: 77, scope: !4177)
!4293 = !DILocation(line: 61, column: 75, scope: !4177)
!4294 = !DILocation(line: 61, column: 70, scope: !4177)
!4295 = !DILocation(line: 61, column: 5, scope: !4177)
!4296 = !DILocation(line: 62, column: 22, scope: !4177)
!4297 = !DILocation(line: 62, column: 35, scope: !4177)
!4298 = !DILocation(line: 62, column: 47, scope: !4177)
!4299 = !DILocation(line: 62, column: 45, scope: !4177)
!4300 = !DILocation(line: 62, column: 40, scope: !4177)
!4301 = !DILocation(line: 62, column: 60, scope: !4177)
!4302 = !DILocation(line: 62, column: 72, scope: !4177)
!4303 = !DILocation(line: 62, column: 70, scope: !4177)
!4304 = !DILocation(line: 62, column: 65, scope: !4177)
!4305 = !DILocation(line: 62, column: 5, scope: !4177)
!4306 = !DILocation(line: 63, column: 26, scope: !4177)
!4307 = !DILocation(line: 63, column: 39, scope: !4177)
!4308 = !DILocation(line: 63, column: 52, scope: !4177)
!4309 = !DILocation(line: 63, column: 50, scope: !4177)
!4310 = !DILocation(line: 63, column: 44, scope: !4177)
!4311 = !DILocation(line: 63, column: 65, scope: !4177)
!4312 = !DILocation(line: 63, column: 77, scope: !4177)
!4313 = !DILocation(line: 63, column: 75, scope: !4177)
!4314 = !DILocation(line: 63, column: 70, scope: !4177)
!4315 = !DILocation(line: 63, column: 5, scope: !4177)
!4316 = !DILocation(line: 64, column: 22, scope: !4177)
!4317 = !DILocation(line: 64, column: 35, scope: !4177)
!4318 = !DILocation(line: 64, column: 47, scope: !4177)
!4319 = !DILocation(line: 64, column: 45, scope: !4177)
!4320 = !DILocation(line: 64, column: 40, scope: !4177)
!4321 = !DILocation(line: 64, column: 60, scope: !4177)
!4322 = !DILocation(line: 64, column: 72, scope: !4177)
!4323 = !DILocation(line: 64, column: 70, scope: !4177)
!4324 = !DILocation(line: 64, column: 65, scope: !4177)
!4325 = !DILocation(line: 64, column: 5, scope: !4177)
!4326 = !DILocation(line: 65, column: 17, scope: !4177)
!4327 = !DILocation(line: 65, column: 30, scope: !4177)
!4328 = !DILocation(line: 65, column: 37, scope: !4177)
!4329 = !DILocation(line: 65, column: 35, scope: !4177)
!4330 = !DILocation(line: 65, column: 50, scope: !4177)
!4331 = !DILocation(line: 65, column: 5, scope: !4177)
!4332 = !DILocation(line: 66, column: 1, scope: !4177)
!4333 = distinct !DISubprogram(name: "m_vec_mul_add_x_inv", scope: !864, file: !864, line: 40, type: !4148, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !69)
!4334 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !4333, file: !864, line: 40, type: !87)
!4335 = !DILocation(line: 40, column: 38, scope: !4333)
!4336 = !DILocalVariable(name: "in", arg: 2, scope: !4333, file: !864, line: 40, type: !663)
!4337 = !DILocation(line: 40, column: 67, scope: !4333)
!4338 = !DILocalVariable(name: "acc", arg: 3, scope: !4333, file: !864, line: 40, type: !52)
!4339 = !DILocation(line: 40, column: 81, scope: !4333)
!4340 = !DILocalVariable(name: "mask_lsb", scope: !4333, file: !864, line: 41, type: !53)
!4341 = !DILocation(line: 41, column: 14, scope: !4333)
!4342 = !DILocalVariable(name: "i", scope: !4343, file: !864, line: 42, type: !87)
!4343 = distinct !DILexicalBlock(scope: !4333, file: !864, line: 42, column: 5)
!4344 = !DILocation(line: 42, column: 13, scope: !4343)
!4345 = !DILocation(line: 42, column: 9, scope: !4343)
!4346 = !DILocation(line: 42, column: 18, scope: !4347)
!4347 = distinct !DILexicalBlock(scope: !4343, file: !864, line: 42, column: 5)
!4348 = !DILocation(line: 42, column: 22, scope: !4347)
!4349 = !DILocation(line: 42, column: 20, scope: !4347)
!4350 = !DILocation(line: 42, column: 5, scope: !4343)
!4351 = !DILocalVariable(name: "t", scope: !4352, file: !864, line: 43, type: !53)
!4352 = distinct !DILexicalBlock(scope: !4347, file: !864, line: 42, column: 39)
!4353 = !DILocation(line: 43, column: 18, scope: !4352)
!4354 = !DILocation(line: 43, column: 22, scope: !4352)
!4355 = !DILocation(line: 43, column: 25, scope: !4352)
!4356 = !DILocation(line: 43, column: 30, scope: !4352)
!4357 = !DILocation(line: 43, column: 28, scope: !4352)
!4358 = !DILocation(line: 44, column: 21, scope: !4352)
!4359 = !DILocation(line: 44, column: 24, scope: !4352)
!4360 = !DILocation(line: 44, column: 29, scope: !4352)
!4361 = !DILocation(line: 44, column: 27, scope: !4352)
!4362 = !DILocation(line: 44, column: 32, scope: !4352)
!4363 = !DILocation(line: 44, column: 41, scope: !4352)
!4364 = !DILocation(line: 44, column: 43, scope: !4352)
!4365 = !DILocation(line: 44, column: 38, scope: !4352)
!4366 = !DILocation(line: 44, column: 9, scope: !4352)
!4367 = !DILocation(line: 44, column: 13, scope: !4352)
!4368 = !DILocation(line: 44, column: 16, scope: !4352)
!4369 = !DILocation(line: 45, column: 5, scope: !4352)
!4370 = !DILocation(line: 42, column: 36, scope: !4347)
!4371 = !DILocation(line: 42, column: 5, scope: !4347)
!4372 = distinct !{!4372, !4350, !4373, !148}
!4373 = !DILocation(line: 45, column: 5, scope: !4343)
!4374 = !DILocation(line: 46, column: 1, scope: !4333)
!4375 = distinct !DISubprogram(name: "m_vec_mul_add_x", scope: !864, file: !864, line: 31, type: !4148, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !69)
!4376 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !4375, file: !864, line: 31, type: !87)
!4377 = !DILocation(line: 31, column: 34, scope: !4375)
!4378 = !DILocalVariable(name: "in", arg: 2, scope: !4375, file: !864, line: 31, type: !663)
!4379 = !DILocation(line: 31, column: 63, scope: !4375)
!4380 = !DILocalVariable(name: "acc", arg: 3, scope: !4375, file: !864, line: 31, type: !52)
!4381 = !DILocation(line: 31, column: 77, scope: !4375)
!4382 = !DILocalVariable(name: "mask_msb", scope: !4375, file: !864, line: 32, type: !53)
!4383 = !DILocation(line: 32, column: 14, scope: !4375)
!4384 = !DILocalVariable(name: "i", scope: !4385, file: !864, line: 33, type: !87)
!4385 = distinct !DILexicalBlock(scope: !4375, file: !864, line: 33, column: 5)
!4386 = !DILocation(line: 33, column: 13, scope: !4385)
!4387 = !DILocation(line: 33, column: 9, scope: !4385)
!4388 = !DILocation(line: 33, column: 18, scope: !4389)
!4389 = distinct !DILexicalBlock(scope: !4385, file: !864, line: 33, column: 5)
!4390 = !DILocation(line: 33, column: 22, scope: !4389)
!4391 = !DILocation(line: 33, column: 20, scope: !4389)
!4392 = !DILocation(line: 33, column: 5, scope: !4385)
!4393 = !DILocalVariable(name: "t", scope: !4394, file: !864, line: 34, type: !53)
!4394 = distinct !DILexicalBlock(scope: !4389, file: !864, line: 33, column: 39)
!4395 = !DILocation(line: 34, column: 18, scope: !4394)
!4396 = !DILocation(line: 34, column: 22, scope: !4394)
!4397 = !DILocation(line: 34, column: 25, scope: !4394)
!4398 = !DILocation(line: 34, column: 30, scope: !4394)
!4399 = !DILocation(line: 34, column: 28, scope: !4394)
!4400 = !DILocation(line: 35, column: 21, scope: !4394)
!4401 = !DILocation(line: 35, column: 24, scope: !4394)
!4402 = !DILocation(line: 35, column: 29, scope: !4394)
!4403 = !DILocation(line: 35, column: 27, scope: !4394)
!4404 = !DILocation(line: 35, column: 32, scope: !4394)
!4405 = !DILocation(line: 35, column: 42, scope: !4394)
!4406 = !DILocation(line: 35, column: 44, scope: !4394)
!4407 = !DILocation(line: 35, column: 50, scope: !4394)
!4408 = !DILocation(line: 35, column: 38, scope: !4394)
!4409 = !DILocation(line: 35, column: 9, scope: !4394)
!4410 = !DILocation(line: 35, column: 13, scope: !4394)
!4411 = !DILocation(line: 35, column: 16, scope: !4394)
!4412 = !DILocation(line: 36, column: 5, scope: !4394)
!4413 = !DILocation(line: 33, column: 36, scope: !4389)
!4414 = !DILocation(line: 33, column: 5, scope: !4389)
!4415 = distinct !{!4415, !4392, !4416, !148}
!4416 = !DILocation(line: 36, column: 5, scope: !4385)
!4417 = !DILocation(line: 37, column: 1, scope: !4375)
!4418 = distinct !DISubprogram(name: "m_vec_copy", scope: !864, file: !864, line: 10, type: !4148, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !69)
!4419 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !4418, file: !864, line: 10, type: !87)
!4420 = !DILocation(line: 10, column: 28, scope: !4418)
!4421 = !DILocalVariable(name: "in", arg: 2, scope: !4418, file: !864, line: 10, type: !663)
!4422 = !DILocation(line: 10, column: 57, scope: !4418)
!4423 = !DILocalVariable(name: "out", arg: 3, scope: !4418, file: !864, line: 10, type: !52)
!4424 = !DILocation(line: 10, column: 71, scope: !4418)
!4425 = !DILocalVariable(name: "i", scope: !4426, file: !864, line: 11, type: !87)
!4426 = distinct !DILexicalBlock(scope: !4418, file: !864, line: 11, column: 5)
!4427 = !DILocation(line: 11, column: 14, scope: !4426)
!4428 = !DILocation(line: 11, column: 10, scope: !4426)
!4429 = !DILocation(line: 11, column: 21, scope: !4430)
!4430 = distinct !DILexicalBlock(scope: !4426, file: !864, line: 11, column: 5)
!4431 = !DILocation(line: 11, column: 25, scope: !4430)
!4432 = !DILocation(line: 11, column: 23, scope: !4430)
!4433 = !DILocation(line: 11, column: 5, scope: !4426)
!4434 = !DILocation(line: 12, column: 18, scope: !4435)
!4435 = distinct !DILexicalBlock(scope: !4430, file: !864, line: 11, column: 43)
!4436 = !DILocation(line: 12, column: 21, scope: !4435)
!4437 = !DILocation(line: 12, column: 9, scope: !4435)
!4438 = !DILocation(line: 12, column: 13, scope: !4435)
!4439 = !DILocation(line: 12, column: 16, scope: !4435)
!4440 = !DILocation(line: 13, column: 5, scope: !4435)
!4441 = !DILocation(line: 11, column: 39, scope: !4430)
!4442 = !DILocation(line: 11, column: 5, scope: !4430)
!4443 = distinct !{!4443, !4433, !4444, !148}
!4444 = !DILocation(line: 13, column: 5, scope: !4426)
!4445 = !DILocation(line: 14, column: 1, scope: !4418)
