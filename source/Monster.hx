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
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.util.FlxTimer;
import haxe.Timer;
using flixel.util.FlxSpriteUtil;
import FSM;

/**
 * ...
 * @author tommy fang
 */
class Monster extends FlxSprite
{
	public var speed:Float = 60;
	public var etype(default, null):Int;
	
	private var _brain: FSM;
	private var idleTimer:Float;
	private var stunTimer:Int;
	private var _moveDir:Float;
	
	
	public var randomPos(default, null): FlxPoint;
	public var playerPos(default, null): FlxPoint;
	public var lastSeenPlayerPos(default, null): FlxPoint;
	private var playerSeen:Bool = false;
	private var _sndStep:FlxSound;
	
	public var seesPlayer:Bool = false;
	private var wandering:Bool = false;
	public var stunned:Bool = false;
	public var banished:Bool = false;
	
	var parent:PlayState;
	
	public function new(X:Float = 0, Y:Float = 0, Parent: PlayState, EType:Int) 
	{
		etype = EType;
		
		super(X, Y);
		//load the monster sprite
		loadGraphic("assets/images/s_monster_128x128.png", true, 128, 128);
		animation.add("walkLR", [48, 49, 50], 1, true);
		animation.add("walkU", [32, 33, 34], 1, true);
		animation.add("walkD", [40, 41, 42], 1, true);
		animation.add("death", [0, 1, 2, 3, 4, 8, 9, 10, 11, 12, 16, 17, 18, 19, 20, 21, 24], 6, false);
		//makeGraphic(16, 16);
		animation.add("idle", [40]);
		scale.set(2, 2);
		_brain = new FSM(idle);
		idleTimer = 0;
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
		else if (idleTimer <= 0)
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
			idleTimer = FlxRandom.intRanged(1, 4);
		}
		else
			{
		//	_brain.activeState = wander;
			idleTimer -= FlxG.elapsed;
			
			//trace("time is:" + idleTimer);
			}
		}
	
	public function chase():Void
	{
		if (!seesPlayer ) {
			
			_brain.activeState = idle;
		}
		else
		{
			FlxVelocity.moveTowardsPoint(this, playerPos, Std.int(speed));
			lastSeenPlayerPos = playerPos;
			playerSeen = true;
			//FlxTween.tween(this, { x:100, y:200 }, 3.0, { ease: FlxEase.quadInOut, complete: myCallback });

			
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
			if (playerSeen) {
				FlxVelocity.moveTowardsPoint(this, lastSeenPlayerPos, Std.int(speed));
				var m_pos = this.getMidpoint();
				var dist = m_pos.distanceTo(lastSeenPlayerPos);
				if (dist < 10) {
					playerSeen = false;
					generateRandomPoint();
				}
			}
			else {
			generateRandomPoint();
			}
			//FlxTween.tween(this, { x:randomX, y:randomY }, 3.0, { ease: FlxEase.quadInOut } );
			//FlxTween.cubicMotion(this, 0, 0, 500, 100, 400, 200, 100, 100, 2, { ease: FlxEase.quadInOut, type: FlxTween.LOOPING });
		}
	}
	//generate a random point while wandering
	
	private function generateRandomPoint():Void {
		var randomX = FlxRandom.intRanged(0, 1200);
		var randomY = FlxRandom.intRanged(0, 600);

		if (!wandering) {
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
		//FlxTween.tween(this, { x:200, y:600 }, 3.0, { ease: FlxEase.quadInOut, type: FlxTween.PINGPONG});

		FlxVelocity.moveTowardsPoint(this, randomPos, Std.int(speed));
	}

	public override function draw():Void {
		if (alive) {
			if (velocity.x != 0) {
				
				if (velocity.x > 0) {
					facing = FlxObject.RIGHT;
					flipX = true;

					animation.play("walkLR");
				}
				else if (velocity.x < 0) {
					facing = FlxObject.LEFT;
					flipX = false;

					animation.play("walkLR");
					}
				
			}
			else {
				if (velocity.y > 0) {
					facing = FlxObject.DOWN;
					animation.play("walkD");
				}
				else if (velocity.y < 0) {
					facing = FlxObject.UP;
					animation.play("walkU");
				}
				else {
					animation.play("idle");
				}
			}
		}

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
	
	override public function kill():Void {
		alive = false;
		var timer = new FlxTimer(2, winGame, 1);
		if (!alive || !exists) {
			speed = 0;
			animation.play("death");
			return;
		}
		
	}
	
	public function winGame(Timer:FlxTimer):Void {
		FlxG.switchState(new GameOver(true,100));
	}
}