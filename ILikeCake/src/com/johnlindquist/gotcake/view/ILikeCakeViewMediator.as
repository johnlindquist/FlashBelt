package com.johnlindquist.gotcake.view {
	import mx.events.PropertyChangeEvent;

	import flight.binding.Bind;

	import com.johnlindquist.gotcake.model.FrameState;

	import org.robotlegs.mvcs.Mediator;

	/**
	 * @author John Lindquist
	 */
	public class ILikeCakeViewMediator extends Mediator {

		[Inject]
		public var iLikeCakeView:ILikeCakeView;

		[Inject]
		public var frameState:FrameState;

		override public function onRegister() : void {
			Bind.addListener(onCurrentFrameChange, frameState, "currentFrame");
		}

		private function onCurrentFrameChange(event:PropertyChangeEvent) : void {
			trace("frame", event);
//			iLikeCakeView.gotoAndPlay(frameState.currentFrame);
		}
	}
}
