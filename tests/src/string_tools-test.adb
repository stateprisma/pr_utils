with AUnit.Assertions; use AUnit.Assertions;
with String_Tools;

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

   procedure Test_index_Of_Throwing is
      Bogus : Natural;
   begin
      Bogus := Index_Of ("Hello@World", "#World");
   end Test_index_Of_Throwing;

   procedure Test_Index_Of is
   begin
      Assert (Index_Of ("Hello@World", "@World") = 6, "Index of");
      Assert_Exception (Test_index_Of_Throwing'Access, "Not found throws exception");
   end Test_Index_Of;

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
      Test_Index_Of;
   end Run_Test;

end String_Tools.Test;
