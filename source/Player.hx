package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
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
		drag.set(RUN_SPEED * 8, RUN_SPEED * 8);
		maxVelocity.set(RUN_SPEED*2, RUN_SPEED*2);
		parent = Parent;
		updateHitbox();
		touchingShelf = false;
	}
	
	public override function update():Void {
		//reset the accelration each update so the player doesn't continually move in one direction
		acceleration.x = 0;
		acceleration.y = 0;
		if ( x > 10 && x + width < 1270 && y > 10 && y + height < 758) {
			//check inputs and assign corresponding acceleration
			if (FlxG.keys.anyPressed(["LEFT", "A"])) {
				acceleration.x = -drag.x;
				flipX = true;
			}
			if (FlxG.keys.anyPressed(["RIGHT", "D"])) {
				acceleration.x = drag.x;
				flipX = false;
			}
			if (FlxG.keys.anyPressed(["UP", "W"])) {
				acceleration.y = -drag.y;
			}
			if (FlxG.keys.anyPressed(["DOWN", "S"])) {
				acceleration.y = drag.y;
			}
			if (FlxG.keys.anyPressed(["E", "SPACE"])) {
				if (touchingShelf == true) { 
					trace("Touching shelf & interacting"); 
				}
				else {
					trace("Not touching shelf & interacting");  
				}
			}
		}
		if (x <= 10) { x = 11; }
		if (x + width >= 1270) { x = 1271 - width; }
		if (y <= 10) { y = 11; }
		if (y + height >= 758) { y = 759 - height; }
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
		
		super.update();
		
	}
	
}