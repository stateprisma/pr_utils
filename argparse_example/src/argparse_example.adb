with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Pr_Utils.Argparse;     use Pr_Utils.Argparse;
with Ada.Text_IO;           use Ada.Text_IO;

procedure Argparse_Example is
   Arg_Ctx : Argument_Context;

begin
   Arg_Ctx.Init_Context;
   Arg_Ctx.Add_Arg_Def
     ((Arg_Name        => To_Unbounded_String ("test"),
       Arg_ShortName   => 't',
       Arg_Description => To_Unbounded_String ("test"),
       Arg_Type        => Bool));
   Arg_Ctx.Add_Arg_Def
      ((Arg_Name        => To_Unbounded_String ("named-string"),
        Arg_ShortName   => 'n',
        Arg_Description => To_Unbounded_String ("named param"),
        Arg_Type        => Str));

   Arg_Ctx.Parse_Args;

   if not Arg_Ctx.Contains_Arg_Value("test") then
      Put_Line ("Missing rquired arg");
      return;
   end if;
   Put_Line ("test is " & Arg_Ctx.Get_Arg_Value ("test").Val_Bool'Image);
   Put_Line ("named string is " & To_String (Arg_Ctx.Get_Arg_Value ("named-string").Val_Str));
end Argparse_Example;
