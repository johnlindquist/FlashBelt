package com.johnlindquist.flashbelt.view 
{
	import flight.binding.Bind;

	import com.johnlindquist.flashbelt.model.TwitterModel;
	import com.johnlindquist.flashbelt.state.FlashBeltTwitterViewState;

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
		public var flashBeltTwitterViewState:FlashBeltTwitterViewState;

		[Inject]
		public var twitterModel:TwitterModel;
		private var clipContainer:Sprite;

		
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
		//		private function onSearchResults(event : PropertyChangeEvent) : void {
		//			
		//			if(event.newValue) {
		//				
		//				for each (var statusVO : StatusVO in twitterModel.searchResults) {
		//					var loader : Loader = new Loader();
		//					var request : URLRequest = new URLRequest(statusVO.user.profileImageURL);
		//					trace('statusVO.user.profileImageURL: ' + (statusVO.user.profileImageURL));
		//					loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadComplete);
		//					loader.load(request)
		//				}
		//				
		//				var bmc : BitmapCanvas = new BitmapCanvas(800, 600);
		//				flashBeltTwitterView.addChild(bmc);
		//				clipContainer = new Sprite();
		//				bmc.startCapture(clipContainer, true);
		//				
		//				var filter:ColorMatrixFilter = new ColorMatrixFilter();
		//				var matrix:Array = new Array();
		//				matrix = matrix.concat([1, 0, 0, 0, 0]); // red
		//				matrix = matrix.concat([0, 0, 0, 0, 0]); // green
		//				matrix = matrix.concat([0, 0, 0, 0, 0]); // blue
		//				matrix = matrix.concat([0, 0, 0, .99, 0]); // alpha
		//				filter.matrix = matrix;
		//				var blurRhythm : FilterRhythm = new FilterRhythm([filter], bmc.bitmap.bitmapData);
		//				blurRhythm.start();
		//			}
		//		}
		//
		//		private function onLoadComplete(event : Event) : void {
		//			var content : DisplayObject = LoaderInfo(event.target).loader.content;
		//			content.x = Math.random() * 500;
		//			content.y = Math.random() * 500;
		//			var swarm : Swarm = new Swarm(content, new Point(800 / 2, 600 / 2), 10, .03, 10);
		//			swarm.start();
		//			//			var xVib : VariableVibration = new VariableVibration(content, "x", 0.99, 0.05, 20);
		//			//			var yVib : VariableVibration = new VariableVibration(content, "y", 0.99, 0.05, 20);
		//			var zVib : VariableVibration = new VariableVibration(content, "z", 0.99, 0.02, 10);
		//			
		//			
		//			//			xVib.start();
		//			//			yVib.start();
		//			zVib.start();
		//			clipContainer.addChild(content);
			}
		}
	}
}
