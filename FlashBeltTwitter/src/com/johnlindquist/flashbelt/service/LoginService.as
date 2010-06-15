package com.johnlindquist.flashbelt.service 
{
	import com.swfjunkie.tweetr.events.TweetEvent;
	import flight.net.IResponse;
	import flight.net.Response;

	import com.swfjunkie.tweetr.Tweetr;

	/**
	 * @author John
	 */
	public class LoginService 
	{
		[Inject]
		public var twitter:Tweetr;
		
		private var response:IResponse;

		public function login(username:String, password:String):IResponse 
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
			if(event.data is Error)
			{
				response.cancel(event.data as Error);
			}
		}

		private function onGetMentions(event:TweetEvent):void 
		{
			trace("complete", event);
			
			response.complete(event.data);
		}
	}
}
