; ModuleID = '../../mayo_IR/mayo1.ll'
source_filename = "composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "thumbv7em-unknown-none-eabihf"

@pqmayo_MAYO_1_ref_unsigned_char_blocker = dso_local global i8 0, align 1, !dbg !0

; Function Attrs: inlinehint nounwind
define dso_local fastcc zeroext range(i8 0, 16) i8 @lincomb(ptr noundef nonnull %a, ptr noundef nonnull %b, i32 noundef %n, i32 noundef %m) unnamed_addr #0 !dbg !130 {
entry:
    #dbg_value(ptr %a, !134, !DIExpression(), !135)
    #dbg_value(ptr %b, !136, !DIExpression(), !135)
    #dbg_value(i32 8, !137, !DIExpression(), !135)
    #dbg_value(i32 1, !138, !DIExpression(), !135)
    #dbg_value(i8 0, !139, !DIExpression(), !135)
    #dbg_value(i32 0, !140, !DIExpression(), !142)
  br label %iter_0_start

for.end:                                          ; preds = %iter_7_end
  %ret.0.lcssa = phi i8 [ %xor1.i.iter7, %iter_7_end ], !dbg !135
  ret i8 %ret.0.lcssa, !dbg !143

iter_0_start:                                     ; preds = %entry
  br label %for.body.iter0

for.body.iter0:                                   ; preds = %iter_0_start
    #dbg_value(i32 undef, !140, !DIExpression(), !142)
    #dbg_value(ptr undef, !136, !DIExpression(), !135)
    #dbg_value(i8 undef, !139, !DIExpression(), !135)
  %arrayidx.iter0 = getelementptr inbounds nuw i8, ptr %a, i32 0, !dbg !144
  %0 = load i8, ptr %arrayidx.iter0, align 1, !dbg !144
  %1 = load i8, ptr %b, align 1, !dbg !147
    #dbg_value(i8 undef, !148, !DIExpression(), !152)
    #dbg_value(i8 undef, !154, !DIExpression(), !152)
  %2 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !155
  %xor1.i1.iter0 = xor i8 %0, %2, !dbg !156
    #dbg_value(i8 undef, !148, !DIExpression(), !152)
  %3 = trunc i8 %xor1.i1.iter0 to i1, !dbg !157
    #dbg_value(i8 poison, !158, !DIExpression(), !152)
  %4 = and i8 %xor1.i1.iter0, 2, !dbg !159
  %mul9.i.iter0 = mul i8 %4, %1, !dbg !160
  %conv10.i.iter0 = select i1 %3, i8 %1, i8 0, !dbg !157
  %xor11.i.iter0 = xor i8 %conv10.i.iter0, %mul9.i.iter0, !dbg !161
    #dbg_value(i8 undef, !158, !DIExpression(), !152)
  %5 = and i8 %xor1.i1.iter0, 4, !dbg !162
  %mul16.i.iter0 = mul i8 %5, %1, !dbg !163
  %xor18.i.iter0 = xor i8 %mul16.i.iter0, %xor11.i.iter0, !dbg !164
    #dbg_value(i8 undef, !158, !DIExpression(), !152)
  %6 = and i8 %xor1.i1.iter0, 8, !dbg !165
  %mul23.i.iter0 = mul i8 %6, %1, !dbg !166
  %xor25.i.iter0 = xor i8 %mul23.i.iter0, %xor18.i.iter0, !dbg !167
    #dbg_value(i8 undef, !158, !DIExpression(), !152)
    #dbg_value(i8 undef, !168, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !152)
  %7 = lshr i8 %xor25.i.iter0, 4, !dbg !169
  %8 = lshr i8 %xor25.i.iter0, 3, !dbg !170
  %9 = and i8 %8, 14, !dbg !170
  %10 = xor i8 %7, %9, !dbg !171
  %xor25.masked.i.iter0 = and i8 %xor25.i.iter0, 15, !dbg !172
  %11 = xor i8 %10, %xor25.masked.i.iter0, !dbg !172
    #dbg_value(i8 undef, !173, !DIExpression(), !152)
    #dbg_value(i8 undef, !174, !DIExpression(), !176)
    #dbg_value(i8 undef, !178, !DIExpression(), !176)
  %xor1.i.iter0 = xor i8 %11, 0, !dbg !179
    #dbg_value(i8 undef, !139, !DIExpression(), !135)
    #dbg_value(i32 undef, !140, !DIExpression(), !142)
  %add.ptr.iter0 = getelementptr inbounds nuw i8, ptr %b, i32 1, !dbg !180
    #dbg_value(ptr undef, !136, !DIExpression(), !135)
  br label %iter_0_end

iter_0_end:                                       ; preds = %for.body.iter0
  br label %iter_1_start

iter_1_start:                                     ; preds = %iter_0_end
  br label %for.body.iter1

for.body.iter1:                                   ; preds = %iter_1_start
    #dbg_value(i32 undef, !140, !DIExpression(), !142)
    #dbg_value(ptr undef, !136, !DIExpression(), !135)
    #dbg_value(i8 undef, !139, !DIExpression(), !135)
  %arrayidx.iter1 = getelementptr inbounds nuw i8, ptr %a, i32 1, !dbg !144
  %12 = load i8, ptr %arrayidx.iter1, align 1, !dbg !144
  %13 = load i8, ptr %add.ptr.iter0, align 1, !dbg !147
    #dbg_value(i8 undef, !148, !DIExpression(), !152)
    #dbg_value(i8 undef, !154, !DIExpression(), !152)
  %14 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !155
  %xor1.i1.iter1 = xor i8 %12, %14, !dbg !156
    #dbg_value(i8 undef, !148, !DIExpression(), !152)
  %15 = trunc i8 %xor1.i1.iter1 to i1, !dbg !157
    #dbg_value(i8 poison, !158, !DIExpression(), !152)
  %16 = and i8 %xor1.i1.iter1, 2, !dbg !159
  %mul9.i.iter1 = mul i8 %16, %13, !dbg !160
  %conv10.i.iter1 = select i1 %15, i8 %13, i8 0, !dbg !157
  %xor11.i.iter1 = xor i8 %conv10.i.iter1, %mul9.i.iter1, !dbg !161
    #dbg_value(i8 undef, !158, !DIExpression(), !152)
  %17 = and i8 %xor1.i1.iter1, 4, !dbg !162
  %mul16.i.iter1 = mul i8 %17, %13, !dbg !163
  %xor18.i.iter1 = xor i8 %mul16.i.iter1, %xor11.i.iter1, !dbg !164
    #dbg_value(i8 undef, !158, !DIExpression(), !152)
  %18 = and i8 %xor1.i1.iter1, 8, !dbg !165
  %mul23.i.iter1 = mul i8 %18, %13, !dbg !166
  %xor25.i.iter1 = xor i8 %mul23.i.iter1, %xor18.i.iter1, !dbg !167
    #dbg_value(i8 undef, !158, !DIExpression(), !152)
    #dbg_value(i8 undef, !168, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !152)
  %19 = lshr i8 %xor25.i.iter1, 4, !dbg !169
  %20 = lshr i8 %xor25.i.iter1, 3, !dbg !170
  %21 = and i8 %20, 14, !dbg !170
  %22 = xor i8 %19, %21, !dbg !171
  %xor25.masked.i.iter1 = and i8 %xor25.i.iter1, 15, !dbg !172
  %23 = xor i8 %22, %xor25.masked.i.iter1, !dbg !172
    #dbg_value(i8 undef, !173, !DIExpression(), !152)
    #dbg_value(i8 undef, !174, !DIExpression(), !176)
    #dbg_value(i8 undef, !178, !DIExpression(), !176)
  %xor1.i.iter1 = xor i8 %23, %xor1.i.iter0, !dbg !179
    #dbg_value(i8 undef, !139, !DIExpression(), !135)
    #dbg_value(i32 undef, !140, !DIExpression(), !142)
  %add.ptr.iter1 = getelementptr inbounds nuw i8, ptr %add.ptr.iter0, i32 1, !dbg !180
    #dbg_value(ptr undef, !136, !DIExpression(), !135)
  br label %iter_1_end

iter_1_end:                                       ; preds = %for.body.iter1
  br label %iter_2_start

iter_2_start:                                     ; preds = %iter_1_end
  br label %for.body.iter2

for.body.iter2:                                   ; preds = %iter_2_start
    #dbg_value(i32 undef, !140, !DIExpression(), !142)
    #dbg_value(ptr undef, !136, !DIExpression(), !135)
    #dbg_value(i8 undef, !139, !DIExpression(), !135)
  %arrayidx.iter2 = getelementptr inbounds nuw i8, ptr %a, i32 2, !dbg !144
  %24 = load i8, ptr %arrayidx.iter2, align 1, !dbg !144
  %25 = load i8, ptr %add.ptr.iter1, align 1, !dbg !147
    #dbg_value(i8 undef, !148, !DIExpression(), !152)
    #dbg_value(i8 undef, !154, !DIExpression(), !152)
  %26 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !155
  %xor1.i1.iter2 = xor i8 %24, %26, !dbg !156
    #dbg_value(i8 undef, !148, !DIExpression(), !152)
  %27 = trunc i8 %xor1.i1.iter2 to i1, !dbg !157
    #dbg_value(i8 poison, !158, !DIExpression(), !152)
  %28 = and i8 %xor1.i1.iter2, 2, !dbg !159
  %mul9.i.iter2 = mul i8 %28, %25, !dbg !160
  %conv10.i.iter2 = select i1 %27, i8 %25, i8 0, !dbg !157
  %xor11.i.iter2 = xor i8 %conv10.i.iter2, %mul9.i.iter2, !dbg !161
    #dbg_value(i8 undef, !158, !DIExpression(), !152)
  %29 = and i8 %xor1.i1.iter2, 4, !dbg !162
  %mul16.i.iter2 = mul i8 %29, %25, !dbg !163
  %xor18.i.iter2 = xor i8 %mul16.i.iter2, %xor11.i.iter2, !dbg !164
    #dbg_value(i8 undef, !158, !DIExpression(), !152)
  %30 = and i8 %xor1.i1.iter2, 8, !dbg !165
  %mul23.i.iter2 = mul i8 %30, %25, !dbg !166
  %xor25.i.iter2 = xor i8 %mul23.i.iter2, %xor18.i.iter2, !dbg !167
    #dbg_value(i8 undef, !158, !DIExpression(), !152)
    #dbg_value(i8 undef, !168, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !152)
  %31 = lshr i8 %xor25.i.iter2, 4, !dbg !169
  %32 = lshr i8 %xor25.i.iter2, 3, !dbg !170
  %33 = and i8 %32, 14, !dbg !170
  %34 = xor i8 %31, %33, !dbg !171
  %xor25.masked.i.iter2 = and i8 %xor25.i.iter2, 15, !dbg !172
  %35 = xor i8 %34, %xor25.masked.i.iter2, !dbg !172
    #dbg_value(i8 undef, !173, !DIExpression(), !152)
    #dbg_value(i8 undef, !174, !DIExpression(), !176)
    #dbg_value(i8 undef, !178, !DIExpression(), !176)
  %xor1.i.iter2 = xor i8 %35, %xor1.i.iter1, !dbg !179
    #dbg_value(i8 undef, !139, !DIExpression(), !135)
    #dbg_value(i32 undef, !140, !DIExpression(), !142)
  %add.ptr.iter2 = getelementptr inbounds nuw i8, ptr %add.ptr.iter1, i32 1, !dbg !180
    #dbg_value(ptr undef, !136, !DIExpression(), !135)
  br label %iter_2_end

iter_2_end:                                       ; preds = %for.body.iter2
  br label %iter_3_start

iter_3_start:                                     ; preds = %iter_2_end
  br label %for.body.iter3

for.body.iter3:                                   ; preds = %iter_3_start
    #dbg_value(i32 undef, !140, !DIExpression(), !142)
    #dbg_value(ptr undef, !136, !DIExpression(), !135)
    #dbg_value(i8 undef, !139, !DIExpression(), !135)
  %arrayidx.iter3 = getelementptr inbounds nuw i8, ptr %a, i32 3, !dbg !144
  %36 = load i8, ptr %arrayidx.iter3, align 1, !dbg !144
  %37 = load i8, ptr %add.ptr.iter2, align 1, !dbg !147
    #dbg_value(i8 undef, !148, !DIExpression(), !152)
    #dbg_value(i8 undef, !154, !DIExpression(), !152)
  %38 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !155
  %xor1.i1.iter3 = xor i8 %36, %38, !dbg !156
    #dbg_value(i8 undef, !148, !DIExpression(), !152)
  %39 = trunc i8 %xor1.i1.iter3 to i1, !dbg !157
    #dbg_value(i8 poison, !158, !DIExpression(), !152)
  %40 = and i8 %xor1.i1.iter3, 2, !dbg !159
  %mul9.i.iter3 = mul i8 %40, %37, !dbg !160
  %conv10.i.iter3 = select i1 %39, i8 %37, i8 0, !dbg !157
  %xor11.i.iter3 = xor i8 %conv10.i.iter3, %mul9.i.iter3, !dbg !161
    #dbg_value(i8 undef, !158, !DIExpression(), !152)
  %41 = and i8 %xor1.i1.iter3, 4, !dbg !162
  %mul16.i.iter3 = mul i8 %41, %37, !dbg !163
  %xor18.i.iter3 = xor i8 %mul16.i.iter3, %xor11.i.iter3, !dbg !164
    #dbg_value(i8 undef, !158, !DIExpression(), !152)
  %42 = and i8 %xor1.i1.iter3, 8, !dbg !165
  %mul23.i.iter3 = mul i8 %42, %37, !dbg !166
  %xor25.i.iter3 = xor i8 %mul23.i.iter3, %xor18.i.iter3, !dbg !167
    #dbg_value(i8 undef, !158, !DIExpression(), !152)
    #dbg_value(i8 undef, !168, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !152)
  %43 = lshr i8 %xor25.i.iter3, 4, !dbg !169
  %44 = lshr i8 %xor25.i.iter3, 3, !dbg !170
  %45 = and i8 %44, 14, !dbg !170
  %46 = xor i8 %43, %45, !dbg !171
  %xor25.masked.i.iter3 = and i8 %xor25.i.iter3, 15, !dbg !172
  %47 = xor i8 %46, %xor25.masked.i.iter3, !dbg !172
    #dbg_value(i8 undef, !173, !DIExpression(), !152)
    #dbg_value(i8 undef, !174, !DIExpression(), !176)
    #dbg_value(i8 undef, !178, !DIExpression(), !176)
  %xor1.i.iter3 = xor i8 %47, %xor1.i.iter2, !dbg !179
    #dbg_value(i8 undef, !139, !DIExpression(), !135)
    #dbg_value(i32 undef, !140, !DIExpression(), !142)
  %add.ptr.iter3 = getelementptr inbounds nuw i8, ptr %add.ptr.iter2, i32 1, !dbg !180
    #dbg_value(ptr undef, !136, !DIExpression(), !135)
  br label %iter_3_end

iter_3_end:                                       ; preds = %for.body.iter3
  br label %iter_4_start

iter_4_start:                                     ; preds = %iter_3_end
  br label %for.body.iter4

for.body.iter4:                                   ; preds = %iter_4_start
    #dbg_value(i32 undef, !140, !DIExpression(), !142)
    #dbg_value(ptr undef, !136, !DIExpression(), !135)
    #dbg_value(i8 undef, !139, !DIExpression(), !135)
  %arrayidx.iter4 = getelementptr inbounds nuw i8, ptr %a, i32 4, !dbg !144
  %48 = load i8, ptr %arrayidx.iter4, align 1, !dbg !144
  %49 = load i8, ptr %add.ptr.iter3, align 1, !dbg !147
    #dbg_value(i8 undef, !148, !DIExpression(), !152)
    #dbg_value(i8 undef, !154, !DIExpression(), !152)
  %50 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !155
  %xor1.i1.iter4 = xor i8 %48, %50, !dbg !156
    #dbg_value(i8 undef, !148, !DIExpression(), !152)
  %51 = trunc i8 %xor1.i1.iter4 to i1, !dbg !157
    #dbg_value(i8 poison, !158, !DIExpression(), !152)
  %52 = and i8 %xor1.i1.iter4, 2, !dbg !159
  %mul9.i.iter4 = mul i8 %52, %49, !dbg !160
  %conv10.i.iter4 = select i1 %51, i8 %49, i8 0, !dbg !157
  %xor11.i.iter4 = xor i8 %conv10.i.iter4, %mul9.i.iter4, !dbg !161
    #dbg_value(i8 undef, !158, !DIExpression(), !152)
  %53 = and i8 %xor1.i1.iter4, 4, !dbg !162
  %mul16.i.iter4 = mul i8 %53, %49, !dbg !163
  %xor18.i.iter4 = xor i8 %mul16.i.iter4, %xor11.i.iter4, !dbg !164
    #dbg_value(i8 undef, !158, !DIExpression(), !152)
  %54 = and i8 %xor1.i1.iter4, 8, !dbg !165
  %mul23.i.iter4 = mul i8 %54, %49, !dbg !166
  %xor25.i.iter4 = xor i8 %mul23.i.iter4, %xor18.i.iter4, !dbg !167
    #dbg_value(i8 undef, !158, !DIExpression(), !152)
    #dbg_value(i8 undef, !168, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !152)
  %55 = lshr i8 %xor25.i.iter4, 4, !dbg !169
  %56 = lshr i8 %xor25.i.iter4, 3, !dbg !170
  %57 = and i8 %56, 14, !dbg !170
  %58 = xor i8 %55, %57, !dbg !171
  %xor25.masked.i.iter4 = and i8 %xor25.i.iter4, 15, !dbg !172
  %59 = xor i8 %58, %xor25.masked.i.iter4, !dbg !172
    #dbg_value(i8 undef, !173, !DIExpression(), !152)
    #dbg_value(i8 undef, !174, !DIExpression(), !176)
    #dbg_value(i8 undef, !178, !DIExpression(), !176)
  %xor1.i.iter4 = xor i8 %59, %xor1.i.iter3, !dbg !179
    #dbg_value(i8 undef, !139, !DIExpression(), !135)
    #dbg_value(i32 undef, !140, !DIExpression(), !142)
  %add.ptr.iter4 = getelementptr inbounds nuw i8, ptr %add.ptr.iter3, i32 1, !dbg !180
    #dbg_value(ptr undef, !136, !DIExpression(), !135)
  br label %iter_4_end

iter_4_end:                                       ; preds = %for.body.iter4
  br label %iter_5_start

iter_5_start:                                     ; preds = %iter_4_end
  br label %for.body.iter5

for.body.iter5:                                   ; preds = %iter_5_start
    #dbg_value(i32 undef, !140, !DIExpression(), !142)
    #dbg_value(ptr undef, !136, !DIExpression(), !135)
    #dbg_value(i8 undef, !139, !DIExpression(), !135)
  %arrayidx.iter5 = getelementptr inbounds nuw i8, ptr %a, i32 5, !dbg !144
  %60 = load i8, ptr %arrayidx.iter5, align 1, !dbg !144
  %61 = load i8, ptr %add.ptr.iter4, align 1, !dbg !147
    #dbg_value(i8 undef, !148, !DIExpression(), !152)
    #dbg_value(i8 undef, !154, !DIExpression(), !152)
  %62 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !155
  %xor1.i1.iter5 = xor i8 %60, %62, !dbg !156
    #dbg_value(i8 undef, !148, !DIExpression(), !152)
  %63 = trunc i8 %xor1.i1.iter5 to i1, !dbg !157
    #dbg_value(i8 poison, !158, !DIExpression(), !152)
  %64 = and i8 %xor1.i1.iter5, 2, !dbg !159
  %mul9.i.iter5 = mul i8 %64, %61, !dbg !160
  %conv10.i.iter5 = select i1 %63, i8 %61, i8 0, !dbg !157
  %xor11.i.iter5 = xor i8 %conv10.i.iter5, %mul9.i.iter5, !dbg !161
    #dbg_value(i8 undef, !158, !DIExpression(), !152)
  %65 = and i8 %xor1.i1.iter5, 4, !dbg !162
  %mul16.i.iter5 = mul i8 %65, %61, !dbg !163
  %xor18.i.iter5 = xor i8 %mul16.i.iter5, %xor11.i.iter5, !dbg !164
    #dbg_value(i8 undef, !158, !DIExpression(), !152)
  %66 = and i8 %xor1.i1.iter5, 8, !dbg !165
  %mul23.i.iter5 = mul i8 %66, %61, !dbg !166
  %xor25.i.iter5 = xor i8 %mul23.i.iter5, %xor18.i.iter5, !dbg !167
    #dbg_value(i8 undef, !158, !DIExpression(), !152)
    #dbg_value(i8 undef, !168, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !152)
  %67 = lshr i8 %xor25.i.iter5, 4, !dbg !169
  %68 = lshr i8 %xor25.i.iter5, 3, !dbg !170
  %69 = and i8 %68, 14, !dbg !170
  %70 = xor i8 %67, %69, !dbg !171
  %xor25.masked.i.iter5 = and i8 %xor25.i.iter5, 15, !dbg !172
  %71 = xor i8 %70, %xor25.masked.i.iter5, !dbg !172
    #dbg_value(i8 undef, !173, !DIExpression(), !152)
    #dbg_value(i8 undef, !174, !DIExpression(), !176)
    #dbg_value(i8 undef, !178, !DIExpression(), !176)
  %xor1.i.iter5 = xor i8 %71, %xor1.i.iter4, !dbg !179
    #dbg_value(i8 undef, !139, !DIExpression(), !135)
    #dbg_value(i32 undef, !140, !DIExpression(), !142)
  %add.ptr.iter5 = getelementptr inbounds nuw i8, ptr %add.ptr.iter4, i32 1, !dbg !180
    #dbg_value(ptr undef, !136, !DIExpression(), !135)
  br label %iter_5_end

iter_5_end:                                       ; preds = %for.body.iter5
  br label %iter_6_start

iter_6_start:                                     ; preds = %iter_5_end
  br label %for.body.iter6

for.body.iter6:                                   ; preds = %iter_6_start
    #dbg_value(i32 undef, !140, !DIExpression(), !142)
    #dbg_value(ptr undef, !136, !DIExpression(), !135)
    #dbg_value(i8 undef, !139, !DIExpression(), !135)
  %arrayidx.iter6 = getelementptr inbounds nuw i8, ptr %a, i32 6, !dbg !144
  %72 = load i8, ptr %arrayidx.iter6, align 1, !dbg !144
  %73 = load i8, ptr %add.ptr.iter5, align 1, !dbg !147
    #dbg_value(i8 undef, !148, !DIExpression(), !152)
    #dbg_value(i8 undef, !154, !DIExpression(), !152)
  %74 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !155
  %xor1.i1.iter6 = xor i8 %72, %74, !dbg !156
    #dbg_value(i8 undef, !148, !DIExpression(), !152)
  %75 = trunc i8 %xor1.i1.iter6 to i1, !dbg !157
    #dbg_value(i8 poison, !158, !DIExpression(), !152)
  %76 = and i8 %xor1.i1.iter6, 2, !dbg !159
  %mul9.i.iter6 = mul i8 %76, %73, !dbg !160
  %conv10.i.iter6 = select i1 %75, i8 %73, i8 0, !dbg !157
  %xor11.i.iter6 = xor i8 %conv10.i.iter6, %mul9.i.iter6, !dbg !161
    #dbg_value(i8 undef, !158, !DIExpression(), !152)
  %77 = and i8 %xor1.i1.iter6, 4, !dbg !162
  %mul16.i.iter6 = mul i8 %77, %73, !dbg !163
  %xor18.i.iter6 = xor i8 %mul16.i.iter6, %xor11.i.iter6, !dbg !164
    #dbg_value(i8 undef, !158, !DIExpression(), !152)
  %78 = and i8 %xor1.i1.iter6, 8, !dbg !165
  %mul23.i.iter6 = mul i8 %78, %73, !dbg !166
  %xor25.i.iter6 = xor i8 %mul23.i.iter6, %xor18.i.iter6, !dbg !167
    #dbg_value(i8 undef, !158, !DIExpression(), !152)
    #dbg_value(i8 undef, !168, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !152)
  %79 = lshr i8 %xor25.i.iter6, 4, !dbg !169
  %80 = lshr i8 %xor25.i.iter6, 3, !dbg !170
  %81 = and i8 %80, 14, !dbg !170
  %82 = xor i8 %79, %81, !dbg !171
  %xor25.masked.i.iter6 = and i8 %xor25.i.iter6, 15, !dbg !172
  %83 = xor i8 %82, %xor25.masked.i.iter6, !dbg !172
    #dbg_value(i8 undef, !173, !DIExpression(), !152)
    #dbg_value(i8 undef, !174, !DIExpression(), !176)
    #dbg_value(i8 undef, !178, !DIExpression(), !176)
  %xor1.i.iter6 = xor i8 %83, %xor1.i.iter5, !dbg !179
    #dbg_value(i8 undef, !139, !DIExpression(), !135)
    #dbg_value(i32 undef, !140, !DIExpression(), !142)
  %add.ptr.iter6 = getelementptr inbounds nuw i8, ptr %add.ptr.iter5, i32 1, !dbg !180
    #dbg_value(ptr undef, !136, !DIExpression(), !135)
  br label %iter_6_end

iter_6_end:                                       ; preds = %for.body.iter6
  br label %iter_7_start

iter_7_start:                                     ; preds = %iter_6_end
  br label %for.body.iter7

for.body.iter7:                                   ; preds = %iter_7_start
    #dbg_value(i32 undef, !140, !DIExpression(), !142)
    #dbg_value(ptr undef, !136, !DIExpression(), !135)
    #dbg_value(i8 undef, !139, !DIExpression(), !135)
  %arrayidx.iter7 = getelementptr inbounds nuw i8, ptr %a, i32 7, !dbg !144
  %84 = load i8, ptr %arrayidx.iter7, align 1, !dbg !144
  %85 = load i8, ptr %add.ptr.iter6, align 1, !dbg !147
    #dbg_value(i8 undef, !148, !DIExpression(), !152)
    #dbg_value(i8 undef, !154, !DIExpression(), !152)
  %86 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !155
  %xor1.i1.iter7 = xor i8 %84, %86, !dbg !156
    #dbg_value(i8 undef, !148, !DIExpression(), !152)
  %87 = trunc i8 %xor1.i1.iter7 to i1, !dbg !157
    #dbg_value(i8 poison, !158, !DIExpression(), !152)
  %88 = and i8 %xor1.i1.iter7, 2, !dbg !159
  %mul9.i.iter7 = mul i8 %88, %85, !dbg !160
  %conv10.i.iter7 = select i1 %87, i8 %85, i8 0, !dbg !157
  %xor11.i.iter7 = xor i8 %conv10.i.iter7, %mul9.i.iter7, !dbg !161
    #dbg_value(i8 undef, !158, !DIExpression(), !152)
  %89 = and i8 %xor1.i1.iter7, 4, !dbg !162
  %mul16.i.iter7 = mul i8 %89, %85, !dbg !163
  %xor18.i.iter7 = xor i8 %mul16.i.iter7, %xor11.i.iter7, !dbg !164
    #dbg_value(i8 undef, !158, !DIExpression(), !152)
  %90 = and i8 %xor1.i1.iter7, 8, !dbg !165
  %mul23.i.iter7 = mul i8 %90, %85, !dbg !166
  %xor25.i.iter7 = xor i8 %mul23.i.iter7, %xor18.i.iter7, !dbg !167
    #dbg_value(i8 undef, !158, !DIExpression(), !152)
    #dbg_value(i8 undef, !168, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !152)
  %91 = lshr i8 %xor25.i.iter7, 4, !dbg !169
  %92 = lshr i8 %xor25.i.iter7, 3, !dbg !170
  %93 = and i8 %92, 14, !dbg !170
  %94 = xor i8 %91, %93, !dbg !171
  %xor25.masked.i.iter7 = and i8 %xor25.i.iter7, 15, !dbg !172
  %95 = xor i8 %94, %xor25.masked.i.iter7, !dbg !172
    #dbg_value(i8 undef, !173, !DIExpression(), !152)
    #dbg_value(i8 undef, !174, !DIExpression(), !176)
    #dbg_value(i8 undef, !178, !DIExpression(), !176)
  %xor1.i.iter7 = xor i8 %95, %xor1.i.iter6, !dbg !179
    #dbg_value(i8 undef, !139, !DIExpression(), !135)
    #dbg_value(i32 undef, !140, !DIExpression(), !142)
    #dbg_value(ptr undef, !136, !DIExpression(), !135)
  br label %iter_7_end

iter_7_end:                                       ; preds = %for.body.iter7
  br label %for.end
}

; Function Attrs: inlinehint
define i32 @main() local_unnamed_addr #1 {
entry:
  %a_buf = alloca [128 x i8], align 16, !llvmbmc.var !181
  call void @mayo_memset(ptr %a_buf, i8 0, i32 128)
  store i8 11, ptr %a_buf, align 1
  %x = alloca [860 x i8], align 16, !llvmbmc.var !182
  call void @mayo_memset(ptr %x, i8 0, i32 860)
  %0 = call fastcc i8 @lincomb(ptr %a_buf, ptr %x, i32 81, i32 1)
  %out_cmp = icmp eq i8 %0, 3
  call void @_Z6assertb(i1 noundef zeroext %out_cmp)
  ret i32 0
}

declare void @_Z6assertb(i1 noundef zeroext) local_unnamed_addr

; Function Attrs: nounwind
define dso_local void @mayo_memset(ptr noundef %dst, i8 noundef zeroext %val, i32 noundef %len) local_unnamed_addr #2 !dbg !183 {
entry:
    #dbg_value(ptr %dst, !187, !DIExpression(), !188)
    #dbg_value(i8 %val, !189, !DIExpression(), !188)
    #dbg_value(i32 %len, !190, !DIExpression(), !188)
    #dbg_value(ptr %dst, !191, !DIExpression(), !188)
    #dbg_value(i32 0, !192, !DIExpression(), !194)
  br label %for.cond, !dbg !195

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !196
    #dbg_value(i32 %i.0, !192, !DIExpression(), !194)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !197
  br i1 %exitcond, label %for.body, label %for.end, !dbg !199

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %dst, i32 %i.0, !dbg !200
  store i8 %val, ptr %arrayidx, align 1, !dbg !201
  %inc = add i32 %i.0, 1, !dbg !202
    #dbg_value(i32 %inc, !192, !DIExpression(), !194)
  br label %for.cond, !dbg !203, !llvm.loop !204

for.end:                                          ; preds = %for.cond
  ret void, !dbg !207
}

; Function Attrs: nounwind
define dso_local void @mayo_memcpy(ptr noundef %dst, ptr noundef %src, i32 noundef %len) local_unnamed_addr #2 !dbg !208 {
entry:
    #dbg_value(ptr %dst, !213, !DIExpression(), !214)
    #dbg_value(ptr %src, !215, !DIExpression(), !214)
    #dbg_value(i32 %len, !216, !DIExpression(), !214)
    #dbg_value(ptr %dst, !217, !DIExpression(), !214)
    #dbg_value(ptr %src, !218, !DIExpression(), !214)
    #dbg_value(i32 0, !221, !DIExpression(), !223)
  br label %for.cond, !dbg !224

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !225
    #dbg_value(i32 %i.0, !221, !DIExpression(), !223)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !226
  br i1 %exitcond, label %for.body, label %for.end, !dbg !228

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %src, i32 %i.0, !dbg !229
  %0 = load i8, ptr %arrayidx, align 1, !dbg !229
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %dst, i32 %i.0, !dbg !230
  store i8 %0, ptr %arrayidx1, align 1, !dbg !231
  %inc = add i32 %i.0, 1, !dbg !232
    #dbg_value(i32 %inc, !221, !DIExpression(), !223)
  br label %for.cond, !dbg !233, !llvm.loop !234

for.end:                                          ; preds = %for.cond
  ret void, !dbg !236
}

attributes #0 = { inlinehint nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+thumb-mode,+vfp2sp,+vfp3d16sp,+vfp4d16sp" }
attributes #1 = { inlinehint }
attributes #2 = { nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+thumb-mode,+vfp2sp,+vfp3d16sp,+vfp4d16sp" }

!llvm.dbg.cu = !{!35, !37, !38, !2, !67, !78, !87, !105, !123, !124}
!llvm.ident = !{!125, !125, !125, !125, !125, !125, !125, !125}
!llvm.module.flags = !{!126, !127, !128, !129}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "pqmayo_MAYO_1_ref_unsigned_char_blocker", scope: !2, file: !29, line: 128, type: !34, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !26, splitDebugInlining: false, nameTableKind: None)
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
!26 = !{!27, !31, !0}
!27 = !DIGlobalVariableExpression(var: !28, expr: !DIExpression())
!28 = distinct !DIGlobalVariable(name: "pqmayo_MAYO_1_ref_uint32_t_blocker", scope: !2, file: !29, line: 126, type: !30, isLocal: false, isDefinition: true)
!29 = !DIFile(filename: "../../../src/arithmetic.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!30 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !16)
!31 = !DIGlobalVariableExpression(var: !32, expr: !DIExpression())
!32 = distinct !DIGlobalVariable(name: "pqmayo_MAYO_1_ref_uint64_t_blocker", scope: !2, file: !29, line: 127, type: !33, isLocal: false, isDefinition: true)
!33 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !5)
!34 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !15)
!35 = distinct !DICompileUnit(language: DW_LANG_C11, file: !36, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!36 = !DIFile(filename: "../<stdin>", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!37 = distinct !DICompileUnit(language: DW_LANG_C11, file: !36, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!38 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !39, globals: !46, splitDebugInlining: false, nameTableKind: None)
!39 = !{!40, !41, !15, !44, !14, !16}
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 32)
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !42, size: 32)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !6, line: 24, baseType: !43)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !8, line: 43, baseType: !15)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !45, line: 214, baseType: !18)
!45 = !DIFile(filename: "/usr/lib/gcc/arm-none-eabi/13.2.1/include/stddef.h", directory: "")
!46 = !{!47, !53, !61, !63, !65}
!47 = !DIGlobalVariableExpression(var: !48, expr: !DIExpression())
!48 = distinct !DIGlobalVariable(name: "f_tail", scope: !38, file: !49, line: 247, type: !50, isLocal: true, isDefinition: true)
!49 = !DIFile(filename: "../../../include/mayo.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 32, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 4)
!53 = !DIGlobalVariableExpression(var: !54, expr: !DIExpression())
!54 = distinct !DIGlobalVariable(name: "even_nibbles", scope: !55, file: !56, line: 118, type: !60, isLocal: true, isDefinition: true)
!55 = distinct !DISubprogram(name: "transpose_16x16_nibbles", scope: !56, file: !56, line: 117, type: !57, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !38, retainedNodes: !59)
!56 = !DIFile(filename: "../../../src/mayo.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!57 = !DISubroutineType(types: !58)
!58 = !{null, !40}
!59 = !{}
!60 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !5)
!61 = !DIGlobalVariableExpression(var: !62, expr: !DIExpression())
!62 = distinct !DIGlobalVariable(name: "even_bytes", scope: !55, file: !56, line: 119, type: !60, isLocal: true, isDefinition: true)
!63 = !DIGlobalVariableExpression(var: !64, expr: !DIExpression())
!64 = distinct !DIGlobalVariable(name: "even_2bytes", scope: !55, file: !56, line: 120, type: !60, isLocal: true, isDefinition: true)
!65 = !DIGlobalVariableExpression(var: !66, expr: !DIExpression())
!66 = distinct !DIGlobalVariable(name: "even_half", scope: !55, file: !56, line: 121, type: !60, isLocal: true, isDefinition: true)
!67 = distinct !DICompileUnit(language: DW_LANG_C11, file: !68, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !69, globals: !71, splitDebugInlining: false, nameTableKind: None)
!68 = !DIFile(filename: "../../../src/common/<stdin>", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!69 = !{!70, !16, !5, !44, !42}
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 32)
!71 = !{!72}
!72 = !DIGlobalVariableExpression(var: !73, expr: !DIExpression())
!73 = distinct !DIGlobalVariable(name: "KeccakF_RoundConstants", scope: !67, file: !74, line: 214, type: !75, isLocal: true, isDefinition: true)
!74 = !DIFile(filename: "../../../src/common/fips202.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!75 = !DICompositeType(tag: DW_TAG_array_type, baseType: !60, size: 1536, elements: !76)
!76 = !{!77}
!77 = !DISubrange(count: 24)
!78 = distinct !DICompileUnit(language: DW_LANG_C11, file: !68, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !79, globals: !80, splitDebugInlining: false, nameTableKind: None)
!79 = !{!70, !10, !5, !16, !15}
!80 = !{!81}
!81 = !DIGlobalVariableExpression(var: !82, expr: !DIExpression())
!82 = distinct !DIGlobalVariable(name: "Rcon", scope: !78, file: !83, line: 388, type: !84, isLocal: true, isDefinition: true)
!83 = !DIFile(filename: "../../../src/common/aes_c.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!84 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 80, elements: !85)
!85 = !{!86}
!86 = !DISubrange(count: 10)
!87 = distinct !DICompileUnit(language: DW_LANG_C11, file: !68, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !88, splitDebugInlining: false, nameTableKind: None)
!88 = !{!89, !100}
!89 = !DIGlobalVariableExpression(var: !90, expr: !DIExpression())
!90 = distinct !DIGlobalVariable(name: "memset_func", scope: !91, file: !92, line: 10, type: !95, isLocal: true, isDefinition: true)
!91 = distinct !DISubprogram(name: "mayo_secure_free", scope: !92, file: !92, line: 7, type: !93, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !87, retainedNodes: !59)
!92 = !DIFile(filename: "../../../src/common/mem.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!93 = !DISubroutineType(types: !94)
!94 = !{null, !70, !44}
!95 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !96)
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "memset_t", scope: !91, file: !92, line: 9, baseType: !97)
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 32)
!98 = !DISubroutineType(types: !99)
!99 = !{!70, !70, !10, !44}
!100 = !DIGlobalVariableExpression(var: !101, expr: !DIExpression())
!101 = distinct !DIGlobalVariable(name: "memset_func", scope: !102, file: !92, line: 17, type: !103, isLocal: true, isDefinition: true)
!102 = distinct !DISubprogram(name: "mayo_secure_clear", scope: !92, file: !92, line: 15, type: !93, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !87, retainedNodes: !59)
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
!122 = !DIDerivedType(tag: DW_TAG_member, name: "reseed_counter", scope: !112, file: !110, line: 39, baseType: !10, size: 32, offset: 384)
!123 = distinct !DICompileUnit(language: DW_LANG_C11, file: !36, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!124 = distinct !DICompileUnit(language: DW_LANG_C11, file: !36, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!125 = !{!"Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)"}
!126 = !{i32 2, !"Debug Info Version", i32 3}
!127 = !{i32 1, !"wchar_size", i32 4}
!128 = !{i32 1, !"min_enum_size", i32 4}
!129 = !{i32 1, !"Code Model", i32 1}
!130 = distinct !DISubprogram(name: "lincomb", scope: !131, file: !131, line: 71, type: !132, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !38, retainedNodes: !59)
!131 = !DIFile(filename: "../../../src/simple_arithmetic.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!132 = !DISubroutineType(types: !133)
!133 = !{!15, !19, !19, !10, !10}
!134 = !DILocalVariable(name: "a", arg: 1, scope: !130, file: !131, line: 71, type: !19)
!135 = !DILocation(line: 0, scope: !130)
!136 = !DILocalVariable(name: "b", arg: 2, scope: !130, file: !131, line: 72, type: !19)
!137 = !DILocalVariable(name: "n", arg: 3, scope: !130, file: !131, line: 72, type: !10)
!138 = !DILocalVariable(name: "m", arg: 4, scope: !130, file: !131, line: 72, type: !10)
!139 = !DILocalVariable(name: "ret", scope: !130, file: !131, line: 73, type: !15)
!140 = !DILocalVariable(name: "i", scope: !141, file: !131, line: 74, type: !10)
!141 = distinct !DILexicalBlock(scope: !130, file: !131, line: 74, column: 5)
!142 = !DILocation(line: 0, scope: !141)
!143 = !DILocation(line: 79, column: 5, scope: !130)
!144 = !DILocation(line: 75, column: 27, scope: !145)
!145 = distinct !DILexicalBlock(scope: !146, file: !131, line: 74, column: 41)
!146 = distinct !DILexicalBlock(scope: !141, file: !131, line: 74, column: 5)
!147 = !DILocation(line: 75, column: 33, scope: !145)
!148 = !DILocalVariable(name: "a", arg: 1, scope: !149, file: !131, line: 10, type: !15)
!149 = distinct !DISubprogram(name: "mul_f", scope: !131, file: !131, line: 10, type: !150, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !38, retainedNodes: !59)
!150 = !DISubroutineType(types: !151)
!151 = !{!15, !15, !15}
!152 = !DILocation(line: 0, scope: !149, inlinedAt: !153)
!153 = distinct !DILocation(line: 75, column: 21, scope: !145)
!154 = !DILocalVariable(name: "b", arg: 2, scope: !149, file: !131, line: 10, type: !15)
!155 = !DILocation(line: 15, column: 10, scope: !149, inlinedAt: !153)
!156 = !DILocation(line: 15, column: 7, scope: !149, inlinedAt: !153)
!157 = !DILocation(line: 18, column: 17, scope: !149, inlinedAt: !153)
!158 = !DILocalVariable(name: "p", scope: !149, file: !131, line: 12, type: !15)
!159 = !DILocation(line: 19, column: 13, scope: !149, inlinedAt: !153)
!160 = !DILocation(line: 19, column: 17, scope: !149, inlinedAt: !153)
!161 = !DILocation(line: 19, column: 7, scope: !149, inlinedAt: !153)
!162 = !DILocation(line: 20, column: 13, scope: !149, inlinedAt: !153)
!163 = !DILocation(line: 20, column: 17, scope: !149, inlinedAt: !153)
!164 = !DILocation(line: 20, column: 7, scope: !149, inlinedAt: !153)
!165 = !DILocation(line: 21, column: 13, scope: !149, inlinedAt: !153)
!166 = !DILocation(line: 21, column: 17, scope: !149, inlinedAt: !153)
!167 = !DILocation(line: 21, column: 7, scope: !149, inlinedAt: !153)
!168 = !DILocalVariable(name: "top_p", scope: !149, file: !131, line: 24, type: !15)
!169 = !DILocation(line: 25, column: 37, scope: !149, inlinedAt: !153)
!170 = !DILocation(line: 25, column: 52, scope: !149, inlinedAt: !153)
!171 = !DILocation(line: 25, column: 43, scope: !149, inlinedAt: !153)
!172 = !DILocation(line: 25, column: 59, scope: !149, inlinedAt: !153)
!173 = !DILocalVariable(name: "out", scope: !149, file: !131, line: 25, type: !15)
!174 = !DILocalVariable(name: "a", arg: 1, scope: !175, file: !131, line: 44, type: !15)
!175 = distinct !DISubprogram(name: "add_f", scope: !131, file: !131, line: 44, type: !150, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !38, retainedNodes: !59)
!176 = !DILocation(line: 0, scope: !175, inlinedAt: !177)
!177 = distinct !DILocation(line: 75, column: 15, scope: !145)
!178 = !DILocalVariable(name: "b", arg: 2, scope: !175, file: !131, line: 44, type: !15)
!179 = !DILocation(line: 45, column: 14, scope: !175, inlinedAt: !177)
!180 = !DILocation(line: 74, column: 35, scope: !146)
!181 = !{!"a_buf"}
!182 = !{!"x"}
!183 = distinct !DISubprogram(name: "mayo_memset", scope: !184, file: !184, line: 3, type: !185, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !123, retainedNodes: !59)
!184 = !DIFile(filename: "../mem.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!185 = !DISubroutineType(types: !186)
!186 = !{null, !70, !42, !16}
!187 = !DILocalVariable(name: "dst", arg: 1, scope: !183, file: !184, line: 3, type: !70)
!188 = !DILocation(line: 0, scope: !183)
!189 = !DILocalVariable(name: "val", arg: 2, scope: !183, file: !184, line: 3, type: !42)
!190 = !DILocalVariable(name: "len", arg: 3, scope: !183, file: !184, line: 3, type: !16)
!191 = !DILocalVariable(name: "d", scope: !183, file: !184, line: 5, type: !41)
!192 = !DILocalVariable(name: "i", scope: !193, file: !184, line: 7, type: !16)
!193 = distinct !DILexicalBlock(scope: !183, file: !184, line: 7, column: 5)
!194 = !DILocation(line: 0, scope: !193)
!195 = !DILocation(line: 7, column: 10, scope: !193)
!196 = !DILocation(line: 7, scope: !193)
!197 = !DILocation(line: 7, column: 28, scope: !198)
!198 = distinct !DILexicalBlock(scope: !193, file: !184, line: 7, column: 5)
!199 = !DILocation(line: 7, column: 5, scope: !193)
!200 = !DILocation(line: 8, column: 9, scope: !198)
!201 = !DILocation(line: 8, column: 14, scope: !198)
!202 = !DILocation(line: 7, column: 36, scope: !198)
!203 = !DILocation(line: 7, column: 5, scope: !198)
!204 = distinct !{!204, !199, !205, !206}
!205 = !DILocation(line: 8, column: 16, scope: !193)
!206 = !{!"llvm.loop.mustprogress"}
!207 = !DILocation(line: 9, column: 1, scope: !183)
!208 = distinct !DISubprogram(name: "mayo_memcpy", scope: !184, file: !184, line: 11, type: !209, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !124, retainedNodes: !59)
!209 = !DISubroutineType(types: !210)
!210 = !{null, !70, !211, !16}
!211 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !212, size: 32)
!212 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!213 = !DILocalVariable(name: "dst", arg: 1, scope: !208, file: !184, line: 11, type: !70)
!214 = !DILocation(line: 0, scope: !208)
!215 = !DILocalVariable(name: "src", arg: 2, scope: !208, file: !184, line: 11, type: !211)
!216 = !DILocalVariable(name: "len", arg: 3, scope: !208, file: !184, line: 11, type: !16)
!217 = !DILocalVariable(name: "d", scope: !208, file: !184, line: 13, type: !41)
!218 = !DILocalVariable(name: "s", scope: !208, file: !184, line: 14, type: !219)
!219 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !220, size: 32)
!220 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !42)
!221 = !DILocalVariable(name: "i", scope: !222, file: !184, line: 16, type: !16)
!222 = distinct !DILexicalBlock(scope: !208, file: !184, line: 16, column: 5)
!223 = !DILocation(line: 0, scope: !222)
!224 = !DILocation(line: 16, column: 10, scope: !222)
!225 = !DILocation(line: 16, scope: !222)
!226 = !DILocation(line: 16, column: 28, scope: !227)
!227 = distinct !DILexicalBlock(scope: !222, file: !184, line: 16, column: 5)
!228 = !DILocation(line: 16, column: 5, scope: !222)
!229 = !DILocation(line: 17, column: 16, scope: !227)
!230 = !DILocation(line: 17, column: 9, scope: !227)
!231 = !DILocation(line: 17, column: 14, scope: !227)
!232 = !DILocation(line: 16, column: 36, scope: !227)
!233 = !DILocation(line: 16, column: 5, scope: !227)
!234 = distinct !{!234, !228, !235, !206}
!235 = !DILocation(line: 17, column: 19, scope: !222)
!236 = !DILocation(line: 18, column: 1, scope: !208)
