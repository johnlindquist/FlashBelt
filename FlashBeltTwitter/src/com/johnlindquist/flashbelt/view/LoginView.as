package com.johnlindquist.flashbelt.view 
{
	import com.bit101.components.PushButton;
	import com.bit101.components.InputText;
	import com.bit101.components.VBox;

	import flash.display.Sprite;

	/**
	 * @author John
	 */
	public class LoginView extends Sprite 
	{
		public var usernameText:InputText;
		public var passwordText:InputText;
		public var submitButton:PushButton;

		public function LoginView() 
		{
			var vBox:VBox = new VBox();
			
			usernameText = new InputText();
			passwordText = new InputText();
			passwordText.password = true;
			
			submitButton = new PushButton();
			submitButton.label = "Login";
			;
			
			vBox.addChild(usernameText);
			vBox.addChild(passwordText);
			vBox.addChild(submitButton);
			
			vBox.scaleX = vBox.scaleY = 3;
			
			vBox.y = 100;
			
			addChild(vBox);
		}
	}
}
