package com.johnlindquist.gotcake {
	import com.johnlindquist.gotcake.view.ObamaMediator;
	import com.johnlindquist.gotcake.view.ObamaFridgeMediator;
	import com.johnlindquist.gotcake.view.TrumpFridgeMediator;
	import com.johnlindquist.gotcake.model.FrameState;
	import com.johnlindquist.gotcake.view.TrumpMediator;
	import com.johnlindquist.gotcake.view.ILikeCakeViewMediator;
	import com.johnlindquist.gotcake.signals.CakeOrdered;
	import com.johnlindquist.gotcake.controller.OrderCake;
	import com.johnlindquist.gotcake.model.TrumpFridge;
	import com.johnlindquist.gotcake.services.Bakery;

	import org.robotlegs.mvcs.SignalContext;

	/**
	 * @author John Lindquist
	 */
	public class TelephoneLines extends SignalContext {
		override public function startup() : void {
			injector.mapSingleton(Bakery);
			injector.mapSingleton(TrumpFridge);
			injector.mapSingleton(FrameState);
			
			signalCommandMap.mapSignalClass(CakeOrdered, OrderCake);
			
			mediatorMap.mapView(ILikeCakeView, ILikeCakeViewMediator);
			mediatorMap.mapView(TrumpView, TrumpMediator);
			mediatorMap.mapView(TrumpFridgeView, TrumpFridgeMediator);
			mediatorMap.mapView(ObamaView, ObamaMediator);
			mediatorMap.mapView(ObamaFridgeView, ObamaFridgeMediator);
			
			
			contextView.addChild(new ILikeCakeView());
		}
	}
}
