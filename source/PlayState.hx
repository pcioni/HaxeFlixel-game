package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxTypedGroup;
import flixel.text.FlxText;
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
	
	
	private var shelfGroup:FlxTypedGroup<Shelf>;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void {
		FlxG.debugger.visible;
		shelfGroup = new FlxTypedGroup<Shelf>();
		add(shelfGroup);
		
		add(player = new Player(100, 50, this));
		add(testShelf = new Shelf(150, 100, this));
		
		shelfGroup.add(testShelf);
		
		super.create();
	}
	
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
	override public function update():Void {
		super.update();
		
		// check if we're colliding with any shelf in our shelf group.
		// if we do, call playerTouchShelf.
		if ( FlxG.collide(player, shelfGroup) ) {
			player.touchingShelf = true;
			playerTouchShelf(player, testShelf);
			
			//FlxG.overlap(_player, _grpCoins, playerTouchCoin);
			//future method for testing bounding box method of collision
		}	
		else { player.touchingShelf = false; }
	}	
	
	private function playerTouchShelf(P:Player, S:Shelf):Void {
		trace("player colliding with bookshelf");
	}
}