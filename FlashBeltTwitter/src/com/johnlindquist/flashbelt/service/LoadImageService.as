package com.johnlindquist.flashbelt.service 
{
	import flash.system.LoaderContext;
	import flash.events.IOErrorEvent;
	import flash.events.ErrorEvent;
	import flight.net.IResponse;
	import flight.net.Response;

	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLRequest;

	/**
	 * @author John
	 */
	public class LoadImageService 
	{
		private var loadImageResponse:IResponse;
		private	var loader:Loader = new Loader();

		public function load(url:String):IResponse 
		{
			trace("loading", url);
			loadImageResponse = new Response();
			
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoaderComplete);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onCatchAllError);
			loader.contentLoaderInfo.addEventListener(ErrorEvent.ERROR, onCatchAllError);
			var request:URLRequest = new URLRequest(url);
			loader.load(request, new LoaderContext(true));
			
			return loadImageResponse;	
		}

		private function onCatchAllError(event:*):void 
		{
			loadImageResponse.complete(null);
		}

		private function onLoaderComplete(event:Event):void 
		{
			loadImageResponse.complete(loader.contentLoaderInfo.content);
		}
	}
}
