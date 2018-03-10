package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * The class for the topdown player sprite. Has all the code and shit
 * @author ninjaMuffin
 */
class Player extends FlxSprite
{
	private var speed:Float = 180;
	
	public var _up:Bool = false;
	public var _down:Bool = false;
	public var _left:Bool = false;
	public var _right:Bool = false;
	
	public var _upP:Bool = false;
	public var _downP:Bool = false;
	public var _leftP:Bool = false;
	public var _rightP:Bool = false;
	
	private var boostTimer:Float = 0.25;
	private var boostLorR:String;
	
	
	public var _upR:Bool = false;
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset)
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.spr_player__png, true, 16, 16);

		var frameRate:Int = 6;
		animation.add("u", [0, 1, 2], frameRate);
		drag.x = drag.y = 200;
		
		width = 8;
		offset.x = 4;
		height = 8;
		offset.y = 6;

		FlxG.log.add("added player");
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		controls();
	}
	
	//Movement controls
	private function controls():Void
	{
		_up = FlxG.keys.anyPressed([UP, W]);
		_down = FlxG.keys.anyPressed([DOWN, S]);
		_left = FlxG.keys.anyPressed([LEFT, A]);
		_right = FlxG.keys.anyPressed([RIGHT, D]);
		
		_upP = FlxG.keys.anyJustPressed([UP, W]);
		_downP = FlxG.keys.anyJustPressed([DOWN, S]);
		_leftP = FlxG.keys.anyJustPressed(["LEFT", "A"]);
		_rightP = FlxG.keys.anyJustPressed(["RIGHT", "D"]);
		
		_upR = FlxG.keys.anyJustReleased([UP, W]);
		
		if (_up && _down)
			_up = _down = false;
		if (_left && _right)
			_left = _right = false;
		
		
		#if html5
			mobileChecks();
		#end
		
		if (/*_up || _down || */_left || _right)
		{
			/**
			 * Movement Angle
			 */
			var mA:Float = 0;
			/*
			if (_up)
			{
				mA = -90;
				if (_left)
					mA -= 45;
				else if (_right)
					mA += 45;
				facing = FlxObject.UP;
			}
			else if (_down)
			{
				mA = 90;
				if (_left)
					mA += 45;
				else if (_right)
					mA -= 45;
				facing = FlxObject.DOWN;
			}
			*/
			if (_left)
			{
				facing = FlxObject.LEFT;
				mA = 180;
			}
			else if (_right)
			{
				facing = FlxObject.RIGHT;
				mA = 0;
			}
			
			
			
			velocity.set(speed, 0);
			velocity.rotate(FlxPoint.weak(0, 0), mA);
			
			
			/*
			if ((velocity.x != 0 || velocity.y != 0) && touching == FlxObject.NONE)
			{
				switch(facing)
				{
					case FlxObject.LEFT:
						animation.play("l");
					case FlxObject.RIGHT:
						animation.play("r");
					case FlxObject.DOWN:
						animation.play("d");
					case FlxObject.UP:
						animation.play("u");
				}
			}
			*/
		}
		else if (animation.curAnim != null)
		{
			/*
			animation.curAnim.curFrame = 1;
			animation.curAnim.pause();
			*/
			velocity.set(0,0);
		}
		
		animation.play("u");
		
		
		boostTimer -= FlxG.elapsed;
		if (_leftP || _rightP)
		{
			
			if (boostTimer <= 0)
			{
				boostTimer = 0.25;
				FlxG.log.add("left pressed boost up");
				
				if (_leftP)
					boostLorR = "left";
				else
					boostLorR = "right";
				
			}
			else
			{
				var dash:Float = 1000;
				if (_leftP && boostLorR == "left")
				{
					velocity.x -= dash;
				}
				else if (_rightP && boostLorR == "right")
				{
					velocity.x += dash;
				}
				
				boostTimer = 0;
				
				FlxG.log.add("left pressed speed up");
				
			}
		}		
	}
	
	private function mobileChecks():Void
	{
		#if html5
		if (FlxG.html5.onMobile)
		{
			for (touch in FlxG.touches.list)
			{
				if (touch.pressed) 
				{
					if (touch.x >= x)
					{
						_right = true;
					}
					else
					{
						_left  = true;
					}
				}
				else
				{
					_right = false;
					_left = false;
				}
			}
		}
		#end
		
	}
	
}
