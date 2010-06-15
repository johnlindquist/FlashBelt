package com.johnlindquist.flashbelt.model 
{
	import flight.list.Collection;

	/**
	 * @author John Lindquist
	 */
	[Bindable]
	public class TwitterModel {
		public var images:Collection = new Collection();
		public var statuses:Collection = new Collection();
		public var mentions:Collection = new Collection();
		public var imageURLs:Collection = new Collection();
	}
}
