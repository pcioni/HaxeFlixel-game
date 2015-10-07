package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.group.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import js.html.svg.AnimatedBoolean;
/**
 * The class that all bookshelves derive from.
 * 
 */
class Shelf extends FlxSprite {
	public static inline var RUN_SPEED:Int = 90;
	var parent:PlayState;
	
	
	public function new(X:Float = 0, Y:Float = 0, Parent:PlayState) {
		super(X, Y);
		loadGraphic("assets/images/shelf.png", true, 64, 128);
		parent = Parent;
		updateHitbox();
		immovable = true;
	}
	
	public override function update():Void {

		super.update();
	}
	
}