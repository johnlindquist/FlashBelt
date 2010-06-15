package com.johnlindquist.flashbelt.view 
{
	import com.bit101.components.PushButton;
	import com.bit101.components.InputText;
	import com.bit101.components.VBox;

	import flash.display.Sprite;

	/**
	 * @author John
	 */
	public class SearchView extends Sprite 
	{
		public var inputText:InputText;
		public var searchButton:PushButton;

		public function SearchView() 
		{
			var vBox:VBox = new VBox();
							
			inputText = new InputText();
			searchButton = new PushButton();
			searchButton.label = "Search";
			
			vBox.addChild(inputText);
			vBox.addChild(searchButton);
			
			vBox.scaleX = vBox.scaleY = 3;
			
			vBox.x = 350;
			vBox.y = 250;
			
			addChild(vBox);
		}
	}
}
