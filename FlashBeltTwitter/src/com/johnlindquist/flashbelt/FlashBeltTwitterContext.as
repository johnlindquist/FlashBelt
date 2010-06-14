/*

Copyright (c) 2010 Roundarch, All Rights Reserved 

@author   John Lindquist
@contact  johnlindquist@gmail.com
@project  FlashBeltTwitter

@internal 

*/
package com.johnlindquist.flashbelt 
{
	import com.johnlindquist.flashbelt.view.HypeViewMediator;
	import com.johnlindquist.flashbelt.view.HypeView;
	import com.johnlindquist.flashbelt.view.Box2DFlashViewMediator;
	import com.johnlindquist.flashbelt.view.Box2DFlashView;
	import com.johnlindquist.flashbelt.service.LoadImageService;
	import com.johnlindquist.flashbelt.view.MainViewMediator;
	import com.destroytoday.twitteraspirin.Twitter;
	import com.johnlindquist.flashbelt.controller.SearchTwitterAndLoadImagesCommand;
	import com.johnlindquist.flashbelt.model.TwitterModel;
	import com.johnlindquist.flashbelt.service.SearchTwitterService;
	import com.johnlindquist.flashbelt.signals.SearchTwitterAndLoadImagesSignal;
	import com.johnlindquist.flashbelt.state.MainViewState;
	import com.johnlindquist.flashbelt.view.FlashBeltTwitterViewMediator;
	import com.johnlindquist.flashbelt.view.MainView;
	import com.johnlindquist.flashbelt.view.SearchViewMediator;

	import org.robotlegs.mvcs.SignalContext;

	public class FlashBeltTwitterContext extends SignalContext
	{
		override public function startup():void
		{
			//map signals to commands
			signalCommandMap.mapSignalClass(SearchTwitterAndLoadImagesSignal, SearchTwitterAndLoadImagesCommand);
								
			//map models
			
			//map services
			var twitter:Twitter = new Twitter("I8OZkIQZ2c0HGbyXG8OQQ", "aIflHMFbWPy9IwnBXzAVaKVpV3KDyOAfZ4HjJOrvs");
			injector.mapValue(Twitter, twitter);
			injector.mapSingleton(SearchTwitterService);
			injector.mapSingleton(LoadImageService);
			injector.mapSingleton(MainViewState);
			injector.mapSingleton(TwitterModel);

			
			
			//map views to mediators
            mediatorMap.mapView(MainView,MainViewMediator);
            mediatorMap.mapView(SearchView,SearchViewMediator);
            mediatorMap.mapView(FlashBeltTwitterView,FlashBeltTwitterViewMediator);
            mediatorMap.mapView(Box2DFlashView,Box2DFlashViewMediator);
            mediatorMap.mapView(HypeView, HypeViewMediator);

			contextView.addChild(new MainView());
		}		
	}
}