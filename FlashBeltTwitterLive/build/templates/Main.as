/*

Copyright (c) @year@ @company.name@, All Rights Reserved 

@author   @author.name@
@contact  @author.email@
@project  @project.name@

@internal 

*/
package
{
	import @namespace@.@project.name@Context;
	
	import flash.display.Sprite;
	
	public class Main extends Sprite
	{
		protected var context:@project.name@Context = new @project.name@Context(); 
		
		public function Main()
		{
			context.contextView = this;	
		}
	}
}