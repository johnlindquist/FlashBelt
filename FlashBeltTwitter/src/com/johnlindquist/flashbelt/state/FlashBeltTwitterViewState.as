package com.johnlindquist.flashbelt.state {

	/**
	 * @author John Lindquist
	 */
	[Bindable]
	public class FlashBeltTwitterViewState {
		
		public var currentState:String = FlashBeltTwitterViewState.SEARCH;

		public static const SEARCH: String = "search";
		public static const RESULTS: String = "results";
		
	}
}
