package com.johnlindquist.flashbelt.view 
{
	import flight.binding.Bind;

	import com.johnlindquist.flashbelt.state.MainViewState;

	import org.robotlegs.mvcs.Mediator;

	import mx.events.PropertyChangeEvent;

	import flash.display.Sprite;
	import flash.events.MouseEvent;

	/**
	 * @author John
	 */
	public class MainViewMediator extends Mediator 
	{

		[Inject]
		public var mainView:MainView;

		[Inject]
		public var mainViewState:MainViewState;

		override public function onRegister():void 
		{
			mainView.physicsButton.addEventListener(MouseEvent.CLICK, onPhysicsButtonClick);
			mainView.hypeButton.addEventListener(MouseEvent.CLICK, onHypeButtonClick);
			mainView.minimalCompsButton.addEventListener(MouseEvent.CLICK, onMinimalCompsButton);
					
			mainView.content.addChild(new mainViewState.currentState());
			
			Bind.addListener(onMainViewStateChange, mainViewState, "currentState");
		}

		private function onMinimalCompsButton(event:MouseEvent):void 
		{
			mainViewState.currentState = MainViewState.MINIMAL_COMPS_VIEW;
		}

		private function onHypeButtonClick(event:MouseEvent):void 
		{
			trace("onHypeButtonClick");
			mainViewState.currentState = MainViewState.HYPE_VIEW;
		}

		private function onPhysicsButtonClick(event:MouseEvent):void 
		{
			trace("onPhysicsButtonClick");
			mainViewState.currentState = MainViewState.BOX2D_FLASH_VIEW;
		}

		private function onMainViewStateChange(event:PropertyChangeEvent):void 
		{
			if(mainView.content.getChildAt(0))
			{
				mainView.content.removeChildAt(0);
			}
			mainView.content.addChild(new mainViewState.currentState());
				
			if(mainViewState.currentState == MainViewState.LOGIN_VIEW)
			{
				mainView.menu.visible = false;
			}
			else
			{
				mainView.menu.visible = true;
			}
		}
	}
}
