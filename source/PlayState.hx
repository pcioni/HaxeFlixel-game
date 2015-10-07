package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxSpriteUtil;
import flixel.FlxState;
import flixel.group.FlxTypedGroup;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.ui.FlxBar;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import openfl.Assets;
import flixel.tile.FlxTilemap;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState {
	
	var player:Player;
	var testShelf:Shelf;
	var testShelf2:Shelf;
	var lastHitShelf:Shelf;
	var readBar:FlxBar;
	var light:Light;
	
	private var shelfGroup:FlxTypedGroup<Shelf>;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void {
		
		/*
		 * Function that creates the reading bar
		*/
		
		FlxG.state.bgColor = FlxColor.CHARCOAL;
		
		FlxG.debugger.visible;
		shelfGroup = new FlxTypedGroup<Shelf>();
		add(shelfGroup);
	
		add(player = new Player(150, 50, this));
		add(testShelf = new Shelf(250, 50, this));
		add(testShelf2 = new Shelf(210, 200, this));
		light = new Light(this);
		
		//keep track of the last shelf we interacted with
		lastHitShelf = testShelf;
		
		//The "read bar". dissapears when not in use. Follows the player's head when in use. Tracks the elapsed time on the shelf timer.
		add( readBar = new FlxBar(50, 50, FlxBar.FILL_LEFT_TO_RIGHT, 150, 20, player, "testShelf.timer.progress", 0.0, 5.0, true) );
		readBar.trackParent(-47, -30);
		readBar.exists = false;
		readBar.alive = false;
		
		shelfGroup.add(testShelf);
		shelfGroup.add(testShelf2);
		
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void {
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		//Clears the light for next drawing
		light.clear();
		//Checks if the light is toggled on then draws the light
		if (player.lightOn) {
			light.draw(player.getCenter().x, player.getCenter().y, player.getLRadius());
		}
		
		// check if we're colliding with any shelf in our shelf group.
		// if we do, call playerTouchShelf.
		if ( FlxG.overlap(player, shelfGroup, playerTouchShelf) ) {
			player.touchingShelf = true;
		}
		else {
			player.touchingShelf = false;
			readBar.kill();
			lastHitShelf.stopTimer();
		}
		
		super.update();
	}	
	
	private function playerTouchShelf(P:Player, S:Shelf):Void {
		lastHitShelf = S;
		readBar.currentValue = S.timer.elapsedTime;
		S.startTimer();
		readBar.alive = true;
		readBar.exists = true;
	}
	
}