package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.group.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.ui.FlxBar;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxTimer;
import haxe.Timer;
/**
 * The class that all bookshelves derive from.
 * 
 */
class Shelf extends FlxSprite {
	public static inline var RUN_SPEED:Int = 90;
	var parent:PlayState;
	public var timer:FlxTimer;
	
	
	public function new(X:Float = 0, Y:Float = 0, Parent:PlayState, position:String) {
		super(X, Y);
		updateHitbox();
		parent = Parent;
		
		// Initialize our shelves with proper orientation and hitboxes.
		// Modify our collision box to be a thin pixel line extending from the middle. 
		if (position == "left") {
			loadGraphic("assets/images/shelf.png", true, 90, 128);
			height -= 127;
			offset.y = 60;
		}
		else if (position == "top") {
			
		}
		else if (position == "bottom") {
		
		}

		// don't move the shelves when we hit them.
		immovable = true;
		
		// initialize our timer and pause it.
		// arg1 is duration, arg2 is callback, arg3 is how many times to loop (0 for infinite).
		timer = new FlxTimer(5.0, readBook, 1) ;
		timer.active = false;
	}
	
	public override function update():Void {
		super.update();
	}
	
	// Callback function for timer. 
	// This is called when the timer hits 0.
	public function readBook(Timer:FlxTimer):Void {
		trace("read book");
	}
	
	// Helper functions that pause and resume the timer.
	public function startTimer():Void {
		timer.active = true;
	}
	
	public function stopTimer():Void {
		timer.active = false;
	}

}