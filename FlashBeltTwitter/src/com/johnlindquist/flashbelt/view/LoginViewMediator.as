package com.johnlindquist.flashbelt.view 
{
	import com.johnlindquist.flashbelt.model.vo.LoginVO;

	import flash.events.MouseEvent;
	import com.johnlindquist.flashbelt.signals.LoginSignal;

	import org.robotlegs.mvcs.Mediator;

	/**
	 * @author John
	 */
	public class LoginViewMediator extends Mediator 
	{
		[Inject]
		public var loginView:LoginView;

		[Inject]
		public var loginSignal:LoginSignal;
		
		
		override public function onRegister():void 
		{
			loginView.submitButton.addEventListener(MouseEvent.CLICK, submitButtonMouseClick);	
		}

		private function submitButtonMouseClick(event:MouseEvent):void 
		{
			var loginVO:LoginVO = new LoginVO();	
			loginVO.username = loginView.usernameText.text;
			loginVO.password = loginView.passwordText.text;
			loginSignal.dispatch(loginVO);
		}
	}
}
