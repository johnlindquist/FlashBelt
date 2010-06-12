package com.johnlindquist.gotcake.model {

	/**
	 * @author John Lindquist
	 */
	
	[Bindable]
	public class FrameState {
		public static const TRUMP:String = "trump";
		public static const OBAMA:String = "obama";
		
		public var currentFrame:String = "home"; 
	}
}
