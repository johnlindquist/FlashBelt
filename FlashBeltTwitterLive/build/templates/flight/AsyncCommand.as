package  @namespace@.controller
{
	import flight.domain.AsyncCommand;
	
	public class @className@ extends AsyncCommand
	{
		@dependencies@

		override public function execute():void
		{
			response = 
			response.addResultHandler(onResult);
			response.addFaultHandler(onFault);
		}
		
		private function onResult(data:*):void
		{
			
		}
		
		private function onFault(data:*):void
		{
			
		}
	}
}