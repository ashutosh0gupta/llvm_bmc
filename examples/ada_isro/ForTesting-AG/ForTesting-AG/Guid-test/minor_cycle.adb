with major_cycle;
with lookup;
with main;
with library;

package body Minor_Cycle is

PrevCycle_Q : Math.Quaternion;


Procedure Stage1_Minor is

      LocalQ  : Math.Quaternion;

   begin   
      LocalQ:= Main.QC;
      
      if (FirstCycle_Stage1 = 1) then
      
         Lookup.Quaternion_Prev := LocalQ;
         FirstCycle_Stage1 := 0;
         Main.FirstInit;   -- Initialise essential variables
         
      end if;
      
      if (Main.Step2 = 1) then
         Lookup.Output_Lookup(Main.AltitudeInfo, LocalQ);  -- Invoke table lookup function
      end if;
         
     Main.QC     := LocalQ;
     
end Stage1_Minor;



procedure Stage2_Minor is
begin

 if (FirstCycle_Stage2 = 1) then
      if (Main.CycleCount = 25) then
      	FirstCycle_Stage2 := 0;
      end if;
      
    else
		if (Main.Step8 = 0 and then OffStage2 = 0) then
			if (Main.CycleCount = 1) then
				MinorFlag_Stage2 := Major_Cycle.MinorFlag_Stage2;
				Q_Minor := Major_Cycle.Q_Minor;  -- Command from major cycle for first cycle
			end if;
				
			Post_Output;  -- Post commands for remaining cycles
			
			if (MinorFlag_Stage2 = 1) then
				if (VelocityCoeff > 5236.0) then  --Target Velocity
					OffStage2 := 1;
					Main.OffStage2 := OffStage2;
				end if;
			end if;
		end if;
		
    end if;
    
end Stage2_Minor;



procedure Stage3_Minor is
  begin
  
    if (FirstCycle_Stage3 = 1) then
      if (Main.CycleCount = 25) then
      	FirstCycle_Stage3 := 0;
      end if;
      
    else
		if (Main.Step12 = 0 and then OffStage3 = 0) then
			if (Main.CycleCount = 1) then
				MinorFlag_Stage3 := Major_Cycle.MinorFlag_Stage3;
				Q_Minor := Major_Cycle.Q_Minor;  -- Command from major cycle for first cycle
			end if;
				
			Post_Output;  -- Post commands for remaining cycles
			
			if (MinorFlag_Stage3 = 1) then
				if (Main.Apogee > 31523360.0) then  --Target Apogee
					OffStage3 := 1;
					Main.OffStage3 := OffStage3;
				end if;
			end if;
		end if;
		
    end if; 
    
end Stage3_Minor;
 


procedure Manoeuvre is
  begin
  
    if (FirstCycle_Mnvre = 0) then
      if (Main.CycleCount = 25) then
      	FirstCycle_Mnvre := 1;
      end if;
      
    else
      if (Main.CycleCount = 1) then
        Q_Minor := Major_Cycle.Q_Minor;  -- Command from major cycle for first cycle
      end if;
      
      Post_Output;    -- Post commands for remaining cycles
    end if;
    
end Manoeuvre;



procedure Post_Output is
   Count : short_integer;
   
   begin
    
     Count := Short_Integer(Main.CycleCount); 
     
     for j in short_integer range 1..4 loop
       PrevCycle_Q(j) := Q_Minor(Count,j);
     end loop;
     
     Main.QC := PrevCycle_Q;
     
end Post_Output;
   
      
end Minor_Cycle;
