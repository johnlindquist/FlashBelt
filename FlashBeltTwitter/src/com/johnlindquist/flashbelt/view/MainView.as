package com.johnlindquist.flashbelt.view 
{
	import com.bit101.components.HBox;
	import com.bit101.components.PushButton;
	import flash.display.Sprite;

	/**
	 * @author John
	 */
	public class MainView extends Sprite 
	{
		public var content:Sprite = new Sprite();
		public var menu:Sprite = new Sprite();
		
		public var physicsButton:PushButton = new PushButton();
		public var hypeButton:PushButton = new PushButton();
		
		public function MainView() 
		{
			addChild(content);

			physicsButton.label = "Physics";
			hypeButton.label = "Hype";
			
			var hbox:HBox = new HBox();
			hbox.addChild(physicsButton);
			hbox.addChild(hypeButton);

			menu.addChild(hbox);
			
			addChild(menu);
		}
	}
}
