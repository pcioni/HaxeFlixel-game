package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxColor;

/**
 * A FlxState which can be used for the game's menu.
 */
class CutSceneState extends FlxState
{
	private var index:Int = 0;
	private var monsterRoarSnd:FlxSound;
	private var magicSnd:FlxSound;
	private var quakeSnd:FlxSound;
	//private var monsterSpeech:FlxSound;

	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		//FlxG.state.bgColor = FlxColor.BLUE;
		var scene1 = new FlxSprite(0, 30, 'assets/images/s_cutscene_1.png');
		
		monsterRoarSnd = FlxG.sound.load(AssetPaths.monster_roar_3__ogg);
		magicSnd = FlxG.sound.load(AssetPaths.magic__ogg);
		quakeSnd = FlxG.sound.load(AssetPaths.quake__ogg);
		monsterSpeech = FlxG.sound.load(AssetPaths.monster_speech__ogg);
		
		add(scene1);
		magicSnd.play(true);
		quakeSnd.play(true);
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
		//listen for keys
		FlxG.camera.shake(0.01);
		if (FlxG.keys.anyJustPressed(["SPACE", "ENTER"])) {
			switch(index) {
			case 0:
				index++;
				//FlxG.camera.fade(FlxColor.BLACK, 1, true, doneFadeIn);
				var scene2 = new FlxSprite(0, 30, 'assets/images/s_cutscene_2.png');
				//monsterSpeech.play(false);
				add(scene2);

			case 1:

				FlxG.switchState(new PlayState());
			}
		}
		super.update();
	}
}