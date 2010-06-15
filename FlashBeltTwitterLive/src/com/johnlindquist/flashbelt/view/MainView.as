package com.johnlindquist.flashbelt.view 
{
	import com.bit101.components.VBox;
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
		public var searchButton:PushButton = new PushButton();
		
		public function MainView() 
		{
			addChild(content);

			physicsButton.label = "Physics";
			hypeButton.label = "Hype";
			minimalCompsButton.label = "Minimal Comps";
			searchButton.label = "Search";

			physicsButton.tabEnabled = false;
			hypeButton.tabEnabled = false;
			minimalCompsButton.tabEnabled = false;
			searchButton.tabEnabled = false;
						
			var leftHBox:VBox = new VBox();
			leftHBox.addChild(physicsButton);
			leftHBox.addChild(hypeButton);
			leftHBox.addChild(minimalCompsButton);
			
			
			var rightHBox:VBox = new VBox();
			rightHBox.addChild(searchButton);
			
			leftHBox.scaleX = leftHBox.scaleY = rightHBox.scaleX = rightHBox.scaleY = 2;

			menu.addChild(leftHBox);
			
			rightHBox.x = 600; 
			menu.addChild(rightHBox);
			
			addChild(menu);
		}
	}
}
