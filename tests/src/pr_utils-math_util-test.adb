with Ada.Text_IO;
with AUnit.Assertions; use AUnit.Assertions;

package body Pr_Utils.Math_Util.Test is

   procedure Arrange_Test is
      Interval_Half      : constant Arrangement := Arrange (0.0, 10.0, 0.5);
      Interval_One       : constant Arrangement := Arrange (0.0, 10.0, 1.0);
      Interval_One_Check : constant Arrangement :=
        (0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0);
   begin
      Assert (Interval_Half'Length = 20, "Correct length from DT");
      Assert
        (Interval_Half (Interval_Half'Last) = 9.5, "Correct last element");
      Assert
        (Interval_One = Interval_One_Check, "Produced interval is corrrect");
   end Arrange_Test;

   procedure Derivate_Test is
      type Long_Float is digits 10;
      function Test_Func (T : Long_Float) return Long_Float is
      begin
         return (T - 4.0)**3 / 64.0 + 3.3;
      end Test_Func;

      function Derive_Test_Func is new Derivative (Long_Float, Test_Func);
      function Long_FLoat_Aprx_Eq is new Aproximatelly_Equal (Long_Float);
   begin
      Assert
        (Long_FLoat_Aprx_Eq (Derive_Test_Func (1.0), 0.421875),
         "");
   end Derivate_Test;

   overriding
   function Name (T : Test) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Math util tests");
   end Name;

   overriding
   procedure Run_Test (T : in out Test) is
   begin
      Arrange_Test;
      Derivate_Test;
   end Run_Test;

end Pr_Utils.Math_Util.Test;
