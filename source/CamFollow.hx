package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.util.FlxAxes;

/**
 * ...
 * @author ...
 */
class CamFollow extends FlxSprite
{
	var _fxShakeIntensity:Float = 0;
	/**
	 * Internal, duration of the `shake()` effect.
	 */
	var _fxShakeDuration:Float = 0;
	/**
	 * Internal, `shake()` effect complete callback.
	 */
	var _fxShakeComplete:Void->Void;
	/**
	 * Internal, defines on what axes to `shake()`. Default value is `XY` / both.
	 */
	var _fxShakeAxes:FlxAxes = XY;
	
	var deCam:FlxCamera;

	public function new(X:Float=0, Y:Float=0, aCam:FlxCamera) 
	{
		super(X, Y);
		
		deCam = aCam;
	}
	
	override public function update(elapsed:Float):Void 
	{
		updateShake(elapsed);
		super.update(elapsed);
	}
	
	function updateShake(elapsed:Float):Void
	{
		if (_fxShakeDuration > 0)
		{
			_fxShakeDuration -= elapsed;
			if (_fxShakeDuration <= 0)
			{
				if (_fxShakeComplete != null)
				{
					_fxShakeComplete();
				}
			}
			else
			{
				if (_fxShakeAxes != FlxAxes.Y)
				{
					offset.x += FlxG.random.float( -_fxShakeIntensity, _fxShakeIntensity) * deCam.zoom * FlxG.scaleMode.scale.x / FlxG.camera.initialZoom;
				}
				if (_fxShakeAxes != FlxAxes.X)
				{
					offset.y += FlxG.random.float( -_fxShakeIntensity, _fxShakeIntensity) * deCam.zoom * FlxG.scaleMode.scale.y / FlxG.camera.initialZoom;
				}
			}
		}
		else
			offset.set(0, 0);
	}
	
	/**
	 * RIPPED FROM FlxCamera.shake() LOL
	 * @param	Intensity
	 * @param	Duration
	 * @param	OnComplete
	 * @param	Force
	 * @param	Axes
	 */
	public function shake(Intensity:Float = 0.05, Duration:Float = 0.5, ?OnComplete:Void->Void, Force:Bool = true, ?Axes:FlxAxes):Void
	{
		if (Axes == null)
			Axes = XY;
		
		if (!Force && _fxShakeDuration > 0)
			return;
	
		_fxShakeIntensity = Intensity;
		_fxShakeDuration = Duration;
		_fxShakeComplete = OnComplete;
		_fxShakeAxes = Axes;
		
	}
	
}