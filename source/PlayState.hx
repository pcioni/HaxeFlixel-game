package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxTypedGroup;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.util.FlxTimer;
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
	var recoveryTime: Int = 200;
	var stunTime: Int = 100;
	
	//boulder var
	var earthquakeTimer: Int;
	var numBoulders:Int;
	
	var tmp:Shelf;
	var lastHitShelf:Shelf;
	
	var readBar:FlxBar;
	var useText:FlxText;
	
	var light:Light;
	var pentaLight:FlxSprite;
	var darkness:FlxSprite;
	
	var won:Bool;
	var ending:Bool;
	
	public static var pentagram:Pentagram;
	
	public static var goalShelves:Array<Shelf>;
	
	var t1:Shelf;
	var t2:Shelf;
	var t3:Shelf;
	var t4:Shelf;
	var t5:Shelf;
	
	private var enemyGroup:FlxTypedGroup<Monster>;
	private var shelfGroup:FlxTypedGroup<Shelf>;
	private var boulderGroup:FlxTypedGroup<Boulder>;
	
	private var bookSnd:FlxSound;
	private var deathSnd:FlxSound;
	private var monsterRoarSnd:FlxSound;
	private var monsterRoarSnd2:FlxSound;

	private var monsterAttackSnd:FlxSound;
	private var quakeSnd:FlxSound;
	
	private var level:FlxTilemap;
	
	public static var currentSequence:Int;
	public static var bookGood:FlxSprite;
	public static var bookBad:FlxSprite;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void {
		
		super.create();
		/*
		level = new FlxTilemap();
		level.loadMap(Assets.getText("assets/data/map.csv"), "assets/data/tile_sheet.png", 64, 64);
		add(level);
		*/
		
		FlxG.state.bgColor = FlxColor.CHARCOAL;
		FlxG.sound.playMusic(AssetPaths.bgm__ogg);
		FlxG.debugger.visible;
		
		//groups
		boulderGroup = new FlxTypedGroup<Boulder>();
		shelfGroup = new FlxTypedGroup<Shelf>();
		enemyGroup = new FlxTypedGroup<Monster>();
		add(shelfGroup);
		add(enemyGroup);
		
		earthquakeTimer = FlxRandom.intRanged(200, 600);
		
		/*
		 * Randomly generate our map.
		 * 	Run from the top right corner to the bottom right corner in a 'U' shape, adding bookshelves 
		 * 	along the way at a set increment. Pick random colors from the list of colors.
		 */
		var x:Int = 1400;
		var y:Int = 13;
		var lastX:Int = 0;
		var init:Bool = true;
		var init2:Bool = true;
		var shelfColors:Array<String> = ["red", "purple", "green", "orange"];
		
		
		/*
		 * Randomly generate our bookshelves in a 'U' pattern
		 */
		while ( x + y < 2450) {
			if (x > 60 && y < 300) {
				add( tmp = new Shelf(x, y, this, "top", FlxRandom.getObject(shelfColors, 0) ) );
				lastX = x;
				x -= 235;
			}
			else if (x < 60 && y < 800) {
				if (init) { 
					y += 260; 
					init = false;
				}
				x = 0;
				add( tmp = new Shelf(x, y, this, "left", FlxRandom.getObject(shelfColors, 0) ) );
				y += 195;
			}
			else {
				if (init2) {
					x = lastX;
					init2 = false;
				}
				y = 805;
				add( tmp = new Shelf(x, y, this, "bottom", FlxRandom.getObject(shelfColors, 0) ) );
				x += 235;
			}
			shelfGroup.add(tmp);
		}
		
		var count:Int = 1;
		var she:Shelf;
		goalShelves = [];
		while (count < 6) {
			she = shelfGroup.getRandom();
			if (she.mySequenceNum == -1) {
				she.mySequenceNum = count;
				goalShelves.push(she);
 				count += 1;
			}
		}
		
		//MAX BOULDER COUNTER INIT HERE
		var boulderCounter:Int = 6;
		var x_pos = FlxRandom.intRanged(100, 1500);
		var	y_pos = FlxRandom.intRanged(180, 660);

		while (boulderCounter > 0) {
			x_pos = FlxRandom.intRanged(100, 1500);
			y_pos = FlxRandom.intRanged(180, 660);
			spawnBoulders(x_pos, y_pos);
			boulderCounter -= 1;
		}

		/*
		 * These numbers are for testing
		 *
		add( tmp = new Shelf(300, 150, this, "left", FlxRandom.getObject(shelfColors, 0) ) );
		add( t2 = new Shelf(300, 300, this, "left", FlxRandom.getObject(shelfColors, 0) ) );
		add( t3 = new Shelf(300, 450, this, "left", FlxRandom.getObject(shelfColors, 0) ) );
		add( t4 = new Shelf(300, 600, this, "left", FlxRandom.getObject(shelfColors, 0) ) );
		add( t5 = new Shelf(300, 750, this, "left", FlxRandom.getObject(shelfColors, 0) ) );
		
		tmp.mySequenceNum = 1;
		t2.mySequenceNum = 2;
		t3.mySequenceNum = 3;
		t4.mySequenceNum = 4;
		t5.mySequenceNum = 5;
		
		shelfGroup.add(tmp);
		shelfGroup.add(t2);
		shelfGroup.add(t3);
		shelfGroup.add(t4);
		shelfGroup.add(t5); 
		
		goalShelves = [tmp, t2, t3, t4, t5];
		/*
		 * These numbers are for testing
		 */
		
		add(pentagram = new Pentagram(730, 390, tmp.myColor));
		
		currentSequence = 1;
		
		//keep track of the last shelf we interacted with
		lastHitShelf = tmp;

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
		
		light = new Light(0, 0, darkness, this);
		add(light);
		
		pentaLight = new FlxSprite();
		pentaLight.loadGraphic("assets/images/light.png", false, 400, 400);
		pentaLight.blend = BlendMode.SCREEN;
		darkness.stamp(pentaLight, Std.int(pentagram.x - pentaLight.width/2 + 17), Std.int(pentagram.y-pentaLight.height/2 + 17));
		add(darkness);
	
		//The "read bar". dissapears when not in use. Follows the player's head when in use. Tracks the elapsed time on the shelf timer.
		add( readBar = new FlxBar(50, 50, FlxBar.FILL_LEFT_TO_RIGHT, 150, 20, player, "testShelf.timer.progress", 0.0, 1.0, true) );
		readBar.trackParent( -47, -30);
		readBar.kill();
		
		//indicator for detecting shelves
		add( useText = new FlxText(player.x , player.y, 20, "!", 100, false) );
		useText.kill();
		
		add(bookGood = new FlxSprite() ); 
		add(bookBad = new FlxSprite() );
		bookGood.x = 800; bookGood.y = 450;
		bookBad.x = 800; bookGood.y = 450;
		bookGood.loadGraphic("assets/images/openBookGood.png", false, 512, 256);
		bookBad.loadGraphic("assets/images/openBookBad.png", false, 512, 256);
		bookGood.kill(); bookBad.kill();
		
		//health bar 
		healthBar = new FlxBar(0, 0, FlxBar.FILL_RIGHT_TO_LEFT, 150, 20, player, "health", 0.0, 100.0, true);
		healthBar.createFilledBar(FlxColor.BLACK, FlxColor.CRIMSON, true, FlxColor.WHITE);
		add(healthBar);
		healthBar.trackParent( -47, -40);
		
		//adding elements to groups
		enemyGroup.add(monster);
		
		//sounds
		bookSnd = FlxG.sound.load(AssetPaths.book_multiple_pages__ogg);
		deathSnd = FlxG.sound.load(AssetPaths.PC_death__ogg);
		monsterRoarSnd = FlxG.sound.load(AssetPaths.monster_roar_1__ogg);
		monsterRoarSnd2 = FlxG.sound.load(AssetPaths.monster_roar_2__ogg,.5);

		monsterAttackSnd = FlxG.sound.load(AssetPaths.monster_attack__ogg);

		quakeSnd = FlxG.sound.load(AssetPaths.quake__ogg);
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
		if (earthquakeTimer > 0) {
			earthquakeTimer -= 1;
		}
		else {
			Earthquake();
			earthquakeTimer = FlxRandom.intRanged(300, 800);
		}
		if (ending) {
			return;
		}
		if (monster.alive) {
			FlxG.overlap(monster, boulderGroup, enemyTouchBoulder);
			if (monster.stunned = true) {
				monster.speed = 0;
				stunTime -= 1;
			}
			if (stunTime <= 0 ) {
				monster.speed = 60;
				monster.stunned = false;
			}
		}
		
		
		//If the player is alive and gets hit
		if (player.alive) {
			// check if hit recently
			if (player.invulnerable == true) {
				//recoverytimer decrements
				recoveryTime -= 1;
				//reset player invulnerability and timer
				if (recoveryTime <= 0) {
					player.invulnerable = false;
					player.alpha = 1;
					recoveryTime = 200;
				}
			}
			enemyGroup.forEachAlive(checkEnemyVision);
			FlxG.overlap(player, enemyGroup, playerTouchEnemy);
			FlxG.overlap(player, boulderGroup, playerTouchBoulder);

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
				bookBad.kill();
				bookGood.kill();
			}
		}
		else {
			if (player.animation.finished) {
				FlxG.camera.fade(FlxColor.BLACK, .33, false, doneFadeout);
			}
		}
		
		if (pentagram.charged) {
			if (FlxG.overlap(pentagram, monster)) {
				monster.kill();
				monster.solid = false;
				won = true;
				FlxG.camera.fade(FlxColor.BLACK, 3, false, doneFadeout);

			}
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
	
		// move our useText to our players head
		useText.x = player.x + 22;
		useText.y = player.y - 150;

	}	
	

	private function spawnMonster() {
			var randomX = FlxRandom.intRanged(0, 1200);
			var randomY = FlxRandom.intRanged(0, 600);
			var newMonster = new Monster(FlxG.width/2, FlxG.height/2, this, 0);
			add(newMonster);
			enemyGroup.add(newMonster);
	}
	private function randomBoulders(min,max) {
		return FlxRandom.intRanged(min,max);
	}
	private function Earthquake() {
			boulderGroup.kill();
			//boulderGroup = new FlxTypedGroup<Boulder>();
			FlxG.cameras.shake();
			quakeSnd.play(false);
			var randomX = FlxRandom.intRanged(100, 1500);
			var randomY = FlxRandom.intRanged(180, 660);
			numBoulders = randomBoulders(3,6);
			
			while (numBoulders != 0) {
				var cur = boulderGroup.getFirstAvailable();
				randomX = FlxRandom.intRanged(100, 1500);
				randomY = FlxRandom.intRanged(180, 660);
				cur.reset(randomX, randomY);
				//spawnBoulders(randomX, randomY);
				numBoulders -= 1;
			}
	}
	private function spawnBoulders(x, y) {
			var randomFloat = FlxRandom.floatRanged(0.3, .7);
			var newBoulder = new Boulder(x, y, randomFloat, randomFloat, this, 1);
			add(newBoulder);
			boulderGroup.add(newBoulder);
	}

	private function playerTouchShelf(P:Player, S:Shelf):Void {
		if ( FlxG.keys.anyPressed(["E"]) ) {
			bookSnd.play(false);
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
	private function playerTouchBoulder(P:Player, B:Boulder):Void {
		if (P.invulnerable == false) {
			P.hurt(10);
			P.invulnerable = true;
			P.alpha = 0.4;
			B.kill();	
		}
		if (P.health <= 0 ) {
			//if we havent died yet
			P.alpha = 1;
			if (P.alive) {
				//play the death animation
				deathSnd.play(false);
				P.kill();
			}	
			//on completion, switch to end state/cut scene
				
		}
	}
	private function playerTouchEnemy(P:Player, M:Monster):Void
	{
		if (P.invulnerable == false) {
			monsterAttackSnd.play(false);
			P.hurt(34);
			P.invulnerable = true;
			P.alpha = 0.4;	
		}
		if (P.health <= 0 ) {
			//if we havent died yet
			P.alpha = 1;
			if (P.alive) {
				//play the death animation
				deathSnd.play(false);
				P.kill();
			}
			//on completion, switch to end state/cut scene
				
		}
	}
	private function enemyTouchBoulder(M:Monster, B:Boulder):Void
	{
		monsterRoarSnd2.play(false);
		B.kill();
		if (M.stunned == false) {
			M.stunned = true;
			stunTime = 200;
		}
	}
	private function doneFadeout():Void {
		FlxG.switchState(new GameOver(won, 0));	
	}
	private function checkEnemyVision(M:Monster):Void {
		if (M.stunned == false){
			var m_pos = M.getMidpoint();
			var p_pos = player.getMidpoint();
			var dist = m_pos.distanceTo(p_pos);

			//Light radius
			var radius = light.getRadius();
			
			// Each if statement represents the radius of the rings inside the light
			// The outermost loop is the outermost ring
			// The monster constantly checks its position and increases speed as he gets closer to the enemy
			if (player.lightOn) {
				monsterRoarSnd.play(false);
				M.seesPlayer = true;
				M.speed = 80;
				M.playerPos.copyFrom(player.getMidpoint());
				if (dist > radius * 3) {
					M.speed = 110;
					M.playerPos.copyFrom(player.getMidpoint());
				
					if (dist < radius * 3) {
					M.speed = 90;
					M.playerPos.copyFrom(player.getMidpoint());
						
						if (dist < radius * 2) {
							M.speed = 110;			
							M.playerPos.copyFrom(player.getMidpoint());
							
							if (dist < radius) {
								M.speed = 150;
								M.playerPos.copyFrom(player.getMidpoint());
						}
					}
				}
			}
			}
			else {
				M.seesPlayer = false;
			}
		}
	}
	
}