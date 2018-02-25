package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;

/**
 * ...
 * @author ninjaMuffin
 */
class MashState extends FlxSubState 
{
	
	public static var outcome:Outcome;
	
	private var _enemySprite:FlxSprite;
	private var thisCam:FlxCamera;
	
	private var maxShake:Float = 0.05;
	
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
		
		thisCam.focusOn(_enemySprite.getMidpoint());
		
		FlxTween.tween(_enemySprite, {y: _enemySprite.y + 180}, 1.3, {ease:FlxEase.elasticOut});
		
		
		super.create();
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		if (FlxG.keys.justPressed.SPACE)
		{
			thisCam.shake(FlxG.random.float(0.01, maxShake), FlxG.random.float(0.05, 0.2));
			maxShake += FlxG.random.float(0.01, 0.02);
			
		}
		
	}
	
	
	
}

enum Outcome
{
	NONE;
	ESCAPE;
	VICTORY;//COMPLETION
	DEFEAT;//SUBMISSION
}