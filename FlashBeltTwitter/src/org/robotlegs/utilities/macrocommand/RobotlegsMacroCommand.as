package org.robotlegs.utilities.macrocommand
{
	import flight.commands.ICommand;
	import flight.domain.MacroCommand;

	import org.robotlegs.core.IInjector;

	public class RobotlegsMacroCommand extends MacroCommand
	{
		[Inject]
		public var injector:IInjector;

		[PostConstruct]
		public function construct():void
		{
			for each (var command:ICommand in commands.source) 
			{
				injector.injectInto(command);	
			}
		}
	}
}