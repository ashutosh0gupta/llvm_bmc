package body nav3 is

   Q0_Temp,Q1_Temp,Q2_Temp,Q3_Temp : Float64;    

   D_Theta_Ex,D_Theta_Ey,D_Theta_Ez : Float64;
   D_Theta_Exp,D_Theta_Eyp,D_Theta_Ezp : Float64 := 0.0;
                                         
   Phix,Phiy,Phiz : Float64;

   Advx,Advy,Advz : Float64 ;

   Acu_Vel_Incz : Float32 := 0.0 ;
-------------------------------------------------------------------------------------------------

-- Procedure for quaternion update

   procedure proc1 is
      P0,P1,P2,P3,Tmp : Float64;
      One_By_12 :constant :=  1.0/12.0;
      Temp2 : Float64;  
   begin

      D_Theta_Ex := Float64(DThetaX_sel)- Wrate_X ;
      D_Theta_Ey := Float64(DThetaY_sel)- Wrate_Y;
      D_Theta_Ez := Float64(DThetaZ_sel)- Wrate_Z  ;


      Phix := D_Theta_Ex + One_By_12 * (( D_Theta_Eyp * D_Theta_Ez)
         - (D_Theta_Ezp * D_Theta_Ey));

      Phiy := D_Theta_Ey + One_By_12 * (( D_Theta_Ezp * D_Theta_Ex)
         -(D_Theta_Exp * D_Theta_Ez));

      Phiz := D_Theta_Ez + One_By_12 * (( D_Theta_Exp * D_Theta_Ey)
         -(D_Theta_Eyp * D_Theta_Ex));


      Tmp:= Phix*Phix+Phiy*Phiy+Phiz*Phiz;

      Temp2 := ( Float64(0.5) - Tmp/Float64(48.0) + Tmp*Tmp/Float64(3840.0));

      P0 := Float64(1.0) -  Tmp/Float64(8.0) + (Tmp*Tmp)/ Float64(384.0);

      P1 := Temp2 * Phix;
      P2 := Temp2 * Phiy;
      P3 := Temp2 * Phiz;


      Q0_Temp := Q0 * P0 - Q1 * P1
         - Q2* P2 - Q3 * P3;
      Q1_Temp := Q1 * P0 + Q0 * P1
         - Q3 * P2 + Q2 * P3;
      Q2_Temp := Q2 * P0 + Q3 * P1
         + Q0 * P2 - Q1 * P3;
      Q3_Temp := Q3 * P0 - Q2 * P1
         + Q1 * P2 + Q0 * P3;


      D_Theta_Exp := D_Theta_Ex;
      D_Theta_Eyp := D_Theta_Ey;
      D_Theta_Ezp := D_Theta_Ez;

    
      Q0 := Q0_Temp;
      Q1 := Q1_Temp;
      Q2 := Q2_Temp;
      Q3 := Q3_Temp;

   end proc1;

-------------------------------------------------------------------------------------------------
procedure proc2 is
      K1,K2,K3 : Float64 ;
      TempdVX,TempdVY,TempdVZ : Float64;
   begin


     TempdVX  := Float64(Dvx_sel);
     TempdVY  := Float64(Dvy_sel);
     TempdVZ  := Float64(Dvz_sel);

     K1 := Q2 * TempdVX - Q1 * TempdVY - Q0 * TempdVZ;
     K2 := Q3 * TempdVX + Q0 * TempdVY - Q1 * TempdVZ;
     K3 := Q0 * TempdVX - Q3 * TempdVY + Q2 * TempdVZ;

     Advx := Advx + TempdVX - 2.0 * (Q2 * K1 + Q3 * K2);
     Advy := Advy + TempdVY + 2.0 * (Q1 * K1 + Q3 * K3);
     Advz := Advz + TempdVZ + 2.0 * (Q1 * K2 - Q2 * K3);


     Acu_Vel_Incz := Acu_Vel_Incz + Dvz_sel ;


      if(Minorid =25) then
                                   
         dVxEci := Advx;
         dVyEci := Advy;
         dVzEci := Advz;

         Advx := 0.0;                  
         Advy := 0.0;
         Advz := 0.0;
 
         Thr_velinc_mjr := Acu_Vel_Incz;

          Acu_Vel_Incz :=  ( Acu_Vel_Incz * 32767.0 )/16.0 ;


         if( Acu_Vel_Incz > 32767.0 ) then
            Acu_Vel_Incz := 32767.0;
         elsif ( Acu_Vel_Incz < - 32767.0 )then
            Acu_Vel_Incz := - 32767.0;
         end if;

         Velinc_Zavc := F32TOS16(Acu_Vel_Incz );

         Velinc_Zavc_Tm := Velinc_Zavc ;

         Acu_Vel_Incz := 0.0;


     end if;

   end proc2;

   procedure nav3_driver is
   begin

	MinorID := MinorID + 1;
	if (MinorID > 25) then
		MinorID := 1;
	end if;	
	proc1;
	proc2;

   end nav3_driver;

end nav3;
