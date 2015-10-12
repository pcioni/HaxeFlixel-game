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
			path.set ("assets/data/map.txt", "assets/data/map.txt");
			type.set ("assets/data/map.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/mapeditor.csv", "assets/data/mapeditor.csv");
			type.set ("assets/data/mapeditor.csv", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/tile_sheet.png", "assets/data/tile_sheet.png");
			type.set ("assets/data/tile_sheet.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
			type.set ("assets/images/images-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/light.png", "assets/images/light.png");
			type.set ("assets/images/light.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/shelf.png", "assets/images/shelf.png");
			type.set ("assets/images/shelf.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/s_bookshelf_64x129.png", "assets/images/s_bookshelf_64x129.png");
			type.set ("assets/images/s_bookshelf_64x129.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/s_heart_32x32.png", "assets/images/s_heart_32x32.png");
			type.set ("assets/images/s_heart_32x32.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/s_heart_64x64.png", "assets/images/s_heart_64x64.png");
			type.set ("assets/images/s_heart_64x64.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/s_pent_charged_128x128.png", "assets/images/s_pent_charged_128x128.png");
			type.set ("assets/images/s_pent_charged_128x128.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/s_pent_orange_128x128.png", "assets/images/s_pent_orange_128x128.png");
			type.set ("assets/images/s_pent_orange_128x128.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/s_pent_purple_128x128.png", "assets/images/s_pent_purple_128x128.png");
			type.set ("assets/images/s_pent_purple_128x128.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/s_pent_red_128x128.png", "assets/images/s_pent_red_128x128.png");
			type.set ("assets/images/s_pent_red_128x128.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/s_player_64x128.png", "assets/images/s_player_64x128.png");
			type.set ("assets/images/s_player_64x128.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
			type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/sounds/book_multiple_pages.wav", "assets/sounds/book_multiple_pages.wav");
			type.set ("assets/sounds/book_multiple_pages.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/book_single_page.wav", "assets/sounds/book_single_page.wav");
			type.set ("assets/sounds/book_single_page.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/book_single_page_2.wav", "assets/sounds/book_single_page_2.wav");
			type.set ("assets/sounds/book_single_page_2.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/candle.wav", "assets/sounds/candle.wav");
			type.set ("assets/sounds/candle.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/magic.wav", "assets/sounds/magic.wav");
			type.set ("assets/sounds/magic.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/monster_attack.wav", "assets/sounds/monster_attack.wav");
			type.set ("assets/sounds/monster_attack.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/monster_roar_1.wav", "assets/sounds/monster_roar_1.wav");
			type.set ("assets/sounds/monster_roar_1.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/monster_roar_2.wav", "assets/sounds/monster_roar_2.wav");
			type.set ("assets/sounds/monster_roar_2.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/monster_roar_3.wav", "assets/sounds/monster_roar_3.wav");
			type.set ("assets/sounds/monster_roar_3.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/monster_roar_4.wav", "assets/sounds/monster_roar_4.wav");
			type.set ("assets/sounds/monster_roar_4.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/PC_death.wav", "assets/sounds/PC_death.wav");
			type.set ("assets/sounds/PC_death.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/quake.wav", "assets/sounds/quake.wav");
			type.set ("assets/sounds/quake.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/quake_bookshelf_crack.wav", "assets/sounds/quake_bookshelf_crack.wav");
			type.set ("assets/sounds/quake_bookshelf_crack.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
			type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/sounds/step.wav", "assets/sounds/step.wav");
			type.set ("assets/sounds/step.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
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
