package com.johnlindquist.flashbelt.model {
	import flight.list.Collection;
	import com.destroytoday.twitteraspirin.vo.StatusVO;

	/**
	 * @author John Lindquist
	 */
	[Bindable]
	public class TwitterModel {
		public var searchResults:Vector.<StatusVO>;
		public var images:Collection = new Collection();
	}
}
