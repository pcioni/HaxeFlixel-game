package;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.FlxState;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxDestroyUtil;
import flixel.util.FlxSave;
using flixel.util.FlxSpriteUtil;
/**
 * ...
 * @author tommy fang
 */
class GameOver extends FlxState
{
	private var _score:Int = 0;
	private var _win:Bool;
	private var txt_title:FlxText;
	private var spr_score:FlxSprite;
	private var	btn_mainMenu:FlxButton;
	private var index:Int = 0;
	private var end:FlxSprite;
	private var credits:FlxSprite;
	public function new(win:Bool, score:Int) 
	{
		_win = win;
		_score = score;
		super();
	}
	public override function create():Void
	{
		#if !FLX_NO_MOUSE
		FlxG.mouse.visible = true;
		#end
		end = new FlxSprite(0, 30, 'assets/images/s_end_1600x900.png');
		credits = new FlxSprite(0, 30, 'assets/images/s_credits_1600x900.png');
	
		if (_win) {
			add(end);
		}
		else {
			add(credits);
		}
		FlxG.camera.fade(FlxColor.BLACK, .33, true);
		super.create();
		
	}
	private function switchStates():Void
	{
		FlxG.camera.fade(FlxColor.BLACK, .33, false, function() {
			FlxG.switchState(new PlayState());
		});
	}
	override public function destroy():Void
	{
		super.destroy();
		
		
	}
	override public function update():Void
	{
		if (FlxG.keys.anyJustPressed(["SPACE", "ENTER"])) {
			
			switch(index) {
				case 0:
					if (_win) {
						index++;
						add(credits);
					}
					else {
						FlxG.switchState(new MenuState());
					}

				case 1:
					FlxG.switchState(new MenuState());
				}
		
		}
		super.update();
	}
}