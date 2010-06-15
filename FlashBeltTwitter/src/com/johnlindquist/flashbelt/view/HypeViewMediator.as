package com.johnlindquist.flashbelt.view 
{
	import flash.display.Bitmap;
	import flash.display.DisplayObject;

	import mx.events.CollectionEventKind;
	import mx.events.CollectionEvent;

	import com.johnlindquist.flashbelt.model.TwitterModel;

	import org.robotlegs.mvcs.Mediator;

	/**
	 * @author John
	 */
	public class HypeViewMediator extends Mediator 
	{

		[Inject]
		public var hypeView:HypeView;

		[Inject]
		public var twitterModel:TwitterModel;

		override public function onRegister():void 
		{
			twitterModel.images.addEventListener(CollectionEvent.COLLECTION_CHANGE, onImagesChange);	
			
			for each (var image : Bitmap in twitterModel.images.source) 
			{
				hypeView.addToCanvas(new Bitmap(image.bitmapData));
			}
		}

		
		override public function onRemove():void 
		{
			hypeView.destroy();
			super.onRemove();
		}

		private function onImagesChange(event:CollectionEvent):void 
		{
			trace("onImagesChange");				
			switch(event.kind)
			{
				case CollectionEventKind.UPDATE:
					
					for each (var image : Bitmap in twitterModel.images.source) 
					{
						hypeView.addToCanvas(new Bitmap(image.bitmapData));
					}
					break;
				default:
			}
		}
	}
}
