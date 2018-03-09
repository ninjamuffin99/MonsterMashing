package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.addons.text.FlxTextField;
import flixel.text.FlxText;
import com.newgrounds.*;
import com.newgrounds.components.*;
import io.newgrounds.NG;

/**
 * ...
 * @author ninjaMuffin
 */
class CredState extends FlxState 
{
	private var creds:FlxText;
	
	override public function create():Void 
	{
		#if flash
			if (API.isNewgrounds)
			{
				API.unlockMedal("The Degenerates Responsible");
			}
		#end
		
		
		
		creds = new FlxText(24, 24, FlxG.width - 24, "", 16);
		add(creds);
		
		/*
		if (NG.core.user.supporter)
		{
			credsArray.insert(21, "and thank you for being a Newgrounds Supporter!");
		}
		*/
		
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
		"BrandyBuizel (same guy)",
		"",
		"Music: Silverline by tripledigit on Newgrounds",
		"Moans from the Mimi Soundpack 1 by Gia F. Simone: https://giafsimone.itch.io/mimimoansoundpack1",
		"Misc. sounds found/made/idk by PhantomArcade",
		"",
		"Made with HaxeFlixel, in like a idk a week or two shit man",
		"",
		"Github Source: https://github.com/ninjamuffin99/MonsterMashing",
		"",
		"For Strawberry Jam 2 on Itch.io: https://itch.io/jam/strawberry-jam-2",
		"",
		"If you are reading this Tom Fulp i lov u",
		"In loving memory of EiGiBeast",
		"",
		"Communit creds",
		"Hall of Shame suggested by BurstAppendix",
		"",
		"Press Z to go back"
	];
	
	override public function update(elapsed:Float):Void 
	{
		if (FlxG.keys.justPressed.Z)
		{
			FlxG.switchState(new MenuState());
		}
		
		#if html5
			mobileShit();
		#end
		super.update(elapsed);
	}
	
	private function mobileShit():Void
	{
		for (touch in FlxG.touches.list)
		{
			if (touch.justPressed) 
			{
				FlxG.switchState(new MenuState());
			}
		}
	}
	
}