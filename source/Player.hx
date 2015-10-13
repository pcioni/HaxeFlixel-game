package;

import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxSpriteUtil;
import lime.math.Vector2;
import flixel.system.FlxSound;
import flixel.util.FlxDestroyUtil;

/**
 * Player class and all associated player functionality
 * 
 */

class Player extends FlxSprite
{
	public static inline var RUN_SPEED:Int = 160;
	public static inline var PADDING:Int = 40;
	var parent:PlayState;
	public var lightOn = false;
	var centerX:Int;
	var centerY:Int; 
	public var touchingShelf:Bool = false;
	public var invulnerable:Bool = true;

		
	private var candleSnd:FlxSound;
	private var stepSnd:FlxSound;
	
	public function new(X:Float=0, Y:Float=0, Parent:PlayState) {
		super(X, Y);

		//makeGraphic(64, 128);
		loadGraphic("assets/images/s_player_64x128.png", true, 64, 128);

		animation.add("walkLR", [32,33,34,35,36,37,38,39], 15, false);
		animation.add("walkU", [48, 49, 50, 51, 52, 53, 54], 15, false);
		animation.add("walkD", [16, 17,18, 19, 20 ,21, 22, 23], 15, false);
		animation.add("idleLR", [5], 1, false);
		animation.add("idleU", [4], 1, false);
		animation.add("idleD", [3], 1, false);
		animation.add("death", [0, 1, 2], 1, false);

		drag.set(RUN_SPEED * 9, RUN_SPEED * 9);
		maxVelocity.set(RUN_SPEED * 2, RUN_SPEED * 2);
		health = 100;
		facing = FlxObject.RIGHT;
		parent = Parent;
		updateHitbox();
		touchingShelf = false;
		
		candleSnd = FlxG.sound.load(AssetPaths.candle__wav);
		stepSnd = FlxG.sound.load(AssetPaths.step__wav);
	}
	
	public function getCenter():Vector2 {
		return new Vector2(centerX, centerY);
	}
	
	override public function destroy():Void {
		
		candleSnd = FlxDestroyUtil.destroy(candleSnd);	
		stepSnd = FlxDestroyUtil.destroy(stepSnd);
		super.destroy();
	}
	
	public override function update():Void {
		//reset the accelration each update so the player doesn't continually move in one direction
		acceleration.x = 0;
		acceleration.y = 0;
		
		//check inputs and assign corresponding acceleration
		if (alive){
		if (FlxG.keys.anyPressed(["LEFT", "A"])) {
			if (x > PADDING) {
				stepSnd.play(true);
				acceleration.x = -drag.x;
				flipX = true;
				facing = FlxObject.LEFT;
			}
			else { x = PADDING; }
		}
		if (FlxG.keys.anyPressed(["RIGHT", "D"])) {
			if (x + width < FlxG.width - PADDING) {
				stepSnd.play(true);
				acceleration.x = drag.x;
				flipX = false;
				facing = FlxObject.RIGHT;
			}
			else { x = FlxG.width - PADDING - width; }
		}
		if (FlxG.keys.anyPressed(["UP", "W"])) {
			if (y > PADDING) {
				stepSnd.play(true);
				acceleration.y = -drag.y;
				facing = FlxObject.UP;
			}
			else { y = PADDING; }
		}
		if (FlxG.keys.anyPressed(["DOWN", "S"])) {
			if (y + height < FlxG.height - PADDING) {
				stepSnd.play(true);
				acceleration.y = drag.y;
				facing = FlxObject.DOWN;
			}
			else { y = FlxG.height - PADDING - height; }
		}
		
		//check for input to toggled light
		if (FlxG.keys.anyPressed(["E"])) {
			if (touchingShelf == true) { 
				trace("Touching shelf & interacting"); 
			}
			else {
				trace("Not touching shelf & interacting");  
			}
		}
		if (FlxG.keys.justPressed.SPACE) {
			candleSnd.play(true);
			if (!lightOn) { lightOn = true; }
			else { lightOn = false; }
		}
		
		//check velocities to play corresponding animations
		if (velocity.x != 0) {
			if (velocity.y > 0) {
				animation.play("walkD");
			}
			else if (velocity.y < 0) {
				animation.play("walkU");
			}
			else { 
				animation.play("walkLR");
			}
		}
		else {
			if (velocity.y > 0) {
				animation.play("walkD");
			}
			else if (velocity.y < 0) {
				animation.play("walkU");
			}
			else {
				switch(facing) {
					case FlxObject.DOWN:
						animation.play("idleD");
					case FlxObject.UP:
						animation.play("idleU");
					default:
						animation.play("idleLR");
				}
			}
		}
		}
		//set center of sprite
		centerX = Std.int(x + width/2);
		centerY = Std.int(y + height/2);
		super.update();
		
	}
	override public function kill():Void
	{
		  if (!alive || !exists)
		  {
			return;
		  }
		  alive = false;
		  animation.play("death", true);
		  
		 
	}
	
}