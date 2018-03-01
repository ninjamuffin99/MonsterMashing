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
	//a public static variable of the outcome, so that it can be accessed in the PlayState
	public static var outcome:Outcome;
	
	private var _enemySprite:FlxSprite;
	private var _enemyHealth:Float = 10;
	private var thisCam:FlxCamera;
	
	private var maxShake:Float = 0.05;
	
	private var _barHealth:FlxBar;
	
	public function new(BGColor:FlxColor=FlxColor.TRANSPARENT) 
	{
		super(BGColor);
		FlxG.camera.flash();
		
		//sets the outcome to NONE just in-case
		outcome = NONE;
		
	}
	
	override public function create():Void 
	{
		//so there's a new camera object that's created(thisCam) with a transparent BG
		thisCam = new FlxCamera(0, 0, FlxG.width, FlxG.height, 1);
		FlxG.cameras.add(thisCam);
		thisCam.bgColor = FlxColor.TRANSPARENT;
		
		//alright so basically the enemy's sprite is rendered offscreen, pretty much to the right, and down a little bit
		//then the _enemySprite is created and loaded(will get different sprites goin in a bit)
		_enemySprite = new FlxSprite(0, 0);
		_enemySprite.loadGraphic(AssetPaths.spr_mush_new__png, false, 800, 1200);
		add(_enemySprite);
		
		//then the health bar is added, which tracks the _enemyHealth variable
		_barHealth = new FlxBar(32, 0-16, FlxBarFillDirection.LEFT_TO_RIGHT, FlxG.width - 64, 16, this, "_enemyHealth", 0, 10);
		add(_barHealth);
		
		//scroll factor set to 0 since it's HUD shits
		_barHealth.scrollFactor.set(0, 0);
		
		//thisCam is then set to center on the middle of _enemySprite
		thisCam.focusOn(_enemySprite.getMidpoint());
		
		//then shit gets tweened
		FlxTween.tween(_barHealth, {y: 16}, 0.7, {ease:FlxEase.cubeInOut});
		FlxTween.tween(_enemySprite, {y: _enemySprite.y + 180}, 0.3, {ease:FlxEase.quadIn});
		
		super.create();
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		//if the enemy's health is less than 0, and the outcome isn't VICTORY, then it finishes shit up
		if (_enemyHealth <= 0 && outcome != VICTORY)
		{
			outcome = VICTORY;
			
			FlxTween.tween(_enemySprite, {y: FlxG.height + 400}, 1.25, {ease:FlxEase.quartInOut});
			//after this health bar tween is done, it calls finishTween(), more info there I guess
			FlxTween.tween(_barHealth, {y:  0 - 16}, 0.65, {ease:FlxEase.quartInOut, onComplete: finishTween});
			
		}
		else if (_enemyHealth > 0)
		{
			//always increases the y for some visual polish i guess hey i think its cool get off my dick bitch
			_enemySprite.y += 0.5;
		}
		
		if (FlxG.keys.justPressed.Z)
		{
			//shakes the camera
			thisCam.shake(FlxG.random.float(0.01, 0.015), FlxG.random.float(0.05, 0.2));
			
			//maxShake += FlxG.random.float(0.005, 0.01);
			
			//reduces the enemy's health
			_enemyHealth -= FlxG.random.float(0.8, 2.3);
		}
		
	}
	
	//flashes the camera, removes the camera from showing, then closes the substate(hopefully with outcome set to VICTORY)
	private function finishTween(tween:FlxTween):Void
	{
		//FlxG.camera.flash();
		FlxG.cameras.remove(thisCam);
		close();
	}
	
}

//IDK this shit, mostly just using NONE and VICTORY
enum Outcome
{
	NONE;
	ESCAPE;
	VICTORY;//COMPLETION
	DEFEAT;//SUBMISSION
}