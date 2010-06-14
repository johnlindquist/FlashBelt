package com.johnlindquist.flashbelt.controller 
{
	import com.destroytoday.twitteraspirin.vo.StatusVO;
	import flight.domain.AsyncCommand;

	import com.johnlindquist.flashbelt.model.TwitterModel;
	import com.johnlindquist.flashbelt.service.LoadImageService;

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
			trace("loading image!!!", index, twitterModel.searchResults.length);
			
			if(index < twitterModel.searchResults.length)
			{
				response = loadImageService.load(StatusVO(twitterModel.searchResults[index]).user.profileImageURL);
					
				response.addResultHandler(onImageLoaded);
			}
		}

		private function onImageLoaded(image:*):void 
		{
			trace("image loaded!!!", index, twitterModel.searchResults.length);
			if(image is DisplayObject)
			{
				twitterModel.images.addItem(image);
			}
			index++;
			execute();
		}
	}
}
