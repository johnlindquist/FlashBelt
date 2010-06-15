package  @namespace@.controller
{
	import org.robotlegs.utilities.macrocommand.RobotlegsMacroCommand;
	
	public class @className@ extends RobotlegsMacroCommand
	{
		@dependencies@

		override protected function onRegister():void 
		{
			@subcommands@
			
			commands = [@subcommandArray@];	
		}
	}
}