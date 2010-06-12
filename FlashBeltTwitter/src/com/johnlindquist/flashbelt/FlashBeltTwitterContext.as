/*

Copyright (c) 2010 Roundarch, All Rights Reserved 

@author   John Lindquist
@contact  johnlindquist@gmail.com
@project  FlashBeltTwitter

@internal 

*/
package com.johnlindquist.flashbelt {
	import com.johnlindquist.flashbelt.model.TwitterModel;
	import com.johnlindquist.flashbelt.state.FlashBeltTwitterViewState;
	import com.johnlindquist.flashbelt.view.FlashBeltTwitterViewMediator;
	import com.destroytoday.twitteraspirin.Twitter;
	import com.johnlindquist.flashbelt.controller.SearchTwitterCommand;
	import com.johnlindquist.flashbelt.service.SearchTwitterService;
	import com.johnlindquist.flashbelt.signals.SearchTwitterSignal;
	import com.johnlindquist.flashbelt.view.SearchViewMediator;

	import org.robotlegs.mvcs.SignalContext;

	public class FlashBeltTwitterContext extends SignalContext
	{
		override public function startup():void
		{
			//map signals to commands
			signalCommandMap.mapSignalClass(SearchTwitterSignal, SearchTwitterCommand);
			//map models
			
			//map services
			var twitter:Twitter = new Twitter("I8OZkIQZ2c0HGbyXG8OQQ", "aIflHMFbWPy9IwnBXzAVaKVpV3KDyOAfZ4HjJOrvs");
			injector.mapValue(Twitter, twitter);
			injector.mapSingleton(SearchTwitterService);
			injector.mapSingleton(FlashBeltTwitterViewState);
			injector.mapSingleton(TwitterModel);
			//map views to mediators
            mediatorMap.mapView(SearchView,SearchViewMediator);
            mediatorMap.mapView(FlashBeltTwitterView,FlashBeltTwitterViewMediator);

			contextView.addChild(new FlashBeltTwitterView());
		}		
	}
}