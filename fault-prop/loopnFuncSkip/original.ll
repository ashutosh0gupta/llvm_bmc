; ModuleID = '../test.ll'
source_filename = "test.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: inlinehint nounwind uwtable
define dso_local zeroext range(i8 0, 16) i8 @lincomb(ptr noundef %0, ptr noundef %1) local_unnamed_addr #0 {
  br label %iter_0_start

3:                                                ; preds = %iter_7_end
  %.01.lcssa = phi i8 [ %180, %iter_7_end ]
  %scevgep = getelementptr i8, ptr %1, i64 8
  %4 = icmp eq ptr %0, %scevgep
  %5 = call zeroext i1 @assert(i1 noundef zeroext %4) #2
  ret i8 %.01.lcssa

iter_0_start:                                     ; preds = %2
  br label %6

6:                                                ; preds = %iter_0_start
  %7 = getelementptr inbounds nuw i8, ptr %0, i64 0
  %8 = load i8, ptr %7, align 1
  %9 = and i8 %8, 8
  %10 = load i8, ptr %1, align 1
  %11 = mul i8 %9, %10
  %12 = and i8 %8, 4
  %13 = mul i8 %12, %10
  %14 = trunc i8 %8 to i1
  %15 = select i1 %14, i8 %10, i8 0
  %16 = and i8 %8, 2
  %17 = mul i8 %16, %10
  %18 = xor i8 %15, %17
  %19 = xor i8 %13, %18
  %20 = xor i8 %11, %19
  %21 = lshr i8 %20, 4
  %22 = lshr i8 %20, 3
  %23 = and i8 %22, 14
  %24 = xor i8 %21, %23
  %.masked.iter0 = and i8 %20, 15
  %25 = xor i8 %24, %.masked.iter0
  %26 = xor i8 %25, 0
  %27 = getelementptr inbounds nuw i8, ptr %1, i64 1
  br label %iter_0_end

iter_0_end:                                       ; preds = %6
  br label %iter_1_start

iter_1_start:                                     ; preds = %iter_0_end
  br label %28

28:                                               ; preds = %iter_1_start
  %29 = getelementptr inbounds nuw i8, ptr %0, i64 1
  %30 = load i8, ptr %29, align 1
  %31 = and i8 %30, 8
  %32 = load i8, ptr %27, align 1
  %33 = mul i8 %31, %32
  %34 = and i8 %30, 4
  %35 = mul i8 %34, %32
  %36 = trunc i8 %30 to i1
  %37 = select i1 %36, i8 %32, i8 0
  %38 = and i8 %30, 2
  %39 = mul i8 %38, %32
  %40 = xor i8 %37, %39
  %41 = xor i8 %35, %40
  %42 = xor i8 %33, %41
  %43 = lshr i8 %42, 4
  %44 = lshr i8 %42, 3
  %45 = and i8 %44, 14
  %46 = xor i8 %43, %45
  %.masked.iter1 = and i8 %42, 15
  %47 = xor i8 %46, %.masked.iter1
  %48 = xor i8 %47, %26
  %49 = getelementptr inbounds nuw i8, ptr %27, i64 1
  br label %iter_1_end

iter_1_end:                                       ; preds = %28
  br label %iter_2_start

iter_2_start:                                     ; preds = %iter_1_end
  br label %50

50:                                               ; preds = %iter_2_start
  %51 = getelementptr inbounds nuw i8, ptr %0, i64 2
  %52 = load i8, ptr %51, align 1
  %53 = and i8 %52, 8
  %54 = load i8, ptr %49, align 1
  %55 = mul i8 %53, %54
  %56 = and i8 %52, 4
  %57 = mul i8 %56, %54
  %58 = trunc i8 %52 to i1
  %59 = select i1 %58, i8 %54, i8 0
  %60 = and i8 %52, 2
  %61 = mul i8 %60, %54
  %62 = xor i8 %59, %61
  %63 = xor i8 %57, %62
  %64 = xor i8 %55, %63
  %65 = lshr i8 %64, 4
  %66 = lshr i8 %64, 3
  %67 = and i8 %66, 14
  %68 = xor i8 %65, %67
  %.masked.iter2 = and i8 %64, 15
  %69 = xor i8 %68, %.masked.iter2
  %70 = xor i8 %69, %48
  %71 = getelementptr inbounds nuw i8, ptr %49, i64 1
  br label %iter_2_end

iter_2_end:                                       ; preds = %50
  br label %iter_3_start

iter_3_start:                                     ; preds = %iter_2_end
  br label %72

72:                                               ; preds = %iter_3_start
  %73 = getelementptr inbounds nuw i8, ptr %0, i64 3
  %74 = load i8, ptr %73, align 1
  %75 = and i8 %74, 8
  %76 = load i8, ptr %71, align 1
  %77 = mul i8 %75, %76
  %78 = and i8 %74, 4
  %79 = mul i8 %78, %76
  %80 = trunc i8 %74 to i1
  %81 = select i1 %80, i8 %76, i8 0
  %82 = and i8 %74, 2
  %83 = mul i8 %82, %76
  %84 = xor i8 %81, %83
  %85 = xor i8 %79, %84
  %86 = xor i8 %77, %85
  %87 = lshr i8 %86, 4
  %88 = lshr i8 %86, 3
  %89 = and i8 %88, 14
  %90 = xor i8 %87, %89
  %.masked.iter3 = and i8 %86, 15
  %91 = xor i8 %90, %.masked.iter3
  %92 = xor i8 %91, %70
  %93 = getelementptr inbounds nuw i8, ptr %71, i64 1
  br label %iter_3_end

iter_3_end:                                       ; preds = %72
  br label %iter_4_start

iter_4_start:                                     ; preds = %iter_3_end
  br label %94

94:                                               ; preds = %iter_4_start
  %95 = getelementptr inbounds nuw i8, ptr %0, i64 4
  %96 = load i8, ptr %95, align 1
  %97 = and i8 %96, 8
  %98 = load i8, ptr %93, align 1
  %99 = mul i8 %97, %98
  %100 = and i8 %96, 4
  %101 = mul i8 %100, %98
  %102 = trunc i8 %96 to i1
  %103 = select i1 %102, i8 %98, i8 0
  %104 = and i8 %96, 2
  %105 = mul i8 %104, %98
  %106 = xor i8 %103, %105
  %107 = xor i8 %101, %106
  %108 = xor i8 %99, %107
  %109 = lshr i8 %108, 4
  %110 = lshr i8 %108, 3
  %111 = and i8 %110, 14
  %112 = xor i8 %109, %111
  %.masked.iter4 = and i8 %108, 15
  %113 = xor i8 %112, %.masked.iter4
  %114 = xor i8 %113, %92
  %115 = getelementptr inbounds nuw i8, ptr %93, i64 1
  br label %iter_4_end

iter_4_end:                                       ; preds = %94
  br label %iter_5_start

iter_5_start:                                     ; preds = %iter_4_end
  br label %116

116:                                              ; preds = %iter_5_start
  %117 = getelementptr inbounds nuw i8, ptr %0, i64 5
  %118 = load i8, ptr %117, align 1
  %119 = and i8 %118, 8
  %120 = load i8, ptr %115, align 1
  %121 = mul i8 %119, %120
  %122 = and i8 %118, 4
  %123 = mul i8 %122, %120
  %124 = trunc i8 %118 to i1
  %125 = select i1 %124, i8 %120, i8 0
  %126 = and i8 %118, 2
  %127 = mul i8 %126, %120
  %128 = xor i8 %125, %127
  %129 = xor i8 %123, %128
  %130 = xor i8 %121, %129
  %131 = lshr i8 %130, 4
  %132 = lshr i8 %130, 3
  %133 = and i8 %132, 14
  %134 = xor i8 %131, %133
  %.masked.iter5 = and i8 %130, 15
  %135 = xor i8 %134, %.masked.iter5
  %136 = xor i8 %135, %114
  %137 = getelementptr inbounds nuw i8, ptr %115, i64 1
  br label %iter_5_end

iter_5_end:                                       ; preds = %116
  br label %iter_6_start

iter_6_start:                                     ; preds = %iter_5_end
  br label %138

138:                                              ; preds = %iter_6_start
  %139 = getelementptr inbounds nuw i8, ptr %0, i64 6
  %140 = load i8, ptr %139, align 1
  %141 = and i8 %140, 8
  %142 = load i8, ptr %137, align 1
  %143 = mul i8 %141, %142
  %144 = and i8 %140, 4
  %145 = mul i8 %144, %142
  %146 = trunc i8 %140 to i1
  %147 = select i1 %146, i8 %142, i8 0
  %148 = and i8 %140, 2
  %149 = mul i8 %148, %142
  %150 = xor i8 %147, %149
  %151 = xor i8 %145, %150
  %152 = xor i8 %143, %151
  %153 = lshr i8 %152, 4
  %154 = lshr i8 %152, 3
  %155 = and i8 %154, 14
  %156 = xor i8 %153, %155
  %.masked.iter6 = and i8 %152, 15
  %157 = xor i8 %156, %.masked.iter6
  %158 = xor i8 %157, %136
  %159 = getelementptr inbounds nuw i8, ptr %137, i64 1
  br label %iter_6_end

iter_6_end:                                       ; preds = %138
  br label %iter_7_start

iter_7_start:                                     ; preds = %iter_6_end
  br label %160

160:                                              ; preds = %iter_7_start
  %161 = getelementptr inbounds nuw i8, ptr %0, i64 7
  %162 = load i8, ptr %161, align 1
  %163 = and i8 %162, 8
  %164 = load i8, ptr %159, align 1
  %165 = mul i8 %163, %164
  %166 = and i8 %162, 4
  %167 = mul i8 %166, %164
  %168 = trunc i8 %162 to i1
  %169 = select i1 %168, i8 %164, i8 0
  %170 = and i8 %162, 2
  %171 = mul i8 %170, %164
  %172 = xor i8 %169, %171
  %173 = xor i8 %167, %172
  %174 = xor i8 %165, %173
  %175 = lshr i8 %174, 4
  %176 = lshr i8 %174, 3
  %177 = and i8 %176, 14
  %178 = xor i8 %175, %177
  %.masked.iter7 = and i8 %174, 15
  %179 = xor i8 %178, %.masked.iter7
  %180 = xor i8 %179, %158
  %181 = getelementptr inbounds nuw i8, ptr %159, i64 1
  br label %iter_7_end

iter_7_end:                                       ; preds = %160
  br label %3
}

declare zeroext i1 @assert(i1 noundef zeroext) local_unnamed_addr #1

attributes #0 = { inlinehint nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)"}
