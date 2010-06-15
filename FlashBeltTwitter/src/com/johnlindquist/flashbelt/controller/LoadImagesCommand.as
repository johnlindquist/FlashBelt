package com.johnlindquist.flashbelt.controller 
{
	import com.swfjunkie.tweetr.data.objects.StatusData;
	import flight.domain.AsyncCommand;

	import com.johnlindquist.flashbelt.model.TwitterModel;
	import com.johnlindquist.flashbelt.service.LoadImageService;
	import com.swfjunkie.tweetr.data.objects.SearchResultData;

	import flash.display.DisplayObject;

	/**
	 * @author John
	 */
	public class LoadImagesCommand extends AsyncCommand
	{

		[Inject]
		public var twitterModel:TwitterModel;

		[Inject]
		public var loadImageService:LoadImageService;

		protected var index:uint = 0;

		override public function execute():void 
		{
			trace("loading images");
			if(index < twitterModel.imageURLs.length)
			{
				var imageURL:String = twitterModel.imageURLs.getItemAt(index) as String;
				
				response = loadImageService.load(imageURL);
					
				response.addResultHandler(onImageLoaded);
			}
		}

		private function onImageLoaded(image:*):void 
		{
			if(image is DisplayObject)
			{
				twitterModel.images.addItem(image);
			}
			index++;
			execute();
		}
	}
}
