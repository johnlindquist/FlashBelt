package com.johnlindquist.flashbelt.controller {
	import com.johnlindquist.flashbelt.model.TwitterModel;
	import flight.domain.AsyncCommand;

	import com.destroytoday.twitteraspirin.vo.StatusVO;
	import com.johnlindquist.flashbelt.service.SearchTwitterService;
	import com.johnlindquist.flashbelt.state.FlashBeltTwitterViewState;

	/**
	 * @author John Lindquist
	 */
	public class SearchTwitterCommand extends AsyncCommand {
		
		[Inject]
		public var query:String;
		
		[Inject]
		public var searchTwitterService:SearchTwitterService;
		
		[Inject]
		public var flashBeltTwitterViewState:FlashBeltTwitterViewState;
		
		[Inject]
		public var twitterModel:TwitterModel;
		
		override public function execute() : void {
			response = searchTwitterService.search(query);
			response.addResultHandler(onResult);
		}

		private function onResult(data:*) : void {
			
			flashBeltTwitterViewState.currentState = FlashBeltTwitterViewState.RESULTS;
			
			if(data is Vector.<StatusVO>) {
				twitterModel.searchResults = data;		
			}
		}
	}
}
