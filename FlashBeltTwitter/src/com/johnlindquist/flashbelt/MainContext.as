/*

Copyright (c) 2010 Roundarch, All Rights Reserved 

@author   John Lindquist
@contact  johnlindquist@gmail.com
@project  FlashBeltTwitter

@internal 

*/
package com.johnlindquist.flashbelt 
{
	import com.johnlindquist.flashbelt.controller.LoginAndLoadImagesCommand;
	import com.johnlindquist.flashbelt.controller.SearchTwitterAndLoadImagesCommand;
	import com.johnlindquist.flashbelt.model.TwitterModel;
	import com.johnlindquist.flashbelt.service.LoadImageService;
	import com.johnlindquist.flashbelt.service.LoginService;
	import com.johnlindquist.flashbelt.service.SearchTwitterService;
	import com.johnlindquist.flashbelt.signals.LoginSignal;
	import com.johnlindquist.flashbelt.signals.SearchTwitterAndLoadImagesSignal;
	import com.johnlindquist.flashbelt.state.MainViewState;
	import com.johnlindquist.flashbelt.view.Box2DFlashView;
	import com.johnlindquist.flashbelt.view.Box2DFlashViewMediator;
	import com.johnlindquist.flashbelt.view.FlashBeltTwitterViewMediator;
	import com.johnlindquist.flashbelt.view.HypeView;
	import com.johnlindquist.flashbelt.view.HypeViewMediator;
	import com.johnlindquist.flashbelt.view.LoginView;
	import com.johnlindquist.flashbelt.view.LoginViewMediator;
	import com.johnlindquist.flashbelt.view.MainView;
	import com.johnlindquist.flashbelt.view.MainViewMediator;
	import com.johnlindquist.flashbelt.view.MinimalCompsView;
	import com.johnlindquist.flashbelt.view.MinimalCompsViewMediator;
	import com.johnlindquist.flashbelt.view.SearchViewMediator;
	import com.swfjunkie.tweetr.Tweetr;

	import org.robotlegs.mvcs.SignalContext;

	public class MainContext extends SignalContext
	{
		override public function startup():void
		{
			//map signals to commands
			signalCommandMap.mapSignalClass(SearchTwitterAndLoadImagesSignal, SearchTwitterAndLoadImagesCommand);
			signalCommandMap.mapSignalClass(LoginSignal, LoginAndLoadImagesCommand);
								
			//map models
			injector.mapSingleton(TwitterModel);
			
			//map services
			var twitter:Tweetr = new Tweetr();
			twitter.useAuthHeaders = true;
//			twitter.serviceHost = "labs.swfjunkie.com/tweetr/proxy";
			injector.mapValue(Tweetr, twitter);
			injector.mapSingleton(SearchTwitterService);
			injector.mapSingleton(LoadImageService);
			injector.mapSingleton(MainViewState);
			injector.mapSingleton(LoginService);

			
			
			//map views to mediators
            mediatorMap.mapView(MainView,MainViewMediator);
            mediatorMap.mapView(LoginView,LoginViewMediator);
            mediatorMap.mapView(SearchView,SearchViewMediator);
            mediatorMap.mapView(FlashBeltTwitterView,FlashBeltTwitterViewMediator);
            mediatorMap.mapView(Box2DFlashView,Box2DFlashViewMediator);
            mediatorMap.mapView(HypeView, HypeViewMediator);
            mediatorMap.mapView(MinimalCompsView, MinimalCompsViewMediator);
			
			super.startup();
			
			contextView.addChild(new MainView());
		}		
	}
}