package com.johnlindquist.flashbelt.view {
	import Box2D.Collision.Shapes.b2CircleShape;
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.Joints.b2MouseJoint;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2DebugDraw;
	import Box2D.Dynamics.b2FixtureDef;
	import Box2D.Dynamics.b2World;

	import flight.binding.Bind;

	import com.destroytoday.twitteraspirin.vo.StatusVO;
	import com.johnlindquist.flashbelt.model.TwitterModel;
	import com.johnlindquist.flashbelt.state.FlashBeltTwitterViewState;

	import org.robotlegs.mvcs.Mediator;

	import mx.events.PropertyChangeEvent;

	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;

	/**
	 * @author John Lindquist
	 */
	public class FlashBeltTwitterViewMediator extends Mediator {

		[Inject]
		public var flashBeltTwitterView : FlashBeltTwitterView;

		[Inject]
		public var flashBeltTwitterViewState : FlashBeltTwitterViewState;

		[Inject]
		public var twitterModel : TwitterModel;
		private var clipContainer : Sprite;

		
		override public function onRegister() : void {
			Bind.addListener(onFlashBeltTwitterViewStateChange, flashBeltTwitterViewState, "currentState");				
			Bind.addListener(onSearchResults, twitterModel, "searchResults");				
		}

		private function onFlashBeltTwitterViewStateChange(event : PropertyChangeEvent) : void {
			trace("old state:", event.oldValue, "new state:", event.newValue);
			flashBeltTwitterView.gotoAndPlay("search");
		}

		private function onSearchResults(event : *) : void {
			if(event.newValue) {
				// Add event for main loop
				flashBeltTwitterView.addEventListener(Event.ENTER_FRAME, Update, false, 0, true);
			
				// Define the gravity vector
				var gravity:b2Vec2 = new b2Vec2(0.0, 10.0);
			
				// Allow bodies to sleep
				var doSleep:Boolean = true;
			
				// Construct a world object
				m_world = new b2World( gravity, doSleep);
			
				// set debug draw
				var debugDraw:b2DebugDraw = new b2DebugDraw();
				debugDraw.SetSprite(flashBeltTwitterView);
				debugDraw.SetDrawScale(30.0);
				debugDraw.SetFillAlpha(0.3);
				debugDraw.SetLineThickness(1.0);
				debugDraw.SetFlags(b2DebugDraw.e_shapeBit | b2DebugDraw.e_jointBit);
				m_world.SetDebugDraw(debugDraw);
				m_world.DrawDebugData();
			
			
			
				// Vars used to create bodies
				var body:b2Body;
				var bodyDef:b2BodyDef;
				var boxShape:b2PolygonShape;
				var circleShape:b2CircleShape;
			
			
			
				// Add ground body
				bodyDef = new b2BodyDef();
				//bodyDef.position.Set(15, 19);
				bodyDef.position.Set(10, 12);
				//bodyDef.angle = 0.1;
				boxShape = new b2PolygonShape();
				boxShape.SetAsBox(30, 3);
				var fixtureDef:b2FixtureDef = new b2FixtureDef();
				fixtureDef.shape = boxShape;
				fixtureDef.friction = 0.3;
				fixtureDef.density = 0; // static bodies require zero density
			// Add sprite to body userData
//			bodyDef.userData = new PhysGround();
//			bodyDef.userData.width = 30 * 2 * 30; 
//			bodyDef.userData.height = 30 * 2 * 3; 
//			addChild(bodyDef.userData);
				body = m_world.CreateBody(bodyDef);
			body.CreateFixture(fixtureDef);
			
			// Add some objects
			for each(var statusVO:StatusVO in twitterModel.searchResults)
			{
				var loader : Loader = new Loader();
				var request : URLRequest = new URLRequest(statusVO.user.profileImageURL);
				trace('statusVO.user.profileImageURL: ' + (statusVO.user.profileImageURL));
//				loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadComplete);
				loader.load(request)
				
				bodyDef = new b2BodyDef();
				bodyDef.position.x = Math.random() * 15 + 5;
				bodyDef.position.y = Math.random() * 10;
				var rX:Number = Math.random() + 0.5;
				var rY:Number = Math.random() + 0.5;
				// Box
				if (Math.random() < 0.5){
					boxShape = new b2PolygonShape();
					boxShape.SetAsBox(rX, rY);
					fixtureDef.shape = boxShape;
					fixtureDef.density = 1.0;
					fixtureDef.friction = 0.5;
					fixtureDef.restitution = 0.2;
					bodyDef.userData = loader;
					body = m_world.CreateBody(bodyDef);
					body.CreateFixture(fixtureDef);
				} 
				// Circle
				else {
					circleShape = new b2CircleShape(rX);
					fixtureDef.shape = circleShape;
					fixtureDef.density = 1.0;
					fixtureDef.friction = 0.5;
					fixtureDef.restitution = 0.2;
					bodyDef.userData = loader;
					body = m_world.CreateBody(bodyDef);
					body.CreateFixture(fixtureDef);
				}
				flashBeltTwitterView.addChild(loader);
			}
			}
		}
		
		public function Update(e:Event):void{
			trace("update");
			m_world.Step(m_timeStep, m_velocityIterations, m_positionIterations);
			
			// Go through body list and update sprite positions/rotations
			for (var bb:b2Body = m_world.GetBodyList(); bb; bb = bb.GetNext()){
				trace("user data: ", bb.GetUserData())
				if (bb.GetUserData() is Loader){
					var sprite:Loader = bb.GetUserData() as Loader;
					sprite.x = bb.GetPosition().x * 30;
					sprite.y = bb.GetPosition().y * 30;
					sprite.rotation = bb.GetAngle() * (180/Math.PI);
					trace('bb.GetPosition().x: ' + (bb.GetPosition().x));
				}
			}
			
		}
		
		public var m_world:b2World;
		public var m_velocityIterations:int = 10;
		public var m_positionIterations:int = 10;
		public var m_timeStep:Number = 1.0/30.0;
		

		//		private function onSearchResults(event : PropertyChangeEvent) : void {
		//			
		//			if(event.newValue) {
		//				
		//				for each (var statusVO : StatusVO in twitterModel.searchResults) {
		//					var loader : Loader = new Loader();
		//					var request : URLRequest = new URLRequest(statusVO.user.profileImageURL);
		//					trace('statusVO.user.profileImageURL: ' + (statusVO.user.profileImageURL));
		//					loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadComplete);
		//					loader.load(request)
		//				}
		//				
		//				var bmc : BitmapCanvas = new BitmapCanvas(800, 600);
		//				flashBeltTwitterView.addChild(bmc);
		//				clipContainer = new Sprite();
		//				bmc.startCapture(clipContainer, true);
		//				
		//				var filter:ColorMatrixFilter = new ColorMatrixFilter();
		//				var matrix:Array = new Array();
		//				matrix = matrix.concat([1, 0, 0, 0, 0]); // red
		//				matrix = matrix.concat([0, 0, 0, 0, 0]); // green
		//				matrix = matrix.concat([0, 0, 0, 0, 0]); // blue
		//				matrix = matrix.concat([0, 0, 0, .99, 0]); // alpha
		//				filter.matrix = matrix;
		//				var blurRhythm : FilterRhythm = new FilterRhythm([filter], bmc.bitmap.bitmapData);
		//				blurRhythm.start();
		//			}
		//		}
		//
		//		private function onLoadComplete(event : Event) : void {
		//			var content : DisplayObject = LoaderInfo(event.target).loader.content;
		//			content.x = Math.random() * 500;
		//			content.y = Math.random() * 500;
		//			var swarm : Swarm = new Swarm(content, new Point(800 / 2, 600 / 2), 10, .03, 10);
		//			swarm.start();
		//			//			var xVib : VariableVibration = new VariableVibration(content, "x", 0.99, 0.05, 20);
		//			//			var yVib : VariableVibration = new VariableVibration(content, "y", 0.99, 0.05, 20);
		//			var zVib : VariableVibration = new VariableVibration(content, "z", 0.99, 0.02, 10);
		//			
		//			
		//			//			xVib.start();
		//			//			yVib.start();
		//			zVib.start();
		//			clipContainer.addChild(content);
		//		}
	}
}
