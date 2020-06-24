; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64--linux-gnu"

module asm "\09.ident\09\22GCC: (Ubuntu 8.3.0-26ubuntu1~18.04) 8.3.0 LLVM: 6.0.0\22"
module asm ""
module asm "\09.ident\09\22GCC: (Ubuntu 8.3.0-26ubuntu1~18.04) 8.3.0 LLVM: 6.0.0\22"
module asm ""
module asm "\09.ident\09\22GCC: (Ubuntu 8.3.0-26ubuntu1~18.04) 8.3.0 LLVM: 6.0.0\22"
module asm ""
module asm "\09.ident\09\22GCC: (Ubuntu 8.3.0-26ubuntu1~18.04) 8.3.0 LLVM: 6.0.0\22"
module asm ""
module asm "\09.ident\09\22GCC: (Ubuntu 8.3.0-26ubuntu1~18.04) 8.3.0 LLVM: 6.0.0\22"
module asm ""
module asm "\09.ident\09\22GCC: (Ubuntu 8.3.0-26ubuntu1~18.04) 8.3.0 LLVM: 6.0.0\22"
module asm ""
module asm "\09.ident\09\22GCC: (Ubuntu 8.3.0-26ubuntu1~18.04) 8.3.0 LLVM: 6.0.0\22"
module asm ""
module asm "\09.ident\09\22GCC: (Ubuntu 8.3.0-26ubuntu1~18.04) 8.3.0 LLVM: 6.0.0\22"
module asm ""
module asm "\09.ident\09\22GCC: (Ubuntu 8.3.0-26ubuntu1~18.04) 8.3.0 LLVM: 6.0.0\22"

@algorithm__matrix22 = unnamed_addr global float undef
@algorithm__matrix12 = unnamed_addr global float undef
@algorithm__matrix11 = unnamed_addr global float undef
@algorithm__timeconst = global float undef
@algorithm__exhaustvel = global float undef
@algorithm__velocityradial = global float undef
@algorithm__hv_target = global float undef
@algorithm__rd_target = global float undef
@algorithm_E = unnamed_addr global i16 0
@library_E = unnamed_addr global i16 0
@lookup__iterationcount = global i16 undef
@lookup__distance_incr = global float undef
@lookup__quaternion_prev = global [5 x float] undef, align 16
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
@main__posdefoutofplane = global float undef
@main__steercoeffd = global float undef
@main__steercoeffc = global float undef
@main__steercoeffb = global float undef
@main__steercoeffa = global float undef
@main__matrix22 = global float undef
@main__matrix12 = global float undef
@main__matrix11 = global float undef
@main__defvel = global float undef
@main__defpos = global float undef
@main__angley = global float undef
@main__angler = global float undef
@main__stage_time = global float undef
@main__effectivegravity = global float undef
@main__guidvel_w = global float undef
@main__guidvel_v = global float undef
@main__guidvel_u = global float undef
@main__ttg = global float undef
@main__event4 = unnamed_addr global i16 undef
@main__minorflag_stage3 = global i16 undef
@main__minorflag_stage2 = global i16 undef
@main__cyclecount = global i32 undef
@main__outflag = unnamed_addr global i16 undef
@main__minorinmajor = global i16 undef
@main__offstage3 = global i16 undef
@main__offstage2 = global i16 undef
@main__step14 = unnamed_addr global i16 undef
@main__step13 = unnamed_addr global i16 undef
@main__step12 = global i16 undef
@main__step11 = unnamed_addr global i16 undef
@main__step10 = unnamed_addr global i16 undef
@main__step8 = global i16 undef
@main__step7 = unnamed_addr global i16 undef
@main__step6 = unnamed_addr global i16 undef
@main__step5 = unnamed_addr global i16 undef
@main__step4 = unnamed_addr global i16 undef
@main__step2 = global i16 undef
@main__stage3_start = global float undef
@main__stage2_start = global float undef
@main__apogee = global float undef
@main__radialdist = global float undef
@main__velw = global float undef
@main__velv = global float undef
@main__velu = global float undef
@main__posz = global float undef
@main__posy = global float undef
@main__posx = global float undef
@main__liftoff = unnamed_addr global float undef
@main__major_time = global float undef
@main__time = unnamed_addr global float undef
@main__combinederrorflag = unnamed_addr global i16 undef
@main__outflag3 = unnamed_addr global i16 undef
@main__outflag2 = unnamed_addr global i16 undef
@main__outflag1 = unnamed_addr global i16 undef
@main__guidoutflagc = unnamed_addr global i16 undef
@main__guidoutflag = unnamed_addr global i16 undef
@main__stageflgc = global i16 undef
@main__stageflg = global i16 undef
@main__altitudeinfo = global float undef
@main__qc = global [5 x float] undef, align 16
@main__brate = global [5 x float] undef, align 16
@main_E = unnamed_addr global i16 0
@.cst.37 = private local_unnamed_addr constant [9 x i8] c"main.adb\00", align 8
@main__man_desiredq = internal unnamed_addr global [5 x float] undef, align 16
@.cst.1 = private local_unnamed_addr constant [9 x i8] c"main.ads\00", align 8
@major_cycle__duration = global float undef
@major_cycle__desiredq = global [5 x float] undef, align 16
@major_cycle__ttg_prev = unnamed_addr global float undef
@major_cycle__ta = unnamed_addr global float undef
@major_cycle__tempres = local_unnamed_addr global [5 x float] undef, align 16
@major_cycle__brate = local_unnamed_addr global [5 x float] undef, align 16
@major_cycle__velocity = local_unnamed_addr global [5 x float] undef, align 16
@major_cycle__guidvel = local_unnamed_addr global [5 x float] undef, align 16
@major_cycle__dircos_v = local_unnamed_addr global [5 x float] undef, align 16
@major_cycle__dircos_u = local_unnamed_addr global [5 x float] undef, align 16
@major_cycle__variable_ta = local_unnamed_addr global [5 x float] undef, align 16
@major_cycle__dircos = local_unnamed_addr global [5 x float] undef, align 16
@major_cycle__position = local_unnamed_addr global [5 x float] undef, align 16
@major_cycle__q_minor = global [25 x [5 x float]] undef, align 32
@major_cycle__dotq = local_unnamed_addr global [5 x float] undef, align 16
@major_cycle__majorprev_q = local_unnamed_addr global [5 x float] undef, align 16
@major_cycle__temp1 = local_unnamed_addr global [5 x float] undef, align 16
@major_cycle__distvelaxis = unnamed_addr global float undef
@major_cycle__templ = unnamed_addr global float undef
@major_cycle__velsqr = unnamed_addr global float undef
@major_cycle__angley = unnamed_addr global float undef
@major_cycle__angler = unnamed_addr global float undef
@major_cycle__total_time_stage3 = unnamed_addr global float undef
@major_cycle__total_time_stage2 = unnamed_addr global float undef
@major_cycle__tempt = unnamed_addr global float undef
@major_cycle__tempa = unnamed_addr global float undef
@major_cycle__tempp = unnamed_addr global float undef
@major_cycle__effectivegravity = unnamed_addr global float undef
@major_cycle__ttg = unnamed_addr global float undef
@major_cycle__stage_time = unnamed_addr global float undef
@major_cycle__instvelocityprev = unnamed_addr global float undef
@major_cycle__instvelocity = unnamed_addr global float undef
@major_cycle__velocityincrmj = global float undef
@major_cycle__velocityincrmn = global float undef
@major_cycle__velocitycoeff = global float undef
@major_cycle__enterstage3 = global i16 undef
@major_cycle__enterstage2 = global i16 undef
@major_cycle__velflag = global i16 undef
@major_cycle__minorflag_stage3 = global i16 undef
@major_cycle__minorflag_stage2 = global i16 undef
@major_cycle__event4 = global i16 undef
@major_cycle_E = unnamed_addr global i16 0
@major_cycle__dircos_stage2 = internal local_unnamed_addr global [5 x float] undef, align 16
@major_cycle__dircos_stage3 = internal local_unnamed_addr global [5 x float] undef, align 16
@major_cycle__dircosperigeeline = internal local_unnamed_addr global [5 x float] undef, align 16
@major_cycle__angle_to_cover = internal unnamed_addr global float undef
@major_cycle__hv_target = internal unnamed_addr global float undef
@major_cycle__ratesbprev = internal unnamed_addr global [5 x float] undef, align 16
@.cst.66 = private local_unnamed_addr constant [16 x i8] c"major_cycle.adb\00", align 8
@math_E = unnamed_addr global i16 0
@minor_cycle__firstcycle_mnvre = global i16 undef
@minor_cycle__q_minor = unnamed_addr global [25 x [5 x float]] undef, align 32
@minor_cycle__velocityincrmn = unnamed_addr global float undef
@minor_cycle__velocitycoeff = unnamed_addr global float undef
@minor_cycle__firstcycle_stage3 = global i16 undef
@minor_cycle__firstcycle_stage2 = global i16 undef
@minor_cycle__firstcycle_stage1 = global i16 undef
@minor_cycle__minorflag_stage3 = unnamed_addr global i16 undef
@minor_cycle__minorflag_stage2 = unnamed_addr global i16 undef
@minor_cycle__offstage3 = global i16 undef
@minor_cycle__offstage2 = global i16 undef
@minor_cycle_E = unnamed_addr global i16 0
@.cst.101 = private local_unnamed_addr constant [16 x i8] c"minor_cycle.adb\00", align 8
@minor_cycle__prevcycle_q = internal unnamed_addr global [5 x float] undef, align 16

; Function Attrs: uwtable
define float @algorithm__compangler([5 x float]* %guidvel, float %radialdist, float %effectivegravity, float %ta, float %t) #0 align 2 {
entry:
  %0 = load float, float* @algorithm__rd_target, align 4
  %1 = fsub float %radialdist, %0
  %2 = fmul float %effectivegravity, 5.000000e-01
  %3 = fadd float %ta, %t
  %4 = fmul float %2, %3
  %5 = fsub float %ta, %t
  %6 = fmul float %4, %5
  %7 = fadd float %1, %6
  %8 = bitcast [5 x float]* %guidvel to float*
  %9 = getelementptr inbounds float, float* %8, i64 2
  %10 = load float, float* %9, align 4
  %11 = fmul float %t, %10
  %12 = fadd float %7, %11
  %13 = load float, float* @algorithm__velocityradial, align 4
  %14 = fmul float %ta, %13
  %15 = fsub float %12, %14
  %16 = fsub float %10, %13
  %17 = fmul float %effectivegravity, %5
  %18 = fadd float %16, %17
  %19 = load float, float* %8, align 4
  %20 = load float, float* @algorithm__hv_target, align 4
  %21 = fmul float %20, %0
  %22 = fdiv float %21, %radialdist
  %23 = fsub float %19, %22
  store float %23, float* @algorithm__matrix22, align 4
  %24 = fmul float %3, 5.000000e-01
  %25 = load float, float* @algorithm__timeconst, align 4
  %26 = fadd float %24, %25
  %27 = load float, float* @algorithm__exhaustvel, align 4
  %28 = fmul float %26, %27
  %29 = fmul float %28, %5
  store float %29, float* @algorithm__matrix11, align 4
  %30 = load float, float* @algorithm__timeconst, align 4
  %31 = fmul float %30, %30
  %32 = load float, float* @algorithm__matrix22, align 4
  %33 = fmul float %31, %32
  %34 = fadd float %33, %29
  store float %34, float* @algorithm__matrix11, align 4
  %35 = load float, float* @algorithm__exhaustvel, align 4
  %36 = fmul float %5, %35
  %37 = load float, float* @algorithm__timeconst, align 4
  %38 = load float, float* @algorithm__matrix22, align 4
  %39 = fmul float %37, %38
  %40 = fadd float %36, %39
  store float %40, float* @algorithm__matrix12, align 4
  %41 = fmul float %15, %40
  %42 = load float, float* @algorithm__matrix11, align 4
  %43 = fmul float %18, %42
  %44 = fsub float %41, %43
  %45 = fmul float %40, %40
  %46 = load float, float* @algorithm__matrix22, align 4
  %47 = fmul float %46, %42
  %48 = fsub float %45, %47
  %49 = fdiv float %44, %48
  %50 = fmul float %49, %40
  %51 = fsub float %15, %50
  %52 = fdiv float %51, %42
  %53 = fmul float %52, %t
  %54 = fadd float %49, %53
  %55 = call float @library__taninverse(float %54)
  store float %15, float* @main__defpos, align 4
  store float %18, float* @main__defvel, align 4
  %56 = load float, float* @algorithm__matrix11, align 4
  store float %56, float* @main__matrix11, align 4
  %57 = load float, float* @algorithm__matrix12, align 4
  store float %57, float* @main__matrix12, align 4
  %58 = load float, float* @algorithm__matrix22, align 4
  store float %58, float* @main__matrix22, align 4
  store float %52, float* @main__steercoeffa, align 4
  store float %49, float* @main__steercoeffb, align 4
  ret float %55
}

; Function Attrs: uwtable
define float @algorithm__compangley(float %distvelaxis, float %v, float %t) #0 align 2 {
entry:
  %0 = fmul float %v, %t
  %1 = fadd float %distvelaxis, %0
  %2 = load float, float* @algorithm__matrix12, align 4
  %3 = fmul float %1, %2
  %4 = load float, float* @algorithm__matrix11, align 4
  %5 = fmul float %v, %4
  %6 = fsub float %3, %5
  %7 = fmul float %2, %2
  %8 = load float, float* @algorithm__matrix22, align 4
  %9 = fmul float %8, %4
  %10 = fsub float %7, %9
  %11 = fdiv float %6, %10
  %12 = fmul float %11, %2
  %13 = fsub float %1, %12
  %14 = fdiv float %13, %4
  %15 = fmul float %14, %t
  %16 = fadd float %11, %15
  %17 = call float @library__taninverse(float %16)
  store float %14, float* @main__steercoeffc, align 4
  store float %11, float* @main__steercoeffd, align 4
  store float %1, float* @main__posdefoutofplane, align 4
  ret float %17
}

; Function Attrs: uwtable
define float @library__absolute(float %x) unnamed_addr #0 align 2 {
entry:
  %0 = fcmp olt float %x, 0.000000e+00
  %1 = fsub float -0.000000e+00, %x
  %2 = select i1 %0, float %1, float %x
  ret float %2
}

; Function Attrs: uwtable
define float @library__cosine(float %x1) #0 align 2 {
entry:
  %0 = fcmp olt float %x1, 0.000000e+00
  %1 = fsub float -0.000000e+00, %x1
  %2 = select i1 %0, float %1, float %x1
  br label %"5"

"5":                                              ; preds = %"6", %entry
  %3 = phi float [ %5, %"6" ], [ %2, %entry ]
  %4 = fcmp ogt float %3, 0x401921FB40000000
  br i1 %4, label %"6", label %"7"

"6":                                              ; preds = %"5"
  %5 = fsub float %3, 0x401921FB40000000
  br label %"5"

"7":                                              ; preds = %"5"
  %6 = fcmp ogt float %3, 0x400921FB00000000
  %7 = fsub float %3, 0x400921FB00000000
  %8 = select i1 %6, float %7, float %3
  %9 = fcmp ogt float %8, 0x3FF921FB00000000
  %10 = fcmp ole float %8, 0x400921FB00000000
  %or.cond = and i1 %9, %10
  %11 = fsub float 0x400921FB00000000, %8
  %12 = select i1 %or.cond, i8 0, i8 1
  %13 = select i1 %or.cond, float %11, float %8
  %14 = fcmp ogt float %13, 0x3FE921FB00000000
  %15 = fcmp ole float %13, 0x3FF921FB00000000
  %or.cond1 = and i1 %14, %15
  br i1 %or.cond1, label %"14", label %"17"

"14":                                             ; preds = %"7"
  %16 = fsub float 0x3FF921FB00000000, %13
  %17 = fmul float %16, %16
  %18 = fmul float %16, %17
  %19 = fdiv float %18, 6.000000e+00
  %20 = fsub float %16, %19
  %21 = fmul float %16, %18
  %22 = fmul float %16, %21
  %23 = fdiv float %22, 1.200000e+02
  %24 = fadd float %20, %23
  %25 = fcmp oge float %16, 0x3FD3333340000000
  br i1 %25, label %"15", label %"21"

"15":                                             ; preds = %"14"
  %26 = fmul float %16, %22
  %27 = fmul float %16, %26
  %28 = fdiv float %27, 5.040000e+03
  %29 = fsub float %24, %28
  br label %"21"

"17":                                             ; preds = %"7"
  %30 = fcmp ole float %13, 0x3EE4F8B580000000
  br i1 %30, label %"21", label %"19"

"19":                                             ; preds = %"17"
  %31 = fmul float %13, %13
  %32 = fdiv float %31, 2.000000e+00
  %33 = fsub float 1.000000e+00, %32
  %34 = fmul float %13, %31
  %35 = fmul float %13, %34
  %36 = fdiv float %35, 2.400000e+01
  %37 = fadd float %33, %36
  %38 = fmul float %13, %35
  %39 = fmul float %13, %38
  %40 = fdiv float %39, 7.200000e+02
  %41 = fsub float %37, %40
  %42 = fcmp oge float %13, 0x3FD99999A0000000
  br i1 %42, label %"20", label %"21"

"20":                                             ; preds = %"19"
  %43 = fmul float %13, %39
  %44 = fmul float %13, %43
  %45 = fdiv float %44, 4.032000e+04
  %46 = fadd float %41, %45
  br label %"21"

"21":                                             ; preds = %"20", %"19", %"17", %"15", %"14"
  %47 = phi float [ %46, %"20" ], [ %41, %"19" ], [ %29, %"15" ], [ %24, %"14" ], [ 1.000000e+00, %"17" ]
  %48 = icmp ne i8 %12, 0
  %49 = fsub float -0.000000e+00, %47
  %spec.select = select i1 %48, float %49, float %47
  ret float %spec.select
}

; Function Attrs: uwtable
define float @library__sine(float %x1) #0 align 2 {
entry:
  %0 = fcmp olt float %x1, 0.000000e+00
  %1 = fsub float -0.000000e+00, %x1
  %2 = select i1 %0, float %1, float %x1
  br label %"5"

"5":                                              ; preds = %"6", %entry
  %3 = phi float [ %5, %"6" ], [ %2, %entry ]
  %4 = fcmp ogt float %3, 0x401921FB40000000
  br i1 %4, label %"6", label %"7"

"6":                                              ; preds = %"5"
  %5 = fsub float %3, 0x401921FB40000000
  br label %"5"

"7":                                              ; preds = %"5"
  %6 = fcmp ogt float %3, 0x400921FB00000000
  %7 = fsub float %3, 0x400921FB00000000
  %8 = select i1 %6, i8 0, i8 1
  %9 = select i1 %6, float %7, float %3
  %10 = fcmp ogt float %9, 0x3FF921FB00000000
  %11 = fcmp ole float %9, 0x400921FB00000000
  %or.cond = and i1 %10, %11
  %12 = fsub float 0x400921FB00000000, %9
  %13 = select i1 %or.cond, float %12, float %9
  %14 = fcmp ogt float %13, 0x3FE921FB00000000
  %15 = fcmp ole float %13, 0x3FF921FB00000000
  %or.cond1 = and i1 %14, %15
  br i1 %or.cond1, label %"14", label %"19"

"14":                                             ; preds = %"7"
  %16 = fsub float 0x3FF921FB00000000, %13
  %17 = fcmp ole float %16, 0x3EE4F8B580000000
  br i1 %17, label %"21", label %"16"

"16":                                             ; preds = %"14"
  %18 = fmul float %16, %16
  %19 = fdiv float %18, 2.000000e+00
  %20 = fsub float 1.000000e+00, %19
  %21 = fmul float %16, %18
  %22 = fmul float %16, %21
  %23 = fdiv float %22, 2.400000e+01
  %24 = fadd float %20, %23
  %25 = fmul float %16, %22
  %26 = fmul float %16, %25
  %27 = fdiv float %26, 7.200000e+02
  %28 = fsub float %24, %27
  %29 = fcmp oge float %16, 0x3FD99999A0000000
  br i1 %29, label %"17", label %"21"

"17":                                             ; preds = %"16"
  %30 = fmul float %16, %26
  %31 = fmul float %16, %30
  %32 = fdiv float %31, 4.032000e+04
  %33 = fadd float %28, %32
  br label %"21"

"19":                                             ; preds = %"7"
  %34 = fmul float %13, %13
  %35 = fmul float %13, %34
  %36 = fdiv float %35, 6.000000e+00
  %37 = fsub float %13, %36
  %38 = fmul float %13, %35
  %39 = fmul float %13, %38
  %40 = fdiv float %39, 1.200000e+02
  %41 = fadd float %37, %40
  %42 = fcmp oge float %13, 0x3FD3333340000000
  br i1 %42, label %"20", label %"21"

"20":                                             ; preds = %"19"
  %43 = fmul float %13, %39
  %44 = fmul float %13, %43
  %45 = fdiv float %44, 5.040000e+03
  %46 = fsub float %41, %45
  br label %"21"

"21":                                             ; preds = %"20", %"19", %"17", %"16", %"14"
  %47 = phi float [ %46, %"20" ], [ %41, %"19" ], [ %33, %"17" ], [ %28, %"16" ], [ 1.000000e+00, %"14" ]
  %48 = icmp ne i8 %8, 0
  %49 = fsub float -0.000000e+00, %47
  %spec.select = select i1 %48, float %49, float %47
  ret float %spec.select
}

; Function Attrs: uwtable
define float @library__exponent(float %x1) #0 align 2 {
entry:
  %0 = fcmp oeq float %x1, 0.000000e+00
  br i1 %0, label %"13", label %"4"

"4":                                              ; preds = %entry
  %1 = fcmp oeq float %x1, 1.000000e+00
  br i1 %1, label %"13", label %"6"

"6":                                              ; preds = %"4"
  %2 = fcmp oeq float %x1, -1.000000e+00
  br i1 %2, label %"13", label %"8"

"8":                                              ; preds = %"6"
  %3 = fcmp olt float %x1, 0.000000e+00
  %4 = fsub float -0.000000e+00, %x1
  %5 = select i1 %3, float %4, float %x1
  %6 = fadd float %5, 1.000000e+00
  %7 = fmul float %5, %5
  %8 = fdiv float %7, 2.000000e+00
  %9 = fadd float %6, %8
  %10 = fmul float %5, %7
  %11 = fdiv float %10, 6.000000e+00
  %12 = fadd float %9, %11
  %13 = fmul float %5, %10
  %14 = fdiv float %13, 2.400000e+01
  %15 = fadd float %12, %14
  %16 = fmul float %5, %13
  %17 = fdiv float %16, 1.200000e+02
  %18 = fadd float %15, %17
  %19 = fmul float %5, %16
  %20 = fdiv float %19, 7.200000e+02
  %21 = fadd float %18, %20
  br i1 true, label %"11", label %"13"

"11":                                             ; preds = %"8"
  %22 = fdiv float 1.000000e+00, %21
  br label %"13"

"13":                                             ; preds = %"11", %"8", %"6", %"4", %entry
  %23 = phi float [ %22, %"11" ], [ %21, %"8" ], [ 1.000000e+00, %entry ], [ 0x4005BF0AA0000000, %"4" ], [ 0x3FD78B5460000000, %"6" ]
  ret float %23
}

; Function Attrs: uwtable
define float @library__squareroot(float %x1) #0 align 2 {
entry:
  %0 = fcmp ole float %x1, 0.000000e+00
  br i1 %0, label %"14", label %"4"

"4":                                              ; preds = %entry
  %1 = fcmp oeq float %x1, 1.000000e+00
  br i1 %1, label %"14", label %"6"

"6":                                              ; preds = %"4"
  br label %"7"

"7":                                              ; preds = %"8", %"6"
  %2 = phi float [ %., %"8" ], [ 1.000000e+00, %"6" ]
  %3 = phi float [ %.1, %"8" ], [ %x1, %"6" ]
  %4 = fsub float %3, %2
  %5 = fcmp ogt float %4, 0x3EE4F8B580000000
  br i1 %5, label %"8", label %"14"

"8":                                              ; preds = %"7"
  %6 = fdiv float %4, 2.000000e+00
  %7 = fadd float %2, %6
  %8 = fmul float %7, %7
  %9 = fsub float %8, %x1
  %10 = fcmp ogt float %9, 0x3EE4F8B580000000
  %. = select i1 %10, float %2, float %7
  %.1 = select i1 %10, float %7, float %3
  br label %"7"

"14":                                             ; preds = %"7", %"4", %entry
  %11 = phi float [ 0.000000e+00, %entry ], [ 1.000000e+00, %"4" ], [ %2, %"7" ]
  ret float %11
}

; Function Attrs: uwtable
define float @library__log(float %x1) #0 align 2 {
entry:
  %0 = fcmp ole float %x1, 0.000000e+00
  %1 = fcmp oeq float %x1, 1.000000e+00
  %or.cond = or i1 %0, %1
  br i1 %or.cond, label %"11", label %"6"

"6":                                              ; preds = %entry
  %2 = fadd float %x1, 1.000000e+00
  %3 = fdiv float %2, 2.000000e+00
  %4 = call float @library__squareroot(float %x1) #0
  br label %"7"

"7":                                              ; preds = %"8", %"6"
  %5 = phi float [ %10, %"8" ], [ %3, %"6" ]
  %6 = phi float [ %12, %"8" ], [ %4, %"6" ]
  %7 = fsub float %5, %6
  %8 = fcmp ogt float %7, 0x3EB0C6F7A0000000
  br i1 %8, label %"8", label %"9"

"8":                                              ; preds = %"7"
  %9 = fadd float %5, %6
  %10 = fdiv float %9, 2.000000e+00
  %11 = fmul float %10, %6
  %12 = call float @library__squareroot(float %11) #0
  br label %"7"

"9":                                              ; preds = %"7"
  %13 = fsub float %x1, 1.000000e+00
  %14 = fmul float %13, 2.000000e+00
  %15 = fadd float %5, %6
  %16 = fdiv float %14, %15
  br label %"11"

"11":                                             ; preds = %"9", %entry
  %17 = phi float [ %16, %"9" ], [ 0.000000e+00, %entry ]
  ret float %17
}

; Function Attrs: uwtable
define float @library__sininverse(float %x1) #0 align 2 {
entry:
  %0 = fcmp oeq float %x1, 0.000000e+00
  br i1 %0, label %"16", label %"4"

"4":                                              ; preds = %entry
  %1 = call float @fabsf(float %x1) #4
  %2 = fcmp ogt float %1, 1.000000e+00
  br i1 %2, label %"16", label %"6"

"6":                                              ; preds = %"4"
  %3 = fcmp oeq float %x1, 1.000000e+00
  br i1 %3, label %"16", label %"8"

"8":                                              ; preds = %"6"
  %4 = fcmp oeq float %x1, -1.000000e+00
  br i1 %4, label %"16", label %"10"

"10":                                             ; preds = %"8"
  %5 = fcmp olt float %x1, 0.000000e+00
  %6 = fsub float -0.000000e+00, %x1
  %7 = select i1 %5, i8 1, i8 0
  %8 = select i1 %5, float %6, float %x1
  %9 = fcmp oge float %8, 5.000000e-01
  br i1 %9, label %"13", label %"14"

"13":                                             ; preds = %"10"
  %10 = fsub float 1.000000e+00, %8
  %11 = fdiv float %10, 2.000000e+00
  %12 = call float @library__squareroot(float %11) #0
  br label %"14"

"14":                                             ; preds = %"13", %"10"
  %13 = phi i8 [ 1, %"13" ], [ 0, %"10" ]
  %14 = phi float [ %12, %"13" ], [ %8, %"10" ]
  %15 = fmul float %14, %14
  %16 = fmul float %14, %15
  %17 = fdiv float %16, 3.000000e+00
  %18 = fmul float %17, 5.000000e-01
  %19 = fadd float %14, %18
  %20 = fmul float %14, %16
  %21 = fmul float %14, %20
  %22 = fdiv float %21, 5.000000e+00
  %23 = fmul float %22, 3.750000e-01
  %24 = fadd float %19, %23
  %25 = fmul float %14, %21
  %26 = fmul float %14, %25
  %27 = fdiv float %26, 7.000000e+00
  %28 = fmul float %27, 3.125000e-01
  %29 = fadd float %24, %28
  %30 = fmul float %14, %26
  %31 = fmul float %14, %30
  %32 = fdiv float %31, 9.000000e+00
  %33 = fmul float %32, 0x3FD1800000000000
  %34 = fadd float %29, %33
  %35 = fmul float %14, %31
  %36 = fmul float %14, %35
  %37 = fdiv float %36, 1.100000e+01
  %38 = fmul float %37, 0x3FCF800000000000
  %39 = fadd float %34, %38
  %40 = fmul float %14, %36
  %41 = fmul float %14, %40
  %42 = fdiv float %41, 1.300000e+01
  %43 = fmul float %42, 0x3FCCE00000000000
  %44 = fadd float %39, %43
  %45 = fmul float %14, %41
  %46 = fmul float %14, %45
  %47 = fdiv float %46, 1.500000e+01
  %48 = fmul float %47, 0x3FCAD00000000000
  %49 = fadd float %44, %48
  %50 = fmul float %14, %46
  %51 = fmul float %14, %50
  %52 = fdiv float %51, 1.700000e+01
  %53 = fmul float %52, 0x3FC9230000000000
  %54 = fadd float %49, %53
  %55 = fmul float %14, %51
  %56 = fmul float %14, %55
  %57 = fdiv float %56, 1.900000e+01
  %58 = fmul float %57, 0x3F92FE0000000000
  %59 = fadd float %54, %58
  %60 = fmul float %14, %56
  %61 = fmul float %14, %60
  %62 = fdiv float %61, 2.100000e+01
  %63 = fmul float %62, 0x3F920AE660000000
  %64 = fadd float %59, %63
  %65 = fmul float %14, %61
  %66 = fmul float %14, %65
  %67 = fdiv float %66, 2.300000e+01
  %68 = fmul float %67, 0x3F9138F340000000
  %69 = fadd float %64, %68
  %70 = fmul float %14, %66
  %71 = fmul float %14, %70
  %72 = fdiv float %71, 2.500000e+01
  %73 = fmul float %72, 0x3F90813E60000000
  %74 = fadd float %69, %73
  %75 = fmul float %14, %71
  %76 = fmul float %14, %75
  %77 = fdiv float %76, 2.700000e+01
  %78 = fmul float %77, 0x3F8FBD7800000000
  %79 = fadd float %74, %78
  %80 = fmul float %14, %76
  %81 = fmul float %14, %80
  %82 = fdiv float %81, 2.900000e+01
  %83 = fmul float %82, 0x3F8E9B4600000000
  %84 = fadd float %79, %83
  %85 = fmul float %14, %81
  %86 = fmul float %14, %85
  %87 = fdiv float %86, 3.100000e+01
  %88 = fmul float %87, 0x3F8D961900000000
  %89 = fadd float %84, %88
  %90 = icmp ne i8 %13, 0
  br i1 %90, label %"15", label %"16"

"15":                                             ; preds = %"14"
  %91 = fmul float %89, 2.000000e+00
  %92 = fsub float 0x3FF921FB00000000, %91
  br label %"16"

"16":                                             ; preds = %"15", %"14", %"8", %"6", %"4", %entry
  %93 = phi i8 [ %7, %"15" ], [ %7, %"14" ], [ undef, %entry ], [ undef, %"4" ], [ undef, %"6" ], [ undef, %"8" ]
  %94 = phi float [ %92, %"15" ], [ %89, %"14" ], [ 0.000000e+00, %entry ], [ 0.000000e+00, %"4" ], [ 0x3FF921FB00000000, %"6" ], [ 0xBFF921FB00000000, %"8" ]
  %95 = icmp ne i8 %93, 0
  %96 = fsub float -0.000000e+00, %94
  %spec.select = select i1 %95, float %96, float %94
  ret float %spec.select
}

declare float @fabsf(float)

; Function Attrs: uwtable
define float @library__taninverse(float %x1) #0 align 2 {
entry:
  %0 = fcmp oeq float %x1, 0.000000e+00
  br i1 %0, label %"11", label %"4"

"4":                                              ; preds = %entry
  %1 = fcmp olt float %x1, 0.000000e+00
  %2 = fsub float -0.000000e+00, %x1
  %3 = select i1 %1, i8 1, i8 0
  %4 = select i1 %1, float %2, float %x1
  %5 = fcmp olt float %4, 0x3FC0D9F900000000
  br i1 %5, label %"7", label %"8"

"7":                                              ; preds = %"4"
  %6 = fmul float %4, 0x3FC90E0A80000000
  %7 = fmul float %4, %6
  %8 = fsub float 0x3FD554BD00000000, %7
  %9 = fmul float %4, %4
  %10 = fmul float %8, %9
  %11 = fsub float 0x3FEFFFFDE0000000, %10
  %12 = fmul float %4, %11
  br label %"11"

"8":                                              ; preds = %"4"
  %13 = fcmp ole float %4, 1.000000e+00
  %14 = fmul float %4, %4
  br i1 %13, label %"9", label %"10"

"9":                                              ; preds = %"8"
  %15 = fadd float %14, 0x3FFCC5A1C0000000
  %16 = fdiv float 0x3FF5093420000000, %15
  %17 = fadd float %14, 0x400F8C5980000000
  %18 = fsub float %17, %16
  %19 = fdiv float 0x40038FC7A0000000, %18
  %20 = fadd float %19, 0x3FCE91C080000000
  %21 = fmul float %4, %20
  br label %"11"

"10":                                             ; preds = %"8"
  %22 = fadd float %14, 0x3FD94D7AE0000000
  %23 = fdiv float 0x3FB044D020000000, %22
  %24 = fadd float %14, 0x3FE327BB20000000
  %25 = fsub float %24, %23
  %26 = fdiv float 0x3FD5549300000000, %25
  %27 = fsub float 0x3FEFFFFDE0000000, %26
  %28 = fdiv float %27, %4
  %29 = fsub float 0x3FF921FB00000000, %28
  br label %"11"

"11":                                             ; preds = %"10", %"9", %"7", %entry
  %30 = phi i8 [ %3, %"10" ], [ %3, %"9" ], [ %3, %"7" ], [ 0, %entry ]
  %31 = phi float [ %29, %"10" ], [ %21, %"9" ], [ %12, %"7" ], [ 0.000000e+00, %entry ]
  %32 = icmp ne i8 %30, 0
  %33 = fsub float -0.000000e+00, %31
  %spec.select = select i1 %32, float %33, float %31
  ret float %spec.select
}

; Function Attrs: uwtable
define void @_ada_mnguidancedriver() unnamed_addr #0 align 2 {
entry:
  store i16 1, i16* @main__minorinmajor, align 2
  store i16 0, i16* @main__stageflg, align 2
  store i16 -1, i16* @main__stageflgc, align 2
  store i32 1, i32* @main__cyclecount, align 4
  store float 2.800000e+03, float* @main__altitudeinfo, align 4
  store float 7.156000e+04, float* @main__apogee, align 4
  store float 1.200000e+02, float* @lookup__distance_incr, align 4
  call void @main__guid_minor()
  ret void
}

; Function Attrs: inlinehint uwtable
define void @lookup__TlookuptableBIP(i64 %_init.0, i64 %_init.1) unnamed_addr #1 align 2 {
entry:
  ret void
}

; Function Attrs: uwtable
define void @lookup__output_lookup(float %distance_current, [5 x float]* %quaternion_out) #0 align 2 personality i8* bitcast (void (float, [5 x float]*)* @lookup__output_lookup to i8*) {
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

"74":                                             ; preds = %"72", %"40"
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

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #2

; Function Attrs: uwtable
define void @main__stageflags() local_unnamed_addr #0 align 2 {
entry:
  %0 = load i16, i16* @main__stageflg, align 2
  %1 = load i16, i16* @main__stageflgc, align 2
  %2 = add i16 %0, %1
  %3 = icmp eq i16 %2, -1
  br i1 %3, label %"3", label %"77"

"3":                                              ; preds = %entry
  %4 = load i32, i32* @main__cyclecount, align 4
  %5 = uitofp i32 %4 to float
  %6 = fcmp ult float %5, 0xC7EFFFFFE0000000
  br i1 %6, label %"5", label %"4"

"4":                                              ; preds = %"3"
  %7 = fcmp ugt float %5, 0x47EFFFFFE0000000
  br i1 %7, label %"5", label %"6"

"5":                                              ; preds = %"4", %"3"
  call void @__gnat_rcheck_CE_Range_Check(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.cst.37, i64 0, i64 0), i32 14) #3
  unreachable

"6":                                              ; preds = %"4"
  %8 = fmul float %5, 0x3F947AE140000000
  store float %8, float* @main__time, align 4
  %9 = load i16, i16* @main__minorinmajor, align 2
  %10 = icmp eq i16 %9, 1
  br i1 %10, label %"7", label %"8"

"7":                                              ; preds = %"6"
  store float %8, float* @main__major_time, align 4
  br label %"8"

"8":                                              ; preds = %"7", %"6"
  %11 = load i16, i16* @main__stageflg, align 2
  %12 = icmp eq i16 %11, 119
  br i1 %12, label %"46", label %"9"

"9":                                              ; preds = %"8"
  %13 = icmp ugt i16 %11, 119
  br i1 %13, label %"17", label %"10"

"10":                                             ; preds = %"9"
  %14 = icmp eq i16 %11, 51
  br i1 %14, label %"31", label %"11"

"11":                                             ; preds = %"10"
  %15 = icmp ugt i16 %11, 51
  br i1 %15, label %"14", label %"12"

"12":                                             ; preds = %"11"
  switch i16 %11, label %return [
    i16 17, label %"25"
    i16 34, label %"28"
  ]

"14":                                             ; preds = %"11"
  switch i16 %11, label %return [
    i16 85, label %"38"
    i16 102, label %"42"
    i16 68, label %"34"
  ]

"17":                                             ; preds = %"9"
  %16 = icmp eq i16 %11, 187
  br i1 %16, label %"59", label %"18"

"18":                                             ; preds = %"17"
  %17 = icmp ugt i16 %11, 187
  br i1 %17, label %"22", label %"19"

"19":                                             ; preds = %"18"
  switch i16 %11, label %return [
    i16 153, label %"52"
    i16 170, label %"55"
    i16 136, label %"49"
  ]

"22":                                             ; preds = %"18"
  switch i16 %11, label %return [
    i16 221, label %"66"
    i16 238, label %"70"
    i16 204, label %"63"
  ]

"25":                                             ; preds = %"12"
  %18 = load i16, i16* @main__outflag, align 2
  %19 = icmp eq i16 %18, 17
  br i1 %19, label %"26", label %return

"26":                                             ; preds = %"25"
  %20 = load float, float* @main__time, align 4
  store float %20, float* @main__liftoff, align 4
  store i16 34, i16* @main__outflag, align 2
  br label %return

"28":                                             ; preds = %"12"
  %21 = load i16, i16* @main__outflag, align 2
  %22 = icmp eq i16 %21, 34
  br i1 %22, label %"29", label %return

"29":                                             ; preds = %"28"
  store i16 1, i16* @main__step2, align 2
  store i16 51, i16* @main__outflag, align 2
  br label %return

"31":                                             ; preds = %"10"
  %23 = load i16, i16* @main__outflag, align 2
  %24 = icmp eq i16 %23, 51
  br i1 %24, label %"32", label %return

"32":                                             ; preds = %"31"
  %25 = load float, float* @main__time, align 4
  store float %25, float* @main__stage2_start, align 4
  store i16 68, i16* @main__outflag, align 2
  br label %return

"34":                                             ; preds = %"14"
  %26 = load i16, i16* @main__outflag, align 2
  %27 = icmp eq i16 %26, 68
  %28 = load i16, i16* @main__minorinmajor, align 2
  %29 = icmp eq i16 %28, 1
  %or.cond = and i1 %27, %29
  br i1 %or.cond, label %"36", label %return

"36":                                             ; preds = %"34"
  store i16 1, i16* @main__step4, align 2
  store i16 85, i16* @main__outflag, align 2
  br label %return

"38":                                             ; preds = %"14"
  %30 = load i16, i16* @main__outflag, align 2
  %31 = icmp eq i16 %30, 85
  %32 = load i16, i16* @main__minorinmajor, align 2
  %33 = icmp eq i16 %32, 1
  %or.cond3 = and i1 %31, %33
  br i1 %or.cond3, label %"40", label %return

"40":                                             ; preds = %"38"
  store i16 1, i16* @main__step5, align 2
  store i16 102, i16* @main__outflag, align 2
  br label %return

"42":                                             ; preds = %"14"
  %34 = load i16, i16* @main__outflag, align 2
  %35 = icmp eq i16 %34, 102
  %36 = load i16, i16* @main__minorinmajor, align 2
  %37 = icmp eq i16 %36, 1
  %or.cond5 = and i1 %35, %37
  br i1 %or.cond5, label %"44", label %return

"44":                                             ; preds = %"42"
  store i16 1, i16* @main__step6, align 2
  store i16 119, i16* @main__outflag, align 2
  br label %return

"46":                                             ; preds = %"8"
  %38 = load i16, i16* @main__outflag, align 2
  %39 = icmp eq i16 %38, 119
  br i1 %39, label %"47", label %return

"47":                                             ; preds = %"46"
  store i16 1, i16* @main__step7, align 2
  store i16 136, i16* @main__outflag, align 2
  br label %return

"49":                                             ; preds = %"19"
  %40 = load i16, i16* @main__outflag, align 2
  %41 = icmp eq i16 %40, 136
  br i1 %41, label %"50", label %return

"50":                                             ; preds = %"49"
  store i16 1, i16* @main__step8, align 2
  store i16 153, i16* @main__outflag, align 2
  br label %return

"52":                                             ; preds = %"19"
  %42 = load i16, i16* @main__outflag, align 2
  %43 = icmp eq i16 %42, 153
  br i1 %43, label %"53", label %return

"53":                                             ; preds = %"52"
  %44 = load float, float* @main__time, align 4
  store float %44, float* @main__stage3_start, align 4
  store i16 170, i16* @main__outflag, align 2
  br label %return

"55":                                             ; preds = %"19"
  %45 = load i16, i16* @main__outflag, align 2
  %46 = icmp eq i16 %45, 170
  %47 = load i16, i16* @main__minorinmajor, align 2
  %48 = icmp eq i16 %47, 1
  %or.cond7 = and i1 %46, %48
  br i1 %or.cond7, label %"57", label %return

"57":                                             ; preds = %"55"
  store i16 1, i16* @main__step10, align 2
  store i16 187, i16* @main__outflag, align 2
  br label %return

"59":                                             ; preds = %"17"
  %49 = load i16, i16* @main__outflag, align 2
  %50 = icmp eq i16 %49, 187
  %51 = load i16, i16* @main__minorinmajor, align 2
  %52 = icmp eq i16 %51, 1
  %or.cond9 = and i1 %50, %52
  br i1 %or.cond9, label %"61", label %return

"61":                                             ; preds = %"59"
  store i16 1, i16* @main__step11, align 2
  store i16 204, i16* @main__outflag, align 2
  br label %return

"63":                                             ; preds = %"22"
  %53 = load i16, i16* @main__outflag, align 2
  %54 = icmp eq i16 %53, 204
  br i1 %54, label %"64", label %return

"64":                                             ; preds = %"63"
  store i16 1, i16* @main__step12, align 2
  store i16 221, i16* @main__outflag, align 2
  br label %return

"66":                                             ; preds = %"22"
  %55 = load i16, i16* @main__outflag, align 2
  %56 = icmp eq i16 %55, 221
  %57 = load i16, i16* @main__minorinmajor, align 2
  %58 = icmp eq i16 %57, 1
  %or.cond11 = and i1 %56, %58
  br i1 %or.cond11, label %"68", label %return

"68":                                             ; preds = %"66"
  store i16 1, i16* @main__step13, align 2
  store i16 0, i16* @main__step14, align 2
  store float 5.000000e+01, float* @major_cycle__duration, align 4
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast ([5 x float]* @major_cycle__desiredq to i8*), i8* bitcast ([5 x float]* @main__man_desiredq to i8*), i64 20, i32 4, i1 false)
  store i16 238, i16* @main__outflag, align 2
  br label %return

"70":                                             ; preds = %"22"
  %59 = load i16, i16* @main__outflag, align 2
  %60 = icmp eq i16 %59, 238
  %61 = load i16, i16* @main__minorinmajor, align 2
  %62 = icmp eq i16 %61, 1
  %or.cond13 = and i1 %60, %62
  br i1 %or.cond13, label %"72", label %return

"72":                                             ; preds = %"70"
  store i16 1, i16* @main__step14, align 2
  store i16 0, i16* @main__step13, align 2
  store i16 0, i16* @minor_cycle__firstcycle_mnvre, align 2
  store i16 221, i16* @main__outflag, align 2
  br label %return

"77":                                             ; preds = %entry
  store i16 1, i16* @main__combinederrorflag, align 2
  br label %return

return:                                           ; preds = %"77", %"72", %"70", %"68", %"66", %"64", %"63", %"61", %"59", %"57", %"55", %"53", %"52", %"50", %"49", %"47", %"46", %"44", %"42", %"40", %"38", %"36", %"34", %"32", %"31", %"29", %"28", %"26", %"25", %"22", %"19", %"14", %"12"
  ret void
}

; Function Attrs: noreturn
declare void @__gnat_rcheck_CE_Range_Check(i8*, i32) #3

; Function Attrs: uwtable
define void @main__outputflags_minor() local_unnamed_addr #0 align 2 {
entry:
  %0 = load i16, i16* @main__event4, align 2
  %1 = icmp eq i16 %0, 1
  %2 = load i16, i16* @main__outflag1, align 2
  %3 = icmp eq i16 %2, 0
  %or.cond = and i1 %1, %3
  br i1 %or.cond, label %"4", label %"5"

"4":                                              ; preds = %entry
  store i16 4369, i16* @main__guidoutflag, align 2
  store i16 -4370, i16* @main__guidoutflagc, align 2
  store i16 1, i16* @main__outflag1, align 2
  br label %"5"

"5":                                              ; preds = %"4", %entry
  %4 = load i16, i16* @main__offstage2, align 2
  %5 = icmp eq i16 %4, 1
  %6 = load i16, i16* @main__step7, align 2
  %7 = icmp eq i16 %6, 1
  %or.cond3 = and i1 %5, %7
  %8 = load i16, i16* @main__outflag2, align 2
  %9 = icmp eq i16 %8, 0
  %or.cond5 = and i1 %or.cond3, %9
  br i1 %or.cond5, label %"8", label %"9"

"8":                                              ; preds = %"5"
  store i16 8738, i16* @main__guidoutflag, align 2
  store i16 -8739, i16* @main__guidoutflagc, align 2
  store i16 1, i16* @main__outflag2, align 2
  br label %"9"

"9":                                              ; preds = %"8", %"5"
  %10 = load i16, i16* @main__offstage2, align 2
  %11 = icmp eq i16 %10, 1
  %12 = load i16, i16* @main__outflag3, align 2
  %13 = icmp eq i16 %12, 0
  %or.cond7 = and i1 %11, %13
  br i1 %or.cond7, label %"11", label %return

"11":                                             ; preds = %"9"
  store i16 13107, i16* @main__guidoutflag, align 2
  store i16 -13108, i16* @main__guidoutflagc, align 2
  store i16 1, i16* @main__outflag3, align 2
  br label %return

return:                                           ; preds = %"11", %"9"
  ret void
}

; Function Attrs: uwtable
define void @main__guid_minor() #0 align 2 {
entry:
  call void @main__stageflags() #0
  %0 = load i16, i16* @main__step14, align 2
  %1 = icmp eq i16 %0, 1
  br i1 %1, label %return, label %"5"

"5":                                              ; preds = %entry
  %2 = load i16, i16* @main__step13, align 2
  %3 = icmp eq i16 %2, 1
  br i1 %3, label %"6", label %"7"

"6":                                              ; preds = %"5"
  call void @minor_cycle__manoeuvre()
  br label %return

"7":                                              ; preds = %"5"
  %4 = load i16, i16* @main__step10, align 2
  %5 = icmp eq i16 %4, 1
  br i1 %5, label %"8", label %"9"

"8":                                              ; preds = %"7"
  call void @minor_cycle__stage3_minor()
  br label %return

"9":                                              ; preds = %"7"
  %6 = load i16, i16* @main__step4, align 2
  %7 = icmp eq i16 %6, 1
  br i1 %7, label %"10", label %"11"

"10":                                             ; preds = %"9"
  call void @minor_cycle__stage2_minor()
  call void @main__outputflags_minor() #0
  br label %return

"11":                                             ; preds = %"9"
  call void @minor_cycle__stage1_minor()
  br label %return

return:                                           ; preds = %"11", %"10", %"8", %"6", %entry
  ret void
}

; Function Attrs: uwtable
define void @main__guid_major() #0 align 2 {
entry:
  %0 = load i16, i16* @main__step14, align 2
  %1 = icmp eq i16 %0, 1
  br i1 %1, label %return, label %"5"

"5":                                              ; preds = %entry
  %2 = load i16, i16* @main__step13, align 2
  %3 = icmp eq i16 %2, 1
  br i1 %3, label %"6", label %"7"

"6":                                              ; preds = %"5"
  call void @major_cycle__manoeuvre()
  br label %return

"7":                                              ; preds = %"5"
  %4 = load i16, i16* @main__step10, align 2
  %5 = icmp eq i16 %4, 1
  br i1 %5, label %"8", label %"9"

"8":                                              ; preds = %"7"
  call void @major_cycle__stage3_major()
  br label %return

"9":                                              ; preds = %"7"
  call void @major_cycle__stage2_major()
  br label %return

return:                                           ; preds = %"9", %"8", %"6", %entry
  ret void
}

; Function Attrs: uwtable
define void @main__firstinit() #0 align 2 {
entry:
  store i16 1, i16* @lookup__iterationcount, align 2
  store i16 1, i16* @main__minorinmajor, align 2
  store float 0.000000e+00, float* @major_cycle__velocityincrmj, align 4
  store float 0.000000e+00, float* @major_cycle__velocityincrmn, align 4
  store i16 0, i16* @major_cycle__minorflag_stage2, align 2
  store i16 0, i16* @major_cycle__minorflag_stage3, align 2
  store i16 1, i16* @major_cycle__enterstage2, align 2
  store i16 0, i16* @major_cycle__event4, align 2
  store i16 0, i16* @major_cycle__velflag, align 2
  store i16 1, i16* @major_cycle__enterstage3, align 2
  store i16 0, i16* @minor_cycle__offstage2, align 2
  store i16 0, i16* @minor_cycle__offstage3, align 2
  store i16 1, i16* @minor_cycle__firstcycle_stage1, align 2
  store i16 1, i16* @minor_cycle__firstcycle_stage2, align 2
  store i16 1, i16* @minor_cycle__firstcycle_stage3, align 2
  store i16 17, i16* @main__outflag, align 2
  store i16 0, i16* @main__step12, align 2
  store i16 0, i16* @main__step8, align 2
  store i16 0, i16* @main__step7, align 2
  store i16 0, i16* @main__step11, align 2
  store i16 0, i16* @main__step5, align 2
  store i16 0, i16* @main__step6, align 2
  store i16 0, i16* @main__step4, align 2
  store i16 0, i16* @main__step10, align 2
  store i16 0, i16* @main__step13, align 2
  store i16 0, i16* @main__step14, align 2
  store i16 0, i16* @main__step2, align 2
  store i16 0, i16* @main__event4, align 2
  store i16 0, i16* @main__offstage2, align 2
  store i16 0, i16* @main__offstage3, align 2
  store i16 0, i16* @main__outflag1, align 2
  store i16 0, i16* @main__outflag2, align 2
  store i16 0, i16* @main__outflag3, align 2
  store i16 0, i16* @main__minorflag_stage2, align 2
  store i16 0, i16* @main__minorflag_stage3, align 2
  store i16 0, i16* @main__combinederrorflag, align 2
  store i16 0, i16* @main__guidoutflag, align 2
  store i16 -1, i16* @main__guidoutflagc, align 2
  store float 0.000000e+00, float* getelementptr inbounds ([5 x float], [5 x float]* @main__brate, i64 0, i64 0), align 4
  store float 0.000000e+00, float* getelementptr inbounds ([5 x float], [5 x float]* @main__brate, i64 0, i64 1), align 4
  store float 0.000000e+00, float* getelementptr inbounds ([5 x float], [5 x float]* @main__brate, i64 0, i64 2), align 4
  store float 0.000000e+00, float* @main__stage_time, align 4
  store float 0.000000e+00, float* @main__effectivegravity, align 4
  store float 0.000000e+00, float* @main__angler, align 4
  store float 0.000000e+00, float* @main__angley, align 4
  store float 0.000000e+00, float* @main__guidvel_u, align 4
  store float 0.000000e+00, float* @main__guidvel_v, align 4
  store float 0.000000e+00, float* @main__guidvel_w, align 4
  store float 0.000000e+00, float* @main__steercoeffa, align 4
  store float 0.000000e+00, float* @main__steercoeffb, align 4
  store float 0.000000e+00, float* @main__steercoeffc, align 4
  store float 0.000000e+00, float* @main__steercoeffd, align 4
  store float 0.000000e+00, float* @main__posdefoutofplane, align 4
  store float 0.000000e+00, float* @main__defpos, align 4
  store float 0.000000e+00, float* @main__defvel, align 4
  store float 0.000000e+00, float* @main__matrix11, align 4
  store float 0.000000e+00, float* @main__matrix12, align 4
  store float 0.000000e+00, float* @main__matrix22, align 4
  store float 0.000000e+00, float* @main__ttg, align 4
  store i16 0, i16* @minor_cycle__firstcycle_mnvre, align 2
  ret void
}

; Function Attrs: uwtable
define void @main___elabb() unnamed_addr #0 align 2 {
entry:
  call void @__gnat_rcheck_CE_Range_Check(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.cst.37, i64 0, i64 0), i32 8) #3
  unreachable
}

; Function Attrs: uwtable
define void @main___elabs() unnamed_addr #0 align 2 {
entry:
  call void @__gnat_rcheck_CE_Range_Check(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.cst.1, i64 0, i64 0), i32 11) #3
  unreachable
}

; Function Attrs: uwtable
define void @_ada_mjguidancedriver() unnamed_addr #0 align 2 {
entry:
  store float 0x3FBEB851E0000000, float* @main__velu, align 4
  store float 0x3FD6666660000000, float* @main__velv, align 4
  store float 0x400E3D70A0000000, float* @main__velw, align 4
  store float 0x40226B8520000000, float* @main__posx, align 4
  store float 0x4003333340000000, float* @main__posy, align 4
  store float 0x3FFB333340000000, float* @main__posz, align 4
  store float 0x40209999A0000000, float* @main__radialdist, align 4
  call void @main__guid_major()
  ret void
}

; Function Attrs: uwtable
define void @major_cycle__stage2_major() #0 align 2 {
entry:
  %0 = load i16, i16* @main__step8, align 2
  %1 = icmp eq i16 %0, 0
  %2 = load i16, i16* @main__offstage2, align 2
  %3 = icmp eq i16 %2, 0
  %or.cond = and i1 %1, %3
  br i1 %or.cond, label %"4", label %"5"

"4":                                              ; preds = %entry
  call void @major_cycle__constantq([5 x float]* @major_cycle__majorprev_q)
  br label %return

"5":                                              ; preds = %entry
  %4 = load i16, i16* @major_cycle__enterstage2, align 2
  %5 = icmp eq i16 %4, 1
  br i1 %5, label %"6", label %"7"

"6":                                              ; preds = %"5"
  call void @major_cycle__stage2_initialise()
  store i16 0, i16* @major_cycle__enterstage2, align 2
  br label %"7"

"7":                                              ; preds = %"6", %"5"
  %6 = load float, float* @main__posx, align 4
  store float %6, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__position, i64 0, i64 0), align 4
  %7 = load float, float* @main__posy, align 4
  store float %7, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__position, i64 0, i64 1), align 4
  %8 = load float, float* @main__posz, align 4
  store float %8, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__position, i64 0, i64 2), align 4
  %9 = load float, float* @main__velu, align 4
  store float %9, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__velocity, i64 0, i64 0), align 4
  %10 = load float, float* @main__velv, align 4
  store float %10, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__velocity, i64 0, i64 1), align 4
  %11 = load float, float* @main__velw, align 4
  store float %11, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__velocity, i64 0, i64 2), align 4
  %12 = load float, float* @main__major_time, align 4
  %13 = load float, float* @main__stage2_start, align 4
  %14 = fsub float %12, %13
  store float %14, float* @major_cycle__stage_time, align 4
  %15 = load i16, i16* @major_cycle__velflag, align 2
  %16 = icmp eq i16 %15, 1
  br i1 %16, label %"8", label %"9"

"8":                                              ; preds = %"7"
  %17 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__velocity, i64 0, i64 0), align 4
  %18 = fmul float %17, %17
  %19 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__velocity, i64 0, i64 1), align 4
  %20 = fmul float %19, %19
  %21 = fadd float %18, %20
  %22 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__velocity, i64 0, i64 2), align 4
  %23 = fmul float %22, %22
  %24 = fadd float %21, %23
  %25 = call float @library__squareroot(float %24)
  store float %25, float* @major_cycle__instvelocity, align 4
  %26 = load float, float* @major_cycle__instvelocityprev, align 4
  %27 = fsub float %25, %26
  store float %27, float* @major_cycle__velocityincrmj, align 4
  %28 = load float, float* @major_cycle__instvelocity, align 4
  %29 = fadd float %28, %27
  store float %29, float* @major_cycle__velocitycoeff, align 4
  %30 = load float, float* @major_cycle__velocityincrmj, align 4
  %31 = fdiv float %30, 2.500000e+01
  store float %31, float* @major_cycle__velocityincrmn, align 4
  %32 = load float, float* @major_cycle__instvelocity, align 4
  store float %32, float* @major_cycle__instvelocityprev, align 4
  br label %"10"

"9":                                              ; preds = %"7"
  store float 0.000000e+00, float* @major_cycle__velocityincrmn, align 4
  store float 0.000000e+00, float* @major_cycle__velocitycoeff, align 4
  br label %"10"

"10":                                             ; preds = %"9", %"8"
  %33 = load i16, i16* @major_cycle__minorflag_stage2, align 2
  %34 = icmp eq i16 %33, 1
  br i1 %34, label %"11", label %"12"

"11":                                             ; preds = %"10"
  call void @major_cycle__constantq([5 x float]* @major_cycle__majorprev_q)
  %35 = load float, float* @major_cycle__ttg, align 4
  %36 = fsub float %35, 5.000000e-01
  store float %36, float* @major_cycle__ttg, align 4
  br label %"21"

"12":                                             ; preds = %"10"
  call void @major_cycle__computation1([5 x float]* @major_cycle__position, [5 x float]* @major_cycle__dircos_stage2)
  %37 = call float @math__dotproduct([5 x float]* @major_cycle__dircos_u, [5 x float]* @major_cycle__velocity)
  store float %37, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 0), align 4
  %38 = call float @math__dotproduct([5 x float]* @major_cycle__dircos_v, [5 x float]* @major_cycle__velocity)
  store float %38, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 1), align 4
  %39 = call float @math__dotproduct([5 x float]* @major_cycle__dircos, [5 x float]* @major_cycle__velocity)
  store float %39, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 2), align 4
  %40 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 0), align 4
  %41 = fmul float %40, %40
  %42 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 1), align 4
  %43 = fmul float %42, %42
  %44 = fadd float %41, %43
  store float %44, float* @major_cycle__velsqr, align 4
  %45 = load float, float* @major_cycle__tempa, align 4
  %46 = fdiv float 0x42F6BCC420000000, %45
  %47 = fsub float %46, %44
  %48 = fdiv float %47, %45
  store float %48, float* @major_cycle__effectivegravity, align 4
  %49 = call float @math__dotproduct([5 x float]* @major_cycle__dircos_v, [5 x float]* @major_cycle__dircos_stage2)
  store float %49, float* @major_cycle__templ, align 4
  %50 = call float @math__dotproduct([5 x float]* @major_cycle__position, [5 x float]* @major_cycle__dircos_stage2)
  %51 = fsub float -0.000000e+00, %50
  store float %51, float* @major_cycle__distvelaxis, align 4
  %52 = load float, float* @major_cycle__templ, align 4
  %53 = fdiv float %51, %52
  store float %53, float* @major_cycle__distvelaxis, align 4
  %54 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 0), align 4
  %55 = load float, float* @major_cycle__tempa, align 4
  %56 = fdiv float 0x421BD4D6E0000000, %55
  %57 = fdiv float %56, 0x40A6D39480000000
  %58 = fsub float %54, %57
  %59 = call float @library__exponent(float %58)
  store float %59, float* @major_cycle__tempp, align 4
  %60 = load float, float* @major_cycle__stage_time, align 4
  %61 = fsub float 0x4072903120000000, %60
  store float %61, float* @major_cycle__tempt, align 4
  %62 = load float, float* @major_cycle__tempp, align 4
  %63 = fsub float 1.000000e+00, %62
  %64 = fmul float %63, %61
  store float %64, float* @major_cycle__ttg, align 4
  %65 = load float, float* @major_cycle__stage_time, align 4
  %66 = fadd float %64, %65
  store float %66, float* @major_cycle__total_time_stage2, align 4
  %67 = load float, float* @major_cycle__stage_time, align 4
  %68 = load float, float* @major_cycle__tempa, align 4
  %69 = load float, float* @major_cycle__effectivegravity, align 4
  %70 = call float @algorithm__compangler([5 x float]* @major_cycle__guidvel, float %69, float %68, float %66, float %67)
  store float %70, float* @major_cycle__angler, align 4
  store float %70, float* @main__angler, align 4
  %71 = load float, float* @major_cycle__stage_time, align 4
  %72 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 1), align 4
  %73 = load float, float* @major_cycle__distvelaxis, align 4
  %74 = call float @algorithm__compangley(float %73, float %72, float %71)
  store float %74, float* @major_cycle__angley, align 4
  store float %74, float* @main__angley, align 4
  %75 = load float, float* @major_cycle__ttg, align 4
  %76 = fcmp olt float %75, 6.000000e+00
  %77 = load i16, i16* @major_cycle__velflag, align 2
  %78 = icmp eq i16 %77, 0
  %or.cond3 = and i1 %76, %78
  br i1 %or.cond3, label %"14", label %"15"

"14":                                             ; preds = %"12"
  %79 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__velocity, i64 0, i64 0), align 4
  %80 = fmul float %79, %79
  %81 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__velocity, i64 0, i64 1), align 4
  %82 = fmul float %81, %81
  %83 = fadd float %80, %82
  %84 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__velocity, i64 0, i64 2), align 4
  %85 = fmul float %84, %84
  %86 = fadd float %83, %85
  %87 = call float @library__squareroot(float %86)
  store float %87, float* @major_cycle__instvelocity, align 4
  store float 0.000000e+00, float* @major_cycle__velocityincrmj, align 4
  store float 0.000000e+00, float* @major_cycle__velocityincrmn, align 4
  %88 = load float, float* @major_cycle__instvelocity, align 4
  store float %88, float* @major_cycle__velocitycoeff, align 4
  %89 = load float, float* @major_cycle__instvelocity, align 4
  store float %89, float* @major_cycle__instvelocityprev, align 4
  store i16 1, i16* @major_cycle__velflag, align 2
  br label %"15"

"15":                                             ; preds = %"14", %"12"
  %90 = load float, float* @major_cycle__ttg, align 4
  %91 = fcmp olt float %90, 1.350000e+01
  %92 = load i16, i16* @major_cycle__event4, align 2
  %93 = icmp eq i16 %92, 0
  %or.cond5 = and i1 %91, %93
  br i1 %or.cond5, label %"17", label %"18"

"17":                                             ; preds = %"15"
  store i16 1, i16* @major_cycle__event4, align 2
  br label %"18"

"18":                                             ; preds = %"17", %"15"
  %94 = load float, float* @major_cycle__angley, align 4
  %95 = load float, float* @major_cycle__angler, align 4
  call void @math__guidecitransform([5 x float]* @major_cycle__dircos_u, [5 x float]* @major_cycle__dircos_v, [5 x float]* @major_cycle__dircos, float %95, float %94, [5 x float]* @major_cycle__tempres)
  call void @math__genrates([5 x float]* @major_cycle__tempres, [5 x float]* @major_cycle__majorprev_q, [5 x float]* @major_cycle__brate)
  %96 = load float, float* @major_cycle__ttg, align 4
  %97 = fcmp olt float %96, 5.000000e+00
  br i1 %97, label %"19", label %"20"

"19":                                             ; preds = %"18"
  store i16 1, i16* @major_cycle__minorflag_stage2, align 2
  br label %"20"

"20":                                             ; preds = %"19", %"18"
  call void @major_cycle__propagateq([5 x float]* @major_cycle__majorprev_q, [5 x float]* @major_cycle__brate)
  br label %"21"

"21":                                             ; preds = %"20", %"11"
  %98 = load float, float* @major_cycle__ttg, align 4
  store float %98, float* @major_cycle__ttg_prev, align 4
  %99 = load i16, i16* @major_cycle__minorflag_stage2, align 2
  store i16 %99, i16* @main__minorflag_stage2, align 2
  %100 = load float, float* @major_cycle__ttg, align 4
  store float %100, float* @main__ttg, align 4
  %101 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 0), align 4
  store float %101, float* @main__guidvel_u, align 4
  %102 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 1), align 4
  store float %102, float* @main__guidvel_v, align 4
  %103 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 2), align 4
  store float %103, float* @main__guidvel_w, align 4
  %104 = load float, float* @major_cycle__effectivegravity, align 4
  store float %104, float* @main__effectivegravity, align 4
  %105 = load float, float* @major_cycle__stage_time, align 4
  store float %105, float* @main__stage_time, align 4
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast ([5 x float]* @main__brate to i8*), i8* bitcast ([5 x float]* @major_cycle__brate to i8*), i64 20, i32 4, i1 false)
  br label %return

return:                                           ; preds = %"21", %"4"
  ret void
}

; Function Attrs: uwtable
define internal void @major_cycle__constantq([5 x float]* %prevq) local_unnamed_addr #0 align 2 {
entry:
  br label %"3"

"3":                                              ; preds = %"7", %entry
  %0 = phi i16 [ %15, %"7" ], [ 1, %entry ]
  %1 = icmp sle i16 %0, 25
  br i1 %1, label %"4", label %return

"4":                                              ; preds = %"3"
  br label %"5"

"5":                                              ; preds = %"6", %"4"
  %2 = phi i16 [ %14, %"6" ], [ 1, %"4" ]
  %3 = icmp sle i16 %2, 4
  br i1 %3, label %"6", label %"7"

"6":                                              ; preds = %"5"
  %4 = sext i16 %2 to i64
  %5 = sext i16 %0 to i64
  %6 = sub i64 %4, 1
  %7 = bitcast [5 x float]* %prevq to float*
  %8 = getelementptr inbounds float, float* %7, i64 %6
  %9 = load float, float* %8, align 4
  %10 = sub i64 %5, 1
  %11 = getelementptr inbounds [5 x float], [5 x float]* getelementptr inbounds ([25 x [5 x float]], [25 x [5 x float]]* @major_cycle__q_minor, i64 0, i64 0), i64 %10
  %12 = bitcast [5 x float]* %11 to float*
  %13 = getelementptr inbounds float, float* %12, i64 %6
  store float %9, float* %13, align 4
  %14 = add nsw i16 %2, 1
  br label %"5"

"7":                                              ; preds = %"5"
  %15 = add nsw i16 %0, 1
  br label %"3"

return:                                           ; preds = %"3"
  ret void
}

; Function Attrs: uwtable
define void @major_cycle__stage2_initialise() local_unnamed_addr #0 align 2 {
entry:
  store float 0.000000e+00, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__brate, i64 0, i64 0), align 4
  store float 0.000000e+00, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__brate, i64 0, i64 1), align 4
  store float 0.000000e+00, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__brate, i64 0, i64 2), align 4
  store float 0xC0818A3D80000000, float* @algorithm__velocityradial, align 4
  store float 0x40A6D39480000000, float* @algorithm__exhaustvel, align 4
  store float 0x4072C072C0000000, float* @algorithm__timeconst, align 4
  store float 1.600000e+02, float* @major_cycle__ttg_prev, align 4
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast ([5 x float]* @major_cycle__majorprev_q to i8*), i8* bitcast ([5 x float]* @main__qc to i8*), i64 20, i32 4, i1 false)
  ret void
}

; Function Attrs: uwtable
define void @major_cycle__computation1([5 x float]* %pos, [5 x float]* %targetdircos) local_unnamed_addr #0 align 2 personality i8* bitcast (void ([5 x float]*, [5 x float]*)* @major_cycle__computation1 to i8*) {
entry:
  %temp1 = alloca [5 x float]
  %0 = load float, float* @main__radialdist, align 4
  store float %0, float* @major_cycle__tempa, align 4
  %1 = fdiv float 1.000000e+00, %0
  %2 = bitcast [5 x float]* %pos to float*
  %3 = load float, float* %2, align 4
  %4 = fmul float %1, %3
  store float %4, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__dircos, i64 0, i64 0), align 4
  %5 = getelementptr inbounds float, float* %2, i64 1
  %6 = load float, float* %5, align 4
  %7 = fmul float %1, %6
  store float %7, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__dircos, i64 0, i64 1), align 4
  %8 = getelementptr inbounds float, float* %2, i64 2
  %9 = load float, float* %8, align 4
  %10 = fmul float %1, %9
  store float %10, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__dircos, i64 0, i64 2), align 4
  invoke void @math__crossproduct([5 x float]* %targetdircos, [5 x float]* @major_cycle__dircos, [5 x float]* %temp1)
          to label %"3" unwind label %"8"

"3":                                              ; preds = %entry
  invoke void @math__dircosine([5 x float]* %temp1, [5 x float]* @major_cycle__dircos_u)
          to label %"4" unwind label %"8"

"4":                                              ; preds = %"3"
  invoke void @math__crossproduct([5 x float]* @major_cycle__dircos, [5 x float]* @major_cycle__dircos_u, [5 x float]* %temp1)
          to label %"5" unwind label %"8"

"5":                                              ; preds = %"4"
  invoke void @math__dircosine([5 x float]* %temp1, [5 x float]* @major_cycle__dircos_v)
          to label %"6" unwind label %"8"

"6":                                              ; preds = %"5"
  %11 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__dircos, i64 0, i64 0), align 4
  %12 = fsub float -0.000000e+00, %11
  store float %12, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__dircos, i64 0, i64 0), align 4
  %13 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__dircos, i64 0, i64 1), align 4
  %14 = fsub float -0.000000e+00, %13
  store float %14, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__dircos, i64 0, i64 1), align 4
  %15 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__dircos, i64 0, i64 2), align 4
  %16 = fsub float -0.000000e+00, %15
  store float %16, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__dircos, i64 0, i64 2), align 4
  %17 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__dircos_v, i64 0, i64 0), align 4
  %18 = fsub float -0.000000e+00, %17
  store float %18, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__dircos_v, i64 0, i64 0), align 4
  %19 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__dircos_v, i64 0, i64 1), align 4
  %20 = fsub float -0.000000e+00, %19
  store float %20, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__dircos_v, i64 0, i64 1), align 4
  %21 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__dircos_v, i64 0, i64 2), align 4
  %22 = fsub float -0.000000e+00, %21
  store float %22, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__dircos_v, i64 0, i64 2), align 4
  %23 = bitcast [5 x float]* %temp1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 20, i8* %23)
  ret void

"8":                                              ; preds = %"5", %"4", %"3", %entry
  %exc = landingpad { i8*, i32 }
          cleanup
  %exc_ptr1 = extractvalue { i8*, i32 } %exc, 0
  %filter2 = extractvalue { i8*, i32 } %exc, 1
  %24 = bitcast [5 x float]* %temp1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 20, i8* %24)
  resume { i8*, i32 } %exc
}

; Function Attrs: uwtable
define void @major_cycle__propagateq([5 x float]* %prevq, [5 x float]* %brate) local_unnamed_addr #0 align 2 {
entry:
  store float 0.000000e+00, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__temp1, i64 0, i64 0), align 4
  %0 = bitcast [5 x float]* %brate to float*
  %1 = load float, float* %0, align 4
  %2 = fmul float %1, 0x3F847AE140000000
  store float %2, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__temp1, i64 0, i64 1), align 4
  %3 = getelementptr inbounds float, float* %0, i64 1
  %4 = load float, float* %3, align 4
  %5 = fmul float %4, 0x3F847AE140000000
  store float %5, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__temp1, i64 0, i64 2), align 4
  %6 = getelementptr inbounds float, float* %0, i64 2
  %7 = load float, float* %6, align 4
  %8 = fmul float %7, 0x3F847AE140000000
  store float %8, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__temp1, i64 0, i64 3), align 4
  call void @math__normalise([5 x float]* %prevq)
  br label %"3"

"3":                                              ; preds = %"7", %entry
  %9 = phi i16 [ %27, %"7" ], [ 1, %entry ]
  %10 = icmp sle i16 %9, 25
  br i1 %10, label %"4", label %return

"4":                                              ; preds = %"3"
  call void @math__multiply([5 x float]* %prevq, [5 x float]* @major_cycle__temp1, [5 x float]* @major_cycle__dotq)
  br label %"5"

"5":                                              ; preds = %"6", %"4"
  %11 = phi i16 [ %26, %"6" ], [ 1, %"4" ]
  %12 = icmp sle i16 %11, 4
  br i1 %12, label %"6", label %"7"

"6":                                              ; preds = %"5"
  %13 = sext i16 %11 to i64
  %14 = sub i64 %13, 1
  %15 = bitcast [5 x float]* %prevq to float*
  %16 = getelementptr inbounds float, float* %15, i64 %14
  %17 = load float, float* %16, align 4
  %18 = getelementptr inbounds float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__dotq, i64 0, i64 0), i64 %14
  %19 = load float, float* %18, align 4
  %20 = fadd float %17, %19
  store float %20, float* %16, align 4
  %21 = sext i16 %9 to i64
  %22 = sub i64 %21, 1
  %23 = getelementptr inbounds [5 x float], [5 x float]* getelementptr inbounds ([25 x [5 x float]], [25 x [5 x float]]* @major_cycle__q_minor, i64 0, i64 0), i64 %22
  %24 = bitcast [5 x float]* %23 to float*
  %25 = getelementptr inbounds float, float* %24, i64 %14
  store float %20, float* %25, align 4
  %26 = add nsw i16 %11, 1
  br label %"5"

"7":                                              ; preds = %"5"
  %27 = add nsw i16 %9, 1
  br label %"3"

return:                                           ; preds = %"3"
  ret void
}

; Function Attrs: uwtable
define void @major_cycle__stage3_major() #0 align 2 {
entry:
  %0 = load i16, i16* @main__step12, align 2
  %1 = icmp eq i16 %0, 0
  %2 = load i16, i16* @main__offstage3, align 2
  %3 = icmp eq i16 %2, 0
  %or.cond = and i1 %1, %3
  br i1 %or.cond, label %"4", label %"5"

"4":                                              ; preds = %entry
  call void @major_cycle__constantq([5 x float]* @major_cycle__majorprev_q)
  br label %return

"5":                                              ; preds = %entry
  %4 = load float, float* @main__posx, align 4
  store float %4, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__position, i64 0, i64 0), align 4
  %5 = load float, float* @main__posy, align 4
  store float %5, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__position, i64 0, i64 1), align 4
  %6 = load float, float* @main__posz, align 4
  store float %6, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__position, i64 0, i64 2), align 4
  %7 = load float, float* @main__velu, align 4
  store float %7, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__velocity, i64 0, i64 0), align 4
  %8 = load float, float* @main__velv, align 4
  store float %8, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__velocity, i64 0, i64 1), align 4
  %9 = load float, float* @main__velw, align 4
  store float %9, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__velocity, i64 0, i64 2), align 4
  %10 = load i16, i16* @major_cycle__enterstage3, align 2
  %11 = icmp eq i16 %10, 1
  br i1 %11, label %"6", label %"7"

"6":                                              ; preds = %"5"
  call void @major_cycle__stage3_initialise()
  store i16 0, i16* @major_cycle__enterstage3, align 2
  br label %"7"

"7":                                              ; preds = %"6", %"5"
  %12 = load float, float* @main__major_time, align 4
  %13 = load float, float* @main__stage3_start, align 4
  %14 = fsub float %12, %13
  store float %14, float* @major_cycle__stage_time, align 4
  %15 = load i16, i16* @major_cycle__minorflag_stage3, align 2
  %16 = icmp eq i16 %15, 1
  br i1 %16, label %"8", label %"9"

"8":                                              ; preds = %"7"
  call void @major_cycle__constantq([5 x float]* @major_cycle__majorprev_q)
  %17 = load float, float* @major_cycle__ttg, align 4
  %18 = fsub float %17, 5.000000e-01
  store float %18, float* @major_cycle__ttg, align 4
  br label %"19"

"9":                                              ; preds = %"7"
  call void @major_cycle__computation1([5 x float]* @major_cycle__position, [5 x float]* @major_cycle__dircos_stage3)
  %19 = call float @math__dotproduct([5 x float]* @major_cycle__dircos_u, [5 x float]* @major_cycle__velocity)
  store float %19, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 0), align 4
  %20 = call float @math__dotproduct([5 x float]* @major_cycle__dircos_v, [5 x float]* @major_cycle__velocity)
  store float %20, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 1), align 4
  %21 = call float @math__dotproduct([5 x float]* @major_cycle__dircos, [5 x float]* @major_cycle__velocity)
  store float %21, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 2), align 4
  %22 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 0), align 4
  %23 = fmul float %22, %22
  %24 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 1), align 4
  %25 = fmul float %24, %24
  %26 = fadd float %23, %25
  store float %26, float* @major_cycle__velsqr, align 4
  %27 = call float @math__dotproduct([5 x float]* @major_cycle__dircos_v, [5 x float]* @major_cycle__dircos_stage3)
  store float %27, float* @major_cycle__templ, align 4
  %28 = call float @math__dotproduct([5 x float]* @major_cycle__position, [5 x float]* @major_cycle__dircos_stage3)
  %29 = fsub float -0.000000e+00, %28
  store float %29, float* @major_cycle__distvelaxis, align 4
  %30 = load float, float* @major_cycle__templ, align 4
  %31 = fdiv float %29, %30
  store float %31, float* @major_cycle__distvelaxis, align 4
  call void @major_cycle__angletocover()
  %32 = call float @math__dotproduct([5 x float]* @major_cycle__dircos, [5 x float]* @major_cycle__dircosperigeeline)
  %33 = fsub float -0.000000e+00, %32
  %34 = fcmp olt float %33, 0x3FEFFFAC20000000
  br i1 %34, label %"10", label %"16"

"10":                                             ; preds = %"9"
  %35 = call float @library__sininverse(float %33)
  store float %35, float* @major_cycle__ta, align 4
  call void @math__crossproduct([5 x float]* @major_cycle__dircosperigeeline, [5 x float]* @major_cycle__dircos, [5 x float]* @major_cycle__variable_ta)
  %36 = call float @math__dotproduct([5 x float]* @major_cycle__dircos_stage3, [5 x float]* @major_cycle__variable_ta)
  %37 = fcmp ogt float %36, 0.000000e+00
  %38 = load float, float* @major_cycle__angle_to_cover, align 4
  %39 = load float, float* @major_cycle__ta, align 4
  %40 = fadd float %38, %39
  %41 = fsub float %38, %39
  %42 = select i1 %37, float %41, float %40
  %43 = call float @library__cosine(float %42)
  %44 = fmul float 0x3FE73B6040000000, %43
  %45 = fadd float %44, 1.000000e+00
  %46 = fdiv float 0x416563B640000000, %45
  %47 = fmul float %46, %46
  %48 = fmul float %47, 0x41869D2CC0000000
  %49 = fdiv float 0x460567CD20000000, %48
  %50 = call float @library__squareroot(float %49)
  %51 = fsub float 0x4183840D60000000, %46
  %52 = fmul float %51, 0x4306A864C0000000
  %53 = fsub float %46, 6.497260e+06
  %54 = fmul float %52, %53
  %55 = fdiv float %54, %48
  %56 = call float @library__squareroot(float %55)
  store float %56, float* @major_cycle__hv_target, align 4
  store float %46, float* @algorithm__rd_target, align 4
  %57 = load float, float* @major_cycle__hv_target, align 4
  store float %57, float* @algorithm__hv_target, align 4
  %58 = fcmp ogt float %42, 0.000000e+00
  %59 = fsub float -0.000000e+00, %50
  %60 = select i1 %58, float %59, float %50
  store float %60, float* @algorithm__velocityradial, align 4
  br label %"16"

"16":                                             ; preds = %"10", %"9"
  %61 = phi float [ %46, %"10" ], [ undef, %"9" ]
  %62 = load float, float* @major_cycle__tempa, align 4
  %63 = fdiv float 0x42F6A864C0000000, %62
  %64 = load float, float* @major_cycle__velsqr, align 4
  %65 = fsub float %63, %64
  %66 = fdiv float %65, %62
  %67 = fadd float %66, 1.000000e+00
  %68 = fmul float %66, %67
  store float %68, float* @major_cycle__effectivegravity, align 4
  %69 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 0), align 4
  %70 = load float, float* @major_cycle__hv_target, align 4
  %71 = fmul float %61, %70
  %72 = load float, float* @major_cycle__tempa, align 4
  %73 = fdiv float %71, %72
  %74 = fdiv float %73, 0x40B20DCA40000000
  %75 = fsub float %69, %74
  %76 = call float @library__exponent(float %75)
  store float %76, float* @major_cycle__tempp, align 4
  %77 = load float, float* @major_cycle__stage_time, align 4
  %78 = fsub float 8.200000e+02, %77
  store float %78, float* @major_cycle__tempt, align 4
  %79 = load float, float* @major_cycle__tempp, align 4
  %80 = fsub float 1.000000e+00, %79
  %81 = fmul float %80, %78
  store float %81, float* @major_cycle__ttg, align 4
  %82 = load float, float* @major_cycle__stage_time, align 4
  %83 = fadd float %81, %82
  store float %83, float* @major_cycle__total_time_stage3, align 4
  %84 = load float, float* @major_cycle__stage_time, align 4
  %85 = load float, float* @major_cycle__tempa, align 4
  %86 = load float, float* @major_cycle__effectivegravity, align 4
  %87 = call float @algorithm__compangler([5 x float]* @major_cycle__guidvel, float %86, float %85, float %83, float %84)
  store float %87, float* @major_cycle__angler, align 4
  store float %87, float* @main__angler, align 4
  %88 = load float, float* @major_cycle__stage_time, align 4
  %89 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 1), align 4
  %90 = load float, float* @major_cycle__distvelaxis, align 4
  %91 = call float @algorithm__compangley(float %90, float %89, float %88)
  store float %91, float* @major_cycle__angley, align 4
  store float %91, float* @main__angley, align 4
  %92 = load float, float* @major_cycle__angley, align 4
  %93 = load float, float* @major_cycle__angler, align 4
  call void @math__guidecitransform([5 x float]* @major_cycle__dircos_u, [5 x float]* @major_cycle__dircos_v, [5 x float]* @major_cycle__dircos, float %93, float %92, [5 x float]* @major_cycle__tempres)
  call void @math__genrates([5 x float]* @major_cycle__tempres, [5 x float]* @major_cycle__majorprev_q, [5 x float]* @major_cycle__brate)
  %94 = load float, float* @major_cycle__ttg, align 4
  %95 = fcmp olt float %94, 5.000000e+00
  br i1 %95, label %"17", label %"18"

"17":                                             ; preds = %"16"
  store i16 1, i16* @major_cycle__minorflag_stage3, align 2
  br label %"18"

"18":                                             ; preds = %"17", %"16"
  call void @major_cycle__propagateq([5 x float]* @major_cycle__majorprev_q, [5 x float]* @major_cycle__brate)
  br label %"19"

"19":                                             ; preds = %"18", %"8"
  %96 = load float, float* @major_cycle__ttg, align 4
  store float %96, float* @major_cycle__ttg_prev, align 4
  %97 = load i16, i16* @major_cycle__minorflag_stage3, align 2
  store i16 %97, i16* @main__minorflag_stage3, align 2
  %98 = load float, float* @major_cycle__ttg, align 4
  store float %98, float* @main__ttg, align 4
  %99 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 0), align 4
  store float %99, float* @main__guidvel_u, align 4
  %100 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 1), align 4
  store float %100, float* @main__guidvel_v, align 4
  %101 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 2), align 4
  store float %101, float* @main__guidvel_w, align 4
  %102 = load float, float* @major_cycle__effectivegravity, align 4
  store float %102, float* @main__effectivegravity, align 4
  %103 = load float, float* @major_cycle__stage_time, align 4
  store float %103, float* @main__stage_time, align 4
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast ([5 x float]* @main__brate to i8*), i8* bitcast ([5 x float]* @major_cycle__brate to i8*), i64 20, i32 4, i1 false)
  br label %return

return:                                           ; preds = %"19", %"4"
  ret void
}

; Function Attrs: uwtable
define void @major_cycle__stage3_initialise() local_unnamed_addr #0 align 2 {
entry:
  store float 0.000000e+00, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__brate, i64 0, i64 0), align 4
  store float 0.000000e+00, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__brate, i64 0, i64 1), align 4
  store float 0.000000e+00, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__brate, i64 0, i64 2), align 4
  store float 0x40B0C9C7A0000000, float* @algorithm__exhaustvel, align 4
  store float 0x408A21D700000000, float* @algorithm__timeconst, align 4
  store float 0x40838851E0000000, float* @major_cycle__ttg_prev, align 4
  store float 0x4083B18520000000, float* @major_cycle__total_time_stage3, align 4
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast ([5 x float]* @major_cycle__majorprev_q to i8*), i8* bitcast ([5 x float]* @main__qc to i8*), i64 20, i32 4, i1 false)
  ret void
}

; Function Attrs: uwtable
define void @major_cycle__angletocover() local_unnamed_addr #0 align 2 {
entry:
  %0 = load float, float* @major_cycle__total_time_stage3, align 4
  %1 = load float, float* @major_cycle__stage_time, align 4
  %2 = fsub float %0, %1
  store float %2, float* @major_cycle__ttg, align 4
  %3 = load float, float* @major_cycle__stage_time, align 4
  %4 = fsub float 8.200000e+02, %3
  %5 = load float, float* @major_cycle__total_time_stage3, align 4
  %6 = fsub float 8.200000e+02, %5
  %7 = call float @library__log(float %4)
  %8 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 0), align 4
  %9 = fmul float %7, 0x40B20DCA40000000
  %10 = fadd float %8, %9
  %11 = load float, float* @major_cycle__ttg, align 4
  %12 = fmul float %10, %11
  %13 = call float @library__log(float %6)
  %14 = fsub float %13, 1.000000e+00
  %15 = fmul float %6, %14
  %16 = fsub float %7, 1.000000e+00
  %17 = fmul float %4, %16
  %18 = fsub float %15, %17
  %19 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 0), align 4
  %20 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 2), align 4
  %21 = fmul float %19, %20
  %22 = load float, float* @major_cycle__tempa, align 4
  %23 = fdiv float %21, %22
  %24 = fmul float %18, 0x40B20DCA40000000
  %25 = fadd float %12, %24
  %26 = fmul float %23, 5.000000e-01
  %27 = load float, float* @major_cycle__ttg, align 4
  %28 = fmul float %26, %27
  %29 = fmul float %28, %27
  %30 = fsub float %25, %29
  %31 = fdiv float %30, %22
  store float %31, float* @major_cycle__angle_to_cover, align 4
  ret void
}

; Function Attrs: uwtable
define void @major_cycle__manoeuvre() #0 align 2 personality i8* bitcast (void ()* @major_cycle__manoeuvre to i8*) {
entry:
  %inverseq = alloca [5 x float]
  %errorq = alloca [5 x float]
  %ratesb = alloca [5 x float]
  invoke void @math__inverse([5 x float]* @major_cycle__majorprev_q, [5 x float]* %inverseq)
          to label %"3" unwind label %"16"

"3":                                              ; preds = %entry
  invoke void @math__multiply([5 x float]* %inverseq, [5 x float]* @major_cycle__desiredq, [5 x float]* %errorq)
          to label %"4" unwind label %"16"

"4":                                              ; preds = %"3"
  invoke void @math__negate([5 x float]* %errorq)
          to label %"5" unwind label %"16"

"5":                                              ; preds = %"4"
  br label %"6"

"6":                                              ; preds = %"9", %"5"
  %0 = phi i16 [ %2, %"9" ], [ 1, %"5" ]
  %1 = icmp sle i16 %0, 3
  br i1 %1, label %"7", label %"13"

"7":                                              ; preds = %"6"
  %2 = add nsw i16 %0, 1
  %3 = sext i16 %2 to i64
  %4 = sub i64 %3, 1
  %5 = bitcast [5 x float]* %errorq to float*
  %6 = getelementptr inbounds float, float* %5, i64 %4
  %7 = load float, float* %6, align 4
  %8 = invoke float @library__sininverse(float %7)
          to label %"9" unwind label %"16"

"9":                                              ; preds = %"7"
  %9 = fmul float %8, 2.000000e+00
  %10 = load float, float* @major_cycle__duration, align 4
  %11 = sext i16 %0 to i64
  %12 = fdiv float %9, %10
  %13 = sub i64 %11, 1
  %14 = bitcast [5 x float]* %ratesb to float*
  %15 = getelementptr inbounds float, float* %14, i64 %13
  store float %12, float* %15, align 4
  %16 = getelementptr inbounds float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__ratesbprev, i64 0, i64 0), i64 %13
  store float %12, float* %16, align 4
  br label %"6"

"13":                                             ; preds = %"6"
  invoke void @major_cycle__propagateq([5 x float]* @major_cycle__majorprev_q, [5 x float]* %ratesb) #0
          to label %"14" unwind label %"16"

"14":                                             ; preds = %"13"
  %17 = load float, float* @major_cycle__duration, align 4
  %18 = fsub float %17, 5.000000e-01
  store float %18, float* @major_cycle__duration, align 4
  %19 = bitcast [5 x float]* %ratesb to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast ([5 x float]* @main__brate to i8*), i8* %19, i64 20, i32 4, i1 false)
  %20 = bitcast [5 x float]* %inverseq to i8*
  call void @llvm.lifetime.end.p0i8(i64 20, i8* %20)
  %21 = bitcast [5 x float]* %errorq to i8*
  call void @llvm.lifetime.end.p0i8(i64 20, i8* %21)
  call void @llvm.lifetime.end.p0i8(i64 20, i8* %19)
  ret void

"16":                                             ; preds = %"13", %"7", %"4", %"3", %entry
  %exc = landingpad { i8*, i32 }
          cleanup
  %exc_ptr1 = extractvalue { i8*, i32 } %exc, 0
  %filter2 = extractvalue { i8*, i32 } %exc, 1
  %22 = bitcast [5 x float]* %inverseq to i8*
  call void @llvm.lifetime.end.p0i8(i64 20, i8* %22)
  %23 = bitcast [5 x float]* %errorq to i8*
  call void @llvm.lifetime.end.p0i8(i64 20, i8* %23)
  %24 = bitcast [5 x float]* %ratesb to i8*
  call void @llvm.lifetime.end.p0i8(i64 20, i8* %24)
  resume { i8*, i32 } %exc
}

; Function Attrs: uwtable
define void @major_cycle___elabb() unnamed_addr #0 align 2 {
entry:
  call void @__gnat_rcheck_CE_Range_Check(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.cst.66, i64 0, i64 0), i32 11) #3
  unreachable
}

; Function Attrs: inlinehint uwtable
define void @math__Tf32array25by4BIP(i64 %_init.0, i64 %_init.1) unnamed_addr #1 align 2 {
entry:
  ret void
}

; Function Attrs: inlinehint uwtable
define void @math__Tf32array1by3BIP(i64 %_init.0, i64 %_init.1) unnamed_addr #1 align 2 {
entry:
  ret void
}

; Function Attrs: inlinehint uwtable
define void @math__Tarray3by3BIP(i64 %_init.0, i64 %_init.1) unnamed_addr #1 align 2 {
entry:
  ret void
}

; Function Attrs: inlinehint uwtable
define void @math__TquaternionBIP(i64 %_init.0, i64 %_init.1) unnamed_addr #1 align 2 {
entry:
  ret void
}

; Function Attrs: uwtable
define float @math__dotproduct([5 x float]* %vec1, [5 x float]* %vec2) #0 align 2 {
entry:
  %0 = bitcast [5 x float]* %vec1 to float*
  %1 = load float, float* %0, align 4
  %2 = bitcast [5 x float]* %vec2 to float*
  %3 = load float, float* %2, align 4
  %4 = fmul float %1, %3
  %5 = getelementptr inbounds float, float* %0, i64 1
  %6 = load float, float* %5, align 4
  %7 = getelementptr inbounds float, float* %2, i64 1
  %8 = load float, float* %7, align 4
  %9 = fmul float %6, %8
  %10 = fadd float %4, %9
  %11 = getelementptr inbounds float, float* %0, i64 2
  %12 = load float, float* %11, align 4
  %13 = getelementptr inbounds float, float* %2, i64 2
  %14 = load float, float* %13, align 4
  %15 = fmul float %12, %14
  %16 = fadd float %10, %15
  ret float %16
}

; Function Attrs: uwtable
define void @math__crossproduct([5 x float]* %vec1, [5 x float]* %vec2, [5 x float]* %vec3) #0 align 2 {
entry:
  %0 = bitcast [5 x float]* %vec1 to float*
  %1 = getelementptr inbounds float, float* %0, i64 1
  %2 = load float, float* %1, align 4
  %3 = bitcast [5 x float]* %vec2 to float*
  %4 = getelementptr inbounds float, float* %3, i64 2
  %5 = load float, float* %4, align 4
  %6 = fmul float %2, %5
  %7 = getelementptr inbounds float, float* %0, i64 2
  %8 = load float, float* %7, align 4
  %9 = getelementptr inbounds float, float* %3, i64 1
  %10 = load float, float* %9, align 4
  %11 = fmul float %8, %10
  %12 = fsub float %6, %11
  %13 = bitcast [5 x float]* %vec3 to float*
  store float %12, float* %13, align 4
  %14 = load float, float* %7, align 4
  %15 = load float, float* %3, align 4
  %16 = fmul float %14, %15
  %17 = load float, float* %0, align 4
  %18 = load float, float* %4, align 4
  %19 = fmul float %17, %18
  %20 = fsub float %16, %19
  %21 = getelementptr inbounds float, float* %13, i64 1
  store float %20, float* %21, align 4
  %22 = load float, float* %0, align 4
  %23 = load float, float* %9, align 4
  %24 = fmul float %22, %23
  %25 = load float, float* %1, align 4
  %26 = load float, float* %3, align 4
  %27 = fmul float %25, %26
  %28 = fsub float %24, %27
  %29 = getelementptr inbounds float, float* %13, i64 2
  store float %28, float* %29, align 4
  ret void
}

; Function Attrs: uwtable
define void @math__normalise([5 x float]* %q) #0 align 2 {
entry:
  %0 = bitcast [5 x float]* %q to float*
  %1 = load float, float* %0, align 4
  %2 = fmul float %1, %1
  %3 = getelementptr inbounds float, float* %0, i64 1
  %4 = load float, float* %3, align 4
  %5 = fmul float %4, %4
  %6 = fadd float %2, %5
  %7 = getelementptr inbounds float, float* %0, i64 2
  %8 = load float, float* %7, align 4
  %9 = fmul float %8, %8
  %10 = fadd float %6, %9
  %11 = getelementptr inbounds float, float* %0, i64 3
  %12 = load float, float* %11, align 4
  %13 = fmul float %12, %12
  %14 = fadd float %10, %13
  %15 = call float @library__squareroot(float %14)
  %16 = load float, float* %0, align 4
  %17 = fdiv float %16, %15
  store float %17, float* %0, align 4
  %18 = load float, float* %3, align 4
  %19 = fdiv float %18, %15
  store float %19, float* %3, align 4
  %20 = load float, float* %7, align 4
  %21 = fdiv float %20, %15
  store float %21, float* %7, align 4
  %22 = load float, float* %11, align 4
  %23 = fdiv float %22, %15
  store float %23, float* %11, align 4
  ret void
}

; Function Attrs: uwtable
define void @math__dircosine([5 x float]* %vecin, [5 x float]* %dcout) #0 align 2 {
entry:
  %0 = bitcast [5 x float]* %vecin to float*
  %1 = load float, float* %0, align 4
  %2 = fmul float %1, %1
  %3 = getelementptr inbounds float, float* %0, i64 1
  %4 = load float, float* %3, align 4
  %5 = fmul float %4, %4
  %6 = fadd float %2, %5
  %7 = getelementptr inbounds float, float* %0, i64 2
  %8 = load float, float* %7, align 4
  %9 = fmul float %8, %8
  %10 = fadd float %6, %9
  %11 = call float @library__squareroot(float %10)
  %12 = load float, float* %0, align 4
  %13 = fdiv float %12, %11
  %14 = bitcast [5 x float]* %dcout to float*
  store float %13, float* %14, align 4
  %15 = load float, float* %3, align 4
  %16 = fdiv float %15, %11
  %17 = getelementptr inbounds float, float* %14, i64 1
  store float %16, float* %17, align 4
  %18 = load float, float* %3, align 4
  %19 = fdiv float %18, %11
  %20 = getelementptr inbounds float, float* %14, i64 2
  store float %19, float* %20, align 4
  ret void
}

; Function Attrs: uwtable
define void @math__multiply([5 x float]* %q1, [5 x float]* %q2, [5 x float]* %q3) #0 align 2 {
entry:
  %0 = bitcast [5 x float]* %q2 to float*
  %1 = getelementptr inbounds float, float* %0, i64 1
  %2 = load float, float* %1, align 4
  %3 = bitcast [5 x float]* %q1 to float*
  %4 = getelementptr inbounds float, float* %3, i64 1
  %5 = load float, float* %4, align 4
  %6 = fmul float %2, %5
  %7 = fsub float -0.000000e+00, %6
  %8 = getelementptr inbounds float, float* %0, i64 2
  %9 = load float, float* %8, align 4
  %10 = getelementptr inbounds float, float* %3, i64 2
  %11 = load float, float* %10, align 4
  %12 = fmul float %9, %11
  %13 = fsub float %7, %12
  %14 = getelementptr inbounds float, float* %0, i64 3
  %15 = load float, float* %14, align 4
  %16 = getelementptr inbounds float, float* %3, i64 3
  %17 = load float, float* %16, align 4
  %18 = fmul float %15, %17
  %19 = fsub float %13, %18
  %20 = load float, float* %0, align 4
  %21 = load float, float* %3, align 4
  %22 = fmul float %20, %21
  %23 = fadd float %19, %22
  %24 = bitcast [5 x float]* %q3 to float*
  store float %23, float* %24, align 4
  %25 = load float, float* %0, align 4
  %26 = load float, float* %4, align 4
  %27 = fmul float %25, %26
  %28 = load float, float* %14, align 4
  %29 = load float, float* %10, align 4
  %30 = fmul float %28, %29
  %31 = fadd float %27, %30
  %32 = load float, float* %8, align 4
  %33 = load float, float* %16, align 4
  %34 = fmul float %32, %33
  %35 = fsub float %31, %34
  %36 = load float, float* %1, align 4
  %37 = load float, float* %3, align 4
  %38 = fmul float %36, %37
  %39 = fadd float %35, %38
  %40 = getelementptr inbounds float, float* %24, i64 1
  store float %39, float* %40, align 4
  %41 = load float, float* %0, align 4
  %42 = load float, float* %10, align 4
  %43 = fmul float %41, %42
  %44 = load float, float* %14, align 4
  %45 = load float, float* %4, align 4
  %46 = fmul float %44, %45
  %47 = fsub float %43, %46
  %48 = load float, float* %1, align 4
  %49 = load float, float* %16, align 4
  %50 = fmul float %48, %49
  %51 = fadd float %47, %50
  %52 = load float, float* %8, align 4
  %53 = load float, float* %3, align 4
  %54 = fmul float %52, %53
  %55 = fadd float %51, %54
  %56 = getelementptr inbounds float, float* %24, i64 2
  store float %55, float* %56, align 4
  %57 = load float, float* %8, align 4
  %58 = load float, float* %4, align 4
  %59 = fmul float %57, %58
  %60 = load float, float* %1, align 4
  %61 = load float, float* %10, align 4
  %62 = fmul float %60, %61
  %63 = fsub float %59, %62
  %64 = load float, float* %0, align 4
  %65 = load float, float* %16, align 4
  %66 = fmul float %64, %65
  %67 = fadd float %63, %66
  %68 = load float, float* %14, align 4
  %69 = load float, float* %3, align 4
  %70 = fmul float %68, %69
  %71 = fadd float %67, %70
  %72 = getelementptr inbounds float, float* %24, i64 3
  store float %71, float* %72, align 4
  ret void
}

; Function Attrs: uwtable
define void @math__inverse([5 x float]* %q, [5 x float]* %qinv) #0 align 2 {
entry:
  %0 = bitcast [5 x float]* %q to float*
  %1 = load float, float* %0, align 4
  %2 = bitcast [5 x float]* %qinv to float*
  store float %1, float* %2, align 4
  %3 = getelementptr inbounds float, float* %0, i64 1
  %4 = load float, float* %3, align 4
  %5 = fsub float -0.000000e+00, %4
  %6 = getelementptr inbounds float, float* %2, i64 1
  store float %5, float* %6, align 4
  %7 = getelementptr inbounds float, float* %0, i64 2
  %8 = load float, float* %7, align 4
  %9 = fsub float -0.000000e+00, %8
  %10 = getelementptr inbounds float, float* %2, i64 2
  store float %9, float* %10, align 4
  %11 = getelementptr inbounds float, float* %0, i64 3
  %12 = load float, float* %11, align 4
  %13 = fsub float -0.000000e+00, %12
  %14 = getelementptr inbounds float, float* %2, i64 3
  store float %13, float* %14, align 4
  ret void
}

; Function Attrs: uwtable
define void @math__negate([5 x float]* %q) #0 align 2 {
entry:
  %0 = bitcast [5 x float]* %q to float*
  %1 = load float, float* %0, align 4
  %2 = fcmp olt float %1, 0.000000e+00
  br i1 %2, label %"3", label %return

"3":                                              ; preds = %entry
  %3 = fsub float -0.000000e+00, %1
  store float %3, float* %0, align 4
  %4 = getelementptr inbounds float, float* %0, i64 1
  %5 = load float, float* %4, align 4
  %6 = fsub float -0.000000e+00, %5
  store float %6, float* %4, align 4
  %7 = getelementptr inbounds float, float* %0, i64 2
  %8 = load float, float* %7, align 4
  %9 = fsub float -0.000000e+00, %8
  store float %9, float* %7, align 4
  %10 = getelementptr inbounds float, float* %0, i64 3
  %11 = load float, float* %10, align 4
  %12 = fsub float -0.000000e+00, %11
  store float %12, float* %10, align 4
  br label %return

return:                                           ; preds = %"3", %entry
  ret void
}

; Function Attrs: uwtable
define void @math__guidecitransform([5 x float]* %dircosvar1, [5 x float]* %dircosvar2, [5 x float]* %dircosvar3, float %angr, float %angy, [5 x float]* %transformout) #0 align 2 {
entry:
  %0 = call float @library__cosine(float %angr)
  %1 = call float @library__cosine(float %angy)
  %2 = call float @library__sine(float %angr)
  %3 = call float @library__sine(float %angy)
  %4 = bitcast [5 x float]* %dircosvar1 to float*
  %5 = load float, float* %4, align 4
  %6 = fmul float %0, %5
  %7 = fmul float %1, %6
  %8 = bitcast [5 x float]* %dircosvar2 to float*
  %9 = load float, float* %8, align 4
  %10 = fmul float %0, %9
  %11 = fmul float %3, %10
  %12 = fadd float %7, %11
  %13 = bitcast [5 x float]* %dircosvar3 to float*
  %14 = load float, float* %13, align 4
  %15 = fmul float %2, %14
  %16 = fadd float %12, %15
  %17 = bitcast [5 x float]* %transformout to float*
  store float %16, float* %17, align 4
  %18 = getelementptr inbounds float, float* %4, i64 1
  %19 = load float, float* %18, align 4
  %20 = fmul float %0, %19
  %21 = fmul float %1, %20
  %22 = getelementptr inbounds float, float* %8, i64 1
  %23 = load float, float* %22, align 4
  %24 = fmul float %0, %23
  %25 = fmul float %3, %24
  %26 = fadd float %21, %25
  %27 = getelementptr inbounds float, float* %13, i64 1
  %28 = load float, float* %27, align 4
  %29 = fmul float %2, %28
  %30 = fadd float %26, %29
  %31 = getelementptr inbounds float, float* %17, i64 1
  store float %30, float* %31, align 4
  %32 = getelementptr inbounds float, float* %4, i64 2
  %33 = load float, float* %32, align 4
  %34 = fmul float %0, %33
  %35 = fmul float %1, %34
  %36 = getelementptr inbounds float, float* %8, i64 2
  %37 = load float, float* %36, align 4
  %38 = fmul float %0, %37
  %39 = fmul float %3, %38
  %40 = fadd float %35, %39
  %41 = getelementptr inbounds float, float* %13, i64 2
  %42 = load float, float* %41, align 4
  %43 = fmul float %2, %42
  %44 = fadd float %40, %43
  %45 = getelementptr inbounds float, float* %17, i64 2
  store float %44, float* %45, align 4
  ret void
}

; Function Attrs: uwtable
define void @math__genrates([5 x float]* %acclnvec, [5 x float]* %qp, [5 x float]* %cmdbrate) #0 align 2 personality i8* bitcast (void ([5 x float]*, [5 x float]*, [5 x float]*)* @math__genrates to i8*) {
entry:
  %0 = bitcast [5 x float]* %qp to float*
  %1 = getelementptr inbounds float, float* %0, i64 2
  %2 = load float, float* %1, align 4
  %3 = fmul float %2, %2
  %4 = getelementptr inbounds float, float* %0, i64 3
  %5 = load float, float* %4, align 4
  %6 = fmul float %5, %5
  %7 = fadd float %3, %6
  %8 = fmul float %7, 2.000000e+00
  %9 = fsub float 1.000000e+00, %8
  %10 = getelementptr inbounds float, float* %0, i64 1
  %11 = load float, float* %10, align 4
  %12 = fmul float %11, %2
  %13 = load float, float* %0, align 4
  %14 = fmul float %13, %5
  %15 = fsub float %12, %14
  %16 = fmul float %15, 2.000000e+00
  %17 = fmul float %11, %5
  %18 = fmul float %13, %2
  %19 = fadd float %17, %18
  %20 = fadd float %12, %14
  %21 = fmul float %20, 2.000000e+00
  %22 = fmul float %11, %11
  %23 = fadd float %22, %6
  %24 = fmul float %23, 2.000000e+00
  %25 = fsub float 1.000000e+00, %24
  %26 = fmul float %2, %5
  %27 = fmul float %13, %11
  %28 = fsub float %26, %27
  %29 = fsub float %17, %18
  %30 = fmul float %29, 2.000000e+00
  %31 = fadd float %26, %27
  %32 = fmul float %31, 2.000000e+00
  %33 = fadd float %22, %3
  %34 = fmul float %33, 2.000000e+00
  %35 = bitcast [5 x float]* %acclnvec to float*
  %36 = load float, float* %35, align 4
  %37 = fmul float %16, %36
  %38 = getelementptr inbounds float, float* %35, i64 1
  %39 = load float, float* %38, align 4
  %40 = fmul float %25, %39
  %41 = fadd float %37, %40
  %42 = getelementptr inbounds float, float* %35, i64 2
  %43 = load float, float* %42, align 4
  %44 = fmul float %32, %43
  %45 = fadd float %41, %44
  %46 = invoke float @library__sininverse(float %45)
          to label %"3" unwind label %"6"

"3":                                              ; preds = %entry
  %47 = fsub float -0.000000e+00, %46
  %48 = load float, float* %35, align 4
  %49 = fmul float %9, %48
  %50 = load float, float* %38, align 4
  %51 = fmul float %21, %50
  %52 = fadd float %49, %51
  %53 = load float, float* %42, align 4
  %54 = fmul float %30, %53
  %55 = fadd float %52, %54
  %56 = invoke float @library__sininverse(float %55)
          to label %"4" unwind label %"6"

"4":                                              ; preds = %"3"
  %57 = fmul float %47, 2.000000e+00
  %58 = bitcast [5 x float]* %cmdbrate to float*
  store float %57, float* %58, align 4
  %59 = fmul float %56, 2.000000e+00
  %60 = getelementptr inbounds float, float* %58, i64 1
  store float %59, float* %60, align 4
  %61 = getelementptr inbounds float, float* %58, i64 2
  store float 0.000000e+00, float* %61, align 4
  ret void

"6":                                              ; preds = %"3", %entry
  %exc = landingpad { i8*, i32 }
          cleanup
  %exc_ptr1 = extractvalue { i8*, i32 } %exc, 0
  %filter2 = extractvalue { i8*, i32 } %exc, 1
  resume { i8*, i32 } %exc
}

; Function Attrs: uwtable
define void @minor_cycle__stage1_minor() #0 align 2 personality i8* bitcast (void ()* @minor_cycle__stage1_minor to i8*) {
entry:
  %localq = alloca [5 x float]
  %0 = bitcast [5 x float]* %localq to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([5 x float]* @main__qc to i8*), i64 20, i32 4, i1 false)
  %1 = load i16, i16* @minor_cycle__firstcycle_stage1, align 2
  %2 = icmp eq i16 %1, 1
  br i1 %2, label %"3", label %"5"

"3":                                              ; preds = %entry
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast ([5 x float]* @lookup__quaternion_prev to i8*), i8* %0, i64 20, i32 4, i1 false)
  store i16 0, i16* @minor_cycle__firstcycle_stage1, align 2
  invoke void @main__firstinit()
          to label %"5" unwind label %"10"

"5":                                              ; preds = %"3", %entry
  %3 = load i16, i16* @main__step2, align 2
  %4 = icmp eq i16 %3, 1
  br i1 %4, label %"6", label %"8"

"6":                                              ; preds = %"5"
  %5 = load float, float* @main__altitudeinfo, align 4
  invoke void @lookup__output_lookup(float %5, [5 x float]* %localq)
          to label %"8" unwind label %"10"

"8":                                              ; preds = %"6", %"5"
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast ([5 x float]* @main__qc to i8*), i8* %0, i64 20, i32 4, i1 false)
  call void @llvm.lifetime.end.p0i8(i64 20, i8* %0)
  ret void

"10":                                             ; preds = %"6", %"3"
  %exc = landingpad { i8*, i32 }
          cleanup
  %exc_ptr1 = extractvalue { i8*, i32 } %exc, 0
  %filter2 = extractvalue { i8*, i32 } %exc, 1
  call void @llvm.lifetime.end.p0i8(i64 20, i8* %0)
  resume { i8*, i32 } %exc
}

; Function Attrs: uwtable
define void @minor_cycle__stage2_minor() #0 align 2 {
entry:
  %0 = load i16, i16* @minor_cycle__firstcycle_stage2, align 2
  %1 = icmp eq i16 %0, 1
  br i1 %1, label %"3", label %"5"

"3":                                              ; preds = %entry
  %2 = load i32, i32* @main__cyclecount, align 4
  %3 = icmp eq i32 %2, 25
  br i1 %3, label %"4", label %return

"4":                                              ; preds = %"3"
  store i16 0, i16* @minor_cycle__firstcycle_stage2, align 2
  br label %return

"5":                                              ; preds = %entry
  %4 = load i16, i16* @main__step8, align 2
  %5 = icmp eq i16 %4, 0
  %6 = load i16, i16* @minor_cycle__offstage2, align 2
  %7 = icmp eq i16 %6, 0
  %or.cond = and i1 %5, %7
  br i1 %or.cond, label %"7", label %return

"7":                                              ; preds = %"5"
  %8 = load i32, i32* @main__cyclecount, align 4
  %9 = icmp eq i32 %8, 1
  br i1 %9, label %"8", label %"11"

"8":                                              ; preds = %"7"
  %10 = load i16, i16* @major_cycle__velflag, align 2
  %11 = icmp eq i16 %10, 1
  br i1 %11, label %"9", label %"10"

"9":                                              ; preds = %"8"
  %12 = load float, float* @major_cycle__velocityincrmn, align 4
  store float %12, float* @minor_cycle__velocityincrmn, align 4
  %13 = load float, float* @major_cycle__velocitycoeff, align 4
  store float %13, float* @minor_cycle__velocitycoeff, align 4
  br label %"10"

"10":                                             ; preds = %"9", %"8"
  %14 = load i16, i16* @major_cycle__minorflag_stage2, align 2
  store i16 %14, i16* @minor_cycle__minorflag_stage2, align 2
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast ([25 x [5 x float]]* @minor_cycle__q_minor to i8*), i8* bitcast ([25 x [5 x float]]* @major_cycle__q_minor to i8*), i64 500, i32 4, i1 false)
  br label %"11"

"11":                                             ; preds = %"10", %"7"
  call void @minor_cycle__post_output()
  %15 = load i16, i16* @minor_cycle__minorflag_stage2, align 2
  %16 = icmp eq i16 %15, 1
  br i1 %16, label %"12", label %return

"12":                                             ; preds = %"11"
  %17 = load i32, i32* @main__cyclecount, align 4
  %18 = icmp ugt i32 %17, 1
  br i1 %18, label %"13", label %"14"

"13":                                             ; preds = %"12"
  %19 = load float, float* @minor_cycle__velocitycoeff, align 4
  %20 = load float, float* @minor_cycle__velocityincrmn, align 4
  %21 = fadd float %19, %20
  store float %21, float* @minor_cycle__velocitycoeff, align 4
  br label %"14"

"14":                                             ; preds = %"13", %"12"
  %22 = load float, float* @minor_cycle__velocitycoeff, align 4
  %23 = fcmp ogt float %22, 5.236000e+03
  br i1 %23, label %"15", label %return

"15":                                             ; preds = %"14"
  store i16 1, i16* @minor_cycle__offstage2, align 2
  store i16 1, i16* @main__offstage2, align 2
  br label %return

return:                                           ; preds = %"15", %"14", %"11", %"5", %"4", %"3"
  ret void
}

; Function Attrs: uwtable
define void @minor_cycle__post_output() local_unnamed_addr #0 align 2 {
entry:
  %0 = load i32, i32* @main__cyclecount, align 4
  %1 = icmp ugt i32 %0, 32767
  br i1 %1, label %"3", label %"4"

"3":                                              ; preds = %entry
  call void @__gnat_rcheck_CE_Range_Check(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.cst.101, i64 0, i64 0), i32 134) #3
  unreachable

"4":                                              ; preds = %entry
  %2 = trunc i32 %0 to i16
  br label %"5"

"5":                                              ; preds = %"9", %"4"
  %3 = phi i16 [ %16, %"9" ], [ 1, %"4" ]
  %4 = icmp sle i16 %3, 4
  br i1 %4, label %"6", label %"10"

"6":                                              ; preds = %"5"
  %5 = icmp sle i16 %2, 0
  %6 = icmp sgt i16 %2, 25
  %or.cond = or i1 %5, %6
  br i1 %or.cond, label %"8", label %"9"

"8":                                              ; preds = %"6"
  call void @__gnat_rcheck_CE_Index_Check(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.cst.101, i64 0, i64 0), i32 137) #3
  unreachable

"9":                                              ; preds = %"6"
  %7 = sext i16 %2 to i64
  %8 = sext i16 %3 to i64
  %9 = sub i64 %8, 1
  %10 = sub i64 %7, 1
  %11 = getelementptr inbounds [5 x float], [5 x float]* getelementptr inbounds ([25 x [5 x float]], [25 x [5 x float]]* @minor_cycle__q_minor, i64 0, i64 0), i64 %10
  %12 = bitcast [5 x float]* %11 to float*
  %13 = getelementptr inbounds float, float* %12, i64 %9
  %14 = load float, float* %13, align 4
  %15 = getelementptr inbounds float, float* getelementptr inbounds ([5 x float], [5 x float]* @minor_cycle__prevcycle_q, i64 0, i64 0), i64 %9
  store float %14, float* %15, align 4
  %16 = add nsw i16 %3, 1
  br label %"5"

"10":                                             ; preds = %"5"
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast ([5 x float]* @main__qc to i8*), i8* bitcast ([5 x float]* @minor_cycle__prevcycle_q to i8*), i64 20, i32 4, i1 false)
  ret void
}

; Function Attrs: uwtable
define void @minor_cycle__stage3_minor() #0 align 2 {
entry:
  %0 = load i16, i16* @minor_cycle__firstcycle_stage3, align 2
  %1 = icmp eq i16 %0, 1
  br i1 %1, label %"3", label %"5"

"3":                                              ; preds = %entry
  %2 = load i32, i32* @main__cyclecount, align 4
  %3 = icmp eq i32 %2, 25
  br i1 %3, label %"4", label %return

"4":                                              ; preds = %"3"
  store i16 0, i16* @minor_cycle__firstcycle_stage3, align 2
  br label %return

"5":                                              ; preds = %entry
  %4 = load i16, i16* @main__step12, align 2
  %5 = icmp eq i16 %4, 0
  %6 = load i16, i16* @minor_cycle__offstage3, align 2
  %7 = icmp eq i16 %6, 0
  %or.cond = and i1 %5, %7
  br i1 %or.cond, label %"7", label %return

"7":                                              ; preds = %"5"
  %8 = load i32, i32* @main__cyclecount, align 4
  %9 = icmp eq i32 %8, 1
  br i1 %9, label %"8", label %"9"

"8":                                              ; preds = %"7"
  %10 = load i16, i16* @major_cycle__minorflag_stage3, align 2
  store i16 %10, i16* @minor_cycle__minorflag_stage3, align 2
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast ([25 x [5 x float]]* @minor_cycle__q_minor to i8*), i8* bitcast ([25 x [5 x float]]* @major_cycle__q_minor to i8*), i64 500, i32 4, i1 false)
  br label %"9"

"9":                                              ; preds = %"8", %"7"
  call void @minor_cycle__post_output()
  %11 = load i16, i16* @minor_cycle__minorflag_stage3, align 2
  %12 = icmp eq i16 %11, 1
  %13 = load float, float* @main__apogee, align 4
  %14 = fcmp ogt float %13, 0x417E102200000000
  %or.cond3 = and i1 %12, %14
  br i1 %or.cond3, label %"11", label %return

"11":                                             ; preds = %"9"
  store i16 1, i16* @minor_cycle__offstage3, align 2
  store i16 1, i16* @main__offstage3, align 2
  br label %return

return:                                           ; preds = %"11", %"9", %"5", %"4", %"3"
  ret void
}

; Function Attrs: uwtable
define void @minor_cycle__manoeuvre() #0 align 2 {
entry:
  %0 = load i16, i16* @minor_cycle__firstcycle_mnvre, align 2
  %1 = icmp eq i16 %0, 0
  %2 = load i32, i32* @main__cyclecount, align 4
  br i1 %1, label %"3", label %"5"

"3":                                              ; preds = %entry
  %3 = icmp eq i32 %2, 25
  br i1 %3, label %"4", label %return

"4":                                              ; preds = %"3"
  store i16 1, i16* @minor_cycle__firstcycle_mnvre, align 2
  br label %return

"5":                                              ; preds = %entry
  %4 = icmp eq i32 %2, 1
  br i1 %4, label %"6", label %"7"

"6":                                              ; preds = %"5"
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast ([25 x [5 x float]]* @minor_cycle__q_minor to i8*), i8* bitcast ([25 x [5 x float]]* @major_cycle__q_minor to i8*), i64 500, i32 4, i1 false)
  br label %"7"

"7":                                              ; preds = %"6", %"5"
  call void @minor_cycle__post_output()
  br label %return

return:                                           ; preds = %"7", %"4", %"3"
  ret void
}

attributes #0 = { uwtable "no-frame-pointer-elim-non-leaf"="true" }
attributes #1 = { inlinehint uwtable "no-frame-pointer-elim-non-leaf"="true" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { noreturn }
attributes #4 = { nounwind readnone }

!llvm.module.flags = !{!0}

!0 = !{i32 7, !"PIE Level", i32 2}
