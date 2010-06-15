package com.johnlindquist.flashbelt.service 
{
	import flight.net.IResponse;
	import flight.net.Response;

	import com.swfjunkie.tweetr.Tweetr;
	import com.swfjunkie.tweetr.events.TweetEvent;

	/**
	 * @author John Lindquist
	 */
	public class SearchTwitterService 
	{

		[Inject]
		public var twitter:Tweetr;

		private var searchResponse:Response;

		public function search(query:String):IResponse 
		{
			searchResponse = new Response(); 
			
			twitter.addEventListener(TweetEvent.COMPLETE, searchTimelineComplete);
			twitter.search(query);
			
			return searchResponse;
		}

		private function searchTimelineComplete(event:TweetEvent):void 
		{
			searchResponse.complete(event.data);
		}
	}
}
