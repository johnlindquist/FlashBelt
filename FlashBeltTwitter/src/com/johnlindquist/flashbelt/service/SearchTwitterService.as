package com.johnlindquist.flashbelt.service {
	import com.destroytoday.twitteraspirin.vo.StatusVO;
	import com.destroytoday.twitteraspirin.core.Statuses;
	import flight.net.Response;
	import com.destroytoday.net.XMLLoader;

	import flight.net.IResponse;
	import com.destroytoday.twitteraspirin.Twitter;

	/**
	 * @author John Lindquist
	 */
	public class SearchTwitterService {
		[Inject]
		public var twitter:Twitter;
		private var searchResponse : Response;

		[PostConstruct]
		public function construct():void {
			twitter.statuses.getSearchTimelineSignal.add(onSearchTimeline);
		}

		
		public function search(query:String) : IResponse {
			searchResponse = new Response(); 
			
			twitter.statuses.getSearchTimeline(query);
			
			return searchResponse;
		}

		private function onSearchTimeline(statuses:*, statusVO:*) : void {
			searchResponse.complete(statusVO);						
		}
	}
}
