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
	var circleIn:FlxSprite;
	var circleMid:FlxSprite;
	var circleOut:FlxSprite;
	
	public function new(Parent:PlayState) 
	{
		circleIn = new FlxSprite();
		circleMid = new FlxSprite();
		circleOut = new FlxSprite();
		circleIn.makeGraphic(FlxG.width, FlxG.height, FlxColor.TRANSPARENT, true);
		circleMid.makeGraphic(FlxG.width, FlxG.height, FlxColor.TRANSPARENT, true);
		circleOut.makeGraphic(FlxG.width, FlxG.height, FlxColor.TRANSPARENT, true);
		Parent.add(circleIn);
		Parent.add(circleMid);
		Parent.add(circleOut);
	}
	
	//draws each circle individually to create light effect
	public function draw(X:Float=0, Y:Float=0, R:Float=0):Void
	{
		FlxSpriteUtil.drawCircle(circleIn, X, Y, R, FlxColor.WHITE);
		circleIn.alpha = 0.5;
		FlxSpriteUtil.drawCircle(circleMid, X, Y, R * 2, FlxColor.WHITE);
		circleMid.alpha = 0.25;
		FlxSpriteUtil.drawCircle(circleOut, X, Y, R * 3, FlxColor.WHITE);
		circleOut.alpha = 0.125;
	}
	
	//clears all three circle sprites for new drawing
	public function clear():Void 
	{
		FlxSpriteUtil.fill(circleIn, FlxColor.TRANSPARENT);
		FlxSpriteUtil.fill(circleMid, FlxColor.TRANSPARENT);
		FlxSpriteUtil.fill(circleOut, FlxColor.TRANSPARENT);
	}
	
}