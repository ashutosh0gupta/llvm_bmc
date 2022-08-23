; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64--linux-gnu"

module asm "\09.ident\09\22GCC: (Ubuntu 8.4.0-1ubuntu1~18.04) 8.4.0 LLVM: 6.0.0\22"
module asm ""
module asm "\09.ident\09\22GCC: (Ubuntu 8.4.0-1ubuntu1~18.04) 8.4.0 LLVM: 6.0.0\22"

@obclib_E = unnamed_addr global i16 0
@.cst = private local_unnamed_addr constant [11 x i8] c"obclib.adb\00", align 8
@prgpddualproc__firstcycle = unnamed_addr global i16 1
@prgpddualproc__rgpdsts_cochar_mjrtm = unnamed_addr global i16 undef
@prgpddualproc__rgpd_fdi_sts_mjr_tm = unnamed_addr global i16 undef
@prgpddualproc__maxresrgpd_tm = unnamed_addr global [5 x float] undef, align 16
@prgpddualproc__comp_rgpd2_ypr_tm = unnamed_addr global [5 x float] undef, align 16
@prgpddualproc__comp_rgpd1_ypr_tm = unnamed_addr global [5 x float] undef, align 16
@prgpddualproc__rgpd_fdists_tm = unnamed_addr global i16 undef
@prgpddualproc__rgpd_rate_ypr_tm = unnamed_addr global [5 x float] undef, align 16
@prgpddualproc__bothrgpd_nok3 = unnamed_addr global i16 undef
@prgpddualproc__bothrgpd_nok2 = unnamed_addr global i16 undef
@prgpddualproc__bothrgpd_nok1 = unnamed_addr global i16 undef
@prgpddualproc__rgpdsts_cochar = unnamed_addr global i16 undef
@prgpddualproc__rgpd_fail_flag = unnamed_addr global i16 undef
@prgpddualproc__rgpd_rate_ypr = unnamed_addr global [5 x float] undef, align 16
@prgpddualproc__raw_rgpd2_ypr3 = unnamed_addr global i16 undef
@prgpddualproc__raw_rgpd2_ypr2 = unnamed_addr global i16 undef
@prgpddualproc__raw_rgpd2_ypr1 = unnamed_addr global i16 undef
@prgpddualproc__raw_rgpd1_ypr3 = unnamed_addr global i16 undef
@prgpddualproc__raw_rgpd1_ypr2 = unnamed_addr global i16 undef
@prgpddualproc__raw_rgpd1_ypr1 = unnamed_addr global i16 undef
@prgpddualproc__resins_ypr = unnamed_addr global [5 x float] undef, align 16
@prgpddualproc__microsyn_rgpd2 = unnamed_addr global i16 undef
@prgpddualproc__microsyn_rgpd1 = unnamed_addr global i16 undef
@prgpddualproc__minorid = unnamed_addr global i16 undef
@prgpddualproc__rgpdmsgsts2 = unnamed_addr global i16 undef
@prgpddualproc__rgpdmsgsts1 = unnamed_addr global i16 undef
@prgpddualproc_E = unnamed_addr global i16 0
@prgpddualproc__selctionsrc_ypr1 = internal unnamed_addr global i16 undef
@prgpddualproc__flg2retnprevdata_ypr1 = internal unnamed_addr global i16 undef
@prgpddualproc__selchid_ypr1 = internal unnamed_addr global i16 1
@prgpddualproc__selctionsrc_ypr2 = internal unnamed_addr global i16 undef
@prgpddualproc__flg2retnprevdata_ypr2 = internal unnamed_addr global i16 undef
@prgpddualproc__selchid_ypr2 = internal unnamed_addr global i16 1
@prgpddualproc__selctionsrc_ypr3 = internal unnamed_addr global i16 undef
@prgpddualproc__flg2retnprevdata_ypr3 = internal unnamed_addr global i16 undef
@prgpddualproc__selchid_ypr3 = internal unnamed_addr global i16 1
@prgpddualproc__comp_rgpd1_ypr = internal unnamed_addr global [5 x float] undef, align 16
@prgpddualproc__comp_rgpd2_ypr = internal unnamed_addr global [5 x float] undef, align 16
@prgpddualproc__isolnsts_hardtm1 = internal unnamed_addr global i16 undef
@prgpddualproc__isolnsts_hardtm2 = internal unnamed_addr global i16 undef
@prgpddualproc__isolnsts_hardtm3 = internal unnamed_addr global i16 undef
@prgpddualproc__indhardthreshviol1 = internal unnamed_addr global i16 undef
@prgpddualproc__indhardthreshviol2 = internal unnamed_addr global i16 undef
@prgpddualproc__indhardthreshviol3 = internal unnamed_addr global i16 undef
@prgpddualproc__prmfailparitytm1 = internal unnamed_addr global i16 undef
@prgpddualproc__prmfailparitytm2 = internal unnamed_addr global i16 undef
@prgpddualproc__prmfailparitytm3 = internal unnamed_addr global i16 undef
@prgpddualproc__flag2indcurrhlthfail1 = internal unnamed_addr global i16 undef
@prgpddualproc__flag2indcurrhlthfail2 = internal unnamed_addr global i16 undef
@prgpddualproc__rgpdhlth_prmfail1 = internal unnamed_addr global i16 21845
@prgpddualproc__rgpdhlth_prmfail2 = internal unnamed_addr global i16 21845
@prgpddualproc__rgpdsts_cochar_mjr = internal unnamed_addr global i16 undef
@prgpddualproc__prmfailflg_parity1 = internal unnamed_addr global i16 0
@prgpddualproc__rgpd_fdi_sts_mjr = internal unnamed_addr global i16 undef
@prgpddualproc__prmfailflg_parity2 = internal unnamed_addr global i16 0
@prgpddualproc__prmfailflg_parity3 = internal unnamed_addr global i16 0
@prgpddualproc__isolnsts_movavgtm1 = internal unnamed_addr global i16 undef
@prgpddualproc__isolnsts_movavgtm2 = internal unnamed_addr global i16 undef
@prgpddualproc__isolnsts_movavgtm3 = internal unnamed_addr global i16 undef
@prgpddualproc__maxresrgpdmjrfdi = internal unnamed_addr global [5 x float] undef, align 16
@prgpddualproc__flg2indhardschedule1 = internal unnamed_addr global i16 undef
@prgpddualproc__errcnt2setrgpdnok1 = internal unnamed_addr global i16 undef
@prgpddualproc__errcnt2setrgpdflflg1 = internal unnamed_addr global i16 undef
@prgpddualproc__consfailsts_rgpd1 = internal unnamed_addr global i16 undef
@prgpddualproc__consfailsts_rgpd2 = internal unnamed_addr global i16 undef
@prgpddualproc__flg2indhardschedule2 = internal unnamed_addr global i16 undef
@prgpddualproc__errcnt2setrgpdnok2 = internal unnamed_addr global i16 undef
@prgpddualproc__errcnt2setrgpdflflg2 = internal unnamed_addr global i16 undef
@prgpddualproc__flg2indhardschedule3 = internal unnamed_addr global i16 undef
@prgpddualproc__errcnt2setrgpdnok3 = internal unnamed_addr global i16 undef
@prgpddualproc__errcnt2setrgpdflflg3 = internal unnamed_addr global i16 undef
@prgpddualproc__hardres = internal unnamed_addr global [5 x float] undef, align 16
@prgpddualproc__hardrgpd1_res = internal unnamed_addr global [5 x float] undef, align 16
@prgpddualproc__hardrgpd2_res = internal unnamed_addr global [5 x float] undef, align 16
@prgpddualproc__errcnthardthresviol1 = internal unnamed_addr global i16 undef
@prgpddualproc__rgpd1harderrcntr1 = internal unnamed_addr global i16 undef
@prgpddualproc__rgpd2harderrcntr1 = internal unnamed_addr global i16 undef
@prgpddualproc__errcnthardthresviol2 = internal unnamed_addr global i16 undef
@prgpddualproc__rgpd1harderrcntr2 = internal unnamed_addr global i16 undef
@prgpddualproc__rgpd2harderrcntr2 = internal unnamed_addr global i16 undef
@prgpddualproc__errcnthardthresviol3 = internal unnamed_addr global i16 undef
@prgpddualproc__rgpd1harderrcntr3 = internal unnamed_addr global i16 undef
@prgpddualproc__rgpd2harderrcntr3 = internal unnamed_addr global i16 undef
@prgpddualproc__storgeindex1 = internal unnamed_addr global i16 undef
@prgpddualproc__blocksizeu16 = internal unnamed_addr global i16 50
@prgpddualproc__storgeindexres1 = internal unnamed_addr global i16 undef
@prgpddualproc__blocksizeu16res = internal unnamed_addr global i16 100
@.cst.1 = private local_unnamed_addr constant [18 x i8] c"prgpddualproc.adb\00", align 8
@prgpddualproc__r0acc = internal unnamed_addr global [5 x float] undef, align 16
@prgpddualproc__storrgpd12 = internal unnamed_addr global [5 x [100 x float]] undef, align 32
@prgpddualproc__rgpd1_resacc = internal unnamed_addr global [5 x float] undef, align 16
@prgpddualproc__storrgpd1res = internal unnamed_addr global [5 x [100 x float]] undef, align 32
@prgpddualproc__rgpd2_resacc = internal unnamed_addr global [5 x float] undef, align 16
@prgpddualproc__storrgpd2res = internal unnamed_addr global [5 x [100 x float]] undef, align 32
@prgpddualproc__rgpd1movavgerrcntr1 = internal unnamed_addr global i16 undef
@prgpddualproc__rgpd2movavgerrcntr1 = internal unnamed_addr global i16 undef
@prgpddualproc__storgeindex2 = internal unnamed_addr global i16 undef
@prgpddualproc__storgeindexres2 = internal unnamed_addr global i16 undef
@prgpddualproc__rgpd1movavgerrcntr2 = internal unnamed_addr global i16 undef
@prgpddualproc__rgpd2movavgerrcntr2 = internal unnamed_addr global i16 undef
@prgpddualproc__storgeindex3 = internal unnamed_addr global i16 undef
@prgpddualproc__storgeindexres3 = internal unnamed_addr global i16 undef
@prgpddualproc__rgpd1movavgerrcntr3 = internal unnamed_addr global i16 undef
@prgpddualproc__rgpd2movavgerrcntr3 = internal unnamed_addr global i16 undef
@prgpddualproc__conserrcntr_rgpdcomm1 = internal unnamed_addr global i16 undef
@prgpddualproc__errcntr_rgpdhlth1 = internal unnamed_addr global i16 undef
@prgpddualproc__conserrcntr_rgpdcomm2 = internal unnamed_addr global i16 undef
@prgpddualproc__errcntr_rgpdhlth2 = internal unnamed_addr global i16 undef

; Function Attrs: uwtable
define zeroext i16 @obclib__bit_and(i16 zeroext %value1, i16 zeroext %value2) #0 align 2 {
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
define zeroext i16 @obclib__bit_xor(i16 zeroext %value1, i16 zeroext %value2) unnamed_addr #0 align 2 {
entry:
  %0 = xor i16 %value1, %value2
  ret i16 %0
}

; Function Attrs: uwtable
define i32 @obclib__lbit_xor(i32 %value1, i32 %value2) unnamed_addr #0 align 2 {
entry:
  %0 = xor i32 %value1, %value2
  ret i32 %0
}

; Function Attrs: uwtable
define zeroext i16 @obclib__bit_not(i16 zeroext %value) unnamed_addr #0 align 2 {
entry:
  %not = xor i16 %value, -1
  ret i16 %not
}

; Function Attrs: uwtable
define zeroext i16 @obclib__ushift_left(i16 zeroext %value, i16 zeroext %amount) #0 align 2 {
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
define signext i16 @obclib__f32tos16(float %value) unnamed_addr #0 align 2 {
entry:
  %0 = fcmp ogt float %value, 3.276700e+04
  br i1 %0, label %"14", label %"4"

"4":                                              ; preds = %entry
  %1 = fcmp olt float %value, -3.276800e+04
  br i1 %1, label %"14", label %"6"

"6":                                              ; preds = %"4"
  %2 = fcmp ule float %value, -3.276850e+04
  %3 = fcmp uge float %value, 3.276750e+04
  %or.cond = or i1 %2, %3
  br i1 %or.cond, label %"8", label %"9"

"8":                                              ; preds = %"6"
  call void @__gnat_rcheck_CE_Overflow_Check(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.cst, i64 0, i64 0), i32 155) #1
  unreachable

"9":                                              ; preds = %"6"
  %4 = fcmp oge float %value, 0.000000e+00
  %5 = fsub float %value, 0x3FDFFFFFE0000000
  %6 = fptosi float %5 to i16
  %7 = fadd float %value, 0x3FDFFFFFE0000000
  %8 = fptosi float %7 to i16
  %9 = select i1 %4, i16 %8, i16 %6
  br label %"14"

"14":                                             ; preds = %"9", %"4", %entry
  %10 = phi i16 [ 32767, %entry ], [ -32768, %"4" ], [ %9, %"9" ]
  ret i16 %10
}

; Function Attrs: noreturn
declare void @__gnat_rcheck_CE_Overflow_Check(i8*, i32) #1

; Function Attrs: uwtable
define zeroext i16 @obclib__f32tou16(float %value) unnamed_addr #0 align 2 {
entry:
  %0 = fcmp ogt float %value, 6.553500e+04
  br i1 %0, label %"14", label %"4"

"4":                                              ; preds = %entry
  %1 = fcmp olt float %value, 0.000000e+00
  br i1 %1, label %"14", label %"6"

"6":                                              ; preds = %"4"
  %2 = fcmp ule float %value, -5.000000e-01
  %3 = fcmp uge float %value, 6.553550e+04
  %or.cond = or i1 %2, %3
  br i1 %or.cond, label %"8", label %"9"

"8":                                              ; preds = %"6"
  call void @__gnat_rcheck_CE_Overflow_Check(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.cst, i64 0, i64 0), i32 171) #1
  unreachable

"9":                                              ; preds = %"6"
  %4 = fcmp oge float %value, 0.000000e+00
  %5 = fsub float %value, 0x3FDFFFFFE0000000
  %6 = fptoui float %5 to i16
  %7 = fadd float %value, 0x3FDFFFFFE0000000
  %8 = fptoui float %7 to i16
  %9 = select i1 %4, i16 %8, i16 %6
  br label %"14"

"14":                                             ; preds = %"9", %"4", %entry
  %10 = phi i16 [ -1, %entry ], [ 0, %"4" ], [ %9, %"9" ]
  ret i16 %10
}

; Function Attrs: uwtable
define signext i16 @obclib__u16tos16(i16 zeroext %value) unnamed_addr #0 align 2 {
entry:
  %0 = icmp slt i16 %value, 0
  %1 = select i1 %0, i16 32767, i16 %value
  ret i16 %1
}

; Function Attrs: inlinehint uwtable
define void @prgpddualproc__Tfloat32_array_1_3BIP(i64 %_init.0, i64 %_init.1) unnamed_addr #2 align 2 {
entry:
  ret void
}

; Function Attrs: inlinehint uwtable
define void @prgpddualproc__Tshortint_array_1_2BIP(i64 %_init.0, i64 %_init.1) unnamed_addr #2 align 2 {
entry:
  ret void
}

; Function Attrs: inlinehint uwtable
define void @prgpddualproc__Tshortint_array_1_3BIP(i64 %_init.0, i64 %_init.1) unnamed_addr #2 align 2 {
entry:
  ret void
}

; Function Attrs: inlinehint uwtable
define void @prgpddualproc__Tunsigned16_array_1_2BIP(i64 %_init.0, i64 %_init.1) unnamed_addr #2 align 2 {
entry:
  ret void
}

; Function Attrs: inlinehint uwtable
define void @prgpddualproc__Tunsigned16_array_1_3BIP(i64 %_init.0, i64 %_init.1) unnamed_addr #2 align 2 {
entry:
  ret void
}

; Function Attrs: inlinehint uwtable
define void @prgpddualproc__Tfloat32_array_3_100BIP(i64 %_init.0, i64 %_init.1) unnamed_addr #2 align 2 {
entry:
  ret void
}

; Function Attrs: uwtable
define void @prgpddualproc__rrgpd_driver() unnamed_addr #0 align 2 {
entry:
  store i16 21845, i16* @prgpddualproc__rgpdmsgsts1, align 2
  store i16 21845, i16* @prgpddualproc__rgpdmsgsts2, align 2
  store i16 1, i16* @prgpddualproc__minorid, align 2
  %0 = load i16, i16* @prgpddualproc__firstcycle, align 2
  %1 = icmp eq i16 %0, 1
  br i1 %1, label %"3", label %"4"

"3":                                              ; preds = %entry
  call void @prgpddualproc__rinitrgpd() #0
  br label %"5"

"4":                                              ; preds = %entry
  store i16 0, i16* @prgpddualproc__firstcycle, align 2
  br label %"5"

"5":                                              ; preds = %"4", %"3"
  call void @prgpddualproc__rrgpd_data_proc() #0
  ret void
}

; Function Attrs: uwtable
define internal void @prgpddualproc__rinitrgpd() local_unnamed_addr #0 align 2 {
entry:
  br label %"3"

"3":                                              ; preds = %"7", %entry
  %0 = phi i16 [ %18, %"7" ], [ 1, %entry ]
  %1 = icmp ule i16 %0, 3
  br i1 %1, label %"4", label %"8"

"4":                                              ; preds = %"3"
  br label %"5"

"5":                                              ; preds = %"6", %"4"
  %2 = phi i16 [ %17, %"6" ], [ 1, %"4" ]
  %3 = icmp ule i16 %2, 100
  br i1 %3, label %"6", label %"7"

"6":                                              ; preds = %"5"
  %4 = zext i16 %0 to i64
  %5 = zext i16 %2 to i64
  %6 = sub i64 %5, 1
  %7 = sub i64 %4, 1
  %8 = getelementptr inbounds [100 x float], [100 x float]* getelementptr inbounds ([5 x [100 x float]], [5 x [100 x float]]* @prgpddualproc__storrgpd12, i64 0, i64 0), i64 %7
  %9 = bitcast [100 x float]* %8 to float*
  %10 = getelementptr inbounds float, float* %9, i64 %6
  store float 0.000000e+00, float* %10, align 4
  %11 = getelementptr inbounds [100 x float], [100 x float]* getelementptr inbounds ([5 x [100 x float]], [5 x [100 x float]]* @prgpddualproc__storrgpd1res, i64 0, i64 0), i64 %7
  %12 = bitcast [100 x float]* %11 to float*
  %13 = getelementptr inbounds float, float* %12, i64 %6
  store float 0.000000e+00, float* %13, align 4
  %14 = getelementptr inbounds [100 x float], [100 x float]* getelementptr inbounds ([5 x [100 x float]], [5 x [100 x float]]* @prgpddualproc__storrgpd2res, i64 0, i64 0), i64 %7
  %15 = bitcast [100 x float]* %14 to float*
  %16 = getelementptr inbounds float, float* %15, i64 %6
  store float 0.000000e+00, float* %16, align 4
  %17 = add i16 %2, 1
  br label %"5"

"7":                                              ; preds = %"5"
  %18 = add i16 %0, 1
  br label %"3"

"8":                                              ; preds = %"3"
  store i16 21845, i16* @prgpddualproc__rgpd_fail_flag, align 2
  store i16 0, i16* @prgpddualproc__rgpdsts_cochar, align 2
  store i16 0, i16* @prgpddualproc__rgpd_fdists_tm, align 2
  store i16 0, i16* @prgpddualproc__rgpd_fdi_sts_mjr_tm, align 2
  store i16 0, i16* @prgpddualproc__rgpdsts_cochar_mjrtm, align 2
  store i16 0, i16* @prgpddualproc__rgpd_fdi_sts_mjr, align 2
  store i16 0, i16* @prgpddualproc__rgpdsts_cochar_mjr, align 2
  br label %"9"

"9":                                              ; preds = %"10", %"8"
  %19 = phi i16 [ %32, %"10" ], [ 1, %"8" ]
  %20 = icmp ule i16 %19, 3
  br i1 %20, label %"10", label %"11"

"10":                                             ; preds = %"9"
  %21 = zext i16 %19 to i64
  %22 = sub i64 %21, 1
  %23 = getelementptr inbounds float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__rgpd_rate_ypr, i64 0, i64 0), i64 %22
  store float 0.000000e+00, float* %23, align 4
  %24 = getelementptr inbounds float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__rgpd_rate_ypr_tm, i64 0, i64 0), i64 %22
  store float 0.000000e+00, float* %24, align 4
  %25 = getelementptr inbounds float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__maxresrgpd_tm, i64 0, i64 0), i64 %22
  store float 0.000000e+00, float* %25, align 4
  %26 = getelementptr inbounds float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__comp_rgpd1_ypr_tm, i64 0, i64 0), i64 %22
  store float 0.000000e+00, float* %26, align 4
  %27 = getelementptr inbounds float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__comp_rgpd2_ypr_tm, i64 0, i64 0), i64 %22
  store float 0.000000e+00, float* %27, align 4
  %28 = getelementptr inbounds float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__r0acc, i64 0, i64 0), i64 %22
  store float 0.000000e+00, float* %28, align 4
  %29 = getelementptr inbounds float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__rgpd1_resacc, i64 0, i64 0), i64 %22
  store float 0.000000e+00, float* %29, align 4
  %30 = getelementptr inbounds float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__rgpd2_resacc, i64 0, i64 0), i64 %22
  store float 0.000000e+00, float* %30, align 4
  %31 = getelementptr inbounds float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__maxresrgpdmjrfdi, i64 0, i64 0), i64 %22
  store float 0.000000e+00, float* %31, align 4
  %32 = add i16 %19, 1
  br label %"9"

"11":                                             ; preds = %"9"
  store i16 21845, i16* @prgpddualproc__bothrgpd_nok1, align 2
  store i16 21845, i16* @prgpddualproc__bothrgpd_nok2, align 2
  store i16 21845, i16* @prgpddualproc__bothrgpd_nok3, align 2
  store i16 0, i16* @prgpddualproc__storgeindex1, align 2
  store i16 0, i16* @prgpddualproc__storgeindex2, align 2
  store i16 0, i16* @prgpddualproc__storgeindex3, align 2
  store i16 0, i16* @prgpddualproc__storgeindexres1, align 2
  store i16 0, i16* @prgpddualproc__storgeindexres2, align 2
  store i16 0, i16* @prgpddualproc__storgeindexres3, align 2
  store i16 0, i16* @prgpddualproc__rgpd1harderrcntr1, align 2
  store i16 0, i16* @prgpddualproc__rgpd1harderrcntr2, align 2
  store i16 0, i16* @prgpddualproc__rgpd1harderrcntr3, align 2
  store i16 0, i16* @prgpddualproc__rgpd2harderrcntr1, align 2
  store i16 0, i16* @prgpddualproc__rgpd2harderrcntr2, align 2
  store i16 0, i16* @prgpddualproc__rgpd2harderrcntr3, align 2
  store i16 0, i16* @prgpddualproc__rgpd1movavgerrcntr1, align 2
  store i16 0, i16* @prgpddualproc__rgpd1movavgerrcntr2, align 2
  store i16 0, i16* @prgpddualproc__rgpd1movavgerrcntr3, align 2
  store i16 0, i16* @prgpddualproc__rgpd2movavgerrcntr1, align 2
  store i16 0, i16* @prgpddualproc__rgpd2movavgerrcntr2, align 2
  store i16 0, i16* @prgpddualproc__rgpd2movavgerrcntr3, align 2
  store i16 0, i16* @prgpddualproc__errcnthardthresviol1, align 2
  store i16 0, i16* @prgpddualproc__errcnthardthresviol2, align 2
  store i16 0, i16* @prgpddualproc__errcnthardthresviol3, align 2
  store i16 0, i16* @prgpddualproc__errcnt2setrgpdnok1, align 2
  store i16 0, i16* @prgpddualproc__errcnt2setrgpdnok2, align 2
  store i16 0, i16* @prgpddualproc__errcnt2setrgpdnok3, align 2
  store i16 0, i16* @prgpddualproc__errcnt2setrgpdflflg1, align 2
  store i16 0, i16* @prgpddualproc__errcnt2setrgpdflflg2, align 2
  store i16 0, i16* @prgpddualproc__errcnt2setrgpdflflg3, align 2
  %33 = load i16, i16* @prgpddualproc__selchid_ypr1, align 2
  %34 = icmp ne i16 %33, 1
  %35 = icmp ne i16 %33, 2
  %or.cond = and i1 %34, %35
  br i1 %or.cond, label %"13", label %"14"

"13":                                             ; preds = %"11"
  store i16 1, i16* @prgpddualproc__selchid_ypr1, align 2
  br label %"14"

"14":                                             ; preds = %"13", %"11"
  %36 = load i16, i16* @prgpddualproc__selchid_ypr2, align 2
  %37 = icmp ne i16 %36, 1
  %38 = icmp ne i16 %36, 2
  %or.cond4 = and i1 %37, %38
  br i1 %or.cond4, label %"16", label %"17"

"16":                                             ; preds = %"14"
  store i16 1, i16* @prgpddualproc__selchid_ypr2, align 2
  br label %"17"

"17":                                             ; preds = %"16", %"14"
  %39 = load i16, i16* @prgpddualproc__selchid_ypr3, align 2
  %40 = icmp ne i16 %39, 1
  %41 = icmp ne i16 %39, 2
  %or.cond6 = and i1 %40, %41
  br i1 %or.cond6, label %"19", label %"20"

"19":                                             ; preds = %"17"
  store i16 1, i16* @prgpddualproc__selchid_ypr3, align 2
  br label %"20"

"20":                                             ; preds = %"19", %"17"
  %42 = load i16, i16* @prgpddualproc__prmfailflg_parity1, align 2
  %43 = zext i16 %42 to i32
  %44 = call zeroext i16 @obclib__bit_and(i16 zeroext %42, i16 zeroext 1)
  %45 = icmp ne i16 %44, 0
  br i1 %45, label %"21", label %"22"

"21":                                             ; preds = %"20"
  store i16 1, i16* @prgpddualproc__prmfailparitytm1, align 2
  br label %"23"

"22":                                             ; preds = %"20"
  store i16 0, i16* @prgpddualproc__prmfailparitytm1, align 2
  br label %"23"

"23":                                             ; preds = %"22", %"21"
  %46 = load i16, i16* @prgpddualproc__prmfailflg_parity1, align 2
  %47 = zext i16 %46 to i32
  %48 = call zeroext i16 @obclib__bit_and(i16 zeroext %46, i16 zeroext 2)
  %49 = icmp ne i16 %48, 0
  br i1 %49, label %"24", label %"25"

"24":                                             ; preds = %"23"
  %50 = load i16, i16* @prgpddualproc__prmfailparitytm1, align 2
  %51 = zext i16 %50 to i32
  %52 = call zeroext i16 @obclib__bit_or(i16 zeroext %50, i16 zeroext 16)
  store i16 %52, i16* @prgpddualproc__prmfailparitytm1, align 2
  br label %"25"

"25":                                             ; preds = %"24", %"23"
  %53 = load i16, i16* @prgpddualproc__prmfailflg_parity2, align 2
  %54 = zext i16 %53 to i32
  %55 = call zeroext i16 @obclib__bit_and(i16 zeroext %53, i16 zeroext 1)
  %56 = icmp ne i16 %55, 0
  br i1 %56, label %"26", label %"27"

"26":                                             ; preds = %"25"
  store i16 1, i16* @prgpddualproc__prmfailparitytm2, align 2
  br label %"28"

"27":                                             ; preds = %"25"
  store i16 0, i16* @prgpddualproc__prmfailparitytm2, align 2
  br label %"28"

"28":                                             ; preds = %"27", %"26"
  %57 = load i16, i16* @prgpddualproc__prmfailflg_parity2, align 2
  %58 = zext i16 %57 to i32
  %59 = call zeroext i16 @obclib__bit_and(i16 zeroext %57, i16 zeroext 2)
  %60 = icmp ne i16 %59, 0
  br i1 %60, label %"29", label %"30"

"29":                                             ; preds = %"28"
  %61 = load i16, i16* @prgpddualproc__prmfailparitytm2, align 2
  %62 = zext i16 %61 to i32
  %63 = call zeroext i16 @obclib__bit_or(i16 zeroext %61, i16 zeroext 16)
  store i16 %63, i16* @prgpddualproc__prmfailparitytm2, align 2
  br label %"30"

"30":                                             ; preds = %"29", %"28"
  %64 = load i16, i16* @prgpddualproc__prmfailflg_parity3, align 2
  %65 = zext i16 %64 to i32
  %66 = call zeroext i16 @obclib__bit_and(i16 zeroext %64, i16 zeroext 1)
  %67 = icmp ne i16 %66, 0
  br i1 %67, label %"31", label %"32"

"31":                                             ; preds = %"30"
  store i16 1, i16* @prgpddualproc__prmfailparitytm3, align 2
  br label %"33"

"32":                                             ; preds = %"30"
  store i16 0, i16* @prgpddualproc__prmfailparitytm3, align 2
  br label %"33"

"33":                                             ; preds = %"32", %"31"
  %68 = load i16, i16* @prgpddualproc__prmfailflg_parity3, align 2
  %69 = zext i16 %68 to i32
  %70 = call zeroext i16 @obclib__bit_and(i16 zeroext %68, i16 zeroext 2)
  %71 = icmp ne i16 %70, 0
  br i1 %71, label %"34", label %"35"

"34":                                             ; preds = %"33"
  %72 = load i16, i16* @prgpddualproc__prmfailparitytm3, align 2
  %73 = zext i16 %72 to i32
  %74 = call zeroext i16 @obclib__bit_or(i16 zeroext %72, i16 zeroext 16)
  store i16 %74, i16* @prgpddualproc__prmfailparitytm3, align 2
  br label %"35"

"35":                                             ; preds = %"34", %"33"
  %75 = load i16, i16* @prgpddualproc__blocksizeu16, align 2
  %76 = icmp eq i16 %75, 0
  %77 = icmp ugt i16 %75, 100
  %or.cond8 = or i1 %76, %77
  br i1 %or.cond8, label %"37", label %"38"

"37":                                             ; preds = %"35"
  store i16 100, i16* @prgpddualproc__blocksizeu16, align 2
  br label %"38"

"38":                                             ; preds = %"37", %"35"
  %78 = load i16, i16* @prgpddualproc__blocksizeu16res, align 2
  %79 = icmp eq i16 %78, 0
  %80 = icmp ugt i16 %78, 100
  %or.cond10 = or i1 %79, %80
  br i1 %or.cond10, label %"40", label %"41"

"40":                                             ; preds = %"38"
  store i16 100, i16* @prgpddualproc__blocksizeu16res, align 2
  br label %"41"

"41":                                             ; preds = %"40", %"38"
  store i16 0, i16* @prgpddualproc__conserrcntr_rgpdcomm1, align 2
  store i16 0, i16* @prgpddualproc__errcntr_rgpdhlth1, align 2
  %81 = load i16, i16* @prgpddualproc__rgpdhlth_prmfail1, align 2
  %82 = icmp eq i16 %81, -21846
  br i1 %82, label %"42", label %"43"

"42":                                             ; preds = %"41"
  store i16 -21846, i16* @prgpddualproc__flag2indcurrhlthfail1, align 2
  store i16 -21846, i16* @prgpddualproc__consfailsts_rgpd1, align 2
  br label %"44"

"43":                                             ; preds = %"41"
  store i16 21845, i16* @prgpddualproc__flag2indcurrhlthfail1, align 2
  store i16 21845, i16* @prgpddualproc__consfailsts_rgpd1, align 2
  br label %"44"

"44":                                             ; preds = %"43", %"42"
  store i16 0, i16* @prgpddualproc__conserrcntr_rgpdcomm2, align 2
  store i16 0, i16* @prgpddualproc__errcntr_rgpdhlth2, align 2
  %83 = load i16, i16* @prgpddualproc__rgpdhlth_prmfail2, align 2
  %84 = icmp eq i16 %83, -21846
  br i1 %84, label %"45", label %"46"

"45":                                             ; preds = %"44"
  store i16 -21846, i16* @prgpddualproc__flag2indcurrhlthfail2, align 2
  store i16 -21846, i16* @prgpddualproc__consfailsts_rgpd2, align 2
  br label %return

"46":                                             ; preds = %"44"
  store i16 21845, i16* @prgpddualproc__flag2indcurrhlthfail2, align 2
  store i16 21845, i16* @prgpddualproc__consfailsts_rgpd2, align 2
  br label %return

return:                                           ; preds = %"46", %"45"
  ret void
}

; Function Attrs: uwtable
define internal void @prgpddualproc__rrgpd_data_proc() local_unnamed_addr #0 align 2 {
entry:
  call void @prgpddualproc__rerrcomp() #0
  call void @prgpddualproc__rrgpd_hlthcommchk() #0
  %0 = load i16, i16* @prgpddualproc__bothrgpd_nok1, align 2
  %1 = icmp eq i16 %0, -21846
  br i1 %1, label %"3", label %"13"

"3":                                              ; preds = %entry
  store i16 448, i16* @prgpddualproc__selctionsrc_ypr1, align 2
  %2 = load i16, i16* @prgpddualproc__rgpdmsgsts1, align 2
  %3 = icmp eq i16 %2, -21846
  %4 = load i16, i16* @prgpddualproc__rgpdmsgsts2, align 2
  %5 = icmp eq i16 %4, -21846
  %or.cond = and i1 %3, %5
  br i1 %or.cond, label %"5", label %"6"

"5":                                              ; preds = %"3"
  store i16 -21846, i16* @prgpddualproc__flg2retnprevdata_ypr1, align 2
  br label %"13"

"6":                                              ; preds = %"3"
  store i16 21845, i16* @prgpddualproc__flg2retnprevdata_ypr1, align 2
  %6 = load i16, i16* @prgpddualproc__selchid_ypr1, align 2
  %7 = icmp eq i16 %6, 1
  %8 = load i16, i16* @prgpddualproc__rgpdmsgsts1, align 2
  %9 = icmp eq i16 %8, -21846
  %or.cond3 = and i1 %7, %9
  br i1 %or.cond3, label %"8", label %"9"

"8":                                              ; preds = %"6"
  store i16 2, i16* @prgpddualproc__selchid_ypr1, align 2
  br label %"13"

"9":                                              ; preds = %"6"
  %10 = icmp eq i16 %6, 2
  %11 = load i16, i16* @prgpddualproc__rgpdmsgsts2, align 2
  %12 = icmp eq i16 %11, -21846
  %or.cond5 = and i1 %10, %12
  br i1 %or.cond5, label %"11", label %"13"

"11":                                             ; preds = %"9"
  store i16 1, i16* @prgpddualproc__selchid_ypr1, align 2
  br label %"13"

"13":                                             ; preds = %"11", %"9", %"8", %"5", %entry
  %13 = load i16, i16* @prgpddualproc__bothrgpd_nok2, align 2
  %14 = icmp eq i16 %13, -21846
  br i1 %14, label %"14", label %"24"

"14":                                             ; preds = %"13"
  store i16 448, i16* @prgpddualproc__selctionsrc_ypr2, align 2
  %15 = load i16, i16* @prgpddualproc__rgpdmsgsts1, align 2
  %16 = icmp eq i16 %15, -21846
  %17 = load i16, i16* @prgpddualproc__rgpdmsgsts2, align 2
  %18 = icmp eq i16 %17, -21846
  %or.cond7 = and i1 %16, %18
  br i1 %or.cond7, label %"16", label %"17"

"16":                                             ; preds = %"14"
  store i16 -21846, i16* @prgpddualproc__flg2retnprevdata_ypr2, align 2
  br label %"24"

"17":                                             ; preds = %"14"
  store i16 21845, i16* @prgpddualproc__flg2retnprevdata_ypr2, align 2
  %19 = load i16, i16* @prgpddualproc__selchid_ypr2, align 2
  %20 = icmp eq i16 %19, 1
  %21 = load i16, i16* @prgpddualproc__rgpdmsgsts1, align 2
  %22 = icmp eq i16 %21, -21846
  %or.cond9 = and i1 %20, %22
  br i1 %or.cond9, label %"19", label %"20"

"19":                                             ; preds = %"17"
  store i16 2, i16* @prgpddualproc__selchid_ypr2, align 2
  br label %"24"

"20":                                             ; preds = %"17"
  %23 = icmp eq i16 %19, 2
  %24 = load i16, i16* @prgpddualproc__rgpdmsgsts2, align 2
  %25 = icmp eq i16 %24, -21846
  %or.cond11 = and i1 %23, %25
  br i1 %or.cond11, label %"22", label %"24"

"22":                                             ; preds = %"20"
  store i16 1, i16* @prgpddualproc__selchid_ypr2, align 2
  br label %"24"

"24":                                             ; preds = %"22", %"20", %"19", %"16", %"13"
  %26 = load i16, i16* @prgpddualproc__bothrgpd_nok3, align 2
  %27 = icmp eq i16 %26, -21846
  br i1 %27, label %"25", label %"35"

"25":                                             ; preds = %"24"
  store i16 448, i16* @prgpddualproc__selctionsrc_ypr3, align 2
  %28 = load i16, i16* @prgpddualproc__rgpdmsgsts1, align 2
  %29 = icmp eq i16 %28, -21846
  %30 = load i16, i16* @prgpddualproc__rgpdmsgsts2, align 2
  %31 = icmp eq i16 %30, -21846
  %or.cond13 = and i1 %29, %31
  br i1 %or.cond13, label %"27", label %"28"

"27":                                             ; preds = %"25"
  store i16 -21846, i16* @prgpddualproc__flg2retnprevdata_ypr3, align 2
  br label %"35"

"28":                                             ; preds = %"25"
  store i16 21845, i16* @prgpddualproc__flg2retnprevdata_ypr3, align 2
  %32 = load i16, i16* @prgpddualproc__selchid_ypr3, align 2
  %33 = icmp eq i16 %32, 1
  %34 = load i16, i16* @prgpddualproc__rgpdmsgsts1, align 2
  %35 = icmp eq i16 %34, -21846
  %or.cond15 = and i1 %33, %35
  br i1 %or.cond15, label %"30", label %"31"

"30":                                             ; preds = %"28"
  store i16 2, i16* @prgpddualproc__selchid_ypr3, align 2
  br label %"35"

"31":                                             ; preds = %"28"
  %36 = icmp eq i16 %32, 2
  %37 = load i16, i16* @prgpddualproc__rgpdmsgsts2, align 2
  %38 = icmp eq i16 %37, -21846
  %or.cond17 = and i1 %36, %38
  br i1 %or.cond17, label %"33", label %"35"

"33":                                             ; preds = %"31"
  store i16 1, i16* @prgpddualproc__selchid_ypr3, align 2
  br label %"35"

"35":                                             ; preds = %"33", %"31", %"30", %"27", %"24"
  call void @prgpddualproc__rselchannelid_ypr() #0
  %39 = load i16, i16* @prgpddualproc__flg2retnprevdata_ypr1, align 2
  %40 = icmp eq i16 %39, 21845
  br i1 %40, label %"36", label %"40"

"36":                                             ; preds = %"35"
  %41 = load i16, i16* @prgpddualproc__selchid_ypr1, align 2
  %42 = icmp eq i16 %41, 1
  br i1 %42, label %"37", label %"38"

"37":                                             ; preds = %"36"
  %43 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__comp_rgpd1_ypr, i64 0, i64 0), align 4
  %44 = fmul float %43, 0x3F91DF4680000000
  store float %44, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__rgpd_rate_ypr, i64 0, i64 0), align 4
  %45 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__comp_rgpd1_ypr, i64 0, i64 0), align 4
  store float %45, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__rgpd_rate_ypr_tm, i64 0, i64 0), align 4
  br label %"40"

"38":                                             ; preds = %"36"
  %46 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__comp_rgpd2_ypr, i64 0, i64 0), align 4
  %47 = fmul float %46, 0x3F91DF4680000000
  store float %47, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__rgpd_rate_ypr, i64 0, i64 0), align 4
  %48 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__comp_rgpd2_ypr, i64 0, i64 0), align 4
  store float %48, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__rgpd_rate_ypr_tm, i64 0, i64 0), align 4
  br label %"40"

"40":                                             ; preds = %"38", %"37", %"35"
  %49 = load i16, i16* @prgpddualproc__flg2retnprevdata_ypr2, align 2
  %50 = icmp eq i16 %49, 21845
  br i1 %50, label %"41", label %"45"

"41":                                             ; preds = %"40"
  %51 = load i16, i16* @prgpddualproc__selchid_ypr2, align 2
  %52 = icmp eq i16 %51, 1
  br i1 %52, label %"42", label %"43"

"42":                                             ; preds = %"41"
  %53 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__comp_rgpd1_ypr, i64 0, i64 1), align 4
  %54 = fmul float %53, 0x3F91DF4680000000
  store float %54, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__rgpd_rate_ypr, i64 0, i64 1), align 4
  %55 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__comp_rgpd1_ypr, i64 0, i64 1), align 4
  store float %55, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__rgpd_rate_ypr_tm, i64 0, i64 1), align 4
  br label %"45"

"43":                                             ; preds = %"41"
  %56 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__comp_rgpd2_ypr, i64 0, i64 1), align 4
  %57 = fmul float %56, 0x3F91DF4680000000
  store float %57, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__rgpd_rate_ypr, i64 0, i64 1), align 4
  %58 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__comp_rgpd2_ypr, i64 0, i64 1), align 4
  store float %58, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__rgpd_rate_ypr_tm, i64 0, i64 1), align 4
  br label %"45"

"45":                                             ; preds = %"43", %"42", %"40"
  %59 = load i16, i16* @prgpddualproc__flg2retnprevdata_ypr3, align 2
  %60 = icmp eq i16 %59, 21845
  br i1 %60, label %"46", label %"50"

"46":                                             ; preds = %"45"
  %61 = load i16, i16* @prgpddualproc__selchid_ypr3, align 2
  %62 = icmp eq i16 %61, 1
  br i1 %62, label %"47", label %"48"

"47":                                             ; preds = %"46"
  %63 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__comp_rgpd1_ypr, i64 0, i64 2), align 4
  %64 = fmul float %63, 0x3F91DF4680000000
  store float %64, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__rgpd_rate_ypr, i64 0, i64 2), align 4
  %65 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__comp_rgpd1_ypr, i64 0, i64 2), align 4
  store float %65, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__rgpd_rate_ypr_tm, i64 0, i64 2), align 4
  br label %"50"

"48":                                             ; preds = %"46"
  %66 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__comp_rgpd2_ypr, i64 0, i64 2), align 4
  %67 = fmul float %66, 0x3F91DF4680000000
  store float %67, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__rgpd_rate_ypr, i64 0, i64 2), align 4
  %68 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__comp_rgpd2_ypr, i64 0, i64 2), align 4
  store float %68, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__rgpd_rate_ypr_tm, i64 0, i64 2), align 4
  br label %"50"

"50":                                             ; preds = %"48", %"47", %"45"
  call void @prgpddualproc__rrgpd_tmproc() #0
  ret void
}

; Function Attrs: uwtable
define internal void @prgpddualproc__rerrcomp() local_unnamed_addr #0 align 2 {
entry:
  %0 = load i16, i16* @prgpddualproc__raw_rgpd1_ypr1, align 2
  %1 = sitofp i16 %0 to float
  %2 = fmul float %1, 0x3F34028000000000
  store float %2, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__comp_rgpd1_ypr, i64 0, i64 0), align 4
  %3 = fcmp ogt float %2, 1.000000e+01
  br i1 %3, label %"3", label %"4"

"3":                                              ; preds = %entry
  store float 1.000000e+01, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__comp_rgpd1_ypr, i64 0, i64 0), align 4
  br label %"6"

"4":                                              ; preds = %entry
  %4 = fcmp olt float %2, -1.000000e+01
  br i1 %4, label %"5", label %"6"

"5":                                              ; preds = %"4"
  store float -1.000000e+01, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__comp_rgpd1_ypr, i64 0, i64 0), align 4
  br label %"6"

"6":                                              ; preds = %"5", %"4", %"3"
  %5 = load i16, i16* @prgpddualproc__raw_rgpd2_ypr1, align 2
  %6 = sitofp i16 %5 to float
  %7 = fmul float %6, 0x3F34028000000000
  store float %7, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__comp_rgpd2_ypr, i64 0, i64 0), align 4
  %8 = fcmp ogt float %7, 1.000000e+01
  br i1 %8, label %"7", label %"8"

"7":                                              ; preds = %"6"
  store float 1.000000e+01, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__comp_rgpd2_ypr, i64 0, i64 0), align 4
  br label %"10"

"8":                                              ; preds = %"6"
  %9 = fcmp olt float %7, -1.000000e+01
  br i1 %9, label %"9", label %"10"

"9":                                              ; preds = %"8"
  store float -1.000000e+01, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__comp_rgpd2_ypr, i64 0, i64 0), align 4
  br label %"10"

"10":                                             ; preds = %"9", %"8", %"7"
  %10 = load i16, i16* @prgpddualproc__raw_rgpd1_ypr2, align 2
  %11 = sitofp i16 %10 to float
  %12 = fmul float %11, 0x3F34028000000000
  store float %12, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__comp_rgpd1_ypr, i64 0, i64 1), align 4
  %13 = fcmp ogt float %12, 1.000000e+01
  br i1 %13, label %"11", label %"12"

"11":                                             ; preds = %"10"
  store float 1.000000e+01, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__comp_rgpd1_ypr, i64 0, i64 1), align 4
  br label %"14"

"12":                                             ; preds = %"10"
  %14 = fcmp olt float %12, -1.000000e+01
  br i1 %14, label %"13", label %"14"

"13":                                             ; preds = %"12"
  store float -1.000000e+01, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__comp_rgpd1_ypr, i64 0, i64 1), align 4
  br label %"14"

"14":                                             ; preds = %"13", %"12", %"11"
  %15 = load i16, i16* @prgpddualproc__raw_rgpd2_ypr2, align 2
  %16 = sitofp i16 %15 to float
  %17 = fmul float %16, 0x3F34028000000000
  store float %17, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__comp_rgpd2_ypr, i64 0, i64 1), align 4
  %18 = fcmp ogt float %17, 1.000000e+01
  br i1 %18, label %"15", label %"16"

"15":                                             ; preds = %"14"
  store float 1.000000e+01, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__comp_rgpd2_ypr, i64 0, i64 1), align 4
  br label %"18"

"16":                                             ; preds = %"14"
  %19 = fcmp olt float %17, -1.000000e+01
  br i1 %19, label %"17", label %"18"

"17":                                             ; preds = %"16"
  store float -1.000000e+01, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__comp_rgpd2_ypr, i64 0, i64 1), align 4
  br label %"18"

"18":                                             ; preds = %"17", %"16", %"15"
  %20 = load i16, i16* @prgpddualproc__raw_rgpd1_ypr3, align 2
  %21 = sitofp i16 %20 to float
  %22 = fmul float %21, 0x3F34028000000000
  store float %22, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__comp_rgpd1_ypr, i64 0, i64 2), align 4
  %23 = fcmp ogt float %22, 1.000000e+01
  br i1 %23, label %"19", label %"20"

"19":                                             ; preds = %"18"
  store float 1.000000e+01, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__comp_rgpd1_ypr, i64 0, i64 2), align 4
  br label %"22"

"20":                                             ; preds = %"18"
  %24 = fcmp olt float %22, -1.000000e+01
  br i1 %24, label %"21", label %"22"

"21":                                             ; preds = %"20"
  store float -1.000000e+01, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__comp_rgpd1_ypr, i64 0, i64 2), align 4
  br label %"22"

"22":                                             ; preds = %"21", %"20", %"19"
  %25 = load i16, i16* @prgpddualproc__raw_rgpd2_ypr3, align 2
  %26 = sitofp i16 %25 to float
  %27 = fmul float %26, 0x3F34028000000000
  store float %27, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__comp_rgpd2_ypr, i64 0, i64 2), align 4
  %28 = fcmp ogt float %27, 1.000000e+01
  br i1 %28, label %"23", label %"24"

"23":                                             ; preds = %"22"
  store float 1.000000e+01, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__comp_rgpd2_ypr, i64 0, i64 2), align 4
  br label %return

"24":                                             ; preds = %"22"
  %29 = fcmp olt float %27, -1.000000e+01
  br i1 %29, label %"25", label %return

"25":                                             ; preds = %"24"
  store float -1.000000e+01, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__comp_rgpd2_ypr, i64 0, i64 2), align 4
  br label %return

return:                                           ; preds = %"25", %"24", %"23"
  ret void
}

; Function Attrs: uwtable
define internal void @prgpddualproc__rrgpd_hlthcommchk() local_unnamed_addr #0 align 2 {
entry:
  %0 = load i16, i16* @prgpddualproc__rgpdhlth_prmfail1, align 2
  %1 = icmp eq i16 %0, 21845
  br i1 %1, label %"3", label %"15"

"3":                                              ; preds = %entry
  store i16 21845, i16* @prgpddualproc__flag2indcurrhlthfail1, align 2
  store i16 21845, i16* @prgpddualproc__consfailsts_rgpd1, align 2
  %2 = load i16, i16* @prgpddualproc__rgpdmsgsts1, align 2
  %3 = icmp eq i16 %2, -21846
  br i1 %3, label %"4", label %"6"

"4":                                              ; preds = %"3"
  %4 = load i16, i16* @prgpddualproc__conserrcntr_rgpdcomm1, align 2
  %5 = add i16 %4, 1
  store i16 %5, i16* @prgpddualproc__conserrcntr_rgpdcomm1, align 2
  %6 = icmp ugt i16 %5, 2
  br i1 %6, label %"5", label %"15"

"5":                                              ; preds = %"4"
  store i16 -21846, i16* @prgpddualproc__consfailsts_rgpd1, align 2
  br label %"15"

"6":                                              ; preds = %"3"
  store i16 0, i16* @prgpddualproc__conserrcntr_rgpdcomm1, align 2
  %7 = load i16, i16* @prgpddualproc__microsyn_rgpd1, align 2
  %8 = icmp sle i16 %7, 10480
  %9 = icmp sgt i16 %7, 12446
  %or.cond = or i1 %8, %9
  br i1 %or.cond, label %"8", label %"13"

"8":                                              ; preds = %"6"
  store i16 -21846, i16* @prgpddualproc__flag2indcurrhlthfail1, align 2
  %10 = load i16, i16* @prgpddualproc__errcntr_rgpdhlth1, align 2
  %11 = add i16 %10, 1
  store i16 %11, i16* @prgpddualproc__errcntr_rgpdhlth1, align 2
  %12 = icmp ugt i16 %11, 2
  br i1 %12, label %"9", label %"10"

"9":                                              ; preds = %"8"
  store i16 -21846, i16* @prgpddualproc__consfailsts_rgpd1, align 2
  br label %"10"

"10":                                             ; preds = %"9", %"8"
  %13 = load i16, i16* @prgpddualproc__errcntr_rgpdhlth1, align 2
  %14 = icmp ugt i16 %13, 499
  br i1 %14, label %"11", label %"15"

"11":                                             ; preds = %"10"
  store i16 -21846, i16* @prgpddualproc__rgpdhlth_prmfail1, align 2
  br label %"15"

"13":                                             ; preds = %"6"
  store i16 0, i16* @prgpddualproc__errcntr_rgpdhlth1, align 2
  br label %"15"

"15":                                             ; preds = %"13", %"11", %"10", %"5", %"4", %entry
  %15 = load i16, i16* @prgpddualproc__rgpdhlth_prmfail2, align 2
  %16 = icmp eq i16 %15, 21845
  br i1 %16, label %"16", label %return

"16":                                             ; preds = %"15"
  store i16 21845, i16* @prgpddualproc__flag2indcurrhlthfail2, align 2
  store i16 21845, i16* @prgpddualproc__consfailsts_rgpd2, align 2
  %17 = load i16, i16* @prgpddualproc__rgpdmsgsts2, align 2
  %18 = icmp eq i16 %17, -21846
  br i1 %18, label %"17", label %"19"

"17":                                             ; preds = %"16"
  %19 = load i16, i16* @prgpddualproc__conserrcntr_rgpdcomm2, align 2
  %20 = add i16 %19, 1
  store i16 %20, i16* @prgpddualproc__conserrcntr_rgpdcomm2, align 2
  %21 = icmp ugt i16 %20, 2
  br i1 %21, label %"18", label %return

"18":                                             ; preds = %"17"
  store i16 -21846, i16* @prgpddualproc__consfailsts_rgpd2, align 2
  br label %return

"19":                                             ; preds = %"16"
  store i16 0, i16* @prgpddualproc__conserrcntr_rgpdcomm2, align 2
  %22 = load i16, i16* @prgpddualproc__microsyn_rgpd2, align 2
  %23 = icmp sle i16 %22, 10480
  %24 = icmp sgt i16 %22, 12446
  %or.cond3 = or i1 %23, %24
  br i1 %or.cond3, label %"21", label %"26"

"21":                                             ; preds = %"19"
  store i16 -21846, i16* @prgpddualproc__flag2indcurrhlthfail2, align 2
  %25 = load i16, i16* @prgpddualproc__errcntr_rgpdhlth2, align 2
  %26 = add i16 %25, 1
  store i16 %26, i16* @prgpddualproc__errcntr_rgpdhlth2, align 2
  %27 = icmp ugt i16 %26, 2
  br i1 %27, label %"22", label %"23"

"22":                                             ; preds = %"21"
  store i16 -21846, i16* @prgpddualproc__consfailsts_rgpd2, align 2
  br label %"23"

"23":                                             ; preds = %"22", %"21"
  %28 = load i16, i16* @prgpddualproc__errcntr_rgpdhlth2, align 2
  %29 = icmp ugt i16 %28, 499
  br i1 %29, label %"24", label %return

"24":                                             ; preds = %"23"
  store i16 -21846, i16* @prgpddualproc__rgpdhlth_prmfail2, align 2
  br label %return

"26":                                             ; preds = %"19"
  store i16 0, i16* @prgpddualproc__errcntr_rgpdhlth2, align 2
  br label %return

return:                                           ; preds = %"26", %"24", %"23", %"18", %"17", %"15"
  ret void
}

; Function Attrs: uwtable
define internal void @prgpddualproc__rselchannelid_ypr() local_unnamed_addr #0 align 2 {
entry:
  %0 = load i16, i16* @prgpddualproc__rgpdmsgsts1, align 2
  %1 = icmp eq i16 %0, -21846
  %2 = load i16, i16* @prgpddualproc__flag2indcurrhlthfail1, align 2
  %3 = icmp eq i16 %2, -21846
  %or.cond = or i1 %1, %3
  %4 = select i1 %or.cond, i16 1, i16 0
  %5 = load i16, i16* @prgpddualproc__rgpdmsgsts2, align 2
  %6 = icmp eq i16 %5, -21846
  %7 = load i16, i16* @prgpddualproc__flag2indcurrhlthfail2, align 2
  %8 = icmp eq i16 %7, -21846
  %or.cond3 = or i1 %6, %8
  br i1 %or.cond3, label %"7", label %"8"

"7":                                              ; preds = %entry
  %9 = zext i16 %4 to i32
  %10 = call zeroext i16 @obclib__bit_or(i16 zeroext %4, i16 zeroext 2)
  br label %"8"

"8":                                              ; preds = %"7", %entry
  %11 = phi i16 [ %10, %"7" ], [ %4, %entry ]
  store i16 21845, i16* @prgpddualproc__flg2indhardschedule1, align 2
  %12 = load i16, i16* @prgpddualproc__bothrgpd_nok1, align 2
  %13 = icmp eq i16 %12, 21845
  br i1 %13, label %"9", label %"37"

"9":                                              ; preds = %"8"
  store i16 21845, i16* @prgpddualproc__flg2retnprevdata_ypr1, align 2
  %14 = zext i16 %11 to i32
  %15 = load i16, i16* @prgpddualproc__prmfailflg_parity1, align 2
  %16 = zext i16 %15 to i32
  %17 = call zeroext i16 @obclib__bit_or(i16 zeroext %15, i16 zeroext %11)
  %18 = icmp ule i16 %17, 2
  br i1 %18, label %"10", label %"11"

"10":                                             ; preds = %"9"
  store i16 0, i16* @prgpddualproc__errcnt2setrgpdnok1, align 2
  store i16 0, i16* @prgpddualproc__errcnt2setrgpdflflg1, align 2
  br label %"11"

"11":                                             ; preds = %"10", %"9"
  %19 = load i16, i16* @prgpddualproc__selchid_ypr1, align 2
  %20 = zext i16 %19 to i32
  %21 = zext i16 %17 to i32
  %22 = call zeroext i16 @obclib__bit_and(i16 zeroext %17, i16 zeroext %19)
  %23 = icmp ne i16 %22, 0
  br i1 %23, label %"12", label %"33"

"12":                                             ; preds = %"11"
  switch i16 %17, label %"24" [
    i16 1, label %"14"
    i16 2, label %"19"
  ]

"14":                                             ; preds = %"12"
  %24 = load i16, i16* @prgpddualproc__prmfailflg_parity1, align 2
  %25 = icmp eq i16 %24, 1
  %26 = load i16, i16* @prgpddualproc__consfailsts_rgpd1, align 2
  %27 = icmp eq i16 %26, -21846
  %or.cond5 = or i1 %25, %27
  br i1 %or.cond5, label %"16", label %"17"

"16":                                             ; preds = %"14"
  store i16 384, i16* @prgpddualproc__selctionsrc_ypr1, align 2
  store i16 2, i16* @prgpddualproc__selchid_ypr1, align 2
  br label %"37"

"17":                                             ; preds = %"14"
  store i16 320, i16* @prgpddualproc__selctionsrc_ypr1, align 2
  store i16 -21846, i16* @prgpddualproc__flg2retnprevdata_ypr1, align 2
  br label %"37"

"19":                                             ; preds = %"12"
  %28 = load i16, i16* @prgpddualproc__prmfailflg_parity1, align 2
  %29 = icmp eq i16 %28, 2
  %30 = load i16, i16* @prgpddualproc__consfailsts_rgpd2, align 2
  %31 = icmp eq i16 %30, -21846
  %or.cond7 = or i1 %29, %31
  br i1 %or.cond7, label %"21", label %"22"

"21":                                             ; preds = %"19"
  store i16 384, i16* @prgpddualproc__selctionsrc_ypr1, align 2
  store i16 1, i16* @prgpddualproc__selchid_ypr1, align 2
  br label %"37"

"22":                                             ; preds = %"19"
  store i16 320, i16* @prgpddualproc__selctionsrc_ypr1, align 2
  store i16 -21846, i16* @prgpddualproc__flg2retnprevdata_ypr1, align 2
  br label %"37"

"24":                                             ; preds = %"12"
  store i16 -21846, i16* @prgpddualproc__flg2retnprevdata_ypr1, align 2
  store i16 448, i16* @prgpddualproc__selctionsrc_ypr1, align 2
  %32 = load i16, i16* @prgpddualproc__errcnt2setrgpdnok1, align 2
  %33 = add i16 %32, 1
  store i16 %33, i16* @prgpddualproc__errcnt2setrgpdnok1, align 2
  %34 = icmp ugt i16 %33, 14
  br i1 %34, label %"25", label %"26"

"25":                                             ; preds = %"24"
  store i16 -21846, i16* @prgpddualproc__bothrgpd_nok1, align 2
  br label %"26"

"26":                                             ; preds = %"25", %"24"
  %35 = load i16, i16* @prgpddualproc__rgpdmsgsts1, align 2
  %36 = icmp eq i16 %35, -21846
  %37 = load i16, i16* @prgpddualproc__rgpdmsgsts2, align 2
  %38 = icmp eq i16 %37, -21846
  %or.cond9 = or i1 %36, %38
  br i1 %or.cond9, label %"28", label %"29"

"28":                                             ; preds = %"26"
  %39 = load i16, i16* @prgpddualproc__errcnt2setrgpdflflg1, align 2
  %40 = add i16 %39, 1
  store i16 %40, i16* @prgpddualproc__errcnt2setrgpdflflg1, align 2
  br label %"29"

"29":                                             ; preds = %"28", %"26"
  %41 = load i16, i16* @prgpddualproc__errcnt2setrgpdflflg1, align 2
  %42 = icmp ugt i16 %41, 14
  br i1 %42, label %"30", label %"37"

"30":                                             ; preds = %"29"
  store i16 -21846, i16* @prgpddualproc__rgpd_fail_flag, align 2
  br label %"37"

"33":                                             ; preds = %"11"
  %43 = icmp eq i16 %17, 0
  br i1 %43, label %"34", label %"35"

"34":                                             ; preds = %"33"
  store i16 -21846, i16* @prgpddualproc__flg2indhardschedule1, align 2
  br label %"37"

"35":                                             ; preds = %"33"
  store i16 256, i16* @prgpddualproc__selctionsrc_ypr1, align 2
  br label %"37"

"37":                                             ; preds = %"35", %"34", %"30", %"29", %"22", %"21", %"17", %"16", %"8"
  store i16 21845, i16* @prgpddualproc__flg2indhardschedule2, align 2
  %44 = load i16, i16* @prgpddualproc__bothrgpd_nok2, align 2
  %45 = icmp eq i16 %44, 21845
  br i1 %45, label %"38", label %"66"

"38":                                             ; preds = %"37"
  store i16 21845, i16* @prgpddualproc__flg2retnprevdata_ypr2, align 2
  %46 = zext i16 %11 to i32
  %47 = load i16, i16* @prgpddualproc__prmfailflg_parity2, align 2
  %48 = zext i16 %47 to i32
  %49 = call zeroext i16 @obclib__bit_or(i16 zeroext %47, i16 zeroext %11)
  %50 = icmp ule i16 %49, 2
  br i1 %50, label %"39", label %"40"

"39":                                             ; preds = %"38"
  store i16 0, i16* @prgpddualproc__errcnt2setrgpdnok2, align 2
  store i16 0, i16* @prgpddualproc__errcnt2setrgpdflflg2, align 2
  br label %"40"

"40":                                             ; preds = %"39", %"38"
  %51 = load i16, i16* @prgpddualproc__selchid_ypr2, align 2
  %52 = zext i16 %51 to i32
  %53 = zext i16 %49 to i32
  %54 = call zeroext i16 @obclib__bit_and(i16 zeroext %49, i16 zeroext %51)
  %55 = icmp ne i16 %54, 0
  br i1 %55, label %"41", label %"62"

"41":                                             ; preds = %"40"
  switch i16 %49, label %"53" [
    i16 1, label %"43"
    i16 2, label %"48"
  ]

"43":                                             ; preds = %"41"
  %56 = load i16, i16* @prgpddualproc__prmfailflg_parity2, align 2
  %57 = icmp eq i16 %56, 1
  %58 = load i16, i16* @prgpddualproc__consfailsts_rgpd1, align 2
  %59 = icmp eq i16 %58, -21846
  %or.cond11 = or i1 %57, %59
  br i1 %or.cond11, label %"45", label %"46"

"45":                                             ; preds = %"43"
  store i16 384, i16* @prgpddualproc__selctionsrc_ypr2, align 2
  store i16 2, i16* @prgpddualproc__selchid_ypr2, align 2
  br label %"66"

"46":                                             ; preds = %"43"
  store i16 320, i16* @prgpddualproc__selctionsrc_ypr2, align 2
  store i16 -21846, i16* @prgpddualproc__flg2retnprevdata_ypr2, align 2
  br label %"66"

"48":                                             ; preds = %"41"
  %60 = load i16, i16* @prgpddualproc__prmfailflg_parity2, align 2
  %61 = icmp eq i16 %60, 2
  %62 = load i16, i16* @prgpddualproc__consfailsts_rgpd2, align 2
  %63 = icmp eq i16 %62, -21846
  %or.cond13 = or i1 %61, %63
  br i1 %or.cond13, label %"50", label %"51"

"50":                                             ; preds = %"48"
  store i16 384, i16* @prgpddualproc__selctionsrc_ypr2, align 2
  store i16 1, i16* @prgpddualproc__selchid_ypr2, align 2
  br label %"66"

"51":                                             ; preds = %"48"
  store i16 320, i16* @prgpddualproc__selctionsrc_ypr2, align 2
  store i16 -21846, i16* @prgpddualproc__flg2retnprevdata_ypr2, align 2
  br label %"66"

"53":                                             ; preds = %"41"
  store i16 -21846, i16* @prgpddualproc__flg2retnprevdata_ypr2, align 2
  store i16 448, i16* @prgpddualproc__selctionsrc_ypr2, align 2
  %64 = load i16, i16* @prgpddualproc__errcnt2setrgpdnok2, align 2
  %65 = add i16 %64, 1
  store i16 %65, i16* @prgpddualproc__errcnt2setrgpdnok2, align 2
  %66 = icmp ugt i16 %65, 14
  br i1 %66, label %"54", label %"55"

"54":                                             ; preds = %"53"
  store i16 -21846, i16* @prgpddualproc__bothrgpd_nok2, align 2
  br label %"55"

"55":                                             ; preds = %"54", %"53"
  %67 = load i16, i16* @prgpddualproc__rgpdmsgsts1, align 2
  %68 = icmp eq i16 %67, -21846
  %69 = load i16, i16* @prgpddualproc__rgpdmsgsts2, align 2
  %70 = icmp eq i16 %69, -21846
  %or.cond15 = or i1 %68, %70
  br i1 %or.cond15, label %"57", label %"58"

"57":                                             ; preds = %"55"
  %71 = load i16, i16* @prgpddualproc__errcnt2setrgpdflflg2, align 2
  %72 = add i16 %71, 1
  store i16 %72, i16* @prgpddualproc__errcnt2setrgpdflflg2, align 2
  br label %"58"

"58":                                             ; preds = %"57", %"55"
  %73 = load i16, i16* @prgpddualproc__errcnt2setrgpdflflg2, align 2
  %74 = icmp ugt i16 %73, 14
  br i1 %74, label %"59", label %"66"

"59":                                             ; preds = %"58"
  store i16 -21846, i16* @prgpddualproc__rgpd_fail_flag, align 2
  br label %"66"

"62":                                             ; preds = %"40"
  %75 = icmp eq i16 %49, 0
  br i1 %75, label %"63", label %"64"

"63":                                             ; preds = %"62"
  store i16 -21846, i16* @prgpddualproc__flg2indhardschedule2, align 2
  br label %"66"

"64":                                             ; preds = %"62"
  store i16 256, i16* @prgpddualproc__selctionsrc_ypr2, align 2
  br label %"66"

"66":                                             ; preds = %"64", %"63", %"59", %"58", %"51", %"50", %"46", %"45", %"37"
  store i16 21845, i16* @prgpddualproc__flg2indhardschedule3, align 2
  %76 = load i16, i16* @prgpddualproc__bothrgpd_nok3, align 2
  %77 = icmp eq i16 %76, 21845
  br i1 %77, label %"67", label %"95"

"67":                                             ; preds = %"66"
  store i16 21845, i16* @prgpddualproc__flg2retnprevdata_ypr3, align 2
  %78 = zext i16 %11 to i32
  %79 = load i16, i16* @prgpddualproc__prmfailflg_parity3, align 2
  %80 = zext i16 %79 to i32
  %81 = call zeroext i16 @obclib__bit_or(i16 zeroext %79, i16 zeroext %11)
  %82 = icmp ule i16 %81, 2
  br i1 %82, label %"68", label %"69"

"68":                                             ; preds = %"67"
  store i16 0, i16* @prgpddualproc__errcnt2setrgpdnok3, align 2
  store i16 0, i16* @prgpddualproc__errcnt2setrgpdflflg3, align 2
  br label %"69"

"69":                                             ; preds = %"68", %"67"
  %83 = load i16, i16* @prgpddualproc__selchid_ypr3, align 2
  %84 = zext i16 %83 to i32
  %85 = zext i16 %81 to i32
  %86 = call zeroext i16 @obclib__bit_and(i16 zeroext %81, i16 zeroext %83)
  %87 = icmp ne i16 %86, 0
  br i1 %87, label %"70", label %"91"

"70":                                             ; preds = %"69"
  switch i16 %81, label %"82" [
    i16 1, label %"72"
    i16 2, label %"77"
  ]

"72":                                             ; preds = %"70"
  %88 = load i16, i16* @prgpddualproc__prmfailflg_parity3, align 2
  %89 = icmp eq i16 %88, 1
  %90 = load i16, i16* @prgpddualproc__consfailsts_rgpd1, align 2
  %91 = icmp eq i16 %90, -21846
  %or.cond17 = or i1 %89, %91
  br i1 %or.cond17, label %"74", label %"75"

"74":                                             ; preds = %"72"
  store i16 384, i16* @prgpddualproc__selctionsrc_ypr3, align 2
  store i16 2, i16* @prgpddualproc__selchid_ypr3, align 2
  br label %"95"

"75":                                             ; preds = %"72"
  store i16 320, i16* @prgpddualproc__selctionsrc_ypr3, align 2
  store i16 -21846, i16* @prgpddualproc__flg2retnprevdata_ypr3, align 2
  br label %"95"

"77":                                             ; preds = %"70"
  %92 = load i16, i16* @prgpddualproc__prmfailflg_parity3, align 2
  %93 = icmp eq i16 %92, 2
  %94 = load i16, i16* @prgpddualproc__consfailsts_rgpd2, align 2
  %95 = icmp eq i16 %94, -21846
  %or.cond19 = or i1 %93, %95
  br i1 %or.cond19, label %"79", label %"80"

"79":                                             ; preds = %"77"
  store i16 384, i16* @prgpddualproc__selctionsrc_ypr3, align 2
  store i16 1, i16* @prgpddualproc__selchid_ypr3, align 2
  br label %"95"

"80":                                             ; preds = %"77"
  store i16 320, i16* @prgpddualproc__selctionsrc_ypr3, align 2
  store i16 -21846, i16* @prgpddualproc__flg2retnprevdata_ypr3, align 2
  br label %"95"

"82":                                             ; preds = %"70"
  store i16 -21846, i16* @prgpddualproc__flg2retnprevdata_ypr3, align 2
  store i16 448, i16* @prgpddualproc__selctionsrc_ypr3, align 2
  %96 = load i16, i16* @prgpddualproc__errcnt2setrgpdnok3, align 2
  %97 = add i16 %96, 1
  store i16 %97, i16* @prgpddualproc__errcnt2setrgpdnok3, align 2
  %98 = icmp ugt i16 %97, 14
  br i1 %98, label %"83", label %"84"

"83":                                             ; preds = %"82"
  store i16 -21846, i16* @prgpddualproc__bothrgpd_nok3, align 2
  br label %"84"

"84":                                             ; preds = %"83", %"82"
  %99 = load i16, i16* @prgpddualproc__rgpdmsgsts1, align 2
  %100 = icmp eq i16 %99, -21846
  %101 = load i16, i16* @prgpddualproc__rgpdmsgsts2, align 2
  %102 = icmp eq i16 %101, -21846
  %or.cond21 = or i1 %100, %102
  br i1 %or.cond21, label %"86", label %"87"

"86":                                             ; preds = %"84"
  %103 = load i16, i16* @prgpddualproc__errcnt2setrgpdflflg3, align 2
  %104 = add i16 %103, 1
  store i16 %104, i16* @prgpddualproc__errcnt2setrgpdflflg3, align 2
  br label %"87"

"87":                                             ; preds = %"86", %"84"
  %105 = load i16, i16* @prgpddualproc__errcnt2setrgpdflflg3, align 2
  %106 = icmp ugt i16 %105, 14
  br i1 %106, label %"88", label %"95"

"88":                                             ; preds = %"87"
  store i16 -21846, i16* @prgpddualproc__rgpd_fail_flag, align 2
  br label %"95"

"91":                                             ; preds = %"69"
  %107 = icmp eq i16 %81, 0
  br i1 %107, label %"92", label %"93"

"92":                                             ; preds = %"91"
  store i16 -21846, i16* @prgpddualproc__flg2indhardschedule3, align 2
  br label %"95"

"93":                                             ; preds = %"91"
  store i16 256, i16* @prgpddualproc__selctionsrc_ypr3, align 2
  br label %"95"

"95":                                             ; preds = %"93", %"92", %"88", %"87", %"80", %"79", %"75", %"74", %"66"
  call void @prgpddualproc__rhardcheck() #0
  ret void
}

; Function Attrs: uwtable
define internal void @prgpddualproc__rrgpd_tmproc() local_unnamed_addr #0 align 2 {
entry:
  %0 = load i16, i16* @prgpddualproc__isolnsts_hardtm1, align 2
  store i16 %0, i16* @prgpddualproc__rgpdsts_cochar, align 2
  %1 = load i16, i16* @prgpddualproc__isolnsts_hardtm2, align 2
  %2 = zext i16 %1 to i32
  %3 = call zeroext i16 @obclib__ushift_left(i16 zeroext %1, i16 zeroext 1)
  %4 = zext i16 %3 to i32
  %5 = load i16, i16* @prgpddualproc__rgpdsts_cochar, align 2
  %6 = zext i16 %5 to i32
  %7 = call zeroext i16 @obclib__bit_or(i16 zeroext %5, i16 zeroext %3)
  store i16 %7, i16* @prgpddualproc__rgpdsts_cochar, align 2
  %8 = load i16, i16* @prgpddualproc__isolnsts_hardtm3, align 2
  %9 = zext i16 %8 to i32
  %10 = call zeroext i16 @obclib__ushift_left(i16 zeroext %8, i16 zeroext 2)
  %11 = zext i16 %10 to i32
  %12 = load i16, i16* @prgpddualproc__rgpdsts_cochar, align 2
  %13 = zext i16 %12 to i32
  %14 = call zeroext i16 @obclib__bit_or(i16 zeroext %12, i16 zeroext %10)
  store i16 %14, i16* @prgpddualproc__rgpdsts_cochar, align 2
  %15 = load i16, i16* @prgpddualproc__indhardthreshviol1, align 2
  %16 = zext i16 %15 to i32
  %17 = zext i16 %14 to i32
  %18 = call zeroext i16 @obclib__bit_or(i16 zeroext %14, i16 zeroext %15)
  store i16 %18, i16* @prgpddualproc__rgpdsts_cochar, align 2
  %19 = load i16, i16* @prgpddualproc__indhardthreshviol2, align 2
  %20 = zext i16 %19 to i32
  %21 = call zeroext i16 @obclib__ushift_left(i16 zeroext %19, i16 zeroext 1)
  %22 = zext i16 %21 to i32
  %23 = load i16, i16* @prgpddualproc__rgpdsts_cochar, align 2
  %24 = zext i16 %23 to i32
  %25 = call zeroext i16 @obclib__bit_or(i16 zeroext %23, i16 zeroext %21)
  store i16 %25, i16* @prgpddualproc__rgpdsts_cochar, align 2
  %26 = load i16, i16* @prgpddualproc__indhardthreshviol3, align 2
  %27 = zext i16 %26 to i32
  %28 = call zeroext i16 @obclib__ushift_left(i16 zeroext %26, i16 zeroext 2)
  %29 = zext i16 %28 to i32
  %30 = load i16, i16* @prgpddualproc__rgpdsts_cochar, align 2
  %31 = zext i16 %30 to i32
  %32 = call zeroext i16 @obclib__bit_or(i16 zeroext %30, i16 zeroext %28)
  store i16 %32, i16* @prgpddualproc__rgpdsts_cochar, align 2
  %33 = load i16, i16* @prgpddualproc__prmfailparitytm1, align 2
  %34 = zext i16 %33 to i32
  %35 = zext i16 %32 to i32
  %36 = call zeroext i16 @obclib__bit_or(i16 zeroext %32, i16 zeroext %33)
  store i16 %36, i16* @prgpddualproc__rgpdsts_cochar, align 2
  %37 = load i16, i16* @prgpddualproc__prmfailparitytm2, align 2
  %38 = zext i16 %37 to i32
  %39 = call zeroext i16 @obclib__ushift_left(i16 zeroext %37, i16 zeroext 1)
  %40 = zext i16 %39 to i32
  %41 = load i16, i16* @prgpddualproc__rgpdsts_cochar, align 2
  %42 = zext i16 %41 to i32
  %43 = call zeroext i16 @obclib__bit_or(i16 zeroext %41, i16 zeroext %39)
  store i16 %43, i16* @prgpddualproc__rgpdsts_cochar, align 2
  %44 = load i16, i16* @prgpddualproc__prmfailparitytm3, align 2
  %45 = zext i16 %44 to i32
  %46 = call zeroext i16 @obclib__ushift_left(i16 zeroext %44, i16 zeroext 2)
  %47 = zext i16 %46 to i32
  %48 = load i16, i16* @prgpddualproc__rgpdsts_cochar, align 2
  %49 = zext i16 %48 to i32
  %50 = call zeroext i16 @obclib__bit_or(i16 zeroext %48, i16 zeroext %46)
  store i16 %50, i16* @prgpddualproc__rgpdsts_cochar, align 2
  %51 = load i16, i16* @prgpddualproc__rgpdmsgsts1, align 2
  %52 = icmp eq i16 %51, -21846
  br i1 %52, label %"3", label %"4"

"3":                                              ; preds = %entry
  %53 = zext i16 %50 to i32
  %54 = call zeroext i16 @obclib__bit_or(i16 zeroext %50, i16 zeroext 4096)
  store i16 %54, i16* @prgpddualproc__rgpdsts_cochar, align 2
  br label %"4"

"4":                                              ; preds = %"3", %entry
  %55 = load i16, i16* @prgpddualproc__rgpdmsgsts2, align 2
  %56 = icmp eq i16 %55, -21846
  br i1 %56, label %"5", label %"6"

"5":                                              ; preds = %"4"
  %57 = load i16, i16* @prgpddualproc__rgpdsts_cochar, align 2
  %58 = zext i16 %57 to i32
  %59 = call zeroext i16 @obclib__bit_or(i16 zeroext %57, i16 zeroext 16384)
  store i16 %59, i16* @prgpddualproc__rgpdsts_cochar, align 2
  br label %"6"

"6":                                              ; preds = %"5", %"4"
  %60 = load i16, i16* @prgpddualproc__flag2indcurrhlthfail1, align 2
  %61 = icmp eq i16 %60, -21846
  br i1 %61, label %"7", label %"8"

"7":                                              ; preds = %"6"
  %62 = load i16, i16* @prgpddualproc__rgpdsts_cochar, align 2
  %63 = zext i16 %62 to i32
  %64 = call zeroext i16 @obclib__bit_or(i16 zeroext %62, i16 zeroext 8)
  store i16 %64, i16* @prgpddualproc__rgpdsts_cochar, align 2
  br label %"8"

"8":                                              ; preds = %"7", %"6"
  %65 = load i16, i16* @prgpddualproc__flag2indcurrhlthfail2, align 2
  %66 = icmp eq i16 %65, -21846
  br i1 %66, label %"9", label %"10"

"9":                                              ; preds = %"8"
  %67 = load i16, i16* @prgpddualproc__rgpdsts_cochar, align 2
  %68 = zext i16 %67 to i32
  %69 = call zeroext i16 @obclib__bit_or(i16 zeroext %67, i16 zeroext 128)
  store i16 %69, i16* @prgpddualproc__rgpdsts_cochar, align 2
  br label %"10"

"10":                                             ; preds = %"9", %"8"
  %70 = load i16, i16* @prgpddualproc__rgpdhlth_prmfail1, align 2
  %71 = icmp eq i16 %70, -21846
  br i1 %71, label %"11", label %"12"

"11":                                             ; preds = %"10"
  %72 = load i16, i16* @prgpddualproc__rgpdsts_cochar, align 2
  %73 = zext i16 %72 to i32
  %74 = call zeroext i16 @obclib__bit_or(i16 zeroext %72, i16 zeroext 8192)
  store i16 %74, i16* @prgpddualproc__rgpdsts_cochar, align 2
  br label %"12"

"12":                                             ; preds = %"11", %"10"
  %75 = load i16, i16* @prgpddualproc__rgpdhlth_prmfail2, align 2
  %76 = icmp eq i16 %75, -21846
  br i1 %76, label %"13", label %"14"

"13":                                             ; preds = %"12"
  %77 = load i16, i16* @prgpddualproc__rgpdsts_cochar, align 2
  %78 = zext i16 %77 to i32
  %79 = call zeroext i16 @obclib__bit_or(i16 zeroext %77, i16 zeroext -32768)
  store i16 %79, i16* @prgpddualproc__rgpdsts_cochar, align 2
  br label %"14"

"14":                                             ; preds = %"13", %"12"
  %80 = load i16, i16* @prgpddualproc__selctionsrc_ypr1, align 2
  store i16 %80, i16* @prgpddualproc__rgpd_fdists_tm, align 2
  %81 = load i16, i16* @prgpddualproc__selctionsrc_ypr2, align 2
  %82 = zext i16 %81 to i32
  %83 = call zeroext i16 @obclib__ushift_left(i16 zeroext %81, i16 zeroext 3)
  %84 = zext i16 %83 to i32
  %85 = load i16, i16* @prgpddualproc__rgpd_fdists_tm, align 2
  %86 = zext i16 %85 to i32
  %87 = call zeroext i16 @obclib__bit_or(i16 zeroext %85, i16 zeroext %83)
  store i16 %87, i16* @prgpddualproc__rgpd_fdists_tm, align 2
  %88 = load i16, i16* @prgpddualproc__selctionsrc_ypr3, align 2
  %89 = zext i16 %88 to i32
  %90 = call zeroext i16 @obclib__ushift_left(i16 zeroext %88, i16 zeroext 6)
  %91 = zext i16 %90 to i32
  %92 = load i16, i16* @prgpddualproc__rgpd_fdists_tm, align 2
  %93 = zext i16 %92 to i32
  %94 = call zeroext i16 @obclib__bit_or(i16 zeroext %92, i16 zeroext %90)
  store i16 %94, i16* @prgpddualproc__rgpd_fdists_tm, align 2
  %95 = load i16, i16* @prgpddualproc__flg2retnprevdata_ypr1, align 2
  %96 = icmp eq i16 %95, -21846
  %97 = load i16, i16* @prgpddualproc__selchid_ypr1, align 2
  %98 = select i1 %96, i16 0, i16 %97
  %99 = load i16, i16* @prgpddualproc__flg2retnprevdata_ypr2, align 2
  %100 = icmp eq i16 %99, -21846
  %101 = load i16, i16* @prgpddualproc__selchid_ypr2, align 2
  %102 = select i1 %100, i16 0, i16 %101
  %103 = load i16, i16* @prgpddualproc__flg2retnprevdata_ypr3, align 2
  %104 = icmp eq i16 %103, -21846
  %105 = load i16, i16* @prgpddualproc__selchid_ypr3, align 2
  %106 = select i1 %104, i16 0, i16 %105
  %107 = zext i16 %98 to i32
  %108 = zext i16 %94 to i32
  %109 = call zeroext i16 @obclib__bit_or(i16 zeroext %94, i16 zeroext %98)
  store i16 %109, i16* @prgpddualproc__rgpd_fdists_tm, align 2
  %110 = zext i16 %102 to i32
  %111 = call zeroext i16 @obclib__ushift_left(i16 zeroext %102, i16 zeroext 2)
  %112 = zext i16 %111 to i32
  %113 = load i16, i16* @prgpddualproc__rgpd_fdists_tm, align 2
  %114 = zext i16 %113 to i32
  %115 = call zeroext i16 @obclib__bit_or(i16 zeroext %113, i16 zeroext %111)
  store i16 %115, i16* @prgpddualproc__rgpd_fdists_tm, align 2
  %116 = zext i16 %106 to i32
  %117 = call zeroext i16 @obclib__ushift_left(i16 zeroext %106, i16 zeroext 4)
  %118 = zext i16 %117 to i32
  %119 = load i16, i16* @prgpddualproc__rgpd_fdists_tm, align 2
  %120 = zext i16 %119 to i32
  %121 = call zeroext i16 @obclib__bit_or(i16 zeroext %119, i16 zeroext %117)
  store i16 %121, i16* @prgpddualproc__rgpd_fdists_tm, align 2
  %122 = load i16, i16* @prgpddualproc__rgpd_fail_flag, align 2
  %123 = icmp eq i16 %122, -21846
  br i1 %123, label %"24", label %"25"

"24":                                             ; preds = %"14"
  %124 = zext i16 %121 to i32
  %125 = call zeroext i16 @obclib__bit_or(i16 zeroext %121, i16 zeroext -32768)
  store i16 %125, i16* @prgpddualproc__rgpd_fdists_tm, align 2
  br label %"25"

"25":                                             ; preds = %"24", %"14"
  %126 = load i16, i16* @prgpddualproc__rgpdsts_cochar, align 2
  %127 = zext i16 %126 to i32
  %128 = load i16, i16* @prgpddualproc__rgpdsts_cochar_mjr, align 2
  %129 = zext i16 %128 to i32
  %130 = call zeroext i16 @obclib__bit_or(i16 zeroext %128, i16 zeroext %126)
  store i16 %130, i16* @prgpddualproc__rgpdsts_cochar_mjr, align 2
  %131 = load i16, i16* @prgpddualproc__prmfailflg_parity1, align 2
  %132 = zext i16 %131 to i32
  %133 = load i16, i16* @prgpddualproc__rgpd_fdi_sts_mjr, align 2
  %134 = zext i16 %133 to i32
  %135 = call zeroext i16 @obclib__bit_or(i16 zeroext %133, i16 zeroext %131)
  store i16 %135, i16* @prgpddualproc__rgpd_fdi_sts_mjr, align 2
  %136 = load i16, i16* @prgpddualproc__prmfailflg_parity2, align 2
  %137 = zext i16 %136 to i32
  %138 = call zeroext i16 @obclib__ushift_left(i16 zeroext %136, i16 zeroext 2)
  %139 = zext i16 %138 to i32
  %140 = load i16, i16* @prgpddualproc__rgpd_fdi_sts_mjr, align 2
  %141 = zext i16 %140 to i32
  %142 = call zeroext i16 @obclib__bit_or(i16 zeroext %140, i16 zeroext %138)
  store i16 %142, i16* @prgpddualproc__rgpd_fdi_sts_mjr, align 2
  %143 = load i16, i16* @prgpddualproc__prmfailflg_parity3, align 2
  %144 = zext i16 %143 to i32
  %145 = call zeroext i16 @obclib__ushift_left(i16 zeroext %143, i16 zeroext 4)
  %146 = zext i16 %145 to i32
  %147 = load i16, i16* @prgpddualproc__rgpd_fdi_sts_mjr, align 2
  %148 = zext i16 %147 to i32
  %149 = call zeroext i16 @obclib__bit_or(i16 zeroext %147, i16 zeroext %145)
  store i16 %149, i16* @prgpddualproc__rgpd_fdi_sts_mjr, align 2
  %150 = load i16, i16* @prgpddualproc__isolnsts_movavgtm1, align 2
  %151 = zext i16 %150 to i32
  %152 = zext i16 %149 to i32
  %153 = call zeroext i16 @obclib__bit_or(i16 zeroext %149, i16 zeroext %150)
  store i16 %153, i16* @prgpddualproc__rgpd_fdi_sts_mjr, align 2
  %154 = load i16, i16* @prgpddualproc__isolnsts_movavgtm2, align 2
  %155 = zext i16 %154 to i32
  %156 = call zeroext i16 @obclib__ushift_left(i16 zeroext %154, i16 zeroext 2)
  %157 = zext i16 %156 to i32
  %158 = load i16, i16* @prgpddualproc__rgpd_fdi_sts_mjr, align 2
  %159 = zext i16 %158 to i32
  %160 = call zeroext i16 @obclib__bit_or(i16 zeroext %158, i16 zeroext %156)
  store i16 %160, i16* @prgpddualproc__rgpd_fdi_sts_mjr, align 2
  %161 = load i16, i16* @prgpddualproc__isolnsts_movavgtm3, align 2
  %162 = zext i16 %161 to i32
  %163 = call zeroext i16 @obclib__ushift_left(i16 zeroext %161, i16 zeroext 4)
  %164 = zext i16 %163 to i32
  %165 = load i16, i16* @prgpddualproc__rgpd_fdi_sts_mjr, align 2
  %166 = zext i16 %165 to i32
  %167 = call zeroext i16 @obclib__bit_or(i16 zeroext %165, i16 zeroext %163)
  store i16 %167, i16* @prgpddualproc__rgpd_fdi_sts_mjr, align 2
  %168 = load i16, i16* @prgpddualproc__bothrgpd_nok1, align 2
  %169 = icmp eq i16 %168, -21846
  br i1 %169, label %"26", label %"27"

"26":                                             ; preds = %"25"
  %170 = zext i16 %167 to i32
  %171 = call zeroext i16 @obclib__bit_or(i16 zeroext %167, i16 zeroext 4096)
  store i16 %171, i16* @prgpddualproc__rgpd_fdi_sts_mjr, align 2
  br label %"27"

"27":                                             ; preds = %"26", %"25"
  %172 = load i16, i16* @prgpddualproc__bothrgpd_nok2, align 2
  %173 = icmp eq i16 %172, -21846
  br i1 %173, label %"28", label %"29"

"28":                                             ; preds = %"27"
  %174 = load i16, i16* @prgpddualproc__rgpd_fdi_sts_mjr, align 2
  %175 = zext i16 %174 to i32
  %176 = call zeroext i16 @obclib__bit_or(i16 zeroext %174, i16 zeroext 8192)
  store i16 %176, i16* @prgpddualproc__rgpd_fdi_sts_mjr, align 2
  br label %"29"

"29":                                             ; preds = %"28", %"27"
  %177 = load i16, i16* @prgpddualproc__bothrgpd_nok3, align 2
  %178 = icmp eq i16 %177, -21846
  br i1 %178, label %"30", label %"31"

"30":                                             ; preds = %"29"
  %179 = load i16, i16* @prgpddualproc__rgpd_fdi_sts_mjr, align 2
  %180 = zext i16 %179 to i32
  %181 = call zeroext i16 @obclib__bit_or(i16 zeroext %179, i16 zeroext 16384)
  store i16 %181, i16* @prgpddualproc__rgpd_fdi_sts_mjr, align 2
  br label %"31"

"31":                                             ; preds = %"30", %"29"
  %182 = load i16, i16* @prgpddualproc__minorid, align 2
  %183 = icmp eq i16 %182, 25
  br i1 %183, label %"32", label %return

"32":                                             ; preds = %"31"
  br label %"33"

"33":                                             ; preds = %"34", %"32"
  %184 = phi i16 [ %197, %"34" ], [ 1, %"32" ]
  %185 = icmp ule i16 %184, 3
  br i1 %185, label %"34", label %"35"

"34":                                             ; preds = %"33"
  %186 = zext i16 %184 to i64
  %187 = sub i64 %186, 1
  %188 = getelementptr inbounds float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__comp_rgpd1_ypr, i64 0, i64 0), i64 %187
  %189 = load float, float* %188, align 4
  %190 = getelementptr inbounds float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__comp_rgpd1_ypr_tm, i64 0, i64 0), i64 %187
  store float %189, float* %190, align 4
  %191 = getelementptr inbounds float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__comp_rgpd2_ypr, i64 0, i64 0), i64 %187
  %192 = load float, float* %191, align 4
  %193 = getelementptr inbounds float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__comp_rgpd2_ypr_tm, i64 0, i64 0), i64 %187
  store float %192, float* %193, align 4
  %194 = getelementptr inbounds float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__maxresrgpdmjrfdi, i64 0, i64 0), i64 %187
  %195 = load float, float* %194, align 4
  %196 = getelementptr inbounds float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__maxresrgpd_tm, i64 0, i64 0), i64 %187
  store float %195, float* %196, align 4
  store float 0.000000e+00, float* %194, align 4
  %197 = add i16 %184, 1
  br label %"33"

"35":                                             ; preds = %"33"
  %198 = load i16, i16* @prgpddualproc__rgpdsts_cochar_mjr, align 2
  store i16 %198, i16* @prgpddualproc__rgpdsts_cochar_mjrtm, align 2
  %199 = load i16, i16* @prgpddualproc__rgpd_fdi_sts_mjr, align 2
  store i16 %199, i16* @prgpddualproc__rgpd_fdi_sts_mjr_tm, align 2
  store i16 0, i16* @prgpddualproc__rgpdsts_cochar_mjr, align 2
  store i16 0, i16* @prgpddualproc__rgpd_fdi_sts_mjr, align 2
  br label %return

return:                                           ; preds = %"35", %"31"
  ret void
}

; Function Attrs: uwtable
define internal void @prgpddualproc__rhardcheck() local_unnamed_addr #0 align 2 {
entry:
  store i16 0, i16* @prgpddualproc__isolnsts_hardtm1, align 2
  store i16 0, i16* @prgpddualproc__indhardthreshviol1, align 2
  %0 = load i16, i16* @prgpddualproc__flg2indhardschedule1, align 2
  %1 = icmp eq i16 %0, -21846
  br i1 %1, label %"3", label %"12"

"3":                                              ; preds = %entry
  %2 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__comp_rgpd1_ypr, i64 0, i64 0), align 4
  %3 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__comp_rgpd2_ypr, i64 0, i64 0), align 4
  %4 = fsub float %2, %3
  store float %4, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__hardres, i64 0, i64 0), align 4
  %5 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__comp_rgpd1_ypr, i64 0, i64 0), align 4
  %6 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__resins_ypr, i64 0, i64 0), align 4
  %7 = fsub float %5, %6
  store float %7, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__hardrgpd1_res, i64 0, i64 0), align 4
  %8 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__comp_rgpd2_ypr, i64 0, i64 0), align 4
  %9 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__resins_ypr, i64 0, i64 0), align 4
  %10 = fsub float %8, %9
  store float %10, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__hardrgpd2_res, i64 0, i64 0), align 4
  %11 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__hardres, i64 0, i64 0), align 4
  %12 = call float @fabsf(float %11) #3
  %13 = fcmp ogt float %12, 2.000000e+00
  br i1 %13, label %"4", label %"10"

"4":                                              ; preds = %"3"
  store i16 -21846, i16* @prgpddualproc__flg2retnprevdata_ypr1, align 2
  store i16 256, i16* @prgpddualproc__indhardthreshviol1, align 2
  store i16 128, i16* @prgpddualproc__selctionsrc_ypr1, align 2
  %14 = load i16, i16* @prgpddualproc__errcnthardthresviol1, align 2
  %15 = add i16 %14, 1
  store i16 %15, i16* @prgpddualproc__errcnthardthresviol1, align 2
  %16 = icmp ugt i16 %15, 2
  br i1 %16, label %"5", label %"12"

"5":                                              ; preds = %"4"
  store i16 192, i16* @prgpddualproc__selctionsrc_ypr1, align 2
  store i16 21845, i16* @prgpddualproc__flg2retnprevdata_ypr1, align 2
  %17 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__hardrgpd1_res, i64 0, i64 0), align 4
  %18 = call float @fabsf(float %17) #3
  %19 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__hardrgpd2_res, i64 0, i64 0), align 4
  %20 = call float @fabsf(float %19) #3
  %21 = fcmp ogt float %18, %20
  br i1 %21, label %"6", label %"8"

"6":                                              ; preds = %"5"
  store i16 2, i16* @prgpddualproc__selchid_ypr1, align 2
  store i16 1, i16* @prgpddualproc__isolnsts_hardtm1, align 2
  %22 = load i16, i16* @prgpddualproc__rgpd1harderrcntr1, align 2
  %23 = add i16 %22, 1
  store i16 %23, i16* @prgpddualproc__rgpd1harderrcntr1, align 2
  store i16 0, i16* @prgpddualproc__rgpd2harderrcntr1, align 2
  %24 = load i16, i16* @prgpddualproc__rgpd1harderrcntr1, align 2
  %25 = icmp ugt i16 %24, 14
  br i1 %25, label %"7", label %"12"

"7":                                              ; preds = %"6"
  store i16 1, i16* @prgpddualproc__prmfailflg_parity1, align 2
  store i16 1, i16* @prgpddualproc__prmfailparitytm1, align 2
  br label %"12"

"8":                                              ; preds = %"5"
  store i16 1, i16* @prgpddualproc__selchid_ypr1, align 2
  store i16 16, i16* @prgpddualproc__isolnsts_hardtm1, align 2
  store i16 0, i16* @prgpddualproc__rgpd1harderrcntr1, align 2
  %26 = load i16, i16* @prgpddualproc__rgpd2harderrcntr1, align 2
  %27 = add i16 %26, 1
  store i16 %27, i16* @prgpddualproc__rgpd2harderrcntr1, align 2
  %28 = icmp ugt i16 %27, 14
  br i1 %28, label %"9", label %"12"

"9":                                              ; preds = %"8"
  store i16 2, i16* @prgpddualproc__prmfailflg_parity1, align 2
  store i16 16, i16* @prgpddualproc__prmfailparitytm1, align 2
  br label %"12"

"10":                                             ; preds = %"3"
  store i16 0, i16* @prgpddualproc__rgpd1harderrcntr1, align 2
  store i16 0, i16* @prgpddualproc__rgpd2harderrcntr1, align 2
  store i16 0, i16* @prgpddualproc__errcnthardthresviol1, align 2
  br label %"12"

"12":                                             ; preds = %"10", %"9", %"8", %"7", %"6", %"4", %entry
  store i16 0, i16* @prgpddualproc__isolnsts_hardtm2, align 2
  store i16 0, i16* @prgpddualproc__indhardthreshviol2, align 2
  %29 = load i16, i16* @prgpddualproc__flg2indhardschedule2, align 2
  %30 = icmp eq i16 %29, -21846
  br i1 %30, label %"13", label %"22"

"13":                                             ; preds = %"12"
  %31 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__comp_rgpd1_ypr, i64 0, i64 1), align 4
  %32 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__comp_rgpd2_ypr, i64 0, i64 1), align 4
  %33 = fsub float %31, %32
  store float %33, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__hardres, i64 0, i64 1), align 4
  %34 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__comp_rgpd1_ypr, i64 0, i64 1), align 4
  %35 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__resins_ypr, i64 0, i64 1), align 4
  %36 = fsub float %34, %35
  store float %36, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__hardrgpd1_res, i64 0, i64 1), align 4
  %37 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__comp_rgpd2_ypr, i64 0, i64 1), align 4
  %38 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__resins_ypr, i64 0, i64 1), align 4
  %39 = fsub float %37, %38
  store float %39, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__hardrgpd2_res, i64 0, i64 1), align 4
  %40 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__hardres, i64 0, i64 1), align 4
  %41 = call float @fabsf(float %40) #3
  %42 = fcmp ogt float %41, 2.000000e+00
  br i1 %42, label %"14", label %"20"

"14":                                             ; preds = %"13"
  store i16 -21846, i16* @prgpddualproc__flg2retnprevdata_ypr2, align 2
  store i16 256, i16* @prgpddualproc__indhardthreshviol2, align 2
  store i16 128, i16* @prgpddualproc__selctionsrc_ypr2, align 2
  %43 = load i16, i16* @prgpddualproc__errcnthardthresviol2, align 2
  %44 = add i16 %43, 1
  store i16 %44, i16* @prgpddualproc__errcnthardthresviol2, align 2
  %45 = icmp ugt i16 %44, 2
  br i1 %45, label %"15", label %"22"

"15":                                             ; preds = %"14"
  store i16 192, i16* @prgpddualproc__selctionsrc_ypr2, align 2
  store i16 21845, i16* @prgpddualproc__flg2retnprevdata_ypr2, align 2
  %46 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__hardrgpd1_res, i64 0, i64 1), align 4
  %47 = call float @fabsf(float %46) #3
  %48 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__hardrgpd2_res, i64 0, i64 1), align 4
  %49 = call float @fabsf(float %48) #3
  %50 = fcmp ogt float %47, %49
  br i1 %50, label %"16", label %"18"

"16":                                             ; preds = %"15"
  store i16 2, i16* @prgpddualproc__selchid_ypr2, align 2
  store i16 1, i16* @prgpddualproc__isolnsts_hardtm2, align 2
  %51 = load i16, i16* @prgpddualproc__rgpd1harderrcntr2, align 2
  %52 = add i16 %51, 1
  store i16 %52, i16* @prgpddualproc__rgpd1harderrcntr2, align 2
  store i16 0, i16* @prgpddualproc__rgpd2harderrcntr2, align 2
  %53 = load i16, i16* @prgpddualproc__rgpd1harderrcntr2, align 2
  %54 = icmp ugt i16 %53, 14
  br i1 %54, label %"17", label %"22"

"17":                                             ; preds = %"16"
  store i16 1, i16* @prgpddualproc__prmfailflg_parity2, align 2
  store i16 1, i16* @prgpddualproc__prmfailparitytm2, align 2
  br label %"22"

"18":                                             ; preds = %"15"
  store i16 1, i16* @prgpddualproc__selchid_ypr2, align 2
  store i16 16, i16* @prgpddualproc__isolnsts_hardtm2, align 2
  store i16 0, i16* @prgpddualproc__rgpd1harderrcntr2, align 2
  %55 = load i16, i16* @prgpddualproc__rgpd2harderrcntr2, align 2
  %56 = add i16 %55, 1
  store i16 %56, i16* @prgpddualproc__rgpd2harderrcntr2, align 2
  %57 = icmp ugt i16 %56, 14
  br i1 %57, label %"19", label %"22"

"19":                                             ; preds = %"18"
  store i16 2, i16* @prgpddualproc__prmfailflg_parity2, align 2
  store i16 16, i16* @prgpddualproc__prmfailparitytm2, align 2
  br label %"22"

"20":                                             ; preds = %"13"
  store i16 0, i16* @prgpddualproc__rgpd1harderrcntr2, align 2
  store i16 0, i16* @prgpddualproc__rgpd2harderrcntr2, align 2
  store i16 0, i16* @prgpddualproc__errcnthardthresviol2, align 2
  br label %"22"

"22":                                             ; preds = %"20", %"19", %"18", %"17", %"16", %"14", %"12"
  store i16 0, i16* @prgpddualproc__isolnsts_hardtm3, align 2
  store i16 0, i16* @prgpddualproc__indhardthreshviol3, align 2
  %58 = load i16, i16* @prgpddualproc__flg2indhardschedule3, align 2
  %59 = icmp eq i16 %58, -21846
  br i1 %59, label %"23", label %"32"

"23":                                             ; preds = %"22"
  %60 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__comp_rgpd1_ypr, i64 0, i64 2), align 4
  %61 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__comp_rgpd2_ypr, i64 0, i64 2), align 4
  %62 = fsub float %60, %61
  store float %62, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__hardres, i64 0, i64 2), align 4
  %63 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__comp_rgpd1_ypr, i64 0, i64 2), align 4
  %64 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__resins_ypr, i64 0, i64 2), align 4
  %65 = fsub float %63, %64
  store float %65, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__hardrgpd1_res, i64 0, i64 2), align 4
  %66 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__comp_rgpd2_ypr, i64 0, i64 2), align 4
  %67 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__resins_ypr, i64 0, i64 2), align 4
  %68 = fsub float %66, %67
  store float %68, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__hardrgpd2_res, i64 0, i64 2), align 4
  %69 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__hardres, i64 0, i64 2), align 4
  %70 = call float @fabsf(float %69) #3
  %71 = fcmp ogt float %70, 2.000000e+00
  br i1 %71, label %"24", label %"30"

"24":                                             ; preds = %"23"
  store i16 -21846, i16* @prgpddualproc__flg2retnprevdata_ypr3, align 2
  store i16 256, i16* @prgpddualproc__indhardthreshviol3, align 2
  store i16 128, i16* @prgpddualproc__selctionsrc_ypr3, align 2
  %72 = load i16, i16* @prgpddualproc__errcnthardthresviol3, align 2
  %73 = add i16 %72, 1
  store i16 %73, i16* @prgpddualproc__errcnthardthresviol3, align 2
  %74 = icmp ugt i16 %73, 2
  br i1 %74, label %"25", label %"32"

"25":                                             ; preds = %"24"
  store i16 192, i16* @prgpddualproc__selctionsrc_ypr3, align 2
  store i16 21845, i16* @prgpddualproc__flg2retnprevdata_ypr3, align 2
  %75 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__hardrgpd1_res, i64 0, i64 2), align 4
  %76 = call float @fabsf(float %75) #3
  %77 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__hardrgpd2_res, i64 0, i64 2), align 4
  %78 = call float @fabsf(float %77) #3
  %79 = fcmp ogt float %76, %78
  br i1 %79, label %"26", label %"28"

"26":                                             ; preds = %"25"
  store i16 2, i16* @prgpddualproc__selchid_ypr3, align 2
  store i16 1, i16* @prgpddualproc__isolnsts_hardtm3, align 2
  %80 = load i16, i16* @prgpddualproc__rgpd1harderrcntr3, align 2
  %81 = add i16 %80, 1
  store i16 %81, i16* @prgpddualproc__rgpd1harderrcntr3, align 2
  store i16 0, i16* @prgpddualproc__rgpd2harderrcntr3, align 2
  %82 = load i16, i16* @prgpddualproc__rgpd1harderrcntr3, align 2
  %83 = icmp ugt i16 %82, 14
  br i1 %83, label %"27", label %"32"

"27":                                             ; preds = %"26"
  store i16 1, i16* @prgpddualproc__prmfailflg_parity3, align 2
  store i16 1, i16* @prgpddualproc__prmfailparitytm3, align 2
  br label %"32"

"28":                                             ; preds = %"25"
  store i16 1, i16* @prgpddualproc__selchid_ypr3, align 2
  store i16 16, i16* @prgpddualproc__isolnsts_hardtm3, align 2
  store i16 0, i16* @prgpddualproc__rgpd1harderrcntr3, align 2
  %84 = load i16, i16* @prgpddualproc__rgpd2harderrcntr3, align 2
  %85 = add i16 %84, 1
  store i16 %85, i16* @prgpddualproc__rgpd2harderrcntr3, align 2
  %86 = icmp ugt i16 %85, 14
  br i1 %86, label %"29", label %"32"

"29":                                             ; preds = %"28"
  store i16 2, i16* @prgpddualproc__prmfailflg_parity3, align 2
  store i16 16, i16* @prgpddualproc__prmfailparitytm3, align 2
  br label %"32"

"30":                                             ; preds = %"23"
  store i16 0, i16* @prgpddualproc__rgpd1harderrcntr3, align 2
  store i16 0, i16* @prgpddualproc__rgpd2harderrcntr3, align 2
  store i16 0, i16* @prgpddualproc__errcnthardthresviol3, align 2
  br label %"32"

"32":                                             ; preds = %"30", %"29", %"28", %"27", %"26", %"24", %"22"
  call void @prgpddualproc__rmovavgcheck() #0
  ret void
}

declare float @fabsf(float)

; Function Attrs: uwtable
define internal void @prgpddualproc__rmovavgcheck() local_unnamed_addr #0 align 2 {
entry:
  store i16 0, i16* @prgpddualproc__isolnsts_movavgtm1, align 2
  %0 = load i16, i16* @prgpddualproc__flg2indhardschedule1, align 2
  %1 = icmp eq i16 %0, -21846
  %2 = load i16, i16* @prgpddualproc__indhardthreshviol1, align 2
  %3 = icmp eq i16 %2, 0
  %or.cond = and i1 %1, %3
  br i1 %or.cond, label %"4", label %"36"

"4":                                              ; preds = %entry
  %4 = load i16, i16* @prgpddualproc__storgeindex1, align 2
  %5 = add i16 %4, 1
  store i16 %5, i16* @prgpddualproc__storgeindex1, align 2
  %6 = load i16, i16* @prgpddualproc__blocksizeu16, align 2
  %7 = icmp ugt i16 %5, %6
  %spec.store.select = select i1 %7, i16 1, i16 %5
  store i16 %spec.store.select, i16* @prgpddualproc__storgeindex1, align 2
  %8 = load i16, i16* @prgpddualproc__storgeindexres1, align 2
  %9 = add i16 %8, 1
  store i16 %9, i16* @prgpddualproc__storgeindexres1, align 2
  %10 = load i16, i16* @prgpddualproc__blocksizeu16res, align 2
  %11 = icmp ugt i16 %9, %10
  %spec.store.select17 = select i1 %11, i16 1, i16 %9
  store i16 %spec.store.select17, i16* @prgpddualproc__storgeindexres1, align 2
  %12 = load i16, i16* @prgpddualproc__storgeindex1, align 2
  %13 = icmp eq i16 %12, 0
  %14 = icmp ugt i16 %12, 100
  %or.cond2 = or i1 %13, %14
  br i1 %or.cond2, label %"10", label %"11"

"10":                                             ; preds = %"4"
  call void @__gnat_rcheck_CE_Index_Check(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.cst.1, i64 0, i64 0), i32 350) #1
  unreachable

"11":                                             ; preds = %"4"
  %15 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__r0acc, i64 0, i64 0), align 4
  %16 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__hardres, i64 0, i64 0), align 4
  %17 = fadd float %15, %16
  %18 = zext i16 %12 to i64
  %19 = sub i64 %18, 1
  %20 = getelementptr inbounds float, float* getelementptr inbounds ([5 x [100 x float]], [5 x [100 x float]]* @prgpddualproc__storrgpd12, i64 0, i64 0, i64 0), i64 %19
  %21 = load float, float* %20, align 4
  %22 = fsub float %17, %21
  store float %22, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__r0acc, i64 0, i64 0), align 4
  %23 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__hardres, i64 0, i64 0), align 4
  store float %23, float* %20, align 4
  %24 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__r0acc, i64 0, i64 0), align 4
  %25 = call float @fabsf(float %24) #3
  %26 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__maxresrgpdmjrfdi, i64 0, i64 0), align 4
  %27 = fcmp ogt float %25, %26
  br i1 %27, label %"15", label %"16"

"15":                                             ; preds = %"11"
  store float %25, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__maxresrgpdmjrfdi, i64 0, i64 0), align 4
  br label %"16"

"16":                                             ; preds = %"15", %"11"
  %28 = load i16, i16* @prgpddualproc__storgeindexres1, align 2
  %29 = icmp eq i16 %28, 0
  %30 = icmp ugt i16 %28, 100
  %or.cond3 = or i1 %29, %30
  br i1 %or.cond3, label %"18", label %"19"

"18":                                             ; preds = %"16"
  call void @__gnat_rcheck_CE_Index_Check(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.cst.1, i64 0, i64 0), i32 361) #1
  unreachable

"19":                                             ; preds = %"16"
  %31 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__rgpd1_resacc, i64 0, i64 0), align 4
  %32 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__hardrgpd1_res, i64 0, i64 0), align 4
  %33 = fadd float %31, %32
  %34 = zext i16 %28 to i64
  %35 = sub i64 %34, 1
  %36 = getelementptr inbounds float, float* getelementptr inbounds ([5 x [100 x float]], [5 x [100 x float]]* @prgpddualproc__storrgpd1res, i64 0, i64 0, i64 0), i64 %35
  %37 = load float, float* %36, align 4
  %38 = fsub float %33, %37
  store float %38, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__rgpd1_resacc, i64 0, i64 0), align 4
  %39 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__hardrgpd1_res, i64 0, i64 0), align 4
  store float %39, float* %36, align 4
  br i1 false, label %"24", label %"25"

"24":                                             ; preds = %"19"
  call void @__gnat_rcheck_CE_Index_Check(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.cst.1, i64 0, i64 0), i32 364) #1
  unreachable

"25":                                             ; preds = %"19"
  %40 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__rgpd2_resacc, i64 0, i64 0), align 4
  %41 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__hardrgpd2_res, i64 0, i64 0), align 4
  %42 = fadd float %40, %41
  %43 = getelementptr inbounds float, float* getelementptr inbounds ([5 x [100 x float]], [5 x [100 x float]]* @prgpddualproc__storrgpd2res, i64 0, i64 0, i64 0), i64 %35
  %44 = load float, float* %43, align 4
  %45 = fsub float %42, %44
  store float %45, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__rgpd2_resacc, i64 0, i64 0), align 4
  %46 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__hardrgpd2_res, i64 0, i64 0), align 4
  store float %46, float* %43, align 4
  %47 = fcmp ogt float %25, 1.200000e+01
  br i1 %47, label %"29", label %"34"

"29":                                             ; preds = %"25"
  store i16 64, i16* @prgpddualproc__selctionsrc_ypr1, align 2
  %48 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__rgpd1_resacc, i64 0, i64 0), align 4
  %49 = call float @fabsf(float %48) #3
  %50 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__rgpd2_resacc, i64 0, i64 0), align 4
  %51 = call float @fabsf(float %50) #3
  %52 = fcmp ogt float %49, %51
  br i1 %52, label %"30", label %"32"

"30":                                             ; preds = %"29"
  store i16 2, i16* @prgpddualproc__selchid_ypr1, align 2
  store i16 64, i16* @prgpddualproc__isolnsts_movavgtm1, align 2
  %53 = load i16, i16* @prgpddualproc__rgpd1movavgerrcntr1, align 2
  %54 = add i16 %53, 1
  store i16 %54, i16* @prgpddualproc__rgpd1movavgerrcntr1, align 2
  store i16 0, i16* @prgpddualproc__rgpd2movavgerrcntr1, align 2
  %55 = load i16, i16* @prgpddualproc__rgpd1movavgerrcntr1, align 2
  %56 = icmp ugt i16 %55, 149
  br i1 %56, label %"31", label %"36"

"31":                                             ; preds = %"30"
  store i16 1, i16* @prgpddualproc__prmfailflg_parity1, align 2
  store i16 1, i16* @prgpddualproc__prmfailparitytm1, align 2
  br label %"36"

"32":                                             ; preds = %"29"
  store i16 1, i16* @prgpddualproc__selchid_ypr1, align 2
  store i16 128, i16* @prgpddualproc__isolnsts_movavgtm1, align 2
  store i16 0, i16* @prgpddualproc__rgpd1movavgerrcntr1, align 2
  %57 = load i16, i16* @prgpddualproc__rgpd2movavgerrcntr1, align 2
  %58 = add i16 %57, 1
  store i16 %58, i16* @prgpddualproc__rgpd2movavgerrcntr1, align 2
  %59 = icmp ugt i16 %58, 149
  br i1 %59, label %"33", label %"36"

"33":                                             ; preds = %"32"
  store i16 2, i16* @prgpddualproc__prmfailflg_parity1, align 2
  store i16 16, i16* @prgpddualproc__prmfailparitytm1, align 2
  br label %"36"

"34":                                             ; preds = %"25"
  store i16 0, i16* @prgpddualproc__rgpd1movavgerrcntr1, align 2
  store i16 0, i16* @prgpddualproc__rgpd2movavgerrcntr1, align 2
  store i16 0, i16* @prgpddualproc__selctionsrc_ypr1, align 2
  br label %"36"

"36":                                             ; preds = %"34", %"33", %"32", %"31", %"30", %entry
  store i16 0, i16* @prgpddualproc__isolnsts_movavgtm2, align 2
  %60 = load i16, i16* @prgpddualproc__flg2indhardschedule2, align 2
  %61 = icmp eq i16 %60, -21846
  %62 = load i16, i16* @prgpddualproc__indhardthreshviol2, align 2
  %63 = icmp eq i16 %62, 0
  %or.cond6 = and i1 %61, %63
  br i1 %or.cond6, label %"38", label %"70"

"38":                                             ; preds = %"36"
  %64 = load i16, i16* @prgpddualproc__storgeindex2, align 2
  %65 = add i16 %64, 1
  store i16 %65, i16* @prgpddualproc__storgeindex2, align 2
  %66 = load i16, i16* @prgpddualproc__blocksizeu16, align 2
  %67 = icmp ugt i16 %65, %66
  %spec.store.select7 = select i1 %67, i16 1, i16 %65
  store i16 %spec.store.select7, i16* @prgpddualproc__storgeindex2, align 2
  %68 = load i16, i16* @prgpddualproc__storgeindexres2, align 2
  %69 = add i16 %68, 1
  store i16 %69, i16* @prgpddualproc__storgeindexres2, align 2
  %70 = load i16, i16* @prgpddualproc__blocksizeu16res, align 2
  %71 = icmp ugt i16 %69, %70
  %spec.store.select18 = select i1 %71, i16 1, i16 %69
  store i16 %spec.store.select18, i16* @prgpddualproc__storgeindexres2, align 2
  %72 = load i16, i16* @prgpddualproc__storgeindex2, align 2
  %73 = icmp eq i16 %72, 0
  %74 = icmp ugt i16 %72, 100
  %or.cond8 = or i1 %73, %74
  br i1 %or.cond8, label %"44", label %"45"

"44":                                             ; preds = %"38"
  call void @__gnat_rcheck_CE_Index_Check(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.cst.1, i64 0, i64 0), i32 430) #1
  unreachable

"45":                                             ; preds = %"38"
  %75 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__r0acc, i64 0, i64 1), align 4
  %76 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__hardres, i64 0, i64 1), align 4
  %77 = fadd float %75, %76
  %78 = zext i16 %72 to i64
  %79 = sub i64 %78, 1
  %80 = getelementptr inbounds float, float* getelementptr inbounds ([5 x [100 x float]], [5 x [100 x float]]* @prgpddualproc__storrgpd12, i64 0, i64 1, i64 0), i64 %79
  %81 = load float, float* %80, align 4
  %82 = fsub float %77, %81
  store float %82, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__r0acc, i64 0, i64 1), align 4
  %83 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__hardres, i64 0, i64 1), align 4
  store float %83, float* %80, align 4
  %84 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__r0acc, i64 0, i64 1), align 4
  %85 = call float @fabsf(float %84) #3
  %86 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__maxresrgpdmjrfdi, i64 0, i64 1), align 4
  %87 = fcmp ogt float %85, %86
  br i1 %87, label %"49", label %"50"

"49":                                             ; preds = %"45"
  store float %85, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__maxresrgpdmjrfdi, i64 0, i64 1), align 4
  br label %"50"

"50":                                             ; preds = %"49", %"45"
  %88 = load i16, i16* @prgpddualproc__storgeindexres2, align 2
  %89 = icmp eq i16 %88, 0
  %90 = icmp ugt i16 %88, 100
  %or.cond9 = or i1 %89, %90
  br i1 %or.cond9, label %"52", label %"53"

"52":                                             ; preds = %"50"
  call void @__gnat_rcheck_CE_Index_Check(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.cst.1, i64 0, i64 0), i32 441) #1
  unreachable

"53":                                             ; preds = %"50"
  %91 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__rgpd1_resacc, i64 0, i64 1), align 4
  %92 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__hardrgpd1_res, i64 0, i64 1), align 4
  %93 = fadd float %91, %92
  %94 = zext i16 %88 to i64
  %95 = sub i64 %94, 1
  %96 = getelementptr inbounds float, float* getelementptr inbounds ([5 x [100 x float]], [5 x [100 x float]]* @prgpddualproc__storrgpd1res, i64 0, i64 1, i64 0), i64 %95
  %97 = load float, float* %96, align 4
  %98 = fsub float %93, %97
  store float %98, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__rgpd1_resacc, i64 0, i64 1), align 4
  %99 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__hardrgpd1_res, i64 0, i64 1), align 4
  store float %99, float* %96, align 4
  br i1 false, label %"58", label %"59"

"58":                                             ; preds = %"53"
  call void @__gnat_rcheck_CE_Index_Check(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.cst.1, i64 0, i64 0), i32 444) #1
  unreachable

"59":                                             ; preds = %"53"
  %100 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__rgpd2_resacc, i64 0, i64 1), align 4
  %101 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__hardrgpd2_res, i64 0, i64 1), align 4
  %102 = fadd float %100, %101
  %103 = getelementptr inbounds float, float* getelementptr inbounds ([5 x [100 x float]], [5 x [100 x float]]* @prgpddualproc__storrgpd2res, i64 0, i64 1, i64 0), i64 %95
  %104 = load float, float* %103, align 4
  %105 = fsub float %102, %104
  store float %105, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__rgpd2_resacc, i64 0, i64 1), align 4
  %106 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__hardrgpd2_res, i64 0, i64 1), align 4
  store float %106, float* %103, align 4
  %107 = fcmp ogt float %85, 1.200000e+01
  br i1 %107, label %"63", label %"68"

"63":                                             ; preds = %"59"
  store i16 64, i16* @prgpddualproc__selctionsrc_ypr2, align 2
  %108 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__rgpd1_resacc, i64 0, i64 1), align 4
  %109 = call float @fabsf(float %108) #3
  %110 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__rgpd2_resacc, i64 0, i64 1), align 4
  %111 = call float @fabsf(float %110) #3
  %112 = fcmp ogt float %109, %111
  br i1 %112, label %"64", label %"66"

"64":                                             ; preds = %"63"
  store i16 2, i16* @prgpddualproc__selchid_ypr2, align 2
  store i16 64, i16* @prgpddualproc__isolnsts_movavgtm2, align 2
  %113 = load i16, i16* @prgpddualproc__rgpd1movavgerrcntr2, align 2
  %114 = add i16 %113, 1
  store i16 %114, i16* @prgpddualproc__rgpd1movavgerrcntr2, align 2
  store i16 0, i16* @prgpddualproc__rgpd2movavgerrcntr2, align 2
  %115 = load i16, i16* @prgpddualproc__rgpd1movavgerrcntr2, align 2
  %116 = icmp ugt i16 %115, 149
  br i1 %116, label %"65", label %"70"

"65":                                             ; preds = %"64"
  store i16 1, i16* @prgpddualproc__prmfailflg_parity2, align 2
  store i16 1, i16* @prgpddualproc__prmfailparitytm2, align 2
  br label %"70"

"66":                                             ; preds = %"63"
  store i16 1, i16* @prgpddualproc__selchid_ypr2, align 2
  store i16 128, i16* @prgpddualproc__isolnsts_movavgtm2, align 2
  store i16 0, i16* @prgpddualproc__rgpd1movavgerrcntr2, align 2
  %117 = load i16, i16* @prgpddualproc__rgpd2movavgerrcntr2, align 2
  %118 = add i16 %117, 1
  store i16 %118, i16* @prgpddualproc__rgpd2movavgerrcntr2, align 2
  %119 = icmp ugt i16 %118, 149
  br i1 %119, label %"67", label %"70"

"67":                                             ; preds = %"66"
  store i16 2, i16* @prgpddualproc__prmfailflg_parity2, align 2
  store i16 16, i16* @prgpddualproc__prmfailparitytm2, align 2
  br label %"70"

"68":                                             ; preds = %"59"
  store i16 0, i16* @prgpddualproc__rgpd1movavgerrcntr2, align 2
  store i16 0, i16* @prgpddualproc__rgpd2movavgerrcntr2, align 2
  store i16 0, i16* @prgpddualproc__selctionsrc_ypr2, align 2
  br label %"70"

"70":                                             ; preds = %"68", %"67", %"66", %"65", %"64", %"36"
  store i16 0, i16* @prgpddualproc__isolnsts_movavgtm3, align 2
  %120 = load i16, i16* @prgpddualproc__flg2indhardschedule3, align 2
  %121 = icmp eq i16 %120, -21846
  %122 = load i16, i16* @prgpddualproc__indhardthreshviol3, align 2
  %123 = icmp eq i16 %122, 0
  %or.cond12 = and i1 %121, %123
  br i1 %or.cond12, label %"72", label %return

"72":                                             ; preds = %"70"
  %124 = load i16, i16* @prgpddualproc__storgeindex3, align 2
  %125 = add i16 %124, 1
  store i16 %125, i16* @prgpddualproc__storgeindex3, align 2
  %126 = load i16, i16* @prgpddualproc__blocksizeu16, align 2
  %127 = icmp ugt i16 %125, %126
  %spec.store.select13 = select i1 %127, i16 1, i16 %125
  store i16 %spec.store.select13, i16* @prgpddualproc__storgeindex3, align 2
  %128 = load i16, i16* @prgpddualproc__storgeindexres3, align 2
  %129 = add i16 %128, 1
  store i16 %129, i16* @prgpddualproc__storgeindexres3, align 2
  %130 = load i16, i16* @prgpddualproc__blocksizeu16res, align 2
  %131 = icmp ugt i16 %129, %130
  %spec.store.select19 = select i1 %131, i16 1, i16 %129
  store i16 %spec.store.select19, i16* @prgpddualproc__storgeindexres3, align 2
  %132 = load i16, i16* @prgpddualproc__storgeindex3, align 2
  %133 = icmp eq i16 %132, 0
  %134 = icmp ugt i16 %132, 100
  %or.cond14 = or i1 %133, %134
  br i1 %or.cond14, label %"78", label %"79"

"78":                                             ; preds = %"72"
  call void @__gnat_rcheck_CE_Index_Check(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.cst.1, i64 0, i64 0), i32 510) #1
  unreachable

"79":                                             ; preds = %"72"
  %135 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__r0acc, i64 0, i64 2), align 4
  %136 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__hardres, i64 0, i64 2), align 4
  %137 = fadd float %135, %136
  %138 = zext i16 %132 to i64
  %139 = sub i64 %138, 1
  %140 = getelementptr inbounds float, float* getelementptr inbounds ([5 x [100 x float]], [5 x [100 x float]]* @prgpddualproc__storrgpd12, i64 0, i64 2, i64 0), i64 %139
  %141 = load float, float* %140, align 4
  %142 = fsub float %137, %141
  store float %142, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__r0acc, i64 0, i64 2), align 4
  %143 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__hardres, i64 0, i64 2), align 4
  store float %143, float* %140, align 4
  %144 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__r0acc, i64 0, i64 2), align 4
  %145 = call float @fabsf(float %144) #3
  %146 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__maxresrgpdmjrfdi, i64 0, i64 2), align 4
  %147 = fcmp ogt float %145, %146
  br i1 %147, label %"83", label %"84"

"83":                                             ; preds = %"79"
  store float %145, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__maxresrgpdmjrfdi, i64 0, i64 2), align 4
  br label %"84"

"84":                                             ; preds = %"83", %"79"
  %148 = load i16, i16* @prgpddualproc__storgeindexres3, align 2
  %149 = icmp eq i16 %148, 0
  %150 = icmp ugt i16 %148, 100
  %or.cond15 = or i1 %149, %150
  br i1 %or.cond15, label %"86", label %"87"

"86":                                             ; preds = %"84"
  call void @__gnat_rcheck_CE_Index_Check(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.cst.1, i64 0, i64 0), i32 521) #1
  unreachable

"87":                                             ; preds = %"84"
  %151 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__rgpd1_resacc, i64 0, i64 2), align 4
  %152 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__hardrgpd1_res, i64 0, i64 2), align 4
  %153 = fadd float %151, %152
  %154 = zext i16 %148 to i64
  %155 = sub i64 %154, 1
  %156 = getelementptr inbounds float, float* getelementptr inbounds ([5 x [100 x float]], [5 x [100 x float]]* @prgpddualproc__storrgpd1res, i64 0, i64 2, i64 0), i64 %155
  %157 = load float, float* %156, align 4
  %158 = fsub float %153, %157
  store float %158, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__rgpd1_resacc, i64 0, i64 2), align 4
  %159 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__hardrgpd1_res, i64 0, i64 2), align 4
  store float %159, float* %156, align 4
  br i1 false, label %"92", label %"93"

"92":                                             ; preds = %"87"
  call void @__gnat_rcheck_CE_Index_Check(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.cst.1, i64 0, i64 0), i32 524) #1
  unreachable

"93":                                             ; preds = %"87"
  %160 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__rgpd2_resacc, i64 0, i64 2), align 4
  %161 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__hardrgpd2_res, i64 0, i64 2), align 4
  %162 = fadd float %160, %161
  %163 = getelementptr inbounds float, float* getelementptr inbounds ([5 x [100 x float]], [5 x [100 x float]]* @prgpddualproc__storrgpd2res, i64 0, i64 2, i64 0), i64 %155
  %164 = load float, float* %163, align 4
  %165 = fsub float %162, %164
  store float %165, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__rgpd2_resacc, i64 0, i64 2), align 4
  %166 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__hardrgpd2_res, i64 0, i64 2), align 4
  store float %166, float* %163, align 4
  %167 = fcmp ogt float %145, 1.200000e+01
  br i1 %167, label %"97", label %"102"

"97":                                             ; preds = %"93"
  store i16 64, i16* @prgpddualproc__selctionsrc_ypr3, align 2
  %168 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__rgpd1_resacc, i64 0, i64 2), align 4
  %169 = call float @fabsf(float %168) #3
  %170 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @prgpddualproc__rgpd2_resacc, i64 0, i64 2), align 4
  %171 = call float @fabsf(float %170) #3
  %172 = fcmp ogt float %169, %171
  br i1 %172, label %"98", label %"100"

"98":                                             ; preds = %"97"
  store i16 2, i16* @prgpddualproc__selchid_ypr3, align 2
  store i16 64, i16* @prgpddualproc__isolnsts_movavgtm3, align 2
  %173 = load i16, i16* @prgpddualproc__rgpd1movavgerrcntr3, align 2
  %174 = add i16 %173, 1
  store i16 %174, i16* @prgpddualproc__rgpd1movavgerrcntr3, align 2
  store i16 0, i16* @prgpddualproc__rgpd2movavgerrcntr3, align 2
  %175 = load i16, i16* @prgpddualproc__rgpd1movavgerrcntr3, align 2
  %176 = icmp ugt i16 %175, 149
  br i1 %176, label %"99", label %return

"99":                                             ; preds = %"98"
  store i16 1, i16* @prgpddualproc__prmfailflg_parity3, align 2
  store i16 1, i16* @prgpddualproc__prmfailparitytm3, align 2
  br label %return

"100":                                            ; preds = %"97"
  store i16 1, i16* @prgpddualproc__selchid_ypr3, align 2
  store i16 128, i16* @prgpddualproc__isolnsts_movavgtm3, align 2
  store i16 0, i16* @prgpddualproc__rgpd1movavgerrcntr3, align 2
  %177 = load i16, i16* @prgpddualproc__rgpd2movavgerrcntr3, align 2
  %178 = add i16 %177, 1
  store i16 %178, i16* @prgpddualproc__rgpd2movavgerrcntr3, align 2
  %179 = icmp ugt i16 %178, 149
  br i1 %179, label %"101", label %return

"101":                                            ; preds = %"100"
  store i16 2, i16* @prgpddualproc__prmfailflg_parity3, align 2
  store i16 16, i16* @prgpddualproc__prmfailparitytm3, align 2
  br label %return

"102":                                            ; preds = %"93"
  store i16 0, i16* @prgpddualproc__rgpd1movavgerrcntr3, align 2
  store i16 0, i16* @prgpddualproc__rgpd2movavgerrcntr3, align 2
  store i16 0, i16* @prgpddualproc__selctionsrc_ypr3, align 2
  br label %return

return:                                           ; preds = %"102", %"101", %"100", %"99", %"98", %"70"
  ret void
}

; Function Attrs: noreturn
declare void @__gnat_rcheck_CE_Index_Check(i8*, i32) #1

attributes #0 = { uwtable "no-frame-pointer-elim-non-leaf"="true" }
attributes #1 = { noreturn }
attributes #2 = { inlinehint uwtable "no-frame-pointer-elim-non-leaf"="true" }
attributes #3 = { nounwind readnone }

!llvm.module.flags = !{!0}

!0 = !{i32 7, !"PIE Level", i32 2}
