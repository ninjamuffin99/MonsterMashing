package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
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
		
		_enemySprite = new FlxSprite(0,0);
		_enemySprite.loadGraphic(AssetPaths.spr_mush_new__png, false, 800, 1200);
		add(_enemySprite);
		
		thisCam.focusOn(_enemySprite.getMidpoint());
		
		
		
		super.create();
	}
	
	
	
}

enum Outcome
{
	NONE;
	ESCAPE;
	VICTORY;//COMPLETION
	DEFEAT;//SUBMISSION
}