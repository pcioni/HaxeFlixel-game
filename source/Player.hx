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
	public static inline var RUN_SPEED:Int = 90;
	var parent:PlayState;
	public var touchingShelf:Bool;
	
	public function new(X:Float=0, Y:Float=0, Parent:PlayState) {
		super(X, Y);
		//makeGraphic(16, 16);
		loadGraphic("assets/images/linda.png", true, 16, 16);
		animation.add("walk", [4, 5, 6, 7], 12, true);
		animation.add("idle", [5]);
		drag.set(RUN_SPEED * 8, RUN_SPEED * 8);
		maxVelocity.set(RUN_SPEED*2, RUN_SPEED*2);
		parent = Parent;
		scale.set(2, 2);
		updateHitbox();
		touchingShelf = false;
	}
	
	public override function update():Void {
		acceleration.x = 0;
		acceleration.y = 0;
		if (FlxG.keys.anyPressed(["LEFT", "A"])) {
			acceleration.x = -drag.x;
			flipX = true;
		}
		if (FlxG.keys.anyPressed(["RIGHT", "D"])) {
			acceleration.x = drag.x;
			flipX = false;
		}
		if (FlxG.keys.anyPressed(["DOWN", "S"])) {
			acceleration.y = drag.y;
			flipX = false;
		}
		if (FlxG.keys.anyPressed(["UP", "W"])) {
			acceleration.y = -drag.y;
			flipX = false;
		}
		if (FlxG.keys.anyPressed(["E", "SPACE"])) {
			if (touchingShelf == true) { trace("Touching shelf & interacting"); }
			else { trace("Not touching shelf & interacting");  }
		}
		if (velocity.x > 0 || velocity.x < 0) {
			animation.play("walk");
		}
		else {
			animation.play("idle");
		}
		
		super.update();
		
	}
	
}