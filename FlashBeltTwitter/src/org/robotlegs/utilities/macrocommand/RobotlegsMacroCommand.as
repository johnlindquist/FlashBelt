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
			onRegister();
			
			for each (var command:ICommand in commands.source) 
			{
				injector.injectInto(command);	
			}
		}

		protected function onRegister():void 
		{
		}
	}
}