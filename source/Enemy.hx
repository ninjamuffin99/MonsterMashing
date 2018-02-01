package;

import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;

/**
 * ...
 * @author ninjaMuffin
 */
class Enemy extends FlxSprite 
{
	public var speed:Float = 80;
	public var etype(default, null):Int;
	private var _idleTmr:Float;
	private var _moveDir:Float;
	public var seesPlayer:Bool = false;
	public var playerPos(default, null):FlxPoint;

	public function new(?X:Float=0, ?Y:Float=0, EType:Int) 
	{
		super(X, Y);
		
		makeGraphic(40, 40, FlxColor.YELLOW);
		
		drag.x = drag.y = 10;
		_idleTmr = 0;
		playerPos = FlxPoint.get();
		
	}
	
}