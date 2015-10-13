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
	public var myColor:String;
	public var mySequenceNum:Int;
	private var resetTimer:Bool;
	
	
	public function new(X:Float = 0, Y:Float = 0, Parent:PlayState, position:String, color:String) {
		super(X, Y);
		updateHitbox();
		parent = Parent;
		myColor = color;
		resetTimer = false;
		
		
		// Initialize our shelves with proper orientation and hitboxes.
		// Modify our collision box to be a thin pixel line extending from the middle. 
		if (position == "left") {
			loadGraphic("assets/images/" + color + "ShelfLeft.png", true, 90, 128);
			height -= 127;
			offset.y = 60;
		}
		else if (position == "top") {
			loadGraphic("assets/images/" + color + "ShelfTop.png", true, 65, 154);
			width -= 62;
			offset.x = 30;
		}
		else if (position == "bottom") {
			loadGraphic("assets/images/" + color + "ShelfBottom.png", true, 65, 154);
			width -= 62;
			offset.x = 30;	
		}

		// don't move the shelves when we hit them.
		immovable = true;
		
		// initialize our timer and pause it.
		// arg1 is duration, arg2 is callback, arg3 is how many times to loop (0 for infinite).
		timer = new FlxTimer(2.5, readBook, 1) ;
		timer.active = false;
	}
	
	public override function update():Void {
		super.update();
		if (FlxG.keys.anyJustReleased(["E"]) && resetTimer == true) {
			timer.reset();
			timer.active = false;
			resetTimer = false;
		}
	}
	
	// Callback function for timer. 
	// This is called when the timer hits 0.
	public function readBook(Timer:FlxTimer):Void {
		trace("reading mySeq = " + mySequenceNum + " || currSeq = " + PlayState.currentSequence);
		
		if (mySequenceNum == PlayState.currentSequence) {
			trace("changing playstate from " + PlayState.currentSequence + " to " + (PlayState.currentSequence + 1));
			
			if (PlayState.currentSequence == 5) {
				trace("kill state triggered");
				PlayState.pentagram.changeColor("charged");
				PlayState.currentSequence += 1;
			}
			
			else {
				PlayState.currentSequence += 1;
				PlayState.pentagram.changeColor(myColor);
			}
		}
		resetTimer = true;
	}
	
	// Helper functions that pause and resume the timer.
	public function startTimer():Void {
		timer.active = true;
	}
	
	public function stopTimer():Void {
		timer.active = false;
	}

}