with AUnit.Assertions; use AUnit.Assertions;

package body String_Tools.Test_Starts_With is

   function Name (T : Test) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("String tools test");
   end Name;

   procedure Run_Test (T : in out Test) is
      TStr_1 : constant String := "--test--";
      TStr_2 : constant String := "--test";
      TStr_3 : constant String := "test--";
   begin
      Assert (Starts_With (TStr_1, "--") = True, "String matches Starts_With");
      Assert (Ends_With (TStr_1, "--") = True, "string matches Ends_With");
      Assert (Ends_With (TStr_2, "--") = False, "string doesn't match Ends_With");
      Assert (Starts_With (TStr_3, "--") = False, "string doesn't match Starts_With");
   end Run_Test;

end String_Tools.Test_Starts_With;
