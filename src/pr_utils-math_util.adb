with Pr_Utils.Math_Util; use Pr_Utils.Math_Util;

package body Pr_Utils.Math_Util is

   function Arrange (DS, DE, DT : Float) return Arrangement is
      T        : Float := DS;
      Interval : Arrangement (0 .. Natural (DE / DT) - 1) := (others => <>);
   begin
      for K in Interval'Range loop
         Interval (K) := T;
         T := T + DT;
      end loop;

      return Interval;
   end Arrange;

   function Aproximatelly_Equal
     (A, B          : Precision;
      Rel_Tolerance : Precision := 1.0E-6;
      Abs_Tolerance : Precision := 1.0E-6) return Boolean is
   begin
      return
        abs (A - B)
        <= Precision'Max
             (Abs_Tolerance, Rel_Tolerance * Precision'Max (abs A, abs B));
   end Aproximatelly_Equal;

   function Derivative
     (Point : Precision; Resolution : Natural := 6; Max_Approx : Natural := 2)
      return Precision
   is
      function Average (DS, DE : Precision) return Precision is
      begin
         return (Get_Point (DE) - Get_Point (DS)) / (DE - DS);
      end Average;
      Tolerance   : constant Precision := 10.0**(-Resolution);
      H           : Precision := 1.0;
      Approx      : Precision := Average (Point - H, Point + H);
      Next_Approx : Precision;
   begin
      for I in 0 .. Max_Approx * Resolution loop
         H := H / 10.0;
         Next_Approx := Average (Point - H, Point + H);
         if abs (Next_Approx - Approx) < Tolerance then
            return Next_Approx;
         else
            Approx := Next_Approx;
         end if;
      end loop;
      raise Constraint_Error with "Derivative is not convergent";
   end Derivative;

end Pr_Utils.Math_Util;
