package com.johnlindquist.gotcake.model 
{
	import flight.list.Collection;

	[Bindable]
	public class Fridge 
	{
		public var cakes:Collection = new Collection();
		public var fruits:Collection = new Collection();
		public var veggies:Collection = new Collection();
		public var meats:Collection = new Collection();
	}
}
