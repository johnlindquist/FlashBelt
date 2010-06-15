package org.robotlegs.mvcs
{
	import org.robotlegs.core.IInjector;

	import flash.display.DisplayObjectContainer;

	import org.robotlegs.base.SignalCommandMap;
	import org.robotlegs.core.ISignalCommandMap;
	import org.robotlegs.core.ISignalContext;

	public class SignalContext extends Context implements ISignalContext
	{
		protected var _signalCommandMap:ISignalCommandMap;

		public function SignalContext(contextView:DisplayObjectContainer = null, autoStartup:Boolean = true)
		{
			super(contextView, autoStartup);
		}

		public function get signalCommandMap():ISignalCommandMap
		{
			if(_signalCommandMap == null)
			{
				var signalCommandMapInjector:IInjector = injector.createChild();
				injector.mapValue(IInjector, signalCommandMapInjector, "signalCommandMapInjector");
				_signalCommandMap = new SignalCommandMap(signalCommandMapInjector);
			}
						
			return _signalCommandMap;
		}

		public function set signalCommandMap(value:ISignalCommandMap):void
		{
			_signalCommandMap = value;
		}

		override protected function mapInjections():void
		{
			super.mapInjections();
			injector.mapValue(ISignalCommandMap, signalCommandMap);
		}
	}
}