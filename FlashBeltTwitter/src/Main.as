/*

Copyright (c) 2010 Roundarch, All Rights Reserved 

@author   John Lindquist
@contact  johnlindquist@gmail.com
@project  FlashBeltTwitter

 */
package 
{
	import com.johnlindquist.flashbelt.MainContext;

	import flash.display.Sprite;

	//3395DE
	[SWF(backgroundColor="#ffffff", frameRate="60", width="800", height="600")]

	public class Main extends Sprite 
	{
		protected var context:MainContext = new MainContext(); 

		public function Main() 
		{
			context.contextView = this;	
		}
	}
}