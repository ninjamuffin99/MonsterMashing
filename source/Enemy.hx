package;

import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;

/**
 * Code for a simple little enemy sprite
 * @author ninjaMuffin
 */
class Enemy extends FlxSprite 
{
	public var speed:Float = 80;
	public var etype:Int;
	private var _idleTmr:Float;
	private var _moveDir:Float;
	public var seesPlayer:Bool = false;
	public var playerPos(default, null):FlxPoint;

	public function new(?X:Float=0, ?Y:Float=0, EType:Int) 
	{
		super(X, Y);
		loadGraphic(AssetPaths.trimmedAndFixedSprites__png, true, 16, 16);
		
		switch (EType) 
		{
			case 0:
				animation.add("walk", [0, 1, 2], 6);
			case 1:
				animation.add("walk", [3, 4, 5], 6);
			case 2:
				animation.add("walk", [6, 7, 8], 6);
			default:
				
		}
		
		etype = EType;
		
		animation.play("walk");
		
		//loadGraphic(AssetPaths.spr_mush__png, true, 53, 66);
		
		drag.x = drag.y = 10;
		_idleTmr = 0;
		playerPos = FlxPoint.get();
		
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}