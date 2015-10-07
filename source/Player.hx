package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxSpriteUtil;
import lime.math.Vector2;

class Player extends FlxSprite
{
	public static inline var RUN_SPEED:Int = 120;
	public static inline var PADDING:Int = 40;
	public static inline var LIGHT_R:Int = 128 + 32;
	var parent:PlayState;
	var front = true;
	public var lightOn = false;
	var centerX:Int;
	var centerY:Int; 
	
	public function new(X:Float=0, Y:Float=0, Parent:PlayState) 
	{
		super(X, Y);
		makeGraphic(64, 128);
		//loadGraphic("assets/images/...", true, 64, 128);
		//animation.add("walkLR", .., .., true);
		//animation.add("walkU", .., .., true);
		//animation.add("walkD", .., .., true);
		//animation.add("idleLR", ..);
		//animation.add("idleU", ..);
		//animation.add("idleD", ..);
		drag.set(RUN_SPEED * 8, RUN_SPEED * 8);
		maxVelocity.set(RUN_SPEED*2, RUN_SPEED*2);
		parent = Parent;
		updateHitbox();
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
		if (FlxG.keys.anyPressed(["LEFT", "A"]) && x > PADDING) {
			acceleration.x = -drag.x;
			flipX = true;
		}
		if (FlxG.keys.anyPressed(["RIGHT", "D"]) && x + width < FlxG.width - PADDING) {
			acceleration.x = drag.x;
			flipX = false;
		}
		if (FlxG.keys.anyPressed(["UP", "W"]) && y > PADDING) {
			acceleration.y = -drag.y;
		}
		if (FlxG.keys.anyPressed(["DOWN", "S"]) && y + height < FlxG.height - PADDING) {
			acceleration.y = drag.y;
		}
		//check for input to toggled light
		if (FlxG.keys.justPressed.SPACE) {
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