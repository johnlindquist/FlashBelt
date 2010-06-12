package com.johnlindquist.gotcake.view {
	import com.johnlindquist.gotcake.model.TrumpFridge;

	import org.robotlegs.mvcs.Mediator;

	import mx.events.CollectionEvent;
	import mx.events.CollectionEventKind;

	/**
	 * @author John Lindquist
	 */
	public class TrumpFridgeMediator extends Mediator {

		[Inject]
		public var trumpFridgeView : TrumpFridgeView;

		[Inject]
		public var trumpFridge : TrumpFridge;

		override public function onRegister() : void {
			trumpFridge.bakedGoods.addEventListener(CollectionEvent.COLLECTION_CHANGE, onCakeAdded);
		}

		private function onCakeAdded(event:CollectionEvent) : void {
			
			switch(event.kind)
			{
				case CollectionEventKind.ADD:
					
					var cake:CakeView = new CakeView();
					cake.x = Math.random() * 100;
					cake.y = Math.random() * 100;
					cake.scaleX = cake.scaleY = .5;
					
					trumpFridgeView.addChild(cake);
					break;	
					
				case CollectionEventKind.REMOVE:
					trumpFridgeView.removeChildAt(trumpFridgeView.numChildren);
					break;
			}
			
			
		}
	}
}
