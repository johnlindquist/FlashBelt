package com.johnlindquist.flashbelt.controller 
{
	import org.robotlegs.utilities.macrocommand.RobotlegsMacroCommand;

	/**
	 * @author John
	 */
	public class SearchTwitterAndLoadImagesCommand extends RobotlegsMacroCommand
	{
		[Inject]
		public var query:String;

		override protected function onRegister():void 
		{
			var searchTwitterCommand:SearchTwitterCommand = new SearchTwitterCommand(query);
			var loadImagesCommand:LoadImagesCommand = new LoadImagesCommand();
			
			commands = [searchTwitterCommand, loadImagesCommand];		
		}
	}
}
