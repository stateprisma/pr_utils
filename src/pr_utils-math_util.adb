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

end Pr_Utils.Math_Util;
