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
	public static inline var OPTIONS:Int = 2;
	
	var opt0txt:FlxText;
	var opt1txt:FlxText;
	
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

		opt0txt = new FlxText(FlxG.width * 2 / 3, FlxG.height * 2 / 3, 150, "Play the Game");
		opt1txt = new FlxText(FlxG.width * 2 / 3, FlxG.height * 2 / 3 + 30, 150, "Cheat Sheet");
		opt0txt.size = opt1txt.size = 16;
		add(opt0txt);
		add(opt1txt);
		pointer = new FlxSprite();
		pointer.makeGraphic(10, 10, FlxColor.YELLOW);
		pointer.x = opt0txt.x - pointer.width - 10;
		add(pointer);
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
		//set y position of cursor based on option choice
		switch(option) {
		case 0:
			pointer.y = opt0txt.y;
		case 1:
			pointer.y = opt1txt.y;
		}
		
		//listen for keys
		
		if (FlxG.keys.justPressed.UP) {
			option = (option - 1 + OPTIONS) % OPTIONS;
		}
		if (FlxG.keys.justPressed.DOWN) {
			option = (option + 1 + OPTIONS) % OPTIONS;
		}
		if (FlxG.keys.anyJustPressed(["SPACE", "ENTER"])) {
			switch(option) {
			case 0:
				FlxG.state.bgColor = FlxColor.BLACK;
				FlxG.switchState(new PlayState());
			case 1:
				FlxG.openURL("http://haxeflixel.com/documentation/cheat-sheet/");
			}
		}
		super.update();
	}	
}