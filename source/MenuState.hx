package;

import lime.app.Application;
import djFlixel.fx.PixelFader;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.input.android.FlxAndroidKey;
import flixel.input.gamepad.FlxGamepad;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.ui.FlxSpriteButton;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import io.newgrounds.NG;
import io.newgrounds.NGLite;

#if steam
	import steamwrap.api.Steam;
#end

#if android
	import Hardware;
#end

#if switch
	import openfl.events.GameInputEvent;
	import openfl.ui.GameInput;
	import openfl.ui.GameInputDevice;
	import openfl.ui.GameInputControl;
#end


class MenuState extends BaseMenuState
{
	private var mScore:FlxText;

	private var debugInfo:FlxText;
	private var currentVersion:String = "v1.2.0";

	private var sprMonster:FlxSprite;
	private var sprMashing:FlxSprite;

	private var _grpMenu:FlxTypedGroup<FlxText>;
	private var _grpMenuBar:FlxTypedGroup<FlxSprite>;

	#if (!nutaku && !switch)
	private var menuItems:Array<String> = ["Play", "Gallery", "Credits", "Hall of Shame", "Settings", "Join Our Discord"];
	#else
	private var menuItems:Array<String> = ["Play", "Gallery", "Credits", "Settings"];
	#end

	private var leadItems:Array<String>;

	private var selected:Int = 0;

	/**
	 * 0 == Main Menu
	 * 1 == Settings
	 * 2 == Gallery
	 */
	private var curMenu:Int = 0;
	private var selector:FlxSprite;
	private var selMax:Int = 0;//gets set later

	private var discordLink:String = "https://discord.gg/t22G6Fr";
	private var nutakuLink:String = "https://nutaku.net/games/download/monster-mashing";

	public static var soundEXT:String = "";
	
	override public function create():Void
	{
		#if (cpp && !switch)
			menuItems.push("Exit");
		#end

		#if (html5 || flash)
			menuItems.push("Buy on Nutaku!");
		#end
		// mapZoom = mapZoom * FlxG.initialZoom;

		// put this into its own class and then reference it consistently
		#if (web)
			soundEXT = "mp3";
		#else
			soundEXT = "ogg";
		#end
		
		FlxG.log.add(soundEXT);

		FlxG.save.bind("File");

		HighScore.load();

		FlxG.timeScale = 1;
		if (FlxG.sound.music == null)
		{
			FlxG.sound.playMusic("assets/sounds/menuAmbience." + soundEXT, 0.3 * SettingSubstate.masterVol * SettingSubstate.musicVol);
		}

		#if !mobile
		FlxG.mouse.visible = false;
		#elseif android
		FlxG.android.preventDefaultKeys = [FlxAndroidKey.BACK];
		#end
		FlxG.camera.fade(FlxColor.BLACK, 0.8, true);

		initTilemap();
		initImages();
		initText();

		FlxTween.tween(mScore, {y: mScore.y + 24}, 0.86, {type:FlxTweenType.PINGPONG, ease:FlxEase.quadInOut});
		//FlxTween.tween(sprMashing, {y: sprMashing.y + 20}, 1.2, {type:FlxTween.PINGPONG, ease:FlxEase.quadInOut});
		FlxTween.tween(sprMonster.scale, {y: sprMonster.scale.y * 1.07, x: sprMonster.scale.x * 1.075}, 1.2 * 0.75, {type:FlxTweenType.PINGPONG, ease:FlxEase.quadInOut});

		#if steam
		initSteamShit();
		#end
		
		//DISABLE IF NOT -DNEWGROUNDS
		/*
		if (FlxG.save.data.sessionId != null && !NGio.isLoggedIn)
		{
			var newgrounds:NGio = new NGio(APIStuff.APIID, APIStuff.EncKey, FlxG.save.data.sessionId);

			var loadingText:FlxText = new FlxText(debugInfo.x, debugInfo.y - (debugInfo.size * 2) - 6, 0, "", debugInfo.size);
			loadingText.text = "Attempting to load Newgrounds data....";

			var scoreLoadingText:FlxText = new FlxText(loadingText.x, loadingText.y + (debugInfo.size) - 4, 0, "", debugInfo.size);

			NGio.ngDataLoaded.add(function()
			{
				loadingText.text = "Newgrounds user data loaded!";
				scoreLoadingText.text = "Loading score data...";
			});

			NGio.ngScoresLoaded.add(function()
			{
				scoreLoadingText.text = "Newgrounds score data loaded!";

				var tmr:FlxTimer = new FlxTimer().start(0.4, function(tmr:FlxTimer)
				{
					scoreLoadingText.visible = false;
					loadingText.visible = false;

					scoreLoadingText.alpha -= 0.25;
					loadingText.alpha -= 0.25;

				}, 4);
			});

			add(loadingText);
			add(scoreLoadingText);

			FlxG.log.add(FlxG.save.data.sessionId);
		}
		else if (FlxG.save.data.sessionId == null)
		{
			var ng:NGio = new NGio(APIStuff.APIID, APIStuff.EncKey);
		}
		*/
		super.create();
	}

	#if steam
	private function initSteamShit():Void
	{
		Steam.init(998770, SteamNotificationPosition.TopLeft);
		Steam.downloadLeaderboardScore("Distance", LeaderboardDownloadType.Global, 1, 20);
		Steam.whenAchievementStored = steamWrap_onAchievementStored;
		Steam.whenLeaderboardScoreDownloaded = steamWrap_onLeaderboardScoreDownloaded;
		Steam.whenLeaderboardScoreUploaded = steamUpload;
		
		Steam.whenTrace = steamTrace;
		
	}

	private static function steamTrace(str:String)
	{
		trace(str);
	}

	private static function steamWrap_onAchievementStored(id:String)
	{
		trace("Achievement stored: " + id);
	}

	private static function steamUpload(score:LeaderboardScore)
	{
		trace("LEADERBOARD SCORE UPLOADED: " + score.toString());
	}

	private static function steamWrap_onLeaderboardScoreDownloaded(score:Array<LeaderboardScore>)
	{
		trace("Leaderboard score downloaded: " + score.toString());
		ScoreState.steamScores = score;
	}
	#end

	private function initImages():Void
	{

		sprMonster = new FlxSprite(0, 30).loadGraphic(AssetPaths.mmLogo__png, false, 492, 166);
		sprMonster.screenCenter(X);
		sprMonster.antialiasing = true;
		add(sprMonster);

	}

	private function initText():Void
	{
		_grpMenuBar = new FlxTypedGroup<FlxSprite>();
		add(_grpMenuBar);

		selector = new FlxSprite(0, 315);
		selector.makeGraphic(FlxG.width, 36, FlxColor.MAGENTA);
		//add(selector);
		//resetBarFill();

		_grpMenu = new FlxTypedGroup<FlxText>();
		add(_grpMenu);

		selMax = menuItems.length - 1;

		for (i in 0...menuItems.length)
		{
			/*
			var whiteBar:FlxSprite = new FlxSprite(0, (i * 54) + 315);
			whiteBar.makeGraphic(FlxG.width, 36);
			_grpMenuBar.add(whiteBar);
			*/

			var text:FlxText = new FlxText(0, (i * 54) + 320, 0, menuItems[i], 32);
			var text:FlxText = new FlxText(0, (i * 54) + 320, 0, menuItems[i], 32);
			text.color = FlxColor.BLACK;
			text.screenCenter(X);
			_grpMenu.add(text);
		}

		if (FlxG.onMobile)
		{
			mScore = new FlxText(0, FlxG.height / 2 + 210, 0, "", 40);
		}
		else
		{
			if (menuItems.length == 7)
			{
				mScore = new FlxText(0, FlxG.height / 2 + 250, 0, "", 32);
			}
			else
				mScore = new FlxText(0, FlxG.height / 2 + 210, 0, "", 32);

		}

		mScore.text = "High Score: " + HighScore.score + "\nTotal Score: " + HighScore.totalScore;
		mScore.alignment = FlxTextAlign.CENTER;
		add(mScore);

		if (HighScore.recentScore > 0)
		{
			mScore.text += "\nRecent Score: " + HighScore.recentScore;
		}
		mScore.screenCenter(X);
		currentVersion = Application.current.meta.get('version');

		//What device are you on?
		debugInfo = new FlxText(8, FlxG.height - 20, 0, currentVersion, 16);
		add(debugInfo);

		#if flash
		debugInfo.text += " Flash";
		#elseif html5
		debugInfo.text += " HTML5 ";
		debugInfo.text += "(" + Std.string(FlxG.html5.platform) + " " +  Std.string(FlxG.html5.browser) + ")";

		if (FlxG.html5.onMobile)
		{
			debugInfo.text += " mobile";
		}
		#elseif android
		debugInfo.text += " Android";
		#elseif windows
		debugInfo.text += " Windows";
		#elseif switch
		debugInfo.text += " Nintendo Switch";
		#end

		#if nutaku
		debugInfo.text += " Nutaku";
		#elseif steam
		debugInfo.text += " Steam";
		#elseif newgrounds
		debugInfo.text += " Newgrounds";
		#end

		debugInfo.text += " Version";
	}

	override public function update(elapsed:Float):Void
	{
		#if steam
		Steam.onEnterFrame();

		if (FlxG.keys.justPressed.P)
		{
			Steam.downloadLeaderboardScore("Distance", AroundUser, 3, 3);
			Steam.whenLeaderboardScoreDownloaded = function(board:Array<LeaderboardScore>)
			{

				for (score in board)
				{
					trace("SCORE: " + score.score);
				}

			};
		}
		#end

		menuHandling();

		#if (!flash && !desktop)
		if (FlxG.onMobile)
		{
			for (touch in FlxG.touches.list)
			{
				if (touch.justPressed)
				{
					for (t in 0..._grpMenu.members.length)
					{
						if (touch.overlaps(_grpMenu.members[t]))
						{
							vibrate();
							menuOpen(menuItems[t]);
						}
					}
				}
			}
		}
		#end
		
		#if switch
		for (touch in FlxG.touches.list)
		{
			if (touch.justPressed)
			{
				for (t in 0..._grpMenu.members.length)
				{
					if (touch.overlaps(_grpMenu.members[t]))
					{
						vibrate();
						menuOpen(menuItems[t]);
					}
				}
			}
		}
		#end
		
		super.update(elapsed);
	}

	private function vibrate():Void
	{
		#if android
		Hardware.vibrate(35);
		#end
	}

	private function menuHandling():Void
	{
		for (i in 0..._grpMenu.members.length)
		{
			_grpMenu.members[i].color = FlxColor.WHITE;
		}

		_grpMenu.members[selected].color = FlxColor.MAGENTA;

		#if !mobile
		if (FlxG.keys.anyJustPressed(["W", "UP", "I"]))
		{
			selected -= 1;
			FlxG.sound.play("assets/sounds/menuUp." + soundEXT, 0.5 * SettingSubstate.masterVol * SettingSubstate.soundVol);
		}
		if (FlxG.keys.anyJustPressed(["S", "DOWN", "K"]))
		{
			selected += 1;
			FlxG.sound.play("assets/sounds/menuDown." + soundEXT, 0.5 * SettingSubstate.masterVol * SettingSubstate.soundVol);
		}
		#end

		//XInput
		var gamepad = FlxG.gamepads.lastActive;
		if (gamepad != null)
		{
			if (gamepad.anyJustPressed(["UP", "DPAD_UP", "DPAD_LEFT", "LEFT_STICK_DIGITAL_UP", "LEFT_STICK_DIGITAL_LEFT"]))
			{
				selected -= 1;
				FlxG.sound.play("assets/sounds/menuUp." + soundEXT, 0.5 * SettingSubstate.masterVol * SettingSubstate.soundVol);
			}

			if (gamepad.anyJustPressed(["DOWN", "DPAD_DOWN", "DPAD_RIGHT", "LEFT_STICK_DIGITAL_DOWN", "LEFT_STICK_DIGITAL_RIGHT"]))
			{
				selected += 1;
				FlxG.sound.play("assets/sounds/menuDown." + soundEXT, 0.5 * SettingSubstate.masterVol * SettingSubstate.soundVol);
			}

			#if !switch
				if (gamepad.anyJustPressed(["A", "START"]))
				{
					menuOpen(menuItems[selected]);
				}
			#end
			
			#if switch
				if (gamepad.anyJustPressed(["B"]))
				{
					menuOpen(menuItems[selected]);
				}
			#end
		}

		FlxG.watch.addQuick("selected 1: ", selected);

		if (selected > _grpMenu.members.length - 1)
			selected = 0;
		if (selected < 0)
			selected = _grpMenu.members.length - 1;

		FlxG.watch.addQuick("selected 2: ", selected);

		/* Change this so it only chekcs if up or down keys get pressed
		if (FlxG.keys.justPressed.ANY)
		{
			resetBarFill();
		}
		*/

		if (FlxG.keys.anyJustPressed(["ENTER", "Z", "SPACE"]))
		{
			menuOpen(menuItems[selected]);
		}
	}

	private function menuOpen(menuSelected:String):Void
	{
		var sound:FlxSound = new FlxSound();
		sound.persist = true;
		sound.loadEmbedded("assets/sounds/menuConfirm." + soundEXT, false, true);
		sound.volume = 1 * SettingSubstate.masterVol * SettingSubstate.soundVol;
		sound.group = FlxG.sound.defaultSoundGroup;
		sound.play();

		switch (menuSelected)
		{
			case "Play":
				FlxG.switchState(new PlayState());
			case "Gallery":
				FlxG.switchState(new GalleryState());
			case "Credits":
				FlxG.switchState(new CredState());
			case "Hall of Shame":
				openSubState(new ScoreState(0xCC000000));
			case "Settings":
				FlxG.switchState(new SettingState());
			case "Join Our Discord":
				FlxG.openURL(discordLink);
			case "Exit":
				#if cpp
				Sys.exit(0);
				#end
			case "Buy on Nutaku!":
				FlxG.openURL(nutakuLink);
			default:
		}

	}

	private function resetBarFill():Void
	{
		selector.y = (selected * 54) + 315;
		selector.x = -selector.width;
		FlxTween.tween(selector, {x: 0}, 0.35, {ease:FlxEase.quartOut});
	}

}