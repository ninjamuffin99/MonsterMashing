package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.addons.text.FlxTextField;
import flixel.text.FlxText;

/**
 * ...
 * @author ninjaMuffin
 */
class CredState extends FlxState 
{
	private var creds:FlxText;
	
	
	
	override public function create():Void 
	{
		
		creds = new FlxText(24, 24, FlxG.width - 24, "", 16);
		add(creds);
		
		for (i in 0...credsArray.length)
		{
			creds.text += credsArray[i] + "\n";
		}
		
		super.create();
	}
	
	private var credsArray:Array<String> = 
	[
		"Programming:",
		"ninja_muffin99 (@ninja_muffin99)",
		"BrandyBuizel (@BrandyBuizel)",
		"",
		"Art:",
		"Digimin (@deegeemin)",
		"BrandyBuizel",
		"",
		"Music: Silverline by tripledigit on Newgrounds",
		"",
		"Made with HaxeFlixel, in like a idk a week or two shit man",
		"Github Source: https://github.com/ninjamuffin99/MonsterMashing",
		"For Strawberry Jam 2 on Itch.io: https://itch.io/jam/strawberry-jam-2",
		"",
		"In loving memory of EiGiBeast",
		"",
		"Press ENTER to go back"
	];
	
	override public function update(elapsed:Float):Void 
	{
		if (FlxG.keys.justPressed.ENTER)
		{
			FlxG.switchState(new MenuState());
		}
		
		super.update(elapsed);
	}
	
}