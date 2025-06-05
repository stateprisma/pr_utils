with AUnit.Assertions; use AUnit.Assertions;

package body String_Tools.Test is

   procedure Test_Substr is
      TStr_1 : constant String := "--test--";
      TStr_2 : constant String := "--test";
      TStr_3 : constant String := "test--";
   begin
      Assert (Substr (TStr_2, 2, Left) = "--", "Substring from the left");
      Assert (Substr (TStr_2, 2, Right) = "st", "Substring from the right");
   end Test_Substr;

   procedure Test_Contains is
   begin
      Assert (Contains ("Hello World", "World"), "String does contain");
      Assert (not Contains ("Hello", "World"), "String does not contain");
      Assert (not Contains ("Hel", "World"), "String smaller than pattern");
      Assert (Contains ("World", "World"), "String = Pattern");
   end Test_Contains;

   procedure Test_Starts_Ends_With is
      TStr_1 : constant String := "--test--";
      TStr_2 : constant String := "--test";
      TStr_3 : constant String := "test--";
   begin
      Assert (Starts_With (TStr_1, "--") = True, "String matches Starts_With");
      Assert (Ends_With (TStr_1, "--") = True, "string matches Ends_With");
      Assert
        (Ends_With (TStr_2, "--") = False, "string doesn't match Ends_With");
      Assert
        (Starts_With (TStr_3, "--") = False,
         "string doesn't match Starts_With");
   end Test_Starts_Ends_With; 

   overriding
   function Name (T : Test) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("String tools test");
   end Name;

   overriding
   procedure Run_Test (T : in out Test) is
   begin
      Test_Starts_Ends_With;
      Test_Substr;
      Test_Contains;
   end Run_Test;

end String_Tools.Test;
