/*

Copyright (c) 2010 Roundarch, All Rights Reserved 

@author   John Lindquist
@contact  johnlindquist@gmail.com
@project  FlashBeltTwitter

 */
package 
{
	import com.johnlindquist.flashbelt.view.Box2DFlashView;
	import com.destroytoday.twitteraspirin.oauth.OAuth;
	import com.destroytoday.twitteraspirin.vo.OAuthTokenVO;
	import com.johnlindquist.flashbelt.FlashBeltTwitterContext;

	import flash.display.Sprite;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
//3395DE
	[SWF(backgroundColor="#ffffff", frameRate="60", width="800", height="600")]

	public class Main extends Sprite 
	{
		protected var context:FlashBeltTwitterContext = new FlashBeltTwitterContext(); 

		public function Main() 
		{
//			context.contextView = this;	
			addChild(new Box2DFlashView());
		}
	}
}