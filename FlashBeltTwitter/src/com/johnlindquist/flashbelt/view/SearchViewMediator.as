/*
Copyright (c) 2010 Roundarch, All Rights Reserved 

@author   John Lindquist
@contact  johnlindquist@gmail.com
@project  FlashBeltTwitter
 */
package com.johnlindquist.flashbelt.view 
{
	import com.johnlindquist.flashbelt.signals.SearchTwitterAndLoadImagesSignal;

	import org.robotlegs.mvcs.Mediator;

	import flash.events.MouseEvent;

	//imports

	
	public class SearchViewMediator extends Mediator
	{

		[Inject]
		public var searchView:SearchView;

		[Inject]
		public var searchTwitterSignal:SearchTwitterAndLoadImagesSignal;

		override public function onRegister():void 
		{
			searchView.searchInputText.text = "#FlashBelt";
			searchView.searchButton.addEventListener(MouseEvent.CLICK, onMouseClick);
		}

		// return with the provided pin and click the 'Activate' button to get the access token
		protected function onMouseClick(event:MouseEvent):void 
		{
			trace("text", searchView.searchInputText.text);
			
			var query:String = searchView.searchInputText.text;
			trace("query: ", query)
			
			searchTwitterSignal.dispatch(query);
		}
	}
}