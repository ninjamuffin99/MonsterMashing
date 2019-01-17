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
	
	private var credTimer:Float = 5;
	
	private var curCredPlacement:Int = 0;
	
	override public function create():Void 
	{
		
		FlxG.sound.playMusic("assets/music/credits." + MenuState.soundEXT);
		FlxG.sound.music.fadeIn(4, 0, 1);
		
		
		creds = new FlxText(0, 0, FlxG.width - 24, "", 24);
		creds.alignment = FlxTextAlign.CENTER;
		add(creds);
		
		for (i in 0...credsArray[curCredPlacement].length)
		{
			creds.text += credsArray[curCredPlacement][i] + "\n";
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
	
	private var credsArray:Array<Dynamic> = 
	[
		[
			"Monster Mashing",
			"",
			"Created and Designed by:",
			"BrandyBuizel (@BrandyBuizel)",
			"Digimin (@deegeemin)",
			"ninja_muffin99 (@ninja_muffin99)",
			"",
			"Made with HaxeFlixel",
		],
		[
			"Programming:",
			"ninja_muffin99",
			"BrandyBuizel",
			"",
			"Art:",
			"Digimin",
			"BrandyBuizel",
			"FuShark",
		],
		[
			"Main Music: Silverline by tripledigit on Newgrounds",
			"",
			"Credits Music by ninja_muffin99",
		],	
		[
			"Moans:",
			"Jack McMillian",
			"Cymbourine",
			"pecheng",
			"the Mimi Soundpack 1 by Gia F. Simone: https://giafsimone.itch.io/mimimoansoundpack1",
			"",
			"Misc. sounds found/made/idk by PhantomArcade",
			"",
			"Preloader hunk: Phantom \"lil D thick bitch\" Arcade",
		],
		[
			"Github Sourcecode: https://github.com/ninjamuffin99/MonsterMashing",
			"",
			"For Strawberry Jam 2 on Itch.io: https://itch.io/jam/strawberry-jam-2",
		],
		[
			"Additional code:",
			"",
			"Newgrounds.hx library made by Geokureli",
			"@Geokureli", //im pretty sure thats his twitter handle
			"https://github.com/Geokureli/Newgrounds.hx",
			"",
			"djFlixel effects (just this credits fade stuff lol) made by John Dimitriadis",
			"@jondmt",
			"https://github.com/johndimi/djFlixel/"
		],
		[
			"If you are reading this Tom Fulp i lov u",
			"In loving memory of EiGiBeast",
		],
		[
			"SPECIAL THANKS",
			"Tom Fulp",
			"",
			"",
			"",
			"",
			"",
			"Wanda",
			"",
			"No one else lol",
			"",
			"only him",
		],
		[
			"god",
			"",
			"TMoneyBloodCrip",
			"aka",
			"Trevord70",
			"aka",
			"Soulja Boy",
			"aka",
			"a",
		],
		[
			"Community Creds:",
			"Hall of Shame suggested by BurstAppendix",
			"Total Score tracker suggested by Cyberdevil",
			"New Logo created by RGPAnims",
			"",
			"",
			"Press Z to go back"
		]
	];
	
	override public function update(elapsed:Float):Void 
	{
		credTimer -= FlxG.elapsed;
		
		
		if (credTimer < 0)
		{
			credTimer = 6;
			
			boxFade.fadeColor(0xFF000000, null, function(){
				creds.text = "";
				curCredPlacement += 1;
				
				if (curCredPlacement >= credsArray.length)
					curCredPlacement = 0;
				
				for (i in 0...credsArray[curCredPlacement].length)
				{
					creds.text += credsArray[curCredPlacement][i] + "\n";
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
		
		#if (html5 || mobile)
			if (FlxG.onMobile)
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
		
		#if android
			if (FlxG.android.justPressed.BACK)
			{
				FlxG.switchState(new MenuState());
			}
		#end
	}
	
}