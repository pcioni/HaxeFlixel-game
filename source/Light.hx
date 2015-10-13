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
	
	private var light:FlxSprite;
	
	public function new(X:Int, Y:Int, Parent:PlayState) 
	{
		super(X, Y);
		makeGraphic(FlxG.width * 2, FlxG.height * 2, FlxColor.BLACK, false);
		updateHitbox();
		scrollFactor.x = scrollFactor.y = 0;
		blend = BlendMode.MULTIPLY;
		alpha = 0.9;
		
		light = new FlxSprite();
		light.loadGraphic("assets/images/light.png", false, 400, 400);
		light.updateHitbox();
		light.scale.set(2.0,2.0);
		light.blend = BlendMode.SCREEN;
		
		this.stamp(light, Std.int(width / 2 - light.width / 2), Std.int(height / 2 - light.height / 2));
		kill();
		
		
		
	}
	
}