package String_Tools is

   function Starts_With (Source, Pattern : String) return Boolean;
   function Ends_With (Source, Pattern : String) return Boolean;

   type Substr_Dir is (Left, Right);

   function Substr
     (Source : String; Num : Natural; Dir : Substr_Dir) return String;

   function Contains (Source, Pattern : String) return Boolean;

end String_Tools;
