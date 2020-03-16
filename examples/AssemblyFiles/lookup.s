; ModuleID = '../Test/Examples/lookup.adb'
source_filename = "../Test/Examples/lookup.adb"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64--linux-gnu"

module asm "\09.ident\09\22GCC: (Ubuntu 8.3.0-26ubuntu1~18.04) 8.3.0 LLVM: 6.0.0\22"

@lookup__iterationcount = unnamed_addr global i16 undef
@lookup__distance_incr = unnamed_addr global float undef
@lookup__quaternion_prev = local_unnamed_addr global [5 x float] undef, align 16
@lookup_E = unnamed_addr global i16 0
@.cst = private local_unnamed_addr constant [11 x i8] c"lookup.adb\00", align 8
@lookup__distance = internal unnamed_addr constant [60 x float] [float 0x40356E1480000000, float 0x405C63D700000000, float 0x40609D70A0000000, float 0x40625A3D80000000, float 0x4064975C20000000, float 0x40693F5C20000000, float 0x406EE051E0000000, float 0x4072C3D700000000, float 0x407608F5C0000000, float 0x4079D91EC0000000, float 0x407E59EB80000000, float 0x40818AB860000000, float 0x408455D700000000, float 0x408730B860000000, float 0x40896CE140000000, float 0x408A54E140000000, float 0x408DCB99A0000000, float 0x4090C1EB80000000, float 0x4092C6A3E0000000, float 0x4094FB1EC0000000, float 0x4097548520000000, float 0x4099CBA3E0000000, float 1.820500e+03, float 0x409F421EC0000000, float 0x40A111B860000000, float 0x40A29EDC20000000, float 0x40A5E35700000000, float 0x40A9696660000000, float 0x40AD388F60000000, float 0x40B09DA900000000, float 0x40B2B8C520000000, float 0x40B4F25EC0000000, float 0x40B740AB80000000, float 0x40B9A2C7A0000000, float 0x40BC22E140000000, float 0x40BEB5D1E0000000, float 0x40C0AC47A0000000, float 0x40C204D5C0000000, float 0x40C365F1E0000000, float 0x40C4CE2E20000000, float 0x40C6417700000000, float 0x40C7BAECC0000000, float 0x40C93EC7A0000000, float 0x40CAD095C0000000, float 0x40CC6B1EC0000000, float 0x40CE136280000000, float 0x40D052C860000000, float 0x40D1AD7AE0000000, float 0x40D3188E20000000, float 0x40D496ACC0000000, float 0x40D6275340000000, float 0x40D7CC33E0000000, float 0x40D9852E20000000, float 0x40DB5333E0000000, float 0x40DD33AF60000000, float 0x40DF2A5B80000000, float 0x40E09ABB80000000, float 0x40E1AA17A0000000, float 0x40E3E30A40000000, float 0x40E632DAE0000000], align 32
@lookup__rotangle = internal unnamed_addr constant [60 x float] [float 0.000000e+00, float 0x3F2CB5C340000000, float 0x3F2ABB6D20000000, float 0x3F49EDBCE0000000, float 0x3F46BA00C0000000, float 0x3F43945C60000000, float 0x3F42081540000000, float 0x3F3F6FDCE0000000, float 0x3F3C287FA0000000, float 0x3F39927840000000, float 0x3F36F4E420000000, float 0x3F34811660000000, float 0x3F3305EC20000000, float 0x3F3106B880000000, float 0x3F107314C0000000, float 0x3EFFEDDC20000000, float 0x3EFD5C3160000000, float 0x3EFB6388C0000000, float 0x3EF972EDC0000000, float 0x3EF88C1300000000, float 0x3EF4C5B4E0000000, float 0x3EF576DFC0000000, float 0x3EF50E2F20000000, float 0x3EF15A9B60000000, float 0x3EF1DB74C0000000, float 0x3EF0F9F860000000, float 0x3EF2DA7840000000, float 0x3EF4275460000000, float 0x3EF5138D80000000, float 0x3EF4148A00000000, float 0x3EF41F46C0000000, float 0x3EF1DB74C0000000, float 0x3EEFD054E0000000, float 0x3EED872480000000, float 0x3EEB68E720000000, float 0x3EEB58CC00000000, float 0x3EEB1DBDA0000000, float 0x3EED7C67A0000000, float 0x3EED8C82E0000000, float 0x3EEF9AA500000000, float 0x3EED5174A0000000, float 0x3EED8C82E0000000, float 0x3EED71AAE0000000, float 0x3EED872480000000, float 0x3EED56D300000000, float 0x3EED415960000000, float 0x3EE90F9B80000000, float 0x3EE3F702E0000000, float 0x3EE38644A0000000, float 0x3EE19858E0000000, float 0x3EE030A4C0000000, float 0x3EDD66EE20000000, float 0x3EDAE2AF60000000, float 0x3ED873EA40000000, float 0x3ED6255B60000000, float 0x3ED4376F80000000, float 0x3ED355F320000000, float 0x3ED09C0480000000, float 0x3ECD9C9E00000000, float 0x3ECC8571C0000000], align 32
@lookup__dircosl = internal unnamed_addr constant [60 x float] [float 0.000000e+00, float 0xBFE010B220000000, float 0xBFE010B220000000, float 0xBFBDFD9240000000, float 0xBFBBADE960000000, float 0xBFB8DEFC40000000, float 0xBFB60D4CE0000000, float 0xBFB2FAC460000000, float 0xBFB014E5A0000000, float 0xBFA9FC9540000000, float 0xBFA397E620000000, float 0xBF9ADF3E40000000, float 0xBF8DF14E40000000, float 0xBF727B4240000000, float 0xBF36189B20000000, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0xBFC5F81620000000, float 0xBFB7BBEEA0000000, float 0x3FA15D11E0000000, float 0x3FB60C32E0000000, float 0x3FAE297CA0000000, float 0x3FAFA6FE40000000, float 0x3FAEFDAFA0000000, float 0x3FB369B480000000, float 0x3FBB63B740000000, float 0x3FC1E982A0000000, float 0x3FC903B580000000, float 0x3FC9CCB860000000, float 0x3FC476E820000000, float 0x3FCAF711E0000000, float 0x3FC32CF960000000, float 0x3FB77CA780000000, float 0xBF808608C0000000, float 0xBFB22A7400000000, float 0xBFB20E9EA0000000, float 0xBFB99EE940000000, float 0xBFAE36FC20000000, float 0x3F8A8F5160000000, float 0x3FA4E299A0000000, float 0x3FA342B900000000, float 0x3F92DA1840000000, float 0x3F932D68C0000000, float 0x3F6E30AD20000000, float 0x3F92153420000000, float 0x3F87CC50E0000000, float 0x3F83A38F60000000, float 0x3F5BE4EDA0000000, float 0xBF9A91CF00000000, float 0xBF782BF8E0000000, float 0x3F66CBF460000000], align 32
@lookup__dircosm = internal unnamed_addr constant [60 x float] [float 0.000000e+00, float 0x3FEB668AA0000000, float 0x3FEB85ABE0000000, float 0x3FCAE5E860000000, float 0x3FCAEC5B80000000, float 0x3FCC3CBAA0000000, float 0x3FCC4C4360000000, float 0x3FCD758AA0000000, float 0x3FCD328E00000000, float 0x3FCD64F3C0000000, float 0x3FCD685540000000, float 0x3FCEBF3D60000000, float 0x3FCEBFD700000000, float 0x3FCE5B84E0000000, float 0x3FEF4F8F00000000, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 1.000000e+00, float 0x3FEFAF1780000000, float 0x3FEF874F20000000, float 1.000000e+00, float 0x3FEFB64E40000000, float 0x3FEFF9D7E0000000, float 1.000000e+00, float 0x3FEFF91BE0000000, float 1.000000e+00, float 0x3FEFA78420000000, float 0x3FEFB6B8C0000000, float 0x3FEF5B7580000000, float 0x3FEF651D20000000, float 0x3FEFA805A0000000, float 0x3FEF5C7780000000, float 0x3FEFAFA380000000, float 1.000000e+00, float 0x3FEFF793C0000000, float 0x3FEFADCE20000000, float 1.000000e+00, float 0x3FEFAD6680000000, float 1.000000e+00, float 0x3FEFF73260000000, float 0x3FEFF85D40000000, float 1.000000e+00, float 0x3FEFF5EB20000000, float 0x3FEFFD4CA0000000, float 1.000000e+00, float 0x3FEFF7A380000000, float 0x3FEFF78460000000, float 0x3FEFED04C0000000, float 1.000000e+00, float 0x3FEFF87E40000000, float 0x3FEFFFC7E0000000, float 1.000000e+00], align 32
@lookup__dircosn = internal unnamed_addr constant [60 x float] [float -1.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0x3FEF093EA0000000, float 0x3FEF079360000000, float 0x3FEF051CC0000000, float 0x3FEF06C020000000, float 0x3FEF0863A0000000, float 0x3FEF0105A0000000, float 0x3FEF0A0700000000, float 0x3FEF0BAA60000000, float 0x3FEF0863A0000000, float 0x3FEF0BAC00000000, float 0x3FEF0E25C0000000, float 0x3FC836B360000000, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0x3F5895C340000000, float 0x3F7079A7E0000000, float 0x3F720E7820000000, float 0x3F695D89A0000000, float 0x3F5A4A0320000000, float 0x3F36EDD840000000, float 0xBF4A5ACA20000000, float 0xBF60D524E0000000, float 0xBF6C924200000000, float 0xBF775A8CE0000000, float 0xBF8198A560000000, float 0xBF886B0B40000000, float 0xBF905D3540000000, float 0xBF953403A0000000, float 0xBF988C25C0000000, float 0xBF9B396B00000000, float 0xBF9CA1B220000000, float 0xBF9B922960000000, float 0xBF99965C20000000, float 0xBF9741D9E0000000, float 0xBF94F6FEA0000000, float 0xBF94AB28C0000000, float 0xBF9506BB40000000, float 0xBF944E05A0000000, float 0xBF942F5A80000000, float 0xBF961E9140000000, float 0xBF960A5060000000, float 0xBF9793F520000000, float 0xBF974CDDE0000000, float 0xBF97AE59A0000000, float 0xBF97853AE0000000, float 0xBF97936580000000, float 0xBF967E2D20000000, float 0xBF967A2C60000000], align 32
@lookup__cmdquaternion1 = internal unnamed_addr constant [60 x float] [float 0x3FD704B6A0000000, float 0x3FD6FE28E0000000, float 0x3FD70CF180000000, float 0x3FD7114A40000000, float 0x3FD5E66980000000, float 0x3FD474A860000000, float 0x3FD349DC20000000, float 0x3FD1ED2940000000, float 0x3FCFFC90C0000000, float 0x3FCD76EE60000000, float 0x3FC8BB4080000000, float 0x3FC6F96D20000000, float 0x3FC47F4120000000, float 0x3FC09C9760000000, float 0x3FBEBDB6E0000000, float 0x3FBC9EB480000000, float 0x3FBCE17E40000000, float 0x3FBCACED60000000, float 0x3FBC4D05C0000000, float 0x3FBC3A6020000000, float 0x3FBADCB0C0000000, float 0x3FBA85BB60000000, float 0x3FB9F06FC0000000, float 0x3FB9EFD6A0000000, float 0x3FB91EC280000000, float 0x3FB850E3A0000000, float 0x3FB6D8FDC0000000, float 0x3FB60D7860000000, float 0x3FB4829DA0000000, float 0x3FB2ACA760000000, float 0x3FB1284AA0000000, float 0x3FAEED8140000000, float 0x3FABA17E40000000, float 0x3FA889DDE0000000, float 0x3FA5FC30E0000000, float 0x3FA376A900000000, float 0x3FA0E75AA0000000, float 0x3F9B976180000000, float 0x3F968FD240000000, float 0x3F90698140000000, float 0x3F83758B20000000, float 0x3F69621140000000, float 0xBF6C12B580000000, float 0xBF85101E60000000, float 0xBF927478C0000000, float 0xBF9A03C400000000, float 0xBFA3789040000000, float 0xBFA918D7C0000000, float 0xBFAD29ADC0000000, float 0xBFB0E6B8C0000000, float 0xBFB2EFABC0000000, float 0xBFB4F98560000000, float 0xBFB6FAFD00000000, float 0xBFB8D2AB40000000, float 0xBFBAA1A580000000, float 0xBFBC1FA840000000, float 0xBFBEC33FE0000000, float 0xBFBFB753E0000000, float 0xBFC1724080000000, float 0xBFC2A46BA0000000], align 32
@lookup__cmdquaternion2 = internal unnamed_addr constant [60 x float] [float 0xBFC7F025A0000000, float 0xBFC7F07980000000, float 0xBFC8584080000000, float 0xBFC893C640000000, float 0xBFC7C8A540000000, float 0xBFC6659F60000000, float 0xBFC4FDBEC0000000, float 0xBFC32A8440000000, float 0xBFC1DFCEC0000000, float 0xBFC09171E0000000, float 0xBFBE8C2300000000, float 0xBFBC3D0EE0000000, float 0xBFB8FB4120000000, float 0xBFB714BAC0000000, float 0xBFB499F480000000, float 0xBFB4B0A860000000, float 0xBFB5507C60000000, float 0xBFB5C4FF40000000, float 0xBFB6415100000000, float 0xBFB71BF0C0000000, float 0xBFB7EFF340000000, float 0xBFB8532B00000000, float 0xBFB8DF9BE0000000, float 0xBFB999D9E0000000, float 0xBFBA17BB60000000, float 0xBFBAE23760000000, float 0xBFBC519900000000, float 0xBFBE45F0E0000000, float 0xBFBFE959A0000000, float 0xBFC095FA80000000, float 0xBFC1FF7C00000000, float 0xBFC2F69B00000000, float 0xBFC3FF5980000000, float 0xBFC4793640000000, float 0xBFC587B500000000, float 0xBFC65F6620000000, float 0xBFC7138AA0000000, float 0xBFC7C6C5E0000000, float 0xBFC8D5CFE0000000, float 0xBFC9C4B460000000, float 0xBFCAF1B2A0000000, float 0xBFCBC68060000000, float 0xBFCD09A600000000, float 0xBFCDE33440000000, float 0xBFCEFB9440000000, float 0xBFCFE762E0000000, float 0xBFD0DA68C0000000, float 0xBFD200FB40000000, float 0xBFD25E6900000000, float 0xBFD310C0A0000000, float 0xBFD3A14220000000, float 0xBFD465FAA0000000, float 0xBFD4C864A0000000, float 0xBFD5500C00000000, float 0xBFD5BF1B20000000, float 0xBFD64CD720000000, float 0xBFD6B8C4E0000000, float 0xBFD70822A0000000, float 0xBFD7A24600000000, float 0xBFD8A1CF80000000], align 32
@lookup__cmdquaternion3 = internal unnamed_addr constant [60 x float] [float 0x3FE2E32460000000, float 0x3FE2E32460000000, float 0x3FE2E18E20000000, float 0x3FE2E07540000000, float 0x3FE2D40280000000, float 0x3FE2EBC340000000, float 0x3FE33415C0000000, float 0x3FE353BCE0000000, float 0x3FE3746420000000, float 0x3FE395DAC0000000, float 0x3FE3DAABA0000000, float 0x3FE3D865E0000000, float 0x3FE3E5C360000000, float 0x3FE3FDD2E0000000, float 0x3FE40AA400000000, float 0x3FE40C9120000000, float 0x3FE40FB060000000, float 0x3FE4160800000000, float 0x3FE41838C0000000, float 0x3FE41F4520000000, float 0x3FE4207220000000, float 0x3FE425A0A0000000, float 0x3FE4281520000000, float 0x3FE42B6E60000000, float 0x3FE42DCE20000000, float 0x3FE4315A00000000, float 0x3FE435CCA0000000, float 0x3FE432D2C0000000, float 0x3FE4337080000000, float 0x3FE43BC480000000, float 0x3FE449DFC0000000, float 0x3FE4521320000000, float 0x3FE45A5340000000, float 0x3FE4627880000000, float 0x3FE46AE120000000, float 0x3FE472CCA0000000, float 0x3FE47C6260000000, float 0x3FE4870140000000, float 0x3FE4949AE0000000, float 0x3FE4A09360000000, float 0x3FE4AD2060000000, float 0x3FE4BC90E0000000, float 0x3FE4BFB7A0000000, float 0x3FE4BD3820000000, float 0x3FE4B42740000000, float 0x3FE4ABD6E0000000, float 0x3FE49B7B60000000, float 0x3FE491D4E0000000, float 0x3FE48B1720000000, float 0x3FE48801A0000000, float 0x3FE4824580000000, float 0x3FE47C3880000000, float 0x3FE47B9560000000, float 0x3FE46A9980000000, float 0x3FE4626E80000000, float 0x3FE456C920000000, float 0x3FE44DD660000000, float 0x3FE4431C80000000, float 0x3FE4275280000000, float 0x3FE409DAE0000000], align 32
@lookup__cmdquaternion4 = internal unnamed_addr constant [60 x float] [float 0x3FE6591D60000000, float 0x3FE6591D60000000, float 0x3FE65E6E80000000, float 0x3FE660B360000000, float 0x3FE68F29A0000000, float 0x3FE6E177C0000000, float 0x3FE7096600000000, float 0x3FE758F960000000, float 0x3FE7AF9D40000000, float 0x3FE7D6CA60000000, float 0x3FE7FCBE00000000, float 0x3FE83095E0000000, float 0x3FE85A4920000000, float 0x3FE872DA60000000, float 0x3FE8835920000000, float 0x3FE8834500000000, float 0x3FE87FCE20000000, float 0x3FE87D8080000000, float 0x3FE87AAD60000000, float 0x3FE8785BC0000000, float 0x3FE875F220000000, float 0x3FE87248E0000000, float 0x3FE8710120000000, float 0x3FE86E9B40000000, float 0x3FE86A02A0000000, float 0x3FE86AA300000000, float 0x3FE8622E80000000, float 0x3FE8630AC0000000, float 0x3FE85E3C20000000, float 0x3FE851FE60000000, float 0x3FE8420700000000, float 0x3FE8308340000000, float 0x3FE8233320000000, float 0x3FE8155260000000, float 0x3FE7FD24A0000000, float 0x3FE7F7F660000000, float 0x3FE7E27B20000000, float 0x3FE7CB8260000000, float 0x3FE7AB4280000000, float 0x3FE798C000000000, float 0x3FE77A7BC0000000, float 0x3FE75E8AC0000000, float 0x3FE745CB00000000, float 0x3FE7319320000000, float 0x3FE7205F60000000, float 0x3FE70C4820000000, float 0x3FE6EF4A40000000, float 0x3FE6CEEE60000000, float 0x3FE6AE3EC0000000, float 0x3FE6899C00000000, float 0x3FE66595A0000000, float 0x3FE64395E0000000, float 0x3FE6225900000000, float 0x3FE6043BA0000000, float 0x3FE5E379A0000000, float 0x3FE5BC9700000000, float 0x3FE5A7F680000000, float 0x3FE58AD100000000, float 0x3FE5574220000000, float 0x3FE522D5E0000000], align 32

; Function Attrs: inlinehint uwtable
define void @lookup__TlookuptableBIP(i64 %_init.0, i64 %_init.1) unnamed_addr #0 align 2 {
entry:
  ret void
}

; Function Attrs: uwtable
define void @lookup__output_lookup(float %distance_current, [5 x float]* %quaternion_out) unnamed_addr #1 align 2 personality i8* bitcast (void (float, [5 x float]*)* @lookup__output_lookup to i8*) {
entry:
  %quaternion_incr = alloca [5 x float]
  %0 = fcmp olt float %distance_current, 0x40356E1480000000
  %1 = fcmp ogt float %distance_current, 0x40E632DAE0000000
  %or.cond = or i1 %0, %1
  br i1 %or.cond, label %"4", label %"5"

"4":                                              ; preds = %entry
  %2 = bitcast [5 x float]* %quaternion_out to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast ([5 x float]* @lookup__quaternion_prev to i8*), i64 20, i32 4, i1 false)
  br label %"76"

"5":                                              ; preds = %entry
  br label %"6"

"6":                                              ; preds = %"74", %"5"
  %3 = phi i8 [ %124, %"74" ], [ 0, %"5" ]
  %4 = xor i8 %3, 1
  %5 = icmp ne i8 %4, 0
  br i1 %5, label %"7", label %"75"

"7":                                              ; preds = %"6"
  %6 = load i16, i16* @lookup__iterationcount, align 2
  %7 = icmp sle i16 %6, 0
  %8 = icmp sgt i16 %6, 60
  %or.cond4 = or i1 %7, %8
  br i1 %or.cond4, label %"9", label %"10"

"9":                                              ; preds = %"7"
  invoke void @__gnat_rcheck_CE_Index_Check(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.cst, i64 0, i64 0), i32 136) #3
          to label %9 unwind label %"78"

; <label>:9:                                      ; preds = %"9"
  unreachable

"10":                                             ; preds = %"7"
  %10 = sext i16 %6 to i64
  %11 = sub i64 %10, 1
  %12 = getelementptr inbounds float, float* getelementptr inbounds ([60 x float], [60 x float]* @lookup__distance, i64 0, i64 0), i64 %11
  %13 = load float, float* %12, align 4
  %14 = fcmp oge float %distance_current, %13
  %15 = zext i1 %14 to i8
  br i1 %14, label %"12", label %"42"

"12":                                             ; preds = %"10"
  %16 = icmp eq i16 %6, 32767
  br i1 %16, label %"13", label %"14"

"13":                                             ; preds = %"12"
  invoke void @__gnat_rcheck_CE_Overflow_Check(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.cst, i64 0, i64 0), i32 136) #3
          to label %17 unwind label %"78"

; <label>:17:                                     ; preds = %"13"
  unreachable

"14":                                             ; preds = %"12"
  %18 = add nsw i16 %6, 1
  %19 = icmp sle i16 %18, 0
  %20 = icmp sgt i16 %18, 60
  %or.cond5 = or i1 %19, %20
  br i1 %or.cond5, label %"16", label %"17"

"16":                                             ; preds = %"14"
  invoke void @__gnat_rcheck_CE_Index_Check(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.cst, i64 0, i64 0), i32 136) #3
          to label %21 unwind label %"78"

; <label>:21:                                     ; preds = %"16"
  unreachable

"17":                                             ; preds = %"14"
  %22 = sext i16 %18 to i64
  %23 = sub i64 %22, 1
  %24 = getelementptr inbounds float, float* getelementptr inbounds ([60 x float], [60 x float]* @lookup__distance, i64 0, i64 0), i64 %23
  %25 = load float, float* %24, align 4
  %26 = fcmp olt float %distance_current, %25
  %27 = zext i1 %26 to i8
  br i1 %26, label %"19", label %"42"

"19":                                             ; preds = %"17"
  br i1 false, label %"21", label %"22"

"21":                                             ; preds = %"19"
  invoke void @__gnat_rcheck_CE_Index_Check(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.cst, i64 0, i64 0), i32 140) #3
          to label %28 unwind label %"78"

; <label>:28:                                     ; preds = %"21"
  unreachable

"22":                                             ; preds = %"19"
  %29 = getelementptr inbounds float, float* getelementptr inbounds ([60 x float], [60 x float]* @lookup__rotangle, i64 0, i64 0), i64 %11
  %30 = load float, float* %29, align 4
  %31 = load float, float* @lookup__distance_incr, align 4
  %32 = fmul float %30, %31
  %33 = invoke float @library__cosine(float %32)
          to label %"24" unwind label %"78"

"24":                                             ; preds = %"22"
  %34 = bitcast [5 x float]* %quaternion_incr to float*
  store float %33, float* %34, align 4
  %35 = load i16, i16* @lookup__iterationcount, align 2
  %36 = icmp sle i16 %35, 0
  %37 = icmp sgt i16 %35, 60
  %or.cond9 = or i1 %36, %37
  br i1 %or.cond9, label %"26", label %"27"

"26":                                             ; preds = %"24"
  invoke void @__gnat_rcheck_CE_Index_Check(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.cst, i64 0, i64 0), i32 143) #3
          to label %38 unwind label %"78"

; <label>:38:                                     ; preds = %"26"
  unreachable

"27":                                             ; preds = %"24"
  %39 = sext i16 %35 to i64
  %40 = sub i64 %39, 1
  %41 = getelementptr inbounds float, float* getelementptr inbounds ([60 x float], [60 x float]* @lookup__dircosl, i64 0, i64 0), i64 %40
  %42 = load float, float* %41, align 4
  %43 = invoke float @library__sine(float %32)
          to label %"29" unwind label %"78"

"29":                                             ; preds = %"27"
  %44 = fmul float %42, %43
  %45 = getelementptr inbounds float, float* %34, i64 1
  store float %44, float* %45, align 4
  %46 = load i16, i16* @lookup__iterationcount, align 2
  %47 = icmp sle i16 %46, 0
  %48 = icmp sgt i16 %46, 60
  %or.cond11 = or i1 %47, %48
  br i1 %or.cond11, label %"31", label %"32"

"31":                                             ; preds = %"29"
  invoke void @__gnat_rcheck_CE_Index_Check(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.cst, i64 0, i64 0), i32 144) #3
          to label %49 unwind label %"78"

; <label>:49:                                     ; preds = %"31"
  unreachable

"32":                                             ; preds = %"29"
  %50 = sext i16 %46 to i64
  %51 = sub i64 %50, 1
  %52 = getelementptr inbounds float, float* getelementptr inbounds ([60 x float], [60 x float]* @lookup__dircosm, i64 0, i64 0), i64 %51
  %53 = load float, float* %52, align 4
  %54 = invoke float @library__sine(float %32)
          to label %"34" unwind label %"78"

"34":                                             ; preds = %"32"
  %55 = fmul float %53, %54
  %56 = getelementptr inbounds float, float* %34, i64 2
  store float %55, float* %56, align 4
  %57 = load i16, i16* @lookup__iterationcount, align 2
  %58 = icmp sle i16 %57, 0
  %59 = icmp sgt i16 %57, 60
  %or.cond13 = or i1 %58, %59
  br i1 %or.cond13, label %"36", label %"37"

"36":                                             ; preds = %"34"
  invoke void @__gnat_rcheck_CE_Index_Check(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.cst, i64 0, i64 0), i32 145) #3
          to label %60 unwind label %"78"

; <label>:60:                                     ; preds = %"36"
  unreachable

"37":                                             ; preds = %"34"
  %61 = sext i16 %57 to i64
  %62 = sub i64 %61, 1
  %63 = getelementptr inbounds float, float* getelementptr inbounds ([60 x float], [60 x float]* @lookup__dircosn, i64 0, i64 0), i64 %62
  %64 = load float, float* %63, align 4
  %65 = invoke float @library__sine(float %32)
          to label %"39" unwind label %"78"

"39":                                             ; preds = %"37"
  %66 = fmul float %64, %65
  %67 = getelementptr inbounds float, float* %34, i64 3
  store float %66, float* %67, align 4
  invoke void @math__normalise([5 x float]* %quaternion_incr)
          to label %"40" unwind label %"78"

"40":                                             ; preds = %"39"
  invoke void @math__multiply([5 x float]* @lookup__quaternion_prev, [5 x float]* %quaternion_incr, [5 x float]* %quaternion_out)
          to label %"74" unwind label %"78"

"42":                                             ; preds = %"17", %"10"
  %68 = load i16, i16* @lookup__iterationcount, align 2
  %69 = icmp sle i16 %68, 0
  %70 = icmp sgt i16 %68, 60
  %or.cond15 = or i1 %69, %70
  br i1 %or.cond15, label %"44", label %"45"

"44":                                             ; preds = %"42"
  invoke void @__gnat_rcheck_CE_Index_Check(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.cst, i64 0, i64 0), i32 157) #3
          to label %71 unwind label %"78"

; <label>:71:                                     ; preds = %"44"
  unreachable

"45":                                             ; preds = %"42"
  %72 = sext i16 %68 to i64
  %73 = sub i64 %72, 1
  %74 = getelementptr inbounds float, float* getelementptr inbounds ([60 x float], [60 x float]* @lookup__distance, i64 0, i64 0), i64 %73
  %75 = load float, float* %74, align 4
  %76 = fcmp olt float %distance_current, %75
  br i1 %76, label %"47", label %"50"

"47":                                             ; preds = %"45"
  %77 = icmp eq i16 %68, -32768
  br i1 %77, label %"48", label %"49"

"48":                                             ; preds = %"47"
  invoke void @__gnat_rcheck_CE_Overflow_Check(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.cst, i64 0, i64 0), i32 158) #3
          to label %78 unwind label %"78"

; <label>:78:                                     ; preds = %"48"
  unreachable

"49":                                             ; preds = %"47"
  %79 = add nsw i16 %68, -1
  store i16 %79, i16* @lookup__iterationcount, align 2
  br label %"53"

"50":                                             ; preds = %"45"
  %80 = icmp eq i16 %68, 32767
  br i1 %80, label %"51", label %"52"

"51":                                             ; preds = %"50"
  invoke void @__gnat_rcheck_CE_Overflow_Check(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.cst, i64 0, i64 0), i32 160) #3
          to label %81 unwind label %"78"

; <label>:81:                                     ; preds = %"51"
  unreachable

"52":                                             ; preds = %"50"
  %82 = add nsw i16 %68, 1
  store i16 %82, i16* @lookup__iterationcount, align 2
  br label %"53"

"53":                                             ; preds = %"52", %"49"
  %83 = load i16, i16* @lookup__iterationcount, align 2
  %84 = icmp sle i16 %83, 0
  %85 = icmp sgt i16 %83, 60
  %or.cond17 = or i1 %84, %85
  br i1 %or.cond17, label %"55", label %"56"

"55":                                             ; preds = %"53"
  invoke void @__gnat_rcheck_CE_Index_Check(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.cst, i64 0, i64 0), i32 163) #3
          to label %86 unwind label %"78"

; <label>:86:                                     ; preds = %"55"
  unreachable

"56":                                             ; preds = %"53"
  %87 = sext i16 %83 to i64
  %88 = sub i64 %87, 1
  %89 = getelementptr inbounds float, float* getelementptr inbounds ([60 x float], [60 x float]* @lookup__distance, i64 0, i64 0), i64 %88
  %90 = load float, float* %89, align 4
  %91 = fsub float %distance_current, %90
  store float %91, float* @lookup__distance_incr, align 4
  %92 = load i16, i16* @lookup__iterationcount, align 2
  %93 = icmp sle i16 %92, 0
  %94 = icmp sgt i16 %92, 60
  %or.cond19 = or i1 %93, %94
  br i1 %or.cond19, label %"59", label %"60"

"59":                                             ; preds = %"56"
  invoke void @__gnat_rcheck_CE_Index_Check(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.cst, i64 0, i64 0), i32 165) #3
          to label %95 unwind label %"78"

; <label>:95:                                     ; preds = %"59"
  unreachable

"60":                                             ; preds = %"56"
  %96 = sext i16 %92 to i64
  %97 = sub i64 %96, 1
  %98 = getelementptr inbounds float, float* getelementptr inbounds ([60 x float], [60 x float]* @lookup__cmdquaternion1, i64 0, i64 0), i64 %97
  %99 = load float, float* %98, align 4
  store float %99, float* getelementptr inbounds ([5 x float], [5 x float]* @lookup__quaternion_prev, i64 0, i64 0), align 4
  %100 = load i16, i16* @lookup__iterationcount, align 2
  %101 = icmp sle i16 %100, 0
  %102 = icmp sgt i16 %100, 60
  %or.cond21 = or i1 %101, %102
  br i1 %or.cond21, label %"63", label %"64"

"63":                                             ; preds = %"60"
  invoke void @__gnat_rcheck_CE_Index_Check(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.cst, i64 0, i64 0), i32 166) #3
          to label %103 unwind label %"78"

; <label>:103:                                    ; preds = %"63"
  unreachable

"64":                                             ; preds = %"60"
  %104 = sext i16 %100 to i64
  %105 = sub i64 %104, 1
  %106 = getelementptr inbounds float, float* getelementptr inbounds ([60 x float], [60 x float]* @lookup__cmdquaternion2, i64 0, i64 0), i64 %105
  %107 = load float, float* %106, align 4
  store float %107, float* getelementptr inbounds ([5 x float], [5 x float]* @lookup__quaternion_prev, i64 0, i64 1), align 4
  %108 = load i16, i16* @lookup__iterationcount, align 2
  %109 = icmp sle i16 %108, 0
  %110 = icmp sgt i16 %108, 60
  %or.cond23 = or i1 %109, %110
  br i1 %or.cond23, label %"67", label %"68"

"67":                                             ; preds = %"64"
  invoke void @__gnat_rcheck_CE_Index_Check(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.cst, i64 0, i64 0), i32 167) #3
          to label %111 unwind label %"78"

; <label>:111:                                    ; preds = %"67"
  unreachable

"68":                                             ; preds = %"64"
  %112 = sext i16 %108 to i64
  %113 = sub i64 %112, 1
  %114 = getelementptr inbounds float, float* getelementptr inbounds ([60 x float], [60 x float]* @lookup__cmdquaternion3, i64 0, i64 0), i64 %113
  %115 = load float, float* %114, align 4
  store float %115, float* getelementptr inbounds ([5 x float], [5 x float]* @lookup__quaternion_prev, i64 0, i64 2), align 4
  %116 = load i16, i16* @lookup__iterationcount, align 2
  %117 = icmp sle i16 %116, 0
  %118 = icmp sgt i16 %116, 60
  %or.cond25 = or i1 %117, %118
  br i1 %or.cond25, label %"71", label %"72"

"71":                                             ; preds = %"68"
  invoke void @__gnat_rcheck_CE_Index_Check(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.cst, i64 0, i64 0), i32 168) #3
          to label %119 unwind label %"78"

; <label>:119:                                    ; preds = %"71"
  unreachable

"72":                                             ; preds = %"68"
  %120 = sext i16 %116 to i64
  %121 = sub i64 %120, 1
  %122 = getelementptr inbounds float, float* getelementptr inbounds ([60 x float], [60 x float]* @lookup__cmdquaternion4, i64 0, i64 0), i64 %121
  %123 = load float, float* %122, align 4
  store float %123, float* getelementptr inbounds ([5 x float], [5 x float]* @lookup__quaternion_prev, i64 0, i64 3), align 4
  br label %"74"

"74":                                             ; preds = %"40", %"72"
  %124 = phi i8 [ %3, %"72" ], [ 1, %"40" ]
  br label %"6"

"75":                                             ; preds = %"6"
  %125 = bitcast [5 x float]* %quaternion_out to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast ([5 x float]* @lookup__quaternion_prev to i8*), i8* %125, i64 20, i32 4, i1 false)
  br label %"76"

"76":                                             ; preds = %"75", %"4"
  %126 = bitcast [5 x float]* %quaternion_incr to i8*
  call void @llvm.lifetime.end.p0i8(i64 20, i8* %126)
  ret void

"78":                                             ; preds = %"71", %"67", %"63", %"59", %"55", %"51", %"48", %"44", %"40", %"39", %"37", %"36", %"32", %"31", %"27", %"26", %"22", %"21", %"16", %"13", %"9"
  %exc = landingpad { i8*, i32 }
          cleanup
  %exc_ptr1 = extractvalue { i8*, i32 } %exc, 0
  %filter2 = extractvalue { i8*, i32 } %exc, 1
  %127 = bitcast [5 x float]* %quaternion_incr to i8*
  call void @llvm.lifetime.end.p0i8(i64 20, i8* %127)
  resume { i8*, i32 } %exc
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: noreturn
declare void @__gnat_rcheck_CE_Index_Check(i8*, i32) #3

; Function Attrs: noreturn
declare void @__gnat_rcheck_CE_Overflow_Check(i8*, i32) #3

declare float @library__cosine(float)

declare float @library__sine(float)

declare void @math__normalise([5 x float]*)

declare void @math__multiply([5 x float]*, [5 x float]*, [5 x float]*)

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #2

attributes #0 = { inlinehint uwtable "no-frame-pointer-elim-non-leaf"="true" }
attributes #1 = { uwtable "no-frame-pointer-elim-non-leaf"="true" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { noreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 7, !"PIE Level", i32 2}
