package;

import djFlixel.fx.BoxFader;
import flixel.FlxG;
import flixel.FlxState;
import flixel.addons.text.FlxTextField;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import io.newgrounds.NG;

/**
 * ...
 * @author ninjaMuffin
 */
class CredState extends FlxState 
{
	private var creds:FlxText;
	private var boxFade:BoxFader;
	
	private var credTimer:Float = 6.5;
	
	private var curCredPlacement:Int = 0;
	
	override public function create():Void 
	{
		
		FlxG.sound.playMusic("assets/music/credits.mp3");
		FlxG.sound.music.fadeIn(2, 0, 1);
		
		
		creds = new FlxText(0, 0, FlxG.width - 24, "", 24);
		add(creds);
		
		for (i in curCredPlacement...7)
		{
			creds.text += credsArray[i] + "\n";
		}
		
		creds.screenCenter();
		
		#if flash
			/*
			if (NG.core.user.supporter)
			{
				credsArray.insert(26, "and thank you for being a Newgrounds Supporter!");
			}
			*/
			/*
			var credMedal = NG.core.medals.get(54286);
				if (!credMedal.unlocked)
					credMedal.sendUnlock();
			
			*/	
		#end
		
		
		boxFade = new BoxFader();
		boxFade.setColor(FlxColor.BLACK);
		boxFade.fadeOff();
		add(boxFade);
		
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
		"",
		"Moans from the Mimi Soundpack 1 by Gia F. Simone: https://giafsimone.itch.io/mimimoansoundpack1",
		"",
		"Misc. sounds found/made/idk by PhantomArcade",
		"",
		"Preloader hunk: Phantom \"lil D thick bitch\" Arcade",
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
		"Newgrounds.hx library made by Geokureli and is available on Github:",
		"https://github.com/Geokureli/Newgrounds.hx",
		"",
		"Community Creds:",
		"Hall of Shame suggested by BurstAppendix",
		"Total Score tracker suggested by Cyberdevil",
		"New Logo created by RGPAnims",
		"",
		"",
		"Press Z to go back"
	];
	
	override public function update(elapsed:Float):Void 
	{
		FlxG.watch.addQuick("timer", credTimer);
		credTimer -= FlxG.elapsed;
		if (credTimer < 0)
		{
			credTimer = 7.5;
			
			
			boxFade.fadeColor(0xFF000000, null, function(){
				FlxG.log.add("done");
				creds.text = "";
				curCredPlacement += 7;
				for (i in curCredPlacement...curCredPlacement + 7)
				{
					
					creds.text += credsArray[i + curCredPlacement] + "\n";
				}
				
				creds.screenCenter();
				boxFade.fadeOff();
			});
			
		}
		
		
		#if !mobile
			if (FlxG.keys.anyJustPressed(["Z", "ENTER", "SPACE"]))
			{
				FlxG.switchState(new MenuState());
			}
		#end
		
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