package com.johnlindquist.gotcake.controller 
{
	import flight.domain.AsyncCommand;

	import com.johnlindquist.gotcake.model.Fridge;
	import com.johnlindquist.gotcake.model.vo.Order;
	import com.johnlindquist.gotcake.services.Bakery;
	import com.johnlindquist.gotcake.services.vo.Cake;

	public class OrderCake extends AsyncCommand 
	{
		[Inject]
		public var order:Order;

		[Inject]
		public var bakery:Bakery;

		[Inject]
		public var fridge:Fridge;

		override public function execute():void 
		{
			response = bakery.placeOrder(order);
			response.addResultHandler(onOrderResult);
		}

		private function onOrderResult(data:*):void 
		{
			if(data is Cake)
			{
				fridge.cakes.addItem(data as Cake);	
			}
		}
	}
}
