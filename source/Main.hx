package;

import flixel.FlxGame;
import openfl.Lib;
//import js.SWFObject;
import openfl.display.Sprite;
import openfl.Assets;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(0, 0, MenuState));
		
		/*	
		#if flash
			if (API.isNewgrounds)
			{
				var popup:MedalPopup = new MedalPopup();
				addChild(popup);
				popup.x = 130;
				popup.y = 32;
			}
		#end
		*/
	}
}