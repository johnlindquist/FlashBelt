package com.johnlindquist.gotcake.signals 
{
	import com.johnlindquist.gotcake.model.vo.Order;

	import org.osflash.signals.Signal;

	public class CakeOrdered extends Signal 
	{
		public function CakeOrdered() 
		{
			super(Order);
		}
	}
}
