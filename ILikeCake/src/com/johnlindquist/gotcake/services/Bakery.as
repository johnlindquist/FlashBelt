package com.johnlindquist.gotcake.services 
{
	import com.johnlindquist.gotcake.model.vo.Order;
	import flash.net.URLRequest;
	import flight.net.IResponse;
	import flight.net.Response;

	import flash.events.Event;
	import flash.net.URLLoader;

	public class Bakery 
	{
		private var placeOrderResponse:Response;
		private var loader:URLLoader;

		public function placeOrder(type:Order):IResponse 
		{
			placeOrderResponse = new Response();
			
			var request:URLRequest = new URLRequest(type);
			loader = new URLLoader(request);
			loader.addEventListener(Event.COMPLETE, onLoaderComplete);
			
			return placeOrderResponse;
		}

		private function onLoaderComplete(event:Event):void 
		{
			placeOrderResponse.complete(event.target);			
		}
	}
}
