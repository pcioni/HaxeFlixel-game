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
 * Light class that contains and draws the 3 circles of the light.
 */
class Light extends FlxSprite
{
	public static inline var LIGHT_R:Int = 160;
	public static inline var CANVAS_SIZE:Int = LIGHT_R * 6;
	
	private var darkness:FlxSprite;
	
	public function new(X:Int, Y:Int, Darkness:FlxSprite, Parent:PlayState) 
	{
		super(X, Y);
		
		loadGraphic("assets/images/light.png", false, 400, 400);
		scale.set(2.0,2.0);
		
		this.darkness = Darkness;
		this.blend = BlendMode.SCREEN;
		
		
		this.kill();
	}
	
	override public function draw():Void {
		var screenXY:FlxPoint = getScreenXY();
		
		darkness.stamp(this, Std.int(screenXY.x - this.width / 2), Std.int(screenXY.y - this.height / 2));
	}
	
}