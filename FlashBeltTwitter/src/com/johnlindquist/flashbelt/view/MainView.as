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
		public var minimalCompsButton:PushButton = new PushButton();
		public var searchAgainButton:PushButton = new PushButton();
		
		public function MainView() 
		{
			addChild(content);

			physicsButton.label = "Physics";
			hypeButton.label = "Hype";
			minimalCompsButton.label = "Minimal Comps";
			searchAgainButton.label = "Search Again";

			physicsButton.tabEnabled = false;
			hypeButton.tabEnabled = false;
			minimalCompsButton.tabEnabled = false;
			searchAgainButton.tabEnabled = false;
						
			var hbox:HBox = new HBox();
			hbox.addChild(physicsButton);
			hbox.addChild(hypeButton);
			hbox.addChild(minimalCompsButton);
			hbox.addChild(searchAgainButton);

			hbox.scaleX = hbox.scaleY = 2;

			menu.addChild(hbox);
			
			addChild(menu);
		}
	}
}
