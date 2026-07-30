; ModuleID = '../../mayo_IR/mayo1.ll'
source_filename = "composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "thumbv7em-unknown-none-eabihf"

; Function Attrs: inlinehint nounwind
define dso_local fastcc void @m_vec_mul_add(i32 noundef %m_vec_limbs, ptr noundef %in, i8 noundef zeroext %a, ptr noundef %acc) unnamed_addr #0 !dbg !130 {
entry:
    #dbg_value(i32 %m_vec_limbs, !135, !DIExpression(), !136)
    #dbg_value(ptr %in, !137, !DIExpression(), !136)
    #dbg_value(i8 %a, !138, !DIExpression(), !136)
    #dbg_value(ptr %acc, !139, !DIExpression(), !136)
    #dbg_value(i8 %a, !140, !DIExpression(), !145)
  %conv.i = zext i8 %a to i32, !dbg !147
  %mul.i = mul i32 %conv.i, 134480385, !dbg !148
    #dbg_value(i32 %mul.i, !149, !DIExpression(), !145)
    #dbg_value(i32 -252645136, !150, !DIExpression(), !145)
  %and.i = and i32 %mul.i, -252645136, !dbg !151
    #dbg_value(i32 %and.i, !152, !DIExpression(), !145)
  %shr.i = lshr exact i32 %and.i, 4, !dbg !153
  %shr1.i = lshr exact i32 %and.i, 3, !dbg !154
  %0 = xor i32 %shr.i, %shr1.i, !dbg !155
  %xor2.i = xor i32 %0, %mul.i, !dbg !155
    #dbg_value(i32 %xor2.i, !156, !DIExpression(), !136)
    #dbg_value(i64 1229782938247303441, !157, !DIExpression(), !136)
    #dbg_value(i32 0, !158, !DIExpression(), !160)
  br label %iter_0_start

for.end:                                          ; preds = %iter_4_end
  ret void, !dbg !161

iter_0_start:                                     ; preds = %entry
  br label %for.body.iter0

for.body.iter0:                                   ; preds = %iter_0_start
    #dbg_value(i32 undef, !158, !DIExpression(), !160)
  %arrayidx.iter0 = getelementptr inbounds nuw i64, ptr %in, i32 0, !dbg !162
  %1 = load i64, ptr %arrayidx.iter0, align 8, !dbg !162
  %and.iter0 = and i64 %1, 1229782938247303441, !dbg !165
  %and1.iter0 = and i32 %xor2.i, 255, !dbg !166
  %conv.iter0 = zext nneg i32 %and1.iter0 to i64, !dbg !167
  %mul.iter0 = mul i64 %and.iter0, %conv.iter0, !dbg !168
  %shr.iter0 = lshr i64 %1, 1, !dbg !169
  %and3.iter0 = and i64 %shr.iter0, 1229782938247303441, !dbg !170
  %shr4.iter0 = lshr i32 %xor2.i, 8, !dbg !171
  %and5.iter0 = and i32 %shr4.iter0, 15, !dbg !172
  %conv6.iter0 = zext nneg i32 %and5.iter0 to i64, !dbg !173
  %mul7.iter0 = mul nuw i64 %and3.iter0, %conv6.iter0, !dbg !174
  %xor.iter0 = xor i64 %mul.iter0, %mul7.iter0, !dbg !175
  %arrayidx8.iter0 = getelementptr inbounds nuw i64, ptr %in, i32 0, !dbg !176
  %2 = load i64, ptr %arrayidx8.iter0, align 8, !dbg !176
  %shr9.iter0 = lshr i64 %2, 2, !dbg !177
  %and10.iter0 = and i64 %shr9.iter0, 1229782938247303441, !dbg !178
  %shr11.iter0 = lshr i32 %xor2.i, 16, !dbg !179
  %and12.iter0 = and i32 %shr11.iter0, 15, !dbg !180
  %conv13.iter0 = zext nneg i32 %and12.iter0 to i64, !dbg !181
  %mul14.iter0 = mul nuw i64 %and10.iter0, %conv13.iter0, !dbg !182
  %xor15.iter0 = xor i64 %xor.iter0, %mul14.iter0, !dbg !183
  %arrayidx16.iter0 = getelementptr inbounds nuw i64, ptr %in, i32 0, !dbg !184
  %3 = load i64, ptr %arrayidx16.iter0, align 8, !dbg !184
  %shr17.iter0 = lshr i64 %3, 3, !dbg !185
  %and18.iter0 = and i64 %shr17.iter0, 1229782938247303441, !dbg !186
  %shr19.iter0 = lshr i32 %xor2.i, 24, !dbg !187
  %and20.iter0 = and i32 %shr19.iter0, 15, !dbg !188
  %conv21.iter0 = zext nneg i32 %and20.iter0 to i64, !dbg !189
  %mul22.iter0 = mul nuw i64 %and18.iter0, %conv21.iter0, !dbg !190
  %xor23.iter0 = xor i64 %xor15.iter0, %mul22.iter0, !dbg !191
  %arrayidx24.iter0 = getelementptr inbounds nuw i64, ptr %acc, i32 0, !dbg !192
  %4 = load i64, ptr %arrayidx24.iter0, align 8, !dbg !193
  %xor25.iter0 = xor i64 %4, %xor23.iter0, !dbg !193
  store i64 %xor25.iter0, ptr %arrayidx24.iter0, align 8, !dbg !193
    #dbg_value(i32 undef, !158, !DIExpression(), !160)
  br label %iter_0_end

iter_0_end:                                       ; preds = %for.body.iter0
  br label %iter_1_start

iter_1_start:                                     ; preds = %iter_0_end
  br label %for.body.iter1

for.body.iter1:                                   ; preds = %iter_1_start
    #dbg_value(i32 undef, !158, !DIExpression(), !160)
  %arrayidx.iter1 = getelementptr inbounds nuw i64, ptr %in, i32 1, !dbg !162
  %5 = load i64, ptr %arrayidx.iter1, align 8, !dbg !162
  %and.iter1 = and i64 %5, 1229782938247303441, !dbg !165
  %and1.iter1 = and i32 %xor2.i, 255, !dbg !166
  %conv.iter1 = zext nneg i32 %and1.iter1 to i64, !dbg !167
  %mul.iter1 = mul i64 %and.iter1, %conv.iter1, !dbg !168
  %shr.iter1 = lshr i64 %5, 1, !dbg !169
  %and3.iter1 = and i64 %shr.iter1, 1229782938247303441, !dbg !170
  %shr4.iter1 = lshr i32 %xor2.i, 8, !dbg !171
  %and5.iter1 = and i32 %shr4.iter1, 15, !dbg !172
  %conv6.iter1 = zext nneg i32 %and5.iter1 to i64, !dbg !173
  %mul7.iter1 = mul nuw i64 %and3.iter1, %conv6.iter1, !dbg !174
  %xor.iter1 = xor i64 %mul.iter1, %mul7.iter1, !dbg !175
  %arrayidx8.iter1 = getelementptr inbounds nuw i64, ptr %in, i32 1, !dbg !176
  %6 = load i64, ptr %arrayidx8.iter1, align 8, !dbg !176
  %shr9.iter1 = lshr i64 %6, 2, !dbg !177
  %and10.iter1 = and i64 %shr9.iter1, 1229782938247303441, !dbg !178
  %shr11.iter1 = lshr i32 %xor2.i, 16, !dbg !179
  %and12.iter1 = and i32 %shr11.iter1, 15, !dbg !180
  %conv13.iter1 = zext nneg i32 %and12.iter1 to i64, !dbg !181
  %mul14.iter1 = mul nuw i64 %and10.iter1, %conv13.iter1, !dbg !182
  %xor15.iter1 = xor i64 %xor.iter1, %mul14.iter1, !dbg !183
  %arrayidx16.iter1 = getelementptr inbounds nuw i64, ptr %in, i32 1, !dbg !184
  %7 = load i64, ptr %arrayidx16.iter1, align 8, !dbg !184
  %shr17.iter1 = lshr i64 %7, 3, !dbg !185
  %and18.iter1 = and i64 %shr17.iter1, 1229782938247303441, !dbg !186
  %shr19.iter1 = lshr i32 %xor2.i, 24, !dbg !187
  %and20.iter1 = and i32 %shr19.iter1, 15, !dbg !188
  %conv21.iter1 = zext nneg i32 %and20.iter1 to i64, !dbg !189
  %mul22.iter1 = mul nuw i64 %and18.iter1, %conv21.iter1, !dbg !190
  %xor23.iter1 = xor i64 %xor15.iter1, %mul22.iter1, !dbg !191
  %arrayidx24.iter1 = getelementptr inbounds nuw i64, ptr %acc, i32 1, !dbg !192
  %8 = load i64, ptr %arrayidx24.iter1, align 8, !dbg !193
  %xor25.iter1 = xor i64 %8, %xor23.iter1, !dbg !193
  store i64 %xor25.iter1, ptr %arrayidx24.iter1, align 8, !dbg !193
    #dbg_value(i32 undef, !158, !DIExpression(), !160)
  br label %iter_1_end

iter_1_end:                                       ; preds = %for.body.iter1
  br label %iter_2_start

iter_2_start:                                     ; preds = %iter_1_end
  br label %for.body.iter2

for.body.iter2:                                   ; preds = %iter_2_start
    #dbg_value(i32 undef, !158, !DIExpression(), !160)
  %arrayidx.iter2 = getelementptr inbounds nuw i64, ptr %in, i32 2, !dbg !162
  %9 = load i64, ptr %arrayidx.iter2, align 8, !dbg !162
  %and.iter2 = and i64 %9, 1229782938247303441, !dbg !165
  %and1.iter2 = and i32 %xor2.i, 255, !dbg !166
  %conv.iter2 = zext nneg i32 %and1.iter2 to i64, !dbg !167
  %mul.iter2 = mul i64 %and.iter2, %conv.iter2, !dbg !168
  %shr.iter2 = lshr i64 %9, 1, !dbg !169
  %and3.iter2 = and i64 %shr.iter2, 1229782938247303441, !dbg !170
  %shr4.iter2 = lshr i32 %xor2.i, 8, !dbg !171
  %and5.iter2 = and i32 %shr4.iter2, 15, !dbg !172
  %conv6.iter2 = zext nneg i32 %and5.iter2 to i64, !dbg !173
  %mul7.iter2 = mul nuw i64 %and3.iter2, %conv6.iter2, !dbg !174
  %xor.iter2 = xor i64 %mul.iter2, %mul7.iter2, !dbg !175
  %arrayidx8.iter2 = getelementptr inbounds nuw i64, ptr %in, i32 2, !dbg !176
  %10 = load i64, ptr %arrayidx8.iter2, align 8, !dbg !176
  %shr9.iter2 = lshr i64 %10, 2, !dbg !177
  %and10.iter2 = and i64 %shr9.iter2, 1229782938247303441, !dbg !178
  %shr11.iter2 = lshr i32 %xor2.i, 16, !dbg !179
  %and12.iter2 = and i32 %shr11.iter2, 15, !dbg !180
  %conv13.iter2 = zext nneg i32 %and12.iter2 to i64, !dbg !181
  %mul14.iter2 = mul nuw i64 %and10.iter2, %conv13.iter2, !dbg !182
  %xor15.iter2 = xor i64 %xor.iter2, %mul14.iter2, !dbg !183
  %arrayidx16.iter2 = getelementptr inbounds nuw i64, ptr %in, i32 2, !dbg !184
  %11 = load i64, ptr %arrayidx16.iter2, align 8, !dbg !184
  %shr17.iter2 = lshr i64 %11, 3, !dbg !185
  %and18.iter2 = and i64 %shr17.iter2, 1229782938247303441, !dbg !186
  %shr19.iter2 = lshr i32 %xor2.i, 24, !dbg !187
  %and20.iter2 = and i32 %shr19.iter2, 15, !dbg !188
  %conv21.iter2 = zext nneg i32 %and20.iter2 to i64, !dbg !189
  %mul22.iter2 = mul nuw i64 %and18.iter2, %conv21.iter2, !dbg !190
  %xor23.iter2 = xor i64 %xor15.iter2, %mul22.iter2, !dbg !191
  %arrayidx24.iter2 = getelementptr inbounds nuw i64, ptr %acc, i32 2, !dbg !192
  %12 = load i64, ptr %arrayidx24.iter2, align 8, !dbg !193
  %xor25.iter2 = xor i64 %12, %xor23.iter2, !dbg !193
  store i64 %xor25.iter2, ptr %arrayidx24.iter2, align 8, !dbg !193
    #dbg_value(i32 undef, !158, !DIExpression(), !160)
  br label %iter_2_end

iter_2_end:                                       ; preds = %for.body.iter2
  br label %iter_3_start

iter_3_start:                                     ; preds = %iter_2_end
  br label %for.body.iter3

for.body.iter3:                                   ; preds = %iter_3_start
    #dbg_value(i32 undef, !158, !DIExpression(), !160)
  %arrayidx.iter3 = getelementptr inbounds nuw i64, ptr %in, i32 3, !dbg !162
  %13 = load i64, ptr %arrayidx.iter3, align 8, !dbg !162
  %and.iter3 = and i64 %13, 1229782938247303441, !dbg !165
  %and1.iter3 = and i32 %xor2.i, 255, !dbg !166
  %conv.iter3 = zext nneg i32 %and1.iter3 to i64, !dbg !167
  %mul.iter3 = mul i64 %and.iter3, %conv.iter3, !dbg !168
  %shr.iter3 = lshr i64 %13, 1, !dbg !169
  %and3.iter3 = and i64 %shr.iter3, 1229782938247303441, !dbg !170
  %shr4.iter3 = lshr i32 %xor2.i, 8, !dbg !171
  %and5.iter3 = and i32 %shr4.iter3, 15, !dbg !172
  %conv6.iter3 = zext nneg i32 %and5.iter3 to i64, !dbg !173
  %mul7.iter3 = mul nuw i64 %and3.iter3, %conv6.iter3, !dbg !174
  %xor.iter3 = xor i64 %mul.iter3, %mul7.iter3, !dbg !175
  %arrayidx8.iter3 = getelementptr inbounds nuw i64, ptr %in, i32 3, !dbg !176
  %14 = load i64, ptr %arrayidx8.iter3, align 8, !dbg !176
  %shr9.iter3 = lshr i64 %14, 2, !dbg !177
  %and10.iter3 = and i64 %shr9.iter3, 1229782938247303441, !dbg !178
  %shr11.iter3 = lshr i32 %xor2.i, 16, !dbg !179
  %and12.iter3 = and i32 %shr11.iter3, 15, !dbg !180
  %conv13.iter3 = zext nneg i32 %and12.iter3 to i64, !dbg !181
  %mul14.iter3 = mul nuw i64 %and10.iter3, %conv13.iter3, !dbg !182
  %xor15.iter3 = xor i64 %xor.iter3, %mul14.iter3, !dbg !183
  %arrayidx16.iter3 = getelementptr inbounds nuw i64, ptr %in, i32 3, !dbg !184
  %15 = load i64, ptr %arrayidx16.iter3, align 8, !dbg !184
  %shr17.iter3 = lshr i64 %15, 3, !dbg !185
  %and18.iter3 = and i64 %shr17.iter3, 1229782938247303441, !dbg !186
  %shr19.iter3 = lshr i32 %xor2.i, 24, !dbg !187
  %and20.iter3 = and i32 %shr19.iter3, 15, !dbg !188
  %conv21.iter3 = zext nneg i32 %and20.iter3 to i64, !dbg !189
  %mul22.iter3 = mul nuw i64 %and18.iter3, %conv21.iter3, !dbg !190
  %xor23.iter3 = xor i64 %xor15.iter3, %mul22.iter3, !dbg !191
  %arrayidx24.iter3 = getelementptr inbounds nuw i64, ptr %acc, i32 3, !dbg !192
  %16 = load i64, ptr %arrayidx24.iter3, align 8, !dbg !193
  %xor25.iter3 = xor i64 %16, %xor23.iter3, !dbg !193
  store i64 %xor25.iter3, ptr %arrayidx24.iter3, align 8, !dbg !193
    #dbg_value(i32 undef, !158, !DIExpression(), !160)
  br label %iter_3_end

iter_3_end:                                       ; preds = %for.body.iter3
  br label %iter_4_start

iter_4_start:                                     ; preds = %iter_3_end
  br label %for.body.iter4

for.body.iter4:                                   ; preds = %iter_4_start
    #dbg_value(i32 undef, !158, !DIExpression(), !160)
  %arrayidx.iter4 = getelementptr inbounds nuw i64, ptr %in, i32 4, !dbg !162
  %17 = load i64, ptr %arrayidx.iter4, align 8, !dbg !162
  %and.iter4 = and i64 %17, 1229782938247303441, !dbg !165
  %and1.iter4 = and i32 %xor2.i, 255, !dbg !166
  %conv.iter4 = zext nneg i32 %and1.iter4 to i64, !dbg !167
  %mul.iter4 = mul i64 %and.iter4, %conv.iter4, !dbg !168
  %shr.iter4 = lshr i64 %17, 1, !dbg !169
  %and3.iter4 = and i64 %shr.iter4, 1229782938247303441, !dbg !170
  %shr4.iter4 = lshr i32 %xor2.i, 8, !dbg !171
  %and5.iter4 = and i32 %shr4.iter4, 15, !dbg !172
  %conv6.iter4 = zext nneg i32 %and5.iter4 to i64, !dbg !173
  %mul7.iter4 = mul nuw i64 %and3.iter4, %conv6.iter4, !dbg !174
  %xor.iter4 = xor i64 %mul.iter4, %mul7.iter4, !dbg !175
  %arrayidx8.iter4 = getelementptr inbounds nuw i64, ptr %in, i32 4, !dbg !176
  %18 = load i64, ptr %arrayidx8.iter4, align 8, !dbg !176
  %shr9.iter4 = lshr i64 %18, 2, !dbg !177
  %and10.iter4 = and i64 %shr9.iter4, 1229782938247303441, !dbg !178
  %shr11.iter4 = lshr i32 %xor2.i, 16, !dbg !179
  %and12.iter4 = and i32 %shr11.iter4, 15, !dbg !180
  %conv13.iter4 = zext nneg i32 %and12.iter4 to i64, !dbg !181
  %mul14.iter4 = mul nuw i64 %and10.iter4, %conv13.iter4, !dbg !182
  %xor15.iter4 = xor i64 %xor.iter4, %mul14.iter4, !dbg !183
  %arrayidx16.iter4 = getelementptr inbounds nuw i64, ptr %in, i32 4, !dbg !184
  %19 = load i64, ptr %arrayidx16.iter4, align 8, !dbg !184
  %shr17.iter4 = lshr i64 %19, 3, !dbg !185
  %and18.iter4 = and i64 %shr17.iter4, 1229782938247303441, !dbg !186
  %shr19.iter4 = lshr i32 %xor2.i, 24, !dbg !187
  %and20.iter4 = and i32 %shr19.iter4, 15, !dbg !188
  %conv21.iter4 = zext nneg i32 %and20.iter4 to i64, !dbg !189
  %mul22.iter4 = mul nuw i64 %and18.iter4, %conv21.iter4, !dbg !190
  %xor23.iter4 = xor i64 %xor15.iter4, %mul22.iter4, !dbg !191
  %arrayidx24.iter4 = getelementptr inbounds nuw i64, ptr %acc, i32 4, !dbg !192
  %20 = load i64, ptr %arrayidx24.iter4, align 8, !dbg !193
  %xor25.iter4 = xor i64 %20, %xor23.iter4, !dbg !193
  store i64 %xor25.iter4, ptr %arrayidx24.iter4, align 8, !dbg !193
    #dbg_value(i32 undef, !158, !DIExpression(), !160)
  br label %iter_4_end

iter_4_end:                                       ; preds = %for.body.iter4
  br label %for.end
}

; Function Attrs: inlinehint
define i32 @main() local_unnamed_addr #1 {
entry:
  %sk = alloca [18603 x i64], align 16, !llvmbmc.var !194
  call void @mayo_memset(ptr %sk, i8 0, i32 148824)
  store i8 -80, ptr %sk, align 1
  %byte1 = getelementptr inbounds nuw i8, ptr %sk, i32 1
  store i8 78, ptr %byte1, align 1
  %byte2 = getelementptr inbounds nuw i8, ptr %sk, i32 2
  store i8 25, ptr %byte2, align 1
  %byte3 = getelementptr inbounds nuw i8, ptr %sk, i32 3
  store i8 47, ptr %byte3, align 1
  %byte4 = getelementptr inbounds nuw i8, ptr %sk, i32 4
  store i8 4, ptr %byte4, align 1
  %byte5 = getelementptr inbounds nuw i8, ptr %sk, i32 5
  store i8 19, ptr %byte5, align 1
  %byte6 = getelementptr inbounds nuw i8, ptr %sk, i32 6
  store i8 -91, ptr %byte6, align 1
  %byte7 = getelementptr inbounds nuw i8, ptr %sk, i32 7
  store i8 23, ptr %byte7, align 1
  %Pv = alloca [3900 x i64], align 16, !llvmbmc.var !195
  call void @mayo_memset(ptr %Pv, i8 0, i32 31200)
  call fastcc void @m_vec_mul_add(i32 5, ptr nonnull %sk, i8 13, ptr nonnull %Pv)
  %out_actual_i8 = load i8, ptr %Pv, align 1
  %out_cmp = icmp eq i8 %out_actual_i8, -60
  call void @_Z6assertb(i1 noundef zeroext %out_cmp)
  ret i32 0
}

declare void @_Z6assertb(i1 noundef zeroext) local_unnamed_addr

; Function Attrs: nounwind
define dso_local void @mayo_memset(ptr noundef %dst, i8 noundef zeroext %val, i32 noundef %len) local_unnamed_addr #2 !dbg !196 {
entry:
    #dbg_value(ptr %dst, !200, !DIExpression(), !201)
    #dbg_value(i8 %val, !202, !DIExpression(), !201)
    #dbg_value(i32 %len, !203, !DIExpression(), !201)
    #dbg_value(ptr %dst, !204, !DIExpression(), !201)
    #dbg_value(i32 0, !205, !DIExpression(), !207)
  br label %for.cond, !dbg !208

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !209
    #dbg_value(i32 %i.0, !205, !DIExpression(), !207)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !210
  br i1 %exitcond, label %for.body, label %for.end, !dbg !212

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %dst, i32 %i.0, !dbg !213
  store i8 %val, ptr %arrayidx, align 1, !dbg !214
  %inc = add i32 %i.0, 1, !dbg !215
    #dbg_value(i32 %inc, !205, !DIExpression(), !207)
  br label %for.cond, !dbg !216, !llvm.loop !217

for.end:                                          ; preds = %for.cond
  ret void, !dbg !220
}

; Function Attrs: nounwind
define dso_local void @mayo_memcpy(ptr noundef %dst, ptr noundef %src, i32 noundef %len) local_unnamed_addr #2 !dbg !221 {
entry:
    #dbg_value(ptr %dst, !226, !DIExpression(), !227)
    #dbg_value(ptr %src, !228, !DIExpression(), !227)
    #dbg_value(i32 %len, !229, !DIExpression(), !227)
    #dbg_value(ptr %dst, !230, !DIExpression(), !227)
    #dbg_value(ptr %src, !231, !DIExpression(), !227)
    #dbg_value(i32 0, !234, !DIExpression(), !236)
  br label %for.cond, !dbg !237

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !238
    #dbg_value(i32 %i.0, !234, !DIExpression(), !236)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !239
  br i1 %exitcond, label %for.body, label %for.end, !dbg !241

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %src, i32 %i.0, !dbg !242
  %0 = load i8, ptr %arrayidx, align 1, !dbg !242
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %dst, i32 %i.0, !dbg !243
  store i8 %0, ptr %arrayidx1, align 1, !dbg !244
  %inc = add i32 %i.0, 1, !dbg !245
    #dbg_value(i32 %inc, !234, !DIExpression(), !236)
  br label %for.cond, !dbg !246, !llvm.loop !247

for.end:                                          ; preds = %for.cond
  ret void, !dbg !249
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
!130 = distinct !DISubprogram(name: "m_vec_mul_add", scope: !131, file: !131, line: 31, type: !132, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !3, retainedNodes: !36)
!131 = !DIFile(filename: "../../../src/generic/arithmetic_fixed.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!132 = !DISubroutineType(types: !133)
!133 = !{null, !46, !134, !15, !6}
!134 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !37, size: 32)
!135 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !130, file: !131, line: 31, type: !46)
!136 = !DILocation(line: 0, scope: !130)
!137 = !DILocalVariable(name: "in", arg: 2, scope: !130, file: !131, line: 31, type: !134)
!138 = !DILocalVariable(name: "a", arg: 3, scope: !130, file: !131, line: 31, type: !15)
!139 = !DILocalVariable(name: "acc", arg: 4, scope: !130, file: !131, line: 31, type: !6)
!140 = !DILocalVariable(name: "b", arg: 1, scope: !141, file: !142, line: 136, type: !13)
!141 = distinct !DISubprogram(name: "mul_table", scope: !142, file: !142, line: 136, type: !143, scopeLine: 136, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !3, retainedNodes: !36)
!142 = !DIFile(filename: "../../../src/simple_arithmetic.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!143 = !DISubroutineType(types: !144)
!144 = !{!20, !13}
!145 = !DILocation(line: 0, scope: !141, inlinedAt: !146)
!146 = distinct !DILocation(line: 33, column: 20, scope: !130)
!147 = !DILocation(line: 137, column: 19, scope: !141, inlinedAt: !146)
!148 = !DILocation(line: 137, column: 33, scope: !141, inlinedAt: !146)
!149 = !DILocalVariable(name: "x", scope: !141, file: !142, line: 137, type: !20)
!150 = !DILocalVariable(name: "high_nibble_mask", scope: !141, file: !142, line: 139, type: !20)
!151 = !DILocation(line: 141, column: 28, scope: !141, inlinedAt: !146)
!152 = !DILocalVariable(name: "high_half", scope: !141, file: !142, line: 141, type: !20)
!153 = !DILocation(line: 142, column: 28, scope: !141, inlinedAt: !146)
!154 = !DILocation(line: 142, column: 47, scope: !141, inlinedAt: !146)
!155 = !DILocation(line: 142, column: 34, scope: !141, inlinedAt: !146)
!156 = !DILocalVariable(name: "tab", scope: !130, file: !131, line: 33, type: !20)
!157 = !DILocalVariable(name: "lsb_ask", scope: !130, file: !131, line: 35, type: !7)
!158 = !DILocalVariable(name: "i", scope: !159, file: !131, line: 37, type: !46)
!159 = distinct !DILexicalBlock(scope: !130, file: !131, line: 37, column: 5)
!160 = !DILocation(line: 0, scope: !159)
!161 = !DILocation(line: 44, column: 1, scope: !130)
!162 = !DILocation(line: 38, column: 21, scope: !163)
!163 = distinct !DILexicalBlock(scope: !164, file: !131, line: 37, column: 43)
!164 = distinct !DILexicalBlock(scope: !159, file: !131, line: 37, column: 5)
!165 = !DILocation(line: 38, column: 33, scope: !163)
!166 = !DILocation(line: 38, column: 51, scope: !163)
!167 = !DILocation(line: 38, column: 46, scope: !163)
!168 = !DILocation(line: 38, column: 44, scope: !163)
!169 = !DILocation(line: 39, column: 27, scope: !163)
!170 = !DILocation(line: 39, column: 33, scope: !163)
!171 = !DILocation(line: 39, column: 52, scope: !163)
!172 = !DILocation(line: 39, column: 59, scope: !163)
!173 = !DILocation(line: 39, column: 46, scope: !163)
!174 = !DILocation(line: 39, column: 44, scope: !163)
!175 = !DILocation(line: 39, column: 17, scope: !163)
!176 = !DILocation(line: 40, column: 21, scope: !163)
!177 = !DILocation(line: 40, column: 27, scope: !163)
!178 = !DILocation(line: 40, column: 33, scope: !163)
!179 = !DILocation(line: 40, column: 52, scope: !163)
!180 = !DILocation(line: 40, column: 59, scope: !163)
!181 = !DILocation(line: 40, column: 46, scope: !163)
!182 = !DILocation(line: 40, column: 44, scope: !163)
!183 = !DILocation(line: 40, column: 17, scope: !163)
!184 = !DILocation(line: 41, column: 21, scope: !163)
!185 = !DILocation(line: 41, column: 27, scope: !163)
!186 = !DILocation(line: 41, column: 33, scope: !163)
!187 = !DILocation(line: 41, column: 52, scope: !163)
!188 = !DILocation(line: 41, column: 59, scope: !163)
!189 = !DILocation(line: 41, column: 46, scope: !163)
!190 = !DILocation(line: 41, column: 44, scope: !163)
!191 = !DILocation(line: 41, column: 17, scope: !163)
!192 = !DILocation(line: 38, column: 9, scope: !163)
!193 = !DILocation(line: 38, column: 16, scope: !163)
!194 = !{!"sk"}
!195 = !{!"Pv"}
!196 = distinct !DISubprogram(name: "mayo_memset", scope: !197, file: !197, line: 3, type: !198, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !123, retainedNodes: !36)
!197 = !DIFile(filename: "../mem.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!198 = !DISubroutineType(types: !199)
!199 = !{null, !70, !13, !20}
!200 = !DILocalVariable(name: "dst", arg: 1, scope: !196, file: !197, line: 3, type: !70)
!201 = !DILocation(line: 0, scope: !196)
!202 = !DILocalVariable(name: "val", arg: 2, scope: !196, file: !197, line: 3, type: !13)
!203 = !DILocalVariable(name: "len", arg: 3, scope: !196, file: !197, line: 3, type: !20)
!204 = !DILocalVariable(name: "d", scope: !196, file: !197, line: 5, type: !12)
!205 = !DILocalVariable(name: "i", scope: !206, file: !197, line: 7, type: !20)
!206 = distinct !DILexicalBlock(scope: !196, file: !197, line: 7, column: 5)
!207 = !DILocation(line: 0, scope: !206)
!208 = !DILocation(line: 7, column: 10, scope: !206)
!209 = !DILocation(line: 7, scope: !206)
!210 = !DILocation(line: 7, column: 28, scope: !211)
!211 = distinct !DILexicalBlock(scope: !206, file: !197, line: 7, column: 5)
!212 = !DILocation(line: 7, column: 5, scope: !206)
!213 = !DILocation(line: 8, column: 9, scope: !211)
!214 = !DILocation(line: 8, column: 14, scope: !211)
!215 = !DILocation(line: 7, column: 36, scope: !211)
!216 = !DILocation(line: 7, column: 5, scope: !211)
!217 = distinct !{!217, !212, !218, !219}
!218 = !DILocation(line: 8, column: 16, scope: !206)
!219 = !{!"llvm.loop.mustprogress"}
!220 = !DILocation(line: 9, column: 1, scope: !196)
!221 = distinct !DISubprogram(name: "mayo_memcpy", scope: !197, file: !197, line: 11, type: !222, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !124, retainedNodes: !36)
!222 = !DISubroutineType(types: !223)
!223 = !{null, !70, !224, !20}
!224 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !225, size: 32)
!225 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!226 = !DILocalVariable(name: "dst", arg: 1, scope: !221, file: !197, line: 11, type: !70)
!227 = !DILocation(line: 0, scope: !221)
!228 = !DILocalVariable(name: "src", arg: 2, scope: !221, file: !197, line: 11, type: !224)
!229 = !DILocalVariable(name: "len", arg: 3, scope: !221, file: !197, line: 11, type: !20)
!230 = !DILocalVariable(name: "d", scope: !221, file: !197, line: 13, type: !12)
!231 = !DILocalVariable(name: "s", scope: !221, file: !197, line: 14, type: !232)
!232 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !233, size: 32)
!233 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !13)
!234 = !DILocalVariable(name: "i", scope: !235, file: !197, line: 16, type: !20)
!235 = distinct !DILexicalBlock(scope: !221, file: !197, line: 16, column: 5)
!236 = !DILocation(line: 0, scope: !235)
!237 = !DILocation(line: 16, column: 10, scope: !235)
!238 = !DILocation(line: 16, scope: !235)
!239 = !DILocation(line: 16, column: 28, scope: !240)
!240 = distinct !DILexicalBlock(scope: !235, file: !197, line: 16, column: 5)
!241 = !DILocation(line: 16, column: 5, scope: !235)
!242 = !DILocation(line: 17, column: 16, scope: !240)
!243 = !DILocation(line: 17, column: 9, scope: !240)
!244 = !DILocation(line: 17, column: 14, scope: !240)
!245 = !DILocation(line: 16, column: 36, scope: !240)
!246 = !DILocation(line: 16, column: 5, scope: !240)
!247 = distinct !{!247, !241, !248, !219}
!248 = !DILocation(line: 17, column: 19, scope: !235)
!249 = !DILocation(line: 18, column: 1, scope: !221)
