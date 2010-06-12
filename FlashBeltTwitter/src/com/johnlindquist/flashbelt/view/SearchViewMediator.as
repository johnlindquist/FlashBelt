/*
Copyright (c) 2010 Roundarch, All Rights Reserved 

@author   John Lindquist
@contact  johnlindquist@gmail.com
@project  FlashBeltTwitter
*/
package com.johnlindquist.flashbelt.view {
	import com.johnlindquist.flashbelt.signals.SearchTwitterSignal;
	import com.destroytoday.twitteraspirin.Twitter;
	import com.destroytoday.twitteraspirin.oauth.OAuth;
	import com.destroytoday.twitteraspirin.vo.OAuthTokenVO;

	import org.robotlegs.mvcs.Mediator;

	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;

	//imports

	
	public class SearchViewMediator extends Mediator
	{
		[Inject]
		public var searchView:SearchView;
		
		[Inject]
		public var searchTwitterSignal:SearchTwitterSignal;

		//signals

		override public function onRegister():void {
			searchView.searchButton.addEventListener(MouseEvent.CLICK, onMouseClick);
//			twitter.oauth.requestTokenSignal.add(requestTokenHandler);
//			twitter.oauth.accessTokenSignal.add(accessTokenHandler);
//			twitter.oauth.verifyAccessTokenSignal.add(verifyAccessTokenHandler);
//			twitter.oauth.getRequestToken();
		}

		private function onStatus(statuses:*, statusVO:*) : void {
			trace("something", statuses, statusVO);
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
		protected function onMouseClick(event:MouseEvent) : void {
//			twitter.oauth.getAccessToken(aLoginForm.username.text);
//			trace("activateClickHandler");
			searchTwitterSignal.dispatch(searchView.searchInputText.text);
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