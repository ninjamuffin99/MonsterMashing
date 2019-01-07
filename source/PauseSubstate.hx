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
				
				FlxG.sound.play("assets/sounds/menuUp." + MenuState.soundEXT, 0.5 * SettingState.masterVol * SettingState.soundVol);
			}
			if (FlxG.keys.anyJustPressed(["S", "DOWN", "K"]))
			{
				selected += 1;
				FlxG.sound.play("assets/sounds/menuDown." + MenuState.soundEXT, 0.5 * SettingState.masterVol * SettingState.soundVol);
			}
		#end
		
		FlxG.watch.addQuick("selected 1: ", selected);
		
		
		if (selected > _grpMenu.members.length - 1)
			selected = 0;
		if (selected < 0)
			selected = _grpMenu.members.length - 1;
		
		FlxG.watch.addQuick("selected 2: ", selected);
		
		if (FlxG.keys.anyJustPressed(["ENTER", "Z", "SPACE"]))
		{
			var sound:FlxSound = new FlxSound();
			sound.persist = true;
			sound.loadEmbedded("assets/sounds/menuConfirm." + MenuState.soundEXT, false, true);
			sound.volume = 1 * SettingState.masterVol * SettingState.soundVol;
			sound.group = FlxG.sound.defaultSoundGroup;
			sound.play();
			
			switch (selected) 
			{
				case 0:
					close();
				case 1:
					// go to settings here
				case 2:
					FlxG.switchState(new MenuState());
				default:
			}
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