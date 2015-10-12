package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxTypedGroup;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.ui.FlxBar;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxDestroyUtil;
import flixel.util.FlxMath;
import flixel.util.FlxSpriteUtil;
import openfl.Assets;
import openfl.display.BlendMode;
import flixel.util.FlxRandom;



/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState {
	
	var player:Player;
	var monster:Monster;
	var healthBar:FlxBar;
	
	var tmp:Shelf;
	var lastHitShelf:Shelf;
	
	var readBar:FlxBar;
	var useText:FlxText;
	
	var light:Light;
	var darkness:FlxSprite;
	
	var won:Bool;
	var ending:Bool;
	
	private var enemyGroup:FlxTypedGroup<Monster>;
	private var shelfGroup:FlxTypedGroup<Shelf>;

	private var bookSnd:FlxSound;
	private var deathSnd:FlxSound;
	private var monsterRoarSnd:FlxSound;
	
	private var level:FlxTilemap;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void {
		
		//level = new FlxTilemap();
		//level.loadMap(Assets.getText("assets/data/map.txt"), "assets/data/tile_sheet.png", 64, 64);
		//add(level);
		
		FlxG.state.bgColor = FlxColor.CHARCOAL;
		FlxG.debugger.visible;
		
		//groups
		shelfGroup = new FlxTypedGroup<Shelf>();
		enemyGroup = new FlxTypedGroup<Monster>();
		add(shelfGroup);
		add(enemyGroup);
		
		
		/*
		 * Randomly generate our map.
		 * 	Run from the top right corner to the bottom right corner in a 'U' shape, adding bookshelves 
		 * 	along the way at a set increment. Pick random colors from the list of colors.
		 */
		var x:Int = 1535;
		var y:Int = 0;
		var init, init2 :Bool = true;
		var shelfColors:Array<String> = ["red", "purple", "brown", "orange"];
		
		while ( x + y < 2450) {
			if (x > 60 && y < 300) {
				add( tmp = new Shelf(x, y, this, "top", FlxRandom.getObject(shelfColors, 0) ) );
				x -= 100;
			}
			else if (x < 60 && y < 800) {
				if (init) { 
					y += 200; 
					init = false;
				}
				x = 0;
				add( tmp = new Shelf(x, y, this, "left", FlxRandom.getObject(shelfColors, 0) ) );
				y += 145;
			}
			else {
				if (init2) {
					x = 150;
					init2 = false;
				}
				y = 805;
				add( tmp = new Shelf(x, y, this, "bottom", FlxRandom.getObject(shelfColors, 0) ) );
				x += 100;
			}
			shelfGroup.add(tmp);
		}
		
		//monster
		add(monster = new Monster(600, 600, this, 0));
		
		//player
		add(player = new Player(800, 450, this));
		
		//light
		darkness = new FlxSprite();
		darkness.makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK, false);
		darkness.scrollFactor.x = darkness.scrollFactor.y = 0;
		darkness.blend = BlendMode.MULTIPLY;
		darkness.alpha = 0.9;
		
		light = new Light(0, 0, this);
		add(light);
		add(darkness);
		
		//keep track of the last shelf we interacted with
		lastHitShelf = tmp;
		
		//The "read bar". dissapears when not in use. Follows the player's head when in use. Tracks the elapsed time on the shelf timer.
		add( readBar = new FlxBar(50, 50, FlxBar.FILL_LEFT_TO_RIGHT, 150, 20, player, "testShelf.timer.progress", 0.0, 1.0, true) );
		readBar.trackParent( -47, -30);
		readBar.exists = false;
		readBar.alive = false;
		
		//indicator for detecting shelves
		add( useText = new FlxText(player.x , player.y, 20, "!", 100, false) );
		useText.exists = false;
		useText.alive = false;
		
		//health bar 
		healthBar = new FlxBar(0, 0, FlxBar.FILL_RIGHT_TO_LEFT, 150, 20, player, "health", 0.0, 100.0, true);
		healthBar.createFilledBar(FlxColor.BLACK, FlxColor.CRIMSON, true, FlxColor.WHITE);
		add(healthBar);
		healthBar.trackParent( -47, -40);
		
		//adding elements to groups
		
		enemyGroup.add(monster);
		
		//sounds
		bookSnd = FlxG.sound.load(AssetPaths.book_multiple_pages__wav);
		deathSnd = FlxG.sound.load(AssetPaths.PC_death__wav);
		monsterRoarSnd = FlxG.sound.load(AssetPaths.monster_roar_1__wav);
		
		super.create();
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void {

		bookSnd = FlxDestroyUtil.destroy(bookSnd);
		deathSnd = FlxDestroyUtil.destroy(deathSnd);
		monsterRoarSnd = FlxDestroyUtil.destroy(monsterRoarSnd);
		
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
		if (ending)
		{
			return;
		}
		
		//Checks if the light is toggled on then draws the light
		if (player.lightOn) {
			light.reset(player.getCenter().x-light.width/2, player.getCenter().y-light.height/2);
			darkness.kill();
		}
		else { 
			light.kill();
			darkness.reset(0, 0);
		}
		
		enemyGroup.forEachAlive(checkEnemyVision);
		FlxG.overlap(player, enemyGroup, playerTouchEnemy);

		// move our useText to our players head
		useText.x = player.x + 22;
		useText.y = player.y - 150;
		
		//ai
		// check if we're colliding with any shelf in our shelf group.
		// if we do, call playerTouchShelf.
		if ( FlxG.overlap(player, shelfGroup, playerTouchShelf) && player.lightOn ) {
			player.touchingShelf = true;
		}
		else {
			player.touchingShelf = false;
			readBar.kill();
			useText.kill();
			lastHitShelf.stopTimer();
		}
	}	
	
	private function playerTouchShelf(P:Player, S:Shelf):Void {
		if ( FlxG.keys.anyPressed(["E"]) ) {
			lastHitShelf = S;
			readBar.currentValue = S.timer.progress;
			S.startTimer();
			readBar.alive = true;
			readBar.exists = true;
		}
		else {
			player.touchingShelf = false;
			lastHitShelf.stopTimer();
			readBar.kill();
			useText.alive = true;
			useText.exists = true;
		}
	}
	private function playerTouchEnemy(P:Player, M:Monster):Void
	{
		P.hurt(20);
		if (P.health == 0) {
			FlxG.camera.fade(FlxColor.BLACK, .33, false, doneFadeout);
		}
	}
	private function doneFadeout():Void {
	FlxG.switchState(new GameOver(won, 0));	
	}
	private function checkEnemyVision(M:Monster):Void {
		var m_pos = M.getMidpoint();
		var p_pos = player.getMidpoint();
		var dist = m_pos.distanceTo(p_pos);
		if (dist < 100 || player.lightOn) {
			M.seesPlayer = true;
			M.playerPos.copyFrom(player.getMidpoint());
		}
		else {
			M.seesPlayer = false;
		}
	}
	
}