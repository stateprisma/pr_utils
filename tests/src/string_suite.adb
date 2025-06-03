with AUnit.Simple_Test_Cases;       use AUnit.Simple_Test_Cases;
with String_Tools.Test_Starts_With; use String_Tools.Test_Starts_With;

package body String_Suite is

   function Suite return Access_Test_Suite is
      Ret : constant Access_Test_Suite := new Test_Suite;
   begin
      Ret.Add_Test (Test_Case_Access'(new String_Tools.Test_Starts_With.Test));
      return Ret;
   end Suite;

end String_Suite;
