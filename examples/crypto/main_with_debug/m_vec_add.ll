; ModuleID = '../../mayo_IR/mayo1.ll'
source_filename = "composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "thumbv7em-unknown-none-eabihf"

; Function Attrs: inlinehint nounwind
define dso_local fastcc void @m_vec_add(i32 noundef %m_vec_limbs, ptr noundef nonnull %in, ptr noundef nonnull %acc) unnamed_addr #0 !dbg !130 {
entry:
    #dbg_value(i32 %m_vec_limbs, !135, !DIExpression(), !136)
    #dbg_value(ptr %in, !137, !DIExpression(), !136)
    #dbg_value(ptr %acc, !138, !DIExpression(), !136)
    #dbg_value(i32 0, !139, !DIExpression(), !141)
  br label %iter_0_start

for.end:                                          ; preds = %iter_4_end
  ret void, !dbg !142

iter_0_start:                                     ; preds = %entry
  br label %for.body.iter0

for.body.iter0:                                   ; preds = %iter_0_start
    #dbg_value(i32 undef, !139, !DIExpression(), !141)
  %arrayidx.iter0 = getelementptr inbounds nuw i64, ptr %in, i32 0, !dbg !143
  %0 = load i64, ptr %arrayidx.iter0, align 8, !dbg !143
  %arrayidx1.iter0 = getelementptr inbounds nuw i64, ptr %acc, i32 0, !dbg !146
  %1 = load i64, ptr %arrayidx1.iter0, align 8, !dbg !147
  %xor.iter0 = xor i64 %1, %0, !dbg !147
  store i64 %xor.iter0, ptr %arrayidx1.iter0, align 8, !dbg !147
    #dbg_value(i32 undef, !139, !DIExpression(), !141)
  br label %iter_0_end

iter_0_end:                                       ; preds = %for.body.iter0
  br label %iter_1_start

iter_1_start:                                     ; preds = %iter_0_end
  br label %for.body.iter1

for.body.iter1:                                   ; preds = %iter_1_start
    #dbg_value(i32 undef, !139, !DIExpression(), !141)
  %arrayidx.iter1 = getelementptr inbounds nuw i64, ptr %in, i32 1, !dbg !143
  %2 = load i64, ptr %arrayidx.iter1, align 8, !dbg !143
  %arrayidx1.iter1 = getelementptr inbounds nuw i64, ptr %acc, i32 1, !dbg !146
  %3 = load i64, ptr %arrayidx1.iter1, align 8, !dbg !147
  %xor.iter1 = xor i64 %3, %2, !dbg !147
  store i64 %xor.iter1, ptr %arrayidx1.iter1, align 8, !dbg !147
    #dbg_value(i32 undef, !139, !DIExpression(), !141)
  br label %iter_1_end

iter_1_end:                                       ; preds = %for.body.iter1
  br label %iter_2_start

iter_2_start:                                     ; preds = %iter_1_end
  br label %for.body.iter2

for.body.iter2:                                   ; preds = %iter_2_start
    #dbg_value(i32 undef, !139, !DIExpression(), !141)
  %arrayidx.iter2 = getelementptr inbounds nuw i64, ptr %in, i32 2, !dbg !143
  %4 = load i64, ptr %arrayidx.iter2, align 8, !dbg !143
  %arrayidx1.iter2 = getelementptr inbounds nuw i64, ptr %acc, i32 2, !dbg !146
  %5 = load i64, ptr %arrayidx1.iter2, align 8, !dbg !147
  %xor.iter2 = xor i64 %5, %4, !dbg !147
  store i64 %xor.iter2, ptr %arrayidx1.iter2, align 8, !dbg !147
    #dbg_value(i32 undef, !139, !DIExpression(), !141)
  br label %iter_2_end

iter_2_end:                                       ; preds = %for.body.iter2
  br label %iter_3_start

iter_3_start:                                     ; preds = %iter_2_end
  br label %for.body.iter3

for.body.iter3:                                   ; preds = %iter_3_start
    #dbg_value(i32 undef, !139, !DIExpression(), !141)
  %arrayidx.iter3 = getelementptr inbounds nuw i64, ptr %in, i32 3, !dbg !143
  %6 = load i64, ptr %arrayidx.iter3, align 8, !dbg !143
  %arrayidx1.iter3 = getelementptr inbounds nuw i64, ptr %acc, i32 3, !dbg !146
  %7 = load i64, ptr %arrayidx1.iter3, align 8, !dbg !147
  %xor.iter3 = xor i64 %7, %6, !dbg !147
  store i64 %xor.iter3, ptr %arrayidx1.iter3, align 8, !dbg !147
    #dbg_value(i32 undef, !139, !DIExpression(), !141)
  br label %iter_3_end

iter_3_end:                                       ; preds = %for.body.iter3
  br label %iter_4_start

iter_4_start:                                     ; preds = %iter_3_end
  br label %for.body.iter4

for.body.iter4:                                   ; preds = %iter_4_start
    #dbg_value(i32 undef, !139, !DIExpression(), !141)
  %arrayidx.iter4 = getelementptr inbounds nuw i64, ptr %in, i32 4, !dbg !143
  %8 = load i64, ptr %arrayidx.iter4, align 8, !dbg !143
  %arrayidx1.iter4 = getelementptr inbounds nuw i64, ptr %acc, i32 4, !dbg !146
  %9 = load i64, ptr %arrayidx1.iter4, align 8, !dbg !147
  %xor.iter4 = xor i64 %9, %8, !dbg !147
  store i64 %xor.iter4, ptr %arrayidx1.iter4, align 8, !dbg !147
    #dbg_value(i32 undef, !139, !DIExpression(), !141)
  br label %iter_4_end

iter_4_end:                                       ; preds = %for.body.iter4
  br label %for.end
}

; Function Attrs: inlinehint
define i32 @main() local_unnamed_addr #1 {
entry:
  %pk = alloca [18705 x i64], align 16, !llvmbmc.var !148
  call void @mayo_memset(ptr %pk, i8 0, i32 149640)
  store i8 -96, ptr %pk, align 1
  %byte1 = getelementptr inbounds nuw i8, ptr %pk, i32 1
  store i8 104, ptr %byte1, align 1
  %byte2 = getelementptr inbounds nuw i8, ptr %pk, i32 2
  store i8 11, ptr %byte2, align 1
  %byte3 = getelementptr inbounds nuw i8, ptr %pk, i32 3
  store i8 81, ptr %byte3, align 1
  %byte4 = getelementptr inbounds nuw i8, ptr %pk, i32 4
  store i8 78, ptr %byte4, align 1
  %byte5 = getelementptr inbounds nuw i8, ptr %pk, i32 5
  store i8 -66, ptr %byte5, align 1
  %byte6 = getelementptr inbounds nuw i8, ptr %pk, i32 6
  store i8 -42, ptr %byte6, align 1
  %byte7 = getelementptr inbounds nuw i8, ptr %pk, i32 7
  store i8 58, ptr %byte7, align 1
  %accumulator = alloca [68800 x i64], align 16, !llvmbmc.var !149
  call void @mayo_memset(ptr %accumulator, i8 0, i32 550400)
  call fastcc void @m_vec_add(i32 5, ptr %pk, ptr %accumulator)
  %out_actual_i8 = load i8, ptr %accumulator, align 1
  %out_cmp = icmp eq i8 %out_actual_i8, 61
  call void @_Z6assertb(i1 noundef zeroext %out_cmp)
  ret i32 0
}

declare void @_Z6assertb(i1 noundef zeroext) local_unnamed_addr

; Function Attrs: nounwind
define dso_local void @mayo_memset(ptr noundef %dst, i8 noundef zeroext %val, i32 noundef %len) local_unnamed_addr #2 !dbg !150 {
entry:
    #dbg_value(ptr %dst, !154, !DIExpression(), !155)
    #dbg_value(i8 %val, !156, !DIExpression(), !155)
    #dbg_value(i32 %len, !157, !DIExpression(), !155)
    #dbg_value(ptr %dst, !158, !DIExpression(), !155)
    #dbg_value(i32 0, !159, !DIExpression(), !161)
  br label %for.cond, !dbg !162

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !163
    #dbg_value(i32 %i.0, !159, !DIExpression(), !161)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !164
  br i1 %exitcond, label %for.body, label %for.end, !dbg !166

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %dst, i32 %i.0, !dbg !167
  store i8 %val, ptr %arrayidx, align 1, !dbg !168
  %inc = add i32 %i.0, 1, !dbg !169
    #dbg_value(i32 %inc, !159, !DIExpression(), !161)
  br label %for.cond, !dbg !170, !llvm.loop !171

for.end:                                          ; preds = %for.cond
  ret void, !dbg !174
}

; Function Attrs: nounwind
define dso_local void @mayo_memcpy(ptr noundef %dst, ptr noundef %src, i32 noundef %len) local_unnamed_addr #2 !dbg !175 {
entry:
    #dbg_value(ptr %dst, !180, !DIExpression(), !181)
    #dbg_value(ptr %src, !182, !DIExpression(), !181)
    #dbg_value(i32 %len, !183, !DIExpression(), !181)
    #dbg_value(ptr %dst, !184, !DIExpression(), !181)
    #dbg_value(ptr %src, !185, !DIExpression(), !181)
    #dbg_value(i32 0, !188, !DIExpression(), !190)
  br label %for.cond, !dbg !191

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !192
    #dbg_value(i32 %i.0, !188, !DIExpression(), !190)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !193
  br i1 %exitcond, label %for.body, label %for.end, !dbg !195

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %src, i32 %i.0, !dbg !196
  %0 = load i8, ptr %arrayidx, align 1, !dbg !196
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %dst, i32 %i.0, !dbg !197
  store i8 %0, ptr %arrayidx1, align 1, !dbg !198
  %inc = add i32 %i.0, 1, !dbg !199
    #dbg_value(i32 %inc, !188, !DIExpression(), !190)
  br label %for.cond, !dbg !200, !llvm.loop !201

for.end:                                          ; preds = %for.cond
  ret void, !dbg !203
}

attributes #0 = { inlinehint nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+thumb-mode,+vfp2sp,+vfp3d16sp,+vfp4d16sp" }
attributes #1 = { inlinehint }
attributes #2 = { nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+thumb-mode,+vfp2sp,+vfp3d16sp,+vfp4d16sp" }

!llvm.dbg.cu = !{!0, !2, !3, !44, !67, !78, !87, !105, !123, !124}
!llvm.ident = !{!125, !125, !125, !125, !125, !125, !125, !125}
!llvm.module.flags = !{!126, !127, !128, !129}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "../<stdin>", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!3 = distinct !DICompileUnit(language: DW_LANG_C11, file: !4, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !5, globals: !22, splitDebugInlining: false, nameTableKind: None)
!4 = !DIFile(filename: "../../../src/<stdin>", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!5 = !{!6, !12, !15, !16, !19, !20}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 32)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !8, line: 60, baseType: !9)
!8 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/sys/_stdint.h", directory: "")
!9 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !10, line: 105, baseType: !11)
!10 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/machine/_default_types.h", directory: "")
!11 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 32)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !8, line: 24, baseType: !14)
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !10, line: 43, baseType: !15)
!15 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !17, line: 214, baseType: !18)
!17 = !DIFile(filename: "/usr/lib/gcc/arm-none-eabi/13.2.1/include/stddef.h", directory: "")
!18 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 32)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !8, line: 48, baseType: !21)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !10, line: 79, baseType: !18)
!22 = !{!23, !30, !38, !40, !42}
!23 = !DIGlobalVariableExpression(var: !24, expr: !DIExpression())
!24 = distinct !DIGlobalVariable(name: "f_tail", scope: !3, file: !25, line: 247, type: !26, isLocal: true, isDefinition: true)
!25 = !DIFile(filename: "../../../include/mayo.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 32, elements: !28)
!27 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !15)
!28 = !{!29}
!29 = !DISubrange(count: 4)
!30 = !DIGlobalVariableExpression(var: !31, expr: !DIExpression())
!31 = distinct !DIGlobalVariable(name: "even_nibbles", scope: !32, file: !33, line: 118, type: !37, isLocal: true, isDefinition: true)
!32 = distinct !DISubprogram(name: "transpose_16x16_nibbles", scope: !33, file: !33, line: 117, type: !34, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !3, retainedNodes: !36)
!33 = !DIFile(filename: "../../../src/mayo.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!34 = !DISubroutineType(types: !35)
!35 = !{null, !6}
!36 = !{}
!37 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !7)
!38 = !DIGlobalVariableExpression(var: !39, expr: !DIExpression())
!39 = distinct !DIGlobalVariable(name: "even_bytes", scope: !32, file: !33, line: 119, type: !37, isLocal: true, isDefinition: true)
!40 = !DIGlobalVariableExpression(var: !41, expr: !DIExpression())
!41 = distinct !DIGlobalVariable(name: "even_2bytes", scope: !32, file: !33, line: 120, type: !37, isLocal: true, isDefinition: true)
!42 = !DIGlobalVariableExpression(var: !43, expr: !DIExpression())
!43 = distinct !DIGlobalVariable(name: "even_half", scope: !32, file: !33, line: 121, type: !37, isLocal: true, isDefinition: true)
!44 = distinct !DICompileUnit(language: DW_LANG_C11, file: !4, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !45, globals: !56, splitDebugInlining: false, nameTableKind: None)
!45 = !{!7, !46, !47, !19, !20, !50, !51, !54}
!46 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !8, line: 56, baseType: !48)
!48 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !10, line: 103, baseType: !49)
!49 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 32)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !8, line: 20, baseType: !52)
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !10, line: 41, baseType: !53)
!53 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !8, line: 44, baseType: !55)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !10, line: 77, baseType: !46)
!56 = !{!57, !61, !64}
!57 = !DIGlobalVariableExpression(var: !58, expr: !DIExpression())
!58 = distinct !DIGlobalVariable(name: "pqmayo_MAYO_1_ref_uint32_t_blocker", scope: !44, file: !59, line: 126, type: !60, isLocal: false, isDefinition: true)
!59 = !DIFile(filename: "../../../src/arithmetic.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!60 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !20)
!61 = !DIGlobalVariableExpression(var: !62, expr: !DIExpression())
!62 = distinct !DIGlobalVariable(name: "pqmayo_MAYO_1_ref_uint64_t_blocker", scope: !44, file: !59, line: 127, type: !63, isLocal: false, isDefinition: true)
!63 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !7)
!64 = !DIGlobalVariableExpression(var: !65, expr: !DIExpression())
!65 = distinct !DIGlobalVariable(name: "pqmayo_MAYO_1_ref_unsigned_char_blocker", scope: !44, file: !59, line: 128, type: !66, isLocal: false, isDefinition: true)
!66 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !15)
!67 = distinct !DICompileUnit(language: DW_LANG_C11, file: !68, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !69, globals: !71, splitDebugInlining: false, nameTableKind: None)
!68 = !DIFile(filename: "../../../src/common/<stdin>", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!69 = !{!70, !20, !7, !16, !13}
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 32)
!71 = !{!72}
!72 = !DIGlobalVariableExpression(var: !73, expr: !DIExpression())
!73 = distinct !DIGlobalVariable(name: "KeccakF_RoundConstants", scope: !67, file: !74, line: 214, type: !75, isLocal: true, isDefinition: true)
!74 = !DIFile(filename: "../../../src/common/fips202.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!75 = !DICompositeType(tag: DW_TAG_array_type, baseType: !37, size: 1536, elements: !76)
!76 = !{!77}
!77 = !DISubrange(count: 24)
!78 = distinct !DICompileUnit(language: DW_LANG_C11, file: !68, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !79, globals: !80, splitDebugInlining: false, nameTableKind: None)
!79 = !{!70, !46, !7, !20, !15}
!80 = !{!81}
!81 = !DIGlobalVariableExpression(var: !82, expr: !DIExpression())
!82 = distinct !DIGlobalVariable(name: "Rcon", scope: !78, file: !83, line: 388, type: !84, isLocal: true, isDefinition: true)
!83 = !DIFile(filename: "../../../src/common/aes_c.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!84 = !DICompositeType(tag: DW_TAG_array_type, baseType: !27, size: 80, elements: !85)
!85 = !{!86}
!86 = !DISubrange(count: 10)
!87 = distinct !DICompileUnit(language: DW_LANG_C11, file: !68, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !88, splitDebugInlining: false, nameTableKind: None)
!88 = !{!89, !100}
!89 = !DIGlobalVariableExpression(var: !90, expr: !DIExpression())
!90 = distinct !DIGlobalVariable(name: "memset_func", scope: !91, file: !92, line: 10, type: !95, isLocal: true, isDefinition: true)
!91 = distinct !DISubprogram(name: "mayo_secure_free", scope: !92, file: !92, line: 7, type: !93, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !87, retainedNodes: !36)
!92 = !DIFile(filename: "../../../src/common/mem.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!93 = !DISubroutineType(types: !94)
!94 = !{null, !70, !16}
!95 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !96)
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "memset_t", scope: !91, file: !92, line: 9, baseType: !97)
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 32)
!98 = !DISubroutineType(types: !99)
!99 = !{!70, !70, !46, !16}
!100 = !DIGlobalVariableExpression(var: !101, expr: !DIExpression())
!101 = distinct !DIGlobalVariable(name: "memset_func", scope: !102, file: !92, line: 17, type: !103, isLocal: true, isDefinition: true)
!102 = distinct !DISubprogram(name: "mayo_secure_clear", scope: !92, file: !92, line: 15, type: !93, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !87, retainedNodes: !36)
!103 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !104)
!104 = !DIDerivedType(tag: DW_TAG_typedef, name: "memset_t", scope: !102, file: !92, line: 16, baseType: !97)
!105 = distinct !DICompileUnit(language: DW_LANG_C11, file: !68, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !106, globals: !107, splitDebugInlining: false, nameTableKind: None)
!106 = !{!70}
!107 = !{!108}
!108 = !DIGlobalVariableExpression(var: !109, expr: !DIExpression())
!109 = distinct !DIGlobalVariable(name: "DRBG_ctx", scope: !105, file: !110, line: 48, type: !111, isLocal: false, isDefinition: true)
!110 = !DIFile(filename: "../../../src/common/randombytes_ctrdrbg.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!111 = !DIDerivedType(tag: DW_TAG_typedef, name: "AES256_CTR_DRBG_struct", file: !110, line: 40, baseType: !112)
!112 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !110, line: 36, size: 416, elements: !113)
!113 = !{!114, !118, !122}
!114 = !DIDerivedType(tag: DW_TAG_member, name: "Key", scope: !112, file: !110, line: 37, baseType: !115, size: 256)
!115 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 256, elements: !116)
!116 = !{!117}
!117 = !DISubrange(count: 32)
!118 = !DIDerivedType(tag: DW_TAG_member, name: "V", scope: !112, file: !110, line: 38, baseType: !119, size: 128, offset: 256)
!119 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 128, elements: !120)
!120 = !{!121}
!121 = !DISubrange(count: 16)
!122 = !DIDerivedType(tag: DW_TAG_member, name: "reseed_counter", scope: !112, file: !110, line: 39, baseType: !46, size: 32, offset: 384)
!123 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!124 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!125 = !{!"Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)"}
!126 = !{i32 2, !"Debug Info Version", i32 3}
!127 = !{i32 1, !"wchar_size", i32 4}
!128 = !{i32 1, !"min_enum_size", i32 4}
!129 = !{i32 1, !"Code Model", i32 1}
!130 = distinct !DISubprogram(name: "m_vec_add", scope: !131, file: !131, line: 22, type: !132, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !3, retainedNodes: !36)
!131 = !DIFile(filename: "../../../src/generic/arithmetic_fixed.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!132 = !DISubroutineType(types: !133)
!133 = !{null, !46, !134, !6}
!134 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !37, size: 32)
!135 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !130, file: !131, line: 22, type: !46)
!136 = !DILocation(line: 0, scope: !130)
!137 = !DILocalVariable(name: "in", arg: 2, scope: !130, file: !131, line: 22, type: !134)
!138 = !DILocalVariable(name: "acc", arg: 3, scope: !130, file: !131, line: 22, type: !6)
!139 = !DILocalVariable(name: "i", scope: !140, file: !131, line: 24, type: !16)
!140 = distinct !DILexicalBlock(scope: !130, file: !131, line: 24, column: 5)
!141 = !DILocation(line: 0, scope: !140)
!142 = !DILocation(line: 28, column: 1, scope: !130)
!143 = !DILocation(line: 26, column: 19, scope: !144)
!144 = distinct !DILexicalBlock(scope: !145, file: !131, line: 25, column: 5)
!145 = distinct !DILexicalBlock(scope: !140, file: !131, line: 24, column: 5)
!146 = !DILocation(line: 26, column: 9, scope: !144)
!147 = !DILocation(line: 26, column: 16, scope: !144)
!148 = !{!"pk"}
!149 = !{!"accumulator"}
!150 = distinct !DISubprogram(name: "mayo_memset", scope: !151, file: !151, line: 3, type: !152, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !123, retainedNodes: !36)
!151 = !DIFile(filename: "../mem.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!152 = !DISubroutineType(types: !153)
!153 = !{null, !70, !13, !20}
!154 = !DILocalVariable(name: "dst", arg: 1, scope: !150, file: !151, line: 3, type: !70)
!155 = !DILocation(line: 0, scope: !150)
!156 = !DILocalVariable(name: "val", arg: 2, scope: !150, file: !151, line: 3, type: !13)
!157 = !DILocalVariable(name: "len", arg: 3, scope: !150, file: !151, line: 3, type: !20)
!158 = !DILocalVariable(name: "d", scope: !150, file: !151, line: 5, type: !12)
!159 = !DILocalVariable(name: "i", scope: !160, file: !151, line: 7, type: !20)
!160 = distinct !DILexicalBlock(scope: !150, file: !151, line: 7, column: 5)
!161 = !DILocation(line: 0, scope: !160)
!162 = !DILocation(line: 7, column: 10, scope: !160)
!163 = !DILocation(line: 7, scope: !160)
!164 = !DILocation(line: 7, column: 28, scope: !165)
!165 = distinct !DILexicalBlock(scope: !160, file: !151, line: 7, column: 5)
!166 = !DILocation(line: 7, column: 5, scope: !160)
!167 = !DILocation(line: 8, column: 9, scope: !165)
!168 = !DILocation(line: 8, column: 14, scope: !165)
!169 = !DILocation(line: 7, column: 36, scope: !165)
!170 = !DILocation(line: 7, column: 5, scope: !165)
!171 = distinct !{!171, !166, !172, !173}
!172 = !DILocation(line: 8, column: 16, scope: !160)
!173 = !{!"llvm.loop.mustprogress"}
!174 = !DILocation(line: 9, column: 1, scope: !150)
!175 = distinct !DISubprogram(name: "mayo_memcpy", scope: !151, file: !151, line: 11, type: !176, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !124, retainedNodes: !36)
!176 = !DISubroutineType(types: !177)
!177 = !{null, !70, !178, !20}
!178 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !179, size: 32)
!179 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!180 = !DILocalVariable(name: "dst", arg: 1, scope: !175, file: !151, line: 11, type: !70)
!181 = !DILocation(line: 0, scope: !175)
!182 = !DILocalVariable(name: "src", arg: 2, scope: !175, file: !151, line: 11, type: !178)
!183 = !DILocalVariable(name: "len", arg: 3, scope: !175, file: !151, line: 11, type: !20)
!184 = !DILocalVariable(name: "d", scope: !175, file: !151, line: 13, type: !12)
!185 = !DILocalVariable(name: "s", scope: !175, file: !151, line: 14, type: !186)
!186 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !187, size: 32)
!187 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !13)
!188 = !DILocalVariable(name: "i", scope: !189, file: !151, line: 16, type: !20)
!189 = distinct !DILexicalBlock(scope: !175, file: !151, line: 16, column: 5)
!190 = !DILocation(line: 0, scope: !189)
!191 = !DILocation(line: 16, column: 10, scope: !189)
!192 = !DILocation(line: 16, scope: !189)
!193 = !DILocation(line: 16, column: 28, scope: !194)
!194 = distinct !DILexicalBlock(scope: !189, file: !151, line: 16, column: 5)
!195 = !DILocation(line: 16, column: 5, scope: !189)
!196 = !DILocation(line: 17, column: 16, scope: !194)
!197 = !DILocation(line: 17, column: 9, scope: !194)
!198 = !DILocation(line: 17, column: 14, scope: !194)
!199 = !DILocation(line: 16, column: 36, scope: !194)
!200 = !DILocation(line: 16, column: 5, scope: !194)
!201 = distinct !{!201, !195, !202, !173}
!202 = !DILocation(line: 17, column: 19, scope: !189)
!203 = !DILocation(line: 18, column: 1, scope: !175)
