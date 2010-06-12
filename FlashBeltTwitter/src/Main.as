/*

Copyright (c) 2010 Roundarch, All Rights Reserved 

@author   John Lindquist
@contact  johnlindquist@gmail.com
@project  FlashBeltTwitter

@internal 

 */
package {
	import com.destroytoday.twitteraspirin.Twitter;
	import com.destroytoday.twitteraspirin.oauth.OAuth;
	import com.destroytoday.twitteraspirin.vo.OAuthTokenVO;
	import com.johnlindquist.flashbelt.FlashBeltTwitterContext;

	import flash.display.Sprite;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;

	[SWF(backgroundColor="#3395DE", frameRate="60", width="800", height="600")]
	public class Main extends Sprite {
		protected var context : FlashBeltTwitterContext = new FlashBeltTwitterContext(); 
		public var twitter : Twitter = new Twitter("I8OZkIQZ2c0HGbyXG8OQQ", "aIflHMFbWPy9IwnBXzAVaKVpV3KDyOAfZ4HjJOrvs");

		public function Main() {
			context.contextView = this;	
//			twitter.oauth.requestTokenSignal.add(requestTokenHandler);
//			twitter.oauth.accessTokenSignal.add(accessTokenHandler);
//			twitter.oauth.verifyAccessTokenSignal.add(verifyAccessTokenHandler);
//			twitter.oauth.getRequestToken();

			trace("main");
		}

		// click the 'Authorize' button to get the request token
		protected function authorizeClickHandler() : void {
			trace("authorizeClickHandler");
		}

		// upon receiving the request token, open Twitter in the browser to authorize
		protected function requestTokenHandler(oauth : OAuth, token : OAuthTokenVO) : void {
			navigateToURL(new URLRequest(oauth.getAuthorizeURL()));
			trace("requestTokenHandler");
		}

		// return with the provided pin and click the 'Activate' button to get the access token
		protected function activateClickHandler(pin:String) : void {
			twitter.oauth.getAccessToken(pin);
			trace("activateClickHandler");
		}

		// upon receiving the access token, verify it
		protected function accessTokenHandler(oauth : OAuth, token : OAuthTokenVO) : void {
			oauth.verifyAccessToken(token);
			trace("accessTokenHandler");
		}

		// done
		protected function verifyAccessTokenHandler(oauth : OAuth, token : OAuthTokenVO) : void {
			trace("verifyAccessTokenHandler");
		}

		private function onRequestToken(oauth : OAuth, token : OAuthTokenVO) : void {
			trace("onRequestToken");
		}
	}
}