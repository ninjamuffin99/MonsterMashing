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
	private var speed:Float = 150;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.spr_player__png, true, 18, 17);
		scale.set(1.2, 1.2);
		
		var frameRate:Int = 6;
		animation.add("l", [0, 1, 2], frameRate);
		animation.add("r", [3, 4, 5], frameRate);
		animation.add("d", [6, 7, 8], frameRate);
		animation.add("u", [9, 10, 11], frameRate);
		
		drag.x = drag.y = 2800;
		
		FlxG.log.add("added player");
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		//rotation();
		controls();
	}
	
	private function rotation():Void
	{
		var rads:Float = Math.atan2(FlxG.mouse.y - this.y, FlxG.mouse.x - this.x);
		FlxG.watch.addQuick("Rads", Math.atan2(FlxG.mouse.y - this.y, FlxG.mouse.x - this.x));
		
		var degs = rads * 180 / Math.PI;
		FlxG.watch.addQuick("Degs/Angle", degs);
		angle = degs + 90;
	}
	
	//Movement controls
	private function controls():Void
	{
		var _up = FlxG.keys.anyPressed([UP, W]);
		var _down = FlxG.keys.anyPressed([DOWN, S]);
		var _left = FlxG.keys.anyPressed([LEFT, A]);
		var _right = FlxG.keys.anyPressed([RIGHT, D]);
		
		if (_up && _down)
			_up = _down = false;
		if (_left && _right)
			_left = _right = false;
		
		if (_up || _down || _left || _right)
		{
			/**
			 * Movement Angle
			 */
			var mA:Float = 0;
			
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
			else if (_left)
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
			
		}
		else if (animation.curAnim != null)
		{
			animation.curAnim.curFrame = 1;
			animation.curAnim.pause();
			//velocity.set(0,0);
		}
	}
}