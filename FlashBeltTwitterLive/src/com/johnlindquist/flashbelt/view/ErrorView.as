package com.johnlindquist.flashbelt.view 
{
	import com.bit101.components.Text;
	import flash.display.Sprite;

	/**
	 * @author John
	 */
	public class ErrorView extends Sprite 
	{
		public function ErrorView() 
		{
			var text:Text = new Text();
			text.text = "Something went wrong :(";
			text.x = 300;
			text.y = 300;
			text.scaleX = text.scaleY = 4;
			addChild(text);;
		}
	}
}
