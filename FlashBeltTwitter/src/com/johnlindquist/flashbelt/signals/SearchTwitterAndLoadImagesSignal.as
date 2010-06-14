package com.johnlindquist.flashbelt.signals {
	import org.osflash.signals.Signal;

	/**
	 * @author John Lindquist
	 */
	public class SearchTwitterAndLoadImagesSignal extends Signal {
		public function SearchTwitterAndLoadImagesSignal() {
			super(String);
		}
	}
}
