package;


import lime.app.Config;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {
	
	
	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	
	
	public static function init (config:Config):Void {
		
		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();
		
		var rootPath = null;
		
		if (config != null && Reflect.hasField (config, "rootPath")) {
			
			rootPath = Reflect.field (config, "rootPath");
			
		}
		
		if (rootPath == null) {
			
			#if (ios || tvos || emscripten)
			rootPath = "assets/";
			#elseif (sys && windows && !cs)
			rootPath = FileSystem.absolutePath (haxe.io.Path.directory (#if (haxe_ver >= 3.3) Sys.programPath () #else Sys.executablePath () #end)) + "/";
			#else
			rootPath = "";
			#end
			
		}
		
		Assets.defaultRootPath = rootPath;
		
		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		#end
		
		var data, manifest, library;
		
		Assets.libraryPaths["default"] = rootPath + "manifest/default.json";
		
		
		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_data_chunk1_oel extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_chunk10_oel extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_chunk2_oel extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_chunk3_oel extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_chunk4_oel extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_chunk5_oel extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_chunk6_oel extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_chunk7_oel extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_chunk8_oel extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_chunk9_oel extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_data_goes_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_dialogue_xml extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_femboy_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_map_oep extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_start_oel extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_tile_temple_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_data_tile_temple_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_data_tile_temple_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_data_tile_temple_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_data_tile_temple_4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_aprilfools_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_batsheet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_clamsheet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_echidnasheet_pdn extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_echidnasheet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_echidnasheet_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_edition_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_hotgf_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_images_go_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_kirbygf_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_left_and_right_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_minotaursheet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_mmlogo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_mushsheet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_picoday_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_preloaderart_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_slimesheet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sonky_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_spr_player_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_stevesheet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_trimmedandfixedsprites_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_update_20180603t205106z_001_zip extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_vinesheet_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_music_music_goes_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_music_silverline_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_music_silverline_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_music_silverline_xmp extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_flash_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_roblox_oof_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_smack1_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_smack1_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_smack2_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_smack2_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_smack3_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_smack3_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_voice_moan10_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_voice_moan11_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_voice_moan12_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_voice_moan13_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_voice_moan14_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_voice_moan15_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_voice_moan16_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_voice_moan17_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_voice_moan4_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_voice_moan5_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_voice_moan6_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_voice_moan7_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_voice_moan8_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_voice_moan9_wav extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_chunk2 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_chunk11 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_chunk3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_chunk4 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_chunk5 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_chunk6 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_chunk7 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_chunk8 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_chunk9 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_chunk10 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_data_goes_here_txt1 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_dialogue_xml1 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_femboy_txt1 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_map_oep1 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_start_oel1 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_tile_temple_1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_data_tile_temple_2 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_data_tile_temple_3 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_data_tile_temple_4 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_data_tile_temple_5 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_aprilfools_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_batsheet_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_clamsheet_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_echidnasheet_pdn1 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_echidnasheet_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_echidnasheet_txt1 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_edition_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_hotgf_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_images_go_here_txt1 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_kirbygf_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_left_and_right_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_minotaursheet_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_mmlogo_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_mushsheet_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_picoday_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_preloaderart_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_slimesheet_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_sonky_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_spr_player_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_stevesheet_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_trimmedandfixedsprites_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_update_20180604 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_vinesheet_png1 extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_music_music_goes_here_txt1 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_music_silverline_ogg1 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_music_silverline_xmp1 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_flash_wav1 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_smack2 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_smack3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_smack4 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt1 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_voice_moan11 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_voice_moan12 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_voice_moan13 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_voice_moan14 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_voice_moan15 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_voice_moan16 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_voice_moan17 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_voice_moan18 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_voice_moan5 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_voice_moan6 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_voice_moan7 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_voice_moan8 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_voice_moan9 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_voice_moan10 extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:file("F:/Program Files/haxe/lib/flixel/4,4,1/assets/sounds/beep.ogg") #if display private #end class __ASSET__flixel_sounds_beep_ogg extends haxe.io.Bytes {}
@:keep @:file("F:/Program Files/haxe/lib/flixel/4,4,1/assets/sounds/flixel.ogg") #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends haxe.io.Bytes {}
@:keep @:font("F:/Program Files/haxe/lib/flixel/4,4,1/assets/fonts/nokiafc22.ttf") #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("F:/Program Files/haxe/lib/flixel/4,4,1/assets/fonts/monsterrat.ttf") #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("F:/Program Files/haxe/lib/flixel/4,4,1/assets/images/ui/button.png") #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("F:/Program Files/haxe/lib/flixel/4,4,1/assets/images/logo/default.png") #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}



#else

@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22.ttf"; #else ascender = null; descender = null; height = null; numGlyphs = null; underlinePosition = null; underlineThickness = null; unitsPerEM = null; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat.ttf"; #else ascender = null; descender = null; height = null; numGlyphs = null; underlinePosition = null; underlineThickness = null; unitsPerEM = null; #end name = "Monsterrat"; super (); }}


#end

#if (openfl && !flash)

@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}


#end
#end