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
using flixel.util.FlxSpriteUtil;
import FSM;

/**
 * ...
 * @author tommy fang
 */
class Boulder extends FlxSprite
{
	public var speed:Float = 60;
	public var etype(default, null):Int;
	public var randomPos(default, null): FlxPoint;
	var parent:PlayState;
	
	public function new(X:Float = 0, Y:Float = 0, scaleX:Float = 1, scaleY:Float = 1, Parent: PlayState, EType:Int) 
	{
		
		
		super(X, Y);
		//load the boulder sprite
		loadGraphic("assets/images/boulder.png", true, 160, 128);
		
		scale.set(scaleX,scaleY);
		updateHitbox();

		parent = Parent;
		
	}
	
	//generate a random point while wandering
	
	private function generateRandomPoint():Void {
		var randomX = FlxRandom.intRanged(0, 1200);
		var randomY = FlxRandom.intRanged(0, 600);

	}
	public override function update(): Void {

		super.update();

	}

}