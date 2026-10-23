with major_cycle;
with minor_cycle;
with lookup;


package body main is


procedure StageFlags is
      begin
      
         if (StageFlg + StageFlgC = 16#FFFF#) then
             Time := float32(CycleCount) * 0.02;
             
            if (MinorInMajor = 1)then
               Major_Time := Time;
            end if;

             case StageFlg is
             
             -- Set output flags based on events and time
             
               when 16#11# =>
                  if (OutFlag = 16#11#) then
                     Liftoff := Time;
                     OutFlag := 16#22#;
                  end if;
                  
               when 16#22# =>
                  if (OutFlag = 16#22#) then
                     Step2 := 1;
                     OutFlag := 16#33#;
                  end if;
                  
               when 16#33# =>
                  if (OutFlag = 16#33#) then
                     Stage2_Start := Time;
                     OutFlag := 16#44#;
                  end if;
                  
               when 16#44# =>
                 if (OutFlag = 16#44#) then
                  if (MinorInMajor = 1) then
                     Step4 := 1;
                     OutFlag := 16#55#;
                     end if;
                 end if;
                 
               when 16#55# =>
                 if (OutFlag = 16#55#) then
                  if (MinorInMajor = 1) then
                     Step5 := 1;
                     OutFlag := 16#66#;
                   end if;
                 end if;
                 
               when 16#66# =>
                 if (OutFlag = 16#66#) then
                  if (MinorInMajor = 1) then
                     Step6 := 1;
                     OutFlag := 16#77#;
                   end if;
                 end if;
                 
               when 16#77# =>
                if (OutFlag = 16#77#) then
                     Step7 := 1;
                     OutFlag     := 16#88#;
                end if;
                
               when 16#88# =>
                if (OutFlag = 16#88#) then
                     Step8 := 1;
                     OutFlag := 16#99#;
                 end if;
                 
               when 16#99# =>
                  if (OutFlag = 16#99#) then
                     Stage3_Start := Time;
                     OutFlag := 16#AA#;
                  end if;
                  
               when 16#AA# =>
                  if (OutFlag = 16#AA#) then
                     if (MinorInMajor = 1) then
                        Step10 := 1;
                        OutFlag := 16#BB#;
                    end if;
                  end if;
                  
               when 16#BB# =>
                  if (OutFlag = 16#BB#) then
                    if (MinorInMajor = 1) then
                      Step11 := 1;
                      OutFlag := 16#CC#;
                    end if;
                  end if;
                  
               when 16#CC# =>
                  if (OutFlag = 16#CC#) then
                     Step12 := 1;
                     OutFlag     := 16#DD#;
                  end if;
                  
               when 16#DD# => 
                   if (OutFlag = 16#DD#) then
                     if (MinorInMajor = 1) then
                        Step13 := 1;
                        Step14 := 0;
                        Major_Cycle.Duration := 50.0;
                        OutFlag         := 16#EE#;
                     end if;
                  end if;
                  
               when 16#EE# =>
                  if (OutFlag = 16#EE#) then
                     if (MinorInMajor = 1)then
                       Step14 := 1;
                       Step13 := 0;
                       Minor_Cycle.FirstCycle_Mnvre := 0;
                       OutFlag := 16#DD#;
                     end if;
                  end if;
                  
               when others =>
                  null;
                  
            end case;
            
         else
            CombinedErrorFlag := 1;
         end if;
         
end StageFlags;

procedure OutputFlags_Minor is

    begin
      
    	 -- Set flags to other software
    
         if (Event4 = 1) and then (OutFlag1 = 0) then
            GuidOutFlag  := 16#1111#;
            GuidOutFlagC := 16#EEEE#;
            OutFlag1 := 1;
         end if;

         if (((OffStage2 = 1) and then (Step7 = 1)) and then (OutFlag2 = 0)) then
            GuidOutFlag  := 16#2222#;
            GuidOutFlagC := 16#DDDD#;
            OutFlag2 := 1;
         end if;

         if (OffStage2 = 1 ) and then (OutFlag3 = 0) then
            GuidOutFlag  := 16#3333#;
            GuidOutFlagC := 16#CCCC#;
            OutFlag3 := 1;
         end if;
         
end OutputFlags_Minor;


procedure Guid_Minor is
      begin
      
         StageFlags;
         
         if (Step14 = 1) then
            null;
            
         elsif (Step13 = 1) then
            Minor_Cycle.Manoeuvre; 
                         
         elsif (Step10 = 1) then
            Minor_Cycle.Stage3_Minor;
            
         elsif(Step4 = 1) then
            Minor_Cycle.Stage2_Minor;
            OutputFlags_Minor;
            
         else
            Minor_Cycle.Stage1_Minor;
            
         end if;
         
end Guid_Minor;


procedure Guid_Major is
      begin
         
         if (Step14 = 1) then
            null;
            
         elsif (Step13 = 1) then
            Major_Cycle.Manoeuvre; 
                         
         elsif (Step10 = 1) then
            Major_Cycle.Stage3_Major;
            
         else
            Major_Cycle.Stage2_Major;
            
         end if;
         
end Guid_Major;


procedure FirstInit is
begin

  Lookup.IterationCount     := 1;
  MinorInMajor              := 1;

  Major_Cycle.VelocityIncrMj := 0.0;
  Major_Cycle.VelocityIncrMn := 0.0;
  Major_Cycle.MinorFlag_Stage2   := 0;
  Major_Cycle.MinorFlag_Stage3   := 0;
  Major_Cycle.EnterStage2     := 1;
  Major_Cycle.Event4         := 0;
  Major_Cycle.VelFlag         := 0;
  Major_Cycle.EnterStage3     := 1;
  
  Minor_Cycle.OffStage2      := 0;
  Minor_Cycle.OffStage3      := 0;
  Minor_Cycle.FirstCycle_Stage1    := 1;
  Minor_Cycle.FirstCycle_Stage2    := 1;
  Minor_Cycle.FirstCycle_Stage3    := 1;
  
  OutFlag     := 16#11#;
  Step12      := 0;
  Step8       := 0;
  Step7       := 0;
  Step11      := 0;
  Step5       := 0;
  Step6       := 0;
  Step4       := 0;
  Step10      := 0;
  Step13      := 0;
  Step14      := 0;
  Step2       := 0;
  
  OffStage2   := 0;
  OffStage3   := 0;
  
  OutFlag1    := 0;
  OutFlag2    := 0;
  OutFlag3    := 0;
  
  MinorFlag_Stage2   := 0;
  MinorFlag_Stage3   := 0;
  
  CombinedErrorFlag   := 0;
  GuidOutFlag         := 16#0000#;
  GuidOutFlagC        := 16#FFFF#;
  
  BRate(1) := 0.0;
  BRate(2) := 0.0;
  BRate(3) := 0.0;
  
  Stage_Time := 0.0;
  EffectiveGravity := 0.0;
  AngleR := 0.0;
  AngleY := 0.0;
  GuidVel_U := 0.0;
  GuidVel_V := 0.0;
  GuidVel_W := 0.0;
  
  SteerCoeffA := 0.0;
  SteerCoeffB := 0.0;
  SteerCoeffC := 0.0;
  SteerCoeffD := 0.0;
  PosDefOutofPlane := 0.0;
  DefPos := 0.0;
  DefVel := 0.0;
  Matrix11 := 0.0;
  Matrix12 := 0.0;
  Matrix22 := 0.0;

  TTG := 0.0;

  Minor_Cycle.FirstCycle_Mnvre := 0;

end FirstInit;



end main;
