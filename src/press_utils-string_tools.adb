with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package body Press_Utils.String_Tools is

   --  Check if the Source String starts with the Pattern
   function Starts_With (Source, Pattern : String) return Boolean is
   begin
      return
        -- Short circuit on Source smaller than Pattern
        Pattern'Length
        <= Source'Length
           -- slice the Source to the lenght of the pattern from the start
           -- and compare the slice to the pattern
        and then Source (Source'First .. Source'First + Pattern'Length - 1)
                 = Pattern;
   end Starts_With;

   function Ends_With (Source, Pattern : String) return Boolean is
   begin
      return
        Pattern'Length <= Source'Length
        and then Source (Source'Last - Pattern'Length + 1 .. Source'Last)
                 = Pattern;
   end Ends_With;

   function Substr
     (Source : String; Num : Natural; Dir : Substr_Dir) return String
   is
      Ret_Str : Unbounded_String := To_Unbounded_String (Source'Length);
   begin
      if Num = 0 then
         return Source;
      elsif Num >= Source'Length then
         return "";
      else
         case Dir is
            when Left =>
               Ret_Str :=
                 To_Unbounded_String
                   (Source (Source'First .. Source'First + Num - 1));

            when Right =>
               Ret_Str :=
                 To_Unbounded_String
                   (Source (Source'Last - Num + 1 .. Source'Last));
         end case;
      end if;
      return To_String (Ret_Str);

   end Substr;

end Press_Utils.String_Tools;
