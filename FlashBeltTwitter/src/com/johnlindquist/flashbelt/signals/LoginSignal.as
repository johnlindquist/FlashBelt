package com.johnlindquist.flashbelt.signals 
{
	import com.johnlindquist.flashbelt.model.vo.LoginVO;
	import org.osflash.signals.Signal;

	/**
	 * @author John
	 */
	public class LoginSignal extends Signal 
	{
		public function LoginSignal() 
		{
			super(LoginVO);
		}
	}
}
