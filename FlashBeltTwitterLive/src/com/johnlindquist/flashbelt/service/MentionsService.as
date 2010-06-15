package com.johnlindquist.flashbelt.service 
{
	import com.swfjunkie.tweetr.events.TweetEvent;
	import flight.net.IResponse;
	import flight.net.Response;

	import com.swfjunkie.tweetr.Tweetr;

	/**
	 * @author John
	 */
	public class MentionsService 
	{
		[Inject]
		public var twitter:Tweetr;
		
		private var response:IResponse;

		public function getMentions(username:String, password:String):IResponse 
		{
			response = new Response();	
			
			twitter.username = username;	
			twitter.password = password;
			
			twitter.addEventListener(TweetEvent.COMPLETE, onGetMentions);
			twitter.addEventListener(TweetEvent.FAILED, onFailed);
			
			twitter.getMentions();
			
			return response;
		}

		private function onFailed(event:TweetEvent):void 
		{
			response.cancel(new Error("Getting mentions failed"));
		}

		private function onGetMentions(event:TweetEvent):void 
		{
			trace(event.data);
			response.complete(event.data);
		}
	}
}
