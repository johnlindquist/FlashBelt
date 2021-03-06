package com.johnlindquist.flashbelt.view 
{
	import flash.events.Event;
	import hype.extended.behavior.Swarm;
	import hype.extended.behavior.VariableVibration;
	import hype.extended.rhythm.FilterRhythm;
	import hype.framework.behavior.AbstractBehavior;
	import hype.framework.display.BitmapCanvas;

	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.filters.ColorMatrixFilter;
	import flash.geom.Point;

	/**
	 * @author John
	 */
	public class HypeView extends Sprite 
	{
		private var clipContainer:Sprite;
		private var behaviors: Vector.<AbstractBehavior> = new Vector.<AbstractBehavior>();
		private var blurRhythm:FilterRhythm;

		public function HypeView() 
		{
			var bmc : BitmapCanvas = new BitmapCanvas(800, 600);
			addChild(bmc);
			clipContainer = new Sprite();
			bmc.startCapture(clipContainer, true);
						
			var filter:ColorMatrixFilter = new ColorMatrixFilter();
			var matrix:Array = new Array();
			matrix = matrix.concat([1, 0, 0, 0, 0]); // red
			matrix = matrix.concat([0, 1, 0, 0, 0]); // green
			matrix = matrix.concat([0, 0, 1, 0, 0]); // blue
			matrix = matrix.concat([0, 0, 0, .999, 0]); // alpha
			filter.matrix = matrix;
			blurRhythm = new FilterRhythm([filter], bmc.bitmap.bitmapData);
			blurRhythm.start();
		}

		public function addToCanvas(image:DisplayObject):void 
		{
			image.x = Math.random() * 500;
			image.y = Math.random() * 500;
			image.z = 50;
			var swarm:Swarm = new Swarm(image, new Point(800 / 2, 600 / 2), 6, .03, 0);
			swarm.start();
			var zVib:VariableVibration = new VariableVibration(image, "z", 0.99, 0.2, 4);
			zVib.start();
			clipContainer.addChild(image);

			behaviors.push(swarm);
			behaviors.push(zVib);
		}
		
		public function destroy():void
		{
			for each (var behavior : AbstractBehavior in behaviors) 
			{
				behavior.stop();
				behavior.destroy();
				behavior = null;
			}		
			
			behaviors = new Vector.<AbstractBehavior>();
			
			blurRhythm.stop();
			blurRhythm.destroy();
			blurRhythm = null;
		}
	}
}
