package Pr_Utils.Math_Util is
   type Arrangement is array (Natural range <>) of Float;

   function Arrange (DS, DE, DT : Float) return Arrangement;

   generic
      type Precision is digits <>;
   function Aproximatelly_Equal
     (A, B          : Precision;
      Rel_Tolerance : Precision := 1.0E-6;
      Abs_Tolerance : Precision := 1.0E-6) return Boolean;

   generic
      type Precision is digits <>;
      with function Get_Point (T : Precision) return Precision;
   function Derivative
     (Point : Precision; Resolution : Natural := 6; Max_Approx : Natural := 2)
      return Precision;

end Pr_Utils.Math_Util;
