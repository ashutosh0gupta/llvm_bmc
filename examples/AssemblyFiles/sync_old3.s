; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64--linux-gnu"

module asm "\09.ident\09\22GCC: (Ubuntu 8.4.0-1ubuntu1~18.04) 8.4.0 LLVM: 6.0.0\22"
module asm ""
module asm "\09.ident\09\22GCC: (Ubuntu 8.4.0-1ubuntu1~18.04) 8.4.0 LLVM: 6.0.0\22"

@obclib_E = unnamed_addr global i16 0
@synchronization__err_cnt = unnamed_addr global i16 undef
@synchronization__sync_disable_flg = unnamed_addr global i16 21845
@synchronization__sync_out_wndw_err_cnt = unnamed_addr global i16 undef
@synchronization__other_ngcp_sync_err_cnt = unnamed_addr global i16 undef
@synchronization__sync_err_cnt = unnamed_addr global i16 undef
@synchronization__tm_syncflg = unnamed_addr global i16 undef
@synchronization__tm_sync_corrct_cnt = unnamed_addr global i16 undef
@synchronization__sync_time_stamp = unnamed_addr global i16 undef
@synchronization__syncflag = unnamed_addr global i16 undef
@synchronization__sync_corrct_cnt = unnamed_addr global i16 undef
@synchronization__tm_sync_time_stamp = unnamed_addr global i16 undef
@synchronization__ngcp_sync_out = unnamed_addr global i16 undef
@synchronization_E = unnamed_addr global i16 0
@synchronization__absskew = internal unnamed_addr global i16 undef
@synchronization__temp_skew = internal unnamed_addr global i16 undef
@synchronization__correct_flg = internal unnamed_addr global i16 undef
@synchronization__src_of_timestamp = internal unnamed_addr global i16 undef
@synchronization__syncflg = internal unnamed_addr global i16 undef
@synchronization__corrected_time = internal unnamed_addr global i16 undef
@synchronization__syncevntflg = internal unnamed_addr global i16 undef
@synchronization__time_stamp = internal unnamed_addr global i16 undef
@.cst = private local_unnamed_addr constant [20 x i8] c"synchronization.adb\00", align 8
@synchronization__bc_rtstat = internal unnamed_addr global i16 undef
@synchronization__rt_bcstat = internal unnamed_addr global i16 undef
@synchronization__bswrt_bcmess = internal unnamed_addr global i16 undef

; Function Attrs: uwtable
define zeroext i16 @obclib__bit_and(i16 zeroext %value1, i16 zeroext %value2) unnamed_addr #0 align 2 {
entry:
  %0 = and i16 %value1, %value2
  ret i16 %0
}

; Function Attrs: uwtable
define zeroext i16 @obclib__bit_or(i16 zeroext %value1, i16 zeroext %value2) #0 align 2 {
entry:
  %0 = or i16 %value1, %value2
  ret i16 %0
}

; Function Attrs: uwtable
define zeroext i16 @obclib__ushift_left(i16 zeroext %value, i16 zeroext %amount) unnamed_addr #0 align 2 {
entry:
  %0 = icmp ule i16 %amount, 15
  %1 = zext i16 %amount to i32
  %2 = shl i16 %value, %amount
  %3 = select i1 %0, i16 %2, i16 0
  ret i16 %3
}

; Function Attrs: uwtable
define zeroext i16 @obclib__ushift_right(i16 zeroext %value, i16 zeroext %amount) unnamed_addr #0 align 2 {
entry:
  %0 = icmp ule i16 %amount, 15
  %1 = zext i16 %amount to i32
  %2 = lshr i16 %value, %amount
  %3 = select i1 %0, i16 %2, i16 0
  ret i16 %3
}

; Function Attrs: uwtable
define signext i16 @obclib__u16tos16(i16 zeroext %value) #0 align 2 {
entry:
  %0 = icmp slt i16 %value, 0
  %1 = select i1 %0, i16 32767, i16 %value
  ret i16 %1
}

; Function Attrs: uwtable
define void @synchronization__rtime_process() local_unnamed_addr #0 align 2 {
entry:
  %0 = load i16, i16* @synchronization__absskew, align 2
  %1 = icmp sgt i16 %0, 19
  %2 = icmp sle i16 %0, 45
  %or.cond = and i1 %1, %2
  br i1 %or.cond, label %"4", label %"13"

"4":                                              ; preds = %entry
  store i16 0, i16* @synchronization__sync_out_wndw_err_cnt, align 2
  %3 = load i16, i16* @synchronization__temp_skew, align 2
  %4 = icmp sgt i16 %3, 0
  br i1 %4, label %"5", label %"6"

"5":                                              ; preds = %"4"
  store i16 170, i16* @synchronization__correct_flg, align 2
  br label %"7"

"6":                                              ; preds = %"4"
  store i16 85, i16* @synchronization__correct_flg, align 2
  br label %"7"

"7":                                              ; preds = %"6", %"5"
  %5 = load i16, i16* @synchronization__src_of_timestamp, align 2
  %6 = icmp eq i16 %5, -21846
  br i1 %6, label %"8", label %"9"

"8":                                              ; preds = %"7"
  %7 = load i16, i16* @synchronization__correct_flg, align 2
  %8 = sub i16 255, %7
  store i16 %8, i16* @synchronization__correct_flg, align 2
  br label %"9"

"9":                                              ; preds = %"8", %"7"
  %9 = load i16, i16* @synchronization__correct_flg, align 2
  %10 = icmp eq i16 %9, 85
  %11 = load i16, i16* @synchronization__syncflg, align 2
  %12 = zext i16 %11 to i32
  br i1 %10, label %"10", label %"11"

"10":                                             ; preds = %"9"
  %13 = call zeroext i16 @obclib__bit_or(i16 zeroext %11, i16 zeroext 2)
  store i16 %13, i16* @synchronization__syncflg, align 2
  store i16 5002, i16* @synchronization__corrected_time, align 2
  %14 = load i16, i16* @synchronization__sync_corrct_cnt, align 2
  %15 = add i16 %14, -1
  store i16 %15, i16* @synchronization__sync_corrct_cnt, align 2
  br label %return

"11":                                             ; preds = %"9"
  %16 = call zeroext i16 @obclib__bit_or(i16 zeroext %11, i16 zeroext 1)
  store i16 %16, i16* @synchronization__syncflg, align 2
  store i16 4996, i16* @synchronization__corrected_time, align 2
  %17 = load i16, i16* @synchronization__sync_corrct_cnt, align 2
  %18 = add i16 %17, 1
  store i16 %18, i16* @synchronization__sync_corrct_cnt, align 2
  br label %return

"13":                                             ; preds = %entry
  %19 = icmp sgt i16 %0, 45
  br i1 %19, label %"14", label %"16"

"14":                                             ; preds = %"13"
  %20 = load i16, i16* @synchronization__sync_out_wndw_err_cnt, align 2
  %21 = add i16 %20, 1
  store i16 %21, i16* @synchronization__sync_out_wndw_err_cnt, align 2
  %22 = icmp ugt i16 %21, 14
  br i1 %22, label %"15", label %"17"

"15":                                             ; preds = %"14"
  %23 = load i16, i16* @synchronization__syncflg, align 2
  %24 = zext i16 %23 to i32
  %25 = call zeroext i16 @obclib__bit_or(i16 zeroext %23, i16 zeroext 1024)
  store i16 %25, i16* @synchronization__syncflg, align 2
  store i16 -21846, i16* @synchronization__sync_disable_flg, align 2
  br label %"17"

"16":                                             ; preds = %"13"
  store i16 0, i16* @synchronization__sync_out_wndw_err_cnt, align 2
  br label %"17"

"17":                                             ; preds = %"16", %"15", %"14"
  store i16 4999, i16* @synchronization__corrected_time, align 2
  br label %return

return:                                           ; preds = %"17", %"11", %"10"
  ret void
}

; Function Attrs: uwtable
define void @synchronization__rsync() local_unnamed_addr #0 align 2 {
entry:
  store i16 21845, i16* @synchronization__ngcp_sync_out, align 2
  %0 = load i16, i16* @synchronization__syncevntflg, align 2
  %1 = icmp eq i16 %0, -21846
  br i1 %1, label %"3", label %"8"

"3":                                              ; preds = %entry
  %2 = load i16, i16* @synchronization__time_stamp, align 2
  store i16 %2, i16* @synchronization__sync_time_stamp, align 2
  %3 = load i16, i16* @synchronization__time_stamp, align 2
  %4 = sub i16 4999, %3
  store i16 %4, i16* @synchronization__time_stamp, align 2
  %5 = zext i16 %4 to i32
  %6 = call signext i16 @obclib__u16tos16(i16 zeroext %4)
  %7 = icmp slt i16 %6, -32392
  br i1 %7, label %"4", label %"5"

"4":                                              ; preds = %"3"
  call void @__gnat_rcheck_CE_Overflow_Check(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.cst, i64 0, i64 0), i32 89) #1
  unreachable

"5":                                              ; preds = %"3"
  %8 = sub nsw i16 375, %6
  store i16 %8, i16* @synchronization__temp_skew, align 2
  %9 = icmp eq i16 %8, -32768
  br i1 %9, label %"6", label %"7"

"6":                                              ; preds = %"5"
  call void @__gnat_rcheck_CE_Overflow_Check(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.cst, i64 0, i64 0), i32 90) #1
  unreachable

"7":                                              ; preds = %"5"
  %neg = sub i16 0, %8
  %abscond = icmp sge i16 %8, 0
  %abs = select i1 %abscond, i16 %8, i16 %neg
  store i16 %abs, i16* @synchronization__absskew, align 2
  br label %"8"

"8":                                              ; preds = %"7", %entry
  %10 = load i16, i16* @synchronization__syncevntflg, align 2
  %11 = icmp eq i16 %10, 21845
  %12 = load i16, i16* @synchronization__absskew, align 2
  %13 = icmp sgt i16 %12, 45
  %or.cond = or i1 %11, %13
  br i1 %or.cond, label %"10", label %"11"

"10":                                             ; preds = %"8"
  store i16 -21846, i16* @synchronization__ngcp_sync_out, align 2
  br label %"11"

"11":                                             ; preds = %"10", %"8"
  store i16 4999, i16* @synchronization__corrected_time, align 2
  %14 = load i16, i16* @synchronization__sync_disable_flg, align 2
  %15 = icmp ne i16 %14, -21846
  br i1 %15, label %"12", label %"27"

"12":                                             ; preds = %"11"
  %16 = load i16, i16* @synchronization__syncevntflg, align 2
  %17 = icmp eq i16 %16, -21846
  br i1 %17, label %"13", label %"14"

"13":                                             ; preds = %"12"
  store i16 0, i16* @synchronization__sync_err_cnt, align 2
  store i16 0, i16* @synchronization__other_ngcp_sync_err_cnt, align 2
  %18 = load i16, i16* @synchronization__syncflg, align 2
  %19 = zext i16 %18 to i32
  %20 = call zeroext i16 @obclib__bit_or(i16 zeroext %18, i16 zeroext 4)
  store i16 %20, i16* @synchronization__syncflg, align 2
  store i16 21845, i16* @synchronization__src_of_timestamp, align 2
  call void @synchronization__rtime_process() #0
  br label %"27"

"14":                                             ; preds = %"12"
  %21 = load i16, i16* @synchronization__sync_err_cnt, align 2
  %22 = add i16 %21, 1
  store i16 %22, i16* @synchronization__sync_err_cnt, align 2
  %23 = icmp ugt i16 %22, 14
  br i1 %23, label %"15", label %"16"

"15":                                             ; preds = %"14"
  %24 = load i16, i16* @synchronization__syncflg, align 2
  %25 = zext i16 %24 to i32
  %26 = call zeroext i16 @obclib__bit_or(i16 zeroext %24, i16 zeroext 512)
  store i16 %26, i16* @synchronization__syncflg, align 2
  br label %"16"

"16":                                             ; preds = %"15", %"14"
  %27 = load i16, i16* @synchronization__bc_rtstat, align 2
  %28 = icmp eq i16 %27, -24576
  %29 = load i16, i16* @synchronization__rt_bcstat, align 2
  %30 = icmp eq i16 %29, -24576
  %or.cond6 = and i1 %28, %30
  %31 = load i16, i16* @synchronization__bswrt_bcmess, align 2
  %32 = icmp eq i16 %31, 0
  %or.cond8 = and i1 %or.cond6, %32
  br i1 %or.cond8, label %"19", label %"24"

"19":                                             ; preds = %"16"
  store i16 0, i16* @synchronization__other_ngcp_sync_err_cnt, align 2
  %33 = load i16, i16* @synchronization__syncflg, align 2
  %34 = zext i16 %33 to i32
  %35 = call zeroext i16 @obclib__bit_or(i16 zeroext %33, i16 zeroext 8)
  store i16 %35, i16* @synchronization__syncflg, align 2
  store i16 -21846, i16* @synchronization__src_of_timestamp, align 2
  %36 = load i16, i16* @synchronization__time_stamp, align 2
  store i16 %36, i16* @synchronization__sync_time_stamp, align 2
  %37 = load i16, i16* @synchronization__time_stamp, align 2
  %38 = sub i16 4999, %37
  store i16 %38, i16* @synchronization__time_stamp, align 2
  %39 = zext i16 %38 to i32
  %40 = call signext i16 @obclib__u16tos16(i16 zeroext %38)
  %41 = icmp slt i16 %40, -32392
  br i1 %41, label %"20", label %"21"

"20":                                             ; preds = %"19"
  call void @__gnat_rcheck_CE_Overflow_Check(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.cst, i64 0, i64 0), i32 167) #1
  unreachable

"21":                                             ; preds = %"19"
  %42 = sub nsw i16 375, %40
  store i16 %42, i16* @synchronization__temp_skew, align 2
  %43 = icmp eq i16 %42, -32768
  br i1 %43, label %"22", label %"23"

"22":                                             ; preds = %"21"
  call void @__gnat_rcheck_CE_Overflow_Check(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.cst, i64 0, i64 0), i32 168) #1
  unreachable

"23":                                             ; preds = %"21"
  %neg1 = sub i16 0, %42
  %abscond2 = icmp sge i16 %42, 0
  %abs3 = select i1 %abscond2, i16 %42, i16 %neg1
  store i16 %abs3, i16* @synchronization__absskew, align 2
  call void @synchronization__rtime_process() #0
  br label %"27"

"24":                                             ; preds = %"16"
  %44 = load i16, i16* @synchronization__other_ngcp_sync_err_cnt, align 2
  %45 = add i16 %44, 1
  store i16 %45, i16* @synchronization__other_ngcp_sync_err_cnt, align 2
  %46 = icmp ugt i16 %45, 14
  br i1 %46, label %"25", label %"27"

"25":                                             ; preds = %"24"
  store i16 -21846, i16* @synchronization__sync_disable_flg, align 2
  %47 = load i16, i16* @synchronization__syncflg, align 2
  %48 = zext i16 %47 to i32
  %49 = call zeroext i16 @obclib__bit_or(i16 zeroext %47, i16 zeroext 256)
  store i16 %49, i16* @synchronization__syncflg, align 2
  br label %"27"

"27":                                             ; preds = %"25", %"24", %"23", %"13", %"11"
  %50 = load i16, i16* @synchronization__syncflg, align 2
  store i16 %50, i16* @synchronization__syncflag, align 2
  ret void
}

; Function Attrs: noreturn
declare void @__gnat_rcheck_CE_Overflow_Check(i8*, i32) #1

; Function Attrs: uwtable
define void @synchronization__rsyncdriver() unnamed_addr #0 align 2 {
entry:
  store i16 -21846, i16* @synchronization__syncevntflg, align 2
  store i16 4116, i16* @synchronization__syncflg, align 2
  store i16 -24576, i16* @synchronization__bc_rtstat, align 2
  store i16 -24576, i16* @synchronization__rt_bcstat, align 2
  store i16 0, i16* @synchronization__bswrt_bcmess, align 2
  call void @synchronization__rsync() #0
  ret void
}

attributes #0 = { uwtable "no-frame-pointer-elim-non-leaf"="true" }
attributes #1 = { noreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 7, !"PIE Level", i32 2}
