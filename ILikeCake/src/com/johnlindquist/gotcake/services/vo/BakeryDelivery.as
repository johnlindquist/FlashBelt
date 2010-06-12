package com.johnlindquist.gotcake.services.vo {

	/**
	 * @author John Lindquist
	 */
	public class BakeryDelivery {
		public static const CAKE : String = "CAKE";
		public var type : String;

		public function BakeryDelivery(type:String) {
			this.type = type;
		}
	}
}
