package Pr_Utils.String_Tools is

   function Starts_With (Source, Pattern : String) return Boolean;
   function Ends_With (Source, Pattern : String) return Boolean;

   type Substr_Dir is (Left, Right);

   function Substr
     (Source : String; Num : Natural; Dir : Substr_Dir := Left) return String;

   function Contains (Source, Pattern : String) return Boolean;

   --  Find the first occurence of Pattern in Source
   --  if no occurence is found this function raises
   --  an exception of type String_Tools.Exceptions.Index_Of_Exception
   function Index_Of (Source, Pattern : String) return Natural;

   function Hex_To_Ada_Notation (Hex : String) return String;

end Pr_Utils.String_Tools;
