package com.johnlindquist.flashbelt.model {
	import com.destroytoday.twitteraspirin.vo.StatusVO;

	/**
	 * @author John Lindquist
	 */
	[Bindable]
	public class TwitterModel {
		public var searchResults:Vector.<StatusVO>;
	}
}
