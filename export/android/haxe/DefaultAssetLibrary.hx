#if !lime_hybrid


package;


import haxe.Timer;
import haxe.Unserializer;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.MovieClip;
import openfl.events.Event;
import openfl.text.Font;
import openfl.media.Sound;
import openfl.net.URLRequest;
import openfl.utils.ByteArray;
import openfl.Assets;

#if neko
import neko.vm.Deque;
import neko.vm.Thread;
#elseif cpp
import cpp.vm.Deque;
import cpp.vm.Thread;
#end

#if sys
import sys.FileSystem;
#end

#if ios
import openfl._legacy.utils.SystemPath;
#end


@:access(openfl.media.Sound)
class DefaultAssetLibrary extends AssetLibrary {
	
	
	private static var loaded = 0;
	private static var loading = 0;
	private static var workerIncomingQueue = new Deque<Dynamic> ();
	private static var workerResult = new Deque<Dynamic> ();
	private static var workerThread:Thread;
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		Font.registerFont (__ASSET__flixel_fonts_nokiafc22_ttf);
		Font.registerFont (__ASSET__flixel_fonts_monsterrat_ttf);
		
		
		
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		
		className.set ("flixel/sounds/beep.ogg", __ASSET__flixel_sounds_beep_ogg);
		type.set ("flixel/sounds/beep.ogg", AssetType.SOUND);
		
		className.set ("flixel/sounds/flixel.ogg", __ASSET__flixel_sounds_flixel_ogg);
		type.set ("flixel/sounds/flixel.ogg", AssetType.SOUND);
		
		className.set ("flixel/fonts/nokiafc22.ttf", __ASSET__flixel_fonts_nokiafc22_ttf);
		type.set ("flixel/fonts/nokiafc22.ttf", AssetType.FONT);
		
		className.set ("flixel/fonts/monsterrat.ttf", __ASSET__flixel_fonts_monsterrat_ttf);
		type.set ("flixel/fonts/monsterrat.ttf", AssetType.FONT);
		
		className.set ("flixel/images/ui/button.png", __ASSET__flixel_images_ui_button_png);
		type.set ("flixel/images/ui/button.png", AssetType.IMAGE);
		
		className.set ("flixel/images/logo/default.png", __ASSET__flixel_images_logo_default_png);
		type.set ("flixel/images/logo/default.png", AssetType.IMAGE);
		
		
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
						
						if (eventCallback != null) {
							
							eventCallback (this, "change");
							
						}
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		
	}
	
	
	public override function exists (id:String, type:AssetType):Bool {
		
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == type || ((type == SOUND || type == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			if (type == BINARY || type == null || (assetType == BINARY && type == TEXT)) {
				
				return true;
				
			}
			
		}
		
		return false;
		
	}
	
	
	public override function getBitmapData (id:String):BitmapData {
		
		if (className.exists (id)) {
			
			return cast (Type.createInstance (className.get (id), []), BitmapData);
			
		} else {
			
			return BitmapData.load (path.get (id));
			
		}
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		if (className.exists (id)) {
			
			return cast (Type.createInstance (className.get (id), []), ByteArray);
			
		} else {
			
			return ByteArray.readFile (path.get (id));
			
		}
		
	}
	
	
	public override function getFont (id:String):Font {
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			Font.registerFont (fontClass);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return new Font (path.get (id));
			
		}
		
	}
	
	
	public override function getMusic (id:String):Sound {
		
		if (className.exists (id)) {
			
			return cast (Type.createInstance (className.get (id), []), Sound);
			
		} else {
			
			return new Sound (new URLRequest (path.get (id)), null, true);
			
		}
		
	}
	
	
	public override function getPath (id:String):String {
		
		#if ios
		
		return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		#else
		
		return path.get (id);
		
		#end
		
	}
	
	
	public override function getSound (id:String):Sound {
		
		if (className.exists (id)) {
			
			return cast (Type.createInstance (className.get (id), []), Sound);
			
		} else {
			
			return new Sound (new URLRequest (path.get (id)), null, type.get (id) == MUSIC);
			
		}
		
	}
	
	
	public override function getText (id:String):String {
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
	}
	
	
	public override function isLocal (id:String, type:AssetType):Bool {
		
		return true;
		
	}
	
	
	public override function list (type:AssetType):Array<String> {
		
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (type == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadBitmapData (id:String, handler:BitmapData -> Void):Void {
		
		__load (getBitmapData, id, handler);
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		__load (getBytes, id, handler);
		
	}
	
	
	public override function loadFont (id:String, handler:Font -> Void):Void {
		
		__load (getFont, id, handler);
		
	}
	
	
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
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
								
								path.set (asset.id, asset.path);
								type.set (asset.id, Type.createEnum (AssetType, asset.type));
								
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
	
	
	public override function loadMusic (id:String, handler:Sound -> Void):Void {
		
		__load (getMusic, id, handler);
		
	}
	
	
	public override function loadSound (id:String, handler:Sound -> Void):Void {
		
		__load (getSound, id, handler);
		
	}
	
	
	public override function loadText (id:String, handler:String -> Void):Void {
		
		var callback = function (bytes:ByteArray):Void {
			
			if (bytes == null) {
				
				handler (null);
				
			} else {
				
				handler (bytes.readUTFBytes (bytes.length));
				
			}
			
		}
		
		loadBytes (id, callback);
		
	}
	
	
	private static function __doWork ():Void {
		
		while (true) {
			
			var message = workerIncomingQueue.pop (true);
			
			if (message == "WORK") {
				
				var getMethod = workerIncomingQueue.pop (true);
				var id = workerIncomingQueue.pop (true);
				var handler = workerIncomingQueue.pop (true);
				
				var data = getMethod (id);
				workerResult.add ("RESULT");
				workerResult.add (data);
				workerResult.add (handler);
				
			} else if (message == "EXIT") {
				
				break;
				
			}
			
		}
		
	}
	
	
	private inline function __load<T> (getMethod:String->T, id:String, handler:T->Void):Void {
		
		workerIncomingQueue.add ("WORK");
		workerIncomingQueue.add (getMethod);
		workerIncomingQueue.add (id);
		workerIncomingQueue.add (handler);
		
		loading++;
		
	}
	
	
	public static function __poll ():Void {
		
		if (loading > loaded) {
			
			if (workerThread == null) {
				
				workerThread = Thread.create (__doWork);
				
			}
			
			var message = workerResult.pop (false);
			
			while (message == "RESULT") {
				
				loaded++;
				
				var data = workerResult.pop (true);
				var handler = workerResult.pop (true);
				
				if (handler != null) {
					
					handler (data);
					
				}
				
				message = workerResult.pop (false);
				
			}
			
		} else {
			
			if (workerThread != null) {
				
				workerIncomingQueue.add ("EXIT");
				workerThread = null;
				
			}
			
		}
		
	}
	
	
}


#if (windows || mac || linux)


@:sound("C:/HaxeToolkit/haxe/lib/flixel/4,4,1/assets/sounds/beep.ogg") @:keep #if display private #end class __ASSET__flixel_sounds_beep_ogg extends flash.media.Sound {}
@:sound("C:/HaxeToolkit/haxe/lib/flixel/4,4,1/assets/sounds/flixel.ogg") @:keep #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends flash.media.Sound {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/4,4,1/assets/fonts/nokiafc22.ttf") @:keep #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends flash.text.Font {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/4,4,1/assets/fonts/monsterrat.ttf") @:keep #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends flash.text.Font {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel/4,4,1/assets/images/ui/button.png") @:keep #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData {}
@:bitmap("C:/HaxeToolkit/haxe/lib/flixel/4,4,1/assets/images/logo/default.png") @:keep #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData {}





#else


class __ASSET__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { super (); __fontPath = "flixel/fonts/nokiafc22.ttf"; fontName = "Nokia Cellphone FC Small";  }}
class __ASSET__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { super (); __fontPath = "flixel/fonts/monsterrat.ttf"; fontName = "Monsterrat";  }}


#end


#else


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
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		
		
		#end
		
		#if flash
		
		path.set ("assets/data/chunk1.oel", "assets/data/chunk1.oel");
		type.set ("assets/data/chunk1.oel", AssetType.TEXT);
		path.set ("assets/data/chunk10.oel", "assets/data/chunk10.oel");
		type.set ("assets/data/chunk10.oel", AssetType.TEXT);
		path.set ("assets/data/chunk2.oel", "assets/data/chunk2.oel");
		type.set ("assets/data/chunk2.oel", AssetType.TEXT);
		path.set ("assets/data/chunk3.oel", "assets/data/chunk3.oel");
		type.set ("assets/data/chunk3.oel", AssetType.TEXT);
		path.set ("assets/data/chunk4.oel", "assets/data/chunk4.oel");
		type.set ("assets/data/chunk4.oel", AssetType.TEXT);
		path.set ("assets/data/chunk5.oel", "assets/data/chunk5.oel");
		type.set ("assets/data/chunk5.oel", AssetType.TEXT);
		path.set ("assets/data/chunk6.oel", "assets/data/chunk6.oel");
		type.set ("assets/data/chunk6.oel", AssetType.TEXT);
		path.set ("assets/data/chunk7.oel", "assets/data/chunk7.oel");
		type.set ("assets/data/chunk7.oel", AssetType.TEXT);
		path.set ("assets/data/chunk8.oel", "assets/data/chunk8.oel");
		type.set ("assets/data/chunk8.oel", AssetType.TEXT);
		path.set ("assets/data/chunk9.oel", "assets/data/chunk9.oel");
		type.set ("assets/data/chunk9.oel", AssetType.TEXT);
		path.set ("assets/data/data-goes-here.txt", "assets/data/data-goes-here.txt");
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		path.set ("assets/data/dialogue.xml", "assets/data/dialogue.xml");
		type.set ("assets/data/dialogue.xml", AssetType.TEXT);
		path.set ("assets/data/femboy.txt", "assets/data/femboy.txt");
		type.set ("assets/data/femboy.txt", AssetType.TEXT);
		path.set ("assets/data/map.oep", "assets/data/map.oep");
		type.set ("assets/data/map.oep", AssetType.TEXT);
		path.set ("assets/data/start.oel", "assets/data/start.oel");
		type.set ("assets/data/start.oel", AssetType.TEXT);
		path.set ("assets/data/tile_temple_0.png", "assets/data/tile_temple_0.png");
		type.set ("assets/data/tile_temple_0.png", AssetType.IMAGE);
		path.set ("assets/data/tile_temple_1.png", "assets/data/tile_temple_1.png");
		type.set ("assets/data/tile_temple_1.png", AssetType.IMAGE);
		path.set ("assets/data/tile_temple_2.png", "assets/data/tile_temple_2.png");
		type.set ("assets/data/tile_temple_2.png", AssetType.IMAGE);
		path.set ("assets/data/tile_temple_3.png", "assets/data/tile_temple_3.png");
		type.set ("assets/data/tile_temple_3.png", AssetType.IMAGE);
		path.set ("assets/data/tile_temple_4.png", "assets/data/tile_temple_4.png");
		type.set ("assets/data/tile_temple_4.png", AssetType.IMAGE);
		path.set ("assets/images/aprilfools.png", "assets/images/aprilfools.png");
		type.set ("assets/images/aprilfools.png", AssetType.IMAGE);
		path.set ("assets/images/batSheet.png", "assets/images/batSheet.png");
		type.set ("assets/images/batSheet.png", AssetType.IMAGE);
		path.set ("assets/images/clamSheet.png", "assets/images/clamSheet.png");
		type.set ("assets/images/clamSheet.png", AssetType.IMAGE);
		path.set ("assets/images/echidnaSheet.pdn", "assets/images/echidnaSheet.pdn");
		type.set ("assets/images/echidnaSheet.pdn", AssetType.TEXT);
		path.set ("assets/images/echidnaSheet.png", "assets/images/echidnaSheet.png");
		type.set ("assets/images/echidnaSheet.png", AssetType.IMAGE);
		path.set ("assets/images/echidnaSheet.txt", "assets/images/echidnaSheet.txt");
		type.set ("assets/images/echidnaSheet.txt", AssetType.TEXT);
		path.set ("assets/images/edition.png", "assets/images/edition.png");
		type.set ("assets/images/edition.png", AssetType.IMAGE);
		path.set ("assets/images/hotGF.png", "assets/images/hotGF.png");
		type.set ("assets/images/hotGF.png", AssetType.IMAGE);
		path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		path.set ("assets/images/kirbyGF.png", "assets/images/kirbyGF.png");
		type.set ("assets/images/kirbyGF.png", AssetType.IMAGE);
		path.set ("assets/images/left_and_right.png", "assets/images/left_and_right.png");
		type.set ("assets/images/left_and_right.png", AssetType.IMAGE);
		path.set ("assets/images/minotaurSheet.png", "assets/images/minotaurSheet.png");
		type.set ("assets/images/minotaurSheet.png", AssetType.IMAGE);
		path.set ("assets/images/mmLogo.png", "assets/images/mmLogo.png");
		type.set ("assets/images/mmLogo.png", AssetType.IMAGE);
		path.set ("assets/images/mushSheet.png", "assets/images/mushSheet.png");
		type.set ("assets/images/mushSheet.png", AssetType.IMAGE);
		path.set ("assets/images/picoDay.png", "assets/images/picoDay.png");
		type.set ("assets/images/picoDay.png", AssetType.IMAGE);
		path.set ("assets/images/preloaderArt.png", "assets/images/preloaderArt.png");
		type.set ("assets/images/preloaderArt.png", AssetType.IMAGE);
		path.set ("assets/images/slimeSheet.png", "assets/images/slimeSheet.png");
		type.set ("assets/images/slimeSheet.png", AssetType.IMAGE);
		path.set ("assets/images/sonky.png", "assets/images/sonky.png");
		type.set ("assets/images/sonky.png", AssetType.IMAGE);
		path.set ("assets/images/spr_player.png", "assets/images/spr_player.png");
		type.set ("assets/images/spr_player.png", AssetType.IMAGE);
		path.set ("assets/images/steveSheet.png", "assets/images/steveSheet.png");
		type.set ("assets/images/steveSheet.png", AssetType.IMAGE);
		path.set ("assets/images/trimmedAndFixedSprites.png", "assets/images/trimmedAndFixedSprites.png");
		type.set ("assets/images/trimmedAndFixedSprites.png", AssetType.IMAGE);
		path.set ("assets/images/update-20180603T205106Z-001.zip", "assets/images/update-20180603T205106Z-001.zip");
		type.set ("assets/images/update-20180603T205106Z-001.zip", AssetType.BINARY);
		path.set ("assets/images/vineSheet.png", "assets/images/vineSheet.png");
		type.set ("assets/images/vineSheet.png", AssetType.IMAGE);
		path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		path.set ("assets/music/Silverline.mp3", "assets/music/Silverline.mp3");
		type.set ("assets/music/Silverline.mp3", AssetType.MUSIC);
		path.set ("assets/music/Silverline.ogg", "assets/music/Silverline.ogg");
		type.set ("assets/music/Silverline.ogg", AssetType.MUSIC);
		path.set ("assets/music/Silverline.xmp", "assets/music/Silverline.xmp");
		type.set ("assets/music/Silverline.xmp", AssetType.TEXT);
		path.set ("assets/sounds/flash.wav", "assets/sounds/flash.wav");
		type.set ("assets/sounds/flash.wav", AssetType.SOUND);
		path.set ("assets/sounds/roblox_oof.mp3", "assets/sounds/roblox_oof.mp3");
		type.set ("assets/sounds/roblox_oof.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/smack1.mp3", "assets/sounds/smack1.mp3");
		type.set ("assets/sounds/smack1.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/smack1.ogg", "assets/sounds/smack1.ogg");
		type.set ("assets/sounds/smack1.ogg", AssetType.SOUND);
		path.set ("assets/sounds/smack2.mp3", "assets/sounds/smack2.mp3");
		type.set ("assets/sounds/smack2.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/smack2.ogg", "assets/sounds/smack2.ogg");
		type.set ("assets/sounds/smack2.ogg", AssetType.SOUND);
		path.set ("assets/sounds/smack3.mp3", "assets/sounds/smack3.mp3");
		type.set ("assets/sounds/smack3.mp3", AssetType.MUSIC);
		path.set ("assets/sounds/smack3.ogg", "assets/sounds/smack3.ogg");
		type.set ("assets/sounds/smack3.ogg", AssetType.SOUND);
		path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		path.set ("assets/sounds/Voice/Moan10.wav", "assets/sounds/Voice/Moan10.wav");
		type.set ("assets/sounds/Voice/Moan10.wav", AssetType.SOUND);
		path.set ("assets/sounds/Voice/Moan11.wav", "assets/sounds/Voice/Moan11.wav");
		type.set ("assets/sounds/Voice/Moan11.wav", AssetType.SOUND);
		path.set ("assets/sounds/Voice/Moan12.wav", "assets/sounds/Voice/Moan12.wav");
		type.set ("assets/sounds/Voice/Moan12.wav", AssetType.SOUND);
		path.set ("assets/sounds/Voice/Moan13.wav", "assets/sounds/Voice/Moan13.wav");
		type.set ("assets/sounds/Voice/Moan13.wav", AssetType.SOUND);
		path.set ("assets/sounds/Voice/Moan14.wav", "assets/sounds/Voice/Moan14.wav");
		type.set ("assets/sounds/Voice/Moan14.wav", AssetType.SOUND);
		path.set ("assets/sounds/Voice/Moan15.wav", "assets/sounds/Voice/Moan15.wav");
		type.set ("assets/sounds/Voice/Moan15.wav", AssetType.SOUND);
		path.set ("assets/sounds/Voice/Moan16.wav", "assets/sounds/Voice/Moan16.wav");
		type.set ("assets/sounds/Voice/Moan16.wav", AssetType.SOUND);
		path.set ("assets/sounds/Voice/Moan17.wav", "assets/sounds/Voice/Moan17.wav");
		type.set ("assets/sounds/Voice/Moan17.wav", AssetType.SOUND);
		path.set ("assets/sounds/Voice/Moan4.wav", "assets/sounds/Voice/Moan4.wav");
		type.set ("assets/sounds/Voice/Moan4.wav", AssetType.SOUND);
		path.set ("assets/sounds/Voice/Moan5.wav", "assets/sounds/Voice/Moan5.wav");
		type.set ("assets/sounds/Voice/Moan5.wav", AssetType.SOUND);
		path.set ("assets/sounds/Voice/Moan6.wav", "assets/sounds/Voice/Moan6.wav");
		type.set ("assets/sounds/Voice/Moan6.wav", AssetType.SOUND);
		path.set ("assets/sounds/Voice/Moan7.wav", "assets/sounds/Voice/Moan7.wav");
		type.set ("assets/sounds/Voice/Moan7.wav", AssetType.SOUND);
		path.set ("assets/sounds/Voice/Moan8.wav", "assets/sounds/Voice/Moan8.wav");
		type.set ("assets/sounds/Voice/Moan8.wav", AssetType.SOUND);
		path.set ("assets/sounds/Voice/Moan9.wav", "assets/sounds/Voice/Moan9.wav");
		type.set ("assets/sounds/Voice/Moan9.wav", AssetType.SOUND);
		path.set ("assets/data/chunk1.oel", "assets/data/chunk1.oel");
		type.set ("assets/data/chunk1.oel", AssetType.TEXT);
		path.set ("assets/data/chunk10.oel", "assets/data/chunk10.oel");
		type.set ("assets/data/chunk10.oel", AssetType.TEXT);
		path.set ("assets/data/chunk2.oel", "assets/data/chunk2.oel");
		type.set ("assets/data/chunk2.oel", AssetType.TEXT);
		path.set ("assets/data/chunk3.oel", "assets/data/chunk3.oel");
		type.set ("assets/data/chunk3.oel", AssetType.TEXT);
		path.set ("assets/data/chunk4.oel", "assets/data/chunk4.oel");
		type.set ("assets/data/chunk4.oel", AssetType.TEXT);
		path.set ("assets/data/chunk5.oel", "assets/data/chunk5.oel");
		type.set ("assets/data/chunk5.oel", AssetType.TEXT);
		path.set ("assets/data/chunk6.oel", "assets/data/chunk6.oel");
		type.set ("assets/data/chunk6.oel", AssetType.TEXT);
		path.set ("assets/data/chunk7.oel", "assets/data/chunk7.oel");
		type.set ("assets/data/chunk7.oel", AssetType.TEXT);
		path.set ("assets/data/chunk8.oel", "assets/data/chunk8.oel");
		type.set ("assets/data/chunk8.oel", AssetType.TEXT);
		path.set ("assets/data/chunk9.oel", "assets/data/chunk9.oel");
		type.set ("assets/data/chunk9.oel", AssetType.TEXT);
		path.set ("assets/data/data-goes-here.txt", "assets/data/data-goes-here.txt");
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		path.set ("assets/data/dialogue.xml", "assets/data/dialogue.xml");
		type.set ("assets/data/dialogue.xml", AssetType.TEXT);
		path.set ("assets/data/femboy.txt", "assets/data/femboy.txt");
		type.set ("assets/data/femboy.txt", AssetType.TEXT);
		path.set ("assets/data/map.oep", "assets/data/map.oep");
		type.set ("assets/data/map.oep", AssetType.TEXT);
		path.set ("assets/data/start.oel", "assets/data/start.oel");
		type.set ("assets/data/start.oel", AssetType.TEXT);
		path.set ("assets/data/tile_temple_0.png", "assets/data/tile_temple_0.png");
		type.set ("assets/data/tile_temple_0.png", AssetType.IMAGE);
		path.set ("assets/data/tile_temple_1.png", "assets/data/tile_temple_1.png");
		type.set ("assets/data/tile_temple_1.png", AssetType.IMAGE);
		path.set ("assets/data/tile_temple_2.png", "assets/data/tile_temple_2.png");
		type.set ("assets/data/tile_temple_2.png", AssetType.IMAGE);
		path.set ("assets/data/tile_temple_3.png", "assets/data/tile_temple_3.png");
		type.set ("assets/data/tile_temple_3.png", AssetType.IMAGE);
		path.set ("assets/data/tile_temple_4.png", "assets/data/tile_temple_4.png");
		type.set ("assets/data/tile_temple_4.png", AssetType.IMAGE);
		path.set ("assets/images/aprilfools.png", "assets/images/aprilfools.png");
		type.set ("assets/images/aprilfools.png", AssetType.IMAGE);
		path.set ("assets/images/batSheet.png", "assets/images/batSheet.png");
		type.set ("assets/images/batSheet.png", AssetType.IMAGE);
		path.set ("assets/images/clamSheet.png", "assets/images/clamSheet.png");
		type.set ("assets/images/clamSheet.png", AssetType.IMAGE);
		path.set ("assets/images/echidnaSheet.pdn", "assets/images/echidnaSheet.pdn");
		type.set ("assets/images/echidnaSheet.pdn", AssetType.TEXT);
		path.set ("assets/images/echidnaSheet.png", "assets/images/echidnaSheet.png");
		type.set ("assets/images/echidnaSheet.png", AssetType.IMAGE);
		path.set ("assets/images/echidnaSheet.txt", "assets/images/echidnaSheet.txt");
		type.set ("assets/images/echidnaSheet.txt", AssetType.TEXT);
		path.set ("assets/images/edition.png", "assets/images/edition.png");
		type.set ("assets/images/edition.png", AssetType.IMAGE);
		path.set ("assets/images/hotGF.png", "assets/images/hotGF.png");
		type.set ("assets/images/hotGF.png", AssetType.IMAGE);
		path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		path.set ("assets/images/kirbyGF.png", "assets/images/kirbyGF.png");
		type.set ("assets/images/kirbyGF.png", AssetType.IMAGE);
		path.set ("assets/images/left_and_right.png", "assets/images/left_and_right.png");
		type.set ("assets/images/left_and_right.png", AssetType.IMAGE);
		path.set ("assets/images/minotaurSheet.png", "assets/images/minotaurSheet.png");
		type.set ("assets/images/minotaurSheet.png", AssetType.IMAGE);
		path.set ("assets/images/mmLogo.png", "assets/images/mmLogo.png");
		type.set ("assets/images/mmLogo.png", AssetType.IMAGE);
		path.set ("assets/images/mushSheet.png", "assets/images/mushSheet.png");
		type.set ("assets/images/mushSheet.png", AssetType.IMAGE);
		path.set ("assets/images/picoDay.png", "assets/images/picoDay.png");
		type.set ("assets/images/picoDay.png", AssetType.IMAGE);
		path.set ("assets/images/preloaderArt.png", "assets/images/preloaderArt.png");
		type.set ("assets/images/preloaderArt.png", AssetType.IMAGE);
		path.set ("assets/images/slimeSheet.png", "assets/images/slimeSheet.png");
		type.set ("assets/images/slimeSheet.png", AssetType.IMAGE);
		path.set ("assets/images/sonky.png", "assets/images/sonky.png");
		type.set ("assets/images/sonky.png", AssetType.IMAGE);
		path.set ("assets/images/spr_player.png", "assets/images/spr_player.png");
		type.set ("assets/images/spr_player.png", AssetType.IMAGE);
		path.set ("assets/images/steveSheet.png", "assets/images/steveSheet.png");
		type.set ("assets/images/steveSheet.png", AssetType.IMAGE);
		path.set ("assets/images/trimmedAndFixedSprites.png", "assets/images/trimmedAndFixedSprites.png");
		type.set ("assets/images/trimmedAndFixedSprites.png", AssetType.IMAGE);
		path.set ("assets/images/update-20180603T205106Z-001.zip", "assets/images/update-20180603T205106Z-001.zip");
		type.set ("assets/images/update-20180603T205106Z-001.zip", AssetType.BINARY);
		path.set ("assets/images/vineSheet.png", "assets/images/vineSheet.png");
		type.set ("assets/images/vineSheet.png", AssetType.IMAGE);
		path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		path.set ("assets/music/Silverline.ogg", "assets/music/Silverline.ogg");
		type.set ("assets/music/Silverline.ogg", AssetType.MUSIC);
		path.set ("assets/music/Silverline.xmp", "assets/music/Silverline.xmp");
		type.set ("assets/music/Silverline.xmp", AssetType.TEXT);
		path.set ("assets/sounds/flash.wav", "assets/sounds/flash.wav");
		type.set ("assets/sounds/flash.wav", AssetType.SOUND);
		path.set ("assets/sounds/smack1.ogg", "assets/sounds/smack1.ogg");
		type.set ("assets/sounds/smack1.ogg", AssetType.SOUND);
		path.set ("assets/sounds/smack2.ogg", "assets/sounds/smack2.ogg");
		type.set ("assets/sounds/smack2.ogg", AssetType.SOUND);
		path.set ("assets/sounds/smack3.ogg", "assets/sounds/smack3.ogg");
		type.set ("assets/sounds/smack3.ogg", AssetType.SOUND);
		path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		path.set ("assets/sounds/Voice/Moan10.wav", "assets/sounds/Voice/Moan10.wav");
		type.set ("assets/sounds/Voice/Moan10.wav", AssetType.SOUND);
		path.set ("assets/sounds/Voice/Moan11.wav", "assets/sounds/Voice/Moan11.wav");
		type.set ("assets/sounds/Voice/Moan11.wav", AssetType.SOUND);
		path.set ("assets/sounds/Voice/Moan12.wav", "assets/sounds/Voice/Moan12.wav");
		type.set ("assets/sounds/Voice/Moan12.wav", AssetType.SOUND);
		path.set ("assets/sounds/Voice/Moan13.wav", "assets/sounds/Voice/Moan13.wav");
		type.set ("assets/sounds/Voice/Moan13.wav", AssetType.SOUND);
		path.set ("assets/sounds/Voice/Moan14.wav", "assets/sounds/Voice/Moan14.wav");
		type.set ("assets/sounds/Voice/Moan14.wav", AssetType.SOUND);
		path.set ("assets/sounds/Voice/Moan15.wav", "assets/sounds/Voice/Moan15.wav");
		type.set ("assets/sounds/Voice/Moan15.wav", AssetType.SOUND);
		path.set ("assets/sounds/Voice/Moan16.wav", "assets/sounds/Voice/Moan16.wav");
		type.set ("assets/sounds/Voice/Moan16.wav", AssetType.SOUND);
		path.set ("assets/sounds/Voice/Moan17.wav", "assets/sounds/Voice/Moan17.wav");
		type.set ("assets/sounds/Voice/Moan17.wav", AssetType.SOUND);
		path.set ("assets/sounds/Voice/Moan4.wav", "assets/sounds/Voice/Moan4.wav");
		type.set ("assets/sounds/Voice/Moan4.wav", AssetType.SOUND);
		path.set ("assets/sounds/Voice/Moan5.wav", "assets/sounds/Voice/Moan5.wav");
		type.set ("assets/sounds/Voice/Moan5.wav", AssetType.SOUND);
		path.set ("assets/sounds/Voice/Moan6.wav", "assets/sounds/Voice/Moan6.wav");
		type.set ("assets/sounds/Voice/Moan6.wav", AssetType.SOUND);
		path.set ("assets/sounds/Voice/Moan7.wav", "assets/sounds/Voice/Moan7.wav");
		type.set ("assets/sounds/Voice/Moan7.wav", AssetType.SOUND);
		path.set ("assets/sounds/Voice/Moan8.wav", "assets/sounds/Voice/Moan8.wav");
		type.set ("assets/sounds/Voice/Moan8.wav", AssetType.SOUND);
		path.set ("assets/sounds/Voice/Moan9.wav", "assets/sounds/Voice/Moan9.wav");
		type.set ("assets/sounds/Voice/Moan9.wav", AssetType.SOUND);
		className.set ("flixel/sounds/beep.ogg", __ASSET__flixel_sounds_beep_ogg);
		type.set ("flixel/sounds/beep.ogg", AssetType.SOUND);
		className.set ("flixel/sounds/flixel.ogg", __ASSET__flixel_sounds_flixel_ogg);
		type.set ("flixel/sounds/flixel.ogg", AssetType.SOUND);
		className.set ("flixel/fonts/nokiafc22.ttf", __ASSET__flixel_fonts_nokiafc22_ttf);
		type.set ("flixel/fonts/nokiafc22.ttf", AssetType.FONT);
		className.set ("flixel/fonts/monsterrat.ttf", __ASSET__flixel_fonts_monsterrat_ttf);
		type.set ("flixel/fonts/monsterrat.ttf", AssetType.FONT);
		className.set ("flixel/images/ui/button.png", __ASSET__flixel_images_ui_button_png);
		type.set ("flixel/images/ui/button.png", AssetType.IMAGE);
		className.set ("flixel/images/logo/default.png", __ASSET__flixel_images_logo_default_png);
		type.set ("flixel/images/logo/default.png", AssetType.IMAGE);
		
		
		#elseif html5
		
		var id;
		id = "assets/data/chunk1.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/chunk10.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/chunk2.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/chunk3.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/chunk4.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/chunk5.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/chunk6.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/chunk7.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/chunk8.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/chunk9.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/data-goes-here.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/dialogue.xml";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/femboy.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/map.oep";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/start.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/tile_temple_0.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/data/tile_temple_1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/data/tile_temple_2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/data/tile_temple_3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/data/tile_temple_4.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/aprilfools.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/batSheet.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/clamSheet.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/echidnaSheet.pdn";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/echidnaSheet.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/echidnaSheet.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/edition.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/hotGF.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/images-go-here.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/kirbyGF.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/left_and_right.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/minotaurSheet.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/mmLogo.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/mushSheet.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/picoDay.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/preloaderArt.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/slimeSheet.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sonky.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/spr_player.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/steveSheet.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/trimmedAndFixedSprites.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/update-20180603T205106Z-001.zip";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/vineSheet.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/music/music-goes-here.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/music/Silverline.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/music/Silverline.ogg";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/music/Silverline.xmp";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/flash.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/roblox_oof.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/smack1.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/smack1.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/smack2.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/smack2.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/smack3.mp3";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/smack3.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/sounds-go-here.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/Voice/Moan10.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Voice/Moan11.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Voice/Moan12.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Voice/Moan13.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Voice/Moan14.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Voice/Moan15.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Voice/Moan16.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Voice/Moan17.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Voice/Moan4.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Voice/Moan5.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Voice/Moan6.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Voice/Moan7.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Voice/Moan8.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Voice/Moan9.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/data/chunk1.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/chunk10.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/chunk2.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/chunk3.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/chunk4.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/chunk5.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/chunk6.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/chunk7.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/chunk8.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/chunk9.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/data-goes-here.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/dialogue.xml";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/femboy.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/map.oep";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/start.oel";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/data/tile_temple_0.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/data/tile_temple_1.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/data/tile_temple_2.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/data/tile_temple_3.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/data/tile_temple_4.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/aprilfools.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/batSheet.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/clamSheet.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/echidnaSheet.pdn";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/echidnaSheet.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/echidnaSheet.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/edition.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/hotGF.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/images-go-here.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/images/kirbyGF.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/left_and_right.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/minotaurSheet.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/mmLogo.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/mushSheet.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/picoDay.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/preloaderArt.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/slimeSheet.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/sonky.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/spr_player.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/steveSheet.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/trimmedAndFixedSprites.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/images/update-20180603T205106Z-001.zip";
		path.set (id, id);
		type.set (id, AssetType.BINARY);
		id = "assets/images/vineSheet.png";
		path.set (id, id);
		type.set (id, AssetType.IMAGE);
		id = "assets/music/music-goes-here.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/music/Silverline.ogg";
		path.set (id, id);
		type.set (id, AssetType.MUSIC);
		id = "assets/music/Silverline.xmp";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/flash.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/smack1.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/smack2.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/smack3.ogg";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/sounds-go-here.txt";
		path.set (id, id);
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/Voice/Moan10.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Voice/Moan11.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Voice/Moan12.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Voice/Moan13.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Voice/Moan14.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Voice/Moan15.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Voice/Moan16.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Voice/Moan17.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Voice/Moan4.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Voice/Moan5.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Voice/Moan6.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Voice/Moan7.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Voice/Moan8.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/Voice/Moan9.wav";
		path.set (id, id);
		type.set (id, AssetType.SOUND);
		id = "flixel/sounds/beep.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "flixel/sounds/flixel.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "flixel/fonts/nokiafc22.ttf";
		className.set (id, __ASSET__flixel_fonts_nokiafc22_ttf);
		
		type.set (id, AssetType.FONT);
		id = "flixel/fonts/monsterrat.ttf";
		className.set (id, __ASSET__flixel_fonts_monsterrat_ttf);
		
		type.set (id, AssetType.FONT);
		id = "flixel/images/ui/button.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "flixel/images/logo/default.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		
		
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
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		useManifest = true;
		
		className.set ("flixel/sounds/beep.ogg", __ASSET__flixel_sounds_beep_ogg);
		type.set ("flixel/sounds/beep.ogg", AssetType.SOUND);
		
		className.set ("flixel/sounds/flixel.ogg", __ASSET__flixel_sounds_flixel_ogg);
		type.set ("flixel/sounds/flixel.ogg", AssetType.SOUND);
		
		className.set ("flixel/fonts/nokiafc22.ttf", __ASSET__flixel_fonts_nokiafc22_ttf);
		type.set ("flixel/fonts/nokiafc22.ttf", AssetType.FONT);
		
		className.set ("flixel/fonts/monsterrat.ttf", __ASSET__flixel_fonts_monsterrat_ttf);
		type.set ("flixel/fonts/monsterrat.ttf", AssetType.FONT);
		
		className.set ("flixel/images/ui/button.png", __ASSET__flixel_images_ui_button_png);
		type.set ("flixel/images/ui/button.png", AssetType.IMAGE);
		
		className.set ("flixel/images/logo/default.png", __ASSET__flixel_images_logo_default_png);
		type.set ("flixel/images/logo/default.png", AssetType.IMAGE);
		
		
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








































































































































@:keep @:bind #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }


#elseif html5










































































































































@:keep #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { super (); name = "Nokia Cellphone FC Small"; } } 
@:keep #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { super (); name = "Monsterrat"; } } 




#else



#if (windows || mac || linux || cpp)


@:file("C:/HaxeToolkit/haxe/lib/flixel/4,4,1/assets/sounds/beep.ogg") #if display private #end class __ASSET__flixel_sounds_beep_ogg extends lime.utils.ByteArray {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/4,4,1/assets/sounds/flixel.ogg") #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends lime.utils.ByteArray {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/4,4,1/assets/fonts/nokiafc22.ttf") #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/4,4,1/assets/fonts/monsterrat.ttf") #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:image("C:/HaxeToolkit/haxe/lib/flixel/4,4,1/assets/images/ui/button.png") #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:image("C:/HaxeToolkit/haxe/lib/flixel/4,4,1/assets/images/logo/default.png") #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}



#end
#end

#if (openfl && !flash)
@:keep #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__flixel_fonts_nokiafc22_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__flixel_fonts_monsterrat_ttf (); src = font.src; name = font.name; super (); }}

#end

#end


#end