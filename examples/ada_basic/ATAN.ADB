--This program computes inverse tan values of 37 short_float numbers starting from
--0.025 with an incremnet of 0.25 by calling the math function Arctan. Then it
--prints those values. The program demonstrates Arithmetic Accuracy


procedure ATAN is


   A,B,INC : FLOAT32;
   
begin
   PUT("* DEMONSTRATION OF ARITHMETIC ACCURACY *");
   NEW_LINE;
   NEW_LINE;
   put("* CALCULATION OF ARCTAN VALUES *");
   NEW_LINE;
   NEW_LINE;
   A := 0.025;
   INC := 0.25;
   for I in SHORT_INTEGER RANGE 0 .. 37
      loop
      Put(" ");
      B := ATAN_SF(A);
      put(A);
      PUT(" ");
      PUT(B);
      NEW_LINE;
      A := A + INC;
   end loop;
end ATAN;
