package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Future;
import lime.app.Preloader;
import lime.app.Promise;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.text.Font;
import lime.utils.ByteArray;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if (js && html5)
import lime.net.URLLoader;
import lime.net.URLRequest;
#elseif flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if (openfl && !flash)
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_arial_ttf);
		
		#end
		
		#if flash
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		className.set ("assets/data/level.csv", __ASSET__assets_data_level_csv);
		type.set ("assets/data/level.csv", AssetType.TEXT);
		className.set ("assets/data/map.csv", __ASSET__assets_data_map_csv);
		type.set ("assets/data/map.csv", AssetType.TEXT);
		className.set ("assets/data/mapeditor.csv", __ASSET__assets_data_mapeditor_csv);
		type.set ("assets/data/mapeditor.csv", AssetType.TEXT);
		className.set ("assets/data/tile_sheet.png", __ASSET__assets_data_tile_sheet_png);
		type.set ("assets/data/tile_sheet.png", AssetType.IMAGE);
		className.set ("assets/images/boulder.png", __ASSET__assets_images_boulder_png);
		type.set ("assets/images/boulder.png", AssetType.IMAGE);
		className.set ("assets/images/greenShelfBottom.png", __ASSET__assets_images_greenshelfbottom_png);
		type.set ("assets/images/greenShelfBottom.png", AssetType.IMAGE);
		className.set ("assets/images/greenShelfLeft.png", __ASSET__assets_images_greenshelfleft_png);
		type.set ("assets/images/greenShelfLeft.png", AssetType.IMAGE);
		className.set ("assets/images/greenShelfTop.png", __ASSET__assets_images_greenshelftop_png);
		type.set ("assets/images/greenShelfTop.png", AssetType.IMAGE);
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		className.set ("assets/images/light.png", __ASSET__assets_images_light_png);
		type.set ("assets/images/light.png", AssetType.IMAGE);
		className.set ("assets/images/orangeShelfBottom.png", __ASSET__assets_images_orangeshelfbottom_png);
		type.set ("assets/images/orangeShelfBottom.png", AssetType.IMAGE);
		className.set ("assets/images/orangeShelfLeft.png", __ASSET__assets_images_orangeshelfleft_png);
		type.set ("assets/images/orangeShelfLeft.png", AssetType.IMAGE);
		className.set ("assets/images/orangeShelfTop.png", __ASSET__assets_images_orangeshelftop_png);
		type.set ("assets/images/orangeShelfTop.png", AssetType.IMAGE);
		className.set ("assets/images/pentCharged.png", __ASSET__assets_images_pentcharged_png);
		type.set ("assets/images/pentCharged.png", AssetType.IMAGE);
		className.set ("assets/images/pentgreen.png", __ASSET__assets_images_pentgreen_png);
		type.set ("assets/images/pentgreen.png", AssetType.IMAGE);
		className.set ("assets/images/pentorange.png", __ASSET__assets_images_pentorange_png);
		type.set ("assets/images/pentorange.png", AssetType.IMAGE);
		className.set ("assets/images/pentpurple.png", __ASSET__assets_images_pentpurple_png);
		type.set ("assets/images/pentpurple.png", AssetType.IMAGE);
		className.set ("assets/images/pentred.png", __ASSET__assets_images_pentred_png);
		type.set ("assets/images/pentred.png", AssetType.IMAGE);
		className.set ("assets/images/purpleShelfBottom.png", __ASSET__assets_images_purpleshelfbottom_png);
		type.set ("assets/images/purpleShelfBottom.png", AssetType.IMAGE);
		className.set ("assets/images/purpleShelfLeft.png", __ASSET__assets_images_purpleshelfleft_png);
		type.set ("assets/images/purpleShelfLeft.png", AssetType.IMAGE);
		className.set ("assets/images/purpleShelfTop.png", __ASSET__assets_images_purpleshelftop_png);
		type.set ("assets/images/purpleShelfTop.png", AssetType.IMAGE);
		className.set ("assets/images/redShelfBottom.png", __ASSET__assets_images_redshelfbottom_png);
		type.set ("assets/images/redShelfBottom.png", AssetType.IMAGE);
		className.set ("assets/images/redShelfLeft.png", __ASSET__assets_images_redshelfleft_png);
		type.set ("assets/images/redShelfLeft.png", AssetType.IMAGE);
		className.set ("assets/images/redShelfTop.png", __ASSET__assets_images_redshelftop_png);
		type.set ("assets/images/redShelfTop.png", AssetType.IMAGE);
		className.set ("assets/images/shelf.png", __ASSET__assets_images_shelf_png);
		type.set ("assets/images/shelf.png", AssetType.IMAGE);
		className.set ("assets/images/s_bookshelf_64x129.png", __ASSET__assets_images_s_bookshelf_64x129_png);
		type.set ("assets/images/s_bookshelf_64x129.png", AssetType.IMAGE);
		className.set ("assets/images/s_book_512x216.png", __ASSET__assets_images_s_book_512x216_png);
		type.set ("assets/images/s_book_512x216.png", AssetType.IMAGE);
		className.set ("assets/images/s_boulder_160x128.png", __ASSET__assets_images_s_boulder_160x128_png);
		type.set ("assets/images/s_boulder_160x128.png", AssetType.IMAGE);
		className.set ("assets/images/s_cutscene_1.png", __ASSET__assets_images_s_cutscene_1_png);
		type.set ("assets/images/s_cutscene_1.png", AssetType.IMAGE);
		className.set ("assets/images/s_cutscene_2.png", __ASSET__assets_images_s_cutscene_2_png);
		type.set ("assets/images/s_cutscene_2.png", AssetType.IMAGE);
		className.set ("assets/images/s_heart_32x32.png", __ASSET__assets_images_s_heart_32x32_png);
		type.set ("assets/images/s_heart_32x32.png", AssetType.IMAGE);
		className.set ("assets/images/s_heart_64x64.png", __ASSET__assets_images_s_heart_64x64_png);
		type.set ("assets/images/s_heart_64x64.png", AssetType.IMAGE);
		className.set ("assets/images/s_monster_128x128.png", __ASSET__assets_images_s_monster_128x128_png);
		type.set ("assets/images/s_monster_128x128.png", AssetType.IMAGE);
		className.set ("assets/images/s_player_64x128.png", __ASSET__assets_images_s_player_64x128_png);
		type.set ("assets/images/s_player_64x128.png", AssetType.IMAGE);
		className.set ("assets/images/s_title_1600x900.png", __ASSET__assets_images_s_title_1600x900_png);
		type.set ("assets/images/s_title_1600x900.png", AssetType.IMAGE);
		className.set ("assets/images/s_wip_cultist.png", __ASSET__assets_images_s_wip_cultist_png);
		type.set ("assets/images/s_wip_cultist.png", AssetType.IMAGE);
		className.set ("assets/music/bgm.ogg", __ASSET__assets_music_bgm_ogg);
		type.set ("assets/music/bgm.ogg", AssetType.MUSIC);
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		className.set ("assets/sounds/book_multiple_pages.wav", __ASSET__assets_sounds_book_multiple_pages_wav);
		type.set ("assets/sounds/book_multiple_pages.wav", AssetType.SOUND);
		className.set ("assets/sounds/book_single_page.wav", __ASSET__assets_sounds_book_single_page_wav);
		type.set ("assets/sounds/book_single_page.wav", AssetType.SOUND);
		className.set ("assets/sounds/book_single_page_2.wav", __ASSET__assets_sounds_book_single_page_2_wav);
		type.set ("assets/sounds/book_single_page_2.wav", AssetType.SOUND);
		className.set ("assets/sounds/candle.wav", __ASSET__assets_sounds_candle_wav);
		type.set ("assets/sounds/candle.wav", AssetType.SOUND);
		className.set ("assets/sounds/magic.wav", __ASSET__assets_sounds_magic_wav);
		type.set ("assets/sounds/magic.wav", AssetType.SOUND);
		className.set ("assets/sounds/monster_attack.wav", __ASSET__assets_sounds_monster_attack_wav);
		type.set ("assets/sounds/monster_attack.wav", AssetType.SOUND);
		className.set ("assets/sounds/monster_roar_1.wav", __ASSET__assets_sounds_monster_roar_1_wav);
		type.set ("assets/sounds/monster_roar_1.wav", AssetType.SOUND);
		className.set ("assets/sounds/monster_roar_2.wav", __ASSET__assets_sounds_monster_roar_2_wav);
		type.set ("assets/sounds/monster_roar_2.wav", AssetType.SOUND);
		className.set ("assets/sounds/monster_roar_3.wav", __ASSET__assets_sounds_monster_roar_3_wav);
		type.set ("assets/sounds/monster_roar_3.wav", AssetType.SOUND);
		className.set ("assets/sounds/monster_roar_4.wav", __ASSET__assets_sounds_monster_roar_4_wav);
		type.set ("assets/sounds/monster_roar_4.wav", AssetType.SOUND);
		className.set ("assets/sounds/PC_death.wav", __ASSET__assets_sounds_pc_death_wav);
		type.set ("assets/sounds/PC_death.wav", AssetType.SOUND);
		className.set ("assets/sounds/quake.wav", __ASSET__assets_sounds_quake_wav);
		type.set ("assets/sounds/quake.wav", AssetType.SOUND);
		className.set ("assets/sounds/quake_bookshelf_crack.wav", __ASSET__assets_sounds_quake_bookshelf_crack_wav);
		type.set ("assets/sounds/quake_bookshelf_crack.wav", AssetType.SOUND);
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		className.set ("assets/sounds/step.wav", __ASSET__assets_sounds_step_wav);
		type.set ("assets/sounds/step.wav", AssetType.SOUND);
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/beep.ogg", __ASSET__assets_sounds_beep_ogg);
		type.set ("assets/sounds/beep.ogg", AssetType.SOUND);
		className.set ("assets/sounds/flixel.ogg", __ASSET__assets_sounds_flixel_ogg);
		type.set ("assets/sounds/flixel.ogg", AssetType.SOUND);
		className.set ("assets/fonts/nokiafc22.ttf", __ASSET__assets_fonts_nokiafc22_ttf);
		type.set ("assets/fonts/nokiafc22.ttf", AssetType.FONT);
		className.set ("assets/fonts/arial.ttf", __ASSET__assets_fonts_arial_ttf);
		type.set ("assets/fonts/arial.ttf", AssetType.FONT);
		
		
		#elseif html5
		
		var id;
		id = "assets/data/data-goes-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/level.csv";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/map.csv";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/mapeditor.csv";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/tile_sheet.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/boulder.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/greenShelfBottom.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/greenShelfLeft.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/greenShelfTop.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/images-go-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/light.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/orangeShelfBottom.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/orangeShelfLeft.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/orangeShelfTop.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/pentCharged.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/pentgreen.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/pentorange.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/pentpurple.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/pentred.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/purpleShelfBottom.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/purpleShelfLeft.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/purpleShelfTop.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/redShelfBottom.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/redShelfLeft.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/redShelfTop.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/shelf.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/s_bookshelf_64x129.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/s_book_512x216.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/s_boulder_160x128.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/s_cutscene_1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/s_cutscene_2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/s_heart_32x32.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/s_heart_64x64.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/s_monster_128x128.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/s_player_64x128.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/s_title_1600x900.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/s_wip_cultist.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/music/bgm.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/music/music-goes-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/book_multiple_pages.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/book_single_page.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/book_single_page_2.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/candle.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/magic.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/monster_attack.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/monster_roar_1.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/monster_roar_2.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/monster_roar_3.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/monster_roar_4.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/PC_death.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/quake.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/quake_bookshelf_crack.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/sounds-go-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/step.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/beep.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/flixel.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/beep.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/flixel.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/fonts/nokiafc22.ttf";
		className.set (id, __ASSET__assets_fonts_nokiafc22_ttf);
		
		type.set (id, AssetType.FONT);
		id = "assets/fonts/arial.ttf";
		className.set (id, __ASSET__assets_fonts_arial_ttf);
		
		type.set (id, AssetType.FONT);
		
		
		var assetsPrefix = null;
		if (ApplicationMain.config != null && Reflect.hasField (ApplicationMain.config, "assetsPrefix")) {
			assetsPrefix = ApplicationMain.config.assetsPrefix;
		}
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/data/level.csv", __ASSET__assets_data_level_csv);
		type.set ("assets/data/level.csv", AssetType.TEXT);
		
		className.set ("assets/data/map.csv", __ASSET__assets_data_map_csv);
		type.set ("assets/data/map.csv", AssetType.TEXT);
		
		className.set ("assets/data/mapeditor.csv", __ASSET__assets_data_mapeditor_csv);
		type.set ("assets/data/mapeditor.csv", AssetType.TEXT);
		
		className.set ("assets/data/tile_sheet.png", __ASSET__assets_data_tile_sheet_png);
		type.set ("assets/data/tile_sheet.png", AssetType.IMAGE);
		
		className.set ("assets/images/boulder.png", __ASSET__assets_images_boulder_png);
		type.set ("assets/images/boulder.png", AssetType.IMAGE);
		
		className.set ("assets/images/greenShelfBottom.png", __ASSET__assets_images_greenshelfbottom_png);
		type.set ("assets/images/greenShelfBottom.png", AssetType.IMAGE);
		
		className.set ("assets/images/greenShelfLeft.png", __ASSET__assets_images_greenshelfleft_png);
		type.set ("assets/images/greenShelfLeft.png", AssetType.IMAGE);
		
		className.set ("assets/images/greenShelfTop.png", __ASSET__assets_images_greenshelftop_png);
		type.set ("assets/images/greenShelfTop.png", AssetType.IMAGE);
		
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		
		className.set ("assets/images/light.png", __ASSET__assets_images_light_png);
		type.set ("assets/images/light.png", AssetType.IMAGE);
		
		className.set ("assets/images/orangeShelfBottom.png", __ASSET__assets_images_orangeshelfbottom_png);
		type.set ("assets/images/orangeShelfBottom.png", AssetType.IMAGE);
		
		className.set ("assets/images/orangeShelfLeft.png", __ASSET__assets_images_orangeshelfleft_png);
		type.set ("assets/images/orangeShelfLeft.png", AssetType.IMAGE);
		
		className.set ("assets/images/orangeShelfTop.png", __ASSET__assets_images_orangeshelftop_png);
		type.set ("assets/images/orangeShelfTop.png", AssetType.IMAGE);
		
		className.set ("assets/images/pentCharged.png", __ASSET__assets_images_pentcharged_png);
		type.set ("assets/images/pentCharged.png", AssetType.IMAGE);
		
		className.set ("assets/images/pentgreen.png", __ASSET__assets_images_pentgreen_png);
		type.set ("assets/images/pentgreen.png", AssetType.IMAGE);
		
		className.set ("assets/images/pentorange.png", __ASSET__assets_images_pentorange_png);
		type.set ("assets/images/pentorange.png", AssetType.IMAGE);
		
		className.set ("assets/images/pentpurple.png", __ASSET__assets_images_pentpurple_png);
		type.set ("assets/images/pentpurple.png", AssetType.IMAGE);
		
		className.set ("assets/images/pentred.png", __ASSET__assets_images_pentred_png);
		type.set ("assets/images/pentred.png", AssetType.IMAGE);
		
		className.set ("assets/images/purpleShelfBottom.png", __ASSET__assets_images_purpleshelfbottom_png);
		type.set ("assets/images/purpleShelfBottom.png", AssetType.IMAGE);
		
		className.set ("assets/images/purpleShelfLeft.png", __ASSET__assets_images_purpleshelfleft_png);
		type.set ("assets/images/purpleShelfLeft.png", AssetType.IMAGE);
		
		className.set ("assets/images/purpleShelfTop.png", __ASSET__assets_images_purpleshelftop_png);
		type.set ("assets/images/purpleShelfTop.png", AssetType.IMAGE);
		
		className.set ("assets/images/redShelfBottom.png", __ASSET__assets_images_redshelfbottom_png);
		type.set ("assets/images/redShelfBottom.png", AssetType.IMAGE);
		
		className.set ("assets/images/redShelfLeft.png", __ASSET__assets_images_redshelfleft_png);
		type.set ("assets/images/redShelfLeft.png", AssetType.IMAGE);
		
		className.set ("assets/images/redShelfTop.png", __ASSET__assets_images_redshelftop_png);
		type.set ("assets/images/redShelfTop.png", AssetType.IMAGE);
		
		className.set ("assets/images/shelf.png", __ASSET__assets_images_shelf_png);
		type.set ("assets/images/shelf.png", AssetType.IMAGE);
		
		className.set ("assets/images/s_bookshelf_64x129.png", __ASSET__assets_images_s_bookshelf_64x129_png);
		type.set ("assets/images/s_bookshelf_64x129.png", AssetType.IMAGE);
		
		className.set ("assets/images/s_book_512x216.png", __ASSET__assets_images_s_book_512x216_png);
		type.set ("assets/images/s_book_512x216.png", AssetType.IMAGE);
		
		className.set ("assets/images/s_boulder_160x128.png", __ASSET__assets_images_s_boulder_160x128_png);
		type.set ("assets/images/s_boulder_160x128.png", AssetType.IMAGE);
		
		className.set ("assets/images/s_cutscene_1.png", __ASSET__assets_images_s_cutscene_1_png);
		type.set ("assets/images/s_cutscene_1.png", AssetType.IMAGE);
		
		className.set ("assets/images/s_cutscene_2.png", __ASSET__assets_images_s_cutscene_2_png);
		type.set ("assets/images/s_cutscene_2.png", AssetType.IMAGE);
		
		className.set ("assets/images/s_heart_32x32.png", __ASSET__assets_images_s_heart_32x32_png);
		type.set ("assets/images/s_heart_32x32.png", AssetType.IMAGE);
		
		className.set ("assets/images/s_heart_64x64.png", __ASSET__assets_images_s_heart_64x64_png);
		type.set ("assets/images/s_heart_64x64.png", AssetType.IMAGE);
		
		className.set ("assets/images/s_monster_128x128.png", __ASSET__assets_images_s_monster_128x128_png);
		type.set ("assets/images/s_monster_128x128.png", AssetType.IMAGE);
		
		className.set ("assets/images/s_player_64x128.png", __ASSET__assets_images_s_player_64x128_png);
		type.set ("assets/images/s_player_64x128.png", AssetType.IMAGE);
		
		className.set ("assets/images/s_title_1600x900.png", __ASSET__assets_images_s_title_1600x900_png);
		type.set ("assets/images/s_title_1600x900.png", AssetType.IMAGE);
		
		className.set ("assets/images/s_wip_cultist.png", __ASSET__assets_images_s_wip_cultist_png);
		type.set ("assets/images/s_wip_cultist.png", AssetType.IMAGE);
		
		className.set ("assets/music/bgm.ogg", __ASSET__assets_music_bgm_ogg);
		type.set ("assets/music/bgm.ogg", AssetType.MUSIC);
		
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/sounds/book_multiple_pages.wav", __ASSET__assets_sounds_book_multiple_pages_wav);
		type.set ("assets/sounds/book_multiple_pages.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/book_single_page.wav", __ASSET__assets_sounds_book_single_page_wav);
		type.set ("assets/sounds/book_single_page.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/book_single_page_2.wav", __ASSET__assets_sounds_book_single_page_2_wav);
		type.set ("assets/sounds/book_single_page_2.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/candle.wav", __ASSET__assets_sounds_candle_wav);
		type.set ("assets/sounds/candle.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/magic.wav", __ASSET__assets_sounds_magic_wav);
		type.set ("assets/sounds/magic.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/monster_attack.wav", __ASSET__assets_sounds_monster_attack_wav);
		type.set ("assets/sounds/monster_attack.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/monster_roar_1.wav", __ASSET__assets_sounds_monster_roar_1_wav);
		type.set ("assets/sounds/monster_roar_1.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/monster_roar_2.wav", __ASSET__assets_sounds_monster_roar_2_wav);
		type.set ("assets/sounds/monster_roar_2.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/monster_roar_3.wav", __ASSET__assets_sounds_monster_roar_3_wav);
		type.set ("assets/sounds/monster_roar_3.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/monster_roar_4.wav", __ASSET__assets_sounds_monster_roar_4_wav);
		type.set ("assets/sounds/monster_roar_4.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/PC_death.wav", __ASSET__assets_sounds_pc_death_wav);
		type.set ("assets/sounds/PC_death.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/quake.wav", __ASSET__assets_sounds_quake_wav);
		type.set ("assets/sounds/quake.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/quake_bookshelf_crack.wav", __ASSET__assets_sounds_quake_bookshelf_crack_wav);
		type.set ("assets/sounds/quake_bookshelf_crack.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		
		className.set ("assets/sounds/step.wav", __ASSET__assets_sounds_step_wav);
		type.set ("assets/sounds/step.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/beep.ogg", __ASSET__assets_sounds_beep_ogg);
		type.set ("assets/sounds/beep.ogg", AssetType.SOUND);
		
		className.set ("assets/sounds/flixel.ogg", __ASSET__assets_sounds_flixel_ogg);
		type.set ("assets/sounds/flixel.ogg", AssetType.SOUND);
		
		className.set ("assets/fonts/nokiafc22.ttf", __ASSET__assets_fonts_nokiafc22_ttf);
		type.set ("assets/fonts/nokiafc22.ttf", AssetType.FONT);
		
		className.set ("assets/fonts/arial.ttf", __ASSET__assets_fonts_arial_ttf);
		type.set ("assets/fonts/arial.ttf", AssetType.FONT);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						onChange.dispatch ();
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), ByteArray));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return cast (Type.createInstance (className.get (id), []), ByteArray);
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return bitmapData.getPixels (bitmapData.rect);
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif html5
		
		var bytes:ByteArray = null;
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var data = loader.data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), ByteArray);
		else return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var bytes:ByteArray = null;
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var data = loader.data;
		
		if (Std.is (data, String)) {
			
			return cast data;
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes.readUTFBytes (bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String):Future<AudioBuffer> {
		
		var promise = new Promise<AudioBuffer> ();
		
		#if (flash)
		
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				promise.complete (audioBuffer);
				
			});
			soundLoader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			soundLoader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getAudioBuffer (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<AudioBuffer> (function () return getAudioBuffer (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadBytes (id:String):Future<ByteArray> {
		
		var promise = new Promise<ByteArray> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				promise.complete (bytes);
				
			});
			loader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.dataFormat = BINARY;
			loader.onComplete.add (function (_):Void {
				
				promise.complete (loader.data);
				
			});
			loader.onProgress.add (function (_, loaded, total) {
				
				if (total == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (loaded / total);
					
				}
				
			});
			loader.onIOError.add (function (_, e) {
				
				promise.error (e);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<ByteArray> (function () return getBytes (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadImage (id:String):Future<Image> {
		
		var promise = new Promise<Image> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				promise.complete (Image.fromBitmapData (bitmapData));
				
			});
			loader.contentLoaderInfo.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.contentLoaderInfo.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var image = new js.html.Image ();
			image.onload = function (_):Void {
				
				promise.complete (Image.fromImageElement (image));
				
			}
			image.onerror = promise.error;
			image.src = path.get (id);
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Image> (function () return getImage (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = ByteArray.readFile ("../Resources/manifest");
			#elseif ios
			var bytes = ByteArray.readFile ("assets/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if ios
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	public override function loadText (id:String):Future<String> {
		
		var promise = new Promise<String> ();
		
		#if html5
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.onComplete.add (function (_):Void {
				
				promise.complete (loader.data);
				
			});
			loader.onProgress.add (function (_, loaded, total) {
				
				if (total == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (loaded / total);
					
				}
				
			});
			loader.onIOError.add (function (_, msg) promise.error (msg));
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getText (id));
			
		}
		
		#else
		
		promise.completeWith (loadBytes (id).then (function (bytes) {
			
			return new Future<String> (function () {
				
				if (bytes == null) {
					
					return null;
					
				} else {
					
					return bytes.readUTFBytes (bytes.length);
					
				}
				
			});
			
		}));
		
		#end
		
		return promise.future;
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_data_data_goes_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_level_csv extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_map_csv extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_mapeditor_csv extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_tile_sheet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_boulder_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_greenshelfbottom_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_greenshelfleft_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_greenshelftop_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_images_go_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_light_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_orangeshelfbottom_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_orangeshelfleft_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_orangeshelftop_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_pentcharged_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_pentgreen_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_pentorange_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_pentpurple_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_pentred_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_purpleshelfbottom_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_purpleshelfleft_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_purpleshelftop_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_redshelfbottom_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_redshelfleft_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_redshelftop_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_shelf_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_s_bookshelf_64x129_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_s_book_512x216_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_s_boulder_160x128_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_s_cutscene_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_s_cutscene_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_s_heart_32x32_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_s_heart_64x64_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_s_monster_128x128_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_s_player_64x128_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_s_title_1600x900_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_s_wip_cultist_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_music_bgm_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_music_music_goes_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_book_multiple_pages_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_book_single_page_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_book_single_page_2_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_candle_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_magic_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_monster_attack_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_monster_roar_1_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_monster_roar_2_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_monster_roar_3_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_monster_roar_4_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_pc_death_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_quake_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_quake_bookshelf_crack_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_step_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_beep_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_flixel_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_beep_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_flixel_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_arial_ttf extends null { }


#elseif html5



























































@:keep #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { super (); name = "Nokia Cellphone FC Small"; } } 
@:keep #if display private #end class __ASSET__assets_fonts_arial_ttf extends lime.text.Font { public function new () { super (); name = "Arial"; } } 


#else



#if (windows || mac || linux || cpp)


@:file("assets/data/data-goes-here.txt") #if display private #end class __ASSET__assets_data_data_goes_here_txt extends lime.utils.ByteArray {}
@:file("assets/data/level.csv") #if display private #end class __ASSET__assets_data_level_csv extends lime.utils.ByteArray {}
@:file("assets/data/map.csv") #if display private #end class __ASSET__assets_data_map_csv extends lime.utils.ByteArray {}
@:file("assets/data/mapeditor.csv") #if display private #end class __ASSET__assets_data_mapeditor_csv extends lime.utils.ByteArray {}
@:image("assets/data/tile_sheet.png") #if display private #end class __ASSET__assets_data_tile_sheet_png extends lime.graphics.Image {}
@:image("assets/images/boulder.png") #if display private #end class __ASSET__assets_images_boulder_png extends lime.graphics.Image {}
@:image("assets/images/greenShelfBottom.png") #if display private #end class __ASSET__assets_images_greenshelfbottom_png extends lime.graphics.Image {}
@:image("assets/images/greenShelfLeft.png") #if display private #end class __ASSET__assets_images_greenshelfleft_png extends lime.graphics.Image {}
@:image("assets/images/greenShelfTop.png") #if display private #end class __ASSET__assets_images_greenshelftop_png extends lime.graphics.Image {}
@:file("assets/images/images-go-here.txt") #if display private #end class __ASSET__assets_images_images_go_here_txt extends lime.utils.ByteArray {}
@:image("assets/images/light.png") #if display private #end class __ASSET__assets_images_light_png extends lime.graphics.Image {}
@:image("assets/images/orangeShelfBottom.png") #if display private #end class __ASSET__assets_images_orangeshelfbottom_png extends lime.graphics.Image {}
@:image("assets/images/orangeShelfLeft.png") #if display private #end class __ASSET__assets_images_orangeshelfleft_png extends lime.graphics.Image {}
@:image("assets/images/orangeShelfTop.png") #if display private #end class __ASSET__assets_images_orangeshelftop_png extends lime.graphics.Image {}
@:image("assets/images/pentCharged.png") #if display private #end class __ASSET__assets_images_pentcharged_png extends lime.graphics.Image {}
@:image("assets/images/pentgreen.png") #if display private #end class __ASSET__assets_images_pentgreen_png extends lime.graphics.Image {}
@:image("assets/images/pentorange.png") #if display private #end class __ASSET__assets_images_pentorange_png extends lime.graphics.Image {}
@:image("assets/images/pentpurple.png") #if display private #end class __ASSET__assets_images_pentpurple_png extends lime.graphics.Image {}
@:image("assets/images/pentred.png") #if display private #end class __ASSET__assets_images_pentred_png extends lime.graphics.Image {}
@:image("assets/images/purpleShelfBottom.png") #if display private #end class __ASSET__assets_images_purpleshelfbottom_png extends lime.graphics.Image {}
@:image("assets/images/purpleShelfLeft.png") #if display private #end class __ASSET__assets_images_purpleshelfleft_png extends lime.graphics.Image {}
@:image("assets/images/purpleShelfTop.png") #if display private #end class __ASSET__assets_images_purpleshelftop_png extends lime.graphics.Image {}
@:image("assets/images/redShelfBottom.png") #if display private #end class __ASSET__assets_images_redshelfbottom_png extends lime.graphics.Image {}
@:image("assets/images/redShelfLeft.png") #if display private #end class __ASSET__assets_images_redshelfleft_png extends lime.graphics.Image {}
@:image("assets/images/redShelfTop.png") #if display private #end class __ASSET__assets_images_redshelftop_png extends lime.graphics.Image {}
@:image("assets/images/shelf.png") #if display private #end class __ASSET__assets_images_shelf_png extends lime.graphics.Image {}
@:image("assets/images/s_bookshelf_64x129.png") #if display private #end class __ASSET__assets_images_s_bookshelf_64x129_png extends lime.graphics.Image {}
@:image("assets/images/s_book_512x216.png") #if display private #end class __ASSET__assets_images_s_book_512x216_png extends lime.graphics.Image {}
@:image("assets/images/s_boulder_160x128.png") #if display private #end class __ASSET__assets_images_s_boulder_160x128_png extends lime.graphics.Image {}
@:image("assets/images/s_cutscene_1.png") #if display private #end class __ASSET__assets_images_s_cutscene_1_png extends lime.graphics.Image {}
@:image("assets/images/s_cutscene_2.png") #if display private #end class __ASSET__assets_images_s_cutscene_2_png extends lime.graphics.Image {}
@:image("assets/images/s_heart_32x32.png") #if display private #end class __ASSET__assets_images_s_heart_32x32_png extends lime.graphics.Image {}
@:image("assets/images/s_heart_64x64.png") #if display private #end class __ASSET__assets_images_s_heart_64x64_png extends lime.graphics.Image {}
@:image("assets/images/s_monster_128x128.png") #if display private #end class __ASSET__assets_images_s_monster_128x128_png extends lime.graphics.Image {}
@:image("assets/images/s_player_64x128.png") #if display private #end class __ASSET__assets_images_s_player_64x128_png extends lime.graphics.Image {}
@:image("assets/images/s_title_1600x900.png") #if display private #end class __ASSET__assets_images_s_title_1600x900_png extends lime.graphics.Image {}
@:image("assets/images/s_wip_cultist.png") #if display private #end class __ASSET__assets_images_s_wip_cultist_png extends lime.graphics.Image {}
@:file("assets/music/bgm.ogg") #if display private #end class __ASSET__assets_music_bgm_ogg extends lime.utils.ByteArray {}
@:file("assets/music/music-goes-here.txt") #if display private #end class __ASSET__assets_music_music_goes_here_txt extends lime.utils.ByteArray {}
@:file("assets/sounds/book_multiple_pages.wav") #if display private #end class __ASSET__assets_sounds_book_multiple_pages_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/book_single_page.wav") #if display private #end class __ASSET__assets_sounds_book_single_page_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/book_single_page_2.wav") #if display private #end class __ASSET__assets_sounds_book_single_page_2_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/candle.wav") #if display private #end class __ASSET__assets_sounds_candle_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/magic.wav") #if display private #end class __ASSET__assets_sounds_magic_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/monster_attack.wav") #if display private #end class __ASSET__assets_sounds_monster_attack_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/monster_roar_1.wav") #if display private #end class __ASSET__assets_sounds_monster_roar_1_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/monster_roar_2.wav") #if display private #end class __ASSET__assets_sounds_monster_roar_2_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/monster_roar_3.wav") #if display private #end class __ASSET__assets_sounds_monster_roar_3_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/monster_roar_4.wav") #if display private #end class __ASSET__assets_sounds_monster_roar_4_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/PC_death.wav") #if display private #end class __ASSET__assets_sounds_pc_death_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/quake.wav") #if display private #end class __ASSET__assets_sounds_quake_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/quake_bookshelf_crack.wav") #if display private #end class __ASSET__assets_sounds_quake_bookshelf_crack_wav extends lime.utils.ByteArray {}
@:file("assets/sounds/sounds-go-here.txt") #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends lime.utils.ByteArray {}
@:file("assets/sounds/step.wav") #if display private #end class __ASSET__assets_sounds_step_wav extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/3,3,11/assets/sounds/beep.mp3") #if display private #end class __ASSET__assets_sounds_beep_mp3 extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/3,3,11/assets/sounds/flixel.mp3") #if display private #end class __ASSET__assets_sounds_flixel_mp3 extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/3,3,11/assets/sounds/beep.ogg") #if display private #end class __ASSET__assets_sounds_beep_ogg extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/3,3,11/assets/sounds/flixel.ogg") #if display private #end class __ASSET__assets_sounds_flixel_ogg extends lime.utils.ByteArray {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/3,3,11/assets/fonts/nokiafc22.ttf") #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends lime.text.Font {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/3,3,11/assets/fonts/arial.ttf") #if display private #end class __ASSET__assets_fonts_arial_ttf extends lime.text.Font {}



#end
#end

#if (openfl && !flash)
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_fonts_nokiafc22_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_arial_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_fonts_arial_ttf (); src = font.src; name = font.name; super (); }}

#end

#end