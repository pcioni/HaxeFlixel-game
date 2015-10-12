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


/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState {
	
	var player:Player;
	var monster:Monster;
	var healthBar:FlxBar;
	
	var testShelf:Shelf;
	var testShelf2:Shelf;
	var testShelf3:Shelf;
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
		//level.loadMap(Assets.getText("assets/data/map.csv"), "assets/data/tile_sheet.png", 64, 64);
		//add(level);
		
		FlxG.state.bgColor = FlxColor.CHARCOAL;
	
		FlxG.debugger.visible;
		
		//groups
		shelfGroup = new FlxTypedGroup<Shelf>();
		enemyGroup = new FlxTypedGroup<Monster>();
		add(shelfGroup);
		add(enemyGroup);
	
		//shelves
		add(testShelf = new Shelf(250, 400, this, "left", "red"));
		add(testShelf2 = new Shelf(210, 200, this, "bottom", "purple"));
		add(testShelf3 = new Shelf(280, 600, this, "top", "brown"));
		
		//monster
		add(monster = new Monster(600, 600, this, 0));
		
		//player
		add(player = new Player(150, 50, this));
		
		//light
		darkness = new FlxSprite();
		darkness.makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK, false);
		darkness.scrollFactor.x = darkness.scrollFactor.y = 0;
		darkness.blend = BlendMode.MULTIPLY;
		darkness.alpha = 0.9;
		
		light = new Light(0, 0, darkness, this);
		add(light);
		add(darkness);
		
		//keep track of the last shelf we interacted with
		lastHitShelf = testShelf;
		
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
		shelfGroup.add(testShelf);
		shelfGroup.add(testShelf2);
		
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
			light.reset(player.getCenter().x, player.getCenter().y);
		}
		else { light.kill(); }
		
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
	
	//redraw the darkness
	override public function draw():Void {
		FlxSpriteUtil.fill(darkness, FlxColor.BLACK);
		super.draw();
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