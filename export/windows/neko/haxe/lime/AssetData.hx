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
			path.set ("assets/data/mapeditor.csv", "assets/data/mapeditor.csv");
			type.set ("assets/data/mapeditor.csv", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/bookshelf.png", "assets/images/bookshelf.png");
			type.set ("assets/images/bookshelf.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
			type.set ("assets/images/images-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/linda.png", "assets/images/linda.png");
			type.set ("assets/images/linda.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/shelf.png", "assets/images/shelf.png");
			type.set ("assets/images/shelf.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/s_candle_12x33.png", "assets/images/s_candle_12x33.png");
			type.set ("assets/images/s_candle_12x33.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/s_die_64x128.png", "assets/images/s_die_64x128.png");
			type.set ("assets/images/s_die_64x128.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/s_p_blue_fade_1_128x128.png", "assets/images/s_p_blue_fade_1_128x128.png");
			type.set ("assets/images/s_p_blue_fade_1_128x128.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/s_p_blue_fade_2_128x128.png", "assets/images/s_p_blue_fade_2_128x128.png");
			type.set ("assets/images/s_p_blue_fade_2_128x128.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/s_p_orange_fade_1_128x128.png", "assets/images/s_p_orange_fade_1_128x128.png");
			type.set ("assets/images/s_p_orange_fade_1_128x128.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/s_p_orange_fade_2_128x128.png", "assets/images/s_p_orange_fade_2_128x128.png");
			type.set ("assets/images/s_p_orange_fade_2_128x128.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/s_p_purple_fade_1_128x128.png", "assets/images/s_p_purple_fade_1_128x128.png");
			type.set ("assets/images/s_p_purple_fade_1_128x128.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/s_p_purple_fade_2_128x128.png", "assets/images/s_p_purple_fade_2_128x128.png");
			type.set ("assets/images/s_p_purple_fade_2_128x128.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/s_p_red_fade_1_128x128.png", "assets/images/s_p_red_fade_1_128x128.png");
			type.set ("assets/images/s_p_red_fade_1_128x128.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/s_p_red_fade_2_128x128.png", "assets/images/s_p_red_fade_2_128x128.png");
			type.set ("assets/images/s_p_red_fade_2_128x128.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/s_read_64x128.png", "assets/images/s_read_64x128.png");
			type.set ("assets/images/s_read_64x128.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/s_run_l_64x128.png", "assets/images/s_run_l_64x128.png");
			type.set ("assets/images/s_run_l_64x128.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/s_run_l_c_64x128.png", "assets/images/s_run_l_c_64x128.png");
			type.set ("assets/images/s_run_l_c_64x128.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/s_run_r_64x128.png", "assets/images/s_run_r_64x128.png");
			type.set ("assets/images/s_run_r_64x128.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/s_run_r_c_64x128.png", "assets/images/s_run_r_c_64x128.png");
			type.set ("assets/images/s_run_r_c_64x128.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/s_shelf_64x129.png", "assets/images/s_shelf_64x129.png");
			type.set ("assets/images/s_shelf_64x129.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/s_stand_64x128.png", "assets/images/s_stand_64x128.png");
			type.set ("assets/images/s_stand_64x128.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/s_wip_cultist_64x128.png", "assets/images/s_wip_cultist_64x128.png");
			type.set ("assets/images/s_wip_cultist_64x128.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
			type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
			type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
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
