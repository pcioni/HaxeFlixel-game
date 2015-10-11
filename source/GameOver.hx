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
		new FlxText(
		txt_title = new FlxText(0, 20, 0, _win ? "You win!" : "Game Over!", 22);
		txt_title.alignment = "center";
		txt_title.screenCenter(true, false);
		add(txt_title);
		
		btn_mainMenu = new FlxButton(0, FlxG.height - 32, "Play again", switchStates);
		btn_mainMenu.screenCenter(true, false);
		add(btn_mainMenu);
		
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
		
		txt_title = FlxDestroyUtil.destroy(txt_title);
		
	}
	
}