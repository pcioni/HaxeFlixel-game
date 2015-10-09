package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxSpriteUtil;
import flixel.FlxState;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import openfl.Assets;
import flixel.tile.FlxTilemap;

/**
 * Light class that contains and draws the 3 circles of the light.
 */
class Light
{
	public static inline var LIGHT_R:Int = 160;
	public static inline var CANVAS_SIZE:Int = LIGHT_R * 6;
	var circleIn:FlxSprite;
	var circleMid:FlxSprite;
	var circleOut:FlxSprite;
	private var drawn:Bool = false;
	
	public function new(Parent:PlayState) 
	{
		circleIn = new FlxSprite();
		circleMid = new FlxSprite();
		circleOut = new FlxSprite();
		
		circleIn.makeGraphic(CANVAS_SIZE, CANVAS_SIZE, FlxColor.TRANSPARENT, true);
		circleMid.makeGraphic(CANVAS_SIZE, CANVAS_SIZE, FlxColor.TRANSPARENT, true);
		circleOut.makeGraphic(CANVAS_SIZE, CANVAS_SIZE, FlxColor.TRANSPARENT, true);
		
		FlxSpriteUtil.drawCircle(circleIn, -1, -1, LIGHT_R, FlxColor.WHITE);
		circleIn.alpha = 0.5;
		FlxSpriteUtil.drawCircle(circleMid, -1, -1, LIGHT_R * 2, FlxColor.WHITE);
		circleMid.alpha = 0.25;
		FlxSpriteUtil.drawCircle(circleOut, -1, -1, LIGHT_R * 3, FlxColor.WHITE);
		circleOut.alpha = 0.125;
		
		Parent.add(circleIn);
		Parent.add(circleMid);
		Parent.add(circleOut);
		
		circleIn.kill();
		circleMid.kill();
		circleOut.kill();
	}
	
	//draws each circle individually to create light effect
	public function draw(X:Float=0, Y:Float=0):Void
	{
		circleIn.reset(X,Y);
		circleMid.reset(X,Y);
		circleOut.reset(X,Y);
		
	}
	
	//clears all three circle sprites for new drawing
	public function clear():Void 
	{
		circleIn.kill();
		circleMid.kill();
		circleOut.kill();
	}
	
}