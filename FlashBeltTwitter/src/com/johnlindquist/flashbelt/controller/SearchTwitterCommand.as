package com.johnlindquist.flashbelt.controller 
{
	import flight.domain.AsyncCommand;
	import flight.list.Collection;

	import com.johnlindquist.flashbelt.model.TwitterModel;
	import com.johnlindquist.flashbelt.service.SearchTwitterService;
	import com.johnlindquist.flashbelt.state.MainViewState;
	import com.swfjunkie.tweetr.data.DataParser;
	import com.swfjunkie.tweetr.data.objects.SearchResultData;

	/**
	 * @author John
	 */
	public class SearchTwitterCommand extends AsyncCommand
	{
		public var query:String;

		[Inject]
		public var searchTwitterService:SearchTwitterService;

		[Inject]
		public var flashBeltTwitterViewState:MainViewState;

		[Inject]
		public var twitterModel:TwitterModel;

		public function SearchTwitterCommand(query:String) 
		{
			this.query = query;
		}

		
		override public function execute():void 
		{
			response = searchTwitterService.search(query);
			response.addResultHandler(onResult);
		}

		private function onResult(data:*):void 
		{
			if(data is String)
			{
				twitterModel.statuses = new Collection(DataParser.parseSearchResults(XML(data)));
				twitterModel.imageURLs.removeAll();
				
				for each (var searchResult : SearchResultData in twitterModel.statuses) 
				{
					twitterModel.imageURLs.addItem(searchResult.userProfileImage);
				}				
			}

			flashBeltTwitterViewState.currentState = MainViewState.BOX2D_FLASH_VIEW;
		}
	}
}
