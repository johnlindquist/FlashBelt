package com.johnlindquist.gotcake.services {
	import flight.net.IResponse;
	import flight.net.Response;

	import com.johnlindquist.gotcake.services.vo.BakeryDelivery;

	import flash.events.TimerEvent;
	import flash.utils.Timer;

	/**
	 * @author John Lindquist
	 */
	public class Bakery {
		private var placeOrderResponse : Response;

		public function placeOrder(type : String) : IResponse {
			trace("placeOrder")
			placeOrderResponse = new Response();
			
			var timer : Timer = new Timer(1000, 1);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, onWaitOneSecond);
			timer.start();
			
			return placeOrderResponse;
		}

		private function onWaitOneSecond(event:TimerEvent) : void {
			var delivery : BakeryDelivery = new BakeryDelivery(BakeryDelivery.CAKE);
			trace("onWaitOneSecond");
			placeOrderResponse.complete(delivery)
		}
	}
}
