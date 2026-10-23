with library;

package body LS_Rates is

   Bias1 : F32Array1by3 := (0.00, 0.00, 0.00);     -- Bias in deg/s
   Bias2 : F32Array1by3 := (0.00, 0.00, 0.00);

   Factor1 : F32Array1by3 := (2.98e-04, 2.98e-04, 2.98e-04);   -- Scale factor in deg/s/count
   Factor2 : F32Array1by3 := (2.98e-04, 2.98e-04, 2.98e-04);
 
   Diff_PermFail : U16Array1by3 := (16#0000#, 16#0000#, 16#0000#); 
   Health_PermFailure : U16Array1by2 := (1, 1); 
                              
   ChosenPackage : U16Array1by3 := (16#0001#, 16#0001#, 16#0001#);

   SecDiffCount, SecDiffCount2 : U16Array1by3;
   AccDiff : F32Array1by3;                   
   AccDiff1, AccDiff2 : F32Array1by3; 
       
   AccDiffStore : F32Array3by100;         
   AccDiff1Store, AccDiff2Store : F32Array3by100;
   MaxSecDiff : F32Array1by3;              

   FirstDiff_Error, ErrorCounter_Diff1, ErrorCounter_Diff2, SecDiff_Error1, SecDiff_Error2 : U16Array1by3;
   ErrorCount_Comm, ErrorCount_Health : U16Array1by2;   
   
   CurrentHealthFail : U16Array1by2;
   ConsolidatedFailure : U16Array1by2;   

   CounterErrorBoth, CounterFailure : U16Array1by3;
   FirstDiff_Bound, KeepLastData, Chosen, OverallHealth : U16Array1by3;

   Comp_Rate1, Comp_Rate2 : F32Array1by3;

   FirstDiff_Comp, FirstDiff_Comp1, FirstDiff_Comp2 : F32Array1by3;
   SecondDiff_Isolation, FirstDiff_Isolation : U16Array1by3;  
   

   
procedure Preprocess is

   begin

      for I in Unsigned_16 range 1..3 loop    -- 3 axes

         Comp_Rate1(I) := Float32(Raw_Rate1(I)) * Factor1(I) - Bias1(I);

         if (Comp_Rate1(I) > 5.0) then                          -- Limit to +-5 deg/s
            Comp_Rate1(I) := 5.0;
         elsif (Comp_Rate1(I) < -5.0) then
            Comp_Rate1(I) := -5.0;
         end if;

         Comp_Rate2(I) := Float32(Raw_Rate2(I)) * Factor2(I) - Bias2(I);

         if (Comp_Rate2(I) > 5.0) then                          -- Limit to +-5 deg/s
            Comp_Rate2(I) := 5.0;
         elsif (Comp_Rate2(I) < -5.0) then
            Comp_Rate2(I) := -5.0;
         end if;

      end loop; -- end of for loop

   end Preprocess;

 
   
        
procedure HealthCheck is

   begin

   for I in Unsigned_16 range 1..2 loop      -- for 2 packages

      -- Status of health and communication checks
      if (Health_PermFailure(I) = 0) then
      
	     -- Clear current cycle health and consolidated failure flags
         CurrentHealthFail(I) := 0;                                    
         ConsolidatedFailure(I) := 0;                             

         if (MessageFail(I) = 1) then         -- If there is a communication failure         
            ErrorCount_Comm(I) := ErrorCount_Comm(I) + 1;            
	   	
            if (ErrorCount_Comm(I) >= 3) then           -- If error count >= 3, set consolidated failure flag
               ConsolidatedFailure(I) := 1;                 
            end if;

         else                 -- No communication failure 
         
            ErrorCount_Comm(I) := 0;            -- Reset communication error counter

             -- If health parameter not within limits
            if ((HealthParameter(I) < 11000) or else (HealthParameter(I) > 13000)) then

               CurrentHealthFail(I) := 1;                  -- Set current cycle health check failure flag               
               ErrorCount_Health(I) := ErrorCount_Health(I) + 1;         -- Increment health error counter 

               if (ErrorCount_Health(I) >= 3) then      -- If health error counter >= 3, set consolidated failure flag
                  ConsolidatedFailure(I) := 1;                    
               end if;

               if (ErrorCount_Health(I) >= 500) then        -- If health error counter >= 500, set permanent failure flag
                  Health_PermFailure(I) := 1;               
               end if;

            else              -- No communication or health error

               ErrorCount_Health(I) := 0;      -- Reset health error counter

            end if;

         end if;
      end if;
   end loop;

   end HealthCheck;
  
    


   procedure SecondDiff is

      DiffAbsolute : Float32;
      Temp : Unsigned_16;

   begin

      for I in Unsigned_16 range 1..3 loop

         SecondDiff_Isolation(I) := 0;          -- No errors
        
         if ((OverallHealth(I) = 1) and then (FirstDiff_Bound(I) = 0)) then
        
            -- Count to access last 50 samples
            SecDiffCount(I) := SecDiffCount(I) + 1;
            
            if (SecDiffCount(I) > 50) then
               SecDiffCount(I) := 1;
            end if;
        
            -- Count to access last 50 samples to compare with reference
            SecDiffCount2(I) := SecDiffCount2(I) + 1;
        
            if (SecDiffCount2(I) > 50) then
               SecDiffCount2(I) := 1;
            end if;
        
            Temp := SecDiffCount(I);
        
            AccDiff(I) := AccDiff(I) + FirstDiff_Comp(I) - AccDiffStore(I,Temp); -- Difference between the 2 packages
            AccDiffStore(I,Temp) := FirstDiff_Comp(I);                       -- Store the difference 
        
            DiffAbsolute := Abs(AccDiff(I));
        
            if (DiffAbsolute > MaxSecDiff(I)) then                   -- Maximum difference
               MaxSecDiff(I) := DiffAbsolute;
            end if;
        
            Temp := SecDiffCount2(I);
         
            AccDiff1(I) := AccDiff1(I) + FirstDiff_Comp1(I) - AccDiff1Store(I,Temp); -- Difference from reference for package1
            AccDiff1Store(I,Temp) := FirstDiff_Comp1(I);
         
            AccDiff2(I) := AccDiff2(I) + FirstDiff_Comp2(I) - AccDiff2Store(I,Temp); -- Difference from reference for package2
            AccDiff2Store(I,Temp) := FirstDiff_Comp2(I);
         
        
            if (DiffAbsolute > 10.0) then                               
                                          
              Chosen(I) := 16#0040#;                                 -- Set flag to indicate diff exceeded bound
        
              if (Abs(AccDiff1(I)) > Abs(AccDiff2(I))) then          
        
                 ChosenPackage(I) := 16#0002#;                                  -- Package2 selected
        
                 SecondDiff_Isolation(I) := 16#0040#;                             
        
                 SecDiff_Error1(I) := SecDiff_Error1(I) + 1;            -- Increment error counter for package1
                 SecDiff_Error2(I) := 0;                                  -- Reset error counter for package2
        
                 if (SecDiff_Error1(I) >= 120) then              -- Error count exceeds limit
                    Diff_PermFail(I) := 16#0001#;                         -- Set permanent failure
                 end if;
        
              else
        
                 ChosenPackage(I) := 16#0001#;                                  -- Package1 selected         
                                                                                                             
                 SecondDiff_Isolation(I) := 16#0080#;                                                        
                                                                                                             
                 SecDiff_Error1(I) := 0;                                -- Reset error counter for package1
                 SecDiff_Error2(I) := SecDiff_Error2(I) + 1;              -- Increment error counter for package2  
                                                                                                             
                 if (SecDiff_Error2(I) >= 120) then              -- Error count exceeds limit       
                    Diff_PermFail(I) := 16#0002#;                         -- Set permanent failure           
                 end if;
        
              end if;
        
           else                                                               -- No error
        
              SecDiff_Error1(I) := 0;                                     -- Reset error counter for package1 and 2
              SecDiff_Error2(I) := 0;                               
              Chosen(I) := 16#0000#;                                
        
           end if;
         end if;
         
      end loop;

   end SecondDiff;   
 
      
    
 procedure FirstDiff is
 
    begin
 
       for I in Unsigned_16 range 1..3 loop            -- 3 axes
 
          FirstDiff_Isolation(I) := 0;
          FirstDiff_Bound(I) := 16#0000#;          -- No errors         
 
          if (OverallHealth(I) = 1) then
 
             FirstDiff_Comp(I) := Comp_Rate1(I) - Comp_Rate2(I);        -- Diff b/w 2 packages 
 
             FirstDiff_Comp1(I) := Comp_Rate1(I) - RefRate(I);         -- Diff with ref
             FirstDiff_Comp2(I) := Comp_Rate2(I) - RefRate(I);         
 
             if (Abs(FirstDiff_Comp(I)) > 3.0) then      -- If diff > limit
 
                KeepLastData(I) := 1;                       -- Keep last data
                FirstDiff_Bound(I) := 16#0100#;         -- Set flag to indicate diff exceeded bound
                Chosen(I) := 16#0080#;                  -- Indicate error for output selection
 
                FirstDiff_Error(I) := FirstDiff_Error(I) + 1;        -- Increment error counter
 
                if (FirstDiff_Error(I) >= 4) then        -- If error count > 4 
 
                   Chosen(I) := 16#00C0#;               -- Compare with ref - Selection
                   KeepLastData(I) := 0;                    -- Keep last data
 
                   if (Abs(FirstDiff_Comp1(I)) > Abs(FirstDiff_Comp2(I))) then   -- Comparison with ref
 
                      ChosenPackage(I) := 16#0002#;                           -- Package2
                      FirstDiff_Isolation(I) := 16#0001#;
 
                      ErrorCounter_Diff1(I) := ErrorCounter_Diff1(I) + 1;       -- Increment error counter for Package1
                      ErrorCounter_Diff2(I) := 0;                             -- Reset error counter for Package2    
 
                      if (ErrorCounter_Diff1(I) >= 20) then                    -- Set permanent failure if count exceeds limit 
                         Diff_PermFail(I) := 16#0001#;
                      end if;
 
                   else
 
                      ChosenPackage(I) := 16#0001#;                          -- Package1
                      FirstDiff_Isolation(I) := 16#0010#;
 
                      ErrorCounter_Diff2(I) := ErrorCounter_Diff2(I) + 1;       -- Increment error counter for Package2
                      ErrorCounter_Diff1(I) := 0;                             -- Reset error counter for Package1 
 
                      if(ErrorCounter_Diff2(I) >= 20)then
                         Diff_PermFail(I) := 16#0002#;                       -- Set permanent failure if count exceeds limit
                      end if;
 
                   end if;
 
                end if;
 
             else    -- No errors
 
                ErrorCounter_Diff1(I) := 0;      -- Reset all error counters   
                ErrorCounter_Diff2(I) := 0;      
 
                FirstDiff_Error(I) := 0; 
 
             end if;
          end if;
       end loop;
 
       SecondDiff;                                                    -- Call second difference check
 
    end FirstDiff;   

    
        
 procedure SelectData is

      CommHealthFailure, Status : unsigned_16;

   begin

      CommHealthFailure := 16#0000#;

      if (MessageFail(1) = 1) or else (CurrentHealthFail(1) = 1) then   -- Health or Communication error
         CommHealthFailure := 16#0001#;
      end if;

      if (MessageFail(2) = 1) or else (CurrentHealthFail(2) = 1) then   
         CommHealthFailure := Bit_OR(CommHealthFailure,16#0002#);
      end if;

      for I in Unsigned_16 range 1..3 loop            -- 3 axes
    
         OverallHealth(I) := 0;
    
         if (ErrorBoth(I) = 0) then         -- When both packages in error
                               
            KeepLastData(I) := 0;
    
            Status := Bit_OR(Diff_PermFail(I), CommHealthFailure); -- Communication/ Health failure and large difference
			
            if (Status < 3) then              
               CounterErrorBoth(I) := 0;           -- Reset error counters if both packages not in error
               CounterFailure(I) := 0;            
            end if;
    
            if (Bit_And(Status, ChosenPackage(I)) /= 16#0#) then   -- Failure in chosen package
    
               case Status is
    
                  when 16#0001# =>      -- Failure in first
    
                     if ((Diff_PermFail(I) = 16#0001#) or else (ConsolidatedFailure(1) = 1)) then
                        Chosen(I) := 16#0180#;         
                        ChosenPackage(I) := 16#0002#;       -- Take data from second
						
                     else
                        Chosen(I) := 16#0140#;   
                        KeepLastData(I) := 1;         -- Keep last data 
                     end if;
    
                  when 16#0002# =>      -- Failure in second
    
                     if ((Diff_PermFail(I) = 16#0002#) or else (ConsolidatedFailure(2) = 1)) then
                        Chosen(I) := 16#0180#; 
                        ChosenPackage(I) := 16#0001#;                  -- Take data from first
						
                     else
                        Chosen(I) := 16#0140#;
                        KeepLastData(I) := 1;        -- Keep last data 
                     end if;
    
                  when others => -- Failure in both
    
                     KeepLastData(I) := 1;           
                     Chosen(I) := 16#01C0#;         
    
                     CounterErrorBoth(I) := CounterErrorBoth(I) + 1; 
					 
                     if (CounterErrorBoth(I) >= 100 ) then
                        ErrorBoth(I) := 1;         -- Error in both indication for 100 cycles
                     end if;
    
                     if ((MessageFail(1) = 1) or else (MessageFail(2) = 1)) then   
                        CounterFailure(I) := CounterFailure(I) + 1;     -- If message error, increment counter for total failure
                     end if;
					 
                     if (CounterFailure(I) >=  100) then 
                        LS_Rates_Fail := 1;         -- Failure
                     end if;
    
               end case;
    
            elsif (Status = 16#0000#) then    -- No errors 
               OverallHealth(I) := 1;  
			   
            else                                                                        
               Chosen(I) := 16#0100#;    
			   
            end if;
         end if;
      end loop;

      FirstDiff;

   end SelectData;   
 
   
     
procedure LS_Rates_Main is

   begin

      Preprocess;               -- Preprocessing of data from sensors
      HealthCheck;              -- Check health and communication errors

      for I in Unsigned_16 range 1..3 loop            -- 3 axes
      
         if (ErrorBoth(I) = 1) then         -- If both packages failed for 10 cycles

            Chosen(I) := 16#01C0#;       

            if ((MessageFail(1) = 1) and then (MessageFail(2) = 1)) then   -- Communication failure in both packages
               KeepLastData(I) := 1;         -- Keep last data
            else
               KeepLastData(I) := 0;

               -- If chosen package has communication failure, change selection
               if ((ChosenPackage(I) = 16#0001#) and then (MessageFail(1) = 1)) then
                  ChosenPackage(I) := 16#0002#;

               elsif ((ChosenPackage(I) = 16#0002#) and then (MessageFail(2) = 1)) then
                  ChosenPackage(I) := 16#0001#;
               end if;
               
            end if;
         end if;
      end loop;

      SelectData;

      for I in Unsigned_16 range 1..3 loop

         if (KeepLastData(I) = 0) then
         
            if (ChosenPackage(I) = 16#0001#) then      -- Take data from package1
               OutputRate(I) := Comp_Rate1(I) * 1.745329e-02;  --Convert to radians

            else -- Take data from package2            
               OutputRate(I) := Comp_Rate2(I) * 1.745329e-02;  --Convert to radians

            end if;
            
         end if;

      end loop;                           

   end LS_Rates_Main;
   
   
procedure Initialise_LS is

  begin

      LS_Rates_Fail := 0;

      for I in Unsigned_16 range 1..3 loop

         OutputRate(I) := 0.0;  

         ErrorBoth(I) := 0;

         AccDiff(I) := 0.0;  
         AccDiff1(I) := 0.0; 
         AccDiff2(I) := 0.0; 

         SecDiffCount(I) := 0;
         SecDiffCount2(I) :=0;
         MaxSecDiff(I) := 0.0; 

         ErrorCounter_Diff1(I) := 0; 
         ErrorCounter_Diff2(I) := 0;     
         SecDiff_Error1(I) := 0; 
         SecDiff_Error2(I) := 0; 
         FirstDiff_Error(I) := 0; 

         CounterErrorBoth(I) := 0;
         CounterFailure(I) := 0; 

         ChosenPackage(I) := 16#0001#;                                              
         
      end loop;

      for I in Unsigned_16 range 1..2 loop

         ErrorCount_Comm(I) := 0;
         ErrorCount_Health(I) := 0; 

         CurrentHealthFail(I) := 0;
         ConsolidatedFailure(I) := 0;

      end loop;

  end Initialise_LS; 
  
end LS_Rates;
