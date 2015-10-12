#if !macro


@:access(lime.app.Application)
@:access(lime.Assets)
@:access(openfl.display.Stage)


class ApplicationMain {
	
	
	public static var config:lime.app.Config;
	public static var preloader:openfl.display.Preloader;
	
	
	public static function create ():Void {
		
		var app = new openfl.display.Application ();
		app.create (config);
		
		var display = new flixel.system.FlxPreloader ();
		
		preloader = new openfl.display.Preloader (display);
		app.setPreloader (preloader);
		preloader.onComplete.add (init);
		preloader.create (config);
		
		#if (js && html5)
		var urls = [];
		var types = [];
		
		
		urls.push ("assets/data/data-goes-here.txt");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/level.csv");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/map.csv");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/mapeditor.csv");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/data/tile_sheet.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/brownShelfBottom.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/brownShelfLeft.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/brownShelfTop.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/images-go-here.txt");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/images/light.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/orangeShelfBottom.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/orangeShelfLeft.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/orangeShelfTop.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/purpleShelfBottom.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/purpleShelfLeft.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/purpleShelfTop.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/redShelfBottom.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/redShelfLeft.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/redShelfTop.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/shelf.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/s_bookshelf_64x129.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/s_heart_32x32.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/s_heart_64x64.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/s_pent_charged_128x128.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/s_pent_orange_128x128.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/s_pent_purple_128x128.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/s_pent_red_128x128.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/images/s_player_64x128.png");
		types.push (lime.Assets.AssetType.IMAGE);
		
		
		urls.push ("assets/music/music-goes-here.txt");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/sounds/book_multiple_pages.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/book_single_page.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/book_single_page_2.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/candle.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/magic.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/monster_attack.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/monster_roar_1.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/monster_roar_2.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/monster_roar_3.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/monster_roar_4.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/PC_death.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/quake.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/quake_bookshelf_crack.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/sounds-go-here.txt");
		types.push (lime.Assets.AssetType.TEXT);
		
		
		urls.push ("assets/sounds/step.wav");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/beep.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/flixel.mp3");
		types.push (lime.Assets.AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/beep.ogg");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("assets/sounds/flixel.ogg");
		types.push (lime.Assets.AssetType.SOUND);
		
		
		urls.push ("Nokia Cellphone FC Small");
		types.push (lime.Assets.AssetType.FONT);
		
		
		urls.push ("Arial");
		types.push (lime.Assets.AssetType.FONT);
		
		
		
		if (config.assetsPrefix != null) {
			
			for (i in 0...urls.length) {
				
				if (types[i] != lime.Assets.AssetType.FONT) {
					
					urls[i] = config.assetsPrefix + urls[i];
					
				}
				
			}
			
		}
		
		preloader.load (urls, types);
		#end
		
		var result = app.exec ();
		
		#if (sys && !nodejs && !emscripten)
		Sys.exit (result);
		#end
		
	}
	
	
	public static function init ():Void {
		
		var loaded = 0;
		var total = 0;
		var library_onLoad = function (__) {
			
			loaded++;
			
			if (loaded == total) {
				
				start ();
				
			}
			
		}
		
		preloader = null;
		
		
		
		if (total == 0) {
			
			start ();
			
		}
		
	}
	
	
	public static function main () {
		
		config = {
			
			build: "1",
			company: "HaxeFlixel",
			file: "Haxegame",
			fps: 60,
			name: "Haxegame",
			orientation: "portrait",
			packageName: "com.example.myapp",
			version: "0.0.1",
			windows: [
				
				{
					antialiasing: 0,
					background: 0,
					borderless: false,
					depthBuffer: false,
					display: 0,
					fullscreen: false,
					hardware: true,
					height: 768,
					parameters: "{}",
					resizable: true,
					stencilBuffer: true,
					title: "Haxegame",
					vsync: true,
					width: 1280,
					x: null,
					y: null
				},
			]
			
		};
		
		#if hxtelemetry
		var telemetry = new hxtelemetry.HxTelemetry.Config ();
		telemetry.allocations = true;
		telemetry.host = "localhost";
		telemetry.app_name = config.name;
		Reflect.setField (config, "telemetry", telemetry);
		#end
		
		#if (js && html5)
		#if (munit || utest)
		openfl.Lib.embed (null, 1280, 768, "000000");
		#end
		#else
		create ();
		#end
		
	}
	
	
	public static function start ():Void {
		
		var hasMain = false;
		var entryPoint = Type.resolveClass ("Main");
		
		for (methodName in Type.getClassFields (entryPoint)) {
			
			if (methodName == "main") {
				
				hasMain = true;
				break;
				
			}
			
		}
		
		lime.Assets.initialize ();
		
		if (hasMain) {
			
			Reflect.callMethod (entryPoint, Reflect.field (entryPoint, "main"), []);
			
		} else {
			
			var instance:DocumentClass = Type.createInstance (DocumentClass, []);
			
			/*if (Std.is (instance, openfl.display.DisplayObject)) {
				
				openfl.Lib.current.addChild (cast instance);
				
			}*/
			
		}
		
		#if !flash
		if (openfl.Lib.current.stage.window.fullscreen) {
			
			openfl.Lib.current.stage.dispatchEvent (new openfl.events.FullScreenEvent (openfl.events.FullScreenEvent.FULL_SCREEN, false, false, true, true));
			
		}
		
		openfl.Lib.current.stage.dispatchEvent (new openfl.events.Event (openfl.events.Event.RESIZE, false, false));
		#end
		
	}
	
	
	#if neko
	@:noCompletion @:dox(hide) public static function __init__ () {
		
		var loader = new neko.vm.Loader (untyped $loader);
		loader.addPath (haxe.io.Path.directory (Sys.executablePath ()));
		loader.addPath ("./");
		loader.addPath ("@executable_path/");
		
	}
	#end
	
	
}


@:build(DocumentClass.build())
@:keep class DocumentClass extends Main {}


#else


import haxe.macro.Context;
import haxe.macro.Expr;


class DocumentClass {
	
	
	macro public static function build ():Array<Field> {
		
		var classType = Context.getLocalClass ().get ();
		var searchTypes = classType;
		
		while (searchTypes.superClass != null) {
			
			if (searchTypes.pack.length == 2 && searchTypes.pack[1] == "display" && searchTypes.name == "DisplayObject") {
				
				var fields = Context.getBuildFields ();
				
				var method = macro {
					
					openfl.Lib.current.addChild (this);
					super ();
					dispatchEvent (new openfl.events.Event (openfl.events.Event.ADDED_TO_STAGE, false, false));
					
				}
				
				fields.push ({ name: "new", access: [ APublic ], kind: FFun({ args: [], expr: method, params: [], ret: macro :Void }), pos: Context.currentPos () });
				
				return fields;
				
			}
			
			searchTypes = searchTypes.superClass.t.get ();
			
		}
		
		return null;
		
	}
	
	
}


#end
