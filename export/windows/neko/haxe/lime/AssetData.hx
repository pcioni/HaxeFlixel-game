package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/data/data-goes-here.txt", "assets/data/data-goes-here.txt");
			type.set ("assets/data/data-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/level.csv", "assets/data/level.csv");
			type.set ("assets/data/level.csv", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/map.csv", "assets/data/map.csv");
			type.set ("assets/data/map.csv", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/mapeditor.csv", "assets/data/mapeditor.csv");
			type.set ("assets/data/mapeditor.csv", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/tile_sheet.png", "assets/data/tile_sheet.png");
			type.set ("assets/data/tile_sheet.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/boulder.png", "assets/images/boulder.png");
			type.set ("assets/images/boulder.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/greenShelfBottom.png", "assets/images/greenShelfBottom.png");
			type.set ("assets/images/greenShelfBottom.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/greenShelfLeft.png", "assets/images/greenShelfLeft.png");
			type.set ("assets/images/greenShelfLeft.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/greenShelfTop.png", "assets/images/greenShelfTop.png");
			type.set ("assets/images/greenShelfTop.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
			type.set ("assets/images/images-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/light.png", "assets/images/light.png");
			type.set ("assets/images/light.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/openBookBad.png", "assets/images/openBookBad.png");
			type.set ("assets/images/openBookBad.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/openBookGood.png", "assets/images/openBookGood.png");
			type.set ("assets/images/openBookGood.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/orangeShelfBottom.png", "assets/images/orangeShelfBottom.png");
			type.set ("assets/images/orangeShelfBottom.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/orangeShelfLeft.png", "assets/images/orangeShelfLeft.png");
			type.set ("assets/images/orangeShelfLeft.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/orangeShelfTop.png", "assets/images/orangeShelfTop.png");
			type.set ("assets/images/orangeShelfTop.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/pentCharged.png", "assets/images/pentCharged.png");
			type.set ("assets/images/pentCharged.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/pentgreen.png", "assets/images/pentgreen.png");
			type.set ("assets/images/pentgreen.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/pentorange.png", "assets/images/pentorange.png");
			type.set ("assets/images/pentorange.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/pentpurple.png", "assets/images/pentpurple.png");
			type.set ("assets/images/pentpurple.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/pentred.png", "assets/images/pentred.png");
			type.set ("assets/images/pentred.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/purpleShelfBottom.png", "assets/images/purpleShelfBottom.png");
			type.set ("assets/images/purpleShelfBottom.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/purpleShelfLeft.png", "assets/images/purpleShelfLeft.png");
			type.set ("assets/images/purpleShelfLeft.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/purpleShelfTop.png", "assets/images/purpleShelfTop.png");
			type.set ("assets/images/purpleShelfTop.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/redShelfBottom.png", "assets/images/redShelfBottom.png");
			type.set ("assets/images/redShelfBottom.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/redShelfLeft.png", "assets/images/redShelfLeft.png");
			type.set ("assets/images/redShelfLeft.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/redShelfTop.png", "assets/images/redShelfTop.png");
			type.set ("assets/images/redShelfTop.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/shelf.png", "assets/images/shelf.png");
			type.set ("assets/images/shelf.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/s_bookshelf_64x129.png", "assets/images/s_bookshelf_64x129.png");
			type.set ("assets/images/s_bookshelf_64x129.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/s_boulder_160x128.png", "assets/images/s_boulder_160x128.png");
			type.set ("assets/images/s_boulder_160x128.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/s_credits_1600x900.png", "assets/images/s_credits_1600x900.png");
			type.set ("assets/images/s_credits_1600x900.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/s_cutscene_1.png", "assets/images/s_cutscene_1.png");
			type.set ("assets/images/s_cutscene_1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/s_cutscene_2.png", "assets/images/s_cutscene_2.png");
			type.set ("assets/images/s_cutscene_2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/s_end_1600x900.png", "assets/images/s_end_1600x900.png");
			type.set ("assets/images/s_end_1600x900.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/s_heart_32x32.png", "assets/images/s_heart_32x32.png");
			type.set ("assets/images/s_heart_32x32.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/s_heart_64x64.png", "assets/images/s_heart_64x64.png");
			type.set ("assets/images/s_heart_64x64.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/s_monster_128x128.png", "assets/images/s_monster_128x128.png");
			type.set ("assets/images/s_monster_128x128.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/s_player_64x128.png", "assets/images/s_player_64x128.png");
			type.set ("assets/images/s_player_64x128.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/s_title_1600x900.png", "assets/images/s_title_1600x900.png");
			type.set ("assets/images/s_title_1600x900.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/s_wip_cultist.png", "assets/images/s_wip_cultist.png");
			type.set ("assets/images/s_wip_cultist.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/music/bgm.ogg", "assets/music/bgm.ogg");
			type.set ("assets/music/bgm.ogg", Reflect.field (AssetType, "music".toUpperCase ()));
			path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
			type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/sounds/book_multiple_pages.ogg", "assets/sounds/book_multiple_pages.ogg");
			type.set ("assets/sounds/book_multiple_pages.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/book_single_page.ogg", "assets/sounds/book_single_page.ogg");
			type.set ("assets/sounds/book_single_page.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/book_single_page_2.ogg", "assets/sounds/book_single_page_2.ogg");
			type.set ("assets/sounds/book_single_page_2.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/candle.ogg", "assets/sounds/candle.ogg");
			type.set ("assets/sounds/candle.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/magic.ogg", "assets/sounds/magic.ogg");
			type.set ("assets/sounds/magic.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/monster_attack.ogg", "assets/sounds/monster_attack.ogg");
			type.set ("assets/sounds/monster_attack.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/monster_roar_1.ogg", "assets/sounds/monster_roar_1.ogg");
			type.set ("assets/sounds/monster_roar_1.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/monster_roar_2.ogg", "assets/sounds/monster_roar_2.ogg");
			type.set ("assets/sounds/monster_roar_2.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/monster_roar_3.ogg", "assets/sounds/monster_roar_3.ogg");
			type.set ("assets/sounds/monster_roar_3.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/monster_roar_4.ogg", "assets/sounds/monster_roar_4.ogg");
			type.set ("assets/sounds/monster_roar_4.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/PC_death.ogg", "assets/sounds/PC_death.ogg");
			type.set ("assets/sounds/PC_death.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/quake.ogg", "assets/sounds/quake.ogg");
			type.set ("assets/sounds/quake.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/quake_bookshelf_crack.ogg", "assets/sounds/quake_bookshelf_crack.ogg");
			type.set ("assets/sounds/quake_bookshelf_crack.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
			type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/sounds/step.ogg", "assets/sounds/step.ogg");
			type.set ("assets/sounds/step.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/beep.ogg", "assets/sounds/beep.ogg");
			type.set ("assets/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/flixel.ogg", "assets/sounds/flixel.ogg");
			type.set ("assets/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/fonts/nokiafc22.ttf", "assets/fonts/nokiafc22.ttf");
			type.set ("assets/fonts/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("assets/fonts/arial.ttf", "assets/fonts/arial.ttf");
			type.set ("assets/fonts/arial.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
