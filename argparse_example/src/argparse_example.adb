with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Pr_Utils.Argparse;     use Pr_Utils.Argparse;
with Ada.Text_IO;           use Ada.Text_IO;

procedure Argparse_Example is
   Arg_Ctx : Argument_Context;

begin
   Arg_Ctx.Init_Context;
   Arg_Ctx.Add_Arg_Def ("test", 't', Bool);
   Arg_Ctx.Add_Arg_Def ("named-string", 'n', Str);
   Arg_Ctx.Add_Multi_Flag_Arg ("fdef", 'f');

   Arg_Ctx.Parse_Args;

   if not Arg_Ctx.Contains_Arg_Value ("named-string") then
      Put_Line ("Missing rquired arg");
      return;
   end if;
   Put_Line ("test is " & Arg_Ctx.Get_Arg_Value ("test").Val_Bool'Image);
   Put_Line
     ("named string is "
      & To_String (Arg_Ctx.Get_Arg_Value ("named-string").Val_Str));
   Put_Line
     ("f-wall is " & Arg_Ctx.Get_Multi_Flag_Value ("fdef-wall").Val_Bool'Image);
--  Put_Line (Item : String)
end Argparse_Example;
