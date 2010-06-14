package com.johnlindquist.flashbelt.state {
	import com.johnlindquist.flashbelt.view.HypeView;
	import com.johnlindquist.flashbelt.view.Box2DFlashView;

	/**
	 * @author John Lindquist
	 */
	[Bindable]
	public class MainViewState 
	{
		public var currentState:Class = FlashBeltTwitterView;

		public static const FLASH_BELT_TWITTER_VIEW:Class = FlashBeltTwitterView;
		public static const BOX2D_FLASH_VIEW:Class = Box2DFlashView;
		public static const HYPE:Class = HypeView;
		
	}
}
