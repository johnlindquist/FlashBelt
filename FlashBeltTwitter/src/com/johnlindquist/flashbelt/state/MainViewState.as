package com.johnlindquist.flashbelt.state 
{
	import com.johnlindquist.flashbelt.view.ErrorView;

	import flash.display.DisplayObject;
	import com.johnlindquist.flashbelt.view.SearchView;
	import com.johnlindquist.flashbelt.view.Box2DFlashView;
	import com.johnlindquist.flashbelt.view.HypeView;
	import com.johnlindquist.flashbelt.view.LoginView;
	import com.johnlindquist.flashbelt.view.MinimalCompsView;

	/**
	 * @author John Lindquist
	 */
	[Bindable]
	public class MainViewState 
	{
		public var currentState:Class = LOGIN_VIEW;

		public static const BOX2D_FLASH_VIEW:Class = Box2DFlashView;
		public static const HYPE_VIEW:Class = HypeView;
		public static const MINIMAL_COMPS_VIEW:Class = MinimalCompsView;
		public static const LOGIN_VIEW:Class = LoginView;
		public static const SEARCH_VIEW:Class = SearchView;
		public static const ERROR_VIEW:Class = ErrorView;
	}
}
