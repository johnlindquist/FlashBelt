package com.johnlindquist.gotcake.controller {
	import com.johnlindquist.gotcake.model.FrameState;
	import com.johnlindquist.gotcake.model.TrumpFridge;
	import com.johnlindquist.gotcake.services.vo.BakeryDelivery;
	import com.johnlindquist.gotcake.model.vo.Order;
	import com.johnlindquist.gotcake.services.Bakery;
	import flight.domain.AsyncCommand;

	/**
	 * @author John Lindquist
	 */
	public class OrderCake extends AsyncCommand {

		[Inject]
		public var order:Order;

		[Inject]
		public var bakery:Bakery;

		[Inject]
		public var fridge:TrumpFridge;

		[Inject]
		public var frameState:FrameState;

		override public function execute() : void {
			
			response = bakery.placeOrder(order.type);
			
			response.addResultHandler(onOrderResult);
			response.addFaultHandler(onOrderFault);
			
			switch(order.recipient)
			{
				case TrumpView:
					frameState.currentFrame = FrameState.TRUMP;
					break;
				case ObamaView:
					frameState.currentFrame = FrameState.OBAMA;
					break;
			}
			
			trace("frame state changed: ", frameState.currentFrame);
		}

		private function onOrderFault() : void {
			//handle fault			
		}

		private function onOrderResult(data:*) : void {
			trace("data", data);
			if(data is BakeryDelivery)
			{
				fridge.bakedGoods.addItem(data as BakeryDelivery);	
				trace("fridge.bakedGoods:", fridge.bakedGoods.length);	
			}
			else
			{
				//handle wrong type
			}
		}
	}
}
