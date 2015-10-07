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
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	var player:Player;
	var canvas:FlxSprite;
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		FlxG.state.bgColor = FlxColor.CHARCOAL;
		add(player = new Player(100, 50, this));
		canvas = new FlxSprite();
		canvas.makeGraphic(FlxG.width, FlxG.height, FlxColor.TRANSPARENT, true);
		add(canvas);
		super.create();
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		FlxSpriteUtil.fill(canvas, FlxColor.TRANSPARENT);
		if (player.lightOn) {
			var lineStyle = { thickness: 0.0, color: FlxColor.TRANSPARENT };
			var fillStyle = {hasFill: true, color: FlxColor.YELLOW, alpha: 0.00 };
			FlxSpriteUtil.drawCircle(canvas, player.getCenter().x, player.getCenter().y, player.getLRadius(), FlxColor.TRANSPARENT, lineStyle, fillStyle);
		}
		super.update();
	}	
}