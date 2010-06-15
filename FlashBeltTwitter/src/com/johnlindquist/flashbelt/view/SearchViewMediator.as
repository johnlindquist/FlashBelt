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

	public class SearchViewMediator extends Mediator
	{

		[Inject]
		public var searchView:SearchView;

		[Inject]
		public var searchTwitterSignal:SearchTwitterAndLoadImagesSignal;

		override public function onRegister():void 
		{
			searchView.inputText.text = "#FlashBelt";
			searchView.searchButton.addEventListener(MouseEvent.CLICK, onMouseClick);
		}

		protected function onMouseClick(event:MouseEvent):void 
		{
			var query:String = searchView.inputText.text;
			searchTwitterSignal.dispatch(query);
		}
	}
}