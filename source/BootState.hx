package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

/**
 * ...
 * @author 
 */
class BootState extends FlxState 
{
	private var soundExt:String = "";
	override public function create():Void 
	{
		#if web
			soundExt = ".mp3";
		#else
			soundExt = ".ogg";
		#end
		
		var names:FlxText = new FlxText(0, 200, 0, "A GAME BY", 28);
		names.alignment = CENTER;
		names.screenCenter(X);
		add(names);
			
		
		new FlxTimer().start(0.5, function(t:FlxTimer)
		{
			names.text += "\n\n\nBrandyBuizel\n\nninja_muffin99\n\nDigimin";
			names.screenCenter(X);
			
			FlxG.sound.play("assets/sounds/boot" + soundExt, 1, false, null, true, function()
			{
				FlxG.camera.fade(FlxColor.BLACK, 1, false, function()
				{
					FlxG.switchState(new MenuState()); 
					
				}); 
				
			});
		});
		super.create();
	}
}