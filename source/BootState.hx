package;

import djFlixel.fx.BoxFader;
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
	private var boxFade:BoxFader;
	
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
			
			new FlxTimer().start(1.5, function(tmr:FlxTimer)
			{
				boxFade.fadeColor(0xFF000000, null, function(){
				FlxG.switchState(new MenuState()); 
			});
			});
		});
	
		
		boxFade = new BoxFader();
		//boxFade.setColor(FlxColor.BLACK);
		boxFade.fadeOff();
		add(boxFade);
		
		
		super.create();
	}
}