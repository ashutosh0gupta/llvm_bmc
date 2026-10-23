with library;
use library;
package body SunMag is

   AIDRLMT : Constant := 6328137.0;
   LEAST_F64 : Constant := 0.0;

   
   SunMagUpdtCnt, prv_SunMagUpdtCnt : Unsigned_16;
   sun_dataval, mag_dataval : Unsigned_16 := 16#AAAA#;

   mag_fld_in, MagFieldBdy : float32;
   sun_vinA_hrz, sun_vinB_hrz, sun_vinA_vrt, sun_vinB_vrt : float32;
   VAHrzMcass, VBHrzMcass, VAVertMcass, VBVertMcass : float32;

   sundata_accumstart, sun_data_lossCnt, sun_pres_cnt, sun_pres_flg, sun_availFlg : Unsigned_16;
   magdata_accumstart, magfldLossCnt, magFld_availFlg : Unsigned_16;

   vA_hrz_out, vB_hrz_out, vA_vrt_out, vB_vrt_out : float32; 
   sun_SF_ADC_vinAhrz, sun_SF_ADC_vinBhrz, sun_SF_ADC_vinAvrt, sun_SF_ADC_vinBvrt : float32;
   sun_bias_ADC_vAhrz, sun_bias_ADC_vBhrz, sun_bias_ADC_vAvrt, sun_bias_ADC_vBvrt : float32;

   mag_fld, mag_fld_out, sumMagFld, mag_SF, mag_bias_coeff, soft_iron_coeff, hard_iron_coeff : float32;

   voltage_thresh : float32;
   sunDataLossLmt, avgDur_Sunsnr : Unsigned_16;
   magDataLossLmt : Unsigned_16;

   lat_valdty_flg, magFld_readiness, MagComp_Err : Unsigned_16;

   RxECEF, RyECEF, RzECEF, rad_dist : float64;
   pos_x, pos_y, pos_z, pos_mag_xy : float64;
   abs_rx, abs_ry, abs_rz : float64;
   lngtdw, sinlngtdw, coslngtdw : float64;
   co_lat, sincolat, abssincolat, coscolat : float64;

   Nvc_soln_frst_updt, sunVct_readiness, sunVct_pres_flg, quat_val_flgtoMjr, SunVctComptnSts, SunEclipseStsFlg : Unsigned_16;
   Rx, Ry, Rz, RdotS, radius, RsqrMReSqr, RE : float64;
   Sxi, Syi, Szi : float64;
   posx_eci, posy_eci, posz_eci : float64;

   mjr_data_ready : Unsigned_16;
 
   sinCoLatLmt : float64;

-------------------------------------------------------------------------------------------------

-- Procedure for sun/mag data acquisition

   procedure rSunMagDataAcq is
      
   begin

      if (SunMagComnSts = 16#5555#) and then (SunMagUpdtCnt /= prv_SunMagUpdtCnt) then

	sun_dataval := 16#5555#;
	mag_dataval := 16#5555#;

	mag_fld_in := MagFieldBdy;
	sun_vinA_hrz := VAHrzMcass;
	sun_vinB_hrz := VBHrzMcass;
	sun_vinA_vrt := VAVertMcass;
	sun_vinB_vrt := VBVertMcass;

      else
	sun_dataval := 16#AAAA#;
	mag_dataval := 16#AAAA#;
      end if;

  	rSunDataProc;
	rMagDataProc;

   end rSunMagDataAcq;

-------------------------------------------------------------------------------------------------
-- Procedure for sun sensor data processing

   procedure rSunDataProc is
      
   begin

      if (minorID = sundata_accumstart) then
	sun_data_lossCnt := 0;
	sun_pres_cnt := 0;
	sun_pres_flg := 16#AAAA#;
      end if;

      if (sun_dataval = 16#5555#) then

	vA_hrz_out := sun_SF_ADC_vinAhrz * sun_vinA_hrz - sun_bias_ADC_vAhrz;
	vB_hrz_out := sun_SF_ADC_vinBhrz * sun_vinB_hrz - sun_bias_ADC_vBhrz;
	vA_vrt_out := sun_SF_ADC_vinAvrt * sun_vinA_vrt - sun_bias_ADC_vAvrt;
	vB_vrt_out := sun_SF_ADC_vinBvrt * sun_vinB_vrt - sun_bias_ADC_vBvrt;

	if ((vA_hrz_out + vA_hrz_out) > voltage_thresh) then
		sun_pres_flg := 16#5555#;
	else
		sun_pres_flg := 16#AAAA#;
	end if;

      else
	sun_data_lossCnt := sun_data_lossCnt + 1;
      end if;

  	if (sun_pres_flg = 16#5555#) then
		sun_pres_cnt := sun_pres_cnt + 1;
	end if;

	if (minorID = 25) then
		if (sun_data_lossCnt < sunDataLossLmt) then

		  if (sun_pres_cnt = avgDur_Sunsnr) then
			sun_availFlg := 16#5555#;
		  else
			sun_availFlg := 16#AAAA#;
		  end if;

		else
			sun_availFlg := 16#AAAA#;
		end if;
	end if;

   end rSunDataProc;

-------------------------------------------------------------------------------------------------

-- Procedure for magnetometer data processing

   procedure rMagDataProc is
      
   begin

     if (mag_dataval = 16#5555#) then

      if (minorID = magdata_accumstart) then
	magfldLossCnt := 0;
	sumMagFld := 0.0;
      end if;

	mag_fld := mag_SF * mag_fld_in - mag_bias_coeff;
	mag_fld_out := soft_iron_coeff * mag_fld;
	mag_fld_out := mag_fld_out - hard_iron_coeff;

      else
	magfldLossCnt := magfldLossCnt + 1;
      end if;

  	sumMagFld := sumMagFld + mag_fld_out;

	if (minorID = 25) then
		if (magfldLossCnt < magDataLossLmt) then
			magFld_availFlg := 16#5555#;
		  
		else
			magFld_availFlg := 16#AAAA#;
		end if;
	end if;

   end rMagDataProc;

-------------------------------------------------------------------------------------------------

-- Procedure for reference magnetic field computation

   procedure rMagFldCmptn is
      
   begin

	lat_valdty_flg := 16#AAAA#;
	magFld_readiness := 16#AAAA#;
	MagComp_Err := 16#AAAA#;

	RxECEF := pos_x;
	RyECEF := pos_y;
	RzECEF := pos_z;

	rad_dist := Sqrt_f(RxECEF*RxECEF + RyECEF*RyECEF + RzECEF*RzECEF);

	if (rad_dist < AIDRLMT) then
		MagComp_Err := 16#5555#;
	else
		pos_mag_xy := Sqrt_f(RxECEF*RxECEF + RyECEF*RyECEF);
		abs_rz := Abs(RzECEF);

		if ((abs_rz < LEAST_F64) and then (pos_mag_xy < LEAST_F64)) then
			MagComp_Err := 16#5555#;

		else
			abs_rx := Abs(RxECEF);
			abs_ry := Abs(RyECEF);

			if ((abs_rx < LEAST_F64) and then (abs_ry < LEAST_F64)) then
				MagComp_Err := 16#5555#;

			else
				lngtdw := Atan2_F(RyECEF, RxECEF);
			end if;

		end if;

	end if; 

	if (MagComp_Err = 16#AAAA#) then       
		sincolat := sin_f(co_lat);
		abssincolat := Abs(sincolat);

		if (abssincolat < sinCoLatLmt) then

			lat_valdty_flg := 16#AAAA#;
			magFld_readiness := 16#AAAA#;
			MagComp_Err := 16#5555#;

		else
			lat_valdty_flg := 16#5555#;
			sinlngtdw := sin_F(lngtdw);
			coslngtdw := cos_F(lngtdw);
			coscolat := cos_F(co_lat);
			magFld_readiness := 16#5555#;

		end if;
	end if;

   end rMagFldCmptn;

-------------------------------------------------------------------------------------------------
-- Procedure for reference sun vector computation in ECI

   procedure rSunVctCmp is
      
   begin

      if (Nvc_soln_frst_updt = 16#5555#) then

	Rx := posx_eci;
	Ry := posy_eci;
	Rz := posz_eci;

	RdotS := (Rx * Sxi) + (Ry * Syi) + (Rz * Szi);
	radius := Sqrt_f((Rx * Rx) + (Ry * Ry) + (Rz * Rz));

	sunVct_readiness := 16#5555#;
	RsqrMReSqr := radius*radius - RE*RE;

	if (RsqrMReSqr > LEAST_F64) then
		if (RdotS < -Sqrt_f(RsqrMReSqr)) then
			sunVct_pres_flg := 16#AAAA#;
		else
			sunVct_pres_flg := 16#5555#;
		end if;
        end if;

    end if;
      

   end rSunVctCmp;

-------------------------------------------------------------------------------------------------
-- Procedure for transformation of sun vector computation in ECI to body frame

   procedure rSunVctECItoBdy is
      
   begin

      if (quat_val_flgtoMjr = 16#5555# and then sunVct_readiness = 16#5555#) then

		SunVctComptnSts := 16#5555#;
      else
		SunVctComptnSts := 16#AAAA#;
      end if;

      if (sunVct_pres_flg = 16#AAAA# and then sunVct_readiness = 16#5555#) then

		SunEclipseStsFlg := 16#5555#;
      else
		SunEclipseStsFlg := 16#AAAA#;
      end if;
      

   end rSunVctECItoBdy;

-------------------------------------------------------------------------------------------------
  procedure rMnrNav_driver is

  begin
	
	if (minorID < 25) then
		minorID := minorID + 1;
	else
		minorID := 1;
	end if;

	SunMagComnSts := 16#5555#;

	rSunMagDataAcq;
        mjr_data_ready := 16#5555#;

  end rMnrNav_driver;

-------------------------------------------------------------------------------------------------
  procedure rMjrNav_driver is

  begin
	
	if (mjr_data_ready = 16#5555#) then
		rMagFldCmptn;
		rSunVctCmp;
		rSunVctECItoBdy;

		mjr_data_ready := 16#AAAA#;

	end if;

  end rMjrNav_driver;
	       

end SunMag;
