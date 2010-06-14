package com.johnlindquist.flashbelt.controller 
{
	import flight.domain.AsyncCommand;

	import com.destroytoday.twitteraspirin.vo.StatusVO;
	import com.johnlindquist.flashbelt.model.TwitterModel;
	import com.johnlindquist.flashbelt.service.SearchTwitterService;
	import com.johnlindquist.flashbelt.state.MainViewState;

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
			trace("searching twitter");
			response = searchTwitterService.search(query);
			response.addResultHandler(onResult);
		}

		private function onResult(data:*):void 
		{
			
			flashBeltTwitterViewState.currentState = MainViewState.BOX2D_FLASH_VIEW;
			
			if(data is Vector.<StatusVO>) 
			{
				twitterModel.searchResults = data;		
			}
		}
	}
}
