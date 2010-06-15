package com.johnlindquist.flashbelt.controller 
{
	import com.johnlindquist.flashbelt.state.MainViewState;
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
		
		[Inject]
		public var mainViewState:MainViewState;
		
		protected var index:uint = 0;

		override public function execute():void 
		{
			if(index < twitterModel.imageURLs.length)
			{
				var imageURL:String = twitterModel.imageURLs.getItemAt(index) as String;
				trace("loading", imageURL);
				response = loadImageService.load(imageURL);
					
				response.addResultHandler(onImageLoaded);
				response.addFaultHandler(onImageFailed);
			}
		}

		private function onImageFailed(data:*):void 
		{
			trace("on image failed");
			mainViewState.currentState = MainViewState.ERROR_VIEW;	
		}

		
		
		private function onImageLoaded(image:*):void 
		{
			trace("image loaded", image);
			if(image is DisplayObject)
			{
				twitterModel.images.addItem(image);
			}
			index++;
			execute();
		}
	}
}
