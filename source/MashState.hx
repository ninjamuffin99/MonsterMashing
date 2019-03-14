package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.addons.display.FlxSliceSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.ui.FlxBar;
import flixel.util.FlxColor;

#if android
import Hardware;
#end

/**
 * ...
 * @author ninjaMuffin
 */
class MashState extends FlxSubState 
{
	//a public static variable of the outcome, so that it can be accessed in the PlayState
	public static var outcome:Outcome = NONE;
	private var enemyType:Int = 0;
	private var _mashSprite:FlxSprite;
	private var _enemySprite:CamFollow;
	private var _enemyHealth:Float = 10;
	private var thisCam:FlxCamera;
	private var camFollow:CamFollow;
	private var mashX:Bool = false;
	private var maxShake:Float = 0.05;
	private var mashTimer:Float = 2.5;
	private var txtTimer:FlxText;
	private var _barHealth:FlxBar;
	private var finishing:Bool = false;
	private var touchPos:FlxPoint = new FlxPoint();
	private var isNude:Int = 0;
	private var moanDir:String = "";
	private var mashHoldTimer:Float = 0.3;
	
	public function new(BGColor:FlxColor=FlxColor.TRANSPARENT, EType:Int, NUDE:Bool = false) 
	{
		super(BGColor);
		
		FlxG.camera.flash();
		
		enemyType = EType;
		
		if (NUDE)
			isNude = 1;
		
		#if !nutaku
			isNude = 0;
		#end
		
		//sets the outcome to NONE just in-case
		outcome = NONE;
	}
	
	override public function create():Void 
	{
		//so there's a new camera object that's created(thisCam) with a transparent BG
		thisCam = new FlxCamera(0, 0, FlxG.width, FlxG.height, 1 * FlxG.initialZoom);
		FlxG.cameras.add(thisCam);
		thisCam.bgColor = FlxColor.TRANSPARENT;
		
		//alright so basically the enemy's sprite is rendered offscreen, pretty much to the right, and down a little bit
		//then the _enemySprite is created and loaded(will get different sprites goin in a bit)
		_enemySprite = new CamFollow(48, 0, thisCam);
		
		
		var shiny:String = "";
		
		if (FlxG.random.bool(1))
		{
			HighScore.shiniesSeen[enemyType] = true;
			shiny = "Shiny";
			FlxG.sound.play("assets/sounds/shinySeen." + MenuState.soundEXT, 0.4 * SettingSubstate.masterVol * SettingSubstate.soundVol);
		}
		else
		{
			FlxG.sound.play("assets/sounds/seeGirl." + MenuState.soundEXT, 0.1 * SettingSubstate.masterVol * SettingSubstate.soundVol);
		}
		
		switch (enemyType) 
		{
			case 0:
				_enemySprite.loadGraphic("assets/images/mushSheet" + shiny + ".png", true, 800, 1200);
				moanDir = "Mush";
			case 1:
				_enemySprite.loadGraphic("assets/images/vineSheet" + shiny + ".png", true, 800, 1200);
				moanDir = "Vine";
			case 2: 
				_enemySprite.loadGraphic("assets/images/batSheet" + shiny + ".png", true, 800, 1200);
				moanDir = "Bat";
			case 3:
				_enemySprite.loadGraphic("assets/images/slimeSheet" + shiny + ".png", true, 800, 1200);
				moanDir = "Mush";
			case 4:
				_enemySprite.loadGraphic("assets/images/minotaurSheet" + shiny + ".png", true, 800, 1200);
				moanDir = "Mino";
			case 5:
				_enemySprite.loadGraphic("assets/images/echidnaSheet" + shiny + ".png", true, 800, 1200);
				moanDir = "Echid";
			case 6:
				_enemySprite.loadGraphic("assets/images/clamSheet" + shiny + ".png", true, 800, 1200);
				moanDir = "Mush";
			default:
				_enemySprite.loadGraphic("assets/images/mushSheet" + shiny + ".png", true, 800, 1200);
				moanDir = "Mush";
		}
		
		
		_enemySprite.animation.add("normal", [0]);
		_enemySprite.animation.add("hit", [1, 1, 1, 0], 12, false);
		_enemySprite.animation.add("stripped", [2 + isNude]);
		_enemySprite.animation.play("normal");
		add(_enemySprite);
		
		//then the health bar is added, which tracks the _enemyHealth variable
		_barHealth = new FlxBar(32, 0-16, FlxBarFillDirection.LEFT_TO_RIGHT, FlxG.width - 64, 16, this, "_enemyHealth", 0, 10);
		//add(_barHealth);
		
		//scroll factor set to 0 since it's HUD shits
		_barHealth.scrollFactor.set(0, 0);
		
		//thisCam is then set to center on the middle of _enemySprite
		thisCam.focusOn(_enemySprite.getMidpoint());
		
		
		_mashSprite = new FlxSprite(0, 800);
		if (FlxG.onMobile)
		{
			_mashSprite.loadGraphic("assets/images/taptap" + FlxG.random.int(1, 3) + ".png", true, Std.int(640 / 2), 160);
		}
		else
		{
			_mashSprite.loadGraphic(AssetPaths.left_and_right__png, true, 64, 32);
			_mashSprite.setGraphicSize(Std.int(_mashSprite.width * 3), Std.int(_mashSprite.height * 3));
		}
		_mashSprite.animation.add("mashin", [0, 1], 6);
		_mashSprite.animation.play("mashin");
		_mashSprite.updateHitbox();
		_mashSprite.x = 350;
		add(_mashSprite);
		
		txtTimer = new FlxText(32, -34, 0, "", 32);
		txtTimer.scrollFactor.set();
		//add(txtTimer);
		
		//then shit gets tweened
		FlxTween.tween(_barHealth, {y: 16}, 0.7, {ease:FlxEase.cubeInOut});
		FlxTween.tween(_enemySprite, {y: _enemySprite.y + 210}, 0.7, {ease:FlxEase.quadIn});
		FlxTween.tween(txtTimer, {y: txtTimer.y + 165}, 0.7, {ease:FlxEase.quadIn});
		
		//FlxTween.tween(_mashSprite, {y: 800}, 0.7, {ease:FlxEase.quadIn});
		super.create();
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		/*
		if (FlxG.keys.anyJustPressed(["ENTER", "ESCAPE"]))
			openSubState(new PauseSubstate());
		*/
			
		//if the enemy's health is less than 0, and the outcome isn't VICTORY, then it finishes shit up
		if (_enemyHealth <= 0 && outcome != VICTORY)
		{
			outcome = VICTORY;
			endTweens();
		}
		else if (_enemyHealth <= 4 && mashTimer < 0 && outcome != VICTORY)
		{
			outcome = DEFEAT;
			endTweens();
		}
		else if (_enemyHealth > 0 && mashTimer < 0 && outcome != VICTORY)
		{
			outcome = ESCAPE;
			endTweens();
		}
		else
		{
			_enemySprite.y += 0.4;
			txtTimer.y += 0.39;
			mashTimer -= FlxG.elapsed;
			txtTimer.text = Std.string(FlxMath.roundDecimal(mashTimer, 2));
			
			if (mashTimer < 0)
			{
				txtTimer.text = "0.00";
			}
		}
		
		if (_enemyHealth <= 0)
		{
			_enemySprite.animation.play("stripped");
		}
		
		#if !mobile
			var mashShit = FlxG.keys.anyJustPressed(["J", "L", "LEFT", "RIGHT", "A", "D"]);
			
			
			var gamepad = FlxG.gamepads.lastActive;
			if (gamepad != null)
			{
				if (gamepad.anyJustPressed(["LEFT", "RIGHT", "DPAD_LEFT", "DPAD_RIGHT", "LEFT_STICK_DIGITAL_LEFT", "LEFT_STICK_DIGITAL_RIGHT", "A", "X", "Y", "RIGHT_TRIGGER", "LEFT_TRIGGER", "RIGHT_SHOULDER", "LEFT_SHOULDER"]))
				{
					mashShit = true;
				}
				
				if (gamepad.anyJustPressed(["DOWN", "DPAD_DOWN", "B", "LEFT_STICK_DIGITAL_DOWN"]))
				{
					mashTimer = 0;
				}
			}
		
			
			if (mashShit && _enemyHealth > 0)
			{
				if (mashX)
				{
					if (FlxG.keys.anyJustPressed(["L", "RIGHT", "D"]))
					{
						mash();
					}
				}
				else
				{
					if (FlxG.keys.anyJustPressed(["J", "LEFT", "A"]))
					{
						mash();
					}
				}
				
				if (gamepad != null)
				{
					if (gamepad.anyJustPressed(["LEFT", "RIGHT", "DPAD_LEFT", "DPAD_RIGHT", "LEFT_STICK_DIGITAL_LEFT", "LEFT_STICK_DIGITAL_RIGHT",  "A", "X", "Y", "RIGHT_TRIGGER", "LEFT_TRIGGER", "RIGHT_SHOULDER", "LEFT_SHOULDER"]))
					{
						mash();
					}
				}
		
				
			}
			
			if (SettingSubstate.mashHold && _enemyHealth > 0)
			{
				if (FlxG.keys.anyPressed([J, LEFT, A, L, RIGHT, D, SPACE]))
				{
					mashHoldTimer -= FlxG.elapsed;
					if (mashHoldTimer <= 0)
					{
						mash();
						mashHoldTimer = FlxG.random.float(0.05, 0.3);
					}
				}
			}
			
			if (FlxG.keys.anyJustPressed(["S", "K", "DOWN"]))
			{
				mashTimer = 0;
			}
		#end
		
		#if (html5 || mobile || switch)
			if (FlxG.onMobile)
			{
				for (touch in FlxG.touches.list)
				{
					if (_enemyHealth > 0 && touch.justPressed) 
					{
						mash();
					}
					
					if (SettingSubstate.mashHold && _enemyHealth > 0)
					{
						if (touch.pressed)
						{
							mashTimer -= FlxG.elapsed;
							
							if (mashTimer <= 0)
							{
								mash();
								mashHoldTimer = FlxG.random.float(0.05, 0.3);
							}
							
						}
					}
					
					
					if (touch.justPressed)
					{
						touchPos = touch.getPosition();
					}
					
					var touchLength = FlxMath.vectorLength(touch.x - touchPos.x, touch.y - touchPos.y);
					
					if (FlxG.touches.list.length > 1)
					{
						touchLength = 0;
					}
					
					if (touchLength >= FlxG.width * 0.35 / FlxG.initialZoom)
					{
						mashTimer = 0;
					}
				}
				
				
			}
		#end
	}
	
	private function mash():Void
	{
		#if android
			Hardware.vibrate(FlxG.random.int(50, 90));
		#end
		
		if (FlxG.random.bool(35))
		{
			FlxG.sound.play("assets/sounds/Voice/" + moanDir + "/" + moanDir + "Moan" + FlxG.random.int(4, 17) + "." + MenuState.soundEXT, 1 * SettingSubstate.moanVol * SettingSubstate.masterVol);

			//FlxG.sound.play("assets/sounds/roblox oof.mp3", 1  * SettingSubstate.moanVol * SettingSubstate.masterVol);
		}
		
		FlxG.sound.play("assets/sounds/smack" + FlxG.random.int(1, 3) + "." + MenuState.soundEXT, 0.3 * SettingSubstate.soundVol * SettingSubstate.masterVol);

		//shakes the camera
		
		// thisCam.shake(FlxG.random.float(0.05, 0.025), FlxG.random.float(0.05, 0.2));
		_enemySprite.shake(FlxG.random.float(0.2 * 30, 0.5 * 30), FlxG.random.float(0.05, 0.1));
		_enemySprite.animation.play("hit");
		
		//maxShake += FlxG.random.float(0.005, 0.01);
		
		//reduces the enemy's health
		_enemyHealth -= FlxG.random.float(0.8, 2.3);
		
		mashX = !mashX;
	}
	
	private function endTweens():Void
	{
		if (!finishing)
		{
			#if android
				if (outcome == DEFEAT)
				{
					Hardware.vibrate(700);
				}
				
			#end
			
			
			finishing = true;
			FlxTween.tween(_enemySprite, {y: FlxG.height + 400}, 1.25, {ease:FlxEase.quartInOut});
			FlxTween.tween(txtTimer, {y: FlxG.height + 400}, 1.4, {ease:FlxEase.quartInOut});
			FlxTween.tween(_mashSprite, {y: FlxG.height + 400}, 0.75, {ease:FlxEase.quartInOut});
			//after this health bar tween is done, it calls finishTween(), more info there I guess
			FlxTween.tween(_barHealth, {y:  0 - 16}, 0.65, {ease:FlxEase.quartInOut, onComplete: finishTween});
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
