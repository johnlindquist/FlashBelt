package {
	import com.johnlindquist.gotcake.TelephoneLines;

	import flash.display.Sprite;

	/**
	 * @author John Lindquist
	 */
	 [SWF(width="1024", height="768", frameRate="60")]
	public class GotCakeApp extends Sprite {

		private var context : TelephoneLines;

		public function GotCakeApp() {
			context = new TelephoneLines();
			context.contextView = this;
		}
	}
}
