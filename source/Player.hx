package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
<<<<<<< HEAD
/**
 * Player class and all associated player functionality
 * 
 */

class Player extends FlxSprite {
	public static inline var RUN_SPEED:Int = 120;
	var parent:PlayState;
	var front:Bool = true;
	var lightOn:Bool = false;
	var lightTimer:Int = 5;
	public var touchingShelf:Bool = false;
=======
import flixel.util.FlxSpriteUtil;
import lime.math.Vector2;

class Player extends FlxSprite
{
	public static inline var RUN_SPEED:Int = 160;
	public static inline var PADDING:Int = 40;
	public static inline var LIGHT_R:Int = 160;
	var parent:PlayState;
	var front = true;
	public var lightOn = false;
	var centerX:Int;
	var centerY:Int; 
>>>>>>> develop
	
	public function new(X:Float=0, Y:Float=0, Parent:PlayState) {
		super(X, Y);
		makeGraphic(64, 128);
		//loadGraphic("assets/images/...", true, 64, 128);
		//animation.add("walkLR", .., .., true);
		//animation.add("walkU", .., .., true);
		//animation.add("walkD", .., .., true);
		//animation.add("idleLR", ..);
		//animation.add("idleU", ..);
		//animation.add("idleD", ..);
		drag.set(RUN_SPEED * 9, RUN_SPEED * 9);
		maxVelocity.set(RUN_SPEED*2, RUN_SPEED*2);
		parent = Parent;
		updateHitbox();
		touchingShelf = false;
	}
	
	public function getCenter():Vector2 {
		return new Vector2(centerX, centerY);
	}
	
	public function getLRadius():Int {
		return LIGHT_R;
	}
	
	public override function update():Void {
		//reset the accelration each update so the player doesn't continually move in one direction
		acceleration.x = 0;
		acceleration.y = 0;
		
		//check inputs and assign corresponding acceleration
		if (FlxG.keys.anyPressed(["LEFT", "A"])) {
			if (x > PADDING) {
				acceleration.x = -drag.x;
				flipX = true;
			}
			else { x = PADDING; }
		}
		if (FlxG.keys.anyPressed(["RIGHT", "D"])) {
			if (x + width < FlxG.width - PADDING) {
				acceleration.x = drag.x;
				flipX = false;
			}
			else { x = FlxG.width - PADDING - width; }
		}
		if (FlxG.keys.anyPressed(["UP", "W"])) {
			if (y > PADDING) {
				acceleration.y = -drag.y;
			}
			else { y = PADDING; }
		}
		if (FlxG.keys.anyPressed(["DOWN", "S"])) {
			if (y + height < FlxG.height - PADDING) {
				acceleration.y = drag.y;
			}
			else { y = FlxG.height - PADDING - height; }
		}
		//check for input to toggled light
		if (FlxG.keys.anyPressed(["E", "SPACE"])) {
			if (touchingShelf == true) { 
				trace("Touching shelf & interacting"); 
			}
			else {
				trace("Not touching shelf & interacting");  
			}
			if (lightOn) { lightOn = false; }
			else { lightOn = true; } 
		}
		//check velocities to play corresponding animations
		if (velocity.x != 0) {
			if (velocity.y > 0) {
				//animation.play("walkLR_D");
				front = true;
			}
			else if (velocity.y < 0) {
				//animation.play("walkLR_U");
				front = false;
			}
			//animation.play("walkLR");
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