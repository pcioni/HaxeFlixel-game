package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxPoint;
import flixel.util.FlxSpriteUtil;
import flixel.FlxState;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import openfl.Assets;
import flixel.tile.FlxTilemap;
import openfl.display.BlendMode;


/**
 * Class for the pentagram. All it knows is it's color!
 */
class Pentagram extends FlxSprite {
	
	public var charged:Bool;

	public function new(X:Float = 0, Y:Float = 0, color:String)  {
		
		super(X, Y);
		
		charged = false;
		
		immovable = true;
		
		loadGraphic("assets/images/pent" + color + ".png", true, 128, 128);
		animation.add("pulse", [0, 1, 2, 3, 4, 5, 4, 3, 2, 1, 0], 5, true);
		animation.play("pulse");
		
		//blend = BlendMode.SCREEN;
		
		//stamp(this, 678, 322);
	}
	
	public function changeColor(color:String):Void {
		if (color != "charged") {
			loadGraphic("assets/images/pent" + color + ".png", true, 128, 128);
			animation.play("pulse");
		}
		
		else {
			charged = true;
			loadGraphic("assets/images/pentCharged.png", true, 128, 128);
			animation.play("pulse");
		}
	}
	
	
	
}