package com.johnlindquist.flashbelt.signals 
{
	import org.osflash.signals.Signal;

	/**
	 * @author John
	 */
	public class SearchTwitterSignal extends Signal 
	{
		public function SearchTwitterSignal() 
		{
			super(String);
		}
	}
}
