package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxColor;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
	public static inline var OPTIONS:Int = 1;
	
	var opt0txt:FlxText;
	
	var pointer:FlxSprite;
	var option:Int = 0;
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		//FlxG.state.bgColor = FlxColor.BLUE;
		var menuBg = new FlxSprite(0, 30, 'assets/images/s_title_1600x900.png');
		add(menuBg);
		//FlxG.sound.playMusic(AssetPaths.bgm__ogg);

		opt0txt = new FlxText(FlxG.width /2 - 160, FlxG.height * 3/4, 320, "Start");
		opt0txt.size = 64;
		opt0txt.color  = FlxColor.BLACK;
		add(opt0txt);
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
		
		if (FlxG.keys.anyJustPressed(["SPACE", "ENTER"])) {
			switch(option) {
			case 0:
				FlxG.state.bgColor = FlxColor.BLACK;
				FlxG.switchState(new CutSceneState());
			}
		}
		super.update();
	}	
}