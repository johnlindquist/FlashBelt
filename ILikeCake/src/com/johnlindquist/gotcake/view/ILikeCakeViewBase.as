package com.johnlindquist.gotcake.view {
	import flash.display.MovieClip;

	/**
	 * @author John Lindquist
	 */
	public class ILikeCakeViewBase extends MovieClip {
		public function doSomething() : void {
		}
		
		public function showMessage(message:String):void
		{
			trace(message);
		}
	}
}
