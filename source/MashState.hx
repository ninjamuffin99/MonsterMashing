package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.ui.FlxBar;
import flixel.util.FlxColor;

/**
 * ...
 * @author ninjaMuffin
 */
class MashState extends FlxSubState 
{
	
	public static var outcome:Outcome;
	
	private var _enemySprite:FlxSprite;
	private var _enemyHealth:Float = 10;
	private var thisCam:FlxCamera;
	
	private var maxShake:Float = 0.05;
	
	private var _barTimer:FlxBar;
	
	public function new(BGColor:FlxColor=FlxColor.TRANSPARENT) 
	{
		super(BGColor);
		FlxG.camera.flash();
		
		outcome = NONE;
		
	}
	
	override public function create():Void 
	{
		thisCam = new FlxCamera(0, 0, FlxG.width, FlxG.height, 1);
		FlxG.cameras.add(thisCam);
		thisCam.bgColor = FlxColor.TRANSPARENT;
		
		_enemySprite = new FlxSprite(0, 0);
		_enemySprite.loadGraphic(AssetPaths.spr_mush_new__png, false, 800, 1200);
		add(_enemySprite);
		
		_barTimer = new FlxBar(32, 0-16, FlxBarFillDirection.LEFT_TO_RIGHT, FlxG.width - 64, 16, this, "_enemyHealth", 0, 10);
		add(_barTimer);
		
		_barTimer.scrollFactor.set(0, 0);
		
		thisCam.focusOn(_enemySprite.getMidpoint());
		
		FlxTween.tween(_barTimer, {y: 16}, 0.7, {ease:FlxEase.cubeInOut});
		FlxTween.tween(_enemySprite, {y: _enemySprite.y + 180}, 0.3, {ease:FlxEase.quadIn});
		
		
		super.create();
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		if (_enemyHealth <= 0 && outcome != VICTORY)
		{
			outcome = VICTORY;
			
			FlxTween.tween(_enemySprite, {y: FlxG.height + 400}, 1.25, {ease:FlxEase.quartInOut});
			FlxTween.tween(_barTimer, {y:  0 - 16}, 0.65, {ease:FlxEase.quartInOut, onComplete: finishTween});
			
		}
		else if (_enemyHealth > 0)
		{
			_enemySprite.y += 0.5;
		}
		
		if (FlxG.keys.justPressed.SPACE)
		{
			thisCam.shake(FlxG.random.float(0.01, maxShake), FlxG.random.float(0.05, 0.2));
			maxShake += FlxG.random.float(0.01, 0.02);
			
			_enemyHealth -= FlxG.random.float(0.8, 2.3);
		}
		
	}
	
	private function finishTween(tween:FlxTween):Void
	{
		FlxG.camera.flash();
		close();
	}
	
}

enum Outcome
{
	NONE;
	ESCAPE;
	VICTORY;//COMPLETION
	DEFEAT;//SUBMISSION
}