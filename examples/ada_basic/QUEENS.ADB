-- Program to demonstrate 8 Queens problem. The program demonstrates the use of
-- recursive procedure, arrays, loop stmts and exit when stmt 

procedure QUEENS is


   type ARR1 is array(short_integer range 0 .. 7) of short_integer;
   type ARR2 is array(short_integer range 0 .. 7) of BOOLEAN;
   type ARR3 is array(short_integer range -7 .. 7) of BOOLEAN;
   type ARR4 is array(short_integer range 0 .. 14) of BOOLEAN;
   X : ARR1;     --for rowwise movement
   COL : ARR2;   --for columnwise movement
   UP : ARR3;    --for diagonal movement
   DOWN : ARR4;  --for diagonal movement
   N,K : short_integer := 0;
   COUNT : short_integer := 0;

   procedure GENERATE is --Recursive procedure(placing of 8 Queens)
      H : short_integer;
   begin
      H := 0;
      loop
         if COL(H) and UP(N - H) and DOWN(N + H) then
            X(N) := H;
            COL(H) := FALSE;
            UP(N - H) := FALSE;
            DOWN(N + H) := FALSE;
            N := N + 1;
            if (N = 8) then
               COUNT := COUNT + 1;
               -- if COUNT = 92 then
                   PUT(COUNT);
                   PUT(" -");
                  K := 0;
                  loop
                     PUT(X(K));
                     K := K + 1;
                     exit when K = 8;
                  end loop;
                  NEW_LINE;
               -- end if;
            else
               GENERATE;
            end if;
            N := N - 1;
            DOWN(N + H) := TRUE;
            UP(N - H) := TRUE;
            COL(H) := TRUE;
         end if;
         H := H + 1;
         exit when H = 8;
      end loop;
   end GENERATE;

begin -- Main Program starts here
   N := 0;
   K := 0;
   loop
      COL(K) := TRUE;
      K := K + 1;
      exit when K = 8;
   end loop;
   K := 0;
   loop
      UP(K - 7) := TRUE;
      DOWN(K) := TRUE;
      K := K + 1;
      exit when K = 15;
   end loop;
   GENERATE;
end QUEENS;
