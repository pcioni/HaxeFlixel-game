package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.system.FlxSound;
import flixel.util.FlxAngle;
import flixel.util.FlxDestroyUtil;
import flixel.util.FlxPoint;
import flixel.util.FlxRandom;
import flixel.util.FlxVelocity;
using flixel.util.FlxSpriteUtil;
import FSM;

/**
 * ...
 * @author tommy fang
 */
class Monster extends FlxSprite
{
	public var speed:Float = 75;
	public var etype(default, null):Int;
	private var _brain: FSM;
	private var _idleTmr:Float;
	private var _moveDir:Float;
	public var seesPlayer:Bool = false;
	public var randomPos(default, null): FlxPoint;
	public var playerPos(default, null): FlxPoint;
	private var _sndStep:FlxSound;
	private var wandering:Bool = false;
	public var banished:Bool = false;
	var parent:PlayState;
	public function new(X:Float = 0, Y:Float = 0, Parent: PlayState, EType:Int) 
	{
		etype = EType;
		
		super(X, Y);
		//load the monster sprite
		//loadGraphic("assets/images/linda.png", true, 16, 16);
		//animation.add("walk", [4, 5, 6, 7], 12, true);
		makeGraphic(16, 16);
		//animation.add("idle", [5]);
		scale.set(2, 2);
		_brain = new FSM(idle);
		_idleTmr = 0;
		playerPos = FlxPoint.get();
		//put sound here later
		
		
		//makeGraphic(16, 16);
		drag.set(speed * 8, speed * 8);
		maxVelocity.set(speed*2, speed*2);
		parent = Parent;
		
	}
	public function idle():Void
	{
		if (seesPlayer)
		{
			_brain.activeState = chase;
		}
		else if (!seesPlayer)
		{
			_brain.activeState = wander;
		}
		else if (_idleTmr <= 0)
		{
			//_brain.activeState = idle;

			if (FlxRandom.chanceRoll(1))
			{
				_moveDir = -1;
				velocity.x = velocity.y = 0;
			}
			else {
				_moveDir = FlxRandom.intRanged(0, 8) * 45;
				FlxAngle.rotatePoint(speed * .5, 0, 0, 0, _moveDir, velocity);
			}
			_idleTmr = FlxRandom.intRanged(1, 4);
		}
		else
			{
		//	_brain.activeState = wander;
			_idleTmr -= FlxG.elapsed;
			
			trace("time is:" + _idleTmr);
			}
	}
	public function chase():Void
	{
		if (!seesPlayer) {
			
			_brain.activeState = idle;
		}
		else
		{
			FlxVelocity.moveTowardsPoint(this, playerPos, Std.int(speed));
			
		}
	}
	public function wander():Void
	{
		if (seesPlayer)
		{
			_brain.activeState = chase;
		}
		else {
			//var randomX = FlxRandom.intRanged(0, 300);
			//var randomY = FlxRandom.intRanged(0, 400);
			//trace(randomPos);
			//FlxVelocity.moveTowardsPoint(this, randomPos, Std.int(speed));
			generateRandomPoint();

		}
	}
	private function generateRandomPoint():Void {
		if (!wandering) {
			var randomX = FlxRandom.intRanged(0, 1000);
			var randomY = FlxRandom.intRanged(0, 400);
			randomPos = new FlxPoint(randomX, randomY);
			wandering = true;
		}
		else
		{
			var m_pos = this.getMidpoint();
			var dist = m_pos.distanceTo(randomPos);
			if (dist < 20) {
				wandering = false;
			}
		}
		FlxVelocity.moveTowardsPoint(this, randomPos, Std.int(speed));
	}
	public override function draw():Void
	{
	/*	if ((velocity.x != 0 || velocity.y != 0) && touching == FlxObject.NONE) {
				if (Math.abs(velocity.x) > Math.abs(velocity.y)) {
					if (velocity.x < 0)
						facing = FlxObject.LEFT;
					else
						facing = FlxObject.RIGHT;
				}
				else
				{
					if (velocity.y < 0)
						facing = FlxObject.UP;
					else
						facing = FlxObject.DOWN;
				}
				switch(facing)
				{
					case FlxObject.LEFT, FlxObject.RIGHT:
						animation.play("walk");
					case FlxObject.UP:
						animation.play("walk");
					case FlxObject.DOWN:
						animation.play("walk");
				}
			}*/
			super.draw();
	}
	public override function update(): Void {
		if (isFlickering())
			return;
		_brain.update();
		super.update();
		/*if ((velocity.x != 0 || velocity.y != 0) && touching == FlxObject.NONE)
		{
			
		}*/
	}
}