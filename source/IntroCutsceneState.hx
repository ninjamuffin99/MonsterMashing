package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.addons.text.FlxTypeText;
import flixel.text.FlxText.FlxTextAlign;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

/**
 * ...
 * @author NInjaMuffin99
 */
class IntroCutsceneState extends FlxState 
{
	
	private var introText:FlxTypeText;
	private var curLore:Int = 0;
	
	private var waitTime = 2.5;

	override public function create():Void 
	{
		introText = new FlxTypeText(0, 0, Std.int(FlxG.width * 0.9), lore[curLore], 24);
		introText.alignment = FlxTextAlign.CENTER;
		
		introText.screenCenter();
		
		introText.start(0.06, false, false, null, newText);
		
		add(introText);
		
		
		var ext:String;
		#if flash
			ext = ".mp3";
		#else
			ext = ".ogg";
		#end
		
		FlxG.sound.playMusic("assets/music/aHeroEmerges" + ext, 0, false);
		FlxG.sound.music.fadeIn(7);
		
		super.create();
	}
	
	private function newText():Void
	{
		new FlxTimer().start(waitTime, function(t:FlxTimer){
				curLore += 1;
				introText.resetText(lore[curLore]);
				introText.start(0.06, false, false, null, newText);
			});
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		if (FlxG.keys.justPressed.ANY)
		{
			FlxG.sound.music.fadeOut();
			toMenu();
		}
		
		FlxG.sound.music.onComplete = function(){
			toMenu(); 
			FlxG.sound.music.stop();
		};
	}
	
	private var swapping:Bool = false;
	
	private function toMenu():Void
	{
		if (swapping)
			return;
		
		swapping = true;
		
		
		FlxG.camera.fade(FlxColor.BLACK, 1, false, function()
		{
			FlxG.sound.music.stop();
			FlxG.sound.music = null;
			FlxG.switchState(new MenuState());
		});
	}
	
	private var lore:Array<String> = 
	[
		"All the lore goes here. Legend has it that this cave is haunted or someshit. Who fukken knows really though",
		"More lore goes here! Hey this is some cool shit, i dont know what other lore to put here, but this is nifty",
		"EVEN MORE LORE! This shit is outta control i cant believe it! SO MUCH LOOOORE",
		"WAY MORE LORORORORRO"
	];
}