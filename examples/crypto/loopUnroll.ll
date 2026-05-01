; ModuleID = '../no_struct/mayo1.ll'
source_filename = "composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "arm-unknown-none-eabi"

@pqmayo_MAYO_1_ref_uint32_t_blocker = dso_local local_unnamed_addr global i32 0, align 4, !dbg !0
@pqmayo_MAYO_1_ref_uint64_t_blocker = dso_local local_unnamed_addr global i64 0, align 8, !dbg !27
@pqmayo_MAYO_1_ref_unsigned_char_blocker = dso_local global i8 0, align 1, !dbg !31

; Function Attrs: inlinehint nounwind
define dso_local fastcc zeroext range(i8 0, 16) i8 @lincomb(ptr noundef nonnull %a, ptr noundef nonnull %b, i32 noundef %n, i32 noundef %m) unnamed_addr #0 !dbg !71 {
entry:
    #dbg_value(ptr %a, !75, !DIExpression(), !76)
    #dbg_value(ptr %b, !77, !DIExpression(), !76)
    #dbg_value(i32 8, !78, !DIExpression(), !76)
    #dbg_value(i32 1, !79, !DIExpression(), !76)
    #dbg_value(i8 0, !80, !DIExpression(), !76)
    #dbg_value(i32 0, !81, !DIExpression(), !83)
  br label %iter_0_start

for.end:                                          ; preds = %iter_7_end
  %ret.0.lcssa = phi i8 [ %xor1.i.iter7, %iter_7_end ], !dbg !76
  ret i8 %ret.0.lcssa, !dbg !84

iter_0_start:                                     ; preds = %entry
  br label %for.body.iter0

for.body.iter0:                                   ; preds = %iter_0_start
    #dbg_value(i32 undef, !81, !DIExpression(), !83)
    #dbg_value(ptr undef, !77, !DIExpression(), !76)
    #dbg_value(i8 undef, !80, !DIExpression(), !76)
  %arrayidx.iter0 = getelementptr inbounds nuw i8, ptr %a, i32 0, !dbg !85
  %0 = load i8, ptr %arrayidx.iter0, align 1, !dbg !85
  %1 = load i8, ptr %b, align 1, !dbg !88
    #dbg_value(i8 undef, !89, !DIExpression(), !93)
    #dbg_value(i8 undef, !95, !DIExpression(), !93)
  %2 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !96
  %xor1.i1.iter0 = xor i8 %0, %2, !dbg !97
    #dbg_value(i8 undef, !89, !DIExpression(), !93)
  %3 = trunc i8 %xor1.i1.iter0 to i1, !dbg !98
    #dbg_value(i8 poison, !99, !DIExpression(), !93)
  %4 = and i8 %xor1.i1.iter0, 2, !dbg !100
  %mul9.i.iter0 = mul i8 %4, %1, !dbg !101
  %conv10.i.iter0 = select i1 %3, i8 %1, i8 0, !dbg !98
  %xor11.i.iter0 = xor i8 %conv10.i.iter0, %mul9.i.iter0, !dbg !102
    #dbg_value(i8 undef, !99, !DIExpression(), !93)
  %5 = and i8 %xor1.i1.iter0, 4, !dbg !103
  %mul16.i.iter0 = mul i8 %5, %1, !dbg !104
  %xor18.i.iter0 = xor i8 %mul16.i.iter0, %xor11.i.iter0, !dbg !105
    #dbg_value(i8 undef, !99, !DIExpression(), !93)
  %6 = and i8 %xor1.i1.iter0, 8, !dbg !106
  %mul23.i.iter0 = mul i8 %6, %1, !dbg !107
  %xor25.i.iter0 = xor i8 %mul23.i.iter0, %xor18.i.iter0, !dbg !108
    #dbg_value(i8 undef, !99, !DIExpression(), !93)
    #dbg_value(i8 undef, !109, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !93)
  %7 = lshr i8 %xor25.i.iter0, 4, !dbg !110
  %8 = lshr i8 %xor25.i.iter0, 3, !dbg !111
  %9 = and i8 %8, 14, !dbg !111
  %10 = xor i8 %7, %9, !dbg !112
  %xor25.masked.i.iter0 = and i8 %xor25.i.iter0, 15, !dbg !113
  %11 = xor i8 %10, %xor25.masked.i.iter0, !dbg !113
    #dbg_value(i8 undef, !114, !DIExpression(), !93)
    #dbg_value(i8 undef, !115, !DIExpression(), !117)
    #dbg_value(i8 undef, !119, !DIExpression(), !117)
  %xor1.i.iter0 = xor i8 %11, 0, !dbg !120
    #dbg_value(i8 undef, !80, !DIExpression(), !76)
    #dbg_value(i32 undef, !81, !DIExpression(), !83)
  %add.ptr.iter0 = getelementptr inbounds nuw i8, ptr %b, i32 1, !dbg !121
    #dbg_value(ptr undef, !77, !DIExpression(), !76)
  br label %iter_0_end

iter_0_end:                                       ; preds = %for.body.iter0
  br label %iter_1_start

iter_1_start:                                     ; preds = %iter_0_end
  br label %for.body.iter1

for.body.iter1:                                   ; preds = %iter_1_start
    #dbg_value(i32 undef, !81, !DIExpression(), !83)
    #dbg_value(ptr undef, !77, !DIExpression(), !76)
    #dbg_value(i8 undef, !80, !DIExpression(), !76)
  %arrayidx.iter1 = getelementptr inbounds nuw i8, ptr %a, i32 1, !dbg !85
  %12 = load i8, ptr %arrayidx.iter1, align 1, !dbg !85
  %13 = load i8, ptr %add.ptr.iter0, align 1, !dbg !88
    #dbg_value(i8 undef, !89, !DIExpression(), !93)
    #dbg_value(i8 undef, !95, !DIExpression(), !93)
  %14 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !96
  %xor1.i1.iter1 = xor i8 %12, %14, !dbg !97
    #dbg_value(i8 undef, !89, !DIExpression(), !93)
  %15 = trunc i8 %xor1.i1.iter1 to i1, !dbg !98
    #dbg_value(i8 poison, !99, !DIExpression(), !93)
  %16 = and i8 %xor1.i1.iter1, 2, !dbg !100
  %mul9.i.iter1 = mul i8 %16, %13, !dbg !101
  %conv10.i.iter1 = select i1 %15, i8 %13, i8 0, !dbg !98
  %xor11.i.iter1 = xor i8 %conv10.i.iter1, %mul9.i.iter1, !dbg !102
    #dbg_value(i8 undef, !99, !DIExpression(), !93)
  %17 = and i8 %xor1.i1.iter1, 4, !dbg !103
  %mul16.i.iter1 = mul i8 %17, %13, !dbg !104
  %xor18.i.iter1 = xor i8 %mul16.i.iter1, %xor11.i.iter1, !dbg !105
    #dbg_value(i8 undef, !99, !DIExpression(), !93)
  %18 = and i8 %xor1.i1.iter1, 8, !dbg !106
  %mul23.i.iter1 = mul i8 %18, %13, !dbg !107
  %xor25.i.iter1 = xor i8 %mul23.i.iter1, %xor18.i.iter1, !dbg !108
    #dbg_value(i8 undef, !99, !DIExpression(), !93)
    #dbg_value(i8 undef, !109, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !93)
  %19 = lshr i8 %xor25.i.iter1, 4, !dbg !110
  %20 = lshr i8 %xor25.i.iter1, 3, !dbg !111
  %21 = and i8 %20, 14, !dbg !111
  %22 = xor i8 %19, %21, !dbg !112
  %xor25.masked.i.iter1 = and i8 %xor25.i.iter1, 15, !dbg !113
  %23 = xor i8 %22, %xor25.masked.i.iter1, !dbg !113
    #dbg_value(i8 undef, !114, !DIExpression(), !93)
    #dbg_value(i8 undef, !115, !DIExpression(), !117)
    #dbg_value(i8 undef, !119, !DIExpression(), !117)
  %xor1.i.iter1 = xor i8 %23, %xor1.i.iter0, !dbg !120
    #dbg_value(i8 undef, !80, !DIExpression(), !76)
    #dbg_value(i32 undef, !81, !DIExpression(), !83)
  %add.ptr.iter1 = getelementptr inbounds nuw i8, ptr %add.ptr.iter0, i32 1, !dbg !121
    #dbg_value(ptr undef, !77, !DIExpression(), !76)
  br label %iter_1_end

iter_1_end:                                       ; preds = %for.body.iter1
  br label %iter_2_start

iter_2_start:                                     ; preds = %iter_1_end
  br label %for.body.iter2

for.body.iter2:                                   ; preds = %iter_2_start
    #dbg_value(i32 undef, !81, !DIExpression(), !83)
    #dbg_value(ptr undef, !77, !DIExpression(), !76)
    #dbg_value(i8 undef, !80, !DIExpression(), !76)
  %arrayidx.iter2 = getelementptr inbounds nuw i8, ptr %a, i32 2, !dbg !85
  %24 = load i8, ptr %arrayidx.iter2, align 1, !dbg !85
  %25 = load i8, ptr %add.ptr.iter1, align 1, !dbg !88
    #dbg_value(i8 undef, !89, !DIExpression(), !93)
    #dbg_value(i8 undef, !95, !DIExpression(), !93)
  %26 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !96
  %xor1.i1.iter2 = xor i8 %24, %26, !dbg !97
    #dbg_value(i8 undef, !89, !DIExpression(), !93)
  %27 = trunc i8 %xor1.i1.iter2 to i1, !dbg !98
    #dbg_value(i8 poison, !99, !DIExpression(), !93)
  %28 = and i8 %xor1.i1.iter2, 2, !dbg !100
  %mul9.i.iter2 = mul i8 %28, %25, !dbg !101
  %conv10.i.iter2 = select i1 %27, i8 %25, i8 0, !dbg !98
  %xor11.i.iter2 = xor i8 %conv10.i.iter2, %mul9.i.iter2, !dbg !102
    #dbg_value(i8 undef, !99, !DIExpression(), !93)
  %29 = and i8 %xor1.i1.iter2, 4, !dbg !103
  %mul16.i.iter2 = mul i8 %29, %25, !dbg !104
  %xor18.i.iter2 = xor i8 %mul16.i.iter2, %xor11.i.iter2, !dbg !105
    #dbg_value(i8 undef, !99, !DIExpression(), !93)
  %30 = and i8 %xor1.i1.iter2, 8, !dbg !106
  %mul23.i.iter2 = mul i8 %30, %25, !dbg !107
  %xor25.i.iter2 = xor i8 %mul23.i.iter2, %xor18.i.iter2, !dbg !108
    #dbg_value(i8 undef, !99, !DIExpression(), !93)
    #dbg_value(i8 undef, !109, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !93)
  %31 = lshr i8 %xor25.i.iter2, 4, !dbg !110
  %32 = lshr i8 %xor25.i.iter2, 3, !dbg !111
  %33 = and i8 %32, 14, !dbg !111
  %34 = xor i8 %31, %33, !dbg !112
  %xor25.masked.i.iter2 = and i8 %xor25.i.iter2, 15, !dbg !113
  %35 = xor i8 %34, %xor25.masked.i.iter2, !dbg !113
    #dbg_value(i8 undef, !114, !DIExpression(), !93)
    #dbg_value(i8 undef, !115, !DIExpression(), !117)
    #dbg_value(i8 undef, !119, !DIExpression(), !117)
  %xor1.i.iter2 = xor i8 %35, %xor1.i.iter1, !dbg !120
    #dbg_value(i8 undef, !80, !DIExpression(), !76)
    #dbg_value(i32 undef, !81, !DIExpression(), !83)
  %add.ptr.iter2 = getelementptr inbounds nuw i8, ptr %add.ptr.iter1, i32 1, !dbg !121
    #dbg_value(ptr undef, !77, !DIExpression(), !76)
  br label %iter_2_end

iter_2_end:                                       ; preds = %for.body.iter2
  br label %iter_3_start

iter_3_start:                                     ; preds = %iter_2_end
  br label %for.body.iter3

for.body.iter3:                                   ; preds = %iter_3_start
    #dbg_value(i32 undef, !81, !DIExpression(), !83)
    #dbg_value(ptr undef, !77, !DIExpression(), !76)
    #dbg_value(i8 undef, !80, !DIExpression(), !76)
  %arrayidx.iter3 = getelementptr inbounds nuw i8, ptr %a, i32 3, !dbg !85
  %36 = load i8, ptr %arrayidx.iter3, align 1, !dbg !85
  %37 = load i8, ptr %add.ptr.iter2, align 1, !dbg !88
    #dbg_value(i8 undef, !89, !DIExpression(), !93)
    #dbg_value(i8 undef, !95, !DIExpression(), !93)
  %38 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !96
  %xor1.i1.iter3 = xor i8 %36, %38, !dbg !97
    #dbg_value(i8 undef, !89, !DIExpression(), !93)
  %39 = trunc i8 %xor1.i1.iter3 to i1, !dbg !98
    #dbg_value(i8 poison, !99, !DIExpression(), !93)
  %40 = and i8 %xor1.i1.iter3, 2, !dbg !100
  %mul9.i.iter3 = mul i8 %40, %37, !dbg !101
  %conv10.i.iter3 = select i1 %39, i8 %37, i8 0, !dbg !98
  %xor11.i.iter3 = xor i8 %conv10.i.iter3, %mul9.i.iter3, !dbg !102
    #dbg_value(i8 undef, !99, !DIExpression(), !93)
  %41 = and i8 %xor1.i1.iter3, 4, !dbg !103
  %mul16.i.iter3 = mul i8 %41, %37, !dbg !104
  %xor18.i.iter3 = xor i8 %mul16.i.iter3, %xor11.i.iter3, !dbg !105
    #dbg_value(i8 undef, !99, !DIExpression(), !93)
  %42 = and i8 %xor1.i1.iter3, 8, !dbg !106
  %mul23.i.iter3 = mul i8 %42, %37, !dbg !107
  %xor25.i.iter3 = xor i8 %mul23.i.iter3, %xor18.i.iter3, !dbg !108
    #dbg_value(i8 undef, !99, !DIExpression(), !93)
    #dbg_value(i8 undef, !109, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !93)
  %43 = lshr i8 %xor25.i.iter3, 4, !dbg !110
  %44 = lshr i8 %xor25.i.iter3, 3, !dbg !111
  %45 = and i8 %44, 14, !dbg !111
  %46 = xor i8 %43, %45, !dbg !112
  %xor25.masked.i.iter3 = and i8 %xor25.i.iter3, 15, !dbg !113
  %47 = xor i8 %46, %xor25.masked.i.iter3, !dbg !113
    #dbg_value(i8 undef, !114, !DIExpression(), !93)
    #dbg_value(i8 undef, !115, !DIExpression(), !117)
    #dbg_value(i8 undef, !119, !DIExpression(), !117)
  %xor1.i.iter3 = xor i8 %47, %xor1.i.iter2, !dbg !120
    #dbg_value(i8 undef, !80, !DIExpression(), !76)
    #dbg_value(i32 undef, !81, !DIExpression(), !83)
  %add.ptr.iter3 = getelementptr inbounds nuw i8, ptr %add.ptr.iter2, i32 1, !dbg !121
    #dbg_value(ptr undef, !77, !DIExpression(), !76)
  br label %iter_3_end

iter_3_end:                                       ; preds = %for.body.iter3
  br label %iter_4_start

iter_4_start:                                     ; preds = %iter_3_end
  br label %for.body.iter4

for.body.iter4:                                   ; preds = %iter_4_start
    #dbg_value(i32 undef, !81, !DIExpression(), !83)
    #dbg_value(ptr undef, !77, !DIExpression(), !76)
    #dbg_value(i8 undef, !80, !DIExpression(), !76)
  %arrayidx.iter4 = getelementptr inbounds nuw i8, ptr %a, i32 4, !dbg !85
  %48 = load i8, ptr %arrayidx.iter4, align 1, !dbg !85
  %49 = load i8, ptr %add.ptr.iter3, align 1, !dbg !88
    #dbg_value(i8 undef, !89, !DIExpression(), !93)
    #dbg_value(i8 undef, !95, !DIExpression(), !93)
  %50 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !96
  %xor1.i1.iter4 = xor i8 %48, %50, !dbg !97
    #dbg_value(i8 undef, !89, !DIExpression(), !93)
  %51 = trunc i8 %xor1.i1.iter4 to i1, !dbg !98
    #dbg_value(i8 poison, !99, !DIExpression(), !93)
  %52 = and i8 %xor1.i1.iter4, 2, !dbg !100
  %mul9.i.iter4 = mul i8 %52, %49, !dbg !101
  %conv10.i.iter4 = select i1 %51, i8 %49, i8 0, !dbg !98
  %xor11.i.iter4 = xor i8 %conv10.i.iter4, %mul9.i.iter4, !dbg !102
    #dbg_value(i8 undef, !99, !DIExpression(), !93)
  %53 = and i8 %xor1.i1.iter4, 4, !dbg !103
  %mul16.i.iter4 = mul i8 %53, %49, !dbg !104
  %xor18.i.iter4 = xor i8 %mul16.i.iter4, %xor11.i.iter4, !dbg !105
    #dbg_value(i8 undef, !99, !DIExpression(), !93)
  %54 = and i8 %xor1.i1.iter4, 8, !dbg !106
  %mul23.i.iter4 = mul i8 %54, %49, !dbg !107
  %xor25.i.iter4 = xor i8 %mul23.i.iter4, %xor18.i.iter4, !dbg !108
    #dbg_value(i8 undef, !99, !DIExpression(), !93)
    #dbg_value(i8 undef, !109, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !93)
  %55 = lshr i8 %xor25.i.iter4, 4, !dbg !110
  %56 = lshr i8 %xor25.i.iter4, 3, !dbg !111
  %57 = and i8 %56, 14, !dbg !111
  %58 = xor i8 %55, %57, !dbg !112
  %xor25.masked.i.iter4 = and i8 %xor25.i.iter4, 15, !dbg !113
  %59 = xor i8 %58, %xor25.masked.i.iter4, !dbg !113
    #dbg_value(i8 undef, !114, !DIExpression(), !93)
    #dbg_value(i8 undef, !115, !DIExpression(), !117)
    #dbg_value(i8 undef, !119, !DIExpression(), !117)
  %xor1.i.iter4 = xor i8 %59, %xor1.i.iter3, !dbg !120
    #dbg_value(i8 undef, !80, !DIExpression(), !76)
    #dbg_value(i32 undef, !81, !DIExpression(), !83)
  %add.ptr.iter4 = getelementptr inbounds nuw i8, ptr %add.ptr.iter3, i32 1, !dbg !121
    #dbg_value(ptr undef, !77, !DIExpression(), !76)
  br label %iter_4_end

iter_4_end:                                       ; preds = %for.body.iter4
  br label %iter_5_start

iter_5_start:                                     ; preds = %iter_4_end
  br label %for.body.iter5

for.body.iter5:                                   ; preds = %iter_5_start
    #dbg_value(i32 undef, !81, !DIExpression(), !83)
    #dbg_value(ptr undef, !77, !DIExpression(), !76)
    #dbg_value(i8 undef, !80, !DIExpression(), !76)
  %arrayidx.iter5 = getelementptr inbounds nuw i8, ptr %a, i32 5, !dbg !85
  %60 = load i8, ptr %arrayidx.iter5, align 1, !dbg !85
  %61 = load i8, ptr %add.ptr.iter4, align 1, !dbg !88
    #dbg_value(i8 undef, !89, !DIExpression(), !93)
    #dbg_value(i8 undef, !95, !DIExpression(), !93)
  %62 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !96
  %xor1.i1.iter5 = xor i8 %60, %62, !dbg !97
    #dbg_value(i8 undef, !89, !DIExpression(), !93)
  %63 = trunc i8 %xor1.i1.iter5 to i1, !dbg !98
    #dbg_value(i8 poison, !99, !DIExpression(), !93)
  %64 = and i8 %xor1.i1.iter5, 2, !dbg !100
  %mul9.i.iter5 = mul i8 %64, %61, !dbg !101
  %conv10.i.iter5 = select i1 %63, i8 %61, i8 0, !dbg !98
  %xor11.i.iter5 = xor i8 %conv10.i.iter5, %mul9.i.iter5, !dbg !102
    #dbg_value(i8 undef, !99, !DIExpression(), !93)
  %65 = and i8 %xor1.i1.iter5, 4, !dbg !103
  %mul16.i.iter5 = mul i8 %65, %61, !dbg !104
  %xor18.i.iter5 = xor i8 %mul16.i.iter5, %xor11.i.iter5, !dbg !105
    #dbg_value(i8 undef, !99, !DIExpression(), !93)
  %66 = and i8 %xor1.i1.iter5, 8, !dbg !106
  %mul23.i.iter5 = mul i8 %66, %61, !dbg !107
  %xor25.i.iter5 = xor i8 %mul23.i.iter5, %xor18.i.iter5, !dbg !108
    #dbg_value(i8 undef, !99, !DIExpression(), !93)
    #dbg_value(i8 undef, !109, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !93)
  %67 = lshr i8 %xor25.i.iter5, 4, !dbg !110
  %68 = lshr i8 %xor25.i.iter5, 3, !dbg !111
  %69 = and i8 %68, 14, !dbg !111
  %70 = xor i8 %67, %69, !dbg !112
  %xor25.masked.i.iter5 = and i8 %xor25.i.iter5, 15, !dbg !113
  %71 = xor i8 %70, %xor25.masked.i.iter5, !dbg !113
    #dbg_value(i8 undef, !114, !DIExpression(), !93)
    #dbg_value(i8 undef, !115, !DIExpression(), !117)
    #dbg_value(i8 undef, !119, !DIExpression(), !117)
  %xor1.i.iter5 = xor i8 %71, %xor1.i.iter4, !dbg !120
    #dbg_value(i8 undef, !80, !DIExpression(), !76)
    #dbg_value(i32 undef, !81, !DIExpression(), !83)
  %add.ptr.iter5 = getelementptr inbounds nuw i8, ptr %add.ptr.iter4, i32 1, !dbg !121
    #dbg_value(ptr undef, !77, !DIExpression(), !76)
  br label %iter_5_end

iter_5_end:                                       ; preds = %for.body.iter5
  br label %iter_6_start

iter_6_start:                                     ; preds = %iter_5_end
  br label %for.body.iter6

for.body.iter6:                                   ; preds = %iter_6_start
    #dbg_value(i32 undef, !81, !DIExpression(), !83)
    #dbg_value(ptr undef, !77, !DIExpression(), !76)
    #dbg_value(i8 undef, !80, !DIExpression(), !76)
  %arrayidx.iter6 = getelementptr inbounds nuw i8, ptr %a, i32 6, !dbg !85
  %72 = load i8, ptr %arrayidx.iter6, align 1, !dbg !85
  %73 = load i8, ptr %add.ptr.iter5, align 1, !dbg !88
    #dbg_value(i8 undef, !89, !DIExpression(), !93)
    #dbg_value(i8 undef, !95, !DIExpression(), !93)
  %74 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !96
  %xor1.i1.iter6 = xor i8 %72, %74, !dbg !97
    #dbg_value(i8 undef, !89, !DIExpression(), !93)
  %75 = trunc i8 %xor1.i1.iter6 to i1, !dbg !98
    #dbg_value(i8 poison, !99, !DIExpression(), !93)
  %76 = and i8 %xor1.i1.iter6, 2, !dbg !100
  %mul9.i.iter6 = mul i8 %76, %73, !dbg !101
  %conv10.i.iter6 = select i1 %75, i8 %73, i8 0, !dbg !98
  %xor11.i.iter6 = xor i8 %conv10.i.iter6, %mul9.i.iter6, !dbg !102
    #dbg_value(i8 undef, !99, !DIExpression(), !93)
  %77 = and i8 %xor1.i1.iter6, 4, !dbg !103
  %mul16.i.iter6 = mul i8 %77, %73, !dbg !104
  %xor18.i.iter6 = xor i8 %mul16.i.iter6, %xor11.i.iter6, !dbg !105
    #dbg_value(i8 undef, !99, !DIExpression(), !93)
  %78 = and i8 %xor1.i1.iter6, 8, !dbg !106
  %mul23.i.iter6 = mul i8 %78, %73, !dbg !107
  %xor25.i.iter6 = xor i8 %mul23.i.iter6, %xor18.i.iter6, !dbg !108
    #dbg_value(i8 undef, !99, !DIExpression(), !93)
    #dbg_value(i8 undef, !109, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !93)
  %79 = lshr i8 %xor25.i.iter6, 4, !dbg !110
  %80 = lshr i8 %xor25.i.iter6, 3, !dbg !111
  %81 = and i8 %80, 14, !dbg !111
  %82 = xor i8 %79, %81, !dbg !112
  %xor25.masked.i.iter6 = and i8 %xor25.i.iter6, 15, !dbg !113
  %83 = xor i8 %82, %xor25.masked.i.iter6, !dbg !113
    #dbg_value(i8 undef, !114, !DIExpression(), !93)
    #dbg_value(i8 undef, !115, !DIExpression(), !117)
    #dbg_value(i8 undef, !119, !DIExpression(), !117)
  %xor1.i.iter6 = xor i8 %83, %xor1.i.iter5, !dbg !120
    #dbg_value(i8 undef, !80, !DIExpression(), !76)
    #dbg_value(i32 undef, !81, !DIExpression(), !83)
  %add.ptr.iter6 = getelementptr inbounds nuw i8, ptr %add.ptr.iter5, i32 1, !dbg !121
    #dbg_value(ptr undef, !77, !DIExpression(), !76)
  br label %iter_6_end

iter_6_end:                                       ; preds = %for.body.iter6
  br label %iter_7_start

iter_7_start:                                     ; preds = %iter_6_end
  br label %for.body.iter7

for.body.iter7:                                   ; preds = %iter_7_start
    #dbg_value(i32 undef, !81, !DIExpression(), !83)
    #dbg_value(ptr undef, !77, !DIExpression(), !76)
    #dbg_value(i8 undef, !80, !DIExpression(), !76)
  %arrayidx.iter7 = getelementptr inbounds nuw i8, ptr %a, i32 7, !dbg !85
  %84 = load i8, ptr %arrayidx.iter7, align 1, !dbg !85
  %85 = load i8, ptr %add.ptr.iter6, align 1, !dbg !88
    #dbg_value(i8 undef, !89, !DIExpression(), !93)
    #dbg_value(i8 undef, !95, !DIExpression(), !93)
  %86 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !96
  %xor1.i1.iter7 = xor i8 %84, %86, !dbg !97
    #dbg_value(i8 undef, !89, !DIExpression(), !93)
  %87 = trunc i8 %xor1.i1.iter7 to i1, !dbg !98
    #dbg_value(i8 poison, !99, !DIExpression(), !93)
  %88 = and i8 %xor1.i1.iter7, 2, !dbg !100
  %mul9.i.iter7 = mul i8 %88, %85, !dbg !101
  %conv10.i.iter7 = select i1 %87, i8 %85, i8 0, !dbg !98
  %xor11.i.iter7 = xor i8 %conv10.i.iter7, %mul9.i.iter7, !dbg !102
    #dbg_value(i8 undef, !99, !DIExpression(), !93)
  %89 = and i8 %xor1.i1.iter7, 4, !dbg !103
  %mul16.i.iter7 = mul i8 %89, %85, !dbg !104
  %xor18.i.iter7 = xor i8 %mul16.i.iter7, %xor11.i.iter7, !dbg !105
    #dbg_value(i8 undef, !99, !DIExpression(), !93)
  %90 = and i8 %xor1.i1.iter7, 8, !dbg !106
  %mul23.i.iter7 = mul i8 %90, %85, !dbg !107
  %xor25.i.iter7 = xor i8 %mul23.i.iter7, %xor18.i.iter7, !dbg !108
    #dbg_value(i8 undef, !99, !DIExpression(), !93)
    #dbg_value(i8 undef, !109, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !93)
  %91 = lshr i8 %xor25.i.iter7, 4, !dbg !110
  %92 = lshr i8 %xor25.i.iter7, 3, !dbg !111
  %93 = and i8 %92, 14, !dbg !111
  %94 = xor i8 %91, %93, !dbg !112
  %xor25.masked.i.iter7 = and i8 %xor25.i.iter7, 15, !dbg !113
  %95 = xor i8 %94, %xor25.masked.i.iter7, !dbg !113
    #dbg_value(i8 undef, !114, !DIExpression(), !93)
    #dbg_value(i8 undef, !115, !DIExpression(), !117)
    #dbg_value(i8 undef, !119, !DIExpression(), !117)
  %xor1.i.iter7 = xor i8 %95, %xor1.i.iter6, !dbg !120
    #dbg_value(i8 undef, !80, !DIExpression(), !76)
    #dbg_value(i32 undef, !81, !DIExpression(), !83)
  %add.ptr.iter7 = getelementptr inbounds nuw i8, ptr %add.ptr.iter6, i32 1, !dbg !121
    #dbg_value(ptr undef, !77, !DIExpression(), !76)
  br label %iter_7_end

iter_7_end:                                       ; preds = %for.body.iter7
  br label %for.end
}

attributes #0 = { inlinehint nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+vfp2sp,+vfp3d16sp,+vfp4d16sp,-thumb-mode" }

!llvm.dbg.cu = !{!35, !37, !2}
!llvm.ident = !{!66, !66, !66}
!llvm.module.flags = !{!67, !68, !69, !70}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "pqmayo_MAYO_1_ref_uint32_t_blocker", scope: !2, file: !29, line: 126, type: !34, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !26, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "../../../src/<stdin>", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!4 = !{!5, !10, !11, !14, !16, !19, !21, !24}
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !6, line: 60, baseType: !7)
!6 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/sys/_stdint.h", directory: "")
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !8, line: 105, baseType: !9)
!8 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/machine/_default_types.h", directory: "")
!9 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !6, line: 56, baseType: !12)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !8, line: 103, baseType: !13)
!13 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 32)
!15 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !6, line: 48, baseType: !17)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !8, line: 79, baseType: !18)
!18 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 32)
!20 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !15)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !6, line: 20, baseType: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !8, line: 41, baseType: !23)
!23 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !6, line: 44, baseType: !25)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !8, line: 77, baseType: !10)
!26 = !{!0, !27, !31}
!27 = !DIGlobalVariableExpression(var: !28, expr: !DIExpression())
!28 = distinct !DIGlobalVariable(name: "pqmayo_MAYO_1_ref_uint64_t_blocker", scope: !2, file: !29, line: 127, type: !30, isLocal: false, isDefinition: true)
!29 = !DIFile(filename: "../../../src/arithmetic.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!30 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !5)
!31 = !DIGlobalVariableExpression(var: !32, expr: !DIExpression())
!32 = distinct !DIGlobalVariable(name: "pqmayo_MAYO_1_ref_unsigned_char_blocker", scope: !2, file: !29, line: 128, type: !33, isLocal: false, isDefinition: true)
!33 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !15)
!34 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !16)
!35 = distinct !DICompileUnit(language: DW_LANG_C11, file: !36, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!36 = !DIFile(filename: "../<stdin>", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!37 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !38, globals: !45, splitDebugInlining: false, nameTableKind: None)
!38 = !{!39, !40, !15, !43, !14, !16}
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 32)
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !41, size: 32)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !6, line: 24, baseType: !42)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !8, line: 43, baseType: !15)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !44, line: 214, baseType: !18)
!44 = !DIFile(filename: "/usr/lib/gcc/arm-none-eabi/13.2.1/include/stddef.h", directory: "")
!45 = !{!46, !52, !60, !62, !64}
!46 = !DIGlobalVariableExpression(var: !47, expr: !DIExpression())
!47 = distinct !DIGlobalVariable(name: "f_tail", scope: !37, file: !48, line: 247, type: !49, isLocal: true, isDefinition: true)
!48 = !DIFile(filename: "../../../include/mayo.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 32, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 4)
!52 = !DIGlobalVariableExpression(var: !53, expr: !DIExpression())
!53 = distinct !DIGlobalVariable(name: "even_nibbles", scope: !54, file: !55, line: 112, type: !59, isLocal: true, isDefinition: true)
!54 = distinct !DISubprogram(name: "transpose_16x16_nibbles", scope: !55, file: !55, line: 111, type: !56, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !37, retainedNodes: !58)
!55 = !DIFile(filename: "../../../src/mayo.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!56 = !DISubroutineType(types: !57)
!57 = !{null, !39}
!58 = !{}
!59 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !5)
!60 = !DIGlobalVariableExpression(var: !61, expr: !DIExpression())
!61 = distinct !DIGlobalVariable(name: "even_bytes", scope: !54, file: !55, line: 113, type: !59, isLocal: true, isDefinition: true)
!62 = !DIGlobalVariableExpression(var: !63, expr: !DIExpression())
!63 = distinct !DIGlobalVariable(name: "even_2bytes", scope: !54, file: !55, line: 114, type: !59, isLocal: true, isDefinition: true)
!64 = !DIGlobalVariableExpression(var: !65, expr: !DIExpression())
!65 = distinct !DIGlobalVariable(name: "even_half", scope: !54, file: !55, line: 115, type: !59, isLocal: true, isDefinition: true)
!66 = !{!"Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)"}
!67 = !{i32 2, !"Debug Info Version", i32 3}
!68 = !{i32 1, !"wchar_size", i32 4}
!69 = !{i32 1, !"min_enum_size", i32 4}
!70 = !{i32 1, !"Code Model", i32 1}
!71 = distinct !DISubprogram(name: "lincomb", scope: !72, file: !72, line: 70, type: !73, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !37, retainedNodes: !58)
!72 = !DIFile(filename: "../../../src/simple_arithmetic.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!73 = !DISubroutineType(types: !74)
!74 = !{!15, !19, !19, !10, !10}
!75 = !DILocalVariable(name: "a", arg: 1, scope: !71, file: !72, line: 70, type: !19)
!76 = !DILocation(line: 0, scope: !71)
!77 = !DILocalVariable(name: "b", arg: 2, scope: !71, file: !72, line: 71, type: !19)
!78 = !DILocalVariable(name: "n", arg: 3, scope: !71, file: !72, line: 71, type: !10)
!79 = !DILocalVariable(name: "m", arg: 4, scope: !71, file: !72, line: 71, type: !10)
!80 = !DILocalVariable(name: "ret", scope: !71, file: !72, line: 72, type: !15)
!81 = !DILocalVariable(name: "i", scope: !82, file: !72, line: 73, type: !10)
!82 = distinct !DILexicalBlock(scope: !71, file: !72, line: 73, column: 5)
!83 = !DILocation(line: 0, scope: !82)
!84 = !DILocation(line: 76, column: 5, scope: !71)
!85 = !DILocation(line: 74, column: 27, scope: !86)
!86 = distinct !DILexicalBlock(scope: !87, file: !72, line: 73, column: 41)
!87 = distinct !DILexicalBlock(scope: !82, file: !72, line: 73, column: 5)
!88 = !DILocation(line: 74, column: 33, scope: !86)
!89 = !DILocalVariable(name: "a", arg: 1, scope: !90, file: !72, line: 9, type: !15)
!90 = distinct !DISubprogram(name: "mul_f", scope: !72, file: !72, line: 9, type: !91, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !37, retainedNodes: !58)
!91 = !DISubroutineType(types: !92)
!92 = !{!15, !15, !15}
!93 = !DILocation(line: 0, scope: !90, inlinedAt: !94)
!94 = distinct !DILocation(line: 74, column: 21, scope: !86)
!95 = !DILocalVariable(name: "b", arg: 2, scope: !90, file: !72, line: 9, type: !15)
!96 = !DILocation(line: 14, column: 10, scope: !90, inlinedAt: !94)
!97 = !DILocation(line: 14, column: 7, scope: !90, inlinedAt: !94)
!98 = !DILocation(line: 17, column: 17, scope: !90, inlinedAt: !94)
!99 = !DILocalVariable(name: "p", scope: !90, file: !72, line: 11, type: !15)
!100 = !DILocation(line: 18, column: 13, scope: !90, inlinedAt: !94)
!101 = !DILocation(line: 18, column: 17, scope: !90, inlinedAt: !94)
!102 = !DILocation(line: 18, column: 7, scope: !90, inlinedAt: !94)
!103 = !DILocation(line: 19, column: 13, scope: !90, inlinedAt: !94)
!104 = !DILocation(line: 19, column: 17, scope: !90, inlinedAt: !94)
!105 = !DILocation(line: 19, column: 7, scope: !90, inlinedAt: !94)
!106 = !DILocation(line: 20, column: 13, scope: !90, inlinedAt: !94)
!107 = !DILocation(line: 20, column: 17, scope: !90, inlinedAt: !94)
!108 = !DILocation(line: 20, column: 7, scope: !90, inlinedAt: !94)
!109 = !DILocalVariable(name: "top_p", scope: !90, file: !72, line: 23, type: !15)
!110 = !DILocation(line: 24, column: 37, scope: !90, inlinedAt: !94)
!111 = !DILocation(line: 24, column: 52, scope: !90, inlinedAt: !94)
!112 = !DILocation(line: 24, column: 43, scope: !90, inlinedAt: !94)
!113 = !DILocation(line: 24, column: 59, scope: !90, inlinedAt: !94)
!114 = !DILocalVariable(name: "out", scope: !90, file: !72, line: 24, type: !15)
!115 = !DILocalVariable(name: "a", arg: 1, scope: !116, file: !72, line: 43, type: !15)
!116 = distinct !DISubprogram(name: "add_f", scope: !72, file: !72, line: 43, type: !91, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !37, retainedNodes: !58)
!117 = !DILocation(line: 0, scope: !116, inlinedAt: !118)
!118 = distinct !DILocation(line: 74, column: 15, scope: !86)
!119 = !DILocalVariable(name: "b", arg: 2, scope: !116, file: !72, line: 43, type: !15)
!120 = !DILocation(line: 44, column: 14, scope: !116, inlinedAt: !118)
!121 = !DILocation(line: 73, column: 35, scope: !87)
