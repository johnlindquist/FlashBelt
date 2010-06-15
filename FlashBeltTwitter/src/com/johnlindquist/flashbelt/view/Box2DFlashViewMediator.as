package com.johnlindquist.flashbelt.view 
{
	import com.johnlindquist.flashbelt.model.TwitterModel;

	import org.robotlegs.mvcs.Mediator;

	import mx.events.CollectionEvent;
	import mx.events.CollectionEventKind;

	import flash.display.Bitmap;
	import flash.display.DisplayObject;

	/**
	 * @author John
	 */
	public class Box2DFlashViewMediator extends Mediator 
	{
		[Inject]
		public var box2DFlashView:Box2DFlashView;
		
		[Inject]
		public var twitterModel:TwitterModel;
		
		override public function onRegister():void 
		{
			twitterModel.images.addEventListener(CollectionEvent.COLLECTION_CHANGE, onImagesChange);	
			
			for each (var image : Bitmap in twitterModel.images.source) 
			{
				box2DFlashView.addToWorld(new Bitmap(image.bitmapData));
			}		
		}

		private function onImagesChange(event:CollectionEvent):void 
		{
			trace("something", event.kind);
			switch(event.kind)
			{
				case CollectionEventKind.ADD:
					var image:Bitmap = twitterModel.images[event.location];
					box2DFlashView.addToWorld(new Bitmap(image.bitmapData));													
					break;
			}
		}
	}
}
