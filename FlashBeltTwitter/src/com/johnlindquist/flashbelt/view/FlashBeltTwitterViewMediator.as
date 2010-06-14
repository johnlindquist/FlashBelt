package com.johnlindquist.flashbelt.view 
{
	import flight.binding.Bind;

	import com.johnlindquist.flashbelt.model.TwitterModel;
	import com.johnlindquist.flashbelt.state.MainViewState;

	import org.robotlegs.mvcs.Mediator;

	import mx.events.PropertyChangeEvent;

	import flash.display.Sprite;

	/**
	 * @author John Lindquist
	 */
	public class FlashBeltTwitterViewMediator extends Mediator 
	{

		[Inject]
		public var flashBeltTwitterView:FlashBeltTwitterView;

		[Inject]
		public var flashBeltTwitterViewState:MainViewState;

		[Inject]
		public var twitterModel:TwitterModel;
		

		
		override public function onRegister():void 
		{
			Bind.addListener(onFlashBeltTwitterViewStateChange, flashBeltTwitterViewState, "currentState");				
			Bind.addListener(onSearchResults, twitterModel, "searchResults");				
		}

		private function onFlashBeltTwitterViewStateChange(event:PropertyChangeEvent):void 
		{
			trace("old state:", event.oldValue, "new state:", event.newValue);
			flashBeltTwitterView.gotoAndPlay("search");
		}

		private function onSearchResults(event:*):void 
		{
			if(event.newValue) 
			{

			}
		}
	}
}
