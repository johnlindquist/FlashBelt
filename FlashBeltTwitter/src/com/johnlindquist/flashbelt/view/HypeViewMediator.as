package com.johnlindquist.flashbelt.view 
{
	import com.johnlindquist.flashbelt.model.TwitterModel;

	import org.robotlegs.mvcs.Mediator;

	import mx.events.CollectionEvent;
	import mx.events.CollectionEventKind;

	import flash.display.Bitmap;

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
			}
		}
	}
}
