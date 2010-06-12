package com.johnlindquist.flashbelt.view 
{
	import Box2D.Collision.Shapes.b2CircleDef;
	import Box2D.Collision.Shapes.b2PolygonDef;
	import Box2D.Collision.b2AABB;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2DebugDraw;
	import Box2D.Dynamics.b2World;

	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * @author John
	 */
	public class Box2DFlashView extends Sprite 
	{

		public var m_world:b2World;
		public var m_iterations:int = 10;
		public var m_timeStep:Number = 1.0 / 30.0;

		public function Box2DFlashView()
		{
			
			var sprite:Sprite = new Sprite();
			sprite.graphics.beginFill(0xcc0000, .4);
			sprite.graphics.drawRect(-10, -10, 20, 20);
			sprite.graphics.endFill();
			
			// Add event for main loop
			addEventListener(Event.ENTER_FRAME, onEnterFrame, false, 0, true);
			
			
			
			// Creat world AABB
			var worldAABB:b2AABB = new b2AABB();
			worldAABB.lowerBound.Set(-100.0, -100.0);
			worldAABB.upperBound.Set(100.0, 100.0);
			
			// Define the gravity vector
			var gravity:b2Vec2 = new b2Vec2(0.0, 10.0);
			
			// Allow bodies to sleep
			var doSleep:Boolean = true;
			
			// Construct a world object
			m_world = new b2World(worldAABB, gravity, doSleep);
			
			// set debug draw
			var dbgDraw:b2DebugDraw = new b2DebugDraw();
			var dbgSprite:Sprite = new Sprite();
			addChild(dbgSprite);
			dbgDraw.m_sprite = dbgSprite;
			dbgDraw.m_drawScale = 30.0;
			dbgDraw.m_fillAlpha = 0.0;
			dbgDraw.m_lineThickness = 1.0;
			dbgDraw.m_drawFlags = 0xFFFFFFFF;
			m_world.SetDebugDraw(dbgDraw);
			
			
			
			// Vars used to create bodies
			var body:b2Body;
			var bodyDef:b2BodyDef;
			var boxDef:b2PolygonDef;
			var circleDef:b2CircleDef;
			
			
			
			// Add ground body
			bodyDef = new b2BodyDef();
			//bodyDef.position.Set(15, 19);
			bodyDef.position.Set(10, 12);
			//bodyDef.angle = 0.1;
			boxDef = new b2PolygonDef();
			boxDef.SetAsBox(30, 3);
			boxDef.friction = 0.3;
			boxDef.density = 0; // static bodies require zero density
			/*circleDef = new b2CircleDef();
			circleDef.radius = 10;
			circleDef.restitution = 0.2*/
			// Add sprite to body userData
			bodyDef.userData = sprite;
			//bodyDef.userData = new PhysCircle();
			bodyDef.userData.width = 30 * 2 * 30; 
			bodyDef.userData.height = 30 * 2 * 3; 
			addChild(bodyDef.userData);
			body = m_world.CreateBody(bodyDef);
			body.CreateShape(boxDef);
			//body.CreateShape(circleDef);
			body.SetMassFromShapes();
			
			
			
			addToWorld(sprite);
			addToWorld(sprite);
			addToWorld(sprite);
			addToWorld(sprite);
			addToWorld(sprite);
		}

		public function addToWorld(sprite:Sprite):void 
		{
			// Vars used to create bodies
			var body:b2Body;
			var bodyDef:b2BodyDef;
			var boxDef:b2PolygonDef;
			var circleDef:b2CircleDef;
			
			var sprite:Sprite = new Sprite();
			sprite.graphics.beginFill(0xcc0000, .4);
			sprite.graphics.drawRect(-10, -10, 20, 20);
			sprite.graphics.endFill();
	
	
			bodyDef = new b2BodyDef();
			bodyDef.position.x = Math.random() * 15 + 5;
			bodyDef.position.y = Math.random() * 10;
			var rX:Number = Math.random() + 0.5;
			var rY:Number = Math.random() + 0.5;

			circleDef = new b2CircleDef();
			circleDef.radius = rX;
			circleDef.density = 1.0;
			circleDef.friction = 0.5;
			circleDef.restitution = 0.2
			bodyDef.userData = sprite;
			bodyDef.userData.width = rX * 2 * 30; 
			bodyDef.userData.height = rX * 2 * 30; 
			body = m_world.CreateBody(bodyDef);
			body.CreateShape(circleDef);
			body.SetMassFromShapes();
			addChild(bodyDef.userData);
		}

		public function onEnterFrame(e:Event):void
		{
			
			m_world.Step(m_timeStep, m_iterations);
			
			// Go through body list and update sprite positions/rotations
			for (var bb:b2Body = m_world.m_bodyList;bb;bb = bb.m_next)
			{
				if (bb.m_userData is Sprite)
				{
					bb.m_userData.x = bb.GetPosition().x * 30;
					bb.m_userData.y = bb.GetPosition().y * 30;
					bb.m_userData.rotation = bb.GetAngle() * (180 / Math.PI);
				}
			}
		}
	}
}
