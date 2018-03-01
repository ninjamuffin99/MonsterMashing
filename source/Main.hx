package;

import flixel.FlxGame;
//import js.SWFObject;
import openfl.display.Sprite;
import openfl.Assets;
import com.newgrounds.*;
import com.newgrounds.components.*;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(0, 0, MenuState));
		
		#if flash
			if (API.isNewgrounds)
			{
				var popup:MedalPopup = new MedalPopup();
				addChild(popup);
				
			}
		#end
		
		//var clip = new SWFObject.embedSWF(AssetPaths.mush__swf, mush, 920, 690, 9);
		//addChild(clip);
	}
}