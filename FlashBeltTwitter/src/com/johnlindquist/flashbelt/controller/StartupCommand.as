package com.johnlindquist.flashbelt.controller 
{
	import flight.domain.AsyncCommand;

	import com.destroytoday.twitteraspirin.Twitter;
	import com.destroytoday.twitteraspirin.oauth.OAuth;
	import com.destroytoday.twitteraspirin.vo.OAuthTokenVO;

	import flash.net.URLRequest;
	import flash.net.navigateToURL;

	/**
	 * @author John
	 */
	public class StartupCommand extends AsyncCommand 
	{
		[Inject]
		public var twitter:Twitter;
		
		override public function execute():void 
		{
						//			twitter.oauth.requestTokenSignal.add(requestTokenHandler);
			//			twitter.oauth.accessTokenSignal.add(accessTokenHandler);
			//			twitter.oauth.verifyAccessTokenSignal.add(verifyAccessTokenHandler);
			//			twitter.oauth.getRequestToken();
		}

		// click the 'Authorize' button to get the request token
		protected function authorizeClickHandler():void 
		{
			trace("authorizeClickHandler");
		}

		// upon receiving the request token, open Twitter in the browser to authorize
		protected function requestTokenHandler(oauth:OAuth, token:OAuthTokenVO):void 
		{
			navigateToURL(new URLRequest(oauth.getAuthorizeURL()));
			trace("requestTokenHandler");
		}

		// return with the provided pin and click the 'Activate' button to get the access token
		protected function activateClickHandler(pin:String):void 
		{
			twitter.oauth.getAccessToken(pin);
			trace("activateClickHandler");
		}

		// upon receiving the access token, verify it
		protected function accessTokenHandler(oauth:OAuth, token:OAuthTokenVO):void 
		{
			oauth.verifyAccessToken(token);
			trace("accessTokenHandler");
		}

		// done
		protected function verifyAccessTokenHandler(oauth:OAuth, token:OAuthTokenVO):void 
		{
			trace("verifyAccessTokenHandler");
		}

		private function onRequestToken(oauth:OAuth, token:OAuthTokenVO):void 
		{
			trace("onRequestToken");
		}
	}
}
