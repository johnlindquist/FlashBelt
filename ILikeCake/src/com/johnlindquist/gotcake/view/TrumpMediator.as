package com.johnlindquist.gotcake.view 
{
	import com.johnlindquist.gotcake.services.vo.Cake;
	import com.johnlindquist.gotcake.model.vo.Order;
	import com.johnlindquist.gotcake.signals.CakeOrdered;

	import flash.events.MouseEvent;

	import org.robotlegs.mvcs.Mediator;

	public class TrumpMediator extends Mediator 
	{
		[Inject]
		public var trump:TrumpView;

		[Inject]
		public var cakeOrdered:CakeOrdered;

		override public function onRegister():void 
		{
			trump.cakeButton.addEventListener(MouseEvent.CLICK, onCakeButtonClick);
		}

		private function onCakeButtonClick(event:MouseEvent):void 
		{
			var order:Order = new Order();
			order.type = Cake.CAKE;
			cakeOrdered.dispatch(order);			
		}
	}
}
