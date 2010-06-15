package com.johnlindquist.flashbelt.view 
{
	import com.bit101.components.TextArea;
	import com.bit101.components.VBox;
	import com.bit101.components.List;

	import flash.display.Sprite;

	/**
	 * @author John
	 */
	public class MinimalCompsView extends Sprite 
	{
		public var list:List;
		public var textArea:TextArea;

		public function MinimalCompsView() 
		{
			var vbox:VBox = new VBox();
			
			list = new List();
			list.width = 250;
			list.height = 150;
			
			vbox.addChild(list);
			
			textArea = new TextArea();
			textArea.width = 250;
			textArea.height = 50;
			
			vbox.addChild(textArea);
			
			vbox.y = 100;
			vbox.scaleX = vbox.scaleY = 2;
			
			addChild(vbox);
		}

		public function addToList(item:Object):void 
		{
			list.addItem(item);
		}
	}
}
