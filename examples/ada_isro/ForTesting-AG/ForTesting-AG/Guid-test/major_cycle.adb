with main;
with algorithm;
with library;

package body Major_Cycle is

-- Global variables
Angle_to_cover : float32;
RD_Target, HV_Target : float32;
RatesBprev : Math.F32Array1by3;
DirCos_Stage2 : Math.F32Array1by3 := (-0.2593, -0.1906, 0.9518);
DirCos_Stage3 : Math.F32Array1by3 := (-0.2698, -0.1897, 0.9396);
DirCosPerigeeLine  : Math.F32Array1by3 := (-0.5399, 0.8296, 0.0123);
CorrFactor1 : float32 := 1.0;
TimeConst_Stage2 : float32 := 300.028;

procedure ConstantQ(PrevQ : in Math.Quaternion);

procedure Stage2_Major is

   begin
   
        -- If 2nd stage is ending, retain previous commands
		if (Main.Step8 = 0 and then Main.OffStage2 = 0) then
			ConstantQ(MajorPrev_Q);   
			
		else
		
			-- Init routine
			if (EnterStage2 = 1) then
				Stage2_Initialise;
				EnterStage2 := 0;
			end if;
		
			Position(1) := Main.PosX;
			Position(2) := Main.PosY;
			Position(3) := Main.PosZ;
			Velocity(1) := Main.VelU;
			Velocity(2) := Main.VelV;
			Velocity(3) := Main.VelW;

			-- Calculate time			
			Stage_Time  := Main.Major_Time - Main.Stage2_Start;
			
			-- Velocity computation
			
			if (VelFlag = 1) then
			
		          InstVelocity := Library.SquareRoot(Velocity(1) * Velocity(1) + Velocity(2) * Velocity(2) + Velocity(3) * Velocity(3));
		          VelocityIncrMj := InstVelocity - InstVelocityPrev;
		          VelocityCoeff := InstVelocity + VelocityIncrMj;
		          VelocityIncrMn := VelocityIncrMj / 25.0;
		          InstVelocityPrev := InstVelocity;	
          	        
		    end if;
      
			
			if (MinorFlag_Stage2 = 1) then
				ConstantQ(MajorPrev_Q);
				TTG := TTG - 0.5;
				
			else
			
			    -- Computation of Direction Cosines
			
				Computation1(Position, DirCos_Stage2);
				
				Math.DotProduct(DirCos_U, Velocity, GuidVel(1));
			    Math.DotProduct(DirCos_V, Velocity, GuidVel(2));
			    Math.DotProduct(DirCos, Velocity, GuidVel(3));
			    VelSqr := GuidVel(1) * GuidVel(1) + GuidVel(2) * GuidVel(2);
			
			    -- Calculating Effective gravity
			    	
			    EffectiveGravity := ((4.0e14/ TempA) - VelSqr) / TempA;
			    
			    Math.DotProduct(DirCos_V, DirCos_Stage2, TempL);
			    Math.DotProduct(Position, DirCos_Stage2, DistVelAxis);
				
			    DistVelAxis := -DistVelAxis;
				DistVelAxis := DistVelAxis/TempL;
				
				TempP := Library.Exponent((GuidVel(1) - (4602.643 * 6492735.0/TempA)/ 2921.79));
				
                TempT := 297.012 - Stage_Time;
	            TTG := TempT * (1.0 - TempP);
                Total_Time_Stage2 := TTG + Stage_Time;
                
                -- Angle calculation for algorithm
                
                Algorithm.CompAngleR(GuidVel, EffectiveGravity, TempA, Total_Time_Stage2, Stage_Time, AngleR);					
				Main.AngleR    := AngleR;
				
                Algorithm.CompAngleY(DistVelAxis, GuidVel(2), Stage_Time, AngleY);
				Main.AngleY    := AngleY;
				
				if ((TTG < 13.5) and then (Event4 = 0)) then
                     Event4 := 1;
                end if;
                
                -- Transform to ECI frame
				
				Math.GuidECITransform(DirCos_U, DirCos_V, DirCos, AngleR, AngleY, TempRes);
				
                Math.GenRates(TempRes, MajorPrev_Q, BRate);
                
                if (TTG < 5.0) then
                    MinorFlag_Stage2 := 1;
                end if;
                
                PropagateQ(MajorPrev_Q, BRate);
          
			end if; 
		
		-- Outputs	
				
        TTG_Prev       := TTG;
        Main.MinorFlag_Stage2  := MinorFlag_Stage2;
        Main.TTG := TTG;
        Main.GuidVel_U   := GuidVel(1);
        Main.GuidVel_V   := GuidVel(2);
        Main.GuidVel_W   := GuidVel(3);
        Main.EffectiveGravity       := EffectiveGravity;
        Main.Stage_Time := Stage_Time;
        Main.BRate  := BRate;
			
		end if;

end Stage2_Major;

procedure Stage3_Major is
Cosine_TA, Target_TA, Predicted_TA, SLR, Eccentricity  : Float32;
RD_Target, VelocityRadial, TempG : Float32;
T1, T2 : Float32;

   begin
   
   		-- If 3rd stage is ending, retain previous commands
   		
		if (Main.Step12 = 0 and then Main.OffStage3 = 0) then
			ConstantQ(MajorPrev_Q);
			
		else
			Position(1) := Main.PosX;
			Position(2) := Main.PosY;
			Position(3) := Main.PosZ;
			Velocity(1) := Main.VelU;
			Velocity(2) := Main.VelV;
			Velocity(3) := Main.VelW;
			
			--Init routine
			if (EnterStage3 = 1) then
				Stage3_Initialise;
				EnterStage3 := 0;
			end if;
			
			Stage_Time  := Main.Major_Time - Main.Stage3_Start;
			
			if (MinorFlag_Stage3 = 1) then
				ConstantQ(MajorPrev_Q);
				TTG := TTG - 0.5;
				
			else
			
				Computation1(Position, DirCos_Stage3);
	
				-- Computation of velocity
							
				Math.DotProduct(DirCos_U, Velocity, GuidVel(1));
			    Math.DotProduct(DirCos_V, Velocity, GuidVel(2));
			    Math.DotProduct(DirCos, Velocity, GuidVel(3));
			    VelSqr := GuidVel(1) * GuidVel(1) + GuidVel(2) * GuidVel(2);
				
			    Math.DotProduct(DirCos_V, DirCos_Stage3, TempL);
			    Math.DotProduct(Position, DirCos_Stage3, DistVelAxis);
				
			    DistVelAxis := -DistVelAxis;
				DistVelAxis := DistVelAxis/TempL;
				
				AngleToCover;
				
				-- Calculation of true anomaly
				
				Math.DotProduct(DirCos, DirCosPerigeeLine, Cosine_TA);
                Cosine_TA := -Cosine_TA;
				
				if (Cosine_TA < 0.99996) then
                    TA := Library.SinInverse(Cosine_TA);
                    Math.CrossProduct(DirCosPerigeeLine, DirCos, Variable_TA);
                    Math.DotProduct(DirCos_Stage3, Variable_TA, Target_TA);
                
					if (Target_TA > 0.0) then
                       Predicted_TA :=  Angle_to_cover - TA;
                    else
                       Predicted_TA :=  Angle_to_cover + TA;
                    end if;
					
                    SLR :=  (2.0 * 40927660.0 * 6497260.0)/(40927660.0 + 6497260.0);
                    Eccentricity  := (40927660.0 - 6497260.0) / (40927660.0 + 6497260.0);
                    RD_Target  := SLR /(1.0 + Eccentricity * Library.Cosine(Predicted_TA));
					
                    T1 := 2.0 * 3.986e14 * 40927660.0 * 6497260.0;
                    T2 := RD_Target * RD_Target * (40927660.0 + 6497260.0);
                    VelocityRadial   :=  Library.SquareRoot(T1/ T2);
                                                       
                    T1 := 2.0 * 3.986e14 * (40927660.0 - RD_Target)* (RD_Target - 6497260.0);    
                    T2 := RD_Target * RD_Target * (40927660.0 + 6497260.0);
                    HV_Target  := Library.SquareRoot(T1/ T2);
					
                    Algorithm.RD_Target := RD_Target;
      	            Algorithm.HV_Target := HV_Target;
					
                    if (Predicted_TA > 0.0) then
                        VelocityRadial := -VelocityRadial;
                    end if;
					
                    Algorithm.VelocityRadial := VelocityRadial;
					
				end if;
			
				-- Computing effective gravity
				
				TempG := ((3.986e14 / TempA) - VelSqr) / TempA; 
                EffectiveGravity  := (CorrFactor1 + CorrFactor2 * TempG) * TempG;
				TempP := Library.Exponent((GuidVel(1) - (HV_Target * RD_Target/TempA)/ 4621.79));
				
                TempT := 820.0 - Stage_Time;
	            TTG := TempT * ( 1.0 - TempP );
                Total_Time_Stage3 := TTG + Stage_Time;
                
                -- Angle calculation for algorithm
				
                Algorithm.CompAngleR(GuidVel, EffectiveGravity, TempA, Total_Time_Stage3, Stage_Time, AngleR);					
				Main.AngleR    := AngleR;
				
                Algorithm.CompAngleY(DistVelAxis, GuidVel(2), Stage_Time, AngleY);
				Main.AngleY    := AngleY;
				
				-- Transform to ECI frame
				
				Math.GuidECITransform(DirCos_U, DirCos_V, DirCos, AngleR, AngleY, TempRes);
				
                Math.GenRates(TempRes, MajorPrev_Q, BRate);
                
                if (TTG < 5.0) then
                    MinorFlag_Stage3 := 1;
                end if; 
                      
         		PropagateQ(MajorPrev_Q, BRate);
          
			end if; 
		
		-- Outputs	
				
        TTG_Prev       := TTG;
        Main.MinorFlag_Stage3  := MinorFlag_Stage3;
        Main.TTG := TTG;
        Main.GuidVel_U   := GuidVel(1);
        Main.GuidVel_V   := GuidVel(2);
        Main.GuidVel_W   := GuidVel(3);
        Main.EffectiveGravity       := EffectiveGravity;
        Main.Stage_Time := Stage_Time;
        Main.BRate  := BRate;
			
		end if;

end Stage3_Major;


procedure AngleToCover is

    TempW, TempX, TempY, TempZ        : Float32;
    Var1, Var2                     : Float32;
	
    begin
	
		TTG  	:= Total_Time_Stage3 - Stage_Time;
		TempW   := 820.0 - Stage_time;
       
        TempX   := 820.0 - Total_Time_Stage3;
        TempZ   := Library.log(TempW);
       
  	    Var1     := (GuidVel(1) + 4621.79 * TempZ)* TTG;
        Var2     := TempX * (Library.log(TempX) - 1.0) - TempW * (TempZ - 1.0);
        TempY    := GuidVel(1) * GuidVel(3) / TempA;
        
		Angle_to_cover   := (Var1 + 4621.79 * Var2 - 0.5 * TempY * TTG * TTG)/TempA;
       
   end AngleToCover;
   

procedure PropagateQ(PrevQ : in out Math.Quaternion;
                     Brate : in Math.F32Array1by3)is
   begin
   
         Temp1(1) := 0.0;
         Temp1(2) := Brate(1) * 0.01;
         Temp1(3) := Brate(2) * 0.01;
         Temp1(4) := Brate(3) * 0.01;
         
         Math.Normalise(PrevQ);
         
         for k in Short_Integer Range 1..25 loop
            Math.Multiply(PrevQ, Temp1, DotQ);
            
            for i in Short_Integer Range 1..4 loop
              PrevQ(i) := PrevQ(i) + DotQ(i);
              Q_Minor(k,i) := PrevQ(i);
            end loop;
            
         end loop;
         
end PropagateQ;


procedure ConstantQ(PrevQ : in Math.Quaternion) is

   begin
     for k in Short_Integer Range 1..25 loop
        for i in Short_Integer Range 1..4 loop
            Q_Minor(k,i) := PrevQ(i);
        end loop;
     end loop;

end ConstantQ;



procedure Stage2_Initialise is
	begin
	
		BRate(1) := 0.0;
		BRate(2) := 0.0;
		BRate(3) := 0.0;
		
		Algorithm.VelocityRadial := -561.28;
		Algorithm.ExhaustVel := 2921.79;
		Algorithm.TimeConst := TimeConst_Stage2;
		
		TTG_Prev := 160.0;
		MajorPrev_Q := Main.QC;

end Stage2_Initialise;



procedure Stage3_Initialise is
	begin
	
		BRate(1) := 0.0;
		BRate(2) := 0.0;
		BRate(3) := 0.0;

		Algorithm.ExhaustVel := 4297.78;
		Algorithm.TimeConst := TimeConst_Stage3;
		
		TTG_Prev := 625.04;
		Total_Time_Stage3 := 630.19;
		
		MajorPrev_Q := Main.QC;

end Stage3_Initialise;



procedure Computation1 (Pos, TargetDirCos : in Math.F32Array1by3) is
    Temp1 : Math.F32Array1by3;
    RadDist: float32;
	
    begin
	
        TempA := Main.RadialDist;
        RadDist := 1.0/ TempA;
		
        DirCos(1) := Pos(1) * RadDist;
        DirCos(2) := Pos(2) * RadDist;
        DirCos(3) := Pos(3) * RadDist;
		
        Math.CrossProduct(TargetDirCos, DirCos, Temp1);
        Math.DirCosine(Temp1, DirCos_U);
        Math.CrossProduct(DirCos, DirCos_U, Temp1);
        Math.DirCosine(Temp1, DirCos_V);
		
        DirCos(1) := - DirCos(1);
        DirCos(2) := - DirCos(2);
        DirCos(3) := - DirCos(3);
			
        DirCos_V(1) := - DirCos_V(1);
        DirCos_V(2) := - DirCos_V(2);
        DirCos_V(3) := - DirCos_V(3);
		
end Computation1;


procedure Manoeuvre is

  InverseQ, ErrorQ : Math.Quaternion;
  Temp : Float32;
  RatesB : Math.F32Array1by3;

  begin
  
    Math.Inverse(MajorPrev_Q, InverseQ);
    Math.Multiply(InverseQ, DesiredQ, ErrorQ);
    Math.Negate(ErrorQ);
    
    for i in short_integer range 1..3 loop
      Temp := Library.SinInverse(ErrorQ(i+1));
      
      RatesB(i) := 2.0 * Temp / Duration;
      RatesBprev(i) := RatesB(i);
    end loop;
    
    PropagateQ(MajorPrev_Q, RatesB);
    Duration := Duration - 0.5;
    Main.BRate := RatesB;
    
end Manoeuvre;

end Major_Cycle;
