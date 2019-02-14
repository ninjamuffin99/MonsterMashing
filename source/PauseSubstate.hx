package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import io.newgrounds.objects.Score;

/**
 * ...
 * @author ...
 */
class PauseSubstate extends FlxSubState 
{
	private var mScore:FlxText;
	private var pauseText:FlxText;
	private var _grpMenu:FlxTypedGroup<FlxText>;
	private var menuItems:Array<String> = ["Resume", "Settings", "Exit"];
	private var selected:Int = 0;
	private var selMax = 0;

	public function new(BGColor:FlxColor=FlxColor.TRANSPARENT) 
	{
		super(BGColor);
		
		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		bg.alpha = 0;
		bg.scrollFactor.set();
		add(bg);
		FlxTween.tween(bg, {alpha:0.5}, 0.2, {ease:FlxEase.quadOut});
		
		pauseText = new FlxText(0, 300, 0, "PAUSED", 10);
		pauseText.screenCenter(X);
		pauseText.scrollFactor.set();
		add(pauseText);
		
		initText();
	}
	
	
	private function initText():Void
	{
		_grpMenu = new FlxTypedGroup<FlxText>();
		add(_grpMenu);
		
		selMax = menuItems.length - 1;
		
		for (i in 0...menuItems.length)
		{
			var text:FlxText = new FlxText(0, (i * 35) + 360, 0, menuItems[i], 16);
			//var text:FlxText = new FlxText(0, (i * 54) + 320, 0, menuItems[i], 32);
			text.color = FlxColor.BLACK;
			text.scrollFactor.set();
			text.screenCenter(X);
			_grpMenu.add(text);
			
			text.alpha = 0;
			FlxTween.tween(text, {alpha: 1, y: text.y + 5}, 0.13, {ease: FlxEase.quartOut, startDelay: 0.12 * i});
		}
		
		if (NGio.isLoggedIn && NGio.scoreboardsLoaded)
		{
			for (i in 0...5)
			{
				var score:Score = NGio.scoreboardArray[i];
				var stringThing = (i + 1) + ": " + score.user.name + " - " + score.formatted_value;
				var scoreText:FlxText = new FlxText(0, (i * 15)  + 470, 0, stringThing, 8);
				scoreText.screenCenter(X);
				scoreText.scrollFactor.set();
				add(scoreText);
				
				scoreText.alpha = 0;
				
				FlxTween.tween(scoreText, {alpha: 1, y: scoreText.y + 3}, 0.9, {ease: FlxEase.quartOut, startDelay: (0.12 * menuItems.length) + (0.2 * i)});
			}
		}
		
		if (FlxG.onMobile)
		{
			mScore = new FlxText(0, FlxG.height / 2 + 210, 0, "", 40);
		}
		else
		{
			mScore = new FlxText(0, FlxG.height / 2 + 210, 0, "", 32);	
		}
		
		mScore.text = "High Score: " + HighScore.score + "\nTotal Score: " + HighScore.totalScore;
		mScore.alignment = FlxTextAlign.CENTER;
		mScore.screenCenter(X);
		add(mScore);
		
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
				
				FlxG.sound.play("assets/sounds/menuUp." + MenuState.soundEXT, 0.5 * SettingSubstate.masterVol * SettingSubstate.soundVol);
			}
			if (FlxG.keys.anyJustPressed(["S", "DOWN", "K"]))
			{
				selected += 1;
				FlxG.sound.play("assets/sounds/menuDown." + MenuState.soundEXT, 0.5 * SettingSubstate.masterVol * SettingSubstate.soundVol);
			}
			
			var gamepad = FlxG.gamepads.lastActive;
			if (gamepad != null)
			{
				if (gamepad.anyJustPressed(["DPAD_DOWN", "LEFT_STICK_DIGITAL_DOWN"]))
				{
					selected += 1;
					FlxG.sound.play("assets/sounds/menuDown." + MenuState.soundEXT, 0.5 * SettingSubstate.masterVol * SettingSubstate.soundVol);
				}
				if (gamepad.anyJustPressed(["DPAD_UP", "LEFT_STICK_DIGITAL_UP"]))
				{
					selected -= 1;
					FlxG.sound.play("assets/sounds/menuUp." + MenuState.soundEXT, 0.5 * SettingSubstate.masterVol * SettingSubstate.soundVol);
				}
				
				if (gamepad.anyJustPressed(["A"]))
				{
					menuSelection(selected);
				}
				
				if (gamepad.justPressed.START)
				{
					close();
				}
				
			}
			
		#else
			
			for (i in 0..._grpMenu.members.length)
			{
				for (touch in FlxG.touches.list)
				{
					if (touch.overlaps(_grpMenu.members[i]))
					{
						selected = i;
						menuSelection(i);
					}
				}
			}
		#end
		
		FlxG.watch.addQuick("selected 1: ", selected);
		
		
		if (selected > _grpMenu.members.length - 1)
			selected = 0;
		if (selected < 0)
			selected = _grpMenu.members.length - 1;
		
		FlxG.watch.addQuick("selected 2: ", selected);
		
		if (FlxG.keys.anyJustPressed(["Z", "SPACE"]))
		{
			menuSelection(selected);
		}
	}
	
	private function menuSelection(daSelection:Int):Void
	{
		var sound:FlxSound = new FlxSound();
		sound.persist = true;
		sound.loadEmbedded("assets/sounds/menuConfirm." + MenuState.soundEXT, false, true);
		sound.volume = 1 * SettingSubstate.masterVol * SettingSubstate.soundVol;
		sound.group = FlxG.sound.defaultSoundGroup;
		sound.play();
			
		var theSelection:String = menuItems[daSelection];
		
		switch (theSelection) 
			{
				case "Resume":
					close();
				case "Settings":
					openSubState(new SettingSubstate(0xFF000000));
				case "Exit":
					FlxG.switchState(new MenuState());
				default:
			}
	}
	
	override public function update(elapsed:Float):Void 
	{
		
		if (FlxG.keys.anyJustPressed(["ESCAPE", "ENTER"]))
			close();
		
		super.update(elapsed);
		
		menuHandling();
	}
	
}