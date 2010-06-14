package com.johnlindquist.flashbelt.view 
{
	import Box2D.Collision.Shapes.b2CircleDef;
	import Box2D.Collision.Shapes.b2PolygonDef;
	import Box2D.Collision.Shapes.b2Shape;
	import Box2D.Collision.b2AABB;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.Joints.b2MouseJoint;
	import Box2D.Dynamics.Joints.b2MouseJointDef;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2DebugDraw;
	import Box2D.Dynamics.b2World;

	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;

	/**
	 * @author John
	 */
	public class Box2DFlashView extends Sprite 
	{

		private var world:b2World;
		private const WORLD_SCALE:Number = 30.0;
		private var iterations:int = 10;
		private var timeStep:Number = 1.0 / 30.0;
		private var mousePVec:b2Vec2 = new b2Vec2();
		private var mouseJoint:b2MouseJoint;
		private var mouseXWorldPhys:Number;
		private var mouseYWorldPhys:Number;
		private var isMouseDown:Boolean = false;

		private function onMouseDown(e:MouseEvent):void
		{
			isMouseDown = true;
		};

		private function onMouseUp(e:MouseEvent):void
		{
			isMouseDown = false;
		};

		private function updateMouseWorld():void
		{
			mouseXWorldPhys = mouseX / WORLD_SCALE; 
			mouseYWorldPhys = mouseY / WORLD_SCALE; 
		}

		private function mouseDrag():void
		{
			// mouse press
			if (isMouseDown && !mouseJoint)
			{
 
				//refer to 'getBodyAtMouse()' below
				var body:b2Body = getBodyAtMouse();
 
				if (body)
				{
					var md:b2MouseJointDef = new b2MouseJointDef();
					md.body1 = world.m_groundBody;
					md.body2 = body;
					md.target = new b2Vec2(mouseXWorldPhys, mouseYWorldPhys);
					md.maxForce = 300.0 * body.m_mass;
					md.timeStep = timeStep;
					mouseJoint = world.CreateJoint(md) as b2MouseJoint;
					body.WakeUp();
				}
			}
 
			// mouse release
			if (!isMouseDown)
			{
				if (mouseJoint)
				{
					world.DestroyJoint(mouseJoint);
					mouseJoint = null;
				}
			}
 
 
			// mouse move
			if (mouseJoint)
			{
				var p2:b2Vec2 = new b2Vec2(mouseXWorldPhys, mouseYWorldPhys);
				mouseJoint.m_target = p2;
			} 
		}

		public function getBodyAtMouse(isStaticIncluded:Boolean = false):b2Body
		{
			// Make a small box.
			mousePVec = new b2Vec2(mouseXWorldPhys, mouseYWorldPhys);
			var aabb:b2AABB = new b2AABB();
			aabb.lowerBound = new b2Vec2(mouseXWorldPhys - 0.001, mouseYWorldPhys - 0.001);
			aabb.upperBound = new b2Vec2(mouseXWorldPhys + 0.001, mouseYWorldPhys + 0.001);
 
			// Query the world for overlapping shapes.
			var maxCount:int = 10;
			var shapes:Array = new Array();
			var count:int = world.Query(aabb, shapes, maxCount);
			var body:b2Body = null;
			for (var i:int = 0;i < count;++i)
			{
				var shape:b2Shape = shapes[i] as b2Shape;
				var inside:Boolean = shape.TestPoint(shape.m_body.GetXForm(), mousePVec);
				if (inside)
				{
					body = shape.m_body;
					break;
				}
			}
			return body;
		}

		public function Box2DFlashView()
		{
			this.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			this.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			
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
			world = new b2World(worldAABB, gravity, doSleep);
			
			// set debug draw
			var dbgDraw:b2DebugDraw = new b2DebugDraw();
			var dbgSprite:Sprite = new Sprite();
			addChild(dbgSprite);
			dbgDraw.m_sprite = dbgSprite;
			dbgDraw.m_drawScale = 30.0;
			dbgDraw.m_fillAlpha = 0.0;
			dbgDraw.m_lineThickness = 1.0;
			dbgDraw.m_drawFlags = 0xFFFFFFFF;
						world.SetDebugDraw(dbgDraw);
			
			
			
			// Vars used to create bodies
			var body:b2Body;
			var bodyDef:b2BodyDef;
			var boxDef:b2PolygonDef;
			
			
			// Add ground body
			bodyDef = new b2BodyDef();
			//bodyDef.position.Set(15, 19);
			bodyDef.position.Set(10, 23);
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
			body = world.CreateBody(bodyDef);
			body.CreateShape(boxDef);
			//body.CreateShape(circleDef);
			body.SetMassFromShapes();
		}

		public function addToWorld(image:DisplayObject):void 
		{
			var imageScale:Number = 3;
			
			var s:Sprite = new Sprite();
			image.width = imageScale * WORLD_SCALE;
			image.height = imageScale * WORLD_SCALE;		
			image.x = -imageScale * .5 * WORLD_SCALE;
			image.y = -imageScale * .5 * WORLD_SCALE;
			s.addChild(image);
			addChild(s);
			
			// Vars used to create bodies
			var body:b2Body;
			var bodyDef:b2BodyDef;
			var boxDef:b2PolygonDef;
			var circleDef:b2CircleDef;
			
			bodyDef = new b2BodyDef();
			bodyDef.position.x = Math.random() * 15 + 5;
			bodyDef.position.y = Math.random() * 10;

			boxDef = new b2PolygonDef();
			boxDef.SetAsBox(imageScale * .5, imageScale * .5);
			boxDef.density = 1.0;
			boxDef.friction = 0.5;
			boxDef.restitution = 0.2;
			bodyDef.userData = s;
			
			body = world.CreateBody(bodyDef);
			body.CreateShape(boxDef);

			body.SetMassFromShapes();
			
			bodyDef.userData.x = body.GetPosition().x * WORLD_SCALE;
			bodyDef.userData.y = body.GetPosition().y * WORLD_SCALE;
			bodyDef.userData.rotation = body.GetAngle() * (180 / Math.PI);
		}

		public function onEnterFrame(e:Event):void
		{
			updateMouseWorld();
			mouseDrag();
			
			world.Step(timeStep, iterations);
			
			// Go through body list and update sprite positions/rotations
			for (var bb:b2Body = world.m_bodyList;bb;bb = bb.m_next)
			{
				if (bb.m_userData is DisplayObject)
				{
					bb.m_userData.x = bb.GetPosition().x * WORLD_SCALE;
					bb.m_userData.y = bb.GetPosition().y * WORLD_SCALE;
					bb.m_userData.rotation = bb.GetAngle() * (180 / Math.PI);
				}
			}
		}

		public function destroy():void 
		{
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			for (var bb:b2Body = world.m_bodyList;bb;bb = bb.m_next)
			{
				if (bb.m_userData is DisplayObject)
				{
					removeChild(bb.m_userData);
					bb.m_userData = null;
					bb = null;
				}
			}
			
			world = null;
		}
	}
}
