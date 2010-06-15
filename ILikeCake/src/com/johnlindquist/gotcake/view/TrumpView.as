package com.johnlindquist.gotcake.view 
{
	import flash.display.Sprite;

	public class TrumpView extends Sprite 
	{
		public var cakeButton:Sprite;
		public var fireButton:Sprite;

		public function TrumpView() 
		{
			cakeButton = new Sprite();
			fireButton = new Sprite();
			
			addChild(cakeButton);
			addChild(fireButton);
		}
	}
}
