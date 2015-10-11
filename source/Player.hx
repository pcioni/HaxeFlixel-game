package;

import flixel.FlxSprite;
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
	var front = true;
	public var lightOn = false;
	var centerX:Int;
	var centerY:Int; 
	public var touchingShelf:Bool = false;
		
	private var candleSnd:FlxSound;
	private var stepSnd:FlxSound;
	
	public function new(X:Float=0, Y:Float=0, Parent:PlayState) {
		super(X, Y);
		loadGraphic("assets/images/s_run_r_64x128.png", true, 64, 128);
		animation.add("walkLR", [0,1,2,3,4,5,6,7], 30, false);
		//animation.add("walkU", .., .., true);
		//animation.add("walkD", .., .., true);
		//animation.add("idleLR", ..);
		//animation.add("idleU", ..);
		//animation.add("idleD", ..);
		drag.set(RUN_SPEED * 9, RUN_SPEED * 9);
		maxVelocity.set(RUN_SPEED * 2, RUN_SPEED * 2);
		health = 100;
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
		if (FlxG.keys.anyPressed(["LEFT", "A"])) {
			if (x > PADDING) {
				stepSnd.play(true);
				acceleration.x = -drag.x;
				flipX = true;
			}
			else { x = PADDING; }
		}
		if (FlxG.keys.anyPressed(["RIGHT", "D"])) {
			if (x + width < FlxG.width - PADDING) {
				stepSnd.play(true);
				acceleration.x = drag.x;
				flipX = false;
			}
			else { x = FlxG.width - PADDING - width; }
		}
		if (FlxG.keys.anyPressed(["UP", "W"])) {
			if (y > PADDING) {
				stepSnd.play(true);
				acceleration.y = -drag.y;
			}
			else { y = PADDING; }
		}
		if (FlxG.keys.anyPressed(["DOWN", "S"])) {
			if (y + height < FlxG.height - PADDING) {
				stepSnd.play(true);
				acceleration.y = drag.y;
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
				animation.play("walkLR");
				front = true;
			}
			else if (velocity.y < 0) {
				animation.play("walkLR");
				front = false;
			}
			animation.play("walkLR");
		}
		else {
			if (velocity.y > 0) {
				//animation.play("walkD");
				front = true;
			}
			else if (velocity.y < 0) {
				//animation.play("walkU");
				front = false;
			}
			else {
				if (front) {
					//animation.play("idleD");
				}
				else {
					//animation.play("idleU");
				}
			}
		}
		//set center of sprite
		centerX = Std.int(x + width/2);
		centerY = Std.int(y + height/2);
		super.update();
		
	}
	
}